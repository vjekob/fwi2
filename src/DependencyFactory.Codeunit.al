codeunit 50107 "Demo Dependency Factory" implements IFactory
{
    #region Factory Methods
    procedure CreateConverter(var Converter: Interface "Demo IConverter"): Boolean;
    var
        Setup: Record "Demo Currency Exchange Setup";
        Handled: Boolean;
    begin
        OnDiscoverConverter(Converter, Handled);
        if Handled then
            exit(true);

        if not Setup.Get() then
            exit(false);

        Converter := Setup."Currency Converter";
        exit(true);
    end;

    procedure CreatePermissionChecker(var PermissionChecker: Interface "Demo IPermissionChecker"): Boolean;
    var
        Setup: Record "Demo Currency Exchange Setup";
        Handled: Boolean;
    begin
        OnDiscoverPermissionChecker(PermissionChecker, Handled);
        if Handled then
            exit(true);

        if not Setup.Get() then
            exit(false);

        PermissionChecker := Setup."Permission Checker";
        exit(true);
    end;

    procedure CreateLogger(var Logger: Interface "Demo ILogger"): Boolean;
    var
        Setup: Record "Demo Currency Exchange Setup";
        Handled: Boolean;
    begin
        OnDiscoverLogger(Logger, Handled);
        if Handled then
            exit(true);

        if not Setup.Get() then
            exit(false);

        Logger := Setup.Logger;
        exit(true);
    end;

    #endregion

    #region Event Publishers

    [IntegrationEvent(false, false)]
    local procedure OnDiscoverConverter(var Converter: Interface "Demo IConverter"; var Handled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnDiscoverPermissionChecker(var PermissionChecker: Interface "Demo IPermissionChecker"; var Handled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnDiscoverLogger(var Logger: Interface "Demo ILogger"; var Handled: Boolean);
    begin
    end;

    #endregion
}
