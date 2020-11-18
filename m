Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C942B7D1A
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 12:57:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7865D1734;
	Wed, 18 Nov 2020 12:56:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7865D1734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605700631;
	bh=8DteGFEDHExLDuA2v7dru1yYiDWrXBvYbEkB7IOOx9M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S7cM/KMiMDEkt+PpfnBokrjeKN2kM10Dd95Ge1zKfg5lTmKfykP3dnKdpEUYkJcjO
	 ZRtwj4QHr9+VuHlwVrzfZDQokGguK4rsuEkEq2N/zQLSm/g/S+in/CtATStYX6i5Zq
	 FSd/91sWwpqZ6RR5WzwwB/Y5jG19IrhW0xRhYnfw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8BD4F800EE;
	Wed, 18 Nov 2020 12:55:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC8D8F8016C; Wed, 18 Nov 2020 12:55:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0EE7F8010A
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 12:55:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0EE7F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xwgJeEmy"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E6AD241A5;
 Wed, 18 Nov 2020 11:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605700521;
 bh=8DteGFEDHExLDuA2v7dru1yYiDWrXBvYbEkB7IOOx9M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xwgJeEmynziAthU9g53yekIIrUgIiH1bzwT5ku+fxYAdOC0VUSZ43YFiHKPSTxLt8
 aiu93QGtGgxup7uDjot+smpTAaYzfmYVWErfrzB6utEY7ZZgIxcEH7E17aVVC80QtA
 Ex8ONgua+/RD2B8RxpEQUpxp5Onxui+iiK9lQLnM=
Date: Wed, 18 Nov 2020 11:55:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Viorel Suman <viorel.suman@nxp.com>
Subject: Re: [RFC PATCH] ASoC: ak4458: use reset control instead of reset gpio
Message-ID: <20201118115500.GB4827@sirena.org.uk>
References: <20201116222036.343635-1-viorel.suman@oss.nxp.com>
 <20201117173901.GH5142@sirena.org.uk>
 <VI1PR0401MB2272061C958E91FCAA239EB892E20@VI1PR0401MB2272.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="U+BazGySraz5kW0T"
Content-Disposition: inline
In-Reply-To: <VI1PR0401MB2272061C958E91FCAA239EB892E20@VI1PR0401MB2272.eurprd04.prod.outlook.com>
X-Cookie: A nuclear war can ruin your whole day.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "Viorel Suman \(OSS\)" <viorel.suman@oss.nxp.com>,
 Lee Jones <lee.jones@linaro.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--U+BazGySraz5kW0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 06:17:36PM +0000, Viorel Suman wrote:
> > On Tue, Nov 17, 2020 at 12:20:36AM +0200, Viorel Suman (OSS) wrote:

> > One thing I'm not clear on is if there's some way to ensure that we don=
't have
> > different instances of the device resetting each other without them not=
icing?
> > Shouldn't be an issue in practice for the use here.

> The way to ensure that we don't have different instances of the device re=
setting each
> other is to rely on the way the "shared" reset is handled by reset API:=
=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	ak4458->reset =3D devm_reset_control_get_optional_shared(ak4458->dev, N=
ULL);
> +	if (IS_ERR(ak4458->reset))
> +		return PTR_ERR(ak4458->reset);
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Flip side of that then, how do we know when a reset has actually
happened?

--U+BazGySraz5kW0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+1C5QACgkQJNaLcl1U
h9BTlwf/VhlrRagEG7wN6OlxHYPd9OiV954EhacCfzyEMonXn3zC5VRRohOBUsQb
RTRkVI3IDqwU9hgyexr2FvTl0zEmAUi01oqn8GiYGZ3xafVfswktws12UOx2zs9b
bj76W6qVi8Ufv9A0HMuIiF/PmsLt7JgvPI4EooIpBYDr/GfLsWyA+GHizzspHHbZ
wdTpt1/9+R3wwpVI9yyGMdkr2NOLw6v5AmRg9gKx+dhPkcfT9Fz24DS6/I96fyKS
bKhdhYs/92fKvYewx9JBP8903r0guzgKtcasrXw91Y8Nd0PMhjrI1ey37vFD8gnR
5OqW54VyBThSlYDN3p9iwZYif8hHAA==
=W4/r
-----END PGP SIGNATURE-----

--U+BazGySraz5kW0T--
