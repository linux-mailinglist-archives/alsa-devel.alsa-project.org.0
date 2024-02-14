Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7319D85492C
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Feb 2024 13:25:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FF35B6A;
	Wed, 14 Feb 2024 13:25:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FF35B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707913549;
	bh=om12AIRXbhoBkX5ErV9iC57tbcp9qmnO+XHs8NR0XaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pn+Vh2J/p0d1v8ny1qaqLk1za/kej2jELFglvL2rpfTYdDGnS3/F2ASmg4TgFCdYJ
	 65+RBz7EwR9tGNmxtfCfukbvkzloJjRuZQ4Yst5IOANydxjCYpbcN7inqZZL8Zgv4H
	 /Ek97Vsc51Ap7vWPP7kF65oVcmYXGXsERLvyE9/w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6B04F80589; Wed, 14 Feb 2024 13:25:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57F66F805A8;
	Wed, 14 Feb 2024 13:25:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49131F80238; Wed, 14 Feb 2024 13:25:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08A17F80104
	for <alsa-devel@alsa-project.org>; Wed, 14 Feb 2024 13:25:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08A17F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=sY+W//+o
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4C4E1CE20F0;
	Wed, 14 Feb 2024 12:25:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18DDC433F1;
	Wed, 14 Feb 2024 12:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707913501;
	bh=om12AIRXbhoBkX5ErV9iC57tbcp9qmnO+XHs8NR0XaA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sY+W//+oR5pT+WqLTp1mUjOaDEV57w6AM2zyTU5R+puNv38dmMoH3d477WwuHMWCc
	 Byzg4+kFesYaTSSssDgxb+3kjerABcZ2lY6PXSEIQE8Ag7sRhypfakz6Q8fTRn6Yok
	 fzK4Cw9GnU+bUQrxxMnq9eJ9B2URNGFJbpEOC8xCHLyzw/1SsYyVAXsnK24PMJUsae
	 rN9i3eNBbqJ1OePuJ7qeOah1liQQE6RbNN0+0uYBxP1iF8ow0YivnQZ9ZT5+kHFZnc
	 juE1ksU1dgDn4v9IXyAHJ8M/sicz3YNjb+9nW1koJPEhZMeEmeYcy4VOdmLNsUvCno
	 ZwlOG9l8DAwjA==
Date: Wed, 14 Feb 2024 12:24:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: sound:atmel-at91sam9g20ek: convert bindings
 to json-schema
Message-ID: <aa707af2-b0ef-46de-83ae-584756d5569d@sirena.org.uk>
References: 
 <20240214-at91sam9g20ek-wm8731-yaml-v1-1-33333e17383b@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s7rTl/oWJRMeE7uX"
Content-Disposition: inline
In-Reply-To: 
 <20240214-at91sam9g20ek-wm8731-yaml-v1-1-33333e17383b@microchip.com>
X-Cookie: Available while quantities last.
Message-ID-Hash: EUKKKO5IQ3IPOCI4BZB5QZMRYR4CDPEX
X-Message-ID-Hash: EUKKKO5IQ3IPOCI4BZB5QZMRYR4CDPEX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EUKKKO5IQ3IPOCI4BZB5QZMRYR4CDPEX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--s7rTl/oWJRMeE7uX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 14, 2024 at 12:10:06PM +0530, Balakrishnan Sambath wrote:
> Convert atmel-at91sam9g20ek-wm8731-audio DT binding to yaml
> based json-schema.Change file name to match json-scheme naming.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--s7rTl/oWJRMeE7uX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXMsRcACgkQJNaLcl1U
h9AUYQf+IoYLzVMnh8iw5Nit64An1Vh3KQ/uSzayMzfztETr+85K7EGJw6RuAuEF
X9XXAgq5jPkq4VvN57Urd4ieIR4gajNsEoOk09cM3w7hYF0UNk8BcnX1LF/c4/JZ
+ItbXiyPZUNXGjHwi4IEoMK1g0Og6Y0B7lSwTb+bYV0NYTu1LIZytwpYQEBeXRGY
g5dm+0Hh0dzJ5yAT8zT7PyoxMaHmNB7lHU9v0RYtSVbj7lg836C3uI1TM8TllMMZ
afjmEjNPP7I8eCI+X8NzorvWLi+e0CwHvI3SZnZoflcGhuxQGlGNPPtdeT2hmFq5
hrT3azEJn0Olq8RI61G+QCJK9J8ziw==
=dEZg
-----END PGP SIGNATURE-----

--s7rTl/oWJRMeE7uX--
