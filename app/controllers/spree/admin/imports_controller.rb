class Spree::Admin::ImportsController < Spree::Admin::ResourceController
    def new
    end

    def example
        @products = Spree::Product.all
        respond_to do |format|
          format.xls
        end
    end

    def create
        xls = Roo::Excel.new(params[:price_xls].path, nil, :ignore)

        (2..xls.last_row).each do |i|
            type_of_record, db_id, _, _, new_price = xls.row(i)

            object_to_update = if type_of_record == "VARIANT"
                Spree::Variant.find db_id
            else
                Spree::Product.find db_id
            end

            if object_to_update.price.to_i != new_price.to_i
                object_to_update.price = new_price.to_i
                object_to_update.save!
            end
        end

        flash[:notice] = "Цены обновлены"
        redirect_to new_admin_import_path
    end
end