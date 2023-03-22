Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2A56C6938
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 14:11:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D351ED8;
	Thu, 23 Mar 2023 14:11:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D351ED8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679577111;
	bh=EEErT/PnRAtdQE0xsUp/GkoJjA2tZIOlkEavkERihSA=;
	h=In-Reply-To:References:Subject:From:To:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DhGmFgz4tOtDy6mF7zr6ZPaGSRb/zb1LTAEpeMzDFh7SkVUWMruZlG4IY5xyYr/RZ
	 EEm/3nPACogAgz+hhU2bTehRXrVUk/L7QqRyFDNy7pfZTCQ/W4a8yiGOoSzO88hok6
	 3obDTrB1WnBedsQNFqlqA6BXGb7Cm38SDdsceU1g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E61FF8055C;
	Thu, 23 Mar 2023 14:10:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51122F802E8; Wed, 22 Mar 2023 16:19:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37E9FF80254
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 16:19:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37E9FF80254
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=biz9bCMN
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 376E9CE1DE0;
	Wed, 22 Mar 2023 15:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8301DC433D2;
	Wed, 22 Mar 2023 15:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679498358;
	bh=EEErT/PnRAtdQE0xsUp/GkoJjA2tZIOlkEavkERihSA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=biz9bCMNpkK2ZEQa+eaU+sNLjl7taEonfLGWnhALLtgkorM899mr4nkh/IxFNN3nN
	 nJ8zf6kd9ma1XWWQN723hJBFbunjh7bWY6cNcMki8eHBAltLh6IIJI508urmj1MapD
	 JTUNJwewzxCeo4W5xDNfWE9SRxilevfEGZeplSUxKR8eK6JDEGdZGqtC1yaB/GX/d5
	 Hm4YlBRnG9Uo9db85S4u3R8JymPLotvxLSzr/8NbFvPABTfLD1D9ZdxDncX/1SKkhB
	 J8j13I8QXDyGwrgpvNRQ/GUh8VH55YjjyNRF38nHR9RbQQi71Z28jdsata/N9enUg3
	 lfo4mo3dbV8dA==
Message-ID: <a5e4e878bbd2493e27ef9acd6a1f9af1.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230322100153.gzyznaukbdngcvko@houat>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <f804380a14c346fdbbf3286bcb40b3c2.sboyd@kernel.org>
 <20230322100153.gzyznaukbdngcvko@houat>
Subject: Re: [PATCH v2 00/65] clk: Make determine_rate mandatory for muxes
From: Stephen Boyd <sboyd@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 22 Mar 2023 08:19:16 -0700
User-Agent: alot/0.10
X-MailFrom: sboyd@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: NNEINF7TBJMVA6JLTRS2GI5IAQJMIUPQ
X-Message-ID-Hash: NNEINF7TBJMVA6JLTRS2GI5IAQJMIUPQ
X-Mailman-Approved-At: Thu, 23 Mar 2023 13:10:00 +0000
CC: Abel Vesa <abelvesa@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Chen-Yu Tsai <wens@csie.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 David Lechner <david@lechnology.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Orson Zhai <orsonzhai@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Samuel Holland <samuel@sholland.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sekhar Nori <nsekhar@ti.com>, Shawn Guo <shawnguo@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NNEINF7TBJMVA6JLTRS2GI5IAQJMIUPQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Quoting Maxime Ripard (2023-03-22 03:01:53)
> Hi Stephen,
>=20
> On Tue, Mar 21, 2023 at 04:55:03PM -0700, Stephen Boyd wrote:
> > Quoting Maxime Ripard (2022-11-04 06:17:17)
> > > Hi,
> > >=20
> > > This is a follow-up to a previous series that was printing a warning
> > > when a mux has a set_parent implementation but is missing
> > > determine_rate().
> > >=20
> > > The rationale is that set_parent() is very likely to be useful when
> > > changing the rate, but it's determine_rate() that takes the parenting
> > > decision. If we're missing it, then the current parent is always going
> > > to be used, and thus set_parent() will not be used. The only exception
> > > being a direct call to clk_set_parent(), but those are fairly rare
> > > compared to clk_set_rate().
> > >=20
> > > Stephen then asked to promote the warning to an error, and to fix up =
all
> > > the muxes that are in that situation first. So here it is :)
> > >=20
> > > Let me know what you think,
> >=20
> > What's the plan here? Are you going to resend?
>=20
> It wasn't clear to me whether or not this was something that you wanted,
> and I got some pushback on the drivers so I kind of forgot about it.
>=20
> If you do want it (and it looks like you do), I'll resend it.

Let me read the whole series first. I was ignoring it because I was
assuming it was going to be resent.
