Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C578B4B29E4
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Feb 2022 17:15:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 654741A60;
	Fri, 11 Feb 2022 17:14:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 654741A60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644596128;
	bh=sNz2tFUsc7yL/pDTYZgBpCU9uV+JsVM0G9jqqLqvVS8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SPq4WiNR6lCK0qfO2NJtcfhLeRYbqqnlfp1xli18albaPE4/K5onZhk2W2ZGG0IDc
	 UBN1IVjMYMLBDi9fevqmDXJeGFXo28XOOjivETZGdwC6PSnp/K2VvtO3cPBR0nc9VV
	 DQ9UEioRmAMWox2QEqQ3yJd/15fVcSRE4yl7/fuM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE8EAF8013D;
	Fri, 11 Feb 2022 17:14:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05F5BF80139; Fri, 11 Feb 2022 17:14:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D199AF800B0
 for <alsa-devel@alsa-project.org>; Fri, 11 Feb 2022 17:14:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D199AF800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uwgNsAej"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1D2D7B82A95;
 Fri, 11 Feb 2022 16:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE074C340E9;
 Fri, 11 Feb 2022 16:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644596055;
 bh=sNz2tFUsc7yL/pDTYZgBpCU9uV+JsVM0G9jqqLqvVS8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uwgNsAej4XLRiZXEwDL7bwZAM73hhCpGYFCmS8Y6u8dtAKyi+fmfSTv9AJWAE2NeI
 KSzDwuVt9HFRbOvvpN1ayO7UN31FXA0Ceo6ao0md5ccyywTJcUwoi2C3JOV0sQrSGt
 RZWXUqS2O9OMReelWJYHPAB7PXNi3OMmTa9QRQXXRJYF1XB3VyhQGb3qQ2Nfq+2NN2
 KSVm73tUGepdEjLf02jl4IMwtYVaoUpB/Pp/TusIqrBCYPrpslzBOQOTE4Jsbz+4+V
 y/7LQF9rNVOomWzPV/XJkGr3z8oe/friRlhBR40sQwaU4/hcZbxA8/Fs7Rjw8Z3r7k
 B3GU6bwsnq+YQ==
Date: Fri, 11 Feb 2022 16:14:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [PATCH 00/15] ASoC: mediatek: Add support for MT8186 SoC
Message-ID: <YgaLUNQXnGsZHuXQ@sirena.org.uk>
References: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xkn+amad5HrevOtl"
Content-Disposition: inline
In-Reply-To: <20220211103818.8266-1-jiaxin.yu@mediatek.com>
X-Cookie: do {
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 geert+renesas@glider.be, linux-kernel@vger.kernel.org, zhangqilong3@huawei.com,
 tiwai@suse.com, lgirdwood@gmail.com, tzungbi@google.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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


--xkn+amad5HrevOtl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 11, 2022 at 06:38:03PM +0800, Jiaxin Yu wrote:
> This series of patches adds support for Mediatek AFE of MT8186 Soc.
> Patches are based on broonie tree "for-next" branch.

This all looks basically good, there are some issues which I've
highlighted on the patches but like I kept on saying they're all fairly
small and hopefully easy to address - there's no big structural problems
or anything that I noticed.

--xkn+amad5HrevOtl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIGi08ACgkQJNaLcl1U
h9CKkwf/SLonnfl3fV+46O1AC+u/WFZePStG+cGxvOGhs2iKcs612qJNEAOgEy0T
5lZRM+tTsja54tt7keZXc+AulVVpMOu2ROqTU4BJp3Zygt++snT8v2OTC3XSnjcI
vJOrvxSUxA3zKxdquTHgcCG+MQOjQi2B1MfD5gU5ZrJLhO9u6CjOSkhTFGwCdhn5
O38VRqcD17TbQXKnSqWKGOKJJWywGW84Gv2P7M7QlZqugFHkEzo21Fw+Y6m0SSQI
I/LKyDgTu+Me3OIweHSNrFO9WDAE3Pv8Q9V8alHjd+iGpGLJWBoHk3SMXVnCZEe2
xr5Jvd5fZyGKpL/T//Iyhxzqx84fDg==
=7jLS
-----END PGP SIGNATURE-----

--xkn+amad5HrevOtl--
