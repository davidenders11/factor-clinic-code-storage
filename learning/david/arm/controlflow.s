	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 14, 0
	.globl	__Z14printUpperCasePKc          ; -- Begin function _Z14printUpperCasePKc
	.p2align	2
__Z14printUpperCasePKc:                 ; @_Z14printUpperCasePKc
Lfunc_begin0:
	.cfi_startproc
	.cfi_personality 155, ___gxx_personality_v0
	.cfi_lsda 16, Lexception0
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	sub	sp, sp, #16
	mov	x19, x0
Lloh0:
	adrp	x8, ___stack_chk_guard@GOTPAGE
Lloh1:
	ldr	x8, [x8, ___stack_chk_guard@GOTPAGEOFF]
Lloh2:
	ldr	x8, [x8]
	stur	x8, [x29, #-40]
	bl	_strlen
	mov	x8, x0
	add	x0, x0, #1
	cmp	x8, #1024
	b.hi	LBB0_3
; %bb.1:
	mov	x21, sp
	mov	x9, x0
Lloh3:
	adrp	x16, ___chkstk_darwin@GOTPAGE
Lloh4:
	ldr	x16, [x16, ___chkstk_darwin@GOTPAGEOFF]
	blr	x16
	mov	x8, sp
	add	x9, x0, #15
	and	x9, x9, #0xfffffffffffffff0
	sub	x20, x8, x9
	mov	sp, x20
	mov	x0, x20
	mov	x1, x19
	bl	__Z13copyUppercasePcPKc
	mov	x0, x20
	bl	_puts
	ldur	x8, [x29, #-40]
Lloh5:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh6:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh7:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB0_6
; %bb.2:
	mov	sp, x21
	sub	sp, x29, #32
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
LBB0_3:
	bl	__Znam
	mov	x20, x0
Ltmp0:
	mov	x1, x19
	bl	__Z13copyUppercasePcPKc
Ltmp1:
; %bb.4:
	mov	x0, x20
	bl	_puts
	ldur	x8, [x29, #-40]
Lloh8:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh9:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh10:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB0_6
; %bb.5:
	mov	x0, x20
	sub	sp, x29, #32
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	b	__ZdaPv
LBB0_6:
	bl	___stack_chk_fail
LBB0_7:
Ltmp2:
	mov	x19, x0
	mov	x0, x20
	bl	__ZdaPv
	mov	x0, x19
	bl	__Unwind_Resume
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpLdrGotLdr	Lloh5, Lloh6, Lloh7
	.loh AdrpLdrGot	Lloh3, Lloh4
	.loh AdrpLdrGotLdr	Lloh8, Lloh9, Lloh10
Lfunc_end0:
	.cfi_endproc
	.section	__TEXT,__gcc_except_tab
	.p2align	2, 0x0
GCC_except_table0:
Lexception0:
	.byte	255                             ; @LPStart Encoding = omit
	.byte	255                             ; @TType Encoding = omit
	.byte	1                               ; Call site Encoding = uleb128
	.uleb128 Lcst_end0-Lcst_begin0
Lcst_begin0:
	.uleb128 Lfunc_begin0-Lfunc_begin0      ; >> Call Site 1 <<
	.uleb128 Ltmp0-Lfunc_begin0             ;   Call between Lfunc_begin0 and Ltmp0
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp0-Lfunc_begin0             ; >> Call Site 2 <<
	.uleb128 Ltmp1-Ltmp0                    ;   Call between Ltmp0 and Ltmp1
	.uleb128 Ltmp2-Lfunc_begin0             ;     jumps to Ltmp2
	.byte	0                               ;   On action: cleanup
	.uleb128 Ltmp1-Lfunc_begin0             ; >> Call Site 3 <<
	.uleb128 Lfunc_end0-Ltmp1               ;   Call between Ltmp1 and Lfunc_end0
	.byte	0                               ;     has no landing pad
	.byte	0                               ;   On action: cleanup
Lcst_end0:
	.p2align	2, 0x0
                                        ; -- End function
.subsections_via_symbols
