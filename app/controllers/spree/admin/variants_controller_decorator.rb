Spree::Admin::VariantsController.class_eval do
  create.before :add_supplier

  def add_supplier
    if !@variant.nil?
      if try_spree_current_user && !try_spree_current_user.admin? && try_spree_current_user.supplier?
        @variant.supplier_variants.build(supplier_id: try_spree_current_user.supplier_id, 
                                                   variant_id: @variant.id)
      end
    end
  end


end



