Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0F87D74B5
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 21:49:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4141826;
	Wed, 25 Oct 2023 21:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4141826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698263364;
	bh=h4BRsvufsuFwSxNjBiJ/P4K5+hKj62Otlj2Fx1zE7Yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HS/6KVQ//jAvQtJNjwvfHcbXtBF9BJ8kKJVDlOCAVXcPIzTR3mo9X2zClIOEgFAOP
	 0hp2cXR8Bnxu3Y3Tngt6G6/jjrj0fmyt1w/IsbRQU01pWtl1B7UMiE8zcHaqiC96FB
	 25U/ldO97D3lXVarVQm9lIdARSpxpiy22lH/14vQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67073F80152; Wed, 25 Oct 2023 21:48:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC31DF80157;
	Wed, 25 Oct 2023 21:48:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 690D0F80165; Wed, 25 Oct 2023 21:48:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3AAF6F8010B
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 21:48:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AAF6F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=agL6oJC/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D66E0CE3844;
	Wed, 25 Oct 2023 19:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FD50C433C7;
	Wed, 25 Oct 2023 19:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698263279;
	bh=h4BRsvufsuFwSxNjBiJ/P4K5+hKj62Otlj2Fx1zE7Yc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=agL6oJC/Uo/LtgyG6fI1q5xGq6xxjN+xbfVkC2zmSbjh56jDwuehSxu9XNKIPLCcU
	 3ms5dxw7YS84RoE9b4FIFpThw8BOo8/Qm/56ptNZYnBA6mD+xezsYYBvqPkOVUyE6J
	 2GZJTDRahrOnO41NemvJcqoLHZy7pJSU/qcMvrOu2pH5QcSIdwngBfz3OrC/F0h9GF
	 JzA8BxCpieNh17KRvAnXvQ6+ZfrJLotTNuPCYxN4Vu0y++c63fNtBQWIaiuGYDxlTD
	 cHRt8KC5SOvuc8C2beUaF3Q5iNSU/GKATpljTdsdxt8Ayjq7gksKr1CT24oRtY6iuQ
	 VMsVsTwfelZfw==
Date: Wed, 25 Oct 2023 20:47:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Li Yang <leoyang.li@nxp.com>, Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
	Simon Horman <horms@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v8 00/30] Add support for QMC HDLC, framer infrastructure
 and PEF2256 framer
Message-ID: <a02dd435-9b7b-418e-a87c-28fad56f8004@sirena.org.uk>
References: <20231011061437.64213-1-herve.codina@bootlin.com>
 <20231013164647.7855f09a@kernel.org>
 <20231025170051.27dc83ea@bootlin.com>
 <20231025123215.5caca7d4@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TVHY9B7BnvBaREJ9"
Content-Disposition: inline
In-Reply-To: <20231025123215.5caca7d4@kernel.org>
X-Cookie: There's no time like the pleasant.
Message-ID-Hash: ZVSJDVQ7RBKUN4RMK6MLYS5542NUZ3DW
X-Message-ID-Hash: ZVSJDVQ7RBKUN4RMK6MLYS5542NUZ3DW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZVSJDVQ7RBKUN4RMK6MLYS5542NUZ3DW/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--TVHY9B7BnvBaREJ9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 25, 2023 at 12:32:15PM -0700, Jakub Kicinski wrote:
> On Wed, 25 Oct 2023 17:00:51 +0200 Herve Codina wrote:
> > > Which way will those patches go? Via some FSL SoC tree? =20

> > This series seems mature now.
> > What is the plan next in order to have it applied ?

> > Don't hesitate to tell me if you prefer split series.

> FWIW we are happy to take the drivers/net/ parts if there is no hard
> dependency. But there's no point taking that unless the SoC bits
> also go in for 6.7.

> Li Yang, what are your expectations WRT merging this series?

I did previously ask for the generic framer bit as a tag so I could
apply the ASoC part but nobody responded and I've been getting repeated
resends of the series :(

--TVHY9B7BnvBaREJ9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmU5cN4ACgkQJNaLcl1U
h9BOigf/QB+M3jhpcGgpYNTcVVEM0JK0u1Vxzv91903ZwQlHKd6PSPWKFGwkPrbV
PkNR8xoBtGJp1rgu8AIQMhy8U+OFmf9Bsgc9Fzvakvb5/5oUOIAEyjCqLVOi9oVl
JiN7xM7bMd9vOk6g+b0UxRJjsF7+gqTYApUqigiblxG72qBLI0PYj9WauqiNNXkQ
stdLTuSDHBvXROKADqtlrjsSfU9kGw51/ZAILd4/s845m68TP4zRa9Ajz4vBWuRU
Re9dpEoBUQpd6lSkvAAlYJiYeOIeW2/EJqo1pU9areKbPkS4xwyKJKw4FQaXhwOA
hpVhGkXT/PcTml0V0pDfQyKUsbFWMA==
=1u2S
-----END PGP SIGNATURE-----

--TVHY9B7BnvBaREJ9--
