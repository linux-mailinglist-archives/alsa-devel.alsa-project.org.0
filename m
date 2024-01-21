Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCBB8357E7
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Jan 2024 22:18:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 627CE83B;
	Sun, 21 Jan 2024 22:18:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 627CE83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705871926;
	bh=h45STSfPy1P3Y2GbWo89YV/iBga1C9nJ+uPwiQ9NLLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YdMZNmm4fFSlQuD2BqWkaxTF4xXcD+iw9o233YuRKQ1OkuFwCm0Ny+oZaQ51IYeRv
	 FE/T3MTBENzzVe28nE7Y+YGMY54CsYNPThUzOmndfhQvd6lW+c5lAl7nXcDh45N4JF
	 g4i304Iml6aTeOMbAVVGDBeGuxtBV95jhrkyyBkA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AE89F80589; Sun, 21 Jan 2024 22:18:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2050F80568;
	Sun, 21 Jan 2024 22:18:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A818FF8025F; Sun, 21 Jan 2024 22:18:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4BCBF800C1
	for <alsa-devel@alsa-project.org>; Sun, 21 Jan 2024 22:18:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4BCBF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YhR+7g+N
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5AEA460EB7;
	Sun, 21 Jan 2024 21:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A64EC433C7;
	Sun, 21 Jan 2024 21:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705871880;
	bh=h45STSfPy1P3Y2GbWo89YV/iBga1C9nJ+uPwiQ9NLLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YhR+7g+N26Oh8TUBBWHDR4e4Ao5+BO0iPfaqNrwoueieSZ2Y25fB5bmyNN4lALQOf
	 ZB6sWAyqtXi9S7gnUaSWKIA+mfRTZi4gUMswHz6vygxOk7mXg6jXDe1Ej8VqgW/2OP
	 XczGEJz/GK9DaABwFFQjEjhalev7oivpob93FI3hG8uWQ8Ww9CPrBSTxrfmkExenw9
	 QuSg0PpALT1HsFD/F1KRAM6hmWymcCaP8a+Virr5n8Hl+dneFGBqiIAV52bLtD6ChV
	 UuCldWKDA1SJ+lcg+QlLfmz2LOt1sFIR0gXw+LNycpe3MIiM5ryukpuPUxN5a3PvqB
	 bmy4uWMX+nlOg==
Date: Sun, 21 Jan 2024 21:17:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Michael Walle <michael@walle.cc>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	tudor.ambarus@linaro.org, pratyush@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sbinding@opensource.cirrus.com, lee@kernel.org,
	james.schulman@cirrus.com, david.rhodes@cirrus.com,
	rf@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, git@amd.com, amitrkcian2002@gmail.com
Subject: Re: [PATCH v11 03/10] spi: Add multi-cs memories support in SPI core
Message-ID: <Za2KBNsUmE6xRqD6@finisterre.sirena.org.uk>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-4-amit.kumar-mahapatra@amd.com>
 <3d3a11b1-8396-4d8e-9bb3-61ecb67e7efa@roeck-us.net>
 <d3c93c4c-3754-480c-84c2-9455ec8af702@roeck-us.net>
 <Zaxtm0JlQYU0/K/v@finisterre.sirena.org.uk>
 <ec7e7972-d48d-4a47-bd03-eec0c4334471@roeck-us.net>
 <9806d99fab46c928f337b30b21057b3e@walle.cc>
 <ed1de0d4-9a88-47b1-a280-b872f6fdecb6@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tcmSRZRy9C5FJXV1"
Content-Disposition: inline
In-Reply-To: <ed1de0d4-9a88-47b1-a280-b872f6fdecb6@roeck-us.net>
X-Cookie: You might have mail.
Message-ID-Hash: EAEGQCD6HIKDYXPAGPAUC25IIECVOGYM
X-Message-ID-Hash: EAEGQCD6HIKDYXPAGPAUC25IIECVOGYM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EAEGQCD6HIKDYXPAGPAUC25IIECVOGYM/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--tcmSRZRy9C5FJXV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 21, 2024 at 11:29:48AM -0800, Guenter Roeck wrote:

> So I guess 8 would be the absolute minimum to re-enable support for
> affected systems.

That's actually the number I went for, just waiting for CI to go
through before I send it out.

--tcmSRZRy9C5FJXV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWtigMACgkQJNaLcl1U
h9Bupwf9ElV4f82yrrRTlzrth8zQZIj8vOQ1sXS02CQRaCYayGxIcjYRGvRCtLvO
Rw0SV2fD+C7t+UMikK/3GPIstF42bYF7hpXWhIyvKXKS3jZiBE3Y21VQtvaDGVSO
oNkyDqph/hbwQ09ps9TUi6AC5LOQWHdm3QLM9pOrZ2jMr6z56Vge/RlkK4VoLHYg
PUIgguXVtDEK31eqYfmji9p8xByXg0B+88MH90buxC6H11PG2JIRnIMMTY95C8r4
VDiaT2HCw+nf36cpv6LbkMr68qARlHcdOA1H3bvy9ofNDbkkLcvV3q8cj0IDeDRV
xtlgLlOsbzrWoh7pcG6QTXtih3SIWg==
=X0HL
-----END PGP SIGNATURE-----

--tcmSRZRy9C5FJXV1--
