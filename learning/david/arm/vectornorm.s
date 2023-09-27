	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 14, 0
	.globl	__Z11normSquared4Vec2           ; -- Begin function _Z11normSquared4Vec2
	.p2align	2
__Z11normSquared4Vec2:                  ; @_Z11normSquared4Vec2
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #32
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stp	x0, x1, [sp]
	mov	x0, sp
	bl	__ZNK4Vec210debugPrintEv
	ldp	x8, x9, [sp]
	mul	x8, x8, x8
	madd	x0, x9, x9, x8
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	add	sp, sp, #32
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
