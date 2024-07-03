Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E45C926983
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 22:26:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F118F53;
	Wed,  3 Jul 2024 22:26:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F118F53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720038371;
	bh=fM17ACxPi48RUkc6CTYUTCDM5lj10S/OBmpaFFNIkcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gphttcRICoH2O/nWBdF3wIOo/pOgHR2RtNR2JI/tmUfi14k6eyALmntH33DSFnUMm
	 UFOdkWSOKv70y81IvWD6SoVTXiMMmMY/k18KQWnws/krWLDFIOFez1R43cPqiyzcqP
	 F7JWbqSI38y2V3h7XA/7wdWOMrAzdq6mobgieDlY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74262F805A1; Wed,  3 Jul 2024 22:25:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 248B2F805AE;
	Wed,  3 Jul 2024 22:25:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20394F8025E; Wed,  3 Jul 2024 22:25:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DADD4F8013D
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 22:25:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DADD4F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lsMHSpij
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 55F9BCE2DCF;
	Wed,  3 Jul 2024 20:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EBD6C2BD10;
	Wed,  3 Jul 2024 20:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720038322;
	bh=fM17ACxPi48RUkc6CTYUTCDM5lj10S/OBmpaFFNIkcQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lsMHSpijNHgNraF3XmxVNow8XXBH8g/B5rA/mkxtYdBXza28HZvqneW87fCE9tetR
	 pLs/iFZ+oItTxRg+CYcNp6YFgG3O+4M+XGVjkrXiqooUxLfVnz7eYbqQbWJPztHC99
	 zY2KnY4a88ycjf04f0gzxOc0jU1hXTE8qT1LSdnZcOf6dNhc8bMOc0ZxXw/Y9bDWQ2
	 o5oFKlLoA3K1/yubdduHwDPWeKeJXIAmsqbEuYzgGguTgAU0fplVjEPg4zvJlfYbis
	 UIt6SIc+cJHXRhnR10KpEP6PynuDmIWKv4GakgPEsrohA2mypinD3lyvFurSWlYzTs
	 o6xQdJ/8XZLYg==
Date: Wed, 3 Jul 2024 21:25:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shenghao Ding <13916275206@139.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/4] ASoC: tas2781-i2c: Drop weird GPIO code
Message-ID: <c14e3b14-ea10-4a92-b758-557a87fc8047@sirena.org.uk>
References: <20240701-asoc-tas-gpios-v1-0-d69ec5d79939@linaro.org>
 <20240701-asoc-tas-gpios-v1-2-d69ec5d79939@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lld/DtCFEGNZXhT7"
Content-Disposition: inline
In-Reply-To: <20240701-asoc-tas-gpios-v1-2-d69ec5d79939@linaro.org>
X-Cookie: There is a fly on your nose.
Message-ID-Hash: H7P73WZHWQV7OXOYUC3B5J2XQFYMP5U7
X-Message-ID-Hash: H7P73WZHWQV7OXOYUC3B5J2XQFYMP5U7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H7P73WZHWQV7OXOYUC3B5J2XQFYMP5U7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Lld/DtCFEGNZXhT7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 01, 2024 at 09:02:13AM +0200, Linus Walleij wrote:
> The tas2781-i2c driver gets an IRQ from either ACPI or device tree,
> then proceeds to check if the IRQ has a corresponding GPIO and in
> case it does enforce the GPIO as input and set a label on it.

This doesn't apply against current code, please check and resend.

--Lld/DtCFEGNZXhT7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaFs6wACgkQJNaLcl1U
h9B5AQf+JweFR/QE46WZc782ZDWwAiD8hsguRmw353JdgBSB4wltFwz9wl2Rcg66
4fFZ9FGFQ6+GRqYrCWbmnpgevm6G9JORPHSAKs3GJhvn8QWXK9IbRROaAPBHcnIV
RxMMX/jjkPFsQOXWIDsV9VFi3XFNDD62AApXka9ctdWjxEb0XTgoF6SO6Qe9gn8k
8O+UXOwai17vWnU8MRIwMFtZGe+PM+jIDee+B2B+hYuivpJ/JhZ9EsqcyFzEjfZe
ovj4QXcHVVBZ3dAakTYoo17COckJu0bxH3IbuaacLtbVzcRA+P8VgCu4olUkjMgK
eNtwwwO+BCD9U7wxoCTg/Ep9gHdCoQ==
=KAlW
-----END PGP SIGNATURE-----

--Lld/DtCFEGNZXhT7--
