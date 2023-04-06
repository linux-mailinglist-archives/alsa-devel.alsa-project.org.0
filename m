Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F536DC412
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Apr 2023 09:58:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C5CFF28;
	Mon, 10 Apr 2023 09:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C5CFF28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681113488;
	bh=GsFgDJdNK8xqm1AOSyggINbimCT7hd4joqGva+V+40Y=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=flMIlobPfvUzFPHy3HLloFmrTTfSsdOHmgXN0HJBRxMmPuwSMa/ZvAXNqlF+GA5UP
	 RcX7n8cfaVENE71w/e/qdygwsobgJ5/rX8v5gRAWQnCLjtaoC9ol/0CZluq6hNJOUC
	 z8w7hoTVrQUwDpBFbnyssWQR7rWlDIY/MJV56EO0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48B0EF804F2;
	Mon, 10 Apr 2023 09:56:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34EA1F80246; Thu,  6 Apr 2023 17:21:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-6.4 required=5.0 tests=NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by alsa1.perex.cz (Postfix) with ESMTP id 11CB8F8015B
	for <alsa-devel@alsa-project.org>; Thu,  6 Apr 2023 17:21:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11CB8F8015B
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D72F1169E;
	Thu,  6 Apr 2023 08:22:08 -0700 (PDT)
Received: from [10.2.7.51] (stinger.cambridge.arm.com [10.2.7.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADE653F762;
	Thu,  6 Apr 2023 08:21:17 -0700 (PDT)
Message-ID: <a54a4ea0-f9f5-6869-9629-747c3889a1de@arm.com>
Date: Thu, 6 Apr 2023 16:21:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 36/65] clk: versatile: sp810: Add a determine_rate hook
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-36-9a1358472d52@cerno.tech>
From: Pawel Moll <pawel.moll@arm.com>
In-Reply-To: <20221018-clk-range-checks-fixes-v3-36-9a1358472d52@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: pawel.moll@arm.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GGDGUHPVVSFRGDPLE76MCRRRBYNMBXP4
X-Message-ID-Hash: GGDGUHPVVSFRGDPLE76MCRRRBYNMBXP4
X-Mailman-Approved-At: Mon, 10 Apr 2023 07:53:27 +0000
CC: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
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
 Paul Cercueil <paul@crapouillou.net>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-kernel@vger.kernel.org,
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GGDGUHPVVSFRGDPLE76MCRRRBYNMBXP4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 04/04/2023 11:11, Maxime Ripard wrote:
> The Versatile sp810 "timerclken" clock implements a mux with a
> set_parent hook, but doesn't provide a determine_rate implementation.
> 
> This is a bit odd, since set_parent() is there to, as its name implies,
> change the parent of a clock. 

Explanation of this mystery is pretty simple - the original patch:

	commit 6e973d2c438502dcf956e76305258ba7d1c7d1d3
	Author: Pawel Moll <pawel.moll@arm.com>
	Date:   Thu Apr 18 18:23:22 2013 +0100

	    clk: vexpress: Add separate SP810 driver

predates introduction of determine_rate to clk_ops...

	commit 71472c0c06cf9a3d1540762ea205654c584e3bc4
	Author: James Hogan <jhogan@kernel.org>
	Date:   Mon Jul 29 12:25:00 2013 +0100

	    clk: add support for clock reparent on set_rate

and clearly no one (the author included ;-) bothered to have another
look at this side of the driver.

> And if it was an oversight, then we are at least explicit about our
> behavior now and it can be further refined down the line.

It's been one hell of a memory lane trip, but my recollection suggest
that the main goal of the driver was simply initialisation of the mux
to select the 1MHz parent, because the other option - 32kHz - just
didn't make any sense whatsoever. And that would be the case on every
single platform using SP810 I know (or at least: knew), so it's seems
to me that making the state permanent, as you're suggesting (or I
think you're suggesting?) it's the right thing to do.

Thanks!

Paweł
