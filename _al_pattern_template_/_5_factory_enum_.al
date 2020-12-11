codeunit 50145 "Factory (Enum)"
{
    procedure CreateProduct(var Product: Interface IProduct): Boolean;
    var
        ProductType: Enum "Product Type";
    begin
        // Step 1:
        // Retrieve product type from somewhere
        // (for example: setup)
        // Exit with false if this step fails

        // Step 2:
        // Assign factory product from enum
        Product := ProductType;

        // Step 3
        // Indicate success
        exit(true);
    end;
}
