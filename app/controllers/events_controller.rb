class EventsController < ApplicationController
  include EventsHelper
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :subscribe]
  before_action :is_admin?, only: [:edit, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]


  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @end_date = @event.start_date + (@event.duration * 60)
  end

def subscribe
  @event = Event.find(params[:id])
  if @event.users .include? current_user 
    flash[:error] = 'You already subscribed to this event'
    redirect_to @event
    return
  end

  @amount = (@event.price)*100

  if !@event.is_free?
  customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
  })

  charge = Stripe::Charge.create({
    customer: customer.id,
    amount: @amount,
    description: 'Rails Stripe customer',
    currency: 'eur',
  })
  stripe_customer_id = charge.customer
  @event.users << current_user
  flash[:success] = 'Subscribtion successfull'
    redirect_to @event
else
  stripe_customer_id = ""
end

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to @event

end


  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    
    def set_event
      @event = Event.find(params[:id])
    end

      def is_admin?
        @event = Event.find(params[:id])
        redirect_to root_path unless current_user == @event.user
    end
  

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
    end
end
