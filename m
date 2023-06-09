Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27931729D66
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:54:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FD9E84B;
	Fri,  9 Jun 2023 16:53:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FD9E84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322454;
	bh=5yCCx637qN6JiLW7I6+8zEHQGblEuFICtzq96prQWME=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mpkqm0UhczgRzgxvyTmufXanmM7uE+HDyVEtoPauPQ35GilIaWRWUmGm9Fs8dY52F
	 Uwv0NEBgYEzdAY1GmKMJh1fxo0HQRdal7nPaUYEaN4dcGCCJG11D6QF5BuX5sg6KTO
	 eGeuQFhaus6ZhkLis5XujO67gGPTk18G3UT6fKHU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD94FF80674; Fri,  9 Jun 2023 16:48:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5E37F8057C;
	Fri,  9 Jun 2023 16:48:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C585F80199; Fri,  9 Jun 2023 03:49:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF8A7F80130
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 03:49:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF8A7F80130
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=K6IhUHPI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F197E652B2;
	Fri,  9 Jun 2023 01:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41180C433EF;
	Fri,  9 Jun 2023 01:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686275370;
	bh=5yCCx637qN6JiLW7I6+8zEHQGblEuFICtzq96prQWME=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=K6IhUHPIMyX6G51Gvg9LBUJ3F+NMA6t6yEqi3fTeDTd+AJzCCvvookTr/6vQqGmIn
	 YHm6xCzH29XDY1RxhGUWWRXRiWAz+w4FinVcWL9BZIaqu935rDcsd9srsnN7LexnGZ
	 GCkr6cL3K8SIP7mxO9yA8OMPuNRkbBGzshyF7AScJsc0Echnlzdy6HrJq2B3P6eqEB
	 C/vA6phGnqUiPVssfsHiLNKrmW37L5wDKBSmCLTQDZ9XlTE9d38MUMidr99RQRsQ6o
	 iveJTt876EEgX7IN09+I3JVakkYPpa1Fbdci55u3kgBWbiPwoqFEOp6SBpvW+XcWiw
	 hoc+eH+MLB+dw==
Message-ID: <431d1ae3993d1fc78decbcd065442f29.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
Subject: Re: [PATCH v4 00/68] clk: Make determine_rate mandatory for muxes
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
	Abel Vesa <abelvesa@kernel.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andreas =?utf-8?q?F=C3=A4rber?= <afaerber@suse.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Chen-Yu Tsai <wens@csie.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	David Lechner <david@lechnology.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jaroslav Kysela <perex@perex.cz>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Liam Girdw ood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>, Peng Fan <peng.fan@nxp.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Sekhar Nori <nsekhar@ti.com>,
	Shawn Guo <shawnguo@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
	dri-devel@lists.freedesktop.org, linux-actio@alsa-project.org,
	ns@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	NXP Linux Team <linux-imx@nxp.com>, patches@opensource.cirrus.com,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Liam Beguin <liambeguin@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Pawel Moll <pawel.moll@arm.com>, alsa-devel@alsa-project.org
To: Maxime Ripard <maxime@cerno.tech>,
 Michael Turquette <mturquette@baylibre.com>
Date: Thu, 08 Jun 2023 18:49:28 -0700
User-Agent: alot/0.10
X-MailFrom: sboyd@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: L2BH6KCNMC6VW6VT7WM2SJ4IUDOWM743
X-Message-ID-Hash: L2BH6KCNMC6VW6VT7WM2SJ4IUDOWM743
X-Mailman-Approved-At: Fri, 09 Jun 2023 14:48:52 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L2BH6KCNMC6VW6VT7WM2SJ4IUDOWM743/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Quoting Maxime Ripard (2023-05-05 04:25:02)
> Hi,
>=20
> This is a follow-up to a previous series that was printing a warning
> when a mux has a set_parent implementation but is missing
> determine_rate().
>=20
> The rationale is that set_parent() is very likely to be useful when
> changing the rate, but it's determine_rate() that takes the parenting
> decision. If we're missing it, then the current parent is always going
> to be used, and thus set_parent() will not be used. The only exception
> being a direct call to clk_set_parent(), but those are fairly rare
> compared to clk_set_rate().
>=20
> Stephen then asked to promote the warning to an error, and to fix up all
> the muxes that are in that situation first. So here it is :)
>=20

I've applied this to clk-next after squashing in an export. Thanks for
taking this on.

I'll have to monitor for wreckage with any in-flight drivers. I suspect
I'll have to take out the last commit, but maybe we can just let those
in-flight drivers get fixed up later.
