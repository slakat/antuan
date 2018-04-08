class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy, :survey]
  before_action :authenticate_user!, except: [:validate,:survey,:update, :show]

  # GET /workers
  # GET /workers.json
  def index
    @workers = Worker.all
  end

  # GET /workers/1
  # GET /workers/1.json
  def show
  end

  # GET /workers/new
  def new
    @worker = Worker.new
  end

  # GET /workers/1/edit
  def edit
  end

  def export
    @workers = Worker.all
    respond_to do |format|
      format.html
      format.csv { send_data @workers.to_csv(encoding: 'ISO-8859-1')}
      #format.xls
    end
  end


  # POST /workers/validate
  def validate
    @worker= nil
    code = Worker.validate(worker_params['rut'])
    if code === false
      redirect_to root_path, alert: 'El rut ingresado no es válido.'
    else
      @worker =  Worker.find_by(rut: code[:rut])
      if @worker.nil?
        redirect_to root_path, alert: 'El rut ingresado no corresponde a ninguno de los usuarios registrados.'
      end
      @role_id = @worker.get_role.id
      @positions= @worker.positions
    end
  end


  # POST /workers/1/survey
  def survey
    @worker.assign_attributes(w_qf_apron: nil, m_qf_apron: nil, w_vmf_apron: nil, m_vmf_apron: nil, w_shirt: nil, m_shirt: nil, m_blue_trouser: nil, w_blue_trouser: nil, m_black_trouser: nil, w_black_trouser: nil, nativa_trouser: nil, beauty_trouser: nil, m_blue_polar: nil, w_blue_polar: nil, nativa_polar: nil, m_black_polar: nil, w_black_polar: nil, m_red_t_shirt: nil, w_red_t_shirt: nil, beauty_jacket: nil, beauty_polar: nil, yellow_t_shirt: nil, blue_tie: nil, red_tie: nil, m_cargo_trouser: nil, m_gray_t_shirt: nil, w_cargo_trouser: nil, w_gray_t_shirt: nil, m_black_t_shirt: nil, w_black_t_shirt: nil)

    @worker.local = worker_params[:local]
    @position = Role.find(worker_params[:position].to_i)
    #@worker.position = Worker.key_positions[@position][1]

    all_pieces = @position.codes.map(&:piece)
    pieces_u= all_pieces.map(&:nickname).uniq
    @pieces= Piece.where(nickname: pieces_u)
    @worker.position = @position.title


    unless @worker.save
      redirect_to validate_workers_path(@worker)
    end

    @is_woman = @worker.is_woman?

    @polar_polera = [["Talla XS"],
                     ["Talla S"],
                     ["Talla M"],
                     ["Talla L"],
                     ["Talla XL"],
                     ["Talla XXL"],
                     ["Talla XXXL"]]

    @t38_60= [["Talla 38"],
              ["Talla 40"],
              ["Talla 42"],
              ["Talla 44"],
              ["Talla 46"],
              ["Talla 48"],
              ["Talla 50"],
              ["Talla 52"],
              ["Talla 54"],
              ["Talla 56"],
              ["Talla 58"],
              ["Talla 60"]]

    @blusa = [["Talla S"],
              ["Talla M"],
              ["Talla L"],
              ["Talla XL"],
              ["Talla XXL"],
              ["Talla XXXL"]]

    @camisa = [["Talla 14"],
                ["Talla 14,5"],
                ["Talla 15"],
                ["Talla 15,5"],
                ["Talla 16"],
                ["Talla 16,5"],
                ["Talla 17"],
                ["Talla 17,5"],
                ["Talla 18"],
                ["Talla 18,5"],
                ["Talla 19"]]



  end


  # POST /workers
  # POST /workers.json
  def create
    @worker = Worker.new(worker_params)

    respond_to do |format|
      if @worker.save
        format.html { redirect_to @worker, notice: 'Worker was successfully created.' }
        format.json { render :show, status: :created, location: @worker }
      else
        format.html { render :new }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workers/1
  # PATCH/PUT /workers/1.json
  def update
    respond_to do |format|
      @worker.answered = true
      if @worker.update(worker_params)
        format.html { redirect_to @worker, notice: 'La encuesta fue recibida con éxito' }
        format.json { render :show, status: :ok, location: @worker }
      else
        format.html { redirect_to root_path, alert: 'Hubo un problema y no pudimos guardar sus respuestas.' }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workers/1
  # DELETE /workers/1.json
  def destroy
    @worker.destroy
    respond_to do |format|
      format.html { redirect_to workers_url, notice: 'Worker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import

    if params[:file]
      Worker.import(params[:file])

      redirect_to root_url, notice: 'Trabajadores importados.'
    else
      redirect_to root_url, alert: 'No se pudo importar'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker
      @worker = Worker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worker_params
      params.require(:worker).permit(:rut,:position,:local,:w_qf_apron, :m_qf_apron, :w_vmf_apron, :m_vmf_apron, :w_shirt, :m_shirt, :m_blue_trouser, :w_blue_trouser, :m_black_trouser, :w_black_trouser, :nativa_trouser, :beauty_trouser, :m_blue_polar, :w_blue_polar, :nativa_polar, :m_black_polar, :w_black_polar, :m_red_t_shirt, :w_red_t_shirt, :beauty_jacket, :beauty_polar, :yellow_t_shirt, :blue_tie, :red_tie, :m_cargo_trouser, :m_gray_t_shirt, :w_cargo_trouser, :w_gray_t_shirt, :m_black_t_shirt, :w_black_t_shirt, :observation)
    end
end
