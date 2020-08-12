; 
            icl 'AppleCodeOptimizer.inc'
;
; Start of code
;
            
;
            jmp L1959
L0803       lda CASINI+1
            pha
            lda CASINI
            pha
            stx CASINI
            sty CASINI+1
L080D       ldy #$00
            lda (CASINI),Y
            beq L081E
            jsr L0885
            inc CASINI
            bne L080D
            inc CASINI+1
            bne L080D
L081E       pla
            sta CASINI
            pla
            sta CASINI+1
            rts
L0825       .byte $00
L0826       lda LFBB3
            cmp #$06
            bne L0838
            lda #$80
            sta L0825
            lda LC01F
            sta L0848
L0838       lda #$49
            sta ACMVAR+5
            lda #$08
            sta ACMVAR+6
            eor #$A5
            sta ACMVAR+7
            rts
L0848       .byte $00
            bit L0848
            bpl L0853
            lda #$0C
            jsr LC300
L0853       jsr LFC58
            jsr L08D0
            ldx #<L0866
            ldy #>L0866
            jsr L0803
            jsr LFD8E
            jmp L0878
L0866       .byte 'Reset Key Pressed'
            .byte $00
L0878       jsr LBF00
            .byte $65
            .word L087E
L087E       .byte $04,$00,$00,$00,$00,$00,$00
L0885       bit L0825
            bmi L088D
            jsr L08E1
L088D       ora #$80
            jmp LFDED
L0892       ldx #$00
            ldy #$00
            sty L08CF
L0899       lda VDSLST,X
            inx
            and #$7F
            cmp #$0D
            beq L08C4
            cmp #$21
            bcc L0899
L08A7       sta VDSLST,Y
            iny
            lda VDSLST,X
            inx
            and #$7F
            cmp #$21
            bcs L08A7
            pha
            lda #$00
            sta VDSLST,Y
            iny
            inc L08CF
            pla
            cmp #$0D
            bne L0899
L08C4       pha
            lda #$00
            sta VDSLST,Y
            pla
            sta VDSLST+1,Y
            rts
L08CF       .byte $00
L08D0       ldx #<L1956
            ldy #>L1956
            jsr L0803
            lda #$3A
            jsr L0885
            lda #$20
            jmp L0885
L08E1       cmp #$61
            bcc L08EC
            cmp #$7B
            bcs L08EC
            sec
            sbc #$20
L08EC       rts
L08ED       cmp #$41
            bcc L08F7
            cmp #$5B
            bcs L08F7
            adc #$20
L08F7       rts
L08F8       jsr LBF00
            .byte $C8
            .word L09EA
            beq L0905
            ldy #$01
            jmp L0971
L0905       lda L09EF
            sta L09F1
L090B       jsr LBF00
            .byte $CA
            .word L09F0
            beq L0917
            cmp #$4C
            bne L0971
L0917       lda #$00
            sta LOMEM
            lda #$B7
            sta LOMEM+1
            rts
L0920       jsr LBF00
            .byte $C1
            .word L09F8
            beq L0931
            cmp #$46
            beq L0931
            ldy #$00
            jmp L0971
L0931       jsr LBF00
            .byte $C0
            .word L09FB
            bne L0971
            jsr LBF00
            .byte $C8
            .word L0A07
            bne L0971
            lda L0A0C
            sta L0A0E
            rts
L0948       ldx #$FF
L094A       inx
            cpx #$8C
            beq L0956
            lda LAE74,X
            cmp #$0D
            bne L094A
L0956       inx
            stx L0A11
            ldx #$00
            stx L0A12
            jsr LBF00
            .byte $CB
            .word L0A0D
            bne L0971
            rts
L0968       jsr LBF00
            .byte $CC
            .word L096F
            rts
L096F       .word $0001
L0971       pha
            jsr LFD8E
            jsr L0968
            cpy #$01
            bne L09A2
            jsr L08D0
            ldx #<L09B3
            ldy #>L09B3
            jsr L0803
            lda #$00
            ldy L1A2E
            sta L1A2F,Y
            ldx #<L1A2F
            ldy #>L1A2F
            jsr L0803
            lda #$22
            jsr L0885
            lda #$20
            jsr L0885
            jmp L09AC
L09A2       jsr L08D0
            ldx #<L09CF
            ldy #>L09CF
            jsr L0803
L09AC       pla
            jsr L1694
            jmp L0878
L09B3       .byte 'Error reading source file "'
            .byte $00
L09CF       .byte 'Error writing out "OP.OUT"'
            .byte $00
L09EA       .byte $03,$2E,$1A,$00,$B3
L09EF       .byte $00
L09F0       .byte $04
L09F1       .byte $00,$00,$B7,$00,$08
L09F6       .byte $00
L09F7       .byte $00
L09F8       .byte $01,$3C,$0A
L09FB       .byte $07,$3C,$0A,$C3,$04,$00,$00,$01,$00,$00,$00,$00
L0A07       .byte $03,$3C,$0A,$00,$AF
L0A0C       .byte $00
L0A0D       .byte $04
L0A0E       .byte $00,$74,$AE
L0A11       .byte $00
L0A12       .byte $00,$00,$00
L0A15       .byte 'Extra characters in command line'
            .byte $00
L0A36       .byte $05
            .byte 'P.OUT'
            .byte $06
            .byte 'OP.OUT'
L0A43       .byte $05
            .byte 'a.out'
L0A49       bit LC083
            ldy #$00
L0A4E       lda LD139,Y
            sta LBC00,Y
            lda LD239,Y
            sta LBD00,Y
            lda LD339,Y
            sta LBE00,Y
            iny
            bne L0A4E
            bit LC082
            jmp LBC0D
L0A69       ldy #$80
            ldx #$FF
L0A6D       inx
            lda VDSLST,X
            and #$7F
            cmp #$2D
            beq L0A7E
            cmp #$0D
            bne L0A6D
            jmp L0892
L0A7E       lda #$00
            sta VDSLST,X
            inx
            lda VDSLST,X
            and #$7F
L0A89       pha
            lda #$00
            sta VDSLST,X
            pla
            jsr L08ED
            cmp #$72
            bne L0A9C
            sty L0ABD
            beq L0AAF
L0A9C       cmp #$73
            bne L0AA5
            sty L0ABC
            beq L0AAF
L0AA5       cmp #$6F
            bne L0AB2
            sty L0ABB
            jsr L0ABE
L0AAF       inc L0ABA
L0AB2       inx
            lda VDSLST,X
            bne L0A89
            beq L0A6D
L0ABA       .byte $00
L0ABB       .byte $00
L0ABC       .byte $00
L0ABD       .byte $00
L0ABE       ldy #$00
            inx
L0AC1       inx
            lda VDSLST,X
            and #$7F
            beq L0AD8
            cmp #$0D
            beq L0AD8
            iny
            sta L1A6F,Y
            lda #$00
            sta VDSLST,X
            beq L0AC1
L0AD8       sty L1A6F
            cpy #$00
            beq L0AE2
            ldy #$80
            rts
L0AE2       ldx #<L0AEF
            ldy #>L0AEF
            jsr L0803
            jsr LFD8E
            jmp L0878
L0AEF       .byte 'No object file name specified with -o'
            .byte $00
L0B15       lda L1A1E
            sta L0B6F
            lda L1A1F
            sta L0B70
            ldy #$00
            ldx #$04
L0B25       lda #$30
            sta L0B71
L0B2A       lda L0B6F
            cmp L0B65,X
            lda L0B70
            sbc L0B69+1,X
            bcc L0B49
            sta L0B70
            lda L0B6F
            sbc L0B65,X
            sta L0B6F
            inc L0B71
            bne L0B2A
L0B49       lda L0B71
            cpx #$00
            beq L0B58
            cmp #$30
            bne L0B58
            cpy #$00
            beq L0B5C
L0B58       sta L0B72,Y
            iny
L0B5C       dex
            bpl L0B25
            lda #$00
            sta L0B72,Y
            rts
L0B65       ora (DOSVEC,X)
            .byte $64
            inx
L0B69       bpl L0B6B
L0B6B       .byte $00,$00,$03,$27
L0B6F       .byte $00
L0B70       .byte $00
L0B71       .byte $00
L0B72       .byte $00,$00,$00,$00,$00,$00
L0B78       ldy #$00
            sty L1A1E
            sty L1A1F
            dey
L0B81       iny
            lda (L0086),Y
            cmp #$30
            bcc L0B8C
            cmp #$3A
            bcc L0B81
L0B8C       ldx #$00
            dey
L0B8F       lda (L0086),Y
            and #$0F
            beq L0BB0
            sta L0B71
L0B98       clc
            lda L0B65,X
            adc L1A1E
            sta L1A1E
            lda L0B69+1,X
            adc L1A1F
            sta L1A1F
            dec L0B71
            bne L0B98
L0BB0       inx
            dey
            bpl L0B8F
            rts
L0BB5       pha
            jsr L153A
            clc
            pla
            adc L0084
            sta L0086
            lda L0085
            adc #$00
            sta L0087
            jmp L0B78
L0BC8       sec
            lda #$00
            sbc L1A1E
            sta L1A1E
            lda #$00
            sbc L1A1F
            sta L1A1F
            rts
L0BDA       lda L1A1B
            cmp #$14
            bcc L0BE4
            jsr L0C3D
L0BE4       inc L1A1B
            jsr L153A
            ldy #$00
L0BEC       lda #$20
            sta (L0084),Y
            iny
            cpy #$8C
            bne L0BEC
L0BF5       jsr L0C07
            ldy #$00
            sta (L0084),Y
            inc L0084
            bne L0C02
            inc L0085
L0C02       cmp #$0D
            bne L0BF5
            rts
L0C07       ldy #$00
            lda (LOMEM),Y
            pha
            inc LOMEM
            bne L0C12
            inc LOMEM+1
L0C12       lda L09F6
            bne L0C1A
            dec L09F7
L0C1A       dec L09F6
            lda L09F6
            ora L09F7
            bne L0C39
            jsr L090B
            lda L09F6
            ora L09F7
            bne L0C39
            pla
            lda #$0D
            pha
            ldx #$FF
            stx L1A1A
L0C39       pla
            and #$7F
            rts
L0C3D       jsr L1519
            ldy #$FF
L0C42       iny
            lda (L0082),Y
            and #$7F
            sta LAE74,Y
            cmp #$0D
            bne L0C42
            dec L1A1B
            lda L1A1C
            sta L1A1D
            jsr L155B
            jmp L0948
L0C5D       stx L0C91
            sty L0C92
            lda L1A1B
            cmp #$14
            beq L0C70
            jsr L156D
            jmp L0C73
L0C70       jsr L0C3D
L0C73       inc L1A1B
            jsr L153A
            ldx L0C91
            ldy L0C92
L0C7F       stx L0086
            sty L0087
            ldy #$00
L0C85       lda (L0086),Y
            sta (L0084),Y
            cmp #$0D
            beq L0C90
            iny
            bne L0C85
L0C90       rts
L0C91       .byte $00
L0C92       .byte $00
L0C93       sty L0C92
            jsr L0B15
            ldy L0C92
            ldx #$00
L0C9E       lda L0B72,X
            beq L0CA9
            sta (L0084),Y
            inx
            iny
            bne L0C9E
L0CA9       lda #$0D
            sta (L0084),Y
            rts
L0CAE       lda L1A1B
            beq L0CB9
            jsr L0C3D
            jmp L0CAE
L0CB9       rts
L0CBA       jsr L153A
            ldy #$00
            sty L1388
            lda (L0084),Y
            cmp #$3B
            bne L0CD5
            bit L0ABC
            bpl L0CD1
L0CCD       jsr L156D
            rts
L0CD1       dec L1A1B
            rts
L0CD5       bit L0ABD
            bpl L0CE4
            jsr L139D
            bcs L0CCD
            jsr L0D03
            bcs L0CD1
L0CE4       jsr L0D08
            bcs L0CCD
            jsr L0D19
            bcs L0CCD
            jsr L0F7B
            bcs L0CCD
            jsr L0DA2
            bcs L0CCD
            jsr L0E2B
            bcs L0CCD
            jsr L0FD5
            jmp L0CCD
L0D03       ldx #$02
            jmp L15A5
L0D08       ldx #$03
            jsr L15A5
            bcs L0D10
            rts
L0D10       ldx #$73
            ldy #$0D
            jsr L0C7F
            sec
            rts
L0D19       ldx #$04
            jsr L15A5
            bcs L0D21
            rts
L0D21       ldx #$38
            ldy #$0D
            jsr L0C7F
            ldx #$4F
            ldy #$0D
            jsr L0C5D
            ldx #$66
            ldy #$0D
            jsr L0C5D
            sec
            rts
            .byte ' include oplib.main1.i'
            .byte $0D
            .byte ' include oplib.main2.i'
            .byte $0D
            .byte '_lomem equ *'
            .byte $0D
            .byte ' include oplib.pascal.i'
            .byte $0D
L0D8B       ldx #$06
            jsr L15A5
            bcs L0D9E
            ldx #$07
            jsr L15A5
            bcs L0D9A
            rts
L0D9A       lda #$01
            sec
            rts
L0D9E       lda #$02
            sec
            rts
L0DA2       jsr L0D8B
            bcs L0DA8
            rts
L0DA8       sta L0E18
            jsr L1592
            ldx #$08
            jsr L15A5
            bcs L0DBA
            jsr L156D
            clc
            rts
L0DBA       lda #$06
            jsr L0BB5
            lda L1A1E
            sta L1A20
            lda L1A1F
            sta L1A21
            jsr L1592
            ldx #$00
            jsr L15A5
            bcs L0DDD
            jsr L156D
            jsr L156D
            clc
            rts
L0DDD       lda #$06
            jsr L0BB5
            dec L1A1B
            dec L1A1B
            lda L0E18
            cmp #$01
            beq L0DF6
            ldx #<L0E19
            ldy #>L0E19
            jmp L0DFA
L0DF6       ldx #$22
            ldy #$0E
L0DFA       jsr L0C7F
            ldy #$08
            jsr L0C93
            lda #$2C
            sta (L0084),Y
            iny
            lda L1A20
            sta L1A1E
            lda L1A21
            sta L1A1F
            jsr L0C93
            sec
            rts
L0E18       .byte $00
L0E19       .byte ' _opgcw '
            .byte $0D
            .byte ' _opgcb '
            .byte $0D
L0E2B       jsr L0D8B
            bcs L0E31
            rts
L0E31       pha
            jsr L1592
            pla
            sta L0E18
            cmp #$01
            beq L0E6D
            ldx #$0E
            jsr L15A5
            bcc L0E4F
            jsr L1592
            lda #$80
            sta L0F2D
            jmp L0E54
L0E4F       lda #$00
            sta L0F2D
L0E54       ldx #$0B
L0E56       jsr L15A5
            bcs L0E72
L0E5B       jsr L156D
            bit L0F2D
            bpl L0E6B
            jsr L156D
            lda #$00
            sta L0F2D
L0E6B       clc
            rts
L0E6D       ldx #$0A
            jmp L0E56
L0E72       jsr L1592
            ldx #$00
            jsr L15A5
            bcs L0E82
            jsr L156D
            jmp L0E5B
L0E82       lda #$06
            jsr L0BB5
            lda L1A1E
            sta L1A20
            lda L1A1F
            sta L1A21
            jsr L1592
            ldx #$00
            jsr L15A5
            bcs L0EA6
            jsr L156D
            jsr L156D
            jmp L0E5B
L0EA6       dec L1A1B
            dec L1A1B
            dec L1A1B
            lda #$06
            jsr L0BB5
            lda L0E18
            cmp #$01
            bne L0EC2
            ldx #$24
            ldy #$0F
            jmp L0ED6
L0EC2       bit L0F2D
            bpl L0ED2
            ldx #<L135E
            ldy #>L135E
            jsr L0C7F
            ldy #$07
            bne L0EDB
L0ED2       ldx #$1B
            ldy #$0F
L0ED6       jsr L0C7F
            ldy #$08
L0EDB       jsr L0C93
            lda #$2C
            sta (L0084),Y
            iny
            lda L1A20
            sta L1A1E
            lda L1A21
            sta L1A1F
            jsr L0C93
            bit L0F2D
            bmi L0EF9
            sec
            rts
L0EF9       dec L1A1B
            lda #$2C
            sta (L0084),Y
            iny
            lda #$30
            sta (L0084),Y
            iny
            lda #$2C
            sta (L0084),Y
            iny
            lda #$32
            sta (L0084),Y
            iny
            lda #$0D
            sta (L0084),Y
            lda #$00
            sta L0F2D
            sec
            rts
            .byte ' _opsgw '
            .byte $0D
            .byte ' _opsgb '
            .byte $0D
L0F2D       .byte $00
L0F2E       dec L1A1B
            ldx #$14
            jsr L15A5
            bcs L0F39
            rts
L0F39       lda #$07
            jsr L0BB5
            jsr L1592
            ldx #$14
            jsr L15A5
            bcc L0F76
            lda L1A1E
            sta L1A20
            lda L1A1F
            sta L1A21
            lda #$07
            jsr L0BB5
            clc
            lda L1A1E
            adc L1A20
            sta L1A1E
            lda L1A1F
            adc L1A21
            sta L1A1F
            ldy #$07
            jsr L0C93
            dec L1A1B
            sec
            rts
L0F76       jsr L156D
            clc
            rts
L0F7B       ldx #$05
            jsr L15A5
            bcs L0F83
            rts
L0F83       lda #$06
            jsr L0BB5
            lda L1A1E
            ora L1A1F
            bne L0F95
            pla
            pla
            jmp L0CD1
L0F95       lda L1A1E
            sta L1A20
            lda L1A1F
            sta L1A21
            jsr L1592
            dec L1A1B
            ldx #$00
            jsr L15A5
            bcs L0FB6
            inc L1A1B
            jsr L156D
            clc
            rts
L0FB6       lda #$06
            jsr L0BB5
            sec
            lda L1A1E
            sbc L1A20
            sta L1A1E
            lda L1A1F
            sbc L1A21
            sta L1A1F
            ldy #$06
            jsr L0C93
            sec
            rts
L0FD5       ldx #$0E
            jsr L15A5
            bcc L0FFD
            jsr L1592
            ldx #$08
            jsr L15A5
            bcs L0FEB
            jsr L156D
            clc
            rts
L0FEB       dec L1A1B
            lda #$06
            jsr L0BB5
            jsr L0BC8
            ldy #$06
            jsr L0C93
            sec
            rts
L0FFD       ldx #$0C
            jsr L15A5
            bcc L1007
            jmp L101C
L1007       ldx #$0D
            jsr L15A5
            bcc L1011
            jmp L1080
L1011       ldx #$06
            jsr L15A5
            bcc L101B
            jmp L109C
L101B       rts
L101C       jsr L1592
            ldx #$08
            jsr L15A5
            bcc L103A
            lda #$06
            jsr L0BB5
L102B       ldx #$A0
            ldy #$10
            jsr L0C7F
            ldy #$07
            jsr L0C93
            jmp L0F2E
L103A       lda #$30
            sta L109F
L103F       ldx #$0B
            jsr L15A5
            bcc L107B
            jsr L1592
            ldx #$00
            jsr L15A5
            bcc L1078
            lda #$06
            jsr L0BB5
            ldx #$A8
            ldy #$10
            jsr L0C7F
            ldy #$07
            jsr L0C93
            lda #$2C
            sta (L0084),Y
            iny
            lda L109F
            sta (L0084),Y
            iny
            lda #$0D
            sta (L0084),Y
            dec L1A1B
            dec L1A1B
            sec
            rts
L1078       jsr L156D
L107B       jsr L156D
            clc
            rts
L1080       jsr L1592
            ldx #$08
            jsr L15A5
            bcc L1095
            lda #$06
            jsr L0BB5
            jsr L0BC8
            jmp L102B
L1095       lda #$31
            sta L109F
            bne L103F
L109C       jmp L10E1
L109F       .byte $00
            .byte ' _opac '
            .byte $0D
            .byte ' _opag '
            .byte $0D
L10B0       lda L1A1E
            pha
            lda L1A1F
            pha
            lda #$07
            jsr L0BB5
            ldy #$00
L10BF       lda (L0084),Y
            cmp #$2C
            beq L10C8
            iny
            bne L10BF
L10C8       iny
            lda (L0084),Y
            sta L10E0
            ldx L1A1E
            ldy L1A1F
            pla
            sta L1A1F
            pla
            sta L1A1E
            lda L10E0
            rts
L10E0       .byte $00
L10E1       jsr L1592
            lda L1A1D
            sta L1A22
            lda #$00
            sta L1A2D
            ldx #$15
            jsr L15A5
            bcs L10F9
            jmp L1207
L10F9       jsr L10B0
            sta L1A2A
            sta L1A2B
            stx L1A24
            stx L1A26
            sty L1A25
            sty L1A27
            jsr L1592
            ldx #$15
            jsr L15A5
            bcc L112A
            inc L1A2D
            jsr L10B0
            sta L1A2B
            stx L1A26
            sty L1A27
            jsr L1592
L112A       ldx #$0B
            jsr L15A5
            bcs L1134
            jmp L11FD
L1134       jsr L1592
            ldx #$00
            jsr L15A5
            bcs L1141
            jmp L11FD
L1141       lda #$06
            jsr L0BB5
            lda L1A1E
            sta L1A20
            lda L1A1F
            sta L1A21
            jsr L1592
            ldx #$00
            jsr L15A5
            bcs L115F
            jmp L11FD
L115F       lda #$06
            jsr L0BB5
            ldx #<L136F
            ldy #>L136F
            lda L1A2D
            beq L1171
            ldx #<L1377
            ldy #>L1377
L1171       jsr L0C7F
            ldy #$07
            lda L1A2D
            beq L117C
            iny
L117C       jsr L0C93
            lda #$2C
            sta (L0084),Y
            lda L1A20
            sta L1A1E
            lda L1A21
            sta L1A1F
            iny
            jsr L0C93
            lda #$2C
            sta (L0084),Y
            iny
            lda L1A26
            sta L1A1E
            lda L1A27
            sta L1A1F
            jsr L0C93
            lda #$2C
            sta (L0084),Y
            iny
            lda L1A2D
            beq L11C5
            lda L1A24
            sta L1A1E
            lda L1A25
            sta L1A1F
            jsr L0C93
            lda #$2C
            sta (L0084),Y
            iny
L11C5       lda L1A2B
            sta (L0084),Y
            lda L1A2D
            beq L11DA
            iny
            lda #$2C
            sta (L0084),Y
            iny
            lda L1A2A
            sta (L0084),Y
L11DA       iny
            lda #$0D
            sta (L0084),Y
            sec
            lda L1A1B
            sbc #$04
            sta L1A1B
            lda L1A2D
            beq L11F0
            dec L1A1B
L11F0       sec
            rts
L11F2       ldy L1A22
            sty L1A1D
            jsr L156D
            clc
            rts
L11FD       ldy L1A22
            iny
            sty L1A1D
            jsr L1592
L1207       lda #$00
            sta L1A2D
            sta L1380
            sta L1381
            sta L1A23
            lda #$80
            sta L1388
            lda #$30
            sta L1A2A
            sta L1A2B
            jsr L156D
L1225       jsr L1592
            inc L1A23
            ldx #$15
            jsr L15A5
            bcc L125C
            inc L1A2D
            ldx L1A2D
            cpx #$03
            bcc L123F
            jmp L11F2
L123F       jsr L10B0
            stx L0C91
            ldx L1A2D
            dex
            sta L1A2A,X
            txa
            asl
            tax
            lda L0C91
            sta L1382,X
            tya
            sta L1383,X
            jmp L1225
L125C       ldx #$14
            jsr L15A5
            bcc L126E
            lda #$07
            jsr L0BB5
            jsr L1389
            jmp L1225
L126E       ldx #$08
            jsr L15A5
            bcc L1280
            lda #$06
            jsr L0BB5
            jsr L1389
            jmp L12BA
L1280       ldx #$0B
            jsr L15A5
            bcs L128A
            jmp L11F2
L128A       inc L1A23
            jsr L1592
            ldx #$00
            jsr L15A5
            bcs L129A
            jmp L11F2
L129A       lda #$06
            jsr L0BB5
            lda L1A2D
            cmp #$02
            bcc L12A9
            jmp L11F2
L12A9       asl
            tax
            lda L1A1E
            sta L1382,X
            lda L1A1F
            sta L1383,X
            inc L1A2D
L12BA       jsr L1592
            inc L1A23
            ldx #$00
            jsr L15A5
            bcs L12CA
            jmp L11F2
L12CA       lda #$06
            jsr L0BB5
            ldx #<L135E
            ldy #>L135E
            lda L1A2D
            cmp #$02
            bcc L12DE
            ldx #<L1366
            ldy #>L1366
L12DE       jsr L0C7F
            ldy #$07
            lda L1A2D
            cmp #$02
            bcc L12EB
            iny
L12EB       jsr L0C93
            lda #$2C
            sta (L0084),Y
            iny
            lda L1382
            sta L1A1E
            lda L1383
            sta L1A1F
            jsr L0C93
            lda #$2C
            sta (L0084),Y
            lda L1A2D
            cmp #$02
            bcc L1321
            iny
            lda L1384
            sta L1A1E
            lda L1385
            sta L1A1F
            jsr L0C93
            lda #$2C
            sta (L0084),Y
L1321       iny
            lda L1380
            sta L1A1E
            lda L1381
            sta L1A1F
            jsr L0C93
            lda #$2C
            sta (L0084),Y
            iny
            lda L1A2A
            sta (L0084),Y
            lda L1A2D
            cmp #$02
            bcc L134D
            iny
            lda #$2C
            sta (L0084),Y
            iny
            lda L1A2B
            sta (L0084),Y
L134D       iny
            lda #$0D
            sta (L0084),Y
            sec
            lda L1A1B
            sbc L1A23
            sta L1A1B
            sec
            rts
L135E       .byte ' _opgc '
            .byte $0D
L1366       .byte ' _opggc '
            .byte $0D
L136F       .byte ' _opgg '
            .byte $0D
L1377       .byte ' _opggg '
            .byte $0D
L1380       .byte $00
L1381       .byte $00
L1382       .byte $00
L1383       .byte $00
L1384       .byte $00
L1385       .byte $00,$00,$00
L1388       .byte $00
L1389       clc
            lda L1A1E
            adc L1380
            sta L1380
            lda L1A1F
            adc L1381
            sta L1381
            rts
L139D       jsr L14ED
            bcs L13A3
            rts
L13A3       sta L1504
            lda L1A1D
            sta L1A22
            lda #$00
            sta L1507
            sta L1508
            jsr L1592
            ldx #$01
            jsr L15A5
            bcc L13D2
            lda #$06
            jsr L0BB5
            lda L1A1E
            sta L1507
            lda L1A1F
            sta L1508
            jsr L1592
L13D2       ldx #$08
            jsr L15A5
            bcc L13DC
            jmp L146F
L13DC       ldx #$0B
            jsr L15A5
            bcs L13E6
            jmp L14E1
L13E6       jsr L1592
            ldx #$00
            jsr L15A5
            bcs L13F3
            jmp L14E1
L13F3       lda #$06
            jsr L0BB5
            lda L1A1E
            sta L1505
            lda L1A1F
            sta L1506
            jsr L1592
            ldx #$00
            jsr L15A5
            bcs L1411
            jmp L14E1
L1411       lda #$06
            jsr L0BB5
            ldx #<L1510
            ldy #>L1510
            jsr L0C7F
            ldy #$08
            jsr L0C93
            lda #$2C
            sta (L0084),Y
            iny
            lda L1505
            sta L1A1E
            lda L1506
            sta L1A1F
            jsr L0C93
            lda #$2C
            sta (L0084),Y
            iny
            lda L1507
            sta L1A1E
            lda L1508
            sta L1A1F
            jsr L0C93
            lda #$2C
            sta (L0084),Y
            iny
            lda L1504
            sta (L0084),Y
            iny
            lda #$0D
            sta (L0084),Y
            dec L1A1B
            dec L1A1B
            dec L1A1B
            lda L1507
            ora L1508
            beq L146D
            dec L1A1B
L146D       sec
            rts
L146F       lda #$06
            jsr L0BB5
            lda L1A1E
            sta L1505
            lda L1A1F
            sta L1506
            jsr L1592
            ldx #$00
            jsr L15A5
            bcc L14E1
            lda #$06
            jsr L0BB5
            sec
            lda L1505
            sbc L1507
            sta L1505
            lda L1506
            sbc L1508
            sta L1506
            lda L1504
            cmp #$30
            beq L14AF
            asl L1505
            rol L1506
L14AF       clc
            lda L1A1E
            adc L1505
            sta L1A1E
            lda L1A1F
            adc L1506
            sta L1A1F
            ldx #<L1509
            ldy #>L1509
            jsr L0C7F
            ldy #$06
            jsr L0C93
            dec L1A1B
            dec L1A1B
            lda L1507
            ora L1508
            beq L14DF
            dec L1A1B
L14DF       sec
            rts
L14E1       ldy L1A22
            dey
            sty L1A1D
            jsr L156D
            clc
            rts
L14ED       ldx #$0F
            jsr L15A5
            bcc L14F8
            lda #$30
            sec
            rts
L14F8       ldx #$10
            jsr L15A5
            bcs L1500
            rts
L1500       lda #$31
            sec
            rts
L1504       .byte $00
L1505       .byte $00
L1506       .byte $00
L1507       .byte $00
L1508       .byte $00
L1509       .byte ' _lga '
            .byte $0D
L1510       .byte ' _opiav '
            .byte $0D
L1519       lda #$84
            sta L0082
            lda #$A3
            sta L0083
            ldx L1A1C
L1524       cpx #$00
            beq L1539
            clc
            lda L0082
            adc #$8C
            sta L0082
            lda L0083
            adc #$00
            sta L0083
            dex
            jmp L1524
L1539       rts
L153A       lda #$84
            sta L0084
            lda #$A3
            sta L0085
            ldx L1A1D
L1545       cpx #$00
            beq L155A
            clc
            lda L0084
            adc #$8C
            sta L0084
            lda L0085
            adc #$00
            sta L0085
            dex
            jmp L1545
L155A       rts
L155B       inc L1A1C
            lda L1A1C
            cmp #$14
            bne L156A
            lda #$00
            sta L1A1C
L156A       jmp L153A
L156D       inc L1A1D
            lda L1A1D
            cmp #$14
            bne L157C
            lda #$00
            sta L1A1D
L157C       jmp L153A
            lda L1A1C
            beq L158A
            dec L1A1C
            jmp L1519
L158A       lda #$13
            sta L1A1C
            jmp L1519
L1592       lda L1A1D
            beq L159D
            dec L1A1D
            jmp L153A
L159D       lda #$13
            sta L1A1D
            jmp L153A
L15A5       txa
            asl
            tax
            lda L15E5,X
            sta L0086
            lda L15E5+1,X
            sta L0087
            ldy #$00
            lda (L0086),Y
            sta L15E4
L15B9       lda (L0084),Y
            cmp #$3B
            beq L15CE
            jsr L08ED
            iny
            cmp (L0086),Y
            bne L15E2
            cpy L15E4
            bne L15B9
            sec
            rts
L15CE       bit L1388
            bpl L15D8
            inc L1A23
            bne L15DB
L15D8       dec L1A1B
L15DB       jsr L1592
            ldy #$00
            beq L15B9
L15E2       clc
            rts
L15E4       .byte $00
L15E5       .word L1611
            .word L1617
            .word L161D
            .word L1623
            .word L1635
            .word L163C
            .word L1642
            .word L1648
            .word L164E
            .word L1654
            .word L165A
            .word L1660
            .word L1666
            .word L166C
            .word L1672
            .word L1678
            .word L167F
            .word L0000
            .word L0000
            .word L0000
            .word L1686
            .word L168D
L1611       .byte $05
            .byte ' _lga'
L1617       .byte $05
            .byte ' _min'
L161D       .byte $05
            .byte ' _max'
L1623       .byte $11
            .byte ' include stdlib.s'
L1635       .byte $06
            .byte '_lomem'
L163C       .byte $05
            .byte ' _fld'
L1642       .byte $05
            .byte ' _stw'
L1648       .byte $05
            .byte ' _stb'
L164E       .byte $05
            .byte ' _lcw'
L1654       .byte $05
            .byte ' _lla'
L165A       .byte $05
            .byte ' _ldb'
L1660       .byte $05
            .byte ' _ldw'
L1666       .byte $05
            .byte ' _adi'
L166C       .byte $05
            .byte ' _sbi'
L1672       .byte $05
            .byte ' _ngi'
L1678       .byte $06
            .byte ' _ndxb'
L167F       .byte $06
            .byte ' _ndxw'
L1686       .byte $06
            .byte ' _opac'
L168D       .byte $06
            .byte ' _opag'
L1694       tax
            lda #$3A
            jsr L0885
            lda CASINI+1
            pha
            lda CASINI
            pha
            lda #<L16ED
            sta CASINI
            lda #>L16ED
            sta CASINI+1
            ldy #$00
            sty L1955
L16AD       txa
            cmp (CASINI),Y
            beq L16CF
L16B2       inc CASINI
            bne L16B8
            inc CASINI+1
L16B8       lda (CASINI),Y
            bne L16B2
            inc CASINI
            bne L16C2
            inc CASINI+1
L16C2       lda CASINI
            cmp #$3C
            lda CASINI+1
            sbc #$19
            bcc L16AD
            stx L1955
L16CF       inc CASINI
            bne L16D5
            inc CASINI+1
L16D5       ldx CASINI
            ldy CASINI+1
            pla
            sta CASINI
            pla
            sta CASINI+1
            jsr L0803
            lda L1955
            beq L16EA
            jsr LFDDA
L16EA       jmp LFD8E
L16ED       .byte $00
            .byte 'No Error'
            .byte $00,$01
            .byte 'Bad System Call Number'
            .byte $00,$04
            .byte 'Bad System Call Parameter Count'
            .byte $00,$27
            .byte 'I/O Error'
            .byte $00
            .byte '(No Device Connected'
            .byte $00
            .byte '+Disk Write Protected'
            .byte $00
            .byte '@Invalid Pathname'
            .byte $00
            .byte 'BMaximum Number of Files Open'
            .byte $00
            .byte 'CInvalid Reference Number'
            .byte $00
            .byte 'DDirectory Not Found'
            .byte $00
            .byte 'EVolume Not Found'
            .byte $00
            .byte 'FFile Not Found'
            .byte $00
            .byte 'GDuplicate Filename'
            .byte $00
            .byte 'HVolume Full'
            .byte $00
            .byte 'IVolume Header Full'
            .byte $00
            .byte 'JIncompatible File Format'
            .byte $00
            .byte 'KUnsupported Storage Type'
            .byte $00
            .byte 'LEnd of File Encountered'
            .byte $00
            .byte 'MPosition Out of Range'
            .byte $00
            .byte 'NFile Access Denied'
            .byte $00
            .byte 'PFile is Already Open'
            .byte $00
            .byte 'QDirectory is Damaged'
            .byte $00
            .byte 'RNot a ProDOS Volume'
            .byte $00
            .byte 'SParameter Out of Range'
            .byte $00
            .byte 'UVCB Table Full'
            .byte $00
            .byte 'VBad Buffer Address'
            .byte $00
            .byte 'WDuplicate Volume On-Line'
            .byte $00
            .byte 'ZFile is Damaged'
            .byte $00,$00
            .byte 'Unknown ProDOS Error: $'
            .byte $00
L1955       .byte $00
L1956       .byte 'OP'
            .byte $00
L1959       jsr L0826
            jsr L0892
            ldx #$FF
L1961       inx
            lda L0A43,X
            sta L1A6F,X
            cpx L0A43
            bne L1961
            lda #$00
            sta VDSLST
            sta VDSLST+1
            jsr L0892
            jsr L0A69
            ldx #$FF
L197D       inx
            lda L0A36,X
            sta L1A2E,X
            cpx L0A36
            bne L197D
            ldx #$00
            ldy #$00
            sty L1A1A
            sty L1A1B
            sty L1A1C
            sty L1A1D
L1999       lda VDSLST,X
            and #$7F
            beq L19B0
            cmp #$0D
            beq L19B0
            iny
            sta L1A2E,Y
            lda #$00
            sta VDSLST,X
            inx
            bne L1999
L19B0       cpy #$00
            beq L19B7
            sty L1A2E
L19B7       jsr L0892
            lda L08CF
            beq L19CC
            ldx #<L0A15
            ldy #>L0A15
            jsr L0803
            jsr LFD8E
            jmp L0878
L19CC       jsr L08F8
            jsr L0920
L19D2       jsr L0BDA
            jsr L0CBA
            bit L1A1A
            bpl L19D2
            jsr L0CAE
            bit L0ABC
            bpl L19E8
            jmp L0878
L19E8       ldy #$00
L19EA       lda L1A0C,Y
            beq L19F5
            sta VDSLST,Y
            iny
            bne L19EA
L19F5       ldx #$00
L19F7       inx
            lda L1A6F,X
            sta VDSLST,Y
            iny
            cpx L1A6F
            bne L19F7
            lda #$8D
            sta VDSLST,Y
            jmp L0A49
L1A0C       .byte 'as op.out -o '
            .byte $00
;
         
