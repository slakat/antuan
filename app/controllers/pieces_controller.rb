class PiecesController < ApplicationController
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
      Piece.import(params[:file])

      redirect_to root_url, notice: 'Prendas importadas'
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
      params.require(:worker).permit(:rut,:position,:local,:w_qf_apron, :m_qf_apron, :w_vmf_apron, :m_vmf_apron, :w_dermo_apron, :w_shirt, :m_shirt, :m_blue_trouser, :w_blue_trouser, :m_black_trouser, :w_black_trouser, :w_purple_trouser, :w_white_trouser, :m_blue_polar, :w_blue_polar, :w_purple_polar, :m_black_polar, :w_black_polar, :cargo_trouser, :red_t_shirt, :black_t_shirt, :yellow_t_shirt, :gray_t_shirt, :blue_tie, :red_tie, :observation)
    end
end
