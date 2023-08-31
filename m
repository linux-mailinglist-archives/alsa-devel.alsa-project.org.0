Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5364A78ED01
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 14:25:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 091541FC;
	Thu, 31 Aug 2023 14:25:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 091541FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693484756;
	bh=nXWcobST5xvZcG1UeeKu5sV7yE2+CygPSMmrLOFEf0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ur8bLwuA0hMCPbNGmbuohb8DIu6lWTSDIZmexpqh+pTTzw42Dc/Fd9Di1oxqhQhBa
	 LNClF3afgPiLv3w5Ut3STDfTWHimSpTMFuGcNtv8cos2C+/DbcPTZzkC4zVCxRYkEX
	 V4u9GG8l+1d5mXjPZ0sL4cFnKA1/HEk+BOCv3bAc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7ABDEF80236; Thu, 31 Aug 2023 14:25:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CB58F800F5;
	Thu, 31 Aug 2023 14:25:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46DCDF80155; Thu, 31 Aug 2023 14:25:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B09FBF800D1
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 14:24:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B09FBF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Fs4kR/bS
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5E3B4627C5;
	Thu, 31 Aug 2023 12:24:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF801C433C9;
	Thu, 31 Aug 2023 12:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693484689;
	bh=nXWcobST5xvZcG1UeeKu5sV7yE2+CygPSMmrLOFEf0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fs4kR/bSqpjFjNJTJAWL64045RYFRG42iIS580k8R3taCUkllCPBectpxgvkgmDrq
	 q+kNnLogNk65FY+JkDL79buGJga9h42YQdq8IVF/43x2EWQvKsz31BzE++C2+/xZAP
	 zHkASNL3KxS7VJR7XIkcBalnDuCnq8A+qKLP1hh67KTc0B6iImTFPz8dBReoseG2Eg
	 h6v2M96nxJiAuxEpWn3KC5k1cDU26W+ncF+3VI+DN6VlCjMfokCXRkcEDjTCuBe8aS
	 SdATOOW67qPqB25TY8LlKww7ld60C+dOXtW+oBW3opY9/NA2gF5CxVhWkIsn/HqFfz
	 4MJAM/teGorxg==
Date: Thu, 31 Aug 2023 13:24:44 +0100
From: Mark Brown <broonie@kernel.org>
To: John Watts <contact@jookia.org>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/7] sun4i-i2s: Support channel remapping
Message-ID: <ZPCGjA9g8hVdr2Pm@finisterre.sirena.org.uk>
References: <20230811201406.4096210-1-contact@jookia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DeugAER/HXv/4y4M"
Content-Disposition: inline
In-Reply-To: <20230811201406.4096210-1-contact@jookia.org>
X-Cookie: Give him an evasive answer.
Message-ID-Hash: Z22PYMSI56ZYUVALHFSX7PNPYQ2THSZ6
X-Message-ID-Hash: Z22PYMSI56ZYUVALHFSX7PNPYQ2THSZ6
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z22PYMSI56ZYUVALHFSX7PNPYQ2THSZ6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--DeugAER/HXv/4y4M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 12, 2023 at 06:13:59AM +1000, John Watts wrote:

> First, I split up channel-dins and channel-slots. This is mainly
> because I implemented one first but both of them only make sense
> together. The registers themselves use a format of a byte per
> channel with the upper nibble being the din and the lower being
> the slot. Perhaps this is a better format to copy?

I think this is fine.

> Third, channel-slots is available on all sun4i-i2s controllers,
> but I only have it implemented on the R329 variant for now when
> there are multiple din pins.
> I could add support for this on older controllers but there's not
> really a use case for manual configuration as there's no DIN
> and I don't have hardware to test it on.

It's fine to leave this for someone who cares about that hardware to
implement, might be nice to add a warning if the properties are set but
not supported but it's not essential.

> Fourth, I don't limit the readable channels to the channels
> listed. Reading more channels than you have currently results in
> the controller assuming you want to use TDM, but that's not the
> case here and you can have strange duplicate channels show up.

It would be better to have constraints which prevent userspace doing the
wrong thing here.

> Fifth, it might be a good idea to increase the maximum channels
> from 8 to 16, especially if people are going to be running
> multiple TDM streams on one controller.

If there's no reason not to...

--DeugAER/HXv/4y4M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTwhowACgkQJNaLcl1U
h9CjTAf9Eb9zBoEzAuUZtcuChIs4gYOvUP+KJHWZQvgZ7KMKd9UsThI0n7CTASTY
yvJjmMWvrFRTRoW1aGyk4Vc+bBYNX+fVBlmwxcqrQtNda7MSGKlIpf/FNpGOOZEz
h5OjmgfIsLqH0KWJKkWrdQK581QDxGXtVGaJ/gzKtKmhsKyVyGsVHYRe4mc1kn47
dabSfrqQV1S1B3U6HhtVsZ4eF3kvxfiGkaGgyjr1Kwij5xkoAYW+HrYJf3N/lO5P
kCl1OMYD/9HGpIZneXwp+765K5ja28fM/nXtlbwrBIyN7BlNuFXoKo1rVqWXmpQc
9x/1s+zCXiDfKj9iX3gpEt4IrHmg1Q==
=CYGX
-----END PGP SIGNATURE-----

--DeugAER/HXv/4y4M--
