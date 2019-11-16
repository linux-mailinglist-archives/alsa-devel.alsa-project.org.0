Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C4EFEC6F
	for <lists+alsa-devel@lfdr.de>; Sat, 16 Nov 2019 14:27:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1345E168B;
	Sat, 16 Nov 2019 14:26:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1345E168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573910825;
	bh=TvuXsNobRJvPWLsJ6P7x60ci+1IRomXCJA+IukBx9OM=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EZCSekpAfZDht/h+SXzIZjhlYMPqxkPIv9B9PK2Tg1y9gcGnLvdConl1S8KSrEnU4
	 Fe4Zs0zlDrGUXqnqSocV5WqgzzbTCVqRMrJbmTI16tLGVm/BHz6U3B71RTMMNTK7lP
	 nM7EwUTDOqq0fUxsvONH/uLUbLrpgOuCUjdXie5g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E3F8F8010B;
	Sat, 16 Nov 2019 14:25:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DE25F80101; Sat, 16 Nov 2019 14:25:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp.gentoo.org (smtp.gentoo.org [140.211.166.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C990BF800FE
 for <alsa-devel@alsa-project.org>; Sat, 16 Nov 2019 14:25:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C990BF800FE
Received: from abudhabi.paradoxon.rec (p54A9D6F7.dip0.t-ipconnect.de
 [84.169.214.247])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: polynomial-c)
 by smtp.gentoo.org (Postfix) with ESMTPSA id 9402134CEB6;
 Sat, 16 Nov 2019 13:25:11 +0000 (UTC)
Date: Sat, 16 Nov 2019 14:25:04 +0100
From: Lars Wendler <polynomial-c@gentoo.org>
To: alsa-devel@alsa-project.org
Message-ID: <20191116142440.2b4e8e12@abudhabi.paradoxon.rec>
Organization: Gentoo
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: alsa-bugs@gentoo.org
Subject: [alsa-devel] compression format of alsa-ucm-conf and
	alsa-topology-conf tarballs
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2400607947600642084=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============2400607947600642084==
Content-Type: multipart/signed; boundary="Sig_/cB.1ImtnRsMvoTDdzWECvYy";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/cB.1ImtnRsMvoTDdzWECvYy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hello lists,

some shell output says more than any explanation:


lars@abudhabi:~/temp/alsa> wget -q
https://www.alsa-project.org/files/pub/lib/alsa-topology-conf-1.2.1.tar.bz2
lars@abudhabi:~/temp/alsa> wget -q
https://www.alsa-project.org/files/pub/lib/alsa-ucm-conf-1.2.1.tar.bz2
lars@abudhabi:~/temp/alsa> tar -xjf alsa-topology-conf-1.2.1.tar.bz2
bzip2: (stdin) is not a bzip2 file.
tar: Child returned status 2 tar: Error is not recoverable: exiting now
lars@abudhabi:~/temp/alsa(2)> tar -xjf alsa-ucm-conf-1.2.1.tar.bz2
bzip2: (stdin) is not a bzip2 file.
tar: Child returned status 2
tar: Error is not recoverable: exiting now
lars@abudhabi:~/temp/alsa(2)> file alsa-topology-conf-1.2.1.tar.bz2=20
alsa-topology-conf-1.2.1.tar.bz2: XZ compressed data
lars@abudhabi:~/temp/alsa> file alsa-ucm-conf-1.2.1.tar.bz2    =20
alsa-ucm-conf-1.2.1.tar.bz2: XZ compressed data
lars@abudhabi:~/temp/alsa>

Please rename the tarballs if possible.

Please CC me on replies. I'm not subscribed.

Kind regards
Lars
--=20
Lars Wendler
Gentoo package maintainer
GPG: 21CC CF02 4586 0A07 ED93  9F68 498F E765 960E 9B39

--Sig_/cB.1ImtnRsMvoTDdzWECvYy
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEWCOBmo8i7LhvVmNAVx3S0DQ8YDkFAl3P+LAACgkQVx3S0DQ8
YDmI0BAAiOYTPgLvX4azgVUqpK0XzMulHZWbSriKWiR/He577MYanAs05wRBd3SD
wZCHaMjQfoAHVjK+KXyT6qd1WHBJqulguv3bRBClm/YRdPrnB6L9qIBPrhNvrTXO
dMrWRoCAuzk3ACGKdLvJC36NiSsj7jfkyFOmIuh42hct+GA8ytJBTawyWAxuQ/Uf
2Zg87FHtqKEW9IcqML73F6hdZHtnvl+odsVPtRUxS6Sa9dAxYpLXs9aeFB5Eepvu
K3ToOf6HY7070edgMcg946ASciB7nxhyfbr7Tx+P3MUYxx7zCHzgzXpmeE8hgDlo
WlyJaNLsQgXY5c+Za3Sot0bqm6BOCX/O77BLL/qUxsBU1kKH4KazyHfOfFYKp0n6
WxW2AbangHU2XKdvfm2GfX//XlcJqWu/nHLp6rCxg4iCkT+eYyziCgAY8U2+hKf6
JOfnKkx6qPO7d0ezuPRy9+2nlk7lfokKFNAcrFsMBTCPKPsKkb2X5lP5g0OHrow1
MmcEOfQymg0s+nrFDHz1Dv+aCFdo4//8FGzZeNIkkH82B/UkUUUU+XpplBEPsLFC
Bf3J4tlhszHZcJqjMZB78xHmkRPCPCOkh00vf4Q4Lox3HVnlK5KohmZmKhOPGZVV
jwf25wJ9Fz9OIwqRG1sFdlApY2X4pR2KODLPnByk06SEPajVZ4Q=
=oSLF
-----END PGP SIGNATURE-----

--Sig_/cB.1ImtnRsMvoTDdzWECvYy--

--===============2400607947600642084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2400607947600642084==--
