; 
            icl 'LIB.inc'
;
; Start of code
;
            org $8C05
;
            jmp L94B6
            jmp L915E
            jmp L9131
            jmp L9170
            jmp L93C7
            jmp L93CE
            jmp L917D
            jmp L9852
            jmp L987D
            jmp L919D
            jmp LB7C4
            jmp L90AB
            jmp L91B1
            jmp LB4A9
            jmp L93E3
            jmp L93F6
            jmp L940E
            jmp L9417
            jmp L938D
            jmp LB4EF
            jmp L9966
            jmp LAA69
            jmp LA05D
            jmp L993A
            jmp L994F
            jmp LA35D
            jmp L9FC9
            jmp L9980
            jmp L9987
            jmp L9993
            jmp L999F
            jmp L99AB
            jmp LB77B
            jmp L92E7
            jmp L91CE
            jmp L91F2
            jmp L98AA
            jmp L9FC4
            jmp L9D97
            jmp LA5EB
            jmp LA070
            jmp LA377
            jmp LA395
            jmp LA665
            jmp L9F46
            jmp L9F53
            jmp L9F60
            jmp L9F6D
            jmp L9F7A
            jmp L9F87
            jmp L937A
            jmp L9281
            jmp L9F22
            jmp L9E44
            jmp LA0AA
            jmp L9292
            jmp L92B8
            jmp L92CF
            jmp LA931
            jmp LA94B
            jmp LAAE8
            jmp LA89C
            jmp L92A4
            jmp DOSINI
            jmp LB8A6
            jmp LB97E
            jmp LB8FE
            jmp LB942
            jmp LB87E
            jmp L914F
            jmp L934F
            jmp L933D
            jmp LB85D
            jmp LB8BB
            jmp LB8DB
            jmp LB91F
            jmp LB852
            jmp LAC8F
            jmp LB7AE
            jmp LA2D0
            jmp LA2DD
            jmp LA2EA
            jmp LA304
            jmp LA311
            jmp LA2F7
            jmp LA400
            jmp L947E
            jmp L9446
            jmp LA3C5
            jmp LA3D2
            jmp L9462
            jmp LAE76
            jmp LB65E
            jmp LB534
            jmp LA80A
            jmp LA81F
            jmp LB3C8
            jmp LB041
            jmp LB1EC
            jmp LAE09
            jmp LA437
            jmp LA3DF
            jmp L949A
            jmp L8DB7
            jmp LA475
            jmp L9254
            jmp L9240
            jmp L92AB
            jmp L94E1
            jmp L920B
            jmp L9271
            jmp L9146
            jmp L93A2
            jmp L921B
            jmp LB843
            jmp LB8C1
            jmp LB8CE
            jmp L9111
            jmp L912A
            jmp L93AB
            jmp L942A
            jmp LA7AF
            jmp L9361
            jmp L9394
            jmp LA72A
            jmp LA751
            jmp LA780
            jmp L9328
L8D85       dex
            dex
            lda #$01
            sta L0000,X
            lda #$00
            sta NGFLAG,X
            rts
L8D90       dex
            dex
            lda #$00
            sta L0000,X
            sta NGFLAG,X
            rts
L8D99       jsr L8D9F
            jmp LB921+1
L8D9F       ldx #$00
L8DA1       lda L8DFC,X
            sta LB900,X
            lda L8EFC,X
            sta LB9FE+2,X
            lda L8FFB+1,X
            sta LBB00,X
            inx
            bne L8DA1
            rts
L8DB7       ldx #$FF
            txs
            txa
            sta PORTB
            cli
            lda #$40
            sta NMIEN
            lda #$C1
            sta BRKKY
            lda #$BA
            sta BRKKY+1
            cld
            ldx #$10
L8DD1       jsr L8FC5
            txa
            clc
            adc #$10
            tax
            cpx #$80
            bne L8DD1
            lda DINDEX
            beq L8DF6
            lda #$45
            sta L0490
            lda #$3A
            sta L0491
            lda #$20
            sta L0492
            jsr L8FCE
            jsr L8FC5
L8DF6       jsr L8D9F
            jmp LB900
L8DFC       lda #$00
            sta LMARGN
L8E00       lda #$9B
            jsr LBAF2
L8E05       lda #$25
            jsr LBAF2
            lda #$20
            jsr LBAF2
            ldx #$80
            lda #$20
L8E13       sta L0500,X
            dex
            bpl L8E13
            jsr LBB23
            bmi L8E00
            ldx #$00
L8E20       lda L0500,X
            cmp #$9B
            beq L8E05
            cmp #$25
            beq L8E2F
            cmp #$20
            bne L8E36
L8E2F       inx
            cpx #$80
            bne L8E20
            beq L8E05
L8E36       cmp #$21
            bne L8E3D
            jmp (RUNAD)
L8E3D       cmp #$44
            bne L8E52
            lda L0501,X
            cmp #$4F
            bne L8E52
            lda L0502,X
            cmp #$53
            bne L8E52
            jmp (DOSVEC)
L8E52       ldy #$00
L8E54       lda L0500,X
            sta L0493,Y
            inx
            iny
            cpy #$10
            bne L8E54
            lda L0494
            cmp #$3A
            beq L8E6E
            lda L0495
            cmp #$3A
            bne L8E91
L8E6E       ldy #$00
L8E70       lda L0493,Y
            sta L0490,Y
            iny
            cpy #$10
            bne L8E70
            lda L0490
            and #$DF
            sta L0490
            jsr LBAD2
            bmi L8E8B
            jsr LBA26+2
L8E8B       jsr LBAC8+1
            pha
            bne L8ED6
L8E91       ldy #$02
L8E93       lda L0481,Y
            sta L0490,Y
            dey
            bpl L8E93
            jsr LBAD2
            bmi L8EA4
            jmp LBA26+2
L8EA4       jsr LBAC8+1
            ldy #$02
L8EA9       lda L0487,Y
            sta L0490,Y
            dey
            bpl L8EA9
            jsr LBAD2
            bmi L8EBA
            jmp LBA26+2
L8EBA       pha
            jsr LBAC8+1
            ldy #$02
L8EC0       lda L0484,Y
            sta L0490,Y
            dey
            bpl L8EC0
            ldx #$10
            jsr LBAD2
            bmi L8ED3
            jsr LBA26+2
L8ED3       jsr LBAC8+1
L8ED6       pla
            ldx #$00
            cmp #$01
            bne L8EDF
            ldx #$3D
L8EDF       cmp #$88
            bne L8EE5
            ldx #$10
L8EE5       cmp #$AA
            bne L8EEB
            ldx #$1E
L8EEB       cmp #$A5
            bne L8EF1
            ldx #$2D
L8EF1       cmp #$0C
            bne L8EF7
            ldx #$4D
L8EF7       cpx #$00
            bne L8F13
            pha
L8EFC       lsr
            lsr
            lsr
            lsr
            tax
            lda LBB9F,X
            sta LBB4F
            pla
            and #$0F
            tax
            lda LBB9F,X
            sta LBB50
            ldx #$00
L8F13       clc
            txa
            adc #$42
            tax
            lda #$00
            adc #$BB
            tay
            txa
            jsr LBB07
            jmp L8E00
            ldx #$10
            lda #$01
            sta L00B4
            sta L00B6
L8F2C       lda #$B0
            sta IOCB0+ICBAL,X
            lda #$00
            sta IOCB0+ICBAH,X
            lda #$02
            sta IOCB0+ICBLL,X
            lda #$00
            sta IOCB0+ICBLH,X
            lda #$07
            sta IOCB0+ICCOM,X
            jsr CIOV
            bpl L8F50
            cpy #$88
            beq L8FA9
            bne L8FB3
L8F50       lda #$FF
            cmp L00B0
            bne L8F5E
            cmp L00B1
            bne L8F5E
            sta L00B6
            beq L8F2C
L8F5E       lda L00B6
            bpl L8FB3
            lda #$B2
            sta IOCB0+ICBAL,X
            lda #$00
            sta IOCB0+ICBAH,X
            jsr CIOV
            bmi L8FB3
            lda L00B4
            beq L8F83
            lda L00B0
            sta RUNAD
            lda L00B1
            sta RUNAD+1
            lda #$00
            sta L00B4
L8F83       lda L00B0
            sta IOCB0+ICBAL,X
            lda L00B1
            sta IOCB0+ICBAH,X
            sec
            lda L00B2
            sbc L00B0
            sta IOCB0+ICBLL,X
            lda L00B3
            sbc L00B1
            sta IOCB0+ICBLH,X
            inc IOCB0+ICBLL,X
            bne L8FA4
            inc IOCB0+ICBLH,X
L8FA4       jsr CIOV
            bmi L8FAF
L8FA9       jsr LBAC8+1
            jmp (RUNAD)
L8FAF       cpy #$03
            beq L8FA9
L8FB3       tya
            pha
            ldx #$10
            jsr LBAC8+1
            jmp L8ED6
            pla
            pla
            pla
            pla
            cli
            jmp LB900
L8FC5       lda #$0C
            sta IOCB0+ICCOM,X
            jsr CIOV
            rts
L8FCE       ldx #$10
            lda #$03
            sta IOCB0+ICCOM,X
            lda #$90
            sta IOCB0+ICBAL,X
            lda #$04
            sta IOCB0+ICBAH,X
            lda #$04
            sta IOCB0+ICAX1,X
            lda #$00
            sta IOCB0+ICAX2,X
            jsr CIOV
            tya
            rts
L8FEE       pha
            ldx #$00
            lda #$0B
            sta IOCB0+ICCOM,X
            lda #$00
            sta IOCB0+ICBLL,X
L8FFB       sta IOCB0+ICBLH,X
            pla
            jsr CIOV
            rts
            ldx #$00
            sta IOCB0+ICBAL,X
            tya
            sta IOCB0+ICBAH,X
            lda #$09
            sta IOCB0+ICCOM,X
            lda #$80
            sta IOCB0+ICBLL,X
            lda #$00
            sta IOCB0+ICBLH,X
            jsr CIOV
            rts
L901F       ldx #$00
            lda #$05
            sta IOCB0+ICCOM,X
            lda #$00
            sta IOCB0+ICBAL,X
            lda #$05
            sta IOCB0+ICBAH,X
            lda #$80
            sta IOCB0+ICBLL,X
            lda #$00
            sta IOCB0+ICBLH,X
            jsr CIOV
            rts
            .byte 'Error Code -   '
            .byte $9B
            .byte 'Bad Load File'
            .byte $9B
            .byte 'File Not Found'
            .byte $9B
            .byte 'File Name Error'
            .byte $9B
            .byte 'Not a Load File'
            .byte $9B
            .byte 'Invailid Device'
            .byte $9B
            .byte '0123456789ABCDEF'
L90AB       .byte 'H'
            lda #$FF
            sta L0082
            sta L0083
            jsr LA7CA
            pla
            sta L0094
            lda L0000,X
            sta L0092
            lda NGFLAG,X
            sta L0093
            ldy #$01
            lda (L0092),Y
            cmp #$3A
            beq L90E5
            cmp #$9B
            beq L90D7
            iny
            lda (L0092),Y
            cmp #$3A
            beq L90E5
            ldx #$00
            ldx #$00
L90D7       lda L0487,X
            sta L0500,X
            inx
            cpx #$03
            bne L90D7
            jmp L90F8
L90E5       ldx #$00
            ldy #$00
            lda (L0092),Y
            cmp #$61
            bcc L90F8
            cmp #$7B
            bcs L90F8
            sec
            sbc #$20
            sta (L0092),Y
L90F8       ldy #$00
L90FA       lda (L0092),Y
            sta L0500,X
            iny
            inx
            cpy #$7F
            beq L9109
            cpy L0094
            bne L90FA
L9109       lda #$9B
            sta L0500,X
            jmp L8D99
L9111       lda NGFLAG,X
            bpl L9129
            sec
            lda #$00
            sbc L0000,X
            sta L0000,X
            lda #$00
            sbc NGFLAG,X
            sta NGFLAG,X
            bvc L9129
            lda #$06
            jmp L94E1
L9129       rts
L912A       lda L0000,X
            and #$1F
            sta L0000,X
            rts
L9131       clc
            lda CASINI,X
            adc L0000,X
            sta CASINI,X
            lda CASINI+1,X
            adc NGFLAG,X
            sta CASINI+1,X
            bvc L9143
            jmp L0803
L9143       inx
            inx
            rts
L9146       lda CASINI,X
            and L0000,X
            sta CASINI,X
            inx
            inx
            rts
L914F       inx
            inx
            inx
            inx
            lda L00FC,X
            cmp L00FE,X
            bne L915D
            lda L00FD,X
            cmp L00FF,X
L915D       rts
L915E       sta L0092
            sty L0093
            sec
            lda L0000,X
            sbc L0092
            sta L0092
            lda NGFLAG,X
            sbc L0093
            sta L0093
            rts
L9170       cmp L0092
            tya
            sbc L0093
            bcs L917C
            lda #$05
            jmp L94E1
L917C       rts
L917D       sta L0092
            sty L0093
            lda CASINI,X
            cmp L0000,X
            lda NGFLAG,X
            eor #$80
            sta L0094
            lda CASINI+1,X
            eor #$80
            sbc L0094
            bcc L9194
            rts
L9194       inx
            inx
            inx
            inx
            pla
            pla
            jmp (L0092)
L919D       clc
            adc LOMEM
            sta L0092
            tya
            adc LOMEM+1
            sta L0093
            ldy #$00
            lda (L0092),Y
            sec
            sbc #$01
            sta (L0092),Y
            rts
L91B1       clc
            adc LOMEM
            sta L0092
            tya
            adc LOMEM+1
            sta L0093
            ldy #$00
            lda (L0092),Y
            sec
            sbc #$01
            sta (L0092),Y
            bcs L91CD
            iny
            lda (L0092),Y
            sbc #$00
            sta (L0092),Y
L91CD       rts
L91CE       clc
            adc L0082
            sta L0082
            tya
            adc L0083
            sta L0083
            ldy #$04
            lda (LOMEM),Y
            pha
            dey
            lda (LOMEM),Y
            pha
            ldy #$01
            lda (LOMEM),Y
            pha
            iny
            lda (LOMEM),Y
            sta LOMEM+1
            pla
            sta LOMEM
            jsr LA7CA
            rts
L91F2       ldy #$00
            lda L0000,X
            cmp CASINI,X
            bne L9202
            lda NGFLAG,X
            cmp CASINI+1,X
            bne L9202
            ldy #$01
L9202       sty CASINI,X
            lda #$00
            sta CASINI+1,X
            inx
            inx
            rts
L920B       sta L0092
            sty L0093
            inx
            inx
            lda L00FE,X
            beq L9216
            rts
L9216       pla
            pla
            jmp (L0092)
L921B       sta L0092
L921D       ldy #$00
            lda (LOMEM),Y
            cmp L0092
            beq L9234
            iny
            lda (LOMEM),Y
            pha
            iny
            lda (LOMEM),Y
            sta LOMEM+1
            pla
            sta LOMEM
            jmp L921D
L9234       lda LOMEM
            sta L0082
            lda LOMEM+1
            sta L0083
            jsr LA7CA
            rts
L9240       clc
            adc LOMEM
            sta L0092
            tya
            adc LOMEM+1
            sta L0093
            clc
            ldy #$00
            lda (L0092),Y
            adc #$01
            sta (L0092),Y
            rts
L9254       clc
            adc LOMEM
            sta L0092
            tya
            adc LOMEM+1
            sta L0093
            clc
            ldy #$00
            lda (L0092),Y
            adc #$01
            sta (L0092),Y
            bcc L9270
            iny
            lda (L0092),Y
            adc #$00
            sta (L0092),Y
L9270       rts
L9271       lda (L0000,X)
            tay
            inc L0000,X
            bne L927A
            inc NGFLAG,X
L927A       lda (L0000,X)
            sty L0000,X
            sta NGFLAG,X
            rts
L9281       sta L0092
            sty L0093
            dex
            dex
            ldy #$00
            lda (L0092),Y
            sta L0000,X
            lda #$00
            sta NGFLAG,X
            rts
L9292       sta L0092
            sty L0093
            dex
            dex
            ldy #$00
            lda (L0092),Y
            sta L0000,X
            iny
            lda (L0092),Y
            sta NGFLAG,X
            rts
L92A4       sta LBBDC
            sty LBBDD
            rts
L92AB       dex
            dex
            clc
            adc LOMEM
            sta L0000,X
            tya
            adc LOMEM+1
            sta NGFLAG,X
            rts
L92B8       clc
            adc LOMEM
            sta L0092
            tya
            adc LOMEM+1
            sta L0093
            dex
            dex
            ldy #$00
            lda (L0092),Y
            sta L0000,X
            lda #$00
            sta NGFLAG,X
            rts
L92CF       clc
            adc LOMEM
            sta L0092
            tya
            adc LOMEM+1
            sta L0093
            dex
            dex
            ldy #$00
            lda (L0092),Y
            sta L0000,X
            iny
            lda (L0092),Y
            sta NGFLAG,X
            rts
L92E7       sta L0092
            sty L0093
            pla
            sta L0094
            pla
            sta L0095
            pla
            sta L0096
            pla
            sta L0097
            lda L0095
            pha
            lda L0094
            pha
            sec
            lda L0082
            sbc L0092
            sta L0082
            lda L0083
            sbc L0093
            sta L0083
            ldy #$01
            lda LOMEM
            sta (L0082),Y
            iny
            lda LOMEM+1
            sta (L0082),Y
            iny
            lda L0096
            sta (L0082),Y
            iny
            lda L0097
            sta (L0082),Y
            lda L0082
            sta LOMEM
            lda L0083
            sta LOMEM+1
            rts
L9328       clc
            adc L0082
            sta L0082
            tya
            adc L0083
            sta L0083
            dex
            dex
            lda L0082
            sta L0000,X
            lda L0083
            sta NGFLAG,X
            rts
L933D       cmp L0000,X
            tya
            sbc NGFLAG,X
            bvs L9347
            bmi L934A
            rts
L9347       bpl L934A
            rts
L934A       lda #$05
            jmp L94E1
L934F       cmp L0000,X
            tya
            sbc NGFLAG,X
            bvs L9359
            bpl L935C
            rts
L9359       bmi L935C
            rts
L935C       lda #$05
            jmp L94E1
L9361       ldy #$01
            lda L0000,X
            cmp CASINI,X
            bne L9371
            lda NGFLAG,X
            cmp CASINI+1,X
            bne L9371
            ldy #$00
L9371       sty CASINI,X
            lda #$00
            sta CASINI+1,X
            inx
            inx
            rts
L937A       sec
            lda #$00
            sbc L0000,X
            sta L0000,X
            lda #$00
            sbc NGFLAG,X
            sta NGFLAG,X
            bvc L938C
            jmp L0803
L938C       rts
L938D       lda L0000,X
            eor #$01
            sta L0000,X
            rts
L9394       inx
            inx
            lda L00FE,X
            and #$01
            beq L939F
            jmp L8D85
L939F       jmp L8D90
L93A2       lda CASINI,X
            ora L0000,X
            sta CASINI,X
            inx
            inx
            rts
L93AB       cmp L0000,X
            bne L93B9
            tya
            cmp NGFLAG,X
            bne L93B9
            lda #$05
            jmp L94E1
L93B9       sec
            lda L0000,X
            sbc #$01
            sta L0000,X
            lda NGFLAG,X
            sbc #$00
            sta NGFLAG,X
            rts
L93C7       dex
            dex
            sta L0000,X
            sty NGFLAG,X
            rts
L93CE       sec
            lda CASINI,X
            sbc L0000,X
            sta CASINI,X
            lda CASINI+1,X
            sbc NGFLAG,X
            sta CASINI+1,X
            bvc L93E0
            jmp L0803
L93E0       inx
            inx
            rts
L93E3       clc
            adc LOMEM
            sta L0092
            tya
            adc LOMEM+1
            sta L0093
            ldy #$00
            lda L0000,X
            sta (L0092),Y
            inx
            inx
            rts
L93F6       clc
            adc LOMEM
            sta L0092
            tya
            adc LOMEM+1
            sta L0093
            ldy #$00
            lda L0000,X
            sta (L0092),Y
            iny
            lda NGFLAG,X
            sta (L0092),Y
            inx
            inx
            rts
L940E       lda L0000,X
            sta (CASINI,X)
            inx
            inx
            inx
            inx
            rts
L9417       lda L0000,X
            sta (CASINI,X)
            inc CASINI,X
            bne L9421
            inc CASINI+1,X
L9421       lda NGFLAG,X
            sta (CASINI,X)
            inx
            inx
            inx
            inx
            rts
L942A       cmp L0000,X
            bne L9438
            tya
            cmp NGFLAG,X
            bne L9438
            lda #$05
            jmp L94E1
L9438       clc
            lda L0000,X
            adc #$01
            sta L0000,X
            lda NGFLAG,X
            adc #$00
            sta NGFLAG,X
            rts
L9446       ldy #$00
            lda CASINI,X
            cmp L0000,X
            lda CASINI+1,X
            sbc NGFLAG,X
            bpl L9454
            ldy #$01
L9454       tya
            bvc L9459
            eor #$01
L9459       sta CASINI,X
            lda #$00
            sta CASINI+1,X
            inx
            inx
            rts
L9462       ldy #$00
            lda CASINI,X
            cmp L0000,X
            lda CASINI+1,X
            sbc NGFLAG,X
            bmi L9470
            ldy #$01
L9470       tya
            bvc L9475
            eor #$01
L9475       sta CASINI,X
            lda #$00
            sta CASINI+1,X
            inx
            inx
            rts
L947E       ldy #$00
            lda L0000,X
            cmp CASINI,X
            lda NGFLAG,X
            sbc CASINI+1,X
            bpl L948C
            ldy #$01
L948C       tya
            bvc L9491
            eor #$01
L9491       sta CASINI,X
            lda #$00
            sta CASINI+1,X
            inx
            inx
            rts
L949A       ldy #$00
            lda L0000,X
            cmp CASINI,X
            lda NGFLAG,X
            sbc CASINI+1,X
            bmi L94A8
            ldy #$01
L94A8       tya
            bvc L94AD
            eor #$01
L94AD       sta CASINI,X
            lda #$00
            sta CASINI+1,X
            inx
            inx
            rts
L94B6       sta L0084
            sty L0085
            lda #$00
            tay
            sta (L0084),Y
            iny
            sta (L0084),Y
            clc
            lda L0084
            adc #$02
            sta L008A
            lda L0085
            adc #$00
            sta L008B
            lda #$00
            sta LBB0E
            sta LBBDC
            sta LBBDD
            sta LBBC1
            sta LBBC2
            rts
L94E1       pha
            jsr L94FD
            pla
            asl
            tay
            lda L9571+1,Y
            sta L0092
            lda L9573,Y
            sta L0093
            jsr L9563
            lda #$9B
            jsr L9835
            jmp L8DB7
L94FD       jsr L950B
            lda #$3A
            jsr L9835
            lda #$20
            jsr L9835
            rts
L950B       lda LBBDC
            ora LBBDD
            bne L952E
            lda #$43
            sta L0092
            lda #$95
            sta L0093
            jsr L9563
            sec
            lda L01FE
            sbc #$02
            tax
            lda L01FF
            sbc #$00
            jsr L96BD
            rts
L952E       lda #$55
            sta L0092
            lda #$95
            sta L0093
            jsr L9563
            ldx LBBDC
            ldy LBBDD
            jsr L966C
            rts
            .byte $11
            .byte 'stop at address $'
            .byte $0D
            .byte 'stop at line '
L9563       ldy #$00
            lda (L0092),Y
            beq L9573
            tax
L956A       iny
            lda (L0092),Y
            jsr L9835
            dex
L9571       bne L956A
L9573       rts
            .word L958E
            .word L959F
            .word L95B1
            .word L95BD
            .word L95CB
            .word L95D7
            .word L95EB
            .word L95FD
            .word L9609
            .word L9618
            .word L9626
            .word L963A
            .word L9654
L958E       .byte $10
            .byte 'case index error'
L959F       .byte $11
            .byte 'array index error'
L95B1       .byte $0B
            .byte 'input error'
L95BD       .byte $0D
            .byte 'file not open'
L95CB       .byte $0B
            .byte 'range error'
L95D7       .byte $13
            .byte 'arithmetic overflow'
L95EB       .byte $11
            .byte 'pathname too long'
L95FD       .byte $0B
            .byte 'end of file'
L9609       .byte $0E
            .byte 'cannot dispose'
L9618       .byte $0D
            .byte 'heap overflow'
L9626       .byte $13
            .byte 'too many open files'
L963A       .byte $19
            .byte 'cannot read from "output"'
L9654       .byte $17
            .byte 'cannot write to "input"'
L966C       stx L0092
            sty L0093
            ldx #$04
L9672       lda L0092
            cmp L96B4,X
            lda L0093
            sbc L96B8,X
            bcs L9684
            dex
            bne L9672
            jmp L96AD
L9684       ldy #$00
L9686       lda L0092
            cmp L96B4,X
            lda L0093
            sbc L96B8,X
            bcc L96A4
            lda L0092
            sbc L96B4,X
            sta L0092
            lda L0093
            sbc L96B8,X
            sta L0093
            iny
            jmp L9686
L96A4       tya
            ora #$30
            jsr L9835
            dex
            bne L9684
L96AD       lda L0092
            ora #$30
            jsr L9835
L96B4       rts
            asl
            .byte $64
            inx
L96B8       bpl L96BA
L96BA       .byte $00,$03,$27
L96BD       jsr L96C4
            txa
            jmp L96C4
L96C4       pha
            lsr
            lsr
            lsr
            lsr
            jsr L96CD
            pla
L96CD       and #$0F
            ora #$30
            cmp #$3A
            bcc L96D7
            adc #$06
L96D7       jmp L9835
            rts
L96DB       tya
            pha
            jsr L94FD
            lda #$9B
            jsr L9835
            pla
            pha
            jsr L96C4
            lda #$20
            jsr L9835
            pla
            ldx #$03
L96F2       cmp L9710,X
            beq L9700
            inx
            inx
            inx
            cpx #$5A
            bne L96F2
            ldx #$00
L9700       lda L9711,X
            sta L0092
            lda L9712,X
            sta L0093
            jsr L9563
            jmp L8DB7
L9710       .byte $00
L9711       .byte $3A
L9712       .byte $97,$82,$47,$97
            sta OLDCOL
            .byte $97
            txa
            .byte $73,$97
            ldy #$82
            .byte $97
            lda (L0095,X)
            .byte $97
            ldx #$AE
            .byte $97,$A3
            clv
            .byte $97
            ldy L00CD
            .byte $97
            lda L00E6
            .byte $97,$A7
            inc L0097,X
            tay
            .byte $02
            tya
            lda #$17
            tya
            tax
            rol L0098
            .byte $0C
            .byte '- error code'
            .byte $13
            .byte 'non-existent device'
            .byte $17
            .byte 'device or file not open'
            .byte $0E
            .byte 'device timeout'
            .byte $12
            .byte 'disk drive # error'
            .byte $18
            .byte 'too many open disk files'
            .byte $09
            .byte 'disk full'
            .byte $14
            .byte 'fatal disk I/O error'
            .byte $18
            .byte 'internal file # mismatch'
            .byte $0F
            .byte 'file name error'
            .byte $0B
            .byte 'file locked'
            .byte $14
            .byte 'invalid disk command'
            .byte $0E
            .byte 'directory full'
            .byte $0E
            .byte 'file not found'
L9835       sta LBBC5
            txa
            pha
            tya
            pha
            lda LBBC5
            jsr L8FEE
            pla
            tay
            pla
            tax
            rts
L9847       ldy #$08
L9849       dex
            lda WARMST,X
            sta L0000,X
            dey
            bne L9849
            rts
L9852       jsr L98DF
            ldy #$10
L9857       asl L0092
            rol L0093
            rol L008E
            rol L008F
            bcc L986E
            clc
            lda L0092
            adc L008C
            sta L0092
            lda L0093
            adc L008D
            sta L0093
L986E       dey
            bne L9857
            lda L0092
            sta L008C
            lda L0093
            sta L008D
            jsr L991E
            rts
L987D       jsr L98DF
            ldy #$10
L9882       asl L008C
            rol L008D
            rol L0092
            rol L0093
            sec
            lda L0092
            sbc L008E
            lda L0093
            sbc L008F
            bcc L98A3
            lda L0092
            sbc L008E
            sta L0092
            lda L0093
            sbc L008F
            sta L0093
            inc L008C
L98A3       dey
            bne L9882
            jsr L991E
            rts
L98AA       jsr L98DF
            ldy #$10
L98AF       asl L008C
            rol L008D
            rol L0092
            rol L0093
            lda L0092
            cmp L008E
            lda L0093
            sbc L008F
            bcc L98CD
            lda L0092
            sbc L008E
            sta L0092
            lda L0093
            sbc L008F
            sta L0093
L98CD       dey
            bne L98AF
            lda L0092
            sta L008C
            lda L0093
            sta L008D
            lda CASINI+1,X
            sta L0094
            jmp L991E
L98DF       lda L0000,X
            sta L008E
            lda NGFLAG,X
            sta L008F
            lda CASINI,X
            sta L008C
            lda CASINI+1,X
            sta L008D
            lda L008D
            eor L008F
            sta L0094
            lda L008D
            bpl L9906
            sec
            lda #$00
            sbc L008C
            sta L008C
            lda #$00
            sbc L008D
            sta L008D
L9906       lda L008F
            bpl L9917
            sec
            lda #$00
            sbc L008E
            sta L008E
            lda #$00
            sbc L008F
            sta L008F
L9917       lda #$00
            sta L0092
            sta L0093
            rts
L991E       lda L0094
            bpl L992F
            sec
            lda #$00
            sbc L008C
            sta L008C
            lda #$00
            sbc L008D
            sta L008D
L992F       lda L008C
            sta CASINI,X
            lda L008D
            sta CASINI+1,X
            inx
            inx
            rts
L993A       lda L0000,X
            sta L0092
            lda NGFLAG,X
            sta L0093
            inx
            inx
            ldy #$07
L9946       dex
            lda (L0092),Y
            sta L0000,X
            dey
            bpl L9946
            rts
L994F       lda WARMST,X
            sta L0092
            lda BOOT,X
            sta L0093
            ldy #$00
L9959       lda L0000,X
            inx
            sta (L0092),Y
            iny
            cpy #$08
            bne L9959
            inx
            inx
            rts
L9966       clc
            pla
            sta L0092
            adc #$08
            tay
            pla
            sta L0093
            adc #$00
            pha
            tya
            pha
            ldy #$08
L9977       dex
            lda (L0092),Y
            sta L0000,X
            dey
            bne L9977
            rts
L9980       lda L0000,X
            eor #$20
            sta L0000,X
            rts
L9987       jsr L9D6A
            lda #$01
            jsr L99B7
            jsr L9D88
            rts
L9993       jsr L9D6A
            lda #$02
            jsr L99B7
            jsr L9D88
            rts
L999F       jsr L9D6A
            lda #$03
            jsr L99B7
            jsr L9D88
            rts
L99AB       jsr L9D6A
            lda #$04
            jsr L99B7
            jsr L9D88
            rts
L99B7       sta LBB06
            lda LBAF2
            cmp #$99
            beq L99E2
            lda LBAFC
            cmp #$99
            bne L99CB
            jmp L9C90
L99CB       php
            sed
            jsr L9D15
            lda LBB06
            jsr L99E3
            jsr L9C95
            lda LBAF2
            beq L99E1
            jsr L9CDD
L99E1       plp
L99E2       rts
L99E3       cmp #$01
            bne L99EA
            jmp L9A08
L99EA       cmp #$02
            bne L99F1
            jmp L9A00
L99F1       cmp #$03
            bne L99F8
            jmp L9A8B
L99F8       cmp #$04
            bne L99FF
            jmp L9AED
L99FF       rts
L9A00       lda LBB05
            eor #$20
            sta LBB05
L9A08       lda LBAFC
            beq L9A52
            lda LBAF2
            bne L9A15
            jmp L9C7C
L9A15       sec
            lda LBB03
            sbc LBAF9
            lda LBB04
            sbc LBAFA
            bpl L9A27
            jsr L9C7C
L9A27       sec
            lda LBB03
            sbc LBAF9
            sta LBB06
            lda LBB04
            sbc LBAFA
            sta LBB07
            lda LBB06
            ora LBB07
            beq L9A64
            sec
            lda LBB06
            sbc #$13
            lda LBB07
            sbc #$00
            bcc L9A53
            jsr L9C7C
L9A52       rts
L9A53       jsr L9C27
            sec
            lda LBB06
            sbc #$01
            sta LBB06
            bne L9A53
            jsr L9C7C
L9A64       lda LBAFB
            cmp LBB05
            bne L9A6F
            jmp L9B50
L9A6F       jsr L9B91
            bcs L9A8A
            sec
            ldx #$06
L9A77       lda #$00
            sbc LBAF2,X
            sta LBAF2,X
            dex
            bpl L9A77
            lda LBAFB
            eor #$20
            sta LBAFB
L9A8A       rts
L9A8B       clc
            lda LBAF9
            adc LBB03
            sta LBAF9
            lda LBAFA
            adc LBB04
            sta LBAFA
            lda LBAFB
            eor LBB05
            sta LBAFB
            ldx #$06
L9AA9       lda LBAF2,X
            sta LBB06,X
            lda #$00
            sta LBAF2,X
            dex
            bpl L9AA9
            ldx #$06
            stx LBB0D
L9ABC       ldx LBB0D
            lda LBB06,X
            and #$0F
            jsr L9AE0
            ldx LBB0D
            lda LBB06,X
            lsr
            lsr
            lsr
            lsr
            jsr L9AE0
            dec LBB0D
            bne L9ABC
            lda LBB06
            jsr L9AE0
            rts
L9AE0       jsr L9C27
            tay
            beq L9AEC
L9AE6       jsr L9B50
            dey
            bne L9AE6
L9AEC       rts
L9AED       lda LBAFC
            bne L9AF5
            jmp L9C90
L9AF5       clc
            lda LBAF9
            sbc LBB03
            sta LBAF9
            lda LBAFA
            sbc LBB04
            sta LBAFA
            lda LBAFB
            eor LBB05
            sta LBAFB
            ldx #$00
L9B13       stx LBB0D
            jsr L9B40
            asl
            asl
            asl
            asl
            ldx LBB0D
            sta LBB06,X
            jsr L9B40
            ldx LBB0D
            ora LBB06,X
            sta LBB06,X
            inx
            cpx #$07
            bne L9B13
            ldx #$06
L9B36       lda LBB06,X
            sta LBAF2,X
            dex
            bpl L9B36
            rts
L9B40       ldy #$FF
L9B42       iny
            jsr L9B91
            bcs L9B42
            jsr L9B50
            tya
            jsr L9BD2
            rts
L9B50       clc
            lda LBAF8
            adc LBB02
            sta LBAF8
            lda LBAF7
            adc LBB01
            sta LBAF7
            lda LBAF6
            adc LBB00
            sta LBAF6
            lda LBAF5
            adc LBAFF
            sta LBAF5
            lda LBAF4
            adc LBAFE
            sta LBAF4
            lda LBAF3
            adc LBAFD
            sta LBAF3
            lda LBAF2
            adc LBAFC
            sta LBAF2
            rts
L9B91       sec
            lda LBAF8
            sbc LBB02
            sta LBAF8
            lda LBAF7
            sbc LBB01
            sta LBAF7
            lda LBAF6
            sbc LBB00
            sta LBAF6
            lda LBAF5
            sbc LBAFF
            sta LBAF5
            lda LBAF4
            sbc LBAFE
            sta LBAF4
            lda LBAF3
            sbc LBAFD
            sta LBAF3
            lda LBAF2
            sbc LBAFC
            sta LBAF2
            rts
L9BD2       asl LBAF8
            rol LBAF7
            rol LBAF6
            rol LBAF5
            rol LBAF4
            rol LBAF3
            rol LBAF2
            asl LBAF8
            rol LBAF7
            rol LBAF6
            rol LBAF5
            rol LBAF4
            rol LBAF3
            rol LBAF2
            asl LBAF8
            rol LBAF7
            rol LBAF6
            rol LBAF5
            rol LBAF4
            rol LBAF3
            rol LBAF2
            asl LBAF8
            rol LBAF7
            rol LBAF6
            rol LBAF5
            rol LBAF4
            rol LBAF3
            rol LBAF2
            rts
L9C27       lsr LBAF2
            ror LBAF3
            ror LBAF4
            ror LBAF5
            ror LBAF6
            ror LBAF7
            ror LBAF8
            lsr LBAF2
            ror LBAF3
            ror LBAF4
            ror LBAF5
            ror LBAF6
            ror LBAF7
            ror LBAF8
            lsr LBAF2
            ror LBAF3
            ror LBAF4
            ror LBAF5
            ror LBAF6
            ror LBAF7
            ror LBAF8
            lsr LBAF2
            ror LBAF3
            ror LBAF4
            ror LBAF5
            ror LBAF6
            ror LBAF7
            ror LBAF8
            rts
L9C7C       ldx #$09
L9C7E       lda LBAF2,X
            tay
            lda LBAFC,X
            sta LBAF2,X
            tya
            sta LBAFC,X
            dex
            bpl L9C7E
            rts
L9C90       lda #$06
            jmp L94E1
L9C95       lda LBAF2
            beq L9CB3
            and #$F0
            beq L9CB2
            jsr L9C27
            clc
            lda LBAF9
            adc #$01
            sta LBAF9
            lda LBAFA
            adc #$00
            sta LBAFA
L9CB2       rts
L9CB3       ldx #$06
L9CB5       ora LBAF2,X
            dex
            bne L9CB5
            cmp #$00
            bne L9CC3
            sta LBAF9
            rts
L9CC3       jsr L9BD2
            sec
            lda LBAF9
            sbc #$01
            sta LBAF9
            lda LBAFA
            sbc #$00
            sta LBAFA
            lda LBAF2
            beq L9CC3
            rts
L9CDD       sec
            lda LBAF9
            sbc #$00
            lda LBAFA
            sbc #$01
            bcc L9D0B
            sec
            lda LBAF9
            sbc #$01
            lda LBAFA
            sbc #$99
            bcs L9CFA
            jmp L9C90
L9CFA       sec
            lda #$00
            sbc LBAF9
            sta LBAF9
            lda LBAF2
            ora #$10
            sta LBAF2
L9D0B       lda LBAF2
            ora LBAFB
            sta LBAF2
            rts
L9D15       lda LBAF2
            and #$20
            sta LBAFB
            lda #$00
            sta LBAFA
            lda LBAF2
            and #$10
            beq L9D37
            lda #$99
            sta LBAFA
            sec
            lda #$00
            sbc LBAF9
            sta LBAF9
L9D37       lda LBAF2
            and #$0F
            sta LBAF2
            lda LBAFC
            and #$20
            sta LBB05
            lda #$00
            sta LBB04
            lda LBAFC
            and #$10
            beq L9D61
            lda #$99
            sta LBB04
            sec
            lda #$00
            sbc LBB03
            sta LBB03
L9D61       lda LBAFC
            and #$0F
            sta LBAFC
            rts
L9D6A       ldy #$00
L9D6C       lda L0000,X
            inx
            sta LBAFC,Y
            iny
            cpy #$08
            bne L9D6C
            ldy #$00
L9D79       lda L0000,X
            inx
            sta LBAF2,Y
            iny
            cpy #$08
            bne L9D79
            stx LBAF0
            rts
L9D88       ldx LBAF0
            ldy #$07
L9D8D       dex
            lda LBAF2,Y
            sta L0000,X
            dey
            bpl L9D8D
            rts
L9D97       lda CASINI,X
            sta L0092
            lda CASINI+1,X
            sta L0093
            bpl L9DAE
            sec
            lda #$00
            sbc L0092
            sta L0092
            lda #$00
            sbc L0093
            sta L0093
L9DAE       lda #$00
            sta L0094
            sta L0095
            sta L0096
            ldy #$10
            sed
L9DB9       asl L0092
            rol L0093
            lda L0094
            adc L0094
            sta L0094
            lda L0095
            adc L0095
            sta L0095
            lda L0096
            adc L0096
            sta L0096
            dey
            bne L9DB9
            cld
            lda L0094
            and #$0F
            ora #$30
            sta L0092
            lda L0094
            lsr
            lsr
            lsr
            lsr
            ora #$30
            sta L0093
            lda L0095
            and #$0F
            ora #$30
            sta L0094
            lda L0095
            lsr
            lsr
            lsr
            lsr
            ora #$30
            sta L0095
            lda L0096
            and #$0F
            ora #$30
            sta L0096
            ldy #$05
L9E01       lda L0091,Y
            cmp #$30
            bne L9E0D
            dey
            cpy #$01
            bne L9E01
L9E0D       lda CASINI+1,X
            bpl L9E12
            iny
L9E12       sty L0097
            lda L0097
            cmp L0000,X
            bcs L9E28
            sec
            lda L0000,X
            sbc L0097
            tay
L9E20       lda #$20
            jsr LA88E
            dey
            bne L9E20
L9E28       lda CASINI+1,X
            bpl L9E33
            lda #$2D
            jsr LA88E
            dec L0097
L9E33       ldy L0097
            lda L0091,Y
            jsr LA88E
            dec L0097
            bne L9E33
            inx
            inx
            inx
            inx
            rts
L9E44       lda #$00
            sta L0092
            sta L0093
            sta L0094
            sta L0095
L9E4E       jsr LA42F
            beq L9E58
            lda #$08
            jmp L94E1
L9E58       ldy #$00
            lda (L0086),Y
            cmp #$20
            bne L9E66
            jsr LAAEB
            jmp L9E4E
L9E66       cmp #$2B
            beq L9E72
            cmp #$2D
            bne L9E7D
            lda #$FF
            sta L0095
L9E72       jsr LAAEB
            jsr LA42F
            beq L9E7D
            jmp L9F0A
L9E7D       ldy #$00
            lda (L0086),Y
            cmp #$30
            bcs L9E88
            jmp L9F0A
L9E88       cmp #$3A
            bcc L9E8F
            jmp L9F0A
L9E8F       lda L0093
            pha
            lda L0092
            pha
            asl L0092
            rol L0093
            rol L0094
            asl L0092
            rol L0093
            rol L0094
            clc
            pla
            adc L0092
            sta L0092
            pla
            adc L0093
            sta L0093
            lda #$00
            adc L0094
            sta L0094
            asl L0092
            rol L0093
            rol L0094
            ldy #$00
            lda (L0086),Y
            and #$0F
            clc
            adc L0092
            sta L0092
            lda #$00
            adc L0093
            sta L0093
            lda #$00
            adc L0094
            sta L0094
            sec
            lda #$00
            sbc L0092
            lda #$80
            sbc L0093
            lda #$00
            sbc L0094
            bcc L9F0A
            jsr LAAEB
            jsr LA42F
            bne L9EEE
            ldy #$00
            lda (L0086),Y
            cmp #$20
            bne L9E7D
L9EEE       lda L0095
            beq L9EFF
            sec
            lda #$00
            sbc L0092
            sta L0092
            lda #$00
            sbc L0093
            sta L0093
L9EFF       dex
            dex
            lda L0092
            sta L0000,X
            lda L0093
            sta NGFLAG,X
            rts
L9F0A       jsr LA42F
            bne L9F1D
            ldy #$00
            lda (L0086),Y
            cmp #$20
            beq L9F1D
            jsr LAAEB
            jmp L9F0A
L9F1D       lda #$03
            jmp L94E1
L9F22       sta L008C
            sty L008D
L9F26       lsr L008D
            ror L008C
            bcc L9F39
            clc
            lda CASINI,X
            adc L0000,X
            sta CASINI,X
            lda CASINI+1,X
            adc NGFLAG,X
            sta CASINI+1,X
L9F39       asl L0000,X
            rol NGFLAG,X
            lda L008C
            ora L008D
            bne L9F26
            inx
            inx
            rts
L9F46       jsr L9F94
            cmp #$00
            bne L9F50
            jmp L8D85
L9F50       jmp L8D90
L9F53       jsr L9F94
            cmp #$00
            beq L9F5D
            jmp L8D85
L9F5D       jmp L8D90
L9F60       jsr L9F94
            cmp #$FF
            bne L9F6A
            jmp L8D85
L9F6A       jmp L8D90
L9F6D       jsr L9F94
            cmp #$01
            bne L9F77
            jmp L8D85
L9F77       jmp L8D90
L9F7A       jsr L9F94
            cmp #$01
            beq L9F84
            jmp L8D85
L9F84       jmp L8D90
L9F87       jsr L9F94
            cmp #$FF
            beq L9F91
            jmp L8D85
L9F91       jmp L8D90
L9F94       lda WARMST,X
            eor L0000,X
            and #$20
            beq L9FAD
            clc
            txa
            adc #$10
            tax
            lda L00F8,X
            and #$20
            bne L9FAA
            lda #$01
            rts
L9FAA       lda #$FF
            rts
L9FAD       jsr L9993
            clc
            txa
            adc #$08
            tax
            lda L00F8,X
            bne L9FBA
            rts
L9FBA       and #$20
            bne L9FC1
            lda #$01
            rts
L9FC1       lda #$FF
            rts
L9FC4       lda #$9B
            jmp LA88E
L9FC9       lda #$00
            sta L0092
            sta L0093
            lda L0000,X
            beq LA04A
            and #$10
            bne LA04A
            lda CMCMD,X
            cmp #$05
            bcc L9FE0
            jmp LA058
L9FE0       sta L0094
            lda L0000,X
            sta L0095
            lda NGFLAG,X
            sta L0096
            lda CASINI,X
            sta L0097
L9FEE       lda L0092
            sta L0098
            lda L0093
            sta L0099
            asl L0092
            rol L0093
            bmi LA058
            asl L0092
            rol L0093
            bmi LA058
            clc
            lda L0092
            adc L0098
            sta L0092
            lda L0093
            adc L0099
            sta L0093
            bmi LA058
            asl L0092
            rol L0093
            bmi LA058
            clc
            lda L0095
            and #$0F
            adc L0092
            sta L0092
            lda #$00
            adc L0093
            sta L0093
            bmi LA058
            ldy #$04
LA02A       rol L0097
            rol L0096
            rol L0095
            dey
            bne LA02A
            dec L0094
            bpl L9FEE
            lda L0000,X
            and #$20
            beq LA04A
            sec
            lda #$00
            sbc L0092
            sta L0092
            lda #$00
            sbc L0093
            sta L0093
LA04A       clc
            txa
            adc #$06
            tax
            lda L0092
            sta L0000,X
            lda L0093
            sta NGFLAG,X
            rts
LA058       lda #$06
            jmp L94E1
LA05D       ldy #$08
LA05F       lda L0000,X
            sta L00FA,X
            inx
            dey
            bne LA05F
            jsr LAA69
            sec
            txa
            sbc #$08
            tax
            rts
LA070       sta L0094
            lda L0000,X
            sta L0095
            lda CASINI,X
            sta L0092
            lda CASINI+1,X
            sta L0093
            inx
            inx
            inx
            inx
            lda L0095
            bne LA08A
            lda L0094
            sta L0095
LA08A       lda L0094
            cmp L0095
            bcs LA09A
            lda #$20
            jsr LA88E
            dec L0095
            jmp LA08A
LA09A       ldy #$00
LA09C       cpy L0095
            bne LA0A1
            rts
LA0A1       lda (L0092),Y
            jsr LA88E
            iny
            jmp LA09C
LA0AA       lda L0000,X
            sta L008C
            lda NGFLAG,X
            sta L008D
            inx
            inx
            stx LBB12
            jsr LA0BE
            ldx LBB12
            rts
LA0BE       lda #$00
            ldy #$07
LA0C2       sta (L008C),Y
            dey
            bpl LA0C2
            lda #$00
            ldy #$0E
LA0CB       sta LBAF1,Y
            dey
            bne LA0CB
LA0D1       jsr LA42F
            beq LA0DB
            lda #$08
            jmp L94E1
LA0DB       ldy #$00
            lda (L0086),Y
            cmp #$20
            bne LA0E9
            jsr LAAEB
            jmp LA0D1
LA0E9       sta LBAFB
            ldx #$06
            cmp #$20
            bne LA0F4
            ldx #$00
LA0F4       cmp #$2E
            bne LA0FA
            ldx #$02
LA0FA       cmp #$65
            bne LA100
            ldx #$03
LA100       cmp #$2B
            bne LA106
            ldx #$04
LA106       cmp #$2D
            bne LA10C
            ldx #$04
LA10C       cmp #$0D
            bne LA112
            ldx #$05
LA112       cmp #$30
            bcc LA11C
            cmp #$3A
            bcs LA11C
            ldx #$01
LA11C       txa
LA11D       asl LBAFA
            asl LBAFA
            asl LBAFA
            ora LBAFA
            tax
            lda LA156,X
            sta LBAFA
            asl
            tax
            lda LA196,X
            sta L008E
            lda LA197,X
            sta L008F
            jmp (L008E)
LA13F       ldx LBB12
            jsr LAAEB
            jsr LA42F
            beq LA14F
            lda #$00
            jmp LA11D
LA14F       ldy #$00
            lda (L0086),Y
            jmp LA0E9
LA156       .byte $00,$02,$07,$08,$01,$09,$08,$00,$08,$02,$07,$08,$08,$08,$08,$00
            .byte $09,$02,$07,$04,$08,$09,$08,$00,$09,$03,$08,$04,$08,$09,$08,$00
            .byte $08,$06,$08,$08,$05,$08,$08,$00,$08,$06,$08,$08,$08,$08,$08,$00
            .byte $09,$06,$08,$08,$08,$09,$08,$00,$09,$03,$08,$04,$08,$09,$08,$00
LA196       .byte $AA
LA197       .byte $A1,$AD,$A1,$B6,$A1,$DD,$A1,$04,$A2,$07,$A2,$10,$A2,$AA,$A1,$9E
            .byte $A2,$2A,$A2
            jmp LA13F
            lda LBAFB
            sta LBAFC
            jmp LA13F
            lda #$00
            ldx #$07
LA1BA       ora LBAF1,X
            dex
            bne LA1BA
            cmp #$00
            beq LA1C7
            inc LBAFE
LA1C7       lda LBAF2
            bne LA1DA
            jsr LA2C1
            lda LBAFB
            and #$0F
            ora LBAF8
            sta LBAF8
LA1DA       jmp LA13F
            lda #$00
            ldx #$07
LA1E1       ora LBAF1,X
            dex
            bne LA1E1
            cmp #$00
            bne LA1EE
            dec LBAFE
LA1EE       lda LBAF2
            bne LA201
            jsr LA2C1
            lda LBAFB
            and #$0F
            ora LBAF8
            sta LBAF8
LA201       jmp LA13F
            jmp LA13F
            lda LBAFB
            sta LBAFD
            jmp LA13F
            lda LBAFF
            asl
            asl
            adc LBAFF
            asl
            sta LBAFF
            lda LBAFB
            and #$0F
            adc LBAFF
            sta LBAFF
            jmp LA13F
            lda #$00
            ldx #$07
LA22E       ora LBAF1,X
            dex
            bne LA22E
            cmp #$00
            bne LA239
            rts
LA239       lda LBAF2
            bne LA244
            jsr LA2C1
            jmp LA239
LA244       lda LBAFD
            cmp #$2D
            bne LA254
            sec
            lda #$00
            sbc LBAFF
            sta LBAFF
LA254       clc
            lda LBAFE
            adc LBAFF
            sta LBAFE
            bpl LA271
            sec
            lda #$00
            sbc LBAFE
            sta LBAFE
            lda LBAF2
            ora #$10
            sta LBAF2
LA271       ldx #$08
            sed
LA274       asl LBAFE
            lda LBAF9
            adc LBAF9
            sta LBAF9
            dex
            bne LA274
            cld
            lda LBAFC
            cmp #$2D
            bne LA293
            lda LBAF2
            ora #$20
            sta LBAF2
LA293       ldy #$07
LA295       lda LBAF2,Y
            sta (L008C),Y
            dey
            bpl LA295
            rts
LA29E       ldx LBB12
            jsr LA42F
            bne LA2B4
            ldy #$00
            lda (L0086),Y
            cmp #$20
            beq LA2B4
            jsr LAAEB
            jmp LA29E
LA2B4       ldy #$00
            lda #$39
            sta (L008C),Y
            ldy #$07
            lda #$99
            sta (L008C),Y
            rts
LA2C1       ldy #$04
LA2C3       ldx #$07
            clc
LA2C6       rol LBAF1,X
            dex
            bne LA2C6
            dey
            bne LA2C3
            rts
LA2D0       jsr LA31E
            cmp #$00
            bne LA2DA
            jmp L8D85
LA2DA       jmp L8D90
LA2DD       jsr LA31E
            cmp #$00
            beq LA2E7
            jmp L8D85
LA2E7       jmp L8D90
LA2EA       jsr LA31E
            cmp #$FF
            bne LA2F4
            jmp L8D85
LA2F4       jmp L8D90
LA2F7       jsr LA31E
            cmp #$FF
            beq LA301
            jmp L8D85
LA301       jmp L8D90
LA304       jsr LA31E
            cmp #$01
            bne LA30E
            jmp L8D85
LA30E       jmp L8D90
LA311       jsr LA31E
            cmp #$01
            beq LA31B
            jmp L8D85
LA31B       jmp L8D90
LA31E       sta L0090
            sty L0091
            lda L0000,X
            sta L008E
            lda NGFLAG,X
            sta L008F
            lda CASINI,X
            sta L008C
            lda CASINI+1,X
            sta L008D
            inx
            inx
            inx
            inx
            ldy #$00
LA338       lda (L008C),Y
            cmp (L008E),Y
            bne LA355
            inc L008C
            bne LA344
            inc L008D
LA344       inc L008E
            bne LA34A
            inc L008F
LA34A       inc L0090
            bne LA338
            inc L0091
            bne LA338
            lda #$00
            rts
LA355       bcs LA35A
            lda #$FF
            rts
LA35A       lda #$01
            rts
LA35D       jsr LA42F
            beq LA367
            lda #$08
            jmp L94E1
LA367       dex
            dex
            ldy #$00
            lda (L0086),Y
            sta L0000,X
            lda #$00
            sta NGFLAG,X
            jsr LAAEB
            rts
LA377       lda L0000,X
            sta L0092
LA37B       lda #$01
            cmp L0092
            bcs LA38B
            lda #$20
            jsr LA88E
            dec L0092
            jmp LA37B
LA38B       lda CASINI,X
            jsr LA88E
            inx
            inx
            inx
            inx
            rts
LA395       dex
            lda NGFLAG,X
            sta L0000,X
            lda CASINI,X
            sta NGFLAG,X
            lda CASINI+1,X
            beq LA3AF
            lda #$BC
            sta CASINI,X
            lda #$A3
            sta CASINI+1,X
            lda #$04
            jmp LA070
LA3AF       lda #$C0
            sta CASINI,X
            lda #$A3
            sta CASINI+1,X
            lda #$05
            jmp LA070
            .byte 'TRUEFALSE'
LA3C5       dex
            dex
            lda CASINI,X
            sta L0000,X
            lda CASINI+1,X
            sta NGFLAG,X
            jmp L9852
LA3D2       ldy #$08
LA3D4       dex
            lda WARMST,X
            sta L0000,X
            dey
            bne LA3D4
            jmp L999F
LA3DF       jsr L9966
            .byte $15,$00,$00,$00,$00,$00,$00,$01
            lda WARMST,X
            and #$20
            ora L0000,X
            sta L0000,X
            jsr L9987
            jmp L9FC9
LA3F8       jsr LA403
            inx
            inx
            lda L00FE,X
            rts
LA400       jsr LA834
LA403       lda L0086
            cmp #$FE
            bne LA422
            lda L0087
            cmp #$BB
            bne LA422
            lda LBB0E
            bne LA417
            jsr LAAEB
LA417       lda LBB0F
            beq LA41F
            jmp L8D85
LA41F       jmp L8D90
LA422       dex
            dex
            ldy #$0E
            lda (L0088),Y
            sta L0000,X
            lda #$00
            sta NGFLAG,X
            rts
LA42F       jsr LA43A
            inx
            inx
            lda L00FE,X
            rts
LA437       jsr LA834
LA43A       lda L0086
            cmp #$FE
            bne LA459
            lda L0087
            cmp #$BB
            bne LA459
            lda LBB0E
            bne LA44E
            jsr LAAEB
LA44E       lda LBB10
            beq LA456
            jmp L8D85
LA456       jmp L8D90
LA459       lda L0086
            cmp #$FF
            bne LA468
            lda L0087
            cmp #$BB
            bne LA468
            jmp L8D85
LA468       dex
            dex
            ldy #$0C
            lda (L0088),Y
            sta L0000,X
            lda #$00
            sta NGFLAG,X
            rts
LA475       lda L0086
            cmp #$FE
            bne LA490
            lda L0087
            cmp #$BB
            bne LA490
            jsr LA3F8
            lda #$00
            sta LBB0E
            sta LBB10
            sta LBB0F
            rts
LA490       jsr LA3F8
            bne LA49B
            jsr LAAEB
            jmp LA490
LA49B       jsr LAAEB
            rts
LA49F       lda CASINI,X
            beq LA508
            lda BOOT,X
            jsr LA5D6
            sta L0092
            lda #$00
            sta L0093
            lda CASINI,X
            and #$10
            beq LA4C1
            sec
            lda #$00
            sbc L0092
            sta L0092
            lda #$00
            sbc L0093
            sta L0093
LA4C1       clc
            lda L0000,X
            adc L0092
            sta L0092
            lda NGFLAG,X
            adc L0093
            sta L0093
            bvc LA4D5
            lda #$06
            jmp L94E1
LA4D5       lda CASINI,X
            and #$EF
            sta CASINI,X
            lda L0093
            bpl LA4F2
            lda CASINI,X
            ora #$10
            sta CASINI,X
            sec
            lda #$00
            sbc L0092
            sta L0092
            lda #$00
            sbc L0093
            sta L0093
LA4F2       lda L0092
            cmp #$64
            lda L0093
            sbc #$00
            bcc LA501
            lda #$06
            jmp L94E1
LA501       lda L0092
            jsr LA56D
            sta BOOT,X
LA508       inx
            inx
            rts
LA50B       lda CMCMD,X
            jsr LA5D6
            sta TRAMSZ,X
            lda #$00
            sta CMCMD,X
            lda L0000,X
            and #$10
            beq LA529
            sec
            lda #$00
            sbc TRAMSZ,X
            sta TRAMSZ,X
            lda #$00
            sbc CMCMD,X
            sta CMCMD,X
LA529       clc
            txa
            adc #$06
            tax
            rts
LA52F       lda CASINI,X
            bne LA536
            inx
            inx
            rts
LA536       lda NGFLAG,X
            beq LA547
            lda L0000,X
            cmp #$9E
            lda NGFLAG,X
            sbc #$FF
            bcs LA547
            inx
            inx
            rts
LA547       lda L0000,X
            sta L00F8,X
            lda NGFLAG,X
            sta L00F9,X
            inx
            inx
            jsr L9966
            ora L0000,X
            .byte $00,$00,$00,$00,$00
            ora (L00CA,X)
            dex
            jsr LA49F
            lda WARMST,X
            and #$20
            ora L0000,X
            sta L0000,X
            jsr L9987
            rts
LA56D       tay
            lda LA572,Y
            rts
LA572       .byte $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$10,$11,$12,$13,$14,$15
            .byte $16,$17,$18,$19,$20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$30,$31
            .byte $32,$33,$34,$35,$36,$37,$38,$39,$40,$41,$42,$43,$44,$45,$46,$47
            .byte $48,$49,$50,$51,$52,$53,$54,$55,$56,$57,$58,$59,$60,$61,$62,$63
            .byte $64,$65,$66,$67,$68,$69,$70,$71,$72,$73,$74,$75,$76,$77,$78,$79
            .byte $80,$81,$82,$83,$84,$85,$86,$87,$88,$89,$90,$91,$92,$93,$94,$95
            .byte $96,$97,$98,$99
LA5D6       sta L0092
            and #$F0
            lsr
            sta L0093
            lsr
            lsr
            adc L0093
            sta L0093
            lda L0092
            and #$0F
            clc
            adc L0093
            rts
LA5EB       lda NGFLAG,X
            beq LA5F4
            lda #$05
            jmp L94E1
LA5F4       lda L0000,X
            cmp #$08
            bcs LA5FC
            lda #$08
LA5FC       sec
            sbc #$07
            sta L0094
            inx
            inx
            jsr L9847
            jsr LA50B
            sec
            lda L0000,X
            sbc L0094
            sta L0000,X
            lda NGFLAG,X
            sbc #$00
            sta NGFLAG,X
            jsr LA52F
            ldy #$20
            lda L0000,X
            sta L0095
            and #$20
            beq LA625
            ldy #$2D
LA625       tya
            jsr LA88E
            jsr LA70D
            lda #$2E
            jsr LA88E
LA631       jsr LA70D
            dec L0094
            bne LA631
            lda #$45
            jsr LA88E
            ldy #$2B
            lda L0095
            and #$10
            beq LA647
            ldy #$2D
LA647       tya
            jsr LA88E
            lda CMCMD,X
            lsr
            lsr
            lsr
            lsr
            ora #$30
            jsr LA88E
            lda CMCMD,X
            and #$0F
            ora #$30
            jsr LA88E
            clc
            txa
            adc #$08
            tax
            rts
LA665       lda L0000,X
            cmp #$9A
            lda NGFLAG,X
            sbc #$00
            bcc LA674
            lda #$05
            jmp L94E1
LA674       lda CASINI+1,X
            beq LA67D
            lda #$05
            jmp L94E1
LA67D       lda L0000,X
            sta L0094
            lda CASINI,X
            sta L0095
            sec
            lda #$00
            sbc L0000,X
            sta CASINI,X
            lda #$00
            sbc NGFLAG,X
            sta CASINI+1,X
            inx
            inx
            jsr LA52F
            lda CMCMD,X
            jsr LA5D6
            sta CMCMD,X
            lda L0000,X
            and #$10
            bne LA6B8
            lda CMCMD,X
            jsr LA6E7
LA6A9       jsr LA70D
            dec CMCMD,X
            bpl LA6A9
            lda #$2E
            jsr LA88E
            jmp LA6D7
LA6B8       lda #$00
            jsr LA6E7
            lda #$30
            jsr LA88E
            lda #$2E
            jsr LA88E
LA6C7       dec CMCMD,X
            beq LA6D7
            dec L0094
            bmi LA6E1
            lda #$30
            jsr LA88E
            jmp LA6C7
LA6D7       dec L0094
            bmi LA6E1
            jsr LA70D
            jmp LA6D7
LA6E1       clc
            txa
            adc #$08
            tax
            rts
LA6E7       clc
            adc L0094
            tay
            iny
            iny
            lda L0000,X
            and #$20
            beq LA6F4
            iny
LA6F4       cpy L0095
            bcs LA701
            lda #$20
            jsr LA88E
            iny
            jmp LA6F4
LA701       lda L0000,X
            and #$20
            beq LA70C
            lda #$2D
            jsr LA88E
LA70C       rts
LA70D       lda L0000,X
            and #$0F
            ora #$30
            jsr LA88E
            ldy #$04
LA718       asl TRAMSZ,X
            rol RAMLO+1,X
            rol RAMLO,X
            rol CASINI+1,X
            rol CASINI,X
            rol NGFLAG,X
            rol L0000,X
            dey
            bne LA718
            rts
LA72A       pha
            tya
            pha
            dex
            dex
            ldy #$02
            lda (L0088),Y
            sta L0000,X
            iny
            lda (L0088),Y
            sta NGFLAG,X
            pla
            tay
            pla
            jsr LB77B
            dex
            dex
            ldy #$02
            lda (L0088),Y
            sta L0000,X
            iny
            lda (L0088),Y
            sta NGFLAG,X
            jsr LAAE8
            rts
LA751       pha
            tya
            pha
            dex
            dex
            lda CASINI,X
            sta L0000,X
            lda CASINI+1,X
            sta NGFLAG,X
            ldy #$02
            lda (L0088),Y
            sta CASINI,X
            iny
            lda (L0088),Y
            sta CASINI+1,X
            pla
            tay
            pla
            jsr LB77B
            dex
            dex
            ldy #$02
            lda (L0088),Y
            sta L0000,X
            iny
            lda (L0088),Y
            sta NGFLAG,X
            jsr LA89C
            rts
LA780       sta L0092
            ldy #$02
            lda (L0088),Y
            sta L0094
            iny
            lda (L0088),Y
            sta L0095
            ldy #$00
LA78F       lda L0000,X
            inx
            sta (L0094),Y
            iny
            cpy L0092
            bne LA78F
            cpy #$01
            bne LA79E
            inx
LA79E       dex
            dex
            ldy #$02
            lda (L0088),Y
            sta L0000,X
            iny
            lda (L0088),Y
            sta NGFLAG,X
            jsr LA89C
            rts
LA7AF       jsr LA81F
            lda L0088
            cmp #$FF
            bne LA7C4
            lda L0089
            cmp #$BB
            bne LA7C4
            lda #$7D
            jsr L9835
            rts
LA7C4       lda #$0C
            jsr LA88E
            rts
LA7CA       lda #$C1
            sta L0088
            lda #$BB
            sta L0089
LA7D2       lda L0088
            sta L0092
            lda L0089
            sta L0093
            ldy #$00
            lda (L0092),Y
            sta L0088
            iny
            lda (L0092),Y
            sta L0089
            lda L0088
            ora L0089
            bne LA7EC
            rts
LA7EC       ldy #$02
            lda (L0088),Y
            cmp L0082
            iny
            lda (L0088),Y
            sbc L0083
            bcs LA7D2
            ldy #$00
            lda (L0088),Y
            sta (L0092),Y
            iny
            lda (L0088),Y
            sta (L0092),Y
            jsr LAA35
            jmp LA7D2
LA80A       jsr LA834
            lda L0086
            cmp #$FF
            bne LA81E
            lda L0087
            cmp #$BB
            bne LA81E
            lda #$0C
            jsr L94E1
LA81E       rts
LA81F       jsr LA834
            lda L0086
            cmp #$FE
            bne LA833
            lda L0087
            cmp #$BB
            bne LA833
            lda #$0D
            jsr L94E1
LA833       rts
LA834       sta LBBBD
            sty LBBBE
            lda L0000,X
            sta L0086
            lda NGFLAG,X
            sta L0087
            inx
            inx
            lda L0086
            cmp #$FE
            bne LA851
            lda L0087
            cmp #$BB
            bne LA851
            rts
LA851       lda L0086
            cmp #$FF
            bne LA85E
            lda L0087
            cmp #$BB
            bne LA85E
            rts
LA85E       lda #$C1
            sta L0088
            lda #$BB
            sta L0089
LA866       ldy #$00
            lda (L0088),Y
            pha
            iny
            lda (L0088),Y
            sta L0089
            pla
            sta L0088
            lda L0088
            ora L0089
            bne LA87E
            lda #$04
            jmp L94E1
LA87E       ldy #$02
            lda (L0088),Y
            cmp L0086
            bne LA866
            iny
            lda (L0088),Y
            cmp L0087
            bne LA866
            rts
LA88E       sty LBAF1
            ldy #$00
            sta (L0086),Y
            jsr LA89F
            ldy LBAF1
            rts
LA89C       jsr LA834
LA89F       lda L0086
            cmp #$FF
            bne LA8B3
            lda L0087
            cmp #$BB
            bne LA8B3
            ldy #$00
            lda (L0086),Y
            jsr L9835
            rts
LA8B3       txa
            pha
            ldy #$10
            lda (L0088),Y
            tax
            lda #$0B
            sta IOCB0+ICCOM,X
            lda L0086
            sta IOCB0+ICBAL,X
            lda L0087
            sta IOCB0+ICBAH,X
            ldy #$04
            lda (L0088),Y
            sta IOCB0+ICBLL,X
            iny
            lda (L0088),Y
            sta IOCB0+ICBLH,X
            jsr CIOV
            bpl LA8DE
            jmp L96DB
LA8DE       pla
            tax
            rts
LA8E1       txa
            pha
            ldx #$10
LA8E5       lda IOCB0,X
            cmp #$FF
            beq LA8FA
            txa
            clc
            adc #$10
            tax
            cpx #$80
            bne LA8E5
            lda #$0B
            jmp L94E1
LA8FA       lda #$03
            sta IOCB0+ICCOM,X
            ldy #$08
            lda (L0088),Y
            sta IOCB0+ICBAL,X
            iny
            lda (L0088),Y
            sta IOCB0+ICBAH,X
            lda #$04
            sta IOCB0+ICAX1,X
            lda #$00
            sta IOCB0+ICAX2,X
            ldy #$14
            lda (L0088),Y
            beq LA921
            lda #$08
            sta IOCB0+ICAX1,X
LA921       jsr CIOV
            bpl LA929
            jmp L96DB
LA929       ldy #$10
            txa
            sta (L0088),Y
            pla
            tax
            rts
LA931       jsr LA95E
            jsr LA8E1
            dex
            dex
            lda L0086
            sta L0000,X
            lda L0087
            sta NGFLAG,X
            lda LBBBD
            ldy LBBBE
            jsr LAAE8
            rts
LA94B       jsr LA95E
            ldy #$14
            lda #$01
            sta (L0088),Y
            jsr LA8E1
            ldy #$0C
            lda #$01
            sta (L0088),Y
            rts
LA95E       lda L0000,X
            sta LBBB9
            lda NGFLAG,X
            sta LBBBA
            lda CASINI,X
            sta LBBBB
            lda CASINI+1,X
            sta LBBBC
            lda RAMLO,X
            sta LBBBD
            lda RAMLO+1,X
            sta LBBBE
            lda TRAMSZ,X
            sta L0086
            lda CMCMD,X
            sta L0087
            inx
            inx
            inx
            inx
            inx
            inx
            inx
            inx
            jsr LA9F6
            dex
            dex
            lda #$88
            sta L0000,X
            lda #$00
            sta NGFLAG,X
            lda #$16
            ldy #$00
            jsr LB534
            lda #$00
            tay
LA9A3       sta (L0088),Y
            iny
            cpy #$16
            bne LA9A3
            ldy #$02
            lda L0086
            sta (L0088),Y
            iny
            lda L0087
            sta (L0088),Y
            ldy #$04
            lda LBBBD
            sta (L0088),Y
            iny
            lda LBBBE
            sta (L0088),Y
            lda LBBBD
            ora LBBBE
            bne LA9DB
            ldy #$12
            lda #$01
            sta (L0088),Y
            ldy #$04
            lda #$01
            sta (L0088),Y
            iny
            lda #$00
            sta (L0088),Y
LA9DB       ldy #$00
            lda LBBC1
            sta (L0088),Y
            iny
            lda LBBC2
            sta (L0088),Y
            lda L0088
            sta LBBC1
            lda L0089
            sta LBBC2
            jsr LB99D
            rts
LA9F6       lda #$C1
            sta L0088
            lda #$BB
            sta L0089
LA9FE       lda L0088
            sta L0092
            lda L0089
            sta L0093
            ldy #$00
            lda (L0092),Y
            sta L0088
            iny
            lda (L0092),Y
            sta L0089
            lda L0088
            ora L0089
            beq LAA34
            ldy #$02
            lda (L0088),Y
            cmp L0086
            bne LA9FE
            iny
            lda (L0088),Y
            cmp L0087
            bne LA9FE
            ldy #$00
            lda (L0088),Y
            sta (L0092),Y
            iny
            lda (L0088),Y
            sta (L0092),Y
            jsr LAA35
LAA34       rts
LAA35       txa
            pha
            ldy #$10
            lda (L0088),Y
            tax
            jsr L8FC5
            pla
            tax
            dex
            dex
            clc
            lda L0088
            adc #$08
            sta L0000,X
            lda L0089
            adc #$00
            sta NGFLAG,X
            lda #$41
            ldy #$00
            jsr LB65E
            dex
            dex
            lda #$88
            sta L0000,X
            lda #$00
            sta NGFLAG,X
            lda #$16
            ldy #$00
            jsr LB65E
            rts
LAA69       lda #$00
            sta L0092
            sta L0093
            sta L0094
            sta L0095
            lda L0000,X
            sta L0096
            lda NGFLAG,X
            sta L0097
            bpl LAA8A
            sec
            lda #$00
            sbc L0096
            sta L0096
            lda #$00
            sbc L0097
            sta L0097
LAA8A       ldy #$10
            sed
LAA8D       asl L0096
            rol L0097
            lda L0094
            adc L0094
            sta L0094
            lda L0093
            adc L0093
            sta L0093
            lda L0092
            adc L0092
            sta L0092
            dey
            bne LAA8D
            cld
            lda #$04
            sta L0095
LAAAB       lda L0092
            bne LAABE
            ldy #$04
LAAB1       asl L0094
            rol L0093
            rol L0092
            dey
            bne LAAB1
            dec L0095
            bne LAAAB
LAABE       lda NGFLAG,X
            bpl LAAC8
            lda L0092
            ora #$20
            sta L0092
LAAC8       sec
            txa
            sbc #$06
            tax
            lda L0092
            sta L0000,X
            lda L0093
            sta NGFLAG,X
            lda L0094
            sta CASINI,X
            lda #$00
            sta CASINI+1,X
            sta RAMLO,X
            sta RAMLO+1,X
            sta TRAMSZ,X
            lda L0095
            sta CMCMD,X
            rts
LAAE8       jsr LA80A
LAAEB       lda L0086
            cmp #$FE
            bne LAB43
            lda L0087
            cmp #$BB
            bne LAB43
            lda LBB0E
            beq LAB01
            lda LBB0F
            beq LAB17
LAB01       txa
            pha
            jsr L901F
            pla
            tax
            lda #$FF
            sta LBB0E
            lda #$00
            sta LBB11
            lda #$00
            sta LBB0F
LAB17       lda #$00
            sta LBB10
            ldy LBB11
            lda L0500,Y
            cmp #$9B
            bne LAB32
            lda #$20
            ldy #$00
            sta (L0086),Y
            lda #$FF
            sta LBB0F
            rts
LAB32       cmp #$1A
            bne LAB3B
            lda #$FF
            sta LBB10
LAB3B       ldy #$00
            sta (L0086),Y
            inc LBB11
            rts
LAB43       ldy #$0C
            lda (L0088),Y
            beq LAB4E
            lda #$08
            jmp L94E1
LAB4E       txa
            pha
            ldy #$10
            lda (L0088),Y
            tax
            lda #$07
            sta IOCB0+ICCOM,X
            lda L0086
            sta IOCB0+ICBAL,X
            lda L0087
            sta IOCB0+ICBAH,X
            ldy #$04
            lda (L0088),Y
            sta IOCB0+ICBLL,X
            iny
            lda (L0088),Y
            sta IOCB0+ICBLH,X
            jsr CIOV
            pla
            tax
            tya
            bpl LAB87
            cpy #$88
            beq LAB80
            jmp L96DB
LAB80       lda #$01
            ldy #$0C
            sta (L0088),Y
            rts
LAB87       ldy #$12
            lda (L0088),Y
            beq LABA5
            lda #$00
            ldy #$0E
            sta (L0088),Y
            ldy #$00
            lda (L0086),Y
            cmp #$9B
            bne LABA5
            lda #$20
            sta (L0086),Y
            lda #$01
            ldy #$0E
            sta (L0088),Y
LABA5       rts
LABA6       clc
            pla
            sta L008C
            adc #$02
            tay
            pla
            sta L008D
            adc #$00
            pha
            tya
            pha
            ldy #$01
            lda (L008C),Y
            sta L008E
            iny
            lda (L008C),Y
            sta L008F
            dex
            dex
            ldy #$00
            lda (L008E),Y
            sta L0000,X
            iny
            lda (L008E),Y
            sta NGFLAG,X
            rts
LABCE       clc
            pla
            sta L008C
            adc #$02
            tay
            pla
            sta L008D
            adc #$00
            pha
            tya
            pha
            ldy #$01
            lda (L008C),Y
            sta L008E
            iny
            lda (L008C),Y
            sta L008F
            ldy #$00
            lda L0000,X
            sta (L008E),Y
            iny
            lda NGFLAG,X
            sta (L008E),Y
            inx
            inx
            rts
LABF6       pla
            sta L008C
            pla
            sta L008D
            clc
            lda L008C
            adc #$02
            tay
            lda L008D
            adc #$00
            pha
            tya
            pha
            ldy #$01
            lda (L008C),Y
            sta L008E
            iny
            lda (L008C),Y
            sta L008F
            ldy #$07
LAC16       dex
            lda (L008E),Y
            sta L0000,X
            dey
            bpl LAC16
            rts
LAC1F       pla
            sta L008C
            pla
            sta L008D
            clc
            lda L008C
            adc #$02
            tay
            lda L008D
            adc #$00
            pha
            tya
            pha
            ldy #$01
            lda (L008C),Y
            sta L008E
            iny
            lda (L008C),Y
            sta L008F
            ldy #$00
LAC3F       lda L0000,X
            inx
            sta (L008E),Y
            iny
            cpy #$08
            bne LAC3F
            rts
LAC4A       lda L0000,X
            and #$10
            beq LAC63
            lda #$00
            sta L0000,X
            sta NGFLAG,X
            sta CASINI,X
            sta CASINI+1,X
            sta RAMLO,X
            sta RAMLO+1,X
            sta TRAMSZ,X
            sta CMCMD,X
            rts
LAC63       lda CMCMD,X
            jsr LA5D6
            sta L008C
            txa
            tay
LAC6C       inc L008C
            lda L008C
            cmp #$0D
            bcc LAC75
            rts
LAC75       lda TRAMSZ,Y
            and #$F0
            sta TRAMSZ,Y
            inc L008C
            lda L008C
            cmp #$0D
            bcc LAC86
            rts
LAC86       lda #$00
            sta TRAMSZ,Y
            dey
            jmp LAC6C
LAC8F       jsr LAC1F
            .word LBB45
            lda LBB45
            and #$20
            sta LBB75
            lda LBB45
            and #$DF
            sta LBB45
            jsr LABF6
            .word LBB45
            jsr LABF6
            .word LADB9
            jsr L999F
            jsr LAC4A
            jsr LAC1F
            .word LBB5D
            jsr LABF6
            .word LBB5D
            jsr L9FC9
            lda L0000,X
            and #$01
            beq LACCF
            lda LBB75
            eor #$20
            sta LBB75
LACCF       inx
            inx
LACD1       jsr LABF6
            .word LBB45
            jsr LAC4A
            jsr LAC1F
            .word LBB4D
            jsr LABF6
            .word LBB45
            jsr LABF6
            .word LBB4D
            jsr L9993
            jsr LAC1F
            .word LBB55
            jsr LABF6
            .word LBB4D
            jsr LABF6
            .word LBB5D
            jsr LABF6
            .word LADC1
            jsr L999F
            jsr L9993
            jsr LABF6
            .word LBB55
            jsr L9987
            jsr LABF6
            .word LBB5D
            jsr LABF6
            .word LADC9
            jsr L999F
            jsr L9993
            jsr LAC1F
            .word LBB65
            jsr LABF6
            .word LBB65
            jsr LABF6
            .word LBB65
            jsr L999F
            jsr LAC1F
            .word LBB6D
            jsr LABF6
            .word LAE01
            jsr LABF6
            .word LBB6D
            jsr L999F
            jsr LABF6
            .word LADF9
            jsr L9987
            jsr LABF6
            .word LBB6D
            jsr L999F
            jsr LABF6
            .word LADF1
            jsr L9987
            jsr LABF6
            .word LBB6D
            jsr L999F
            jsr LABF6
            .word LADE9
            jsr L9987
            jsr LABF6
            .word LBB6D
            jsr L999F
            jsr LABF6
            .word LADE1
            jsr L9987
            jsr LABF6
            .word LBB6D
            jsr L999F
            jsr LABF6
            .word LADD9
            jsr L9987
            jsr LABF6
            .word LBB6D
            jsr L999F
            jsr LABF6
            .word LADD1
            jsr L9987
            jsr LABF6
            .word LBB6D
            jsr L999F
            jsr LABF6
            .word LBB65
            jsr L999F
            jsr LABF6
            .word LBB65
            jsr L9987
            lda L0000,X
            eor LBB75
            sta L0000,X
            rts
LADB9       .byte $13,$18,$30,$98,$86,$18,$38,$01
LADC1       .byte $03,$14,$00,$00,$00,$00,$00,$00
LADC9       .byte $11,$59,$26,$53,$58,$97,$93,$03
LADD1       .byte $31,$66,$66,$66,$66,$66,$66,$01
LADD9       .byte $18,$33,$33,$33,$33,$32,$76,$03
LADE1       .byte $31,$98,$41,$26,$98,$23,$22,$04
LADE9       .byte $12,$75,$57,$31,$64,$21,$29,$06
LADF1       .byte $32,$50,$51,$87,$08,$83,$47,$08
LADF9       .byte $11,$60,$47,$84,$46,$32,$38,$10
LAE01       .byte $37,$37,$06,$62,$77,$50,$71,$13
LAE09       lda #$00
            sta LBB75
            jsr LAC1F
            .word LBB45
            lda LBB45
            and #$DF
            sta LBB45
            jsr LABF6
            .word LBB45
            jsr LABF6
            .word LAE66
            jsr L9987
            jsr LABF6
            .word LADB9
            jsr L999F
            jsr L9FC9
            jsr LABCE
            .word LBB76
            jsr LABA6
            .word LBB76
            jsr LAA69
            jsr LAC1F
            .word LBB5D
            lda LBB76
            and #$01
            beq LAE51
            lda #$20
            sta LBB75
LAE51       jsr LABF6
            .word LBB5D
            jsr LABF6
            .word LAE6E
            jsr L9993
            jsr LAC1F
            .word LBB5D
            jmp LACD1
LAE66       .byte $01,$57,$07,$96,$32,$67,$95,$00
LAE6E       .byte $15,$00,$00,$00,$00,$00,$00,$01
LAE76       jsr LAC1F
            .word LBB65
            lda LBB65
            and #$20
            sta LBB75
            lda LBB65
            and #$DF
            sta LBB65
            lda #$00
            sta LBB76
            jsr LABF6
            .word LBB65
            jsr LABF6
            .word LAFD1
            jsr L9F6D
            inx
            inx
            lda L00FE,X
            beq LAEBA
            jsr LABF6
            .word LAFD1
            jsr LABF6
            .word LBB65
            jsr L99AB
            jsr LAC1F
            .word LBB65
            lda #$02
            sta LBB76
LAEBA       jsr LABF6
            .word LBB65
            jsr LABF6
            .word LAFD9
            jsr L9F6D
            inx
            inx
            lda L00FE,X
            beq LAF0A
            jsr LABF6
            sbc (L00AF,X)
            jsr LABF6
            .word LBB65
            jsr L999F
            jsr LABF6
            .word LAE6E
            jsr L9993
            jsr LABF6
            .word LAE6E
            jsr L9993
            jsr LABF6
            .word LBB65
            jsr L9987
            jsr LABF6
            sbc #$AF
            jsr LABF6
            adc L00BB
            jsr L9987
            jsr L99AB
            jsr LAC1F
            adc L00BB
            inc LBB76
LAF0A       jsr LABF6
            adc L00BB
            jsr LABF6
            adc L00BB
            jsr L999F
            jsr LAC1F
            .word LBB6D
            jsr LABF6
            .word LB001
            jsr LABF6
            .word LBB6D
            jsr L999F
            jsr LABF6
            .word LAFF9
            jsr L9987
            jsr LABF6
            .word LBB6D
            jsr L999F
            jsr LABF6
            .word LAFF1
            jsr L9987
            jsr LABF6
            .word LBB6D
            jsr L999F
            jsr LABF6
            .word LBB6D
            jsr LABF6
            .word LB019
            jsr L9987
            jsr LABF6
            .word LBB6D
            jsr L999F
            jsr LABF6
            .word LB011
            jsr L9987
            jsr LABF6
            .word LBB6D
            jsr L999F
            jsr LABF6
            .word LB009
            jsr L9987
            jsr L99AB
            jsr LABF6
            .word LBB65
            jsr L999F
            jsr LABF6
            .word LBB65
            jsr L9987
            lda LBB76
            cmp #$02
            bcc LAF96
            lda L0000,X
            eor #$20
            sta L0000,X
LAF96       lda LBB76
            cmp #$00
            bne LAFA2
            jsr LABF6
            .word LB021
LAFA2       lda LBB76
            cmp #$01
            bne LAFAE
            jsr LABF6
            .word LB029
LAFAE       lda LBB76
            cmp #$02
            bne LAFBA
            jsr LABF6
            .word LB031
LAFBA       lda LBB76
            cmp #$03
            bne LAFC6
            jsr LABF6
            .word LB039
LAFC6       jsr L9987
            lda L0000,X
            eor LBB75
            sta L0000,X
            rts
LAFD1       .byte $01,$00,$00,$00,$00,$00,$00,$00
LAFD9       .byte $12,$67,$94,$91,$92,$43,$11,$01,$17,$32,$05,$08,$07,$56,$89,$01
            .byte $01,$73,$20,$50,$80,$75,$69,$00
LAFF1       .byte $24,$27,$43,$26,$72,$02,$62,$00
LAFF9       .byte $24,$27,$44,$49,$85,$36,$79,$00
LB001       .byte $37,$94,$39,$12,$95,$40,$83,$01
LB009       .byte $01,$28,$22,$98,$01,$60,$79,$01
LB011       .byte $02,$05,$17,$13,$76,$56,$42,$01
LB019       .byte $09,$19,$78,$93,$64,$83,$50,$00
LB021       .byte $00,$00,$00,$00,$00,$00,$00,$00
LB029       .byte $15,$23,$59,$87,$75,$59,$83,$01
LB031       .byte $01,$57,$07,$96,$32,$67,$95,$00
LB039       .byte $01,$04,$71,$97,$55,$11,$97,$00
LB041       lda L0000,X
            beq LB049
            and #$20
            beq LB04E
LB049       lda #$06
            jmp L94E1
LB04E       jsr LAC1F
            .word LBB65
            jsr LABF6
            .word LBB65
            jsr LA50B
            jsr LABCE
            .word LBB76
            clc
            lda LBB76
            adc #$01
            sta LBB76
            lda LBB77
            adc #$00
            sta LBB77
            lda LBB65
            ora #$10
            sta LBB65
            lda #$01
            sta LBB6C
            jsr LABF6
            .word LBB65
            jsr LABF6
            .word LB18C
            jsr L9F6D
            inx
            inx
            lda L00FE,X
            bne LB0AF
            lda LBB65
            and #$0F
            sta LBB65
            lda #$00
            sta LBB6C
            sec
            lda LBB76
            sbc #$01
            sta LBB76
            lda LBB77
            sbc #$00
            sta LBB77
LB0AF       jsr LABF6
            .word LBB65
            jsr LABF6
            .word LAE6E
            jsr L9993
            jsr LABF6
            .word LAE6E
            jsr L9993
            jsr LABF6
            .word LBB65
            jsr LABF6
            .word LB1E4
            jsr L9987
            jsr L99AB
            jsr LAC1F
            .word LBB78
            jsr LABF6
            .word LBB78
            jsr LABF6
            .word LBB78
            jsr L999F
            jsr LAC1F
            .word LBB80
            jsr LABF6
            .word LB1BC
            jsr LABF6
            .word LBB80
            jsr L999F
            jsr LABF6
            ldy L00B1,X
            jsr L9987
            jsr LABF6
            .word LBB80
            jsr L999F
            jsr LABF6
            .word LB1AC
            jsr L9987
            jsr LABF6
            .word LBB80
            jsr L999F
            jsr LABF6
            .word LB1A4
            jsr L9987
            jsr LABF6
            .word LBB80
            jsr LABF6
            .word LB1DC
            jsr L9987
            jsr LABF6
            .word LBB80
            jsr L999F
            jsr LABF6
            .word LB1D4
            jsr L9987
            jsr LABF6
            .word LBB80
            jsr L999F
            jsr LABF6
            .word LB1CC
            jsr L9987
            jsr LABF6
            .byte $80,$BB
            jsr L999F
            jsr LABF6
            .word LB1C4
            jsr L9987
            jsr L99AB
            jsr LABF6
            .word LBB80
            jsr L999F
            jsr LABF6
            .word LB194
            jsr L9987
            jsr LABF6
            .word LBB78
            jsr L999F
            jsr LABA6
            ror L00BB,X
            jsr LAA69
            jsr L9987
            jsr LABF6
            .word LB19C
            jsr L999F
            rts
LB18C       .byte $13,$16,$22,$77,$66,$01,$68,$01
LB194       .byte $18,$68,$58,$89,$63,$80,$65,$01
LB19C       .byte $02,$30,$25,$85,$09,$29,$94,$00
LB1A4       .byte $08,$51,$67,$31,$98,$72,$38,$00
LB1AC       .byte $21,$36,$82,$37,$02,$41,$50,$01,$06,$25,$03,$65,$11,$27,$90,$00
LB1BC       .byte $37,$14,$33,$38,$21,$53,$22,$01
LB1C4       .byte $02,$94,$15,$75,$01,$72,$32,$01
LB1CC       .byte $26,$49,$06,$68,$27,$40,$94,$01
LB1D4       .byte $04,$79,$25,$25,$60,$43,$87,$01
LB1DC       .byte $21,$32,$10,$47,$83,$50,$15,$01
LB1E4       .byte $01,$00,$00,$00,$00,$00,$00,$00
LB1EC       jsr LAC1F
            .word LBBA8
            jsr LABF6
            .word LBBA8
            lda L0000,X
            and #$1F
            sta L0000,X
            jsr LABF6
            .word LB36E
            jsr L9F6D
            inx
            inx
            lda L00FE,X
            beq LB20F
            lda #$06
            jmp L94E1
LB20F       jsr LABF6
            .word LBBA8
            lda L0000,X
            and #$1F
            sta L0000,X
            jsr LABF6
            .word LB376
            jsr L9F7A
            inx
            inx
            lda L00FE,X
            beq LB22E
            jsr LABF6
            .word LAFD1
            rts
LB22E       jsr LABF6
            .word LBBA8
            jsr LABF6
            .word LB37E
            jsr L999F
            jsr L9FC9
            jsr LABCE
            .word LBB76
            jsr LABA6
            .word LBB76
            jsr LAA69
            jsr LAC1F
            .word LBB5D
            jsr LABF6
            .word LBBA8
            jsr L9FC9
            jsr LAA69
            jsr LAC1F
            .word LBB4D
            jsr LABF6
            .word LBBA8
            jsr LABF6
            .word LBB4D
            jsr L9993
            jsr LAC1F
            .word LBB55
            jsr LABF6
            .word LBB4D
            jsr LABF6
            .word LBB5D
            jsr LABF6
            .word LB386
            jsr L999F
            jsr L9993
            jsr LABF6
            .word LBB55
            jsr L9987
            jsr LABF6
            .word LBB5D
            jsr LABF6
            .word LB38E
            jsr L999F
            jsr L9993
            jsr LAC1F
            .word LBB6D
            jsr LABF6
            .word LBB6D
            jsr LABF6
            .word $BB6D
            jsr L999F
            jsr LAC1F
            .word LBBA0
            jsr LABF6
            .word LB3A6
            jsr LABF6
            .word LBBA0
            jsr L999F
            jsr LABF6
            .word LB39E
            jsr L9987
            jsr LABF6
            .word LBBA0
            jsr L999F
            jsr LABF6
            .word LB396
            jsr L9987
            jsr LABF6
            .word LBB6D
            jsr L999F
            jsr LAC1F
            .word LBB88
            jsr LABF6
            .word LBBA0
            jsr LABF6
            .word LB3B6
            jsr L9987
            jsr LABF6
            .word LBBA0
            jsr L999F
            jsr LABF6
            .word LB3AE
            jsr L9987
            jsr LAC1F
            .word LBB90
            jsr LABF6
            .word LBB88
            jsr LABF6
            .word LBB90
            jsr LABF6
            .word LBB88
            jsr L9993
            jsr L99AB
            jsr LABF6
            .word LAE6E
            jsr L9987
            jsr LAC1F
            .word LBB98
            jsr LABF6
            .word LBB98
            jsr LABF6
            .word LBB98
            jsr L9987
            jsr LAC1F
            .word LBB98
            jsr LABF6
            .word LBB98
            lda LBB76
            and #$01
            beq LB35D
            jsr LABF6
            .word LB3BE
            lda LBB77
            bmi LB35A
            jsr L999F
            jmp LB35D
LB35A       jsr L99AB
LB35D       jsr LABA6
            ror L00BB,X
            jsr LABA6
            .word LB3C6
            jsr L987D
            jsr LA49F
            rts
LB36E       .byte $02,$00,$00,$00,$00,$00,$00,$02
LB376       .byte $15,$00,$00,$00,$00,$00,$00,$14
LB37E       .byte $18,$68,$58,$89,$63,$80,$65,$01
LB386       .byte $01,$15,$10,$00,$00,$00,$00,$00
LB38E       .byte $12,$92,$54,$64,$97,$02,$28,$04
LB396       .byte $05,$04,$46,$48,$89,$50,$58,$02
LB39E       .byte $01,$40,$08,$29,$97,$56,$28,$01
LB3A6       .byte $13,$32,$87,$36,$46,$51,$64,$02
LB3AE       .byte $01,$00,$89,$29,$77,$90,$11,$03
LB3B6       .byte $01,$12,$09,$40,$81,$09,$66,$02
LB3BE       .byte $03,$16,$22,$77,$66,$01,$68,$00
LB3C6       .byte $02,$00
LB3C8       lda L0000,X
            bne LB3CD
            rts
LB3CD       and #$20
            beq LB3D6
            lda #$06
            jmp L94E1
LB3D6       jsr LAC1F
            .word LBB65
            jsr LABF6
            .word LBB65
            jsr LA50B
            jsr LABCE
            .word LBB76
            clc
            lda LBB76
            adc #$01
            sta LBB76
            lda LBB77
            adc #$00
            sta LBB77
            lda LBB65
            ora #$10
            sta LBB65
            lda #$01
            sta LBB6C
            jsr LABF6
            .word LB491
            jsr LABF6
            .word LBB65
            jsr L999F
            jsr LABF6
            .word LB499
            jsr L9987
            jsr LAC1F
            .word LBBB0
            lda #$04
            sta LBBB8
LB425       jsr LABF6
            .word LBB65
            jsr LABF6
            .word LBBB0
            jsr L99AB
            jsr LABF6
            .word LBBB0
            jsr L9987
            jsr LABF6
            .word LAE6E
            jsr L999F
            jsr LAC1F
            .word LBBB0
            dec LBBB8
            bne LB425
            lda LBB76
            and #$01
            beq LB476
            clc
            lda LBB76
            adc #$01
            sta LBB76
            lda LBB77
            adc #$00
            sta LBB77
            jsr LABF6
            .word LBBB0
            jsr LABF6
            .word LB4A1
            jsr L999F
            jsr LAC1F
            .word LBBB0
LB476       clc
            lda LBB77
            bpl LB47D
            sec
LB47D       ror LBB77
            ror LBB76
            jsr LABF6
            .word LBBB0
            jsr LABA6
            .word LBB76
            jsr LA49F
            rts
LB491       .byte $18,$94,$42,$70,$00,$00,$00,$01
LB499       .byte $12,$23,$60,$70,$00,$00,$00,$01
LB4A1       .byte $13,$16,$22,$77,$66,$01,$68,$01
LB4A9       clc
            pla
            sta L0092
            adc #$03
            tay
            pla
            sta L0093
            adc #$00
            pha
            tya
            pha
            inc L0092
            bne LB4BE
            inc L0093
LB4BE       lda L0082
            sta L0094
            lda L0083
            sta L0095
LB4C6       ldy #$00
            lda (L0094),Y
            cmp (L0092),Y
            beq LB4DD
            iny
            lda (L0094),Y
            pha
            iny
            lda (L0094),Y
            sta L0095
            pla
            sta L0094
            jmp LB4C6
LB4DD       dex
            dex
            sec
            iny
            lda (L0094),Y
            sbc (L0092),Y
            sta L0000,X
            iny
            lda (L0094),Y
            sbc (L0092),Y
            sta NGFLAG,X
            rts
LB4EF       sta L0092
            lda L0000,X
            sta L0094
            lda NGFLAG,X
            sta L0095
            inx
            inx
            lda #$20
            ldy #$00
LB4FF       sta (L0094),Y
            iny
            cpy L0092
            bne LB4FF
            lda #$00
            sta L0093
            jsr LA42F
            beq LB514
            lda #$08
            jmp L94E1
LB514       jsr LA3F8
            beq LB51A
            rts
LB51A       ldy #$00
            lda (L0086),Y
            ldy L0093
            sta (L0094),Y
            jsr LAAEB
            jsr LA42F
            beq LB52B
            rts
LB52B       inc L0093
            lda L0093
            cmp L0092
            bne LB514
            rts
LB534       sta L0094
            sty L0095
            lda #$84
            sta L0096
            lda #$00
            sta L0097
            lda L0084
            sta L0098
            lda L0085
            sta L0099
            clc
            lda L0094
            adc #$04
            sta L0094
            lda L0095
            adc #$00
            sta L0095
LB555       ldy #$00
            lda (L0098),Y
            bne LB5CB
            iny
            lda (L0098),Y
            bne LB5CB
            clc
            ldy #$00
            lda L0094
            adc L0098
            sta (L0096),Y
            sta L0092
            lda L0095
            adc L0099
            iny
            sta (L0096),Y
            sta L0093
            ldy #$00
            lda #$00
            sta (L0092),Y
            iny
            sta (L0092),Y
            clc
            lda #$02
            adc L0092
            sta L008A
            lda #$00
            adc L0093
            sta L008B
            cmp L0083
            bcc LB59B
            beq LB595
LB590       lda #$0A
            jmp L94E1
LB595       lda L0082
            cmp L008A
            bcc LB590
LB59B       ldy #$00
            lda L0098
            sta (L0098),Y
            iny
            lda L0099
            sta (L0098),Y
            iny
            lda L0094
            sta (L0098),Y
            iny
            lda L0095
            sta (L0098),Y
LB5B0       lda L0000,X
            sta L0092
            lda NGFLAG,X
            sta L0093
            inx
            inx
            ldy #$00
            clc
            lda L0098
            adc #$04
            sta (L0092),Y
            lda L0099
            adc #$00
            iny
            sta (L0092),Y
            rts
LB5CB       clc
            lda L0094
            adc #$04
            sta L0092
            lda L0095
            adc #$00
            sta L0093
            ldy #$03
            lda (L0098),Y
            cmp L0093
            bcc LB620
            bne LB5EA
            ldy #$02
            lda (L0098),Y
            cmp L0092
            bcc LB620
LB5EA       clc
            lda L0094
            adc L0098
            sta L0092
            lda L0095
            adc L0099
            sta L0093
            ldy #$00
            lda (L0098),Y
            sta (L0092),Y
            iny
            lda (L0098),Y
            sta (L0092),Y
            ldy #$00
            lda L0092
            sta (L0096),Y
            iny
            lda L0093
            sta (L0096),Y
            sec
            ldy #$02
            lda (L0098),Y
            sbc L0094
            sta (L0092),Y
            iny
            lda (L0098),Y
            sbc L0095
            sta (L0092),Y
            jmp LB59B
LB620       ldy #$03
            lda (L0098),Y
            cmp L0095
            bcc LB648
            bne LB632
            ldy #$02
            lda (L0098),Y
            cmp L0094
            bcc LB648
LB632       ldy #$00
            lda (L0098),Y
            sta (L0096),Y
            lda L0098
            sta (L0098),Y
            iny
            lda (L0098),Y
            sta (L0096),Y
            lda L0099
            sta (L0098),Y
            jmp LB5B0
LB648       lda L0098
            sta L0096
            lda L0099
            sta L0097
            ldy #$00
            lda (L0096),Y
            sta L0098
            iny
            lda (L0096),Y
            sta L0099
            jmp LB555
LB65E       lda #$00
            sta L009A
            lda #$84
            sta L0096
            lda #$00
            sta L0097
            lda L0000,X
            sta L0092
            lda NGFLAG,X
            sta L0093
            inx
            inx
            sec
            ldy #$00
            lda (L0092),Y
            sbc #$04
            sta L0098
            iny
            lda (L0092),Y
            sbc #$00
            sta L0099
            cmp (L0098),Y
            beq LB68D
            lda #$09
            jmp L94E1
LB68D       dey
            lda L0098
            cmp (L0098),Y
            beq LB699
            lda #$09
            jmp L94E1
LB699       ldy #$01
            lda L0099
            cmp (L0096),Y
            bcc LB6C1
            bne LB6AB
            ldy #$00
            lda L0098
            cmp (L0096),Y
            bcc LB6C1
LB6AB       lda #$FF
            sta L009A
            ldy #$00
            lda (L0096),Y
            sta L0092
            iny
            lda (L0096),Y
            sta L0097
            lda L0092
            sta L0096
            jmp LB699
LB6C1       ldy #$00
            lda (L0096),Y
            sta (L0098),Y
            iny
            lda (L0096),Y
            sta (L0098),Y
            ldy #$00
            lda L0098
            sta (L0096),Y
            iny
            lda L0099
            sta (L0096),Y
            ldy #$02
            clc
            lda L0098
            adc (L0098),Y
            sta L0092
            iny
            lda L0099
            adc (L0098),Y
            ldy #$01
            cmp (L0098),Y
            bne LB72A
            ldy #$00
            lda L0092
            cmp (L0098),Y
            bne LB72A
            ldy #$00
            lda (L0098),Y
            sta L0092
            iny
            lda (L0098),Y
            sta L0093
            ldy #$00
            lda (L0092),Y
            sta (L0098),Y
            iny
            lda (L0092),Y
            sta (L0098),Y
            ldy #$00
            lda (L0098),Y
            iny
            ora (L0098),Y
            bne LB71A
            lda L0098
            sta L008A
            lda L0099
            sta L008B
LB71A       ldy #$02
            clc
            lda (L0098),Y
            adc (L0092),Y
            sta (L0098),Y
            iny
            lda (L0098),Y
            adc (L0092),Y
            sta (L0098),Y
LB72A       lda L009A
            bne LB72F
LB72E       rts
LB72F       ldy #$02
            clc
            lda L0096
            adc (L0096),Y
            sta L0092
            iny
            lda L0097
            adc (L0096),Y
            sta L0093
            ldy #$00
            lda (L0096),Y
            cmp L0092
            bne LB72E
            iny
            lda (L0096),Y
            cmp L0093
            bne LB72E
            ldy #$00
            lda (L0098),Y
            sta (L0096),Y
            iny
            lda (L0098),Y
            sta (L0096),Y
            ldy #$00
            lda (L0096),Y
            iny
            ora (L0096),Y
            bne LB76A
            lda L0096
            sta L008A
            lda L0097
            sta L008B
LB76A       clc
            ldy #$02
            lda (L0098),Y
            adc (L0096),Y
            sta (L0096),Y
            iny
            lda (L0098),Y
            adc (L0096),Y
            sta (L0096),Y
            rts
LB77B       sta L0090
            sty L0091
            lda L0000,X
            sta L008E
            lda NGFLAG,X
            sta L008F
            lda CASINI,X
            sta L008C
            lda CASINI+1,X
            sta L008D
            inx
            inx
            inx
            inx
            ldy #$00
LB795       lda (L008E),Y
            sta (L008C),Y
            inc L008C
            bne LB79F
            inc L008D
LB79F       inc L008E
            bne LB7A5
            inc L008F
LB7A5       inc L0090
            bne LB795
            inc L0091
            bne LB795
            rts
LB7AE       tay
            lda L0000,X
            sta L0092
            lda NGFLAG,X
            sta L0093
            inx
            inx
LB7B9       dey
            lda (L0092),Y
            dex
            sta L0000,X
            cpy #$00
            bne LB7B9
            rts
LB7C4       lda NGFLAG,X
            sta LBBDB
            lda L0000,X
            sta LBBDA
            inx
            inx
            jsr LA834
            lda #$00
            ldy #$0C
            sta (L0088),Y
            txa
            pha
            ldy #$10
            lda (L0088),Y
            tax
            jsr L8FC5
            lda #$03
            sta IOCB0+ICCOM,X
            ldy #$08
            lda (L0088),Y
            sta IOCB0+ICBAL,X
            iny
            lda (L0088),Y
            sta IOCB0+ICBAH,X
            lda #$0C
            sta IOCB0+ICAX1,X
            lda #$00
            sta IOCB0+ICAX2,X
            jsr CIOV
            bpl LB807
            jmp L96DB
LB807       lda LBBDA
            ora LBBDB
            beq LB840
            lda #$07
            sta IOCB0+ICCOM,X
            lda L0086
            sta IOCB0+ICBAL,X
            lda L0087
            sta IOCB0+ICBAH,X
            ldy #$04
            lda (L0088),Y
            sta IOCB0+ICBLL,X
            iny
            lda (L0088),Y
            sta IOCB0+ICBLH,X
            jsr CIOV
            bpl LB833
            jmp L96DB
LB833       dec LBBDA
            cmp #$FF
            bne LB807
            dec LBBDB
            jmp LB807
LB840       pla
            tax
            rts
LB843       ldy #$20
LB845       lda L0000,X
            eor #$FF
            and ICHIDZ,X
            sta ICHIDZ,X
            inx
            dey
            bne LB845
            rts
LB852       ldy #$20
            lda #$00
LB856       dex
            sta L0000,X
            dey
            bne LB856
            rts
LB85D       lda #$00
            sta L0092
            ldy #$20
LB863       lda ICHIDZ,X
            eor L0000,X
            ora L0092
            sta L0092
            inx
            dey
            bne LB863
            clc
            txa
            adc #$20
            tax
            lda L0092
            beq LB87B
            jmp L8D90
LB87B       jmp L8D85
LB87E       lda ICHIDZ,X
            lsr
            lsr
            lsr
            sta L0092
            lda ICHIDZ,X
            and #$07
            tay
            lda LB995,Y
            sta L0093
            clc
            txa
            adc L0092
            tay
            clc
            txa
            adc #$22
            tax
            lda L0000,Y
            and L0093
            beq LB8A3
            jmp L8D85
LB8A3       jmp L8D90
LB8A6       lda L0000,X
            sta L0092
            lda NGFLAG,X
            sta L0093
            inx
            inx
            ldy #$1F
LB8B2       dex
            lda (L0092),Y
            sta L0000,X
            dey
            bpl LB8B2
            rts
LB8BB       jsr LB85D
            jmp L938D
LB8C1       ldy #$20
LB8C3       lda ICHIDZ,X
            and L0000,X
            sta ICHIDZ,X
            inx
            dey
            bne LB8C3
            rts
LB8CE       ldy #$20
LB8D0       lda ICHIDZ,X
            ora L0000,X
            sta ICHIDZ,X
            inx
            dey
            bne LB8D0
            rts
LB8DB       lda #$00
            sta L0092
            ldy #$20
LB8E1       lda L0000,X
            eor #$FF
            and ICHIDZ,X
            ora L0092
            sta L0092
            inx
            dey
            bne LB8E1
            clc
            txa
            adc #$20
            tax
            lda L0092
            beq LB8FB
            jmp L8D90
LB8FB       jmp L8D85
LB8FE       lda L0000,X
LB900       lsr
            lsr
            lsr
            sta L0092
            lda L0000,X
            and #$07
            tay
            lda LB995,Y
            sta L0093
            inx
            inx
            clc
            txa
            adc L0092
            tay
            lda L0000,Y
            ora L0093
            sta L0000,Y
            rts
LB91F       lda #$00
LB921       sta L0092
            ldy #$20
LB925       lda ICHIDZ,X
            eor #$FF
            and L0000,X
            ora L0092
            sta L0092
            inx
            dey
            bne LB925
            clc
            txa
            adc #$20
            tax
            lda L0092
            beq LB93F
            jmp L8D90
LB93F       jmp L8D85
LB942       lda L0000,X
            sta L0094
            lda CASINI,X
            sta L0092
            inx
            inx
            inx
            inx
            lda L0094
            cmp L0092
            bcc LB97D
LB954       lda L0092
            lsr
            lsr
            lsr
            sta L0096
            lda L0092
            and #$07
            tay
            lda LB995,Y
            sta L0097
            clc
            txa
            adc L0096
            tay
            lda L0000,Y
            ora L0097
            sta L0000,Y
            lda L0092
            cmp L0094
            beq LB97D
            inc L0092
            jmp LB954
LB97D       rts
LB97E       lda ICHIDZ,X
            sta L0092
            lda ICDNOZ,X
            sta L0093
            ldy #$00
LB988       lda L0000,X
            inx
            sta (L0092),Y
            iny
            cpy #$20
            bne LB988
            inx
            inx
            rts
LB995       .byte $01,$02,$04,$08,$10,$20,$40,$80
LB99D       dex
            dex
            lda #$C3
            sta L0000,X
            lda #$BB
            sta NGFLAG,X
            lda #$14
            ldy #$00
            jsr LB534
            ldy #$08
            lda LBBC3
            sta (L0088),Y
            iny
            lda LBBC4
            sta (L0088),Y
            lda LBBBB
            ora LBBBC
            bne LB9C6
            jmp LBA8F
LB9C6       clc
            lda LBBBB
            adc LBBB9
            sta L0092
            lda LBBBC
            adc LBBBA
            sta L0093
LB9D7       sec
            lda L0092
            sbc #$01
            sta L0092
            lda L0093
            sbc #$00
            sta L0093
            lda L0092
            cmp LBBBB
            lda L0093
            sbc LBBBC
            bcs LB9F3
            jmp LBA8F
LB9F3       ldy #$00
            lda (L0092),Y
            cmp #$20
            beq LB9D7
            sec
            lda L0092
LB9FE       sbc LBBBB
            sta L0092
            lda L0093
            sbc LBBBC
            sta L0093
            clc
            lda L0092
            adc #$01
            sta L0092
            lda L0093
            adc #$00
            sta L0093
            lda #$0F
            cmp L0092
            lda #$00
            sbc L0093
            bcc LBA8A
            lda LBBBB
            sta L0094
LBA26       lda LBBBC
            sta L0095
            lda LBBC3
            sta L0096
            lda LBBC4
            sta L0097
            ldy #$01
            lda (L0094),Y
            cmp #$3A
            beq LBA6B
            cmp #$9B
            beq LBA48
            iny
            lda (L0094),Y
            cmp #$3A
            beq LBA6B
LBA48       ldy #$00
LBA4A       lda L0487,Y
            sta (L0096),Y
            iny
            cpy #$03
            bne LBA4A
            ldy #$00
LBA56       lda (L0094),Y
            iny
            iny
            iny
            sta (L0096),Y
            dey
            dey
            cpy L0092
            bne LBA56
            iny
            iny
            iny
            lda #$9B
            sta (L0096),Y
            rts
LBA6B       ldy #$00
            lda (L0094),Y
            cmp #$61
            bcc LBA7C
            cmp #$7B
            bcs LBA7C
            sec
            sbc #$20
            sta (L0094),Y
LBA7C       lda (L0094),Y
            sta (L0096),Y
            iny
            cpy L0092
            bne LBA7C
            lda #$9B
            sta (L0096),Y
            rts
LBA8A       lda #$07
            jmp L94E1
LBA8F       ldy #$0A
            lda #$01
            sta (L0088),Y
            lda LBBC3
            sta L0092
            lda LBBC4
            sta L0093
            ldy #$00
LBAA1       lda L0487,Y
            sta (L0092),Y
            iny
            cpy #$03
            bne LBAA1
            lda #$74
            sta (L0092),Y
            iny
            lda #$65
            sta (L0092),Y
            iny
            lda #$6D
            sta (L0092),Y
            iny
            lda #$70
            sta (L0092),Y
            iny
            lda L0087
            lsr
            lsr
            lsr
            lsr
            clc
            adc #$61
LBAC8       sta (L0092),Y
            iny
            lda L0087
            and #$0F
            clc
            adc #$61
LBAD2       sta (L0092),Y
            iny
            lda L0086
            lsr
            lsr
            lsr
            lsr
            clc
            adc #$61
            sta (L0092),Y
            iny
            lda L0086
            and #$0F
            adc #$61
            sta (L0092),Y
            iny
            lda #$9B
            sta (L0092),Y
            rts
            .byte $00
LBAF0       .byte $00
LBAF1       .byte $00
LBAF2       .byte $00
LBAF3       .byte $00
LBAF4       .byte $00
LBAF5       .byte $00
LBAF6       .byte $00
LBAF7       .byte $00
LBAF8       .byte $00
LBAF9       .byte $00
LBAFA       .byte $00
LBAFB       .byte $00
LBAFC       .byte $00
LBAFD       .byte $00
LBAFE       .byte $00
LBAFF       .byte $00
LBB00       .byte $00
LBB01       .byte $00
LBB02       .byte $00
LBB03       .byte $00
LBB04       .byte $00
LBB05       .byte $00
LBB06       .byte $00
LBB07       .byte $00,$00,$00,$00,$00,$00
LBB0D       .byte $00
LBB0E       .byte $00
LBB0F       .byte $00
LBB10       .byte $00
LBB11       .byte $00
LBB12       .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00
LBB23       .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00
LBB45       .byte $00,$00,$00,$00,$00,$00,$00,$00
LBB4D       .byte $00,$00
LBB4F       .byte $00
LBB50       .byte $00,$00,$00,$00,$00
LBB55       .byte $00,$00,$00,$00,$00,$00,$00,$00
LBB5D       .byte $00,$00,$00,$00,$00,$00,$00,$00
LBB65       .byte $00,$00,$00,$00,$00,$00,$00
LBB6C       .byte $00
LBB6D       .byte $00,$00,$00,$00,$00,$00,$00,$00
LBB75       .byte $00
LBB76       .byte $00
LBB77       .byte $00
LBB78       .byte $00,$00,$00,$00,$00,$00,$00,$00
LBB80       .byte $00,$00,$00,$00,$00,$00,$00,$00
LBB88       .byte $00,$00,$00,$00,$00,$00,$00,$00
LBB90       .byte $00,$00,$00,$00,$00,$00,$00,$00
LBB98       .byte $00,$00,$00,$00,$00,$00,$00
LBB9F       .byte $00
LBBA0       .byte $00,$00,$00,$00,$00,$00,$00,$00
LBBA8       .byte $00,$00,$00,$00,$00,$00,$00,$00
LBBB0       .byte $00,$00,$00,$00,$00,$00,$00,$00
LBBB8       .byte $00
LBBB9       .byte $00
LBBBA       .byte $00
LBBBB       .byte $00
LBBBC       .byte $00
LBBBD       .byte $00
LBBBE       .byte $00,$00,$00
LBBC1       .byte $00
LBBC2       .byte $00
LBBC3       .byte $00
LBBC4       .byte $00
LBBC5       .byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
            .byte $00,$00,$00,$00,$00
LBBDA       .byte $00
LBBDB       .byte $00
LBBDC       .byte $00
LBBDD       .byte $00
            nop
;
         
