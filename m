Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE28B62315C
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 18:23:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5091616A5;
	Wed,  9 Nov 2022 18:22:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5091616A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668014586;
	bh=DpobGsjjO6+ObD0CgLx0PfBT5w/ojqtKffWwUQfBXkA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n0wgVhu43Ag9Su2gKtxpolgS/dvRjik1YcdXyeUBYfevRTLDzs1mroTtjYr3dIv5f
	 Fe9i2bhlxQipU6QzoPAxsbPJB73QpE6DSzh4QT4OO+gSdpxzSCDZkppsZmQh6K1JzZ
	 8c1Z1Gr5hhuEZIxafCYu3bg+leEJgG8bXE5MVDcY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD300F805F2;
	Wed,  9 Nov 2022 18:16:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85A87F8025A; Mon,  7 Nov 2022 09:54:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, PRX_BODY_30, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47857F800EC
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 09:54:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47857F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="aL7x6Ved"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="awf3lMuG"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id CBDFB580981;
 Mon,  7 Nov 2022 03:54:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 07 Nov 2022 03:54:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667811261; x=
 1667818461; bh=DpobGsjjO6+ObD0CgLx0PfBT5w/ojqtKffWwUQfBXkA=; b=a
 L7x6VeduJt+1Hu5h1m6xZv3p7hN365kpXqH5SuShvo3zwCzJIKsm96bEmylPDRnr
 vKihkUHqJ+opr8d5eypGD34fQlnFGyxPjZz8U+6RxuJq36EaUEjtGGOHxWFWJmsR
 xF8mQxK/zVQWtqPsaAi62pWa+AWIoU2BQQvgaXR8zkOkphgUl8UR2UNnuFhq1pY6
 BBMhiWDZbMK+qFDNXAtIYmad+XRLYmN1xRyV+Cdif96MtdkOqfkm8tHhatycY5y4
 6hqoUGqXVWC6P521j5IjRmmgaDJ6w3DWXYznabMX8M7Hgb9gEW6XKEk3hW0kJ2QI
 +2VDPHajg+fFKI1/fw4zg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667811261; x=
 1667818461; bh=DpobGsjjO6+ObD0CgLx0PfBT5w/ojqtKffWwUQfBXkA=; b=a
 wf3lMuGSE0c+KKuKS9VUt+n1OzUMiXhyTIxQLBDjWgJq5Rasjs/0LinZ+VNNis3Q
 alYUFBZQZ1o6/Q54VwJt3hqIwUHR2Sqily3v9eJVSTlP+Hu2fMStre5KXTVYz4tY
 up+dWJV8xLSoFiZUgzmweb/bZBcB/fFtJnk3gDOGBjofi4mAWNWAPpiPA0jEfPrm
 qZYWyDNc5qSMORFII98iU3MY0TQmveTRjRLYGwUC3eXJUsRYRr3v7if3WJeSkO6I
 j3g07rByjglyFc5HGmp7F1QOFNm/ObUDgojleoszz+DZFx1tbTqcAVeOKkORWZom
 ZIRqMfyKz+fN8PnA+frdQ==
X-ME-Sender: <xms:vMdoY_7qKFUnXrMLgK6UK63X-Fh4SaqG616lZWh2McRJiMf86oKkBg>
 <xme:vMdoY05eqjOQdOTGTKTySzE1Wn9z9h-j5CLWyw-kRMMS7CUhWbIcIkplkIUxbV3Zx
 tjU76RkWB9nO9l2Z6w>
X-ME-Received: <xmr:vMdoY2eTjJtLQJNNaygWBJHdzqd2eezOC-jGJ5qGPoZggXSc-nHUmqhTbr9BJgETFjOt3Omg7gRBI2Br8ytbDietmUNlkAqFM8RJrlQ2C87Yog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdejgdduvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddunecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleelfeeileelteetfedvieekfeefffevhfdtvefgheevudevheejvddv
 ieeltdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:vMdoYwK5IAG7BHmBDjFkYVhB3wRP1TzolwSnR7LPSyHllzJNSVgrKg>
 <xmx:vMdoYzJWQmddsqBUPbOODTn8VI2mqM3H1ese92evIxTkRlBaGuPeYA>
 <xmx:vMdoY5w7ruPvXZ8uflNCksVlsNEDzQ_jl3m9tAGFgnB3-SXCh18Y3A>
 <xmx:vcdoY6WhoDikh1uwLRRPXPUC7EI94vIUcFL5a0jAMBx8zIodtk5heg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 03:54:18 -0500 (EST)
Date: Mon, 7 Nov 2022 09:54:17 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Subject: Re: [PATCH v2 56/65] clk: ingenic: cgu: Switch to determine_rate
Message-ID: <20221107085417.xrsh6xy3ouwdkp4z@houat>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-56-f6736dec138e@cerno.tech>
 <80VTKR.CE8RVN8M3ZYK3@crapouillou.net>
 <20221104145946.orsyrhiqvypisl5j@houat>
 <cp7Yh29ndlOOi1yW8KwCcpzoLPLxm1vR@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cp7Yh29ndlOOi1yW8KwCcpzoLPLxm1vR@localhost>
X-Mailman-Approved-At: Wed, 09 Nov 2022 18:15:50 +0100
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-phy@lists.infradead.org, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Abel Vesa <abelvesa@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-mips@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-rtc@vger.kernel.org,
 linux-clk@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Daniel Vetter <daniel@ffwll.ch>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, linux-sunxi@lists.linux.dev,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <david@lechnology.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Fri, Nov 04, 2022 at 05:35:29PM +0000, Aidan MacDonald wrote:
>=20
> Maxime Ripard <maxime@cerno.tech> writes:
>=20
> > Hi Paul,
> >
> > On Fri, Nov 04, 2022 at 02:31:20PM +0000, Paul Cercueil wrote:
> >> Le ven. 4 nov. 2022 =E0 14:18:13 +0100, Maxime Ripard <maxime@cerno.te=
ch> a
> >> =E9crit :
> >> > The Ingenic CGU clocks implements a mux with a set_parent hook, but
> >> > doesn't provide a determine_rate implementation.
> >> >
> >> > This is a bit odd, since set_parent() is there to, as its name impli=
es,
> >> > change the parent of a clock. However, the most likely candidate to
> >> > trigger that parent change is a call to clk_set_rate(), with
> >> > determine_rate() figuring out which parent is the best suited for a
> >> > given rate.
> >> >
> >> > The other trigger would be a call to clk_set_parent(), but it's far =
less
> >> > used, and it doesn't look like there's any obvious user for that clo=
ck.
> >> >
> >> > So, the set_parent hook is effectively unused, possibly because of an
> >> > oversight. However, it could also be an explicit decision by the
> >> > original author to avoid any reparenting but through an explicit cal=
l to
> >> > clk_set_parent().
> >> >
> >> > The driver does implement round_rate() though, which means that we c=
an
> >> > change the rate of the clock, but we will never get to change the
> >> > parent.
> >> >
> >> > However, It's hard to tell whether it's been done on purpose or not.
> >> >
> >> > Since we'll start mandating a determine_rate() implementation, let's
> >> > convert the round_rate() implementation to a determine_rate(), which
> >> > will also make the current behavior explicit. And if it was an
> >> > oversight, the clock behaviour can be adjusted later on.
> >>
> >> So it's partly on purpose, partly because I didn't know about
> >> .determine_rate.
> >>
> >> There's nothing odd about having a lonely .set_parent callback; in my =
case
> >> the clocks are parented from the device tree.
> >>
> >> Having the clocks driver trigger a parent change when requesting a rate
> >> change sounds very dangerous, IMHO. My MMC controller can be parented =
to the
> >> external 48 MHz oscillator, and if the card requests 50 MHz, it could =
switch
> >> to one of the PLLs. That works as long as the PLLs don't change rate, =
but if
> >> one is configured as driving the CPU clock, it becomes messy.
> >> The thing is, the clocks driver has no way to know whether or not it is
> >> "safe" to use a designated parent.
> >>
> >> For that reason, in practice, I never actually want to have a clock
> >> re-parented - it's almost always a bad idea vs. sticking to the parent=
 clock
> >> configured in the DTS.
> >
> > Yeah, and this is totally fine. But we need to be explicit about it. The
> > determine_rate implementation I did in all the patches is an exact
> > equivalent to the round_rate one if there was one. We will never ask to
> > change the parent.
> >
> > Given what you just said, I would suggest to set the
> > CLK_SET_RATE_NO_REPARENT flag as well.
>
> Ideally there should be a way for drivers and the device tree to
> say, "clock X must be driven by clock Y", but the clock framework
> would be allowed to re-parent clocks freely as long as it doesn't
> violate any DT or driver constraints.

I'm not really sure what you mean there, sorry. Isn't it what
assigned-clock-parents/clk_set_parent() at probe, plus a determine_rate
implementation that would affect best_parent_hw would already provide?

> That way allowing reparenting doesn't need to be an all-or-nothing
> thing, and it doesn't need to be decided at the clock driver level
> with special flags.

Like I said, the default implementation is already working to what you
suggested if I understood properly. However, this has never been tested
for any of the drivers in that series so I don't want to introduce (and
debug ;)) regressions in all those drivers that were not setting any
constraint but never actually tested their reparenting code.

So that series is strictly equivalent to what you had before, it's just
explicit now.

If you find that some other decision make sense for your driver in
particular cases, feel free to change it. I barely know most of these
platforms, so I won't be able to make that decision (and test it)
unfortunately.

Maxime
