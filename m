Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DB76D99A1
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 16:29:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82FF1E8B;
	Thu,  6 Apr 2023 16:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82FF1E8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680791350;
	bh=N4c3eeJxURi8JXim3XKJyPapEGBJUqAqBrR8m8X2c4U=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eoThDULurPkbPKMaJly0FOBeya5m9MQkIaB2tp1pk5Hcyr/GHrUKHhQEOzpUYFw5p
	 bs+G1Nk4ZwWha7piNLvFB947Jj4V1D8FHpeEUQwVKJwxxlYCQugGIvw5aUPkaj73RQ
	 HklJQDdbGMTN1Zl2/uowCWrMK+WJ/0NnaPNmz39E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F36CF8057A;
	Thu,  6 Apr 2023 16:26:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0220F8024C; Wed,  5 Apr 2023 17:19:26 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BBD9BF8015B
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 17:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBD9BF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cerno.tech header.i=@cerno.tech header.a=rsa-sha256
 header.s=fm3 header.b=gKmMuTGX;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=us63aUQD
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 95FF22B06725;
	Wed,  5 Apr 2023 11:19:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 05 Apr 2023 11:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1680707950; x=1680715150; bh=N4
	c3eeJxURi8JXim3XKJyPapEGBJUqAqBrR8m8X2c4U=; b=gKmMuTGX4nhOP5LI8Y
	E+p/fl+lzjYAUVjkZAxOcgMyfnvceh+EPXSaK4hHdklMDKUo+7X8uDlGKLDM7YrF
	sGg+TkumCGduStemV3hSEOod80SRIuqnVBjPCz57RbgXyt/JCsea9kGlEGHD9ZHH
	4uYBmeLVKiWZRuqWeUmq4vUsloGrTNXrcZHyz42mXBY+jnF6RqsUJfP3g+hbx4CH
	JR626fKDz3Kx91OKG6zoAb0lhAY8BRj2kyH+aSBqRWk3fBm+tmycjA9BvxMtFwK2
	/uN/4REMsnOfiA8YkWEUr9NvX5awfUPDqecs/KGItASKIgB/OjRZa6JP4GBtcIV6
	ixhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680707950; x=1680715150; bh=N4c3eeJxURi8J
	Xim3XKJyPapEGBJUqAqBrR8m8X2c4U=; b=us63aUQDG8MBsBWKxVkd677OWUlyf
	GvyT2ZsDR/MSDXYyBEFPCLr1u77TLVEliJJkxnFOHOryhOssawtom9Fx/GCxXE4Z
	g9WMcBZDBFFA0M55NPj/afG79rH+QSlgwKxHdEscFKqJAGzLCKXM08O4CAyNZ2oY
	92l1EUMRUsxYBOKTBCNAueUm0hLDh9wXQ1aH2hSa0Pyqo+ic5Vn/E1K8RUuJ+Akx
	niaY+kBJb8HA94y9MapEeW9khd6W27wz6/o4LBZwUwC1yikHIaKv9+Y3YHHV23Ax
	Pbttvpu2mHJMkMEb/nmxw4VL5SFuEUD85xEXcsCOFmUo4Ir1bozXJcnQw==
X-ME-Sender: <xms:bZEtZNE5d3frgjNyqfY4l4F96Ieu8m-0_ET2EQHW54skrpLdDPxMkg>
    <xme:bZEtZCWAV86vqtY8x0YAOfOyxP_Bjovfu1KEbcIJIGQZNkI_NskC3Z69zIE7bSKWK
    uPorUWm3E5jHLYZiX0>
X-ME-Received: 
 <xmr:bZEtZPIl36enYyRYWtnwtZFjoGIm56RgFEgNNgHuHH1AdVooqXLB1xvAQ3eU8FqyhyfYmeQzT8INbzvXCyXiYFQA7dPIxNQ>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvhedrvdejuddgkeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtsfertddtudenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeefjeeiueeiheevtddvgfeluedufeeigeeijefhveelfeevueefieehuefg
    ffetteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bZEtZDEAFhIsFMFa_rlEYJjQtmNAX1yXFgltj8Nc2M4E7IronNQkYQ>
    <xmx:bZEtZDXf-V7X3wB2ItBeZXqRwyUd7foTYp81_5ZftvCbRnJ1NVcG-A>
    <xmx:bZEtZONDsCr9vCSxxuST4o6jdEcH6VhtDEUAn3vwkAzrVLVhcbzMRw>
    <xmx:bpEtZHehzz9o1Op1NisRQXvvRBZ08CdWKapQjpWmxXPTk9Z4sCWpZcg2CZ8>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Apr 2023 11:19:07 -0400 (EDT)
Date: Wed, 5 Apr 2023 17:19:06 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 56/65] clk: ingenic: cgu: Switch to determine_rate
Message-ID: <o6odr3i3ypj6p6vxuiwgymll3bew544mwzcgs6hjzum5uix43j@galqy4lxjdvx>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-56-9a1358472d52@cerno.tech>
 <3c1c42baf7d764bf6429b470f534fd9ec46ddedd.camel@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7run534ck55yr3bz"
Content-Disposition: inline
In-Reply-To: <3c1c42baf7d764bf6429b470f534fd9ec46ddedd.camel@crapouillou.net>
X-MailFrom: maxime@cerno.tech
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 4CNKOU6E5EAT25ZJJCC64JWGEDRWMSSK
X-Message-ID-Hash: 4CNKOU6E5EAT25ZJJCC64JWGEDRWMSSK
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>,
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
 Orson Zhai <orsonzhai@gmail.com>,
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4CNKOU6E5EAT25ZJJCC64JWGEDRWMSSK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--7run534ck55yr3bz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Paul,

On Wed, Apr 05, 2023 at 03:04:05PM +0200, Paul Cercueil wrote:
> Le mardi 04 avril 2023 =E0 12:11 +0200, Maxime Ripard a =E9crit=A0:
> > The Ingenic CGU clocks implements a mux with a set_parent hook, but
> > doesn't provide a determine_rate implementation.
> >=20
> > This is a bit odd, since set_parent() is there to, as its name
> > implies,
> > change the parent of a clock. However, the most likely candidate to
> > trigger that parent change is a call to clk_set_rate(), with
> > determine_rate() figuring out which parent is the best suited for a
> > given rate.
> >=20
> > The other trigger would be a call to clk_set_parent(), but it's far
> > less
> > used, and it doesn't look like there's any obvious user for that
> > clock.
> >=20
> > So, the set_parent hook is effectively unused, possibly because of an
> > oversight. However, it could also be an explicit decision by the
> > original author to avoid any reparenting but through an explicit call
> > to
> > clk_set_parent().
>=20
> As I said in the v2 (IIRC), clk_set_parent() is used when re-parenting
> from the device tree.

Yep, it's indeed an oversight in the commit log.

> > The driver does implement round_rate() though, which means that we
> > can
> > change the rate of the clock, but we will never get to change the
> > parent.
> >=20
> > However, It's hard to tell whether it's been done on purpose or not.
> >=20
> > Since we'll start mandating a determine_rate() implementation, let's
> > convert the round_rate() implementation to a determine_rate(), which
> > will also make the current behavior explicit. And if it was an
> > oversight, the clock behaviour can be adjusted later on.
>=20
> So just to be sure, this patch won't make clk_set_rate() automatically
> switch parents, right?
>=20
> Allowing automatic re-parenting sounds like a huge can of worms...

The behaviour is strictly equivalent before that patch and after: the
driver will not reparent on a rate change. It just makes it explicit.

Maxime

--7run534ck55yr3bz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZC2RagAKCRDj7w1vZxhR
xXf2AP4nVXXgdZbFLKpfLcLqHQU/yEaza+nOToxguQnpy3rPiAD/VqJ8EWDR1dkZ
KO3BzBJio00Kuw94FyundvDtvxXOygg=
=yU4q
-----END PGP SIGNATURE-----

--7run534ck55yr3bz--
