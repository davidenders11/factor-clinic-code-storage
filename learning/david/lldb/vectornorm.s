	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 14, 0
	.globl	__Z11normSquared4Vec2           ; -- Begin function _Z11normSquared4Vec2
	.p2align	2
__Z11normSquared4Vec2:                  ; @_Z11normSquared4Vec2
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp]
	str	x1, [sp, #8]
	ldr	x8, [sp]
	ldr	x9, [sp]
	mul	x8, x8, x9
	ldr	x9, [sp, #8]
	ldr	x10, [sp, #8]
	mul	x9, x9, x10
	add	x0, x8, x9
	add	sp, sp, #16
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #64
	.cfi_def_cfa_offset 64
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	wzr, [x29, #-4]
	mov	x8, #3
	str	x8, [sp, #24]
	mov	x8, #4
	str	x8, [sp, #32]
	ldur	q0, [sp, #24]
	str	q0, [sp]
	ldr	x0, [sp]
	ldr	x1, [sp, #8]
	bl	__Z11normSquared4Vec2
                                        ; kill: def $w0 killed $w0 killed $x0
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #64
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
