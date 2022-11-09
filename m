Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7335623172
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 18:26:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8472316A3;
	Wed,  9 Nov 2022 18:26:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8472316A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668014813;
	bh=ozcNKNPFUJU7VXog4mirG3PaHdBZsvy/B54lNhXDOnk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X44a72/Xd3Hkzaci5UmuEMUMpwA5bfZhS5Xn3pGnK1wA2eQkFesxTHpF6UDW0nFC8
	 P0mhfncixf908miU4Sjg6OFSN9oPtjfyxkIqaH6mQby7iZ5OzglWtyOwEnUD2AQJz5
	 3BbwuNr8bSGi797eUK0YnfZNRUoZeUfagCYzXMIE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F181AF80635;
	Wed,  9 Nov 2022 18:16:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA027F80217; Wed,  9 Nov 2022 12:01:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 847E8F80121
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 12:00:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 847E8F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="PnyCDTzS"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="gGetY3ow"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0BE45580951;
 Wed,  9 Nov 2022 06:00:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 09 Nov 2022 06:00:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667991651; x=
 1667998851; bh=ozcNKNPFUJU7VXog4mirG3PaHdBZsvy/B54lNhXDOnk=; b=P
 nyCDTzSssECxNfNteWPy3M1DAb+fg0ApxljwT3DXT+FpUL/XzG3L1DUUURH9HPhq
 oltKVVFbL2N4lHvPuJjbcAdaANQPcYyjrK00W1HwSnEwZdpV9MicOwIRBvzDy6Ba
 I7vIxzJ2KpGkDOVe6BT/WEDQxwgPto9JpnxYLPHJJjqlQFSUn+rIonDZ9z8iyXbM
 gXh7zavtQKsvKr4tPaMjvqCcTiQQQ5tIuBs5pnFRYAmFwDaGKzpVU/vpgbYVi4na
 1T2DLC7rbEZHNn1ssaShuOOK0vMkHJRB0TtueAWHhUYhc6YMkccGKhHa9g+9Ahnc
 RWwQB/NB4N8bPARKfMknA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667991651; x=
 1667998851; bh=ozcNKNPFUJU7VXog4mirG3PaHdBZsvy/B54lNhXDOnk=; b=g
 GetY3owqhfgmYxBoaNMb739M2/wVwmcSrJ6NeBgCu6Q8N5CWYKbyJ2TAfTQBD3oA
 ymmdvRqDg16PRzZQIBUL1o3iHPyCG/DALVKQ7efft3SOMFdcQXqoknmqYWMxOgBf
 jQcGOpUjL5/Eu7pFfeEnPN/pkoM4gZzKJ+uOfWnQ61wXhp9bqkp9zj8dgOmUz+eI
 2Vai+4dmWgQVMwEW3ADKp4kmW11A/XnMPqXAkKrzNo9hOojAa1tZEsMhT9tLDZsD
 uxAFh4xGd2Qo9erD2PglQ87K5cqo/aaMHPcXwwJvuz4A+0F2wRNvM6oiE0KEi3Vz
 VIxRsgrOKt91Fas9qAw7w==
X-ME-Sender: <xms:YIhrY0f5XXbPva4W6iapH6iSgVc1mQy-0yAb0TEAt2NnfO3iq11VlQ>
 <xme:YIhrY2MJY3vWWaO7rxLqzW1_Lol4LM18qMVkg-NxRjZxUDAe2gvYVmO6_1kZ0CNnQ
 Oi1zU1wJo0p7nJPPfE>
X-ME-Received: <xmr:YIhrY1hJPvxtmFPYLnEXl7JTxLVVJnc6io1lU2OsdPsEZfaFeVmf5f7EJulXixdlP09LXVug77k5Weqq7DKCznPUG0NDfc4ndBH6oZDxQwCuWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfedvgddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelleefieelleetteefvdeikeeffeffvefhtdevgfehveduveehjedvvdei
 ledtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YYhrY5-2bY7SWwFv1Q3B0UPPUe7hkr2TBN_y7UTGU6eh-wrXpZTIBA>
 <xmx:YYhrYwtgoa9-CSWEjwGBUBXcsp_LEhXbfJ0BLwzbF7n-xRwhPx6_GQ>
 <xmx:YYhrYwFjClmCqxx9CCwsoT1WlntJj4QAsx592asG7JQaCHNbd5I_Dw>
 <xmx:Y4hrY6b3s63d9BSyz1YV6LElwTXLcseNsD_X7rbqk1iCtDyKINJAKg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Nov 2022 06:00:47 -0500 (EST)
Date: Wed, 9 Nov 2022 12:00:45 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Subject: Re: [PATCH v2 56/65] clk: ingenic: cgu: Switch to determine_rate
Message-ID: <20221109110045.j24vwkaq3s4yzoy3@houat>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-56-f6736dec138e@cerno.tech>
 <80VTKR.CE8RVN8M3ZYK3@crapouillou.net>
 <20221104145946.orsyrhiqvypisl5j@houat>
 <cp7Yh29ndlOOi1yW8KwCcpzoLPLxm1vR@localhost>
 <20221107085417.xrsh6xy3ouwdkp4z@houat>
 <ucJ6KSBqdPTxfxUQqLUr9C9RGiQRnY1I@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ucJ6KSBqdPTxfxUQqLUr9C9RGiQRnY1I@localhost>
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

On Mon, Nov 07, 2022 at 08:57:22PM +0000, Aidan MacDonald wrote:
>=20
> Maxime Ripard <maxime@cerno.tech> writes:
>=20
> > Hi,
> >
> > On Fri, Nov 04, 2022 at 05:35:29PM +0000, Aidan MacDonald wrote:
> >>
> >> Maxime Ripard <maxime@cerno.tech> writes:
> >>
> >> > Hi Paul,
> >> >
> >> > On Fri, Nov 04, 2022 at 02:31:20PM +0000, Paul Cercueil wrote:
> >> >> Le ven. 4 nov. 2022 =E0 14:18:13 +0100, Maxime Ripard <maxime@cerno=
=2Etech> a
> >> >> =E9crit :
> >> >> > The Ingenic CGU clocks implements a mux with a set_parent hook, b=
ut
> >> >> > doesn't provide a determine_rate implementation.
> >> >> >
> >> >> > This is a bit odd, since set_parent() is there to, as its name im=
plies,
> >> >> > change the parent of a clock. However, the most likely candidate =
to
> >> >> > trigger that parent change is a call to clk_set_rate(), with
> >> >> > determine_rate() figuring out which parent is the best suited for=
 a
> >> >> > given rate.
> >> >> >
> >> >> > The other trigger would be a call to clk_set_parent(), but it's f=
ar less
> >> >> > used, and it doesn't look like there's any obvious user for that =
clock.
> >> >> >
> >> >> > So, the set_parent hook is effectively unused, possibly because o=
f an
> >> >> > oversight. However, it could also be an explicit decision by the
> >> >> > original author to avoid any reparenting but through an explicit =
call to
> >> >> > clk_set_parent().
> >> >> >
> >> >> > The driver does implement round_rate() though, which means that w=
e can
> >> >> > change the rate of the clock, but we will never get to change the
> >> >> > parent.
> >> >> >
> >> >> > However, It's hard to tell whether it's been done on purpose or n=
ot.
> >> >> >
> >> >> > Since we'll start mandating a determine_rate() implementation, le=
t's
> >> >> > convert the round_rate() implementation to a determine_rate(), wh=
ich
> >> >> > will also make the current behavior explicit. And if it was an
> >> >> > oversight, the clock behaviour can be adjusted later on.
> >> >>
> >> >> So it's partly on purpose, partly because I didn't know about
> >> >> .determine_rate.
> >> >>
> >> >> There's nothing odd about having a lonely .set_parent callback; in =
my case
> >> >> the clocks are parented from the device tree.
> >> >>
> >> >> Having the clocks driver trigger a parent change when requesting a =
rate
> >> >> change sounds very dangerous, IMHO. My MMC controller can be parent=
ed to the
> >> >> external 48 MHz oscillator, and if the card requests 50 MHz, it cou=
ld switch
> >> >> to one of the PLLs. That works as long as the PLLs don't change rat=
e, but if
> >> >> one is configured as driving the CPU clock, it becomes messy.
> >> >> The thing is, the clocks driver has no way to know whether or not i=
t is
> >> >> "safe" to use a designated parent.
> >> >>
> >> >> For that reason, in practice, I never actually want to have a clock
> >> >> re-parented - it's almost always a bad idea vs. sticking to the par=
ent clock
> >> >> configured in the DTS.
> >> >
> >> > Yeah, and this is totally fine. But we need to be explicit about it.=
 The
> >> > determine_rate implementation I did in all the patches is an exact
> >> > equivalent to the round_rate one if there was one. We will never ask=
 to
> >> > change the parent.
> >> >
> >> > Given what you just said, I would suggest to set the
> >> > CLK_SET_RATE_NO_REPARENT flag as well.
> >>
> >> Ideally there should be a way for drivers and the device tree to
> >> say, "clock X must be driven by clock Y", but the clock framework
> >> would be allowed to re-parent clocks freely as long as it doesn't
> >> violate any DT or driver constraints.
> >
> > I'm not really sure what you mean there, sorry. Isn't it what
> > assigned-clock-parents/clk_set_parent() at probe, plus a determine_rate
> > implementation that would affect best_parent_hw would already provide?
>=20
> Assigning the parent clock in the DT works once, at boot, but going off
> what you wrote in the commit message, if the clock driver has a
> .determine_rate() implementation that *can* reparent clocks then it
> probably *will* reparent them, and the DT assignment will be lost.

Yes, indeed, but assigned-clock-parents never provided any sort of
guarantee on whether or not the clock was allowed to reparent or not.
It's just a one-off thing, right before probe, and a clk_set_parent()
call at probe will override that just fine.

Just like assigned-clock-rates isn't permanent.

> What I'm suggesting is a runtime constraint that the clock subsystem
> would enforce, and actively prevent drivers from changing the parent.
> Either explicitly with clk_set_parent() or due to .determine_rate().
>=20
> That way you could write a .determine_rate() implementation that *can*
> select a better parent, but if the DT applies a constraint to fix the
> clock to a particular parent, the clock subsystem will force that parent
> to be used so you can be sure the clock is never reparented by accident.

Yeah, that sounds like a good idea, and CLK_SET_RATE_NO_REPARENT isn't
too far off from this, it's just ignored by clk_set_parent() for now. I
guess we could rename CLK_SET_RATE_NO_REPARENT to CLK_NO_REPARENT, make
clk_set_parent handle it, and set that flag whenever
assigned-clock-parents is set on a clock.

It's out of scope for this series though, and I certainly don't want to
deal with all the regressions it might create :)

Maxime
