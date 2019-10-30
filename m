Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE09E9AE0
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 12:36:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC38922B8;
	Wed, 30 Oct 2019 12:35:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC38922B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572435407;
	bh=1073+xW0SueQowg4iGYYHCPEN3mVJQDme1E2vLo0d+k=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CL48Z8oc8oFeWhmQGLU9zz2wCrDKHsN+q62YDYr/JPnQYIpJRGQsDMYdFN61nsNAr
	 BtoZX8A2NPlJMYfLw5U+9gZgOUP+phHkrMxhDW4GWoeqdSZ5r2yd2BWDeBX+56e6Y0
	 ph8+/9o0Vpv7bMHtcihMuJp8/U90yhJlCtRFQ8Uk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD84CF802A1;
	Wed, 30 Oct 2019 12:35:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0185DF80361; Wed, 30 Oct 2019 12:35:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62271F802A0
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 12:34:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62271F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="A/sR6vcR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bhul+HOwsR+VVQmVESE/ogLY9pGeXioqFcD7W2VG9QQ=; b=A/sR6vcRSW4myAv82t0f4DaAQ
 J0EKd5t8PKUT2l+kaWuJSjg1LfpYPt5WW09SDD/kZlJtfm6BK6UH4fW+Z2NQEj1D7UvvdRF6/nR3m
 JOGeFU/INH0VRAKRR3nu/tZMnM7xBwgEOIYCRtXgXPG2jxB/0onPrG76NmaGwcjfdVAe0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iPmFe-0004p9-Bk; Wed, 30 Oct 2019 11:34:58 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 602E027420F4; Wed, 30 Oct 2019 11:34:57 +0000 (GMT)
Date: Wed, 30 Oct 2019 11:34:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20191030113457.GB6693@sirena.co.uk>
References: <874kzrdo1x.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
In-Reply-To: <874kzrdo1x.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Walk softly and carry a BFG-9000.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 resend 00/18] ASoC: soc-core cleanup -
	step 4
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
Content-Type: multipart/mixed; boundary="===============1004798946539758360=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1004798946539758360==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EuxKj2iCbKjpUGkD"
Content-Disposition: inline


--EuxKj2iCbKjpUGkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 30, 2019 at 10:23:06AM +0900, Kuninori Morimoto wrote:

> These are resend of soc-core cleanup step4.
> These are based on mark/for-5.5 branch.
> I already got report from Intel that these had no issue on Intel CI machine.

OK, that's not very visible :(  I'd been waiting for the review from
them that you said was needed.

--EuxKj2iCbKjpUGkD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl25dWAACgkQJNaLcl1U
h9AClQf/Zmh1ob6yUCLWHjCv/d4znktEAwwpTFK8Ze/FHDcURW5TOrE0Hq73/eM6
+YtVQ6/SpVgMax9ASddAmwX6ynsVnstTE/1BJznxue+k/e63cILPwMaSkUXeEVxg
ZmYJstUYIROdmjFFupOZ42ZvcH5mVBqKIWIplOWZsexqE3SqhpvTPVUqOpiUlsLx
nzWCDAA2babNsWYwAOmwAlLsLmVcWF/o2Cp6XWyDkLtY8hXDTV6oAMJaXjVVSwbP
PL/ny/e4lVBjjGEWP2kO1+clTagtxoCdBuzRzJENFAb3pJ0fuZNro2qegsxg5ljJ
XFGKwRmm7ej8iXvQEDc1FE8y8R4ZsA==
=FRC6
-----END PGP SIGNATURE-----

--EuxKj2iCbKjpUGkD--

--===============1004798946539758360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1004798946539758360==--
