codeunit 50144 Consumer
{
    procedure ConsumeDependency()
    var
        Product: Interface IProduct;
        Factory: Codeunit Factory;
    begin
        // Obtain product from the factory
        Factory.CreateProduct(Product);

        // Use product
        Product.Use();



        // ... or, alternatively:
        if Factory.CreateProduct(Product) then begin
            Product.Use();
        end;
    end;
}
