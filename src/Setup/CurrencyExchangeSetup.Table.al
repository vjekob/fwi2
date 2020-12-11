table 50102 "Demo Currency Exchange Setup"
{
    Caption = 'Currency Exchange Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }

        field(2; "Currency Converter"; Enum "Demo Currency Converter Type")
        {
            Caption = 'Currency Converter';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Primary; "Primary Key") { }
    }
}
