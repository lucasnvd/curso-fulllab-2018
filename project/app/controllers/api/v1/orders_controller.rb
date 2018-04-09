
module Api
  module V1
    class OrdersController < ApiControllerBase
      before_action :load_order, only: [:destroy, :update, :show]

      def index
        @orders     = Order.from_user(params[:user_id])
        represented = OrderRepresenter.for_collection.new(@orders).to_hash

        render(json: represented)
      end

      def show
      end

      def create
        service = Orders::AddItemService.new(params[:user_id], permitted_params)

        service.on(:failed) { |error|  render_failure_response(error)  }
        service.on(:added)  { |record| render_success_response(record) }

        service.call
      end

      def update
      end

      def destroy
      end

      private

      def render_failure_response(error)
        render(json: error, status: 422)
      end

      def render_success_response(record)
        represented = OrderRepresenter.new(record).to_hash

        puts represented.inspect

        render(json: represented)
      end

      def load_order
        @order = Order.find_by(token: params[:id])
        head(:unauthorized) if @order.user_id != params[:user_id]
      end

      def permitted_params
        params.require(:order).permit(:quantity, :beer_id)
      end
    end
  end
end

