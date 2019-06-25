Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 990E254E30
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2019 14:03:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 160CF1614;
	Tue, 25 Jun 2019 14:02:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 160CF1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561464217;
	bh=+s6/nkrTxefYTEmaz3r6q0lIQ05hI0WNuJo4zlPmeyg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aA5aGx2CXzULcNgEVhQfiGVNBmnHbFgpchcW+GzQvYb84eLPjErfFh05RPVcOxO+W
	 HL1Hd4DipDjNuvpVqIB31h3u8NGnn+ALb7IdcvQ2tmLWAXkjNrI4Wae7IHiNt360Or
	 pOPT0//eqkyeycsAGIXgPdx/sMjTFni0HSE1Rqdo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 607A0F896FC;
	Tue, 25 Jun 2019 14:01:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D7B3F896F9; Tue, 25 Jun 2019 14:01:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C16F1F896EA
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 14:01:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C16F1F896EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="pp7H62C8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b2J4Pt7t4hYVG7ofjpjNHmNyJ482a3sq6kwtJg/kj00=; b=pp7H62C8OUex2EpyNRapqgEJN
 bRL9VIiNb8IuO2noOl3YFsOczGlTpPE6vgs/UFEa7EOsdHSJrCaI4fCe9PGZHysZk8x6ojEX7kwgW
 EI0f0Rsa5NvJIrUya5hdhCGDzvZmIYdRvIAkHQf3Dpd22St9v2JsrQGL5bKflSXAAHG5M=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hfk8s-0005Dt-KL; Tue, 25 Jun 2019 12:01:42 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id A18BC440046; Tue, 25 Jun 2019 13:01:41 +0100 (BST)
Date: Tue, 25 Jun 2019 13:01:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Message-ID: <20190625120141.GQ5316@sirena.org.uk>
References: <20190617113644.25621-1-amadeuszx.slawinski@linux.intel.com>
 <20190617113644.25621-4-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190617113644.25621-4-amadeuszx.slawinski@linux.intel.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v2 03/11] ASoC: compress: Fix memory leak
 from snd_soc_new_compress
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
Content-Type: multipart/mixed; boundary="===============6500849911964352515=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6500849911964352515==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FpiZi7hT3UZZkRL4"
Content-Disposition: inline


--FpiZi7hT3UZZkRL4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2019 at 01:36:36PM +0200, Amadeusz S=C5=82awi=C5=84ski wrot=
e:
> Change kzalloc to devm_kzalloc, so compr gets automatically freed when
> it's no longer needed.
>=20
> Signed-off-by: Amadeusz S=C5=82awi=C5=84ski <amadeuszx.slawinski@linux.in=
tel.com>
> ---
>  sound/soc/soc-compress.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)

This will mean it'll get freed at some point if the driver for the
device it's allocated against gets removed but it will still get
allocated every time the card gets instntiated (eg, due to deferred
probe or due to some other driver getting probed and removed).

--FpiZi7hT3UZZkRL4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0SDSQACgkQJNaLcl1U
h9CaAwf8DVsk20XPT9zYetddOVSYB+aF3yUzSct7IemG29IlKRZZc/cPOycQkP92
weS9wGPzizmWuHiwwDCOsP9SooYKsYyYIRXJOldfrt4/tjnfuNNsjpF21/moUeoj
rDjJ2RZVz5qwKTkRuNxclDfo0i44/SKK+Mr5hcNGYV1G7hYngza5x45WwsY3N20F
56cNs8ct+Yd25TbrskUE+reGVIoSGrNei8tDunr9BOegLB/FAUdbFYZ61doHesf4
O+X+iNhE+/GbGAzxMUm5jZ6yDR2VEz63Kx4jtJ+auG1d5bOReWXxc/8ezeucdGMd
G4ZL2CALbTKAHgvtZu29cZaZ81T4Ew==
=m/VR
-----END PGP SIGNATURE-----

--FpiZi7hT3UZZkRL4--

--===============6500849911964352515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6500849911964352515==--
