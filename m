Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C2AA1D95
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:49:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D971A15F8;
	Thu, 29 Aug 2019 16:48:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D971A15F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567090156;
	bh=U9FaPUIKkjmq35tRwGsbZak7xXcSdHg+3Fjbo66KE+8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oS/k3CpmL8sJLVJvg/AH1KXxTDVp971F57NUvLkZRqsKLu3V/AOj0orwp9bPLfALs
	 VqN468o4umA+ebR6ncnwZFUV0OojDDRbb4Kk9GHq8vZSTtVLINwvHWrwM5lO7mCUoT
	 zk39Cfb/uz7eZc+cz/0rMR49ok8trc57B62qCr/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8959F805A9;
	Tue, 27 Aug 2019 20:14:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA8EAF80445; Tue, 27 Aug 2019 20:14:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5573F802A0
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 20:14:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5573F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ieFQVefl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V/UcaU4EeSdHqUtL83nLzCKplC5y/OxX6AUl8iisM4g=; b=ieFQVeflIDdnhomkhIHE2o6+9
 hEtQBIghfiEmWGTnw2RAf00ImomLKDxCVWkCTJfwnxcJxlXJf98KD/68Y9/x1Y08kJ220GBw6GzFX
 PquP0c5A207abDqJzLuqpx+c+QGzU3QRf5O46Pn1mcVOgfK4p5FEWTq3MPy5iMCpm7hyg=;
Received: from 92.41.142.151.threembb.co.uk ([92.41.142.151]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i2fyv-0000t7-WE; Tue, 27 Aug 2019 18:14:14 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 841B7D02CE6; Tue, 27 Aug 2019 19:14:09 +0100 (BST)
Date: Tue, 27 Aug 2019 19:14:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Message-ID: <20190827181409.GH23391@sirena.co.uk>
References: <20190827142547.14577-1-mripard@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190827142547.14577-1-mripard@kernel.org>
X-Cookie: Don't SANFORIZE me!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 1/5] dt-bindings: sound: sun4i-spdif: Fix
 dma-names warning
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
Content-Type: multipart/mixed; boundary="===============1228881130763066933=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1228881130763066933==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fez1/uVX7m6GpeOd"
Content-Disposition: inline


--fez1/uVX7m6GpeOd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2019 at 04:25:43PM +0200, Maxime Ripard wrote:
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>=20
> Even though the H6 compatible has been properly added, the exeption for t=
he
> number of DMA channels hasn't been updated, leading in a validation
> warning.

Please use subject lines matching the style for the subsystem.  This
makes it easier for people to identify relevant patches.  This
doesn't even have ASoC in it...

--fez1/uVX7m6GpeOd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1lcvAACgkQJNaLcl1U
h9AQNwf/Wko2ywl/1pCNlhI8r5T9icdRCSO3aCusrcNdTqFPwCKGaybfQwcs7T1i
0ljLfvQoPvxUH1pj+ed4D4e1D+L2MNaGgm30zRQvPmoldJ23rYC3scQgom5ejb8Z
EfLTB7ogGLiwIysbn4eZojzA9AfJwkXdCsFPSR55iSGop/lztHREVQEGnW6Ktw+7
U52qHI6sJ0mYGJgA39HQarp4lwVuSHRgouhsvA/6CXQ4sLUxTwZYNZwh4hKd/c3u
+T0CZ022i3XwoWwGrD5VreO1Yas3ZU3jf7vT4gnpOrSH+oonnwHBfFl9nDCMMJB6
IDS3MJpUDnm64N8iliKuxAO3z3Jgow==
=7aoP
-----END PGP SIGNATURE-----

--fez1/uVX7m6GpeOd--

--===============1228881130763066933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1228881130763066933==--
