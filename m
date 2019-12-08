Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3571116337
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Dec 2019 18:33:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C8251664;
	Sun,  8 Dec 2019 18:32:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C8251664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575826401;
	bh=0iZXSPLxzPyZIDvtc1Q7KxVo9PVBMH0sw09cRusHkZw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qXZPwi9hUnrteeJL3vRuM/iJGgnT4blU4/I2v3FNP+ImSnSJxfNRDVUKKW/i5OpSI
	 OjZcW2HcthJPqaqvuXbH88c44nfYJqQK86cyyYrE+BbCTz0DCNe1HsCyHWfZZzmgn9
	 RTuZuqxqLZb4R5XK5bXoJsUb01yA4+a23UrpteYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65371F80248;
	Sun,  8 Dec 2019 18:31:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BD52F80217; Sun,  8 Dec 2019 18:31:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from tschil.ethgen.ch (tschil.ethgen.ch [5.9.7.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F0B0F800C4
 for <alsa-devel@alsa-project.org>; Sun,  8 Dec 2019 18:31:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F0B0F800C4
Received: from [192.168.17.4] (helo=ikki.ket)
 by tschil.ethgen.ch with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <klaus@ethgen.ch>)
 id 1ie0P2-0006pa-25; Sun, 08 Dec 2019 18:31:28 +0100
Received: from klaus by ikki.ket with local (Exim 4.93-RC7)
 (envelope-from <klaus@ethgen.ch>)
 id 1ie0P1-0005Zb-Kw; Sun, 08 Dec 2019 18:31:27 +0100
Date: Sun, 8 Dec 2019 18:31:27 +0100
From: Klaus Ethgen <Klaus@ethgen.ch>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20191208173127.GE4433@ikki.ethgen.ch>
References: <20191202184759.GB29478@ikki.ethgen.ch>
 <s5hy2vsjbm3.wl-tiwai@suse.de>
 <20191207200643.GA10092@ikki.ethgen.ch>
 <s5h4kybciir.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5h4kybciir.wl-tiwai@suse.de>
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
Content-Type: multipart/mixed; boundary="===============5976719492091187886=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5976719492091187886==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hwvH6HDNit2nSK4j"
Content-Disposition: inline


--hwvH6HDNit2nSK4j
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline

Hi Takashi,

Am So den  8. Dez 2019 um  9:45 schrieb Takashi Iwai:
> On Sat, 07 Dec 2019 21:06:43 +0100,
> > Find attached the perf output of the relevant event handler.
> 
> Thanks.  So it seems wasting in the busy loop for waiting for the
> response from the codec.
> 
> How about a patch below?  It's untested, might break things, but at
> least avoiding a busy loop.

I'll give it a try. Kernel is compiling right now. It might be hard to
see if the patch is working but I suppose that it do when I don't have
that trouble within a week or so.

> BTW, if your machine is Coffeelake or Cannonlake, this patch wont'
> work on the old branch because of forced polling mode.  It was removed
> in 5.5-rc1, so please test with Linus tree at best.

I hardly have such new Architectures on that laptop. It is a lenovo x61s
so it is from latest 2009. It has a Intel Core 2 Duo LV (Merom). :-)

I actually check it with gentoo kernel source 5.4.2.

Regards
   Klaus
-- 
Klaus Ethgen                                       http://www.ethgen.ch/
pub  4096R/4E20AF1C 2011-05-16            Klaus Ethgen <Klaus@Ethgen.ch>
Fingerprint: 85D4 CA42 952C 949B 1753  62B3 79D0 B06F 4E20 AF1C

--hwvH6HDNit2nSK4j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Charset: ISO-8859-1

iQGzBAABCgAdFiEEMWF28vh4/UMJJLQEpnwKsYAZ9qwFAl3tM2sACgkQpnwKsYAZ
9qxezwv/TKUYdEQcfFaeoCICIpGGgCXJavMD79GEh/rFvr727HX4+oha4G7gFrOU
93x93Bi5UyP9wSDZOlz5VcqnpsXu+/5n/HWS/FwYUGJ7GEuYT08JqEmu8N1Q4tiP
UvgzeshLU4EazNdk2CAZmfnR9VlRCkD379MHeFQr4n9nSonSfhCQtiTPcaO5AqVm
MRi+9s01t6e8za7LomtzzsoY7MkjX1S8eidKT8ZdLaJ+wLMQWLB/75jiKDDiKQca
wcMmoocrJ/lr+jbzGCsSmBoAHC8FqPuJuBeGpaqtdBCK2MNL5iKSch4+3DeyilcI
DC1wAaig4Xibw1lFN76uj4cK4wghGT7UHpNutVhUEQT3lxTBrLMXjT9hX+K2jD0m
Lzsrx+MDIa4erViPOiuf/B+QMIg8/2J53BrmDgYkbA4M1kGJxdfHLxjTrflAR+Wj
qHHUO94PnZtZymZHE0kiOajJmHFie9j005BofFjBXWpSzwj/QMHCZNgJlDuwljj7
GLrPpDi3
=3mAg
-----END PGP SIGNATURE-----

--hwvH6HDNit2nSK4j--

--===============5976719492091187886==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5976719492091187886==--
