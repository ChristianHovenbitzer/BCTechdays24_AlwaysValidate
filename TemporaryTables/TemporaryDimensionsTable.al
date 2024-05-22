table 50200 TemporaryDimensionsTable
{
    TableType = Temporary;

    fields
    {
        field(1; MyField; Integer) { }
        field(2; GlobalDimension1Code; Code[20])
        {
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1), Blocked = const(false));
            trigger OnValidate()
            begin
                UpdateDimensionSetId(1, GlobalDimension1Code);
            end;
        }
        field(3; GlobalDimension2Code; Code[20])
        {
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2), Blocked = const(false));
            trigger OnValidate()
            begin
                UpdateDimensionSetId(2, GlobalDimension2Code);
            end;
        }
        field(4; DimensionSetId; Integer) { }
    }

    // Bad example
    procedure UpdateDimensionSetId(ShortCutNumber: Integer; DimensionCode: Code[20])
    var
        DimensionManagement: Codeunit DimensionManagement;
    begin
        // GetDimensionSetID on DimensionSetEntry table creates new dimension set entries.
        // When working on temporary tables automatically creating records is almost always unintented behaviour
        DimensionManagement.ValidateShortcutDimValues(ShortCutNumber, DimensionCode, DimensionSetId);
        Validate(DimensionSetId);
    end;
}