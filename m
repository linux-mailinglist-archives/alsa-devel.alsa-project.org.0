Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FDD72AB96
	for <lists+alsa-devel@lfdr.de>; Sun, 26 May 2019 20:24:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C50E1757;
	Sun, 26 May 2019 20:23:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C50E1757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558895056;
	bh=XG4wleFfBLdeJPHeGOct4rO6EUozLV0l+fsuyFtQock=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DnEGrxO0VCJkMBVJljHAUo+DsaG///ohquTbf4guJRQjZZflxuDCGV+mD2WeI7Rme
	 Fgl8myJRMFsYzAHzlPcTvgHuYyd9pzNZYMgCPUz4cJoZqPFIIhMRiPY4XDmej90qiS
	 4Iyt+pSAjbvc3viMBvHQbDJM1FJUPRiw9dziaqN4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B95A8F896B8;
	Sun, 26 May 2019 20:22:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF5D3F896EB; Sun, 26 May 2019 20:22:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=5.0 tests=PRX_BODY_26,PRX_BODY_30,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2CD0F89619
 for <alsa-devel@alsa-project.org>; Sun, 26 May 2019 20:22:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2CD0F89619
X-Originating-IP: 90.89.68.76
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id E0DAAFF803;
 Sun, 26 May 2019 18:22:20 +0000 (UTC)
Date: Sun, 26 May 2019 20:22:20 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Message-ID: <20190526182220.hgajlcyssujjkmiu@flea>
References: <20190525162323.20216-1-peron.clem@gmail.com>
 <20190525162323.20216-2-peron.clem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190525162323.20216-2-peron.clem@gmail.com>
User-Agent: NeoMutt/20180716
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v3 1/7] dt-bindings: sound: sun4i-spdif:
 Add Allwinner H6 compatible
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
Content-Type: multipart/mixed; boundary="===============2194744725676524510=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2194744725676524510==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="psc5odxto6fmnb22"
Content-Disposition: inline


--psc5odxto6fmnb22
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 25, 2019 at 06:23:17PM +0200, Cl=E9ment P=E9ron wrote:
> Allwinner H6 has a SPDIF controller with an increase of the fifo
> size and a sligher difference in memory mapping compare to H3/A64.
>
> This make it not compatible with the previous generation.
>
> Introduce a specific bindings for H6 SoC.
>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/sound/sunxi,sun4i-spdif.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/sunxi,sun4i-spdif.tx=
t b/Documentation/devicetree/bindings/sound/sunxi,sun4i-spdif.txt
> index 0c64a209c2e9..c0fbb50a4df9 100644
> --- a/Documentation/devicetree/bindings/sound/sunxi,sun4i-spdif.txt
> +++ b/Documentation/devicetree/bindings/sound/sunxi,sun4i-spdif.txt
> @@ -7,10 +7,11 @@ For now only playback is supported.
>
>  Required properties:
>
> -  - compatible		: should be one of the following:
> +  - compatible		: Should be one of the following:
>      - "allwinner,sun4i-a10-spdif": for the Allwinner A10 SoC
>      - "allwinner,sun6i-a31-spdif": for the Allwinner A31 SoC
>      - "allwinner,sun8i-h3-spdif": for the Allwinner H3 SoC
> +    - "allwinner,sun50i-h6-spdif": for the allwinner H6 SoC

This won't apply anymore on top of next, we've moved to a YAML
schemas.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--psc5odxto6fmnb22
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOrZXAAKCRDj7w1vZxhR
xehgAQDOcuI0MFI4WlSZ6gB352Ad8vsUL9N1MElpyvk09ZwjRQEAt9hBwX5dJWpV
oqCVDFu0/sZMMNzIZydtd7mLfyUf8AU=
=Vygo
-----END PGP SIGNATURE-----

--psc5odxto6fmnb22--

--===============2194744725676524510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2194744725676524510==--
