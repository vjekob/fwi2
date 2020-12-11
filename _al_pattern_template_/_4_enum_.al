enum 50149 "Product Type" implements IProduct
{
    // Important! Always set it to extensible to allow other extensions to provide custom implementations!
    Extensible = true;

    value(0; Product1)
    {
        Implementation = IProduct = "Example Product 1";
    }

    value(1; Product2)
    {
        Implementation = IProduct = "Example Product 2";
    }

    value(2; Product3)
    {
        Implementation = IProduct = "Example Product 3";
    }
}
