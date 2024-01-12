;Program ini menghitung luas persegi
;dengan dua buah input variable bebas panjang dan lebar yang dapat bernilai positif maupun negatif
;output luas sebagai variable terikat
NAME "DIMAS FADLY"           ; Nama program

INCLUDE 'emu8086.inc'    ; Include file emu8086.inc untuk akses fungsi input/output

#MAKE_COM#                ; Membuat file executable COM

ORG 100H                  ; Poin awal eksekusi program

JMP MULAI                 ; Loncat ke bagian MULAI

PSN1    DB "MENGHITUNG LUAS PERSEGI, DENGAN INPUT VARIABLE PANJANG DAN LEBAR",13,10
        DB "OUTPUT LUAS MERUPAKAN HASIL KALI VARIABLE PANJANG DENGAN LEBAR",13,10,13,10,'$'
PSN2    DB "MASUKKAN NILAI UNTUK PANJANG PERSEGI: $"  ; Pesan untuk input panjang
PSN3    DB "MASUKKAN NILAI UNTUK LEBAR PERSEGI: $"    ; Pesan untuk input lebar
PSN4    DB "LUAS PERSEGI TERSEBUT ADALAH: $"     ; Pesan untuk output luas
PSN5    DB 13,10,13,10,"TERIMA KASIH TELAH MENGGUNAKAN PROGRAM DIMAS..."
        DB 13,10,13,10,"TEKAN APAPUN UNTUK KELUAR DARI APLIKASI $" ; Pesan penutup

PJG     DW ?               ; Variabel untuk menyimpan panjang persegi
LBR     DW ?               ; Variabel untuk menyimpan lebar persegi
ARE     DW ?               ; Variabel untuk menyimpan luas persegi

MULAI:
LEA DX,PSN1               ; Menampilkan pesan awal
MOV AH,9
INT 21H

LEA DX,PSN2               ; Menampilkan pesan untuk input panjang
MOV AH,9
INT 21H

CALL SCAN_NUM             ; Memanggil fungsi untuk membaca input panjang

MOV PJG,CX                ; Menyimpan input panjang ke variabel PJG

PUTC 13                    ; Pindah ke baris baru
PUTC 10

LEA DX,PSN3               ; Menampilkan pesan untuk input lebar
MOV AH,9
INT 21H

CALL SCAN_NUM             ; Memanggil fungsi untuk membaca input lebar

MOV LBR,CX                ; Menyimpan input lebar ke variabel LBR

MOV AX,LBR                ; Memuat nilai lebar ke dalam register AX
MOV BX,PJG                ; Memuat nilai panjang ke dalam register BX
IMUL BX                    ; Mengalikan panjang dengan lebar (AX = AX * BX)
PUSH AX                    ; Menyimpan hasil perkalian pada stack

PUTC 13                    ; Pindah ke baris baru
PUTC 10

LEA DX,PSN4               ; Menampilkan pesan untuk output luas
MOV AH,9
INT 21H

POP AX                     ; Mengambil hasil perkalian dari stack ke dalam register AX
MOV ARE,AX                ; Menyimpan hasil perkalian ke variabel ARE

CALL PRINT_NUM            ; Memanggil fungsi untuk menampilkan nilai luas

PUTC 13                    ; Pindah ke baris baru
PUTC 10
LEA DX,PSN5               ; Menampilkan pesan penutup
MOV AH,9
INT 21H

MOV AH,0                  ; Menunggu input dari pengguna
INT 16H

RET                        ; Mengakhiri program

DEFINE_SCAN_NUM           ; Mendefinisikan fungsi SCAN_NUM untuk membaca input angka
DEFINE_PRINT_NUM          ; Mendefinisikan fungsi PRINT_NUM untuk menampilkan angka
DEFINE_PRINT_NUM_UNS
END                        ; Akhir program
