$PBExportHeader$w_test.srw
forward
global type w_test from window
end type
type lb_values from listbox within w_test
end type
type cb_set from commandbutton within w_test
end type
type lb_keys from listbox within w_test
end type
type cb_purge from commandbutton within w_test
end type
type cb_geni from commandbutton within w_test
end type
type cb_enum from commandbutton within w_test
end type
type st_count from statictext within w_test
end type
type cb_1 from commandbutton within w_test
end type
type cb_obj from commandbutton within w_test
end type
type cb_delete from commandbutton within w_test
end type
type cb_get from commandbutton within w_test
end type
type cb_add from commandbutton within w_test
end type
type st_2 from statictext within w_test
end type
type st_1 from statictext within w_test
end type
type sle_key from singlelineedit within w_test
end type
type sle_data from singlelineedit within w_test
end type
type gb_1 from groupbox within w_test
end type
end forward

global type w_test from window
integer width = 2962
integer height = 1152
boolean titlebar = true
string title = "PBNI Hash Test"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
lb_values lb_values
cb_set cb_set
lb_keys lb_keys
cb_purge cb_purge
cb_geni cb_geni
cb_enum cb_enum
st_count st_count
cb_1 cb_1
cb_obj cb_obj
cb_delete cb_delete
cb_get cb_get
cb_add cb_add
st_2 st_2
st_1 st_1
sle_key sle_key
sle_data sle_data
gb_1 gb_1
end type
global w_test w_test

type prototypes
Subroutine OutputDebugString (String lpszOutputString)  LIBRARY "kernel32.dll" ALIAS FOR "OutputDebugStringW";

end prototypes

type variables


uo_hash hash_str
string is_keys[]

end variables

forward prototypes
public subroutine list_data ()
end prototypes

public subroutine list_data ();//string keys[]
int i

if hash_str.of_getkeys(ref is_keys[]) then
	lb_keys.reset()
	lb_values.reset()
	for i = 1 to upperbound(is_keys)
		lb_keys.additem(is_keys[i])
		lb_values.additem(hash_str.of_get(is_keys[i]))
	next
end if


end subroutine

event open;
hash_str = create uo_hash

gb_1.text = "Version : " + hash_str.of_getversion( )

end event

event close;
if isvalid(hash_str) then destroy (hash_str)


end event

on w_test.create
this.lb_values=create lb_values
this.cb_set=create cb_set
this.lb_keys=create lb_keys
this.cb_purge=create cb_purge
this.cb_geni=create cb_geni
this.cb_enum=create cb_enum
this.st_count=create st_count
this.cb_1=create cb_1
this.cb_obj=create cb_obj
this.cb_delete=create cb_delete
this.cb_get=create cb_get
this.cb_add=create cb_add
this.st_2=create st_2
this.st_1=create st_1
this.sle_key=create sle_key
this.sle_data=create sle_data
this.gb_1=create gb_1
this.Control[]={this.lb_values,&
this.cb_set,&
this.lb_keys,&
this.cb_purge,&
this.cb_geni,&
this.cb_enum,&
this.st_count,&
this.cb_1,&
this.cb_obj,&
this.cb_delete,&
this.cb_get,&
this.cb_add,&
this.st_2,&
this.st_1,&
this.sle_key,&
this.sle_data,&
this.gb_1}
end on

on w_test.destroy
destroy(this.lb_values)
destroy(this.cb_set)
destroy(this.lb_keys)
destroy(this.cb_purge)
destroy(this.cb_geni)
destroy(this.cb_enum)
destroy(this.st_count)
destroy(this.cb_1)
destroy(this.cb_obj)
destroy(this.cb_delete)
destroy(this.cb_get)
destroy(this.cb_add)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_key)
destroy(this.sle_data)
destroy(this.gb_1)
end on

type lb_values from listbox within w_test
integer x = 2226
integer y = 68
integer width = 517
integer height = 960
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

type cb_set from commandbutton within w_test
integer x = 539
integer y = 568
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "set"
end type

event clicked;if hash_str.of_set(sle_key.text, sle_data.text) then 
	sle_data.text ="+ok"
else
	sle_data.text ="+pas ok :" + string(hash_str.of_getlasterror( )) + " = " + hash_str.of_getlasterrmsg( )
end if

st_count.text = string(hash_str.of_getcount())
list_data( )

end event

type lb_keys from listbox within w_test
integer x = 1682
integer y = 68
integer width = 517
integer height = 960
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;
sle_key.text = text( index)

end event

type cb_purge from commandbutton within w_test
integer x = 114
integer y = 572
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "purge"
end type

event clicked;
hash_str.of_purge()
list_data( )

end event

type cb_geni from commandbutton within w_test
integer x = 517
integer y = 896
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "GeNi"
end type

event clicked;uo_hash lh_tmp

lh_tmp = create uo_hash

if not lh_tmp.of_add( "ISIN_debt_percentage", "ISIN_debt_percentage") then messagebox("error", string(lh_tmp.of_getlasterror( )) + " = " + lh_tmp.of_getlasterrmsg( ))
if not lh_tmp.of_add( "ISIN_equity_percentage", "ISIN_equity_percentage") then messagebox("error", string(lh_tmp.of_getlasterror( )) + " = " + lh_tmp.of_getlasterrmsg( ))
if not lh_tmp.of_add( "ISIN_debt_device", "ISIN_debt_device") then messagebox("error", string(lh_tmp.of_getlasterror( )) + " = " + lh_tmp.of_getlasterrmsg( ))
if not lh_tmp.of_add( "ISIN_equity_device", "ISIN_equity_device") then messagebox("error", string(lh_tmp.of_getlasterror( )) + " = " + lh_tmp.of_getlasterrmsg( ))
if not lh_tmp.of_add( "other_debt_percentage", "other_debt_percentage") then messagebox("error", string(lh_tmp.of_getlasterror( )) + " = " + lh_tmp.of_getlasterrmsg( ))
if not lh_tmp.of_add( "other_debt_devise", "other_debt_devise") then messagebox("error", string(lh_tmp.of_getlasterror( )) + " = " + lh_tmp.of_getlasterrmsg( ))
if not lh_tmp.of_add( "other_equity_percentage", "other_equity_percentage") then messagebox("error", string(lh_tmp.of_getlasterror( )) + " = " + lh_tmp.of_getlasterrmsg( ))
if not lh_tmp.of_add( "other_equity_devise", "other_equity_devise") then messagebox("error", string(lh_tmp.of_getlasterror( )) + " = " + lh_tmp.of_getlasterrmsg( ))

string ls_keys[]
long i
string ls_msg
lh_tmp.of_getkeys( ls_keys[] )
for i =1 to upperbound( ls_keys[] )
	ls_msg += string(i,"00")+") of_get("+ls_keys[i]+") => "+string( lh_tmp.of_get( ls_keys[i] ) ) + "~r~n"
next

messagebox( "TEST - Specifique ", "other_equity_percentage => " + string(lh_tmp.of_get( "other_equity_percentage" ) ) )

destroy lh_tmp

messagebox( "TEST", ls_msg )
/*
[5304] [nv_xmltemplate] inv_loops_keys ( ISIN_debt_percentage, ISIN_debt_percentage)
[5304] [nv_xmltemplate] inv_loops_keys ( ISIN_equity_percentage, ISIN_equity_percentage)
[5304] [nv_xmltemplate] inv_loops_keys ( ISIN_debt_device, ISIN_debt_device)
[5304] [nv_xmltemplate] inv_loops_keys ( ISIN_equity_device, ISIN_equity_device)
[5304] [nv_xmltemplate] inv_loops_keys ( other_debt_percentage, other_debt_percentage)
[5304] [nv_xmltemplate] inv_loops_keys ( other_debt_devise, other_debt_devise)
[5304] [nv_xmltemplate] inv_loops_keys ( other_equity_percentage, other_equity_percentage)
[5304] [nv_xmltemplate] inv_loops_keys ( other_equity_devise, other_equity_devise)
*/
end event

type cb_enum from commandbutton within w_test
integer x = 507
integer y = 768
integer width = 443
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "getKeys/values"
end type

event clicked;
//string keys[]
int i

//messagebox("of_getKeys()", string(hash_str.of_getkeys(ref keys)))
if hash_str.of_getkeys(ref is_keys[]) then
	sle_data.text ="+ok"
else
	sle_data.text ="+pas ok :" + string(hash_str.of_getlasterror( )) + " = " + hash_str.of_getlasterrmsg( )
end if

list_data( )

end event

type st_count from statictext within w_test
integer x = 1422
integer y = 448
integer width = 233
integer height = 92
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_test
integer x = 69
integer y = 768
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "debugstring"
end type

event clicked;outputdebugstring( "foo...bar")

end event

type cb_obj from commandbutton within w_test
integer x = 69
integer y = 900
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "test add/get"
end type

event clicked;
OutputDebugString("0")
uo_hash hash

hash = create uo_hash
boolean res

str_test val



//OutputDebugString("1")
//OutputDebugString(" ajout 1" + string(res ))
val.l_val = 123
val.s_val = "valeur no 1"
res = hash.of_add( "1111111", val)
messagebox("ajout 1", string(res))

val.l_val = 42
val.s_val = "valeur en deuxieme"
res = hash.of_add( "2222222", val)
messagebox("ajout 2", string(res))

val.l_val = 99
val.s_val = "valeur en 3"
res = hash.of_add( "1111110", val)
messagebox("ajout 3", string(res))

//====================================

any ret_val
str_test val2
ret_val = hash.of_get("1111111")
if isnull(ret_val) then
	messagebox("get 1", "null")
else
	val2 = ret_val
	messagebox("get 1", string(val2.l_val) + " / " + val2.s_val)
end if

ret_val = hash.of_get("1111110")
if isnull(ret_val) then
	messagebox("get 3", "null")
else
	val2 = ret_val
	messagebox("get 3", string(val2.l_val) + " / " + val2.s_val)
end if

ret_val = hash.of_get("123456")
if isnull(ret_val) then
	messagebox("get 4", "null")
else
	val2 = ret_val
	messagebox("get 4", string(val2.l_val) + " / " + val2.s_val)
end if


ret_val = hash.of_get("2222222")
if isnull(ret_val) then
	messagebox("get 2", "null")
else
	val2 = ret_val
	messagebox("get 2", string(val2.l_val) + " / " + val2.s_val)
end if

ret_val = hash.of_get("1111110")
if isnull(ret_val) then
	messagebox("get 3", "null")
else
	val2 = ret_val
	messagebox("get 3", string(val2.l_val) + " / " + val2.s_val)
end if


if isvalid(hash) then destroy hash

end event

type cb_delete from commandbutton within w_test
integer x = 969
integer y = 444
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "delete"
end type

event clicked;
if hash_str.of_delete(sle_key.text) then 
	sle_data.text ="+ok"
else
	sle_data.text ="+pas ok :" + string(hash_str.of_getlasterror( )) + " = " + hash_str.of_getlasterrmsg( )
end if

st_count.text = string(hash_str.of_getcount())

list_data( )

end event

type cb_get from commandbutton within w_test
integer x = 539
integer y = 440
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "get"
end type

event clicked;any t
t = hash_str.of_get(sle_key.text)

if isnull(t) then 
	sle_data.text = 'null : ' + string(hash_str.of_getlasterror( )) + " = " + hash_str.of_getlasterrmsg( )
else
	sle_data.text = string(t)
end if

end event

type cb_add from commandbutton within w_test
integer x = 114
integer y = 444
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "add"
end type

event clicked;
if hash_str.of_add(sle_key.text, sle_data.text) then 
	sle_data.text ="+ok"
else
	sle_data.text ="+pas ok :" + string(hash_str.of_getlasterror( )) + " = " + hash_str.of_getlasterrmsg( )
end if

st_count.text = string(hash_str.of_getcount())

list_data( )

end event

type st_2 from statictext within w_test
integer x = 119
integer y = 268
integer width = 210
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "data"
boolean focusrectangle = false
end type

type st_1 from statictext within w_test
integer x = 114
integer y = 160
integer width = 210
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "key"
boolean focusrectangle = false
end type

type sle_key from singlelineedit within w_test
integer x = 370
integer y = 160
integer width = 402
integer height = 84
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type sle_data from singlelineedit within w_test
integer x = 370
integer y = 268
integer width = 1179
integer height = 84
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type gb_1 from groupbox within w_test
integer x = 59
integer y = 40
integer width = 1605
integer height = 400
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
end type

