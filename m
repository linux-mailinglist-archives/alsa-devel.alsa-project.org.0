Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 982D3118B60
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:45:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EB0A16AC;
	Tue, 10 Dec 2019 15:44:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EB0A16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575989104;
	bh=765HD6I9269EYzYdNRQRpOR7TtANnuVKvuUSiwp4CZU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zsc7m8wPgknx+30XkRLC9oPJRMth+obmtqEBE1WY/bJTs/rC6R3DZ5Ly++UTBR62c
	 kSM0e8S8I2M/WzfeAh2owA7cyqVLx5BlbnGiaf7DYffkS5mp8Hm3HJ3dQnbDXEafs+
	 jJe9VFST2QDqEXt6vBtK8W81XcPyHlS12dEwW4EU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D61EF80259;
	Tue, 10 Dec 2019 15:35:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D919F80258; Tue, 10 Dec 2019 15:35:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from tschil.ethgen.ch (tschil.ethgen.ch [5.9.7.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D338FF8011E
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:35:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D338FF8011E
Received: from [192.168.17.4] (helo=ikki.ket)
 by tschil.ethgen.ch with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <klaus@ethgen.ch>)
 id 1iegc4-0005EM-Kc; Tue, 10 Dec 2019 15:35:44 +0100
Received: from klaus by ikki.ket with local (Exim 4.93-RC7)
 (envelope-from <klaus@ethgen.ch>)
 id 1iegc4-00088H-7t; Tue, 10 Dec 2019 15:35:44 +0100
Date: Tue, 10 Dec 2019 15:35:44 +0100
From: Klaus Ethgen <Klaus@ethgen.ch>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191210143543.GA30935@ikki.ethgen.ch>
References: <20191202184759.GB29478@ikki.ethgen.ch>
 <s5hy2vsjbm3.wl-tiwai@suse.de>
 <20191207200643.GA10092@ikki.ethgen.ch>
 <s5h4kybciir.wl-tiwai@suse.de>
 <20191208173127.GE4433@ikki.ethgen.ch>
 <s5hmuc2asa7.wl-tiwai@suse.de>
 <20191209085716.GA12935@ikki.ethgen.ch>
 <s5h4ky9hmro.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5h4ky9hmro.wl-tiwai@suse.de>
OpenPGP: id=79D0B06F4E20AF1C;
 url=http://www.ethgen.ch/~klaus/79D0B06F4E20AF1C.txt; preference=signencrypt
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] CPU hook snd_hda_intel
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
Content-Type: multipart/mixed; boundary="===============4046852036310451509=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4046852036310451509==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

Let me add that this time I encountered the issue after taking the
laptop from the docking station.

After sending it to sleep and waking it up again, the problem is gone
(as it often can be solved).

Regards
   Klaus
-- 
Klaus Ethgen                                       http://www.ethgen.ch/
pub  4096R/4E20AF1C 2011-05-16            Klaus Ethgen <Klaus@Ethgen.ch>
Fingerprint: 85D4 CA42 952C 949B 1753  62B3 79D0 B06F 4E20 AF1C

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Charset: ISO-8859-1

iQGzBAABCgAdFiEEMWF28vh4/UMJJLQEpnwKsYAZ9qwFAl3vrT8ACgkQpnwKsYAZ
9qw35Qv/Sb3RSBxHNhGqGT7Y4n7SmggnfwgyZ9Z54pmTr6EnmQoV3ds1AhW+ntTy
FAbInhfvyfRVsMSXpBqf7xY9jPblj73qbF5qjbpcV2CcHhrBBcDZTWCmM4Ka+rJp
yyzfyhmtXwUsvjbNlT54YbVN35VbKmGS9V4mpq9mtWzNz8I0OvVDCQDcPzBiPNFo
7Daru9cXgEGW0arjV0GXK0kSxFSah3DIvpiEtxLlxrZA2cMyZ0LMwmufSoCsoZs0
83yYjrNNEbSUSjsH+bGyNFh/ESTNsqN8yqRwvt4fiRI+ds3rPSjEG2RXHaE0ZK1U
jv+QucN060eKll08yoisV+0pokV00Yvnod3f/Rsy5XACGKbVGtD3xLhhQs5hebpF
Yd8QhR0A0exGL3l5KfuXKX/askyu4pDzWU1t9GnAUGDwKGyfxwY3VquHC3EF/HvP
jxfLZbVK9u+Kh8RI8DFWLNZ0XgiJ0TCe207+A/WPTmpYyKadUsIJ5Xr3+1+2ZAcf
ZaLT2jfc
=CHEL
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--

--===============4046852036310451509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4046852036310451509==--
