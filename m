Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 581486D99A3
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 16:29:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E1B0E90;
	Thu,  6 Apr 2023 16:28:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E1B0E90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680791370;
	bh=pKRyJ3lKqA73HVF+J+BLBZfn9tTi/QA1JWsG5UbLsgo=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hvWkL3TVljzzqckx0vHQgKTttc/M+0qyWrrO33x7UPRzBUglfDSNJXuFkJ5aOpfel
	 a9NWwouI6s3UzuKDA0toEdFdya/tt8/B3ECV9B9Lj1Mt7yAf8l/NDBkd3JVXvBKQus
	 lZeDS5l2km0c316OIsomFi9kEdJysXdt9PCjwnzo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72127F80587;
	Thu,  6 Apr 2023 16:26:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AAE2F8024C; Wed,  5 Apr 2023 17:22:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B475F8015B
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 17:22:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B475F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=HNFiZqD6;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Hir41yb5
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.west.internal (Postfix) with ESMTP id 44E3B2B06652;
	Wed,  5 Apr 2023 11:22:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 05 Apr 2023 11:22:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1680708123; x=1680715323; bh=pK
	RyJ3lKqA73HVF+J+BLBZfn9tTi/QA1JWsG5UbLsgo=; b=HNFiZqD6BMKLLUdk4a
	jvumOtPI1wMaeYZ9emMcv3MIDqsAmugHZhZg6XddCn+XieaYQF8kknupj/+QI/0M
	5g4x3VL4atV9vN9FSJKWSQJUWzlMwRONbXlaBGpzw0YQUE1oVargvc8NSqFkeS9V
	WI0+siiq3+OV8MTZvKxm9OU7H9bGXZiFO3BZ4bB4zcHzgpOctkwv5KlwgLmphz0r
	CQjeSOf2bKqNeYzWVct12l4i9+N7MXJ8fE0o20TA8nwGvQJMyJ3z+ebBzInmD+NP
	8QYbJbECukFunRjqN1V/v1aYHfWiJCayniEw0L315wY9WS3PxScIVXMX5HXvh3NV
	4bMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680708123; x=1680715323; bh=pKRyJ3lKqA73H
	VF+J+BLBZfn9tTi/QA1JWsG5UbLsgo=; b=Hir41yb5yrIxwVzQ0v7Hv1ArNLUJ3
	dt30Y+Q1eoFQzLwbLNIVU1Wi0pTfOatnRn4xBlGCXakq1yEl06w2i96GbUiw3nPM
	QGhnwY+nc6n4iU94/YTOOsGyhNyiQgyRVu9gcyen2deiH7Zt4sBCrNRccBvJghE1
	N8mgaAkPxeQiNUvuxjTGKDTb83lhcU5hBacBsggj5S0ujgqUTx6me5a2GHQV0gdS
	haoJbbYBpViZdQpcR2pFkaxuXyk6QdEgEkjBb/dWDoZ69zkEvNtd14SepBBsqcLY
	IBu6A0NXYDkcMSsbPPUOtreCJZseg2mQcdA6DtDkFfNubUZXOJCYOgvaA==
X-ME-Sender: <xms:G5ItZLxeHHK_eTCVjATebYYo1AaIqNiZEhaplXhmnBLJw-YO4zvmLg>
    <xme:G5ItZDRad7hA709xL5uKzDOhNvq9EO3ciomh0AGrR2_hMONGAWNyBv4p_PHPgbC8C
    uPiaw5y2POd3vWjD_4>
X-ME-Received: 
 <xmr:G5ItZFV4LP01QvZi02OU4bjtm8GmWldCVoBamdd7-ZTxJ_2RLSuOzw1d6wPOD5FLcbjYX_Op5Mj0X2PBGWwmHGtnNiFrLvU>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdejuddgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeeuveduheeutdekvefgudevjeeufedvvdevhfejgfelgfdtkeevueegteek
    gfelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:G5ItZFgGS6noxvNPwbBCIO0jSt4hlpt4AFYOjkrFocvlXR_denwyzw>
    <xmx:G5ItZNCHCOLtn7NhDKmDotimGUASIJZM9jVedAioJwFaTF6vQmBBag>
    <xmx:G5ItZOJPTfy5mgnINzNPD9HbdE_SkJoUrkPtMEPCZyzGI6UmGPzz_w>
    <xmx:G5ItZBJwDDkJ9kYGlGCnFQEtmja1Xv1D1EQjUEZ1DsADYHK59J_LLPJ_hTs>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Apr 2023 11:22:01 -0400 (EDT)
Date: Wed, 5 Apr 2023 17:22:00 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v3 54/65] clk: da8xx: clk48: Switch to determine_rate
Message-ID: <3nyoulu5eba6eyo644crhbtog63jh7vockbp7dz6mxquj2omsn@j56kn6vkbktg>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-54-9a1358472d52@cerno.tech>
 <04f5d305-9992-bcdc-cd54-111eb8254155@lechnology.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="26z4voptekiisgxx"
Content-Disposition: inline
In-Reply-To: <04f5d305-9992-bcdc-cd54-111eb8254155@lechnology.com>
X-MailFrom: maxime@cerno.tech
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 2NMYR6CKKHJBTYNJN5PFDANX3DOZRSRV
X-Message-ID-Hash: 2NMYR6CKKHJBTYNJN5PFDANX3DOZRSRV
X-Mailman-Approved-At: Thu, 06 Apr 2023 14:26:03 +0000
CC: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sekhar Nori <nsekhar@ti.com>,
 Abel Vesa <abelvesa@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, alsa-devel@alsa-project.org,
 linux-mips@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2NMYR6CKKHJBTYNJN5PFDANX3DOZRSRV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--26z4voptekiisgxx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

On Wed, Apr 05, 2023 at 10:03:24AM -0500, David Lechner wrote:
> On 4/4/23 5:11 AM, Maxime Ripard wrote:
> > The TI DA8xx USB0 clk48 clocks implements a mux with a set_parent
> > hook, but doesn't provide a determine_rate implementation.
> >=20
> > This is a bit odd, since set_parent() is there to, as its name implies,
> > change the parent of a clock. However, the most likely candidate to
> > trigger that parent change is a call to clk_set_rate(), with
> > determine_rate() figuring out which parent is the best suited for a
> > given rate.
> >=20
>=20
> As mentioned in my previous review, parent is selected by device
> tree and should never be changed after init.

Great minds think alike then, because the driver implements exactly
that, either before or after that patch.

That patch makes the current behaviour explicit but doesn't change it in
any way.

So I guess that means that I can add your Acked-by on the three patches
you reviewed with the same message?

Maxime

--26z4voptekiisgxx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZC2SGAAKCRDj7w1vZxhR
xX3HAP9VZpkTPwIoFKEvz2QkqD5aN3JRLL2FZfZs1GkS6VKwPwEAwCQO12uyUnoP
Ll/lRVK0qmUZkdyj49c7sQMgZB33awc=
=2nao
-----END PGP SIGNATURE-----

--26z4voptekiisgxx--
