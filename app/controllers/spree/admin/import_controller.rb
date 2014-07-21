class Spree::Admin::ImportController < Spree::Admin::ResourceController
    def new
    end

    def example
        @products = Spree::Product.all
        respond_to do |format|
          format.xls
        end
    end
end