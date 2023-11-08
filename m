Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CB37E57CD
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 14:08:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80A70828;
	Wed,  8 Nov 2023 14:07:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80A70828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699448902;
	bh=oi5w46XUUj+5eCHt5HUP0e7A7OgjsfNv+uqws1harcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mj8FBGGQRc1o/gHK59PSLiHZw20oRlzJJwRLc3OD9Em02AIRjlF/3kfzYyR7XCBHh
	 iEDeOBuRWGSAIBO3Nx4QjHyqtQ8cvDksAwRLw55UBTk9emeWFRewKzR1XNOt7z2+1T
	 kJLadAZ716f7hxfqkRlrVQ/A3d/uUyq+HkObioBg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5756F80549; Wed,  8 Nov 2023 14:07:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61849F80169;
	Wed,  8 Nov 2023 14:07:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24536F8016D; Wed,  8 Nov 2023 14:07:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1C23F80152
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 14:07:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1C23F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=USgbXuQE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0B0B6B818EB;
	Wed,  8 Nov 2023 13:07:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFAAEC433C8;
	Wed,  8 Nov 2023 13:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699448838;
	bh=oi5w46XUUj+5eCHt5HUP0e7A7OgjsfNv+uqws1harcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=USgbXuQE+ahS0wMNzK3GZRWrt2o4EadreHpU54UrkxxsZTTz0+LAe6fX8RvlykKp3
	 GnmJtzyZD1B5KT90EnuOrpS45Wn4Ug2QUbGzOlIaMw4h8TYxXniEVURlDAPEFofnAA
	 iULsGnxGgZ2r3S/txUvuyAC4NfimqV7S5ugviXvv/bC9zlMCTAI9ifoFUl0qap50eK
	 8xnqTE2LkaSAP45eLgiKG3jc+Tl0L9OlmfUcmBV78/c8SmRpnZH7a47rwrNZWy6prh
	 1BOu/wADh/rVR70guv/oGFc/pjZ9rrdvWZkVYr2T0XYKkEeW2YWOsyGVWaKdWKHEcO
	 jUDvq/YygN9Fw==
Date: Wed, 8 Nov 2023 13:07:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 11/17] ASoC: dt-bindings: samsung-i2s: add specific
 compatibles for existing SoC
Message-ID: <ZUuIAihzcOqkVsWG@finisterre.sirena.org.uk>
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <20231108104343.24192-12-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X+QegD6ebh8cp8W3"
Content-Disposition: inline
In-Reply-To: <20231108104343.24192-12-krzysztof.kozlowski@linaro.org>
X-Cookie: Slow day.  Practice crawling.
Message-ID-Hash: 7SZOMRJSATUKOAHGDHHQV4TYWRQ63O6X
X-Message-ID-Hash: 7SZOMRJSATUKOAHGDHHQV4TYWRQ63O6X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7SZOMRJSATUKOAHGDHHQV4TYWRQ63O6X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--X+QegD6ebh8cp8W3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 08, 2023 at 11:43:37AM +0100, Krzysztof Kozlowski wrote:
> Samsung Exynos SoC reuses several devices from older designs, thus
> historically we kept the old (block's) compatible only.  This works fine
> and there is no bug here, however guidelines expressed in
> Documentation/devicetree/bindings/writing-bindings.rst state that:

Acked-by: Mark Brown <broonie@kernel.org>

--X+QegD6ebh8cp8W3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVLh/wACgkQJNaLcl1U
h9D+/Af+MyEPu0I4eqVGYfK3Bo/6Rvq3LXEhL2x1vksJCKJjNwBBvQHqRWRTBZXL
VEhtg6O887bE4a7Hy4RErRnb978JM4kG0mM4qBPhwgv9YoqD9Ymr7jFfp8dRru28
hGY35dYXNXlC3LMJ1CdSVnubfo0QPHIzRYwWO4xpz0/BqNtsJlELPaU2s1q0wDHO
v/nMVrIE3Xzjp4iQEXcyfZa4k73XOYHmSqxR0H9xiDayBgMuUkypOeDs/qGpO+mW
Bp4IbvvgVJr9ifLmpCMlZWSQryHbiOR3cpJHR6Tb3UhjJKUgccQLyGHgBfAgiSqJ
x6Tc2OIcYB5l2yn9+JONwgLPLMiALg==
=Ypqx
-----END PGP SIGNATURE-----

--X+QegD6ebh8cp8W3--
