Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CE74D3C76
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 22:56:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53108173A;
	Wed,  9 Mar 2022 22:56:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53108173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646863018;
	bh=MuDIshP39Br99xho8WFrKVoD0zrBHzj1OZGvd8WCq9s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FP3umlAWCTgTSE/C2Sw3i++j54QY/fUTy95gI85MulZiL9d86iuCDriuIl4kuZSVK
	 gp0HH79i1FLoHmq5vK6pYbsTTvNI8H1djtD3OKF8RZTnW7wSkh79BbsnpKd8jv4eue
	 BzjLKUCHcFdMN8nA0j+QgGrzCV+4undC71aUHfY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2F7BF80158;
	Wed,  9 Mar 2022 22:55:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1AC6F8016C; Wed,  9 Mar 2022 22:55:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FB83F80155
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 22:55:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FB83F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t1gCQRJL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 843D9B823D5;
 Wed,  9 Mar 2022 21:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96AD0C340E8;
 Wed,  9 Mar 2022 21:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646862945;
 bh=MuDIshP39Br99xho8WFrKVoD0zrBHzj1OZGvd8WCq9s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t1gCQRJLMDxzIzqz/1u7k+UazThQSU2vrcVVD4ZhPd8Jvw/GhrfDLZ6EYdvclBJ8H
 qPs7wlOzq6zI+Ij63Gk+4cAGZLMqazSoAN5/3ETpIVvR7tb3D1MFGCDq68MkNtxUXh
 qsaaSvb+VYx7NoGAlkVo/4Clmo3Fp8FUky4K7k4MNeejazgnB3kr7PY7PTGdnCN/In
 0w3dSONuUduyeUk6ZeJplwHGT9rp1b6Y0EMWpV9/GHs4c7WKMw36GEq8X1WIhFwCSQ
 +zUSmq0nhIN4KO60oZmDqMU/ShLHuRnD3od++zDSFBy7MMPcKWX3EMqPTqO55EMW//
 51sKL0IEJWsgQ==
Date: Wed, 9 Mar 2022 21:55:40 +0000
From: Mark Brown <broonie@kernel.org>
To: John Keeping <john@metanate.com>
Subject: Re: [PATCH v2] ASoC: tas5805m: fix pdn polarity
Message-ID: <YikiXAseSiODXfrD@sirena.org.uk>
References: <20220309135649.195277-1-john@metanate.com>
 <YijOHNT0eqDyoviP@sirena.org.uk> <YijTk0/UTXpjFiRq@donbot>
 <YijVrgZ+Ysv9J/8E@sirena.org.uk> <YikLB4+xHVxjFTSL@donbot>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZKks2OsGuCQev9Ka"
Content-Disposition: inline
In-Reply-To: <YikLB4+xHVxjFTSL@donbot>
X-Cookie: You will inherit millions of dollars.
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Daniel Beer <daniel.beer@igorinstitute.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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


--ZKks2OsGuCQev9Ka
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 09, 2022 at 08:16:07PM +0000, John Keeping wrote:
> On Wed, Mar 09, 2022 at 04:28:30PM +0000, Mark Brown wrote:

> > I think the device tree binding needs to be clarified here to be
> > explicit about this since there's obviously some room for user confusion
> > here.  We can probably get away with a change at this point since it's
> > not hit a release but we do need to try to avoid the situation where any
> > other implementations use active high polarity for the bindings.

> Taking a quick survey of the other devices that have a pdn-gpios
> property:

> - tvp5150 is correct with the driver setting 0 to make the device active

> - tas571x also sets 0 to make the device active

> - ak4375 uses the opposite sense setting PDN = 1 to make the device
>   active; this has no in-tree users and was merged as part of v5.17-rc1
>   so it's not in a released kernel yet

Sure, I still think it would be good to update the binding document to
clarify things as part of your patch - the binding currently just has it
as the "pdn" pin not the /pdn pin or anything.

--ZKks2OsGuCQev9Ka
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIpIlsACgkQJNaLcl1U
h9Asbwf/RncZY+eDETa9auGKTG01BmxAnoDpzRDq7suQvQyj54crfKeGyObcPJP+
6piYIybg415u2HwVlAiwLjbpXG8wAXlIP961i4Ut3cGrVUTPouNnQ1o7Bnmr75nF
7ptyqAn/omiQQXboNqNV1sfbY6iJAp/aLhp8B1YW2wN3gsV9H7rlxxv8iQL25yhY
aorj75FwexEimCL2krC986NcgkLKzD06VvocOTwFU2j4WuMUptL1SEDFCQs/nA/q
3ZuYat93gmViagMoc0Xy+PRy15irGVeXdgSW2NfFdc7HC63JN0LaYQUNgqRbu1Xx
BT1WMKFDaYfePaBxptW/t6h0bpm4Vg==
=xjx3
-----END PGP SIGNATURE-----

--ZKks2OsGuCQev9Ka--
