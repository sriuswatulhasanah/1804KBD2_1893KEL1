DOMAINS
narkoba = symbol
gejala  = symbol
tanya   = string
jawab   = char
kondisi = list*
list    = string

FACTS
nama(kondisi)
false(list)
xcari(gejala)
xgagal(gejala)

PREDICATES 
nondeterm  mulai
nondeterm  mulai1
nondeterm  balik
	   cari(tanya,gejala)
	   gagal(tanya,gejala)
nondeterm  gejala(gejala)
           selesai
           simpan(gejala,jawab)
           tanya(tanya,gejala,jawab)
           go_once
nondeterm  diagnosa(narkoba)
           jenis(narkoba)
           dampak(narkoba)
nondeterm  oke(char)
nondeterm  ya(char)
nondeterm  lihat(kondisi)
zz	   (char,char)
       
CLAUSES
zz(A,A):-!. 
zz(_,_):-fail.

nama(["1.Dian Pertiwi H.P	1515015180", "2.Nadia		1515015184", "3.Sri Uswatul H	1515015193"]).
mulai:-
	write("*************************************************************************************************************"),nl,
	write("\t\t\tSELAMAT DATANG DI PROGRAM"),nl,
	write("\tSISTEM PAKAR PENDETEKSI JENIS NARKOTIKA YANG DIGUNAKAN PECANDU"),nl,
	write("*************************************************************************************************************"),nl,
	write("Nama Kelompok :"),nl,
	nama(Kelompok),
	lihat(Kelompok),
	balik.
balik:-
	write("*************************************************************************************************************"),nl,
	write("Masukkan Nama Anda : "),
	readln(Orang),
	write("Masukkan Umur Anda : "),
	readln(Umur),nl,
	write("*************************************************************************************************************"),nl,
	write("          Selamat Datang Diprogram Sistem Pakar Pendeteksi Narkotika Yang Digunakan Pecandu                  "),nl,
	write("*************************************************************************************************************"),nl,
	write("Nama Pengguna ",Orang," Berumur ",Umur," Tahun."),nl,nl,nl,
	write("*************************************************************************************************************"),nl,
	write("\t\tUntuk Memulai Program, Tekan Tombol 'Y'"),nl,
	write("*************************************************************************************************************"),nl,
	readchar(Y), ya(Y).
	ya(Y):-zz(Y,'y'), mulai1.
        ya(_):-balik.
        
        	lihat ([H|T]):-
                        not(false(H)),
                        write(H),nl,
                        lihat(T).
                        
                lihat([H|_]):-
                        assertz(false(H)).
                       
	    mulai1:-
                        go_once,nl,nl,
                        write("*************************************************************************************************************"),nl,
                        write("\t\t Terima Kasih Sudah Menggunakan Program Kami"),nl,
                        write("\t\t Tekan 'M' Jika Anda Masih Memiliki Gejala Lain."),nl,
                        write("\t\t Tekan 'X' Jika Anda Ingin Keluar."),nl,
                        write("*************************************************************************************************************"),nl,
                        readchar(Y),oke(Y).
                        oke(Y):-zz(Y,'M'),gejala(morfin).
                        oke(Y):-zz(Y,'m'),gejala(morfin).
                        oke(Y):-zz(Y,'X'),exit.
                        oke(Y):-zz(Y,'x'),exit.
                        oke(_):-mulai1.
                    
            go_once:-
                        diagnosa(_),!,
                        save("data.dat"),
                        selesai.
            go_once:-
                        write("\nMaaf Program Ini Tidak Dapat Menyelesaikan Gejala Yang Anda Hadapi"),nl,
                        selesai.
                        
            cari(_,Gejala):-
            		write("\nApakah "),
                        xcari(Gejala),!.
                        
           cari(Tanya,Gejala):-
                       not(xgagal(Gejala)),
                       tanya(Tanya,Gejala,Jawab),
                       Jawab = 'y'.   
                                                                              
            gagal(_,Gejala):-
                        xgagal(Gejala),!.
                        
            gagal(Tanya,Gejala):-
                        not(xcari(Gejala)),
                        tanya(Tanya,Gejala,Jawab),
                        Jawab = 't'.
                        
            tanya(Tanya,Gejala,Jawab):-
                        write(Tanya),
                        readchar(Jawab),
                        write(Jawab),nl,
                        simpan(Gejala,Jawab).
                        
            simpan(Gejala,'y'):-
                        asserta(xcari(Gejala)).
                        
            simpan(Gejala,'t'):-
                        asserta(xgagal(Gejala)).
                        
            selesai:-
                        retract(xcari(_)),fail.
                        
            selesai:-
                        retract(xgagal(_)),fail.
                        
            selesai.


       gejala(Gejala):-
              xcari(Gejala),!.
       gejala(Gejala):-
              xgagal(Gejala),!,fail.

        gejala(morfin):-
		cari(" Pupil Mata Menyempit? (y/t)",morfin),
		cari(" Denyut Nadi Semakin Lama Melambat? (y/t)",morfin1),
		cari(" Tekanan Darah Menurun? (y/t)",morfin2),
		cari(" Suhu Badan Menurun? (y/t)",morfin3),
		cari(" Produksi Air Seni Berkurang? (y/t)",morfin4),
		cari(" Anda Merasa Kebingungan? (y/t)",morfin5).
		
	gejala(heroin):-
		cari(" Merasa Gatal Pada Hidung? (y/t)",heroin),
		cari(" Merasa Mual dan Muntah-muntah? (y/t)",heroin1),
		cari(" Suka Menyendiri? (y/t)",heroin2),
		cari(" Pupil Mata Mengecil? (y/t)",heroin3),
		cari(" Tekanan Darah Menurun? (y/t)",heroin4).
		
	gejala(ganja):-
		cari(" Anda Sulit Diajak Berkomunikasi? (y/t)",ganja),
		cari(" Anda Sering Berfantasi (Mengkhayal)? (y/t)",ganja1),
		cari(" Denyut Nadi dan Jantung Lebih Cepat? (y/t)",ganja2),
		cari(" Anda Sulit Mengingat? (y/t)",ganja3).
		
	gejala(kokain):-
		cari(" Anda Sering Kejang-Kejang? (y/t)",kokain),
		cari(" Anda Sering Mengeluarkan Dahak? (y/t)",kokain1),
		cari(" Berat Badan Anda Menurun? (y/t)",kokain2),
		cari(" Anda Sering Merasa Kebingungan? (y/t)",kokain3).
		
	gejala(sabusabu):-
		cari(" Anda Mengalami Insomnia(Susah Tidur)? (y/t)",sabusabu),
		cari(" Anda Kekurangan Kalsium? (y/t)",sabusabu1),
		cari(" Jantung Anda Berdebar-debar? (y/t)",sabusabu2),
		cari(" Nafsu Makan Anda Berkurang? (y/t)",sabusabu3),
		cari(" Suhu Tubuh Anda Naik? (y/t)",sabusabu4).
		
	gejala(nikotin):-
		cari(" Anda Sering Sakit Kepala? (y/t)",nikotin),
		cari(" Saat Nafas Terasa Berat? (y/t)",nikotin1),
		cari(" Anda Merasa Meningkatnya Denyut Jantung? (y/t)",nikotin2),
		cari(" Suhu Badan Anda Menurun? (y/t)",nikotin3),
		cari(" Anda Sering Mengantuk? (y/t)",nikotin4). 

        diagnosa("Narkoba_morfin"):-
		gejala(morfin),
		gejala(morfin1),
		gejala(morfin2),
		gejala(morfin3),
		gejala(morfin4),
		gejala(morfin5),
		jenis("Mengkonsumsi Narkotika Jenis Morfin"),
		dampak("1. Peradangan Pada Hati.\n 2. Kerusakan Pada Sistem Otak.\n 3. Kadar Gula Yang Menurun.\n 4. Kesulitan Saat Berbicara (cadel).\n").
                        
        diagnosa("Narkoba_heroin"):-
		gejala(heroin),
		gejala(heroin1),
		gejala(heroin2),
		gejala(heroin3),
		gejala(heroin4),
		jenis("Mengkonsumsi Narkotika Jenis Heroin"),
		dampak("1. Pembuluh Darah Akan Pecah.\n 2. Masalah Pada Jantung dan Cabang Tenggorokan.\n 3. Impotensi.\n").
		
	diagnosa("Narkoba_ganja"):-
		gejala(ganja),
		gejala(ganja1),
		gejala(ganja2),
		gejala(ganja3),
		jenis("Mengkonsumsi Narkotika Jenis Ganja"),
		dampak("1. Kanker Paru-paru.\n 2. Gejala Gangguan Kejiwaan.\n 3. Kerusakan Sistem Kekebalan Tubuh.\n").
	
	diagnosa("Narkoba_kokain"):-
		gejala(kokain),
		gejala(kokain1),
		gejala(kokain2),
		gejala(kokain3),
		jenis("Mengkonsumsi Narkotika Jenis Kokain"),
		dampak("1. Kerusakan Pada Ginjal, Hati, dan Paru-paru.\n 2. Kontraksi Pembuluh Darah.\n 3. Kerusakan Pada Jaringan dalam Hidung.\n 4. Tekanan Darah Tinggi.\n 5. Kerusakan Pada Gigi.\n").
		
	diagnosa("Narkoba_sabusabu"):-
		gejala(sabusabu),
		gejala(sabusabu1),
		gejala(sabusabu2),
		gejala(sabusabu3),
		gejala(sabusabu4),
		jenis("Mengkonsumsi Narkotika Jenis Sabusabu"),
		dampak("1. Tekanan Darah Meningkat.\n 2. Infeksi Pada Paru-paru.\n 3. Pupil Membesar.\n").
		
	diagnosa("Narkoba_nikotin"):-
		gejala(nikotin),
		gejala(nikotin1),
		gejala(nikotin2),
		gejala(nikotin3),
		gejala(nikotin4),
		jenis("Mengkonsumsi Narkotika Jenis Nikotin"),
		dampak("1. Gangguan Pada Pembuluh Darah. \n 2. Kerusakan Pada Paru-paru, Hati dan Jantung.\n 3. Emfisema (Menbuat Paru-paru sulit mengeluarkan udara kotor).\n").	           
            
            jenis(Narkoba):-
                        write("\n A. Gejala Yang Terjadi Pada Anda Dikarenakan : ",Narkoba),nl.  

            dampak(Narkoba):-
                        write("\n B. Dampaknya adalah : \n ",Narkoba),nl.  
                        
GOAL
mulai,
mulai1.