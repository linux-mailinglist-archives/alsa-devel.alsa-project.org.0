Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B87187EA1D
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Mar 2024 14:31:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BF3121A4;
	Mon, 18 Mar 2024 14:31:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BF3121A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710768700;
	bh=9Fc4MdmLlXNEnOvlrkuX3SM2n8OiLdq3X0zd5LtujCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UFSjTD3v5q5Ibm/HZNhardZD7oxTJ12W++ZYXlBXph2wMFjBEOkoRNLbD+ypV76PV
	 vuenHXuEQg9QdyS1H0LYHlDL76TGWw0qlLjleD8u5OtcGy8rQNgn3/Hmd8GA5t1IRo
	 kkJIFJKeGmFmO4OGfYcjnmvPAW9uk6HRa46bbXaY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08A00F805AC; Mon, 18 Mar 2024 14:31:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86532F805A1;
	Mon, 18 Mar 2024 14:31:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADEF9F804E7; Mon, 18 Mar 2024 14:31:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5A75F8010B
	for <alsa-devel@alsa-project.org>; Mon, 18 Mar 2024 14:30:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5A75F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JqclMs/D
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4182BCE0201;
	Mon, 18 Mar 2024 13:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5D9C433C7;
	Mon, 18 Mar 2024 13:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710768655;
	bh=9Fc4MdmLlXNEnOvlrkuX3SM2n8OiLdq3X0zd5LtujCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JqclMs/DzIEOK7ZpEwUgIzoVU1UjeIdAZZQdx6vUjh0lzTWdigVBvpZmOlesultD5
	 JTkAUd9Pfse0PNMT4KOwhhsltIaS+gU5RreTQcUBhyH8ZHJTgjpgx7sqsN8RHuuveY
	 sNriNDMViTvF8HK/DqLXLbfe6iXTq9EnlQOhSCIQFdLdlUS6o/jl0HIK2dEoh32VzZ
	 h1n/0ieViBX9jibuxMJTowPxhqmHCzl01P8ZfrChyC/0CMImwwn7nOHfNCLVuDYe6x
	 nljETBFTEnkf8ghtUnwR69ixxtFuhvfglePyeZODASc98n15rwteIxYKNyJbpZVDqo
	 ZtXX5hnGlSU5A==
Date: Mon, 18 Mar 2024 13:30:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
	kernel@salutedevices.com
Subject: Re: [PATCH 09/25] ASoC: meson: g12a-toacodec: add support for A1 SoC
 family
Message-ID: <143bb232-1ba8-4e91-92a7-bab7c14f6df0@sirena.org.uk>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-10-jan.dakinevich@salutedevices.com>
 <2a41e8b6-7e8a-4995-a1d7-c5d30e53c2d5@sirena.org.uk>
 <3ae535cf-9a89-4187-a761-8390d649b00b@salutedevices.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kjWorJl0TaUMqWHd"
Content-Disposition: inline
In-Reply-To: <3ae535cf-9a89-4187-a761-8390d649b00b@salutedevices.com>
X-Cookie: Alaska:
Message-ID-Hash: MUQZPGMNKA47DTPG7RHA3TU7P3J7ORRQ
X-Message-ID-Hash: MUQZPGMNKA47DTPG7RHA3TU7P3J7ORRQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MUQZPGMNKA47DTPG7RHA3TU7P3J7ORRQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--kjWorJl0TaUMqWHd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 17, 2024 at 06:19:36PM +0300, Jan Dakinevich wrote:
> On 3/15/24 16:33, Mark Brown wrote:

> > If the maximum register is 0 how does the regmap have a stride?

> reg_stride inherited from existing code. Apparently, it was meaningless
> even before my modifications (the hardware has single register
> regardless of max_register declaration) and it should be dropped. But,
> is it okay to remove it in the same commit?

Sure.

--kjWorJl0TaUMqWHd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX4QgEACgkQJNaLcl1U
h9BLdQf/Zz1jN3+6EFmJI8/2S5KURnuXZVf/whz0eP6IHVV+novzn9bZzi9aDR8u
ivtJ5z3NMrKZpT3yKRb/iP42lcArTnbx8KtRbgkpBCvSW0xodc7pyVJqfkvIDPNg
ribamZQkNViB+vRZe+1M+lKpXGKZQT9VihxnkNjxjIBjjiDONfYP9zzHFNQorPlh
lZLfVCdNixkECtkZ8S2pC9SUMOTqVNHUNloEosl515koEkh5H3wWA4izpVAgFuCd
sAtcI63aM0UfO63qTzXy4qk4482W57UwJx6DuSSws6Y0DSjBpq7nw2gJw6MQb8SE
xTDZc6yggF0aEYdVMCor8vldLH2yxw==
=osK+
-----END PGP SIGNATURE-----

--kjWorJl0TaUMqWHd--
