Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2B6624A4A
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 20:07:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FF8F166C;
	Thu, 10 Nov 2022 20:06:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FF8F166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668107237;
	bh=H5FKZPxGHJoooX31l+qryyFtW/DY08k6T4D3JxGzA6A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ocAlC7/X2po9lfmuYkFl4pByss2q1dkIYBs/Z1F/d5uJHn0jIo2znG1gGBzzXpAna
	 xcLJVk9n9SbS2RHZb6SvDBAH02I/MO4VswFQlKx1YqcNRbJc/63ERaVXXi8TpVrb7b
	 G0dANfN9htlaDkOiaiJDIoO+iI9TWj5OgXupd4X0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2DF2F802E8;
	Thu, 10 Nov 2022 20:06:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 621F5F8021D; Thu, 10 Nov 2022 12:29:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84ECCF80114
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 12:29:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84ECCF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="nm5AzPUP"
Received: by mail-pg1-x531.google.com with SMTP id h193so1514798pgc.10
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 03:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dZWp2kHBH7BxTK24vYMYaWuh8ES61v4HZQKkOxWH97c=;
 b=nm5AzPUP/c5SxnOWRF0E8OOs8vIUdOgDjB6wYkEQYpfYDRuGKSxS+CBIeuds7UEokj
 CAc3O4M3Lzp0CmH9uvJ+chSuCz2e7UtgkMxDMXFmH0EFBdC81NQcL56cIa/e5fTzyvWS
 kSegvkcOyKB6FEauX3mSzkzzDIAUq5r5SATzN3WmVSBqg1jyg/gg0kYs06KdBSG3zxV/
 fvTxGa1dt18Ruz+5BEtQasGBTHQrEp0wpReAHWWGdK+pWMVHzmdtTwn3mkonTWk309ZV
 x5RN6EKVnoWzvPKijsEeJPqRTGi+5rLHTCBxYP1D5lgzLbOuhL8arV0ezTVKJRNayIhr
 L9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dZWp2kHBH7BxTK24vYMYaWuh8ES61v4HZQKkOxWH97c=;
 b=ghlGCfiI+jefoKlKXltnOOgRW8mTuO0vdnAAUXNjEqtOJificDztIUTjU/ZhB+Ngt6
 JQVbPrAH1nhwgNzQ5b3e0357Yt3FGnQ3arer7X30wcfi3pVlEB3kP6uVv4lClVTyocab
 pyOmAzXO00i9q+Vl37EoQX9UXnHRBMFYn6f+RLkiF/MTQ565teaKfcUSRNXtd0AaaHwu
 4bSv18ssuKRbzAcMihyYIcH70higSQF6JBEhPsY48IIJiPKH9B4Zbx7K/BbOj6eAHrGf
 THOo1VBEtqPX3m7yGCT8MGCpQyYiJzC+3SxcCjyTzpPcHtLP2BXRG4J/9pbPgmYObnsz
 llmQ==
X-Gm-Message-State: ACrzQf1f1+Iynx+FkZLcMPS10V5svFKG3FIQpEDbDsg4BJCGWz8Kv7Qq
 OcoZ3vdtiKwU1UM90x/RT6GP1bswiP1eBD2D7egy4Q==
X-Google-Smtp-Source: AMsMyM4cuzpOD/TX9hqFyYyupcC8P3vPeFAFlSRm0wZ2MgnRUbZnV+cRg9A/mVHt7wBrkUdmfz48YahbcXukazUMnzc=
X-Received: by 2002:a63:4204:0:b0:442:ee11:4894 with SMTP id
 p4-20020a634204000000b00442ee114894mr2372631pga.595.1668079758533; Thu, 10
 Nov 2022 03:29:18 -0800 (PST)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 10 Nov 2022 12:28:41 +0100
Message-ID: <CAPDyKFoycVedCJMy0=UK+q5SiPQHqje_8bSN-gdkpBa6KhFfkg@mail.gmail.com>
Subject: Re: [PATCH v2 35/65] clk: ux500: sysctrl: Add a determine_rate hook
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 10 Nov 2022 20:06:20 +0100
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-phy@lists.infradead.org, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Abel Vesa <abelvesa@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
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
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
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

On Fri, 4 Nov 2022 at 14:32, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The UX500 sysctrl "set_parent" clocks implement a mux with a set_parent
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

If I recall correctly, that is the use case we did target for these
types of clocks. See sound/soc/ux500/ux500_ab85xx.c, for example.

Maybe there are some additional pieces missing from the old down
stream kernel, I don't have full picture, sorry.

Anyway, if I am not wrong, this was about supporting a low-power audio
use case, which requires us to switch the parent clock (to avoid
wasting energy).

>
> So, the set_parent hook is effectively unused, possibly because of an
> oversight. However, it could also be an explicit decision by the
> original author to avoid any reparenting but through an explicit call to
> clk_set_parent().

Yes, this was the reason.

As a matter of fact, I don't even recall that re-parenting was
possible through clk_set_rate() when this clock driver was introduced.
But, I might be wrong, it's quite a while ago.

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

Seems reasonable to me!

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/clk/ux500/clk-sysctrl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/ux500/clk-sysctrl.c b/drivers/clk/ux500/clk-sysctrl.c
> index 702f2f8b43fa..d36336665b6d 100644
> --- a/drivers/clk/ux500/clk-sysctrl.c
> +++ b/drivers/clk/ux500/clk-sysctrl.c
> @@ -110,6 +110,7 @@ static const struct clk_ops clk_sysctrl_gate_fixed_rate_ops = {
>  };
>
>  static const struct clk_ops clk_sysctrl_set_parent_ops = {
> +       .determine_rate = __clk_mux_determine_rate,
>         .set_parent = clk_sysctrl_set_parent,
>         .get_parent = clk_sysctrl_get_parent,
>  };
> @@ -220,6 +221,7 @@ struct clk *clk_reg_sysctrl_set_parent(struct device *dev,
>                                 unsigned long flags)
>  {
>         return clk_reg_sysctrl(dev, name, parent_names, num_parents,
> -                       reg_sel, reg_mask, reg_bits, 0, 0, flags,
> +                       reg_sel, reg_mask, reg_bits, 0, 0,
> +                       flags | CLK_SET_RATE_NO_REPARENT,
>                         &clk_sysctrl_set_parent_ops);
>  }
>
> --
> b4 0.11.0-dev-99e3a
