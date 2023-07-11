class SubscriptionsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    before_action :authenticate_user!
    before_action :set_subscription, only: [:destroy]

    def create
        subscription = current_user.subscriptions.create!(subscprition_params)
        render json: { status: 'ok', subscription_id: subscription.id, project_id: subscription.project_id }
    end

    def destroy
        @subscription.destroy
        render json: { status: 'ok' }
    end

    private

    def set_subscription
        @subscription = current_user.subscriptions.find(params[:id])        
    end

    def subscprition_params
        params.require(:subscription).permit(:project_id)
    end

end