codeunit 50107 "Demo Dependency Factory"
{
    procedure CreateConverter(var Converter: Interface "Demo IConverter"): Boolean;
    var
        Setup: Record "Demo Currency Exchange Setup";
    begin
        if not Setup.Get() then
            exit(false);

        Converter := Setup."Currency Converter";
        exit(true);
    end;

    procedure CreatePermissionChecker(var PermissionChecker: Interface "Demo IPermissionChecker"): Boolean;
    var
        Setup: Record "Demo Currency Exchange Setup";
    begin
        if not Setup.Get() then
            exit(false);

        PermissionChecker := Setup."Permission Checker";
        exit(true);
    end;

    procedure CreateLogger(var Logger: Interface "Demo ILogger"): Boolean;
    var
        Setup: Record "Demo Currency Exchange Setup";
    begin
        if not Setup.Get() then
            exit(false);

        Logger := Setup.Logger;
        exit(true);
    end;
}
