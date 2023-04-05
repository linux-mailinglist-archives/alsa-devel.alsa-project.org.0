Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DC16D99A6
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Apr 2023 16:29:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78D56E9C;
	Thu,  6 Apr 2023 16:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78D56E9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680791385;
	bh=Mjb6j+bIXE7b8JKh7kXdb3mAp/fvDvyUInzyZqABl7c=;
	h=Subject:From:To:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LG5s54QV/P7LbJUpjqBvkM+LPZKjixqVoacTq26d0yMRrGNp5/ZUBb1npeg/70hqf
	 7/fU03fTnSNfmJjsUE6DghWNFo5c78yWCCeyvCsFjm0rhusJ/n+jSHqdLjT2ZBhmuX
	 45CiIOyp7Ri4OrQKbE/JPiyKceBbfiEe2uVyHeJA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E76E4F8059F;
	Thu,  6 Apr 2023 16:26:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0F79F80075; Wed,  5 Apr 2023 17:30:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53566F80075
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 17:29:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53566F80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=KkyZeRD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1680708591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mjb6j+bIXE7b8JKh7kXdb3mAp/fvDvyUInzyZqABl7c=;
	b=KkyZeRD8zRr9DUPi8E+yaAiJ6llkrkavOcg1hU9CiniByzzr5DJTX0SyfBAelvEuN8MeEv
	jL7uDqd+LBP5S8A6OuKPnyJCiz26onUF85KEMt1FysxEno2QjGawIYOL+G+P8JgGTbkscL
	0Btl6oFLBPglYsRqL+QJzG3n9bKa4SU=
Message-ID: <84dea45aa0a46f531d38369a31d08420dc43dfe3.camel@crapouillou.net>
Subject: Re: [PATCH v2 56/65] clk: ingenic: cgu: Switch to determine_rate
From: Paul Cercueil <paul@crapouillou.net>
To: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 05 Apr 2023 17:29:47 +0200
In-Reply-To: <g24dkwtsobslw6qdvs4vbcdmk2txrlrephm5zmlff2fusrxheo@mqxrprzctymk>
References: <cp7Yh29ndlOOi1yW8KwCcpzoLPLxm1vR@localhost>
	 <20221107085417.xrsh6xy3ouwdkp4z@houat>
	 <ucJ6KSBqdPTxfxUQqLUr9C9RGiQRnY1I@localhost>
	 <20221109110045.j24vwkaq3s4yzoy3@houat>
	 <06a293adc75990ed3e297b076fc38d8a.sboyd@kernel.org>
	 <xpKMzGb1sOsucWMTlJIMzrT5KjLlZ7JP@localhost>
	 <20230324111959.frjf4neopbs67ugd@houat>
	 <rTJKpeLOBeu3eOLW5z3P5fEpcOJJLrGs@localhost>
	 <20230327192430.b2cp3yyrkzy4g4vw@penduick>
	 <1e0e8e9fe44c27e844e7e918a985704e58da2c27.camel@crapouillou.net>
	 <g24dkwtsobslw6qdvs4vbcdmk2txrlrephm5zmlff2fusrxheo@mqxrprzctymk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MailFrom: paul@crapouillou.net
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: PNBDFVFZGSDQN3XYBESDYYHF32SM42UE
X-Message-ID-Hash: PNBDFVFZGSDQN3XYBESDYYHF32SM42UE
X-Mailman-Approved-At: Thu, 06 Apr 2023 14:26:03 +0000
CC: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Daniel Vetter <daniel@ffwll.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Jonathan Hunter <jonathanh@nvidia.com>, Abel Vesa <abelvesa@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Samuel Holland <samuel@sholland.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Vinod Koul <vkoul@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Sekhar Nori <nsekhar@ti.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 David Airlie <airlied@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Lechner <david@lechnology.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-stm32@st-md-mailman.stormreply.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 patches@opensource.cirrus.com, linux-tegra@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PNBDFVFZGSDQN3XYBESDYYHF32SM42UE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Le mercredi 05 avril 2023 =C3=A0 16:50 +0200, Maxime Ripard a =C3=A9crit=C2=
=A0:
> On Wed, Apr 05, 2023 at 02:57:26PM +0200, Paul Cercueil wrote:
> > Le lundi 27 mars 2023 =C3=A0 21:24 +0200, Maxime Ripard a =C3=A9crit=C2=
=A0:
> > > On Fri, Mar 24, 2023 at 08:58:48PM +0000, Aidan MacDonald wrote:
> > > > > > My suggestion: add a per-clock bitmap to keep track of
> > > > > > which
> > > > > > parents
> > > > > > are allowed. Any operation that would select a parent clock
> > > > > > not
> > > > > > on the
> > > > > > whitelist should fail. Automatic reparenting should only
> > > > > > select
> > > > > > from
> > > > > > clocks on the whitelist. And we need new DT bindings for
> > > > > > controlling
> > > > > > the whitelist, for example:
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0 clock-parents-0 =3D <&clk1>, <&pll_c>;
> > > > > > =C2=A0=C2=A0=C2=A0 clock-parents-1 =3D <&clk2>, <&pll_a>, <&pll=
_b>;
> > > > > >=20
> > > > > > This means that clk1 can only have pll_c as a parent, while
> > > > > > clk2 can
> > > > > > have pll_a or pll_b as parents. By default every clock will
> > > > > > be
> > > > > > able
> > > > > > to use any parent, so a list is only needed if the machine
> > > > > > needs a
> > > > > > more restrictive policy.
> > > > > >=20
> > > > > > assigned-clock-parents should disable automatic
> > > > > > reparenting,
> > > > > > but allow
> > > > > > explicit clk_set_parent(). This will allow clock drivers to
> > > > > > start doing
> > > > > > reparenting without breaking old DTs.
> > > > >=20
> > > > > I'm generally not a fan of putting all these policies in the
> > > > > device
> > > > > tree. Do you have an example where it wouldn't be possible to
> > > > > do
> > > > > exactly
> > > > > this from the driver itself?
> > > >=20
> > > > I'm confused. What's implicit in the example is clk1 and clk2
> > > > might
> > > > have *other* possible choices of parent clock and the device
> > > > tree
> > > > is
> > > > limiting what the OS is allowed to choose.
> > > >=20
> > > > Why would you put such arbitrary limitations into the driver?
> > >=20
> > > Why would we put such arbitrary limitations in the firmware? As
> > > this
> > > entire thread can attest, people are already using the device
> > > tree to
> > > work around the limitations of the Linux driver, or reduce the
> > > features of Linux because they can rely on the device tree.
> > > Either
> > > way, it's linked to the state of the Linux driver, and any other
> > > OS
> > > or
> > > Linux version could very well implement something more dynamic.
> >=20
> > Probably because if we have to choose between setting policy in the
> > kernel or in the firmware, it is arguably better to set it in the
> > firmware.
>=20
> I have a very different view on this I guess. Firmware is (most of
> the
> time) hard to update, and the policy depend on the state of support
> of a
> given OS so it's likely to evolve. The kernel is the best place to me
> to
> put that kind of policy. Why do you think differently?

Because the clocks configuration can be board-specific. And you don't
really want board-specific stuff in the driver.

If we take the Ingenic JZ4770 SoC as example, on one board we parent
everything we can to the PLL1 clock and set it to 432 MHz (the least
common multiple). Then the PLL0 (which drives the DDR and CPU clocks)
can be updated to overclock/underclock the CPU and RAM.

So should that be hardcoded in the driver? Well, for a different board,
for which overclock is not really needed, it's better to parent
everything to PLL0 so that PLL1 can be shut down to save power. So what
policy should be hardcoded in the driver?

>=20
> > Especially when talking about clocks, as the firmware is already
> > the
> > one programming the boot clocks.
>=20
> I'm not sure what your point is there. I don't think I ever saw a
> firmware getting the clocks right for every possible scenario on a
> given
> platform. And if it was indeed the case, then we wouldn't even a
> kernel
> driver.

My point is that there is already policy in how the firmware sets up
the hardware; and most often than not, the kernel driver won't change
that (e.g. you're probably not going to touch the DDR clock). It's
better to have all policy in the firmware then, instead of having some
in the firmware, and some in the kernel driver.

Cheers,
-Paul
