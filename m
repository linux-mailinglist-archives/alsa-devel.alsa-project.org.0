Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9AC873C8C
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Mar 2024 17:47:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7857482C;
	Wed,  6 Mar 2024 17:47:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7857482C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709743634;
	bh=oqownLCVQSkUoTKT5XoUEGTUrAy5b210q5G72rB5tWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JkPRGGxXeMoOYxBR3JgjwXbjymyzy2iRKn8sfqdNXG56m22V5jPssyeQAl1SrW4U+
	 YXPjKjP9gniS+P7TqeCvpOF/sWsK/RGJfu9V6XArm9jx7nDtY/EJrl0GcdDq/dYP8T
	 s3OtTFapNnDvi6UTv/ny7TcVVAxqIeFOBzfhjwrY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3709F805A9; Wed,  6 Mar 2024 17:46:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E09FF805A1;
	Wed,  6 Mar 2024 17:46:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C942EF8024E; Wed,  6 Mar 2024 17:46:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65245F80093
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 17:46:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65245F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VT1otnHn
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9612061043;
	Wed,  6 Mar 2024 16:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8329FC433F1;
	Wed,  6 Mar 2024 16:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709743581;
	bh=oqownLCVQSkUoTKT5XoUEGTUrAy5b210q5G72rB5tWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VT1otnHnPHMfU1px85lS1GHKSvltK8wF1Gr1NN84kawjKasmSPxziz2MLNTf6vZrY
	 0bv+o2N85zcdczPMarK1iDAyWtSvzODi1G69k/t2pqGzeDhfg2LMk3OdWat/quiAyV
	 BHRxjMpe3IbM4DepV2TfWoFgHGdC5pLtu5/sinaoZgu3Z5CPqlAT/KAfK+IWe2DYBM
	 HDmJsZetCujNcqw/HMv4tnq9tNZjqEoHBSRcewfMr5USVVWGjEjMrOmpeX4c6Y2bF3
	 WAYRW5xfp7A0GX1Z0EyW2W5LaOma2FMdEIuTscfXrf4kj2pW52s4FqMn2URHbwha6h
	 Fvg2d8i8gvcrA==
Date: Wed, 6 Mar 2024 16:46:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Stuart Henderson <stuarth@opensource.cirrus.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 4/5] ASoC: wm8962: Fix wm8962_set_fll to use source
 instead of fll_id
Message-ID: <90fc91ae-0009-4cf1-8dd4-0f711e9c0c74@sirena.org.uk>
References: <20240306161439.1385643-1-stuarth@opensource.cirrus.com>
 <20240306161439.1385643-4-stuarth@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4tZc99IaNMjFZtgq"
Content-Disposition: inline
In-Reply-To: <20240306161439.1385643-4-stuarth@opensource.cirrus.com>
X-Cookie: Have at you!
Message-ID-Hash: GOBWVTU2RXJMD7LGZELTJGDFL2PFYSBK
X-Message-ID-Hash: GOBWVTU2RXJMD7LGZELTJGDFL2PFYSBK
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GOBWVTU2RXJMD7LGZELTJGDFL2PFYSBK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--4tZc99IaNMjFZtgq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 06, 2024 at 04:14:38PM +0000, Stuart Henderson wrote:

> Previously wm8962_set_fll was using fll_id to configure the source.

Which was a problem because...?

> This change is problematic, but it looks like there's limited
> users of this driver, and luckily they all seem to be intending to
> use WM8962_FLL_MCLK as the source which happens to have the same
> value as WM8962_FLL.

If the change is problematic why make it at all?

--4tZc99IaNMjFZtgq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXondcACgkQJNaLcl1U
h9CyCgf+PfnqyAIO4He9YKYcqZdFqmX1Y6LWOmcZizuzPlrBkbtVDMjLbJ2RrObb
gAOrMKGWOgJaZ7BwNS/L2pZ45G77p2OvmRhoT7BRQFt38QgkMhlfDNr1d+jpDzBO
Xz+t2FL8GVEkYVb7q6C2k1BDfDtguZaB/Ld2zX8PCamgBhnSYU81R91vkc+GHIRh
bZn6WrnAQ/bmq6Z42NLd9LSNNca4KvQhmOTh9QyGuC21lMpgnC8zdU3P25oMJU/Z
3sWh08Ws129OzmVpD9kPpazamzH2uBRkOx8LVMgoCUhCtShYgQ5DpsR+wAqPNjoB
seNWRk1Oev7kctFSAfwUNCrBBZIogg==
=HNjP
-----END PGP SIGNATURE-----

--4tZc99IaNMjFZtgq--
