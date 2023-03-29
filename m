Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E75F6D0AA4
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Mar 2023 18:07:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B51A7209;
	Thu, 30 Mar 2023 18:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B51A7209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680192450;
	bh=4zOE3jMEKOhNI25UF0fOfIL08piHi2bqDz6TyK76qR4=;
	h=In-Reply-To:References:Subject:From:To:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MzMVcb8LDDJa8qA/H3X5ezZ0MZXm9RJPvGfK7nU+1nZYUOIekXlSwghy3pc4VXEDL
	 pwU98z+w+LkQCD7lvF3zjkD71keWedE5KFaq8h6Z7U+RJN/80XF+EwnstolbdsiGcF
	 onrXi7CpQJ4z8dGagPaYdtTUeb0VP1Z3y3dx/Erk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E41DF8032D;
	Thu, 30 Mar 2023 18:06:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0E7EF80272; Wed, 29 Mar 2023 22:04:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1EA7EF80114
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 22:04:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EA7EF80114
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uw7qtD3H
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B515561E1B;
	Wed, 29 Mar 2023 20:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090DEC433D2;
	Wed, 29 Mar 2023 20:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680120256;
	bh=4zOE3jMEKOhNI25UF0fOfIL08piHi2bqDz6TyK76qR4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=uw7qtD3HESWGMQ9Baj1w6twvKM7JMNgmt7PKXoCvJOczY0u340GfBpvymvmBiBWVx
	 qf+kcFVYf4dg0yAAoDZF/aYBqaksZ6Fa6+sA1PoByUd2LNaPRyh7sgPqRQE/0pwpm6
	 kLBCPzCQv/zuh06cTNQJrCxJ0npzPNiAuiOv4nPQtFpsUot5FTUeXXUIthYvejQLJp
	 rYE7s1omKIT+oMjKorhMYWPlc7LMeX1LkHhCE8Dy2xq0wbdX6qu2wzq8S2YfmcMFVE
	 ghrqf/6Xyf4MjMXD1dbNaL7jIuCYUjU2Xzl7KYDgsErEqGoLGnH3utZKKa/Vvp72NN
	 7AGUd6HAiLFYg==
Message-ID: <da1ea2d9278c15a4aa9d4fb3d459e819.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230329195049.lbdbkbqu6zbq5xii@penduick>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-43-f6736dec138e@cerno.tech>
 <Y2UzdYyjgahJsbHg@sirena.org.uk> <20221104155123.qomguvthehnogkdd@houat>
 <Y2U2+ePwRieYkNjv@sirena.org.uk> <20221107084322.gk4j75r52zo5k7xk@houat>
 <Y2j0r0wX1XtQBvqO@sirena.org.uk> <20221107152603.57qimyzkinhifx5p@houat>
 <5819b1362f35ce306e1b6d566bfd44e5.sboyd@kernel.org>
 <20230329195049.lbdbkbqu6zbq5xii@penduick>
Subject: Re: [PATCH v2 43/65] ASoC: tlv320aic32x4: Add a determine_rate hook
From: Stephen Boyd <sboyd@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 29 Mar 2023 13:04:13 -0700
User-Agent: alot/0.10
X-MailFrom: sboyd@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: BNYJUQQ6FVMO7IB6C7EE6P37EDMHH63N
X-Message-ID-Hash: BNYJUQQ6FVMO7IB6C7EE6P37EDMHH63N
X-Mailman-Approved-At: Thu, 30 Mar 2023 16:06:27 +0000
CC: Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Daniel Vetter <daniel@ffwll.ch>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>,
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
 Max Filippov <jcmvbkbc@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-stm32@st-md-mailman.stormreply.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.ker,
 nel.org@alsa-project.org, linux-actions@lists.infradead.org,
 linux-clk@vger.kernel.org,
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BNYJUQQ6FVMO7IB6C7EE6P37EDMHH63N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Quoting Maxime Ripard (2023-03-29 12:50:49)
> On Wed, Mar 22, 2023 at 04:31:04PM -0700, Stephen Boyd wrote:
>=20
> > The clk_set_parent() path is valid for those cases. Probably nobody
> > cares about determine_rate because they don't set rates on these clks.
> > Some drivers even explicitly left out determine_rate()/round_rate()
> > because they didn't want to have some other clk round up to the mux
> > and change the parent.
> >=20
> > Eventually we want drivers to migrate to determine_rate op so we can get
> > rid of the round_rate op and save a pointer (we're so greedy). It's been
> > 10 years though, and that hasn't been done. Sigh! I can see value in
> > this series from the angle of migrating, but adding a determine_rate op
> > when there isn't a round_rate op makes it hard to reason about. What if
> > something copies the clk_ops or sets a different flag? Now we've just
> > added parent changing support to clk_set_rate(). What if the clk has
> > CLK_SET_RATE_PARENT flag set? Now we're going to ask the parent clk to
> > change rate. Fun bugs.
> >=20
> > TL;DR: If the set_parent op exists but determine_rate/round_rate doesn't
> > then the clk is a mux that doesn't want to support clk_set_rate(). Make
> > a new mux function that's the contents of the CLK_SET_RATE_NO_REPARENT
> > branch in clk_mux_determine_rate_flags() and call that directly from the
> > clk_ops so it is clear what's happening,
> > clk_hw_mux_same_parent_determine_rate() or something with a better name.
> > Otherwise migrate the explicit determine_rate op to this new function
> > and don't set the flag.
> >=20
> > It may be possible to entirely remove the CLK_SET_RATE_NO_REPARENT flag
> > with this design, if the determine_rate clk_op can call the inner
> > wrapper function instead of __clk_mux_determine_rate*() (those
> > underscores are awful, we should just prefix them with clk_hw_mux_*()
> > and live happier). That should be another patch series.
>=20
> Sorry but it's not really clear to me what you expect in the v2 of this
> series (if you even expect one). It looks that you don't like the
> assignment-if-missing idea Mark suggested, but should I just
> rebase/resend or did you expect something else?
>=20

Yes, we want explicit code. Just rebase & resend. Don't add a
determine_rate if there isn't a round_rate. Don't add more users of
CLK_SET_RATE_NO_REPARENT. Instead, make an explicit determine_rate
function for that. If you want to work on the removal of
CLK_SET_RATE_NO_REPARENT go for it. Otherwise I'll take care of it after
this series.
