interface IFactory
{
    procedure CreateConverter(var Converter: Interface "Demo IConverter"): Boolean;
    procedure CreatePermissionChecker(var PermissionChecker: Interface "Demo IPermissionChecker"): Boolean;
    procedure CreateLogger(var Logger: Interface "Demo ILogger"): Boolean;
}
