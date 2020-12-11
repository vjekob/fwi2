codeunit 50145 "Factory (Enum)"
{
    procedure CreateSomething(var Product: Interface IProduct)
    var
        ProductType: Enum "Product Type";
    begin
        // Step 1:
        // Retrieve product type from somewhere
        // (for example: setup)

        // Step 2:
        // Assign factory product from enum
        Product := ProductType;
    end;
}
