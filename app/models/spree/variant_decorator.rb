module Spree
  Variant.class_eval do

    has_many :suppliers, through: :supplier_variants
    has_many :supplier_variants

#    before_create :populate_for_suppliers

  # after_create :setup_supplier
  
  # def setup_supplier
  #   supplier_variants.create(supplier_id: 2, variant_id: id)
  # end

    private

    durably_decorate :create_stock_items, mode: 'soft', sha: '98704433ac5c66ba46e02699f3cf03d13d4f1281' do
      suppliers.each do |sup|
        sup.stock_locations.each do |stock_location|
          stock_location.propagate_variant(self) if stock_location.propagate_all_variants?
        end
      end
    end

    def populate_for_suppliers
      self.suppliers = self.product.suppliers
    end

  end
end
