Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A77B261D86B
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Nov 2022 08:23:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DC8B1728;
	Sat,  5 Nov 2022 08:22:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DC8B1728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667633023;
	bh=YCA5LmXNVTbGR68VFj9olPWOu457uRUzU0O7I5/O/6A=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DHA6liy+LthWgf/Au3cETUKn3mGt+dPL/IhMU1tp5vh3L8tsENQjMokPzyA6tgHBO
	 ryyKMaXv+qxEcUsWxqDLni5er1IrpQ6aA3fmj0yEnubxqFxaB9UDgp8FzWA4Pbp3Ar
	 J34c+eTJNq4KundHRQ0uThor9Fax5CcnCaF4YHU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6D6CF80817;
	Sat,  5 Nov 2022 08:04:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33B5BF80155; Fri,  4 Nov 2022 17:45:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3802F801D5
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 17:45:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3802F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=lechnology.com header.i=@lechnology.com
 header.b="WdhahLUm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4AvnEeQeniDWkQBvG292xKcyqRcJZJN4ObwNBkkj5tk=; b=WdhahLUmGJpQ95hVL+3u1VjMxb
 tUf7myaQndCk0qHzeKh1A+E2O/JcVf+aJ+IiQD/qFkAbTU535DJ2WAUD6UP1/EvQ/y4beijc5YALa
 Q3fcMmim22RAxWP0Rh4RhjXR+GqdPYPNBO9KnnRYGmufKc5r2oNWcdiYm05562NzkHszBUsTfAWO7
 JgFdZNqyyoguqSiEpMW173KJx1qkCjb5qv/86gVYx+OCVFDAJzuXuMvEgrqYPPENnQENv9FFS7mH/
 qsMwcba1c5ad5x6Y1xKSIlEvINxjtsa56wEJ+F6ehiPRzOvf9PnvY6QcDHcSY53EeaOn9zO5Boa6z
 wQg4vJPQ==;
Received: from ip98-183-112-30.ok.ok.cox.net ([98.183.112.30]:58206
 helo=[192.168.0.134]) by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.95)
 (envelope-from <david@lechnology.com>) id 1oqzog-00Chgx-Is;
 Fri, 04 Nov 2022 12:45:28 -0400
Message-ID: <187e61cd-7d02-2453-acf1-30180559d42f@lechnology.com>
Date: Fri, 4 Nov 2022 11:45:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 21/65] clk: davinci: da8xx-cfgchip: Add a
 determine_rate hook
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Stephen Boyd <sboyd@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Daniel Vetter <daniel@ffwll.ch>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Manivannan Sadhasivam
 <mani@kernel.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
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
 Richard Fitzgerald <rf@opensource.cirrus.com>, Vinod Koul
 <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sekhar Nori <nsekhar@ti.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 David Airlie <airlied@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-21-f6736dec138e@cerno.tech>
From: David Lechner <david@lechnology.com>
In-Reply-To: <20221018-clk-range-checks-fixes-v2-21-f6736dec138e@cerno.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Approved-At: Sat, 05 Nov 2022 08:03:30 +0100
Cc: linux-rtc@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 linux-actions@lists.infradead.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On 11/4/22 8:17 AM, Maxime Ripard wrote:
> The Davinci DA8xxx cfgchip mux clock implements a mux with a set_parent
> hook, but doesn't provide a determine_rate implementation.
> 
> This is a bit odd, since set_parent() is there to, as its name implies,
> change the parent of a clock. However, the most likely candidate to
> trigger that parent change is a call to clk_set_rate(), with
> determine_rate() figuring out which parent is the best suited for a
> given rate.
> 
> The other trigger would be a call to clk_set_parent(), but it's far less
> used, and it doesn't look like there's any obvious user for that clock.
> 
> So, the set_parent hook is effectively unused, possibly because of an
> oversight. However, it could also be an explicit decision by the
> original author to avoid any reparenting but through an explicit call to
> clk_set_parent().


The parent is defined in the device tree and is not expected to change
at runtime, so if I am understanding the patch correctly, setting the
CLK_SET_RATE_NO_REPARENT flag seems correct.

> 
> The latter case would be equivalent to setting the flag
> CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
> to __clk_mux_determine_rate(). Indeed, if no determine_rate
> implementation is provided, clk_round_rate() (through
> clk_core_round_rate_nolock()) will call itself on the parent if
> CLK_SET_RATE_PARENT is set, and will not change the clock rate
> otherwise. __clk_mux_determine_rate() has the exact same behavior when
> CLK_SET_RATE_NO_REPARENT is set.
> 
> And if it was an oversight, then we are at least explicit about our
> behavior now and it can be further refined down the line.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/clk/davinci/da8xx-cfgchip.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/davinci/da8xx-cfgchip.c b/drivers/clk/davinci/da8xx-cfgchip.c
> index 4103d605e804..c04276bc4051 100644
> --- a/drivers/clk/davinci/da8xx-cfgchip.c
> +++ b/drivers/clk/davinci/da8xx-cfgchip.c
> @@ -229,6 +229,7 @@ static u8 da8xx_cfgchip_mux_clk_get_parent(struct clk_hw *hw)
>   }
>   
>   static const struct clk_ops da8xx_cfgchip_mux_clk_ops = {
> +	.determine_rate	= __clk_mux_determine_rate,
>   	.set_parent	= da8xx_cfgchip_mux_clk_set_parent,
>   	.get_parent	= da8xx_cfgchip_mux_clk_get_parent,
>   };
> @@ -251,7 +252,7 @@ da8xx_cfgchip_mux_clk_register(struct device *dev,
>   	init.ops = &da8xx_cfgchip_mux_clk_ops;
>   	init.parent_names = parent_names;
>   	init.num_parents = 2;
> -	init.flags = 0;
> +	init.flags = CLK_SET_RATE_NO_REPARENT;
>   
>   	mux->hw.init = &init;
>   	mux->regmap = regmap;
> 

