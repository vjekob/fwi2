codeunit 50149 Factory
{
    // This is normally not needed, it's here simply to illustrate the pattern
    var
        Switch: Option Option1,Option2,Option3;

    procedure CreateSomething(var Product: Interface IProduct)
    var
        Product1: Codeunit "Example Product 1";
        Product2: Codeunit "Example Product 2";
        Product3: Codeunit "Example Product 3";
    begin
        case Switch of
            Switch::Option1:
                Product := Product1;
            Switch::Option2:
                Product := Product2;
            Switch::Option3:
                Product := Product3;
        end;
    end;
}
