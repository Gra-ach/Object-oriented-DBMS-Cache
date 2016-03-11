unit CacheActiveX_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 45604 $
// File generated on 08.09.2014 21:51:53 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\PROGRA~1\COMMON~1\INTERS~1\Cache\CACHEA~1.DLL (1)
// LIBID: {C0916A1F-5476-4B01-B83A-CA35E4810E64}
// LCID: 0
// Helpfile: 
// HelpString: CacheActiveX 2.0 Type Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
// SYS_KIND: SYS_WIN64
// Errors:
//   Hint: Member 'Set' of 'ISyslist' changed to 'Set_'
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  CacheActiveXMajorVersion = 2;
  CacheActiveXMinorVersion = 0;

  LIBID_CacheActiveX: TGUID = '{C0916A1F-5476-4B01-B83A-CA35E4810E64}';

  IID_IFactory: TGUID = '{F0ED2CF4-74CB-4A2F-9D7E-18F57218BCDA}';
  CLASS_Factory: TGUID = '{8555AC04-9D5B-46AC-94FB-33161465C6BA}';
  IID_IObjInstance: TGUID = '{638B7876-E783-4960-B70E-E6A9179E63F9}';
  CLASS_ObjInstance: TGUID = '{06C986DE-F242-467F-BC3C-72F337CD0979}';
  IID_ISyslist: TGUID = '{BD1ED984-1BA1-4B41-8E91-324A1AE0C322}';
  CLASS_Syslist: TGUID = '{F9773AF4-EDEC-4CCC-AA7A-E2C4C81761CE}';
  IID_IResultSet: TGUID = '{F94FF6C8-E6A1-44E1-AC3E-2A42E43708DA}';
  CLASS_ResultSet: TGUID = '{A20AF888-32A2-4BB3-99E2-A47183D661F8}';
  IID_IBinaryStream: TGUID = '{4D56DAF0-03BD-4994-88A7-E505F6F9632C}';
  CLASS_BinaryStream: TGUID = '{04846183-EB92-4091-B93C-7EA1D57BDFF9}';
  IID_ICharStream: TGUID = '{2942FA95-06D0-4795-864C-707AB1718EB4}';
  CLASS_CharStream: TGUID = '{1C1D1B6C-7209-444A-9039-E3D85EA6C102}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IFactory = interface;
  IFactoryDisp = dispinterface;
  IObjInstance = interface;
  IObjInstanceDisp = dispinterface;
  ISyslist = interface;
  ISyslistDisp = dispinterface;
  IResultSet = interface;
  IResultSetDisp = dispinterface;
  IBinaryStream = interface;
  IBinaryStreamDisp = dispinterface;
  ICharStream = interface;
  ICharStreamDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Factory = IFactory;
  ObjInstance = IObjInstance;
  Syslist = ISyslist;
  ResultSet = IResultSet;
  BinaryStream = IBinaryStream;
  CharStream = ICharStream;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PWideString1 = ^WideString; {*}


// *********************************************************************//
// Interface: IFactory
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F0ED2CF4-74CB-4A2F-9D7E-18F57218BCDA}
// *********************************************************************//
  IFactory = interface(IDispatch)
    ['{F0ED2CF4-74CB-4A2F-9D7E-18F57218BCDA}']
    function ConnectDlg(Title: OleVariant): WideString; safecall;
    function GetConnectionList: WideString; safecall;
    function Connect(const conn_str: WideString): WordBool; safecall;
    function IsConnected: WordBool; safecall;
    function Disconnect: WordBool; safecall;
    function IsMultibyte: WordBool; safecall;
    function New(const ClassName: WideString; InitVal: OleVariant): IDispatch; safecall;
    function Open(const ClassName: WideString; const OID: WideString; Concurrency: OleVariant): IDispatch; safecall;
    function OpenId(const ClassName: WideString; const ID: WideString; Concurrency: OleVariant): IDispatch; safecall;
    function OpenEx(const ClassName: WideString; const ID: WideString; Concurrency: OleVariant): IDispatch; safecall;
    function Static(const ClassName: WideString): IDispatch; safecall;
    function GetId(const OID: WideString): WideString; safecall;
    function GetClassName(const OID: WideString): WideString; safecall;
    function DynamicSQL(const Statement: WideString): IDispatch; safecall;
    function ResultSet(const ClassName: WideString; const QueryName: WideString): IDispatch; safecall;
    procedure TransactionStart; safecall;
    procedure TransactionRollBack; safecall;
    procedure TransactionCommit; safecall;
    function TransactionLevel: Smallint; safecall;
    procedure SetOutput(output: OleVariant); safecall;
    procedure ForceSync; safecall;
    function GetErrorText(ErrorCode: Integer; Param1: OleVariant; Param2: OleVariant; 
                          Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                          Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                          Param9: OleVariant; Param10: OleVariant): WideString; safecall;
    function GetLastErrorCount: Smallint; safecall;
    function GetLastErrorNumber(ErrNo: OleVariant): Integer; safecall;
    function GetLastErrorParamCount(ErrNo: OleVariant): Smallint; safecall;
    function GetLastErrorParam(ErrNo: OleVariant; ParamNo: OleVariant): WideString; safecall;
    procedure SetCacheLog(LogMask: Integer); safecall;
    procedure SetLogMask(LogMask: Integer); safecall;
    procedure SetOption(const key: WideString; value: OleVariant); safecall;
  end;

// *********************************************************************//
// DispIntf:  IFactoryDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F0ED2CF4-74CB-4A2F-9D7E-18F57218BCDA}
// *********************************************************************//
  IFactoryDisp = dispinterface
    ['{F0ED2CF4-74CB-4A2F-9D7E-18F57218BCDA}']
    function ConnectDlg(Title: OleVariant): WideString; dispid 9;
    function GetConnectionList: WideString; dispid 26;
    function Connect(const conn_str: WideString): WordBool; dispid 1;
    function IsConnected: WordBool; dispid 10;
    function Disconnect: WordBool; dispid 2;
    function IsMultibyte: WordBool; dispid 27;
    function New(const ClassName: WideString; InitVal: OleVariant): IDispatch; dispid 4;
    function Open(const ClassName: WideString; const OID: WideString; Concurrency: OleVariant): IDispatch; dispid 5;
    function OpenId(const ClassName: WideString; const ID: WideString; Concurrency: OleVariant): IDispatch; dispid 7;
    function OpenEx(const ClassName: WideString; const ID: WideString; Concurrency: OleVariant): IDispatch; dispid 6;
    function Static(const ClassName: WideString): IDispatch; dispid 8;
    function GetId(const OID: WideString): WideString; dispid 13;
    function GetClassName(const OID: WideString): WideString; dispid 12;
    function DynamicSQL(const Statement: WideString): IDispatch; dispid 20;
    function ResultSet(const ClassName: WideString; const QueryName: WideString): IDispatch; dispid 11;
    procedure TransactionStart; dispid 21;
    procedure TransactionRollBack; dispid 22;
    procedure TransactionCommit; dispid 23;
    function TransactionLevel: Smallint; dispid 24;
    procedure SetOutput(output: OleVariant); dispid 15;
    procedure ForceSync; dispid 29;
    function GetErrorText(ErrorCode: Integer; Param1: OleVariant; Param2: OleVariant; 
                          Param3: OleVariant; Param4: OleVariant; Param5: OleVariant; 
                          Param6: OleVariant; Param7: OleVariant; Param8: OleVariant; 
                          Param9: OleVariant; Param10: OleVariant): WideString; dispid 14;
    function GetLastErrorCount: Smallint; dispid 16;
    function GetLastErrorNumber(ErrNo: OleVariant): Integer; dispid 17;
    function GetLastErrorParamCount(ErrNo: OleVariant): Smallint; dispid 18;
    function GetLastErrorParam(ErrNo: OleVariant; ParamNo: OleVariant): WideString; dispid 19;
    procedure SetCacheLog(LogMask: Integer); dispid 25;
    procedure SetLogMask(LogMask: Integer); dispid 3;
    procedure SetOption(const key: WideString; value: OleVariant); dispid 28;
  end;

// *********************************************************************//
// Interface: IObjInstance
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {638B7876-E783-4960-B70E-E6A9179E63F9}
// *********************************************************************//
  IObjInstance = interface(IDispatch)
    ['{638B7876-E783-4960-B70E-E6A9179E63F9}']
  end;

// *********************************************************************//
// DispIntf:  IObjInstanceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {638B7876-E783-4960-B70E-E6A9179E63F9}
// *********************************************************************//
  IObjInstanceDisp = dispinterface
    ['{638B7876-E783-4960-B70E-E6A9179E63F9}']
  end;

// *********************************************************************//
// Interface: ISyslist
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BD1ED984-1BA1-4B41-8E91-324A1AE0C322}
// *********************************************************************//
  ISyslist = interface(IDispatch)
    ['{BD1ED984-1BA1-4B41-8E91-324A1AE0C322}']
    function Get__NewItem: IUnknown; safecall;
    procedure Add(val: OleVariant); safecall;
    procedure Remove(idx: Integer); safecall;
    function Get_Item(idx: Integer): OleVariant; safecall;
    procedure Set_Item(idx: Integer; pVal: OleVariant); safecall;
    function Get_ItemList(idx: Integer): IDispatch; safecall;
    procedure _Set_ItemList(idx: Integer; const pVal: IDispatch); safecall;
    function Get_Count: Integer; safecall;
    function Get: WideString; safecall;
    function GetBinary: PSafeArray; safecall;
    procedure Set_(val: OleVariant); safecall;
    procedure Clear; safecall;
    function Get_IsMultibyte: WordBool; safecall;
    property _NewItem: IUnknown read Get__NewItem;
    property Item[idx: Integer]: OleVariant read Get_Item write Set_Item;
    property ItemList[idx: Integer]: IDispatch read Get_ItemList write _Set_ItemList;
    property Count: Integer read Get_Count;
    property IsMultibyte: WordBool read Get_IsMultibyte;
  end;

// *********************************************************************//
// DispIntf:  ISyslistDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {BD1ED984-1BA1-4B41-8E91-324A1AE0C322}
// *********************************************************************//
  ISyslistDisp = dispinterface
    ['{BD1ED984-1BA1-4B41-8E91-324A1AE0C322}']
    property _NewItem: IUnknown readonly dispid -4;
    procedure Add(val: OleVariant); dispid 7;
    procedure Remove(idx: Integer); dispid 6;
    property Item[idx: Integer]: OleVariant dispid 9;
    property ItemList[idx: Integer]: IDispatch dispid 8;
    property Count: Integer readonly dispid 2;
    function Get: WideString; dispid 4;
    function GetBinary: {NOT_OLEAUTO(PSafeArray)}OleVariant; dispid 10;
    procedure Set_(val: OleVariant); dispid 3;
    procedure Clear; dispid 5;
    property IsMultibyte: WordBool readonly dispid 1;
  end;

// *********************************************************************//
// Interface: IResultSet
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F94FF6C8-E6A1-44E1-AC3E-2A42E43708DA}
// *********************************************************************//
  IResultSet = interface(IDispatch)
    ['{F94FF6C8-E6A1-44E1-AC3E-2A42E43708DA}']
    procedure Prepare(par1: OleVariant; par2: OleVariant; par3: OleVariant; par4: OleVariant; 
                      par5: OleVariant; par6: OleVariant; par7: OleVariant; par8: OleVariant; 
                      par9: OleVariant; par10: OleVariant; par11: OleVariant; par12: OleVariant; 
                      par13: OleVariant; par14: OleVariant; par15: OleVariant; par16: OleVariant); safecall;
    function Execute(par1: OleVariant; par2: OleVariant; par3: OleVariant; par4: OleVariant; 
                     par5: OleVariant; par6: OleVariant; par7: OleVariant; par8: OleVariant; 
                     par9: OleVariant; par10: OleVariant; par11: OleVariant; par12: OleVariant; 
                     par13: OleVariant; par14: OleVariant; par15: OleVariant; par16: OleVariant): WordBool; safecall;
    function Next: WordBool; safecall;
    function Close: WordBool; safecall;
    function GetColumnCount: Smallint; safecall;
    function GetParamCount: Smallint; safecall;
    function GetColumnName(idx: Smallint): WideString; safecall;
    function GetColumnHeader(idx: Smallint): WideString; safecall;
    function GetColumnType(idx: Smallint): SYSINT; safecall;
    function GetParamName(idx: Smallint): WideString; safecall;
    function ContainsID: Smallint; safecall;
    procedure SetParam(idx: Smallint; val: OleVariant); safecall;
    function IsDataNull(idx: Smallint): WordBool; safecall;
    function GetData(idx: Smallint): OleVariant; safecall;
    function GetDataAsString(idx: Smallint): WideString; safecall;
    function GetDataByName(const col_name: WideString): OleVariant; safecall;
    function Get(const col_name: WideString): OleVariant; safecall;
    procedure SetRunTimeMode(val: Smallint); safecall;
    function Get_QHandle: WideString; safecall;
    property QHandle: WideString read Get_QHandle;
  end;

// *********************************************************************//
// DispIntf:  IResultSetDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F94FF6C8-E6A1-44E1-AC3E-2A42E43708DA}
// *********************************************************************//
  IResultSetDisp = dispinterface
    ['{F94FF6C8-E6A1-44E1-AC3E-2A42E43708DA}']
    procedure Prepare(par1: OleVariant; par2: OleVariant; par3: OleVariant; par4: OleVariant; 
                      par5: OleVariant; par6: OleVariant; par7: OleVariant; par8: OleVariant; 
                      par9: OleVariant; par10: OleVariant; par11: OleVariant; par12: OleVariant; 
                      par13: OleVariant; par14: OleVariant; par15: OleVariant; par16: OleVariant); dispid 14;
    function Execute(par1: OleVariant; par2: OleVariant; par3: OleVariant; par4: OleVariant; 
                     par5: OleVariant; par6: OleVariant; par7: OleVariant; par8: OleVariant; 
                     par9: OleVariant; par10: OleVariant; par11: OleVariant; par12: OleVariant; 
                     par13: OleVariant; par14: OleVariant; par15: OleVariant; par16: OleVariant): WordBool; dispid 2;
    function Next: WordBool; dispid 3;
    function Close: WordBool; dispid 6;
    function GetColumnCount: Smallint; dispid 4;
    function GetParamCount: Smallint; dispid 8;
    function GetColumnName(idx: Smallint): WideString; dispid 7;
    function GetColumnHeader(idx: Smallint): WideString; dispid 10;
    function GetColumnType(idx: Smallint): SYSINT; dispid 19;
    function GetParamName(idx: Smallint): WideString; dispid 9;
    function ContainsID: Smallint; dispid 12;
    procedure SetParam(idx: Smallint; val: OleVariant); dispid 13;
    function IsDataNull(idx: Smallint): WordBool; dispid 16;
    function GetData(idx: Smallint): OleVariant; dispid 5;
    function GetDataAsString(idx: Smallint): WideString; dispid 17;
    function GetDataByName(const col_name: WideString): OleVariant; dispid 11;
    function Get(const col_name: WideString): OleVariant; dispid 15;
    procedure SetRunTimeMode(val: Smallint); dispid 18;
    property QHandle: WideString readonly dispid 1;
  end;

// *********************************************************************//
// Interface: IBinaryStream
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4D56DAF0-03BD-4994-88A7-E505F6F9632C}
// *********************************************************************//
  IBinaryStream = interface(IDispatch)
    ['{4D56DAF0-03BD-4994-88A7-E505F6F9632C}']
    function FileRead(const FileName: WideString): WordBool; safecall;
    function FileWrite(const FileName: WideString): WordBool; safecall;
    function Read(size: Smallint): WideString; safecall;
    function Write(var val: WideString): WordBool; safecall;
    function ReadBinary(var val: PSafeArray; idx: SYSINT; Count: SYSINT): SYSINT; safecall;
    procedure WriteBinary(var val: PSafeArray; idx: SYSINT; Count: SYSINT); safecall;
    procedure Clear; safecall;
    procedure Rewind; safecall;
    function GetAttribute(const Name: WideString; const Default: WideString): WideString; safecall;
    procedure SetAttribute(const Name: WideString; const value: WideString); safecall;
    function IsDefinedAttribute(const Name: WideString): WordBool; safecall;
    function NextAttribute(const Name: WideString): WideString; safecall;
    function DeleteAttribute(const Name: WideString): WordBool; safecall;
    function Get_Data: WideString; safecall;
    procedure Set_Data(const pVal: WideString); safecall;
    function Get_size: Integer; safecall;
    function Get_oref: Integer; safecall;
    function GetPicture: IPictureDisp; safecall;
    procedure SetPicture(const val: IPictureDisp); safecall;
    property Data: WideString read Get_Data write Set_Data;
    property size: Integer read Get_size;
    property oref: Integer read Get_oref;
  end;

// *********************************************************************//
// DispIntf:  IBinaryStreamDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4D56DAF0-03BD-4994-88A7-E505F6F9632C}
// *********************************************************************//
  IBinaryStreamDisp = dispinterface
    ['{4D56DAF0-03BD-4994-88A7-E505F6F9632C}']
    function FileRead(const FileName: WideString): WordBool; dispid 3;
    function FileWrite(const FileName: WideString): WordBool; dispid 4;
    function Read(size: Smallint): WideString; dispid 7;
    function Write(var val: WideString): WordBool; dispid 9;
    function ReadBinary(var val: {NOT_OLEAUTO(PSafeArray)}OleVariant; idx: SYSINT; Count: SYSINT): SYSINT; dispid 17;
    procedure WriteBinary(var val: {NOT_OLEAUTO(PSafeArray)}OleVariant; idx: SYSINT; Count: SYSINT); dispid 18;
    procedure Clear; dispid 10;
    procedure Rewind; dispid 8;
    function GetAttribute(const Name: WideString; const Default: WideString): WideString; dispid 11;
    procedure SetAttribute(const Name: WideString; const value: WideString); dispid 12;
    function IsDefinedAttribute(const Name: WideString): WordBool; dispid 13;
    function NextAttribute(const Name: WideString): WideString; dispid 14;
    function DeleteAttribute(const Name: WideString): WordBool; dispid 15;
    property Data: WideString dispid 1;
    property size: Integer readonly dispid 16;
    property oref: Integer readonly dispid 2;
    function GetPicture: IPictureDisp; dispid 5;
    procedure SetPicture(const val: IPictureDisp); dispid 6;
  end;

// *********************************************************************//
// Interface: ICharStream
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2942FA95-06D0-4795-864C-707AB1718EB4}
// *********************************************************************//
  ICharStream = interface(IDispatch)
    ['{2942FA95-06D0-4795-864C-707AB1718EB4}']
    function FileRead(const FileName: WideString): WordBool; safecall;
    function FileWrite(const FileName: WideString): WordBool; safecall;
    function Read(size: Smallint): WideString; safecall;
    function Write(const val: WideString): WordBool; safecall;
    procedure Clear; safecall;
    procedure Rewind; safecall;
    function GetAttribute(const Name: WideString; const Default: WideString): WideString; safecall;
    procedure SetAttribute(const Name: WideString; const value: WideString); safecall;
    function IsDefinedAttribute(const Name: WideString): WordBool; safecall;
    function NextAttribute(const Name: WideString): WideString; safecall;
    function DeleteAttribute(const Name: WideString): WordBool; safecall;
    function Get_Data: WideString; safecall;
    procedure Set_Data(const pVal: WideString); safecall;
    function Get_size: Integer; safecall;
    function Get_oref: Integer; safecall;
    property Data: WideString read Get_Data write Set_Data;
    property size: Integer read Get_size;
    property oref: Integer read Get_oref;
  end;

// *********************************************************************//
// DispIntf:  ICharStreamDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2942FA95-06D0-4795-864C-707AB1718EB4}
// *********************************************************************//
  ICharStreamDisp = dispinterface
    ['{2942FA95-06D0-4795-864C-707AB1718EB4}']
    function FileRead(const FileName: WideString): WordBool; dispid 3;
    function FileWrite(const FileName: WideString): WordBool; dispid 4;
    function Read(size: Smallint): WideString; dispid 5;
    function Write(const val: WideString): WordBool; dispid 6;
    procedure Clear; dispid 8;
    procedure Rewind; dispid 7;
    function GetAttribute(const Name: WideString; const Default: WideString): WideString; dispid 9;
    procedure SetAttribute(const Name: WideString; const value: WideString); dispid 10;
    function IsDefinedAttribute(const Name: WideString): WordBool; dispid 11;
    function NextAttribute(const Name: WideString): WideString; dispid 12;
    function DeleteAttribute(const Name: WideString): WordBool; dispid 13;
    property Data: WideString dispid 1;
    property size: Integer readonly dispid 14;
    property oref: Integer readonly dispid 2;
  end;

// *********************************************************************//
// The Class CoFactory provides a Create and CreateRemote method to          
// create instances of the default interface IFactory exposed by              
// the CoClass Factory. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoFactory = class
    class function Create: IFactory;
    class function CreateRemote(const MachineName: string): IFactory;
  end;

// *********************************************************************//
// The Class CoObjInstance provides a Create and CreateRemote method to          
// create instances of the default interface IObjInstance exposed by              
// the CoClass ObjInstance. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoObjInstance = class
    class function Create: IObjInstance;
    class function CreateRemote(const MachineName: string): IObjInstance;
  end;

// *********************************************************************//
// The Class CoSyslist provides a Create and CreateRemote method to          
// create instances of the default interface ISyslist exposed by              
// the CoClass Syslist. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSyslist = class
    class function Create: ISyslist;
    class function CreateRemote(const MachineName: string): ISyslist;
  end;

// *********************************************************************//
// The Class CoResultSet provides a Create and CreateRemote method to          
// create instances of the default interface IResultSet exposed by              
// the CoClass ResultSet. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoResultSet = class
    class function Create: IResultSet;
    class function CreateRemote(const MachineName: string): IResultSet;
  end;

// *********************************************************************//
// The Class CoBinaryStream provides a Create and CreateRemote method to          
// create instances of the default interface IBinaryStream exposed by              
// the CoClass BinaryStream. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoBinaryStream = class
    class function Create: IBinaryStream;
    class function CreateRemote(const MachineName: string): IBinaryStream;
  end;

// *********************************************************************//
// The Class CoCharStream provides a Create and CreateRemote method to          
// create instances of the default interface ICharStream exposed by              
// the CoClass CharStream. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCharStream = class
    class function Create: ICharStream;
    class function CreateRemote(const MachineName: string): ICharStream;
  end;

implementation

uses System.Win.ComObj;

class function CoFactory.Create: IFactory;
begin
  Result := CreateComObject(CLASS_Factory) as IFactory;
end;

class function CoFactory.CreateRemote(const MachineName: string): IFactory;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Factory) as IFactory;
end;

class function CoObjInstance.Create: IObjInstance;
begin
  Result := CreateComObject(CLASS_ObjInstance) as IObjInstance;
end;

class function CoObjInstance.CreateRemote(const MachineName: string): IObjInstance;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ObjInstance) as IObjInstance;
end;

class function CoSyslist.Create: ISyslist;
begin
  Result := CreateComObject(CLASS_Syslist) as ISyslist;
end;

class function CoSyslist.CreateRemote(const MachineName: string): ISyslist;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Syslist) as ISyslist;
end;

class function CoResultSet.Create: IResultSet;
begin
  Result := CreateComObject(CLASS_ResultSet) as IResultSet;
end;

class function CoResultSet.CreateRemote(const MachineName: string): IResultSet;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ResultSet) as IResultSet;
end;

class function CoBinaryStream.Create: IBinaryStream;
begin
  Result := CreateComObject(CLASS_BinaryStream) as IBinaryStream;
end;

class function CoBinaryStream.CreateRemote(const MachineName: string): IBinaryStream;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_BinaryStream) as IBinaryStream;
end;

class function CoCharStream.Create: ICharStream;
begin
  Result := CreateComObject(CLASS_CharStream) as ICharStream;
end;

class function CoCharStream.CreateRemote(const MachineName: string): ICharStream;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CharStream) as ICharStream;
end;

end.
