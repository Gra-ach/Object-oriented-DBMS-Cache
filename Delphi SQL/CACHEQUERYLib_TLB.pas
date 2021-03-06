unit CACHEQUERYLib_TLB;

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
// File generated on 13.09.2014 9:45:40 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\PROGRA~1\COMMON~1\INTERS~1\Cache\CACHEQ~1.OCX (1)
// LIBID: {C37EFBE6-BC76-11D2-B65D-0000F87C2780}
// LCID: 0
// Helpfile: C:\PROGRA~1\COMMON~1\INTERS~1\Cache\CacheQuery.hlp 
// HelpString: CacheQuery ActiveX Control module
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
// SYS_KIND: SYS_WIN32
// Errors:
//   Hint: Symbol 'ClassName' renamed to '_className'
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleCtrls, Vcl.OleServer, Winapi.ActiveX;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  CACHEQUERYLibMajorVersion = 1;
  CACHEQUERYLibMinorVersion = 0;

  LIBID_CACHEQUERYLib: TGUID = '{C37EFBE6-BC76-11D2-B65D-0000F87C2780}';

  DIID__DCacheQuery: TGUID = '{C37EFBE7-BC76-11D2-B65D-0000F87C2780}';
  DIID__DCacheQueryEvents: TGUID = '{C37EFBE8-BC76-11D2-B65D-0000F87C2780}';
  CLASS_CacheQuery: TGUID = '{C37EFBE9-BC76-11D2-B65D-0000F87C2780}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _DCacheQuery = dispinterface;
  _DCacheQueryEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  CacheQuery = _DCacheQuery;


// *********************************************************************//
// DispIntf:  _DCacheQuery
// Flags:     (4112) Hidden Dispatchable
// GUID:      {C37EFBE7-BC76-11D2-B65D-0000F87C2780}
// *********************************************************************//
  _DCacheQuery = dispinterface
    ['{C37EFBE7-BC76-11D2-B65D-0000F87C2780}']
    property _className: WideString dispid 1;
    property QueryName: WideString dispid 2;
    property Factory: IDispatch dispid 10;
    property WaitForUserInput: WordBool dispid 3;
    property QuerySelection: WordBool dispid 4;
    property Title: WideString dispid 5;
    property AutoResize: WordBool dispid 6;
    property HideId: WordBool dispid 7;
    property HideSelection: WordBool dispid 8;
    property MaxToDisplay: Integer dispid 9;
    function FindId: WideString; dispid 11;
    procedure SetParam(Index: Smallint; const ParamValue: WideString); dispid 12;
    procedure StringOnlyMode(Enable: WordBool; ServerMode: Smallint); dispid 13;
    procedure AboutBox; dispid -552;
  end;

// *********************************************************************//
// DispIntf:  _DCacheQueryEvents
// Flags:     (4096) Dispatchable
// GUID:      {C37EFBE8-BC76-11D2-B65D-0000F87C2780}
// *********************************************************************//
  _DCacheQueryEvents = dispinterface
    ['{C37EFBE8-BC76-11D2-B65D-0000F87C2780}']
  end;

implementation

uses System.Win.ComObj;

end.
