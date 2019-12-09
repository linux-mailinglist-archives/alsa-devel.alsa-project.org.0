Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C231168C2
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 09:59:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A07811660;
	Mon,  9 Dec 2019 09:58:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A07811660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575881948;
	bh=N/h4ziAp3CGwlvAe5EIDs0yExGbZETtkjrOU3z0C8i8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PtQknfwPzd+pMUH28/BWcdpJq0jWpvMqVrtXXvXATAEkLHgFwycbrOxP8676fpLif
	 QqVm8W8ozMh7EqQyBe8jMSV0pVcZzJgkjs+M4+ZEWN7pM/+pH3t2wSmNhYJFbzNXSS
	 J2Yzkr8xzrIk/8fHtW9BPlig8ynW4iSf/r8PLoG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD1B2F8023F;
	Mon,  9 Dec 2019 09:57:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9920BF80234; Mon,  9 Dec 2019 09:57:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from tschil.ethgen.ch (tschil.ethgen.ch [5.9.7.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAF03F800C4
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:57:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAF03F800C4
Received: from [192.168.17.4] (helo=ikki.ket)
 by tschil.ethgen.ch with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <klaus@ethgen.ch>)
 id 1ieEr0-00082J-5w; Mon, 09 Dec 2019 09:57:18 +0100
Received: from klaus by ikki.ket with local (Exim 4.93-RC7)
 (envelope-from <klaus@ethgen.ch>)
 id 1ieEqy-0006mx-V9; Mon, 09 Dec 2019 09:57:16 +0100
Date: Mon, 9 Dec 2019 09:57:16 +0100
From: Klaus Ethgen <Klaus@ethgen.ch>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191209085716.GA12935@ikki.ethgen.ch>
References: <20191202184759.GB29478@ikki.ethgen.ch>
 <s5hy2vsjbm3.wl-tiwai@suse.de>
 <20191207200643.GA10092@ikki.ethgen.ch>
 <s5h4kybciir.wl-tiwai@suse.de>
 <20191208173127.GE4433@ikki.ethgen.ch>
 <s5hmuc2asa7.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5hmuc2asa7.wl-tiwai@suse.de>
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
Content-Type: multipart/mixed; boundary="===============0238044185973524887=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0238044185973524887==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b5gNqxB1S1yM7hjW"
Content-Disposition: inline


--b5gNqxB1S1yM7hjW
Content-Type: multipart/mixed; boundary="G4iJoqBmSsgzjUCe"
Content-Disposition: inline


--G4iJoqBmSsgzjUCe
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

Hi Takashi,

Am Mo den  9. Dez 2019 um  8:10 schrieb Takashi Iwai:
> > I hardly have such new Architectures on that laptop. It is a lenovo x61s
> > so it is from latest 2009. It has a Intel Core 2 Duo LV (Merom). :-)
> 
> OK, then could you give alsa-info.sh output, at least?
> Run the script with --no-upload option and attach the output.

Sure. See attached output.

Regards
   Klaus
-- 
Klaus Ethgen                                       http://www.ethgen.ch/
pub  4096R/4E20AF1C 2011-05-16            Klaus Ethgen <Klaus@Ethgen.ch>
Fingerprint: 85D4 CA42 952C 949B 1753  62B3 79D0 B06F 4E20 AF1C

--G4iJoqBmSsgzjUCe
Content-Type: application/x-xz
Content-Disposition: attachment; filename="alsa-info.txt.WdY1wyD7eu.xz"
Content-Transfer-Encoding: base64

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

--G4iJoqBmSsgzjUCe--

--b5gNqxB1S1yM7hjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Charset: ISO-8859-1

iQGzBAABCgAdFiEEMWF28vh4/UMJJLQEpnwKsYAZ9qwFAl3uDGYACgkQpnwKsYAZ
9qxdRwv/SR4wARSRU9OO4xjkaYqulnk6dhFlmvAOAJg1ZBWJq+Un69X4M+VSx7MM
6A7IUTxMrCkgO2sW7FBT3i7QbgkcirZRqNZwYs+IhbkA0xLgrWBb5DaytkxIPE1E
SwE9RDaxmNKQgXi6dx0KiLDnrMwarfiSgrrDx7e7ReBJicVtSxXrZ5f0GtoHIUN4
w0n5So9HCtg2Klwi3DemLVs4Pe5tds4CsWWXiv9I3crlHsUNUBC79vUx+9HM/et6
Gpiv3lwyVLybUccd4SoLYpbmiT6SnIfiadTDI1/Xq4cFvvy/HLWWGlOYGv2Eu6BE
URWu1BUvHBEKkSebA9L5VweQA+Szw0z/3WgN8Rt2/97Pu0wfG/10dX2vWNtf+tEU
GJIqpK0UEp4Rc9zLXwjDlXFLh+IiYuvVOOBrFeagTn3fFwW2zrkP8qViBka4jC7X
EqKQdilL6ZFQF5lKCx+LDxuyW8Zi6SiO5fgeyr/dMKU1kvLH4eIu6VFlqcRRnllo
5XbLQ1M+
=fH4z
-----END PGP SIGNATURE-----

--b5gNqxB1S1yM7hjW--

--===============0238044185973524887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0238044185973524887==--
