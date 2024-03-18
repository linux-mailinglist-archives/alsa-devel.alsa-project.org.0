Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E3B87EA5C
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Mar 2024 14:49:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 941C7227A;
	Mon, 18 Mar 2024 14:49:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 941C7227A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710769761;
	bh=MHoHwr0eDPD5cgVd1+iwqRgWIVLOzhoSjzj/dQkgH/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Jmb1iV96BY7MGyoU1l7vXIHa+pfDeJsNDCO26pOXraph2EKsKBqhztE3gXN5vP/iG
	 WvNt7U3D2hIBrEPiRe+H/tYmMAeb2Rx93tEqLEK8OZdcelsOQtTbAo4Affkrrx2zXM
	 Isccx2PM+SR8QxmV1oJ2DVvjFfw/KyWJC+LFq3HQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCDEDF8057A; Mon, 18 Mar 2024 14:48:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B151F805A0;
	Mon, 18 Mar 2024 14:48:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FF19F804E7; Mon, 18 Mar 2024 14:48:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9AC7F80088
	for <alsa-devel@alsa-project.org>; Mon, 18 Mar 2024 14:48:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9AC7F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DKkpVxKx
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1C0660C4B;
	Mon, 18 Mar 2024 13:48:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1095BC433F1;
	Mon, 18 Mar 2024 13:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710769718;
	bh=MHoHwr0eDPD5cgVd1+iwqRgWIVLOzhoSjzj/dQkgH/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DKkpVxKxY7h9v+lH5UT2+3Yhzkji9Pqcx33yJYLYim45vOo92XuYMu+YsHi1ZhZwG
	 fc9Kinal7Gz43JO9X6EBtVPVJCa1KqGDeTMjMwSQb2cw9+nUNz28XZMOze6O1MLI0h
	 5KMZotzvi/hfqpFn29SDRG0ZiAYMYaMJMcyWl527F8xnrvyortoF9cxBPADf3dH1ek
	 XXUJlYYrGd9CKFAxhjwbp1ORhxlvSc9ZgcC8dEj2fdtNa6b3cfkExJIlFD+vZcTijm
	 M0lnpXAg63TlsHu/H9VvpHn83Ki149ZsnCePdDElv4ZWROEyOXFnYSWSNT6WCSeekd
	 QLkjCGvBD0jXA==
Date: Mon, 18 Mar 2024 13:48:31 +0000
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
Subject: Re: [PATCH 12/25] ASoC: meson: t9015: add support for A1 SoC family
Message-ID: <30dadd4c-de10-43a7-baf8-8ddd49f5c80e@sirena.org.uk>
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-13-jan.dakinevich@salutedevices.com>
 <5f8e8cd2-f9c4-4961-a85d-a0f3217294e6@sirena.org.uk>
 <c4c0e3a3-eaa8-42c6-bbd3-e5c6993dc63b@salutedevices.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cWXPDKTXShavPzNA"
Content-Disposition: inline
In-Reply-To: <c4c0e3a3-eaa8-42c6-bbd3-e5c6993dc63b@salutedevices.com>
X-Cookie: Alaska:
Message-ID-Hash: GF7UMJMYMH6SZL6DYTTV2RNXRJTPUEZM
X-Message-ID-Hash: GF7UMJMYMH6SZL6DYTTV2RNXRJTPUEZM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GF7UMJMYMH6SZL6DYTTV2RNXRJTPUEZM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--cWXPDKTXShavPzNA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 17, 2024 at 07:27:14PM +0300, Jan Dakinevich wrote:

> Both mic bias and ADC's input mode depends on schematics and should be
> configurable. What is the better way to give access to these parameters?
> Device tree?

Yes.

> >> +	SOC_SINGLE("ADC Mic Bias Switch", LINEIN_CFG, MICBIAS_EN, 1, 0),
> >> +	SOC_ENUM("ADC Mic Bias Level", a1_adc_mic_bias_level),

> > Why would micbias be user controlled rather than a DAPM widget as
> > normal?

> Yes, I could use SND_SOC_DAPM_SUPPLY, but it supports only raw values,
> and doesn't supports enums. Here, I want to use enum to restrict
> possible values, because only these values mentioned in the
> documentation that I have.

A supply is an on/off switch not an enum.  Users should not be selecting
values at all.

--cWXPDKTXShavPzNA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmX4Ri4ACgkQJNaLcl1U
h9DTQAf+Ppr066CVfsvlN/xyNgCUEg1jqhI9r20Nh5lxtnjU+wC1Kcr+iobrATQM
TDOweMGu65tzuQZfO6T+CaB8UHXIAHKQStRrDMt60u8hvNbQ1WBBGcNpHZ4aEnH7
dha2+WYeSatRy9dWtHHuumkiG0oMZO93Q9agqdWm0p3dcF/kfp0UsgdfjFXbC0CZ
bF5SO0qaSh4sYzmkOWdsGn175ELpN2HMYaAL5R1kaS4QntznG3QCuLXxdOSy6/+7
SByMPu2j+jkFJTHfOQlYZZCDrgZ+czQ4gWszPQuk9LWDTYFrxajuRVwRKXew/GA8
Z0fuEs8wuIMGmSTEXpNJXc/IeEv+nw==
=YCeA
-----END PGP SIGNATURE-----

--cWXPDKTXShavPzNA--
