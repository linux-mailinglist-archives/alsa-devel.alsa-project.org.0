Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C92AE68F6A2
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 19:10:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA33B83D;
	Wed,  8 Feb 2023 19:09:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA33B83D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675879825;
	bh=fvO4kfoXCO71nXATxc5DoBEa0pGGL3+VW8TCkPSaDoU=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FPN2zWF4KAyWvMkMU9sj9lRcMFrQLTKtP85gm3VmbOlmthQ0EzIVY5LpqyncZ6Wlp
	 9DSAjgepW2tWhonblGnoeK+0XmzRMLcbamKIUwn1IwX9VkXuOZ9wNFcaij9TIBa3WD
	 rHM0hKP9NUTOmxnlb9xZC5e5g0FHrLOSvCCflEA4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E76B5F8010B;
	Wed,  8 Feb 2023 19:09:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 160ABF8012B; Wed,  8 Feb 2023 19:09:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E279F8001E
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 19:09:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E279F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CrHSSqzB
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3DE9361777;
	Wed,  8 Feb 2023 18:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E028BC433D2;
	Wed,  8 Feb 2023 18:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675879767;
	bh=fvO4kfoXCO71nXATxc5DoBEa0pGGL3+VW8TCkPSaDoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CrHSSqzB0ssgQeJG5GnfaHJDTA3e1R+AXMoX3G322Oq7S5lgTdozDhfcE0kCdo+Wq
	 Us2ycozQvS+Z3C3P3MFk2zq7ifskn3QLMR2vRTbULADXEh6L77KS46FHvPuzQ4yyYJ
	 ux4V7JqcWXZ8aEukrIk470NVEircHoE72sGAhl14pVNEjEeKcytmzLyFmGV2Y36jlS
	 ya++j4uy3mOgukYIP06A+tIFvxrCY7HNM/6poQbytOsTEcU+lbSzfUgxPlHwhYvE+y
	 AGsX3SuaZMb1sA7JuWUpWF813tXJRqv5FYTpscwFpftlPZd04vJhaZOgofEFdr9ifp
	 0cWm4ZZS5SLCQ==
Date: Wed, 8 Feb 2023 18:09:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: wlf,wm8994: Convert to dtschema
Message-ID: <Y+PlUtAmbl5TJq6z@sirena.org.uk>
References: <20230208172552.404324-1-krzysztof.kozlowski@linaro.org>
 <Y+PeR4EFfcVDbUfV@sirena.org.uk>
 <51e8e157-3f60-1731-a8ca-4a678c8eafd6@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7tf0mCliiDHI8Xod"
Content-Disposition: inline
In-Reply-To: <51e8e157-3f60-1731-a8ca-4a678c8eafd6@linaro.org>
X-Cookie: Walk softly and carry a megawatt laser.
Message-ID-Hash: FEPOHPC2NF4N5KGGJEONSHWPYSD2MZYE
X-Message-ID-Hash: FEPOHPC2NF4N5KGGJEONSHWPYSD2MZYE
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 - <patches@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FEPOHPC2NF4N5KGGJEONSHWPYSD2MZYE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--7tf0mCliiDHI8Xod
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 08, 2023 at 06:50:56PM +0100, Krzysztof Kozlowski wrote:
> On 08/02/2023 18:39, Mark Brown wrote:
> > On Wed, Feb 08, 2023 at 06:25:52PM +0100, Krzysztof Kozlowski wrote:

> >> 1. Add missing LDO1VDD-supply for WM1811.

> > Both LDOs are present on all variants.

> The schematics for Arndale with WM1811 and WM1811 datasheet I found in
> internet say there is only LDO1VDD pin, thus "both" does not look
> correct at least for wm1811.

> But if you meant that this should be for WM8994 as well, then sure, I
> can change it.

Ah, now I think about it IIRC LDO2 uses one of the other digital input
supplies rather than a distinct supply so there's nothing for the DT.

> >> 2. Use "gpios" suffix for wlf,ldo1ena and wlf,ldo2ena (Linux kernel's
> >>    gpiolib already looks for both variants).
> >> 3. Do not require AVDD1-supply and DCVDD-supply, because at least on
> >>    Arndale board with Exynos5250 these are grounded.

> > Are you *sure* they are grounded and not supplied from the LDOs?

> That's what I have on schematics (attached), if I got it right.

You'll notice that they've got decoupling caps on rather than being
grounded - there's an internal connection to the LDO output so if the
LDOs are in use that's all that's required, while if the LDOs are not in
use for some reason then an external supply is connected there.

--7tf0mCliiDHI8Xod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPj5VEACgkQJNaLcl1U
h9B7aAf9Hx8NjZmQgmtfHsesBJ4m8zmqXIwFx7YPJGi1x4w2OjQE+cF7Drn/UtuW
LqosJbw4u6yCvrq5gKerLywWR/wW3noJoD3gfor1EYDlUgUd8CyRwH+ZD5KBL1oQ
89gb3O/ZHEgC5iaVN3KkUooWRu3+KhDHljeiHgWio0dDqhkDbB6BdO6GaCP/byWm
Mx9rK1bUGI9TWTfl3ny9l0bL6VwWHsrjDgQP1XToOUDY523di/RqCNxrbL43DRUB
0Pgqgcn3ZTGsFp+Lq+SH0AvmiVgZu/1SMiXzYci1AIWvDyK39WRT7T82fRgyEnBb
LnuxrO3XDkxFFzFc4iSIYLnSTNtf9A==
=PceK
-----END PGP SIGNATURE-----

--7tf0mCliiDHI8Xod--
