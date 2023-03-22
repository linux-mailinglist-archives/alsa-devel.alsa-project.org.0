Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0526C693F
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 14:13:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9EE6EC3;
	Thu, 23 Mar 2023 14:12:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9EE6EC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679577187;
	bh=AHU0pIED4pdCTNu/Ki2of6GAWy9IUUsw6t/t0Hez+4c=;
	h=In-Reply-To:References:Subject:From:To:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pwyr8wLIbvUVdEwx4/uqlY7AMTnmXU68NJl5DVlQCse94UIIzJs34m1aUnfinYXuG
	 LlKzl1hzJfXAnL680nzt2++2qIp4X0RV53bPKb4D8IUVBQ1G4L9moyQPXsde77PxEz
	 ZRKifqEviTIyVdsVSh4zU4uG598gBNdV2liktsPM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B31F1F8059F;
	Thu, 23 Mar 2023 14:10:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF173F8027B; Thu, 23 Mar 2023 00:41:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11832F80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 00:41:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11832F80093
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qhMrUZAm
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2981EB81EA0;
	Wed, 22 Mar 2023 23:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1FBC433D2;
	Wed, 22 Mar 2023 23:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679528502;
	bh=AHU0pIED4pdCTNu/Ki2of6GAWy9IUUsw6t/t0Hez+4c=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qhMrUZAm8XEQhH+BGl6x55Y1Wd0UlbZIqAiPPr++LjM278cFuBNvP6Rpo9lXFGyqL
	 uJ6LWk0ZldLVQTkF8EhEtux9mFcIydmVdkkNiB3jsxskjV3J9TxBW+ZWw4AhchZNSS
	 M2Mt12jWyLTObCnbEMQVSwcWlQybSHgVqcVm1SCLrDBy1nq0jsAccne6avkIMyuXjA
	 +Iylb5tPBf/uEkEjMeRO2JSySC6AvvEaLfkavbQkcL5CdgNLbCm1zo3rBXpbY0HuQl
	 /qS04gYV5Ay5BvMbb9UUtlZdBQgsaPJetgh8R5A/sgXgF8t56P/kwN5ccnXw8HrEPJ
	 TB1oQwtO3fAag==
Message-ID: <06a293adc75990ed3e297b076fc38d8a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221109110045.j24vwkaq3s4yzoy3@houat>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-56-f6736dec138e@cerno.tech>
 <80VTKR.CE8RVN8M3ZYK3@crapouillou.net>
 <20221104145946.orsyrhiqvypisl5j@houat>
 <cp7Yh29ndlOOi1yW8KwCcpzoLPLxm1vR@localhost>
 <20221107085417.xrsh6xy3ouwdkp4z@houat>
 <ucJ6KSBqdPTxfxUQqLUr9C9RGiQRnY1I@localhost>
 <20221109110045.j24vwkaq3s4yzoy3@houat>
Subject: Re: [PATCH v2 56/65] clk: ingenic: cgu: Switch to determine_rate
From: Stephen Boyd <sboyd@kernel.org>
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>
Date: Wed, 22 Mar 2023 16:41:40 -0700
User-Agent: alot/0.10
X-MailFrom: sboyd@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: LYLC7HHKKUJ27TLXRPNQCXC3XKXHYPTR
X-Message-ID-Hash: LYLC7HHKKUJ27TLXRPNQCXC3XKXHYPTR
X-Mailman-Approved-At: Thu, 23 Mar 2023 13:10:01 +0000
CC: Paul Cercueil <paul@crapouillou.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Daniel Vetter <daniel@ffwll.ch>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
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
 Mark Brown <broonie@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LYLC7HHKKUJ27TLXRPNQCXC3XKXHYPTR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Quoting Maxime Ripard (2022-11-09 03:00:45)
> On Mon, Nov 07, 2022 at 08:57:22PM +0000, Aidan MacDonald wrote:
> >=20
> > Maxime Ripard <maxime@cerno.tech> writes:
> >=20
> > > Hi,
> > >
> > > On Fri, Nov 04, 2022 at 05:35:29PM +0000, Aidan MacDonald wrote:
> >=20
> > Assigning the parent clock in the DT works once, at boot, but going off
> > what you wrote in the commit message, if the clock driver has a
> > .determine_rate() implementation that *can* reparent clocks then it
> > probably *will* reparent them, and the DT assignment will be lost.
>=20
> Yes, indeed, but assigned-clock-parents never provided any sort of
> guarantee on whether or not the clock was allowed to reparent or not.
> It's just a one-off thing, right before probe, and a clk_set_parent()
> call at probe will override that just fine.
>=20
> Just like assigned-clock-rates isn't permanent.
>=20
> > What I'm suggesting is a runtime constraint that the clock subsystem
> > would enforce, and actively prevent drivers from changing the parent.
> > Either explicitly with clk_set_parent() or due to .determine_rate().
> >=20
> > That way you could write a .determine_rate() implementation that *can*
> > select a better parent, but if the DT applies a constraint to fix the
> > clock to a particular parent, the clock subsystem will force that parent
> > to be used so you can be sure the clock is never reparented by accident.
>=20
> Yeah, that sounds like a good idea, and CLK_SET_RATE_NO_REPARENT isn't
> too far off from this, it's just ignored by clk_set_parent() for now. I
> guess we could rename CLK_SET_RATE_NO_REPARENT to CLK_NO_REPARENT, make
> clk_set_parent handle it, and set that flag whenever
> assigned-clock-parents is set on a clock.
>=20
> It's out of scope for this series though, and I certainly don't want to
> deal with all the regressions it might create :)
>=20

This sounds like a new dt binding that says the assigned parent should
never change. It sounds sort of like gpio hogs. A clock-hogs binding?
