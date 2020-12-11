codeunit 50143 "Factory (Discovery)"
{
    procedure CreateProduct(var Product: Interface IProduct): Boolean;
    var
        ProductType: Enum "Product Type";
        Handled: Boolean;
    begin
        // Step 1:
        // Try to discover the product
        OnDiscoverProduct(Product, Handled);
        if Handled then
            exit(true);

        // Step 2:
        // Retrieve product type from somewhere
        // (for example: setup)

        // Step 3:
        // Assign factory product from enum
        Product := ProductType;

        // Step 4:
        // Indicate success
        exit(true);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnDiscoverProduct(var Product: Interface IProduct; var Handled: Boolean)
    begin
    end;
}
