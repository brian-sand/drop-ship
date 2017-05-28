Spree::Admin::ProductsController.class_eval do

  before_filter :get_suppliers, only: [:edit, :update]
  before_filter :supplier_collection, only: [:index]

  create.before :add_supplier

  def add_supplier
    if !@product.nil?
      if try_spree_current_user && !try_spree_current_user.admin? && try_spree_current_user.supplier?
        @product.master.supplier_variants.build(supplier_id: try_spree_current_user.supplier_id, 
                                                  variant_id: @product.master.id)
      end
    end
  end


  private

  def get_suppliers
    @suppliers = Spree::Supplier.order(:name)
  end

  # Scopes the collection to the Supplier.
  def supplier_collection
    if try_spree_current_user && !try_spree_current_user.admin? && try_spree_current_user.supplier?
      @collection = @collection.joins(:suppliers).where('spree_suppliers.id = ?', try_spree_current_user.supplier_id)
    end
  end

end
