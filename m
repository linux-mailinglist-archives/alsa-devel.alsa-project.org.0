Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 373987FE1FD
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 22:32:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 881F9E80;
	Wed, 29 Nov 2023 22:32:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 881F9E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701293557;
	bh=YjAGVESRLvsK0NiT3pHkYj/TZu9G20YInTk2adZOymU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VDVa/gg7/Yf/GhOJRGrVplaX4JqGYFR69mpgw4kheUJoDNxjugZhBfy9zw5tWiv3G
	 WdkkoCUWzg0H8DTEt/3F1eSilVvC3U79EJOBxcVPPOyW99ux4d+vlNrOgiOTj+5MYx
	 KUmlvSiIdUMNvVvmZ9/XDAQl6KFq7JUQQ5tFtvyQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08D78F8058C; Wed, 29 Nov 2023 22:32:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E906F8016E;
	Wed, 29 Nov 2023 22:32:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13714F801D5; Wed, 29 Nov 2023 22:32:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38D09F80166
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 22:31:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38D09F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BobBgE+a
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 500E4B840A3;
	Wed, 29 Nov 2023 21:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839ABC433C7;
	Wed, 29 Nov 2023 21:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701293518;
	bh=YjAGVESRLvsK0NiT3pHkYj/TZu9G20YInTk2adZOymU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BobBgE+ag95f05O7EL6Uhtouac09JLNUCdsIE/dV/2drWWUJU1b/BCIhVqePRZM+B
	 sC9d1ININ1hhLLkDkT3lr2L/gA+Lc0uHChvGmc5ZfMvGwWouyiK1nrun+x5C9N0IdP
	 SNWTcsOoND6Bltar7FKmA7af+MX7r89Fx5FEwu3uKa5YCJ0CX6jLCLzZHuBVI0augW
	 sUUaWsbWapU9+oU8xTLB3SkbtYlSBmeBsr5JdEGA4CUI03JjjwYSq8Nyk1OehEDlGh
	 ww4DS+GvwVe8kGkFC5ueXenljhZzhPYz5iZHC9G9hF7Hl4jO0mhFbWpvestqPrAW6d
	 GaekCekp7GJCw==
Date: Wed, 29 Nov 2023 21:31:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Paul Handrigan <Paul.Handrigan@cirrus.com>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/10] ASoC: cs35l33: Fix GPIO name and drop legacy
 include
Message-ID: <1451c3ee-ae48-4151-ace4-2cf2ab9854ef@sirena.org.uk>
References: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
 <20231129-descriptors-sound-cirrus-v1-2-31aa74425ff8@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8qFzdh/puJOBRAP3"
Content-Disposition: inline
In-Reply-To: <20231129-descriptors-sound-cirrus-v1-2-31aa74425ff8@linaro.org>
X-Cookie: You enjoy the company of other people.
Message-ID-Hash: Z54JYOINCOXDITD6PCURN3RRDQBNBGYM
X-Message-ID-Hash: Z54JYOINCOXDITD6PCURN3RRDQBNBGYM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z54JYOINCOXDITD6PCURN3RRDQBNBGYM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--8qFzdh/puJOBRAP3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 29, 2023 at 10:28:38PM +0100, Linus Walleij wrote:

> Further the driver is requesting "reset-gpios" rather than
> just "gpios" from the GPIO framework. This is wrong because

s/gpios/reset/

--8qFzdh/puJOBRAP3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVnrccACgkQJNaLcl1U
h9DyeQf/TBc6PoOjQzWgFz59WRahFpJ5md8waFHS/0y3D3JoTSfMlIpeq9HNbUcu
YR1TQMT/ThWJ8Sgh2IF2d1ch07dG7o7CBwxHrwnbursrm+oiO0c1ddebK1n7M8a4
viHqQ3TKGM0DCPUd6xBMovcSDhRen+cEa4QGeIwEMHFwxRc9AGASBOFlqNJ5Ernr
LUoLhlVT+2f92i8m76vcFfMXk2ZC1j6p1dD4IEYdnvVU2CccBhKACAW5Lbz000uz
oZUTgiP/albHyyz3957NoNa1zVOfWSVPgB2O+Ie0I++jqxUhMLkKBqQQPa9P2X6E
v0Mh4fhQ77g+3grAWYbLd2nf+z41cA==
=5cDG
-----END PGP SIGNATURE-----

--8qFzdh/puJOBRAP3--
