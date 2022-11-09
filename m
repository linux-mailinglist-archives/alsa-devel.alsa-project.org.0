Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45071623170
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 18:26:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB51316CE;
	Wed,  9 Nov 2022 18:25:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB51316CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668014783;
	bh=PW2qF4RuIf0U0a03XcDBEqLOhjbayrLb3qGwpve0zj0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QCP8oP6dZpI18DprKIsZomRiSzFPQx0t8KUKBnwD61aVxoIQykRyrpvox/4UfZvJb
	 A04b0hsh1vctgz7p4OM9d99PRNsrUQPye1bQ9oZe/PW8qM8VKcJPzgHkQa32E9QwFU
	 2tv0Ykv/XhYn4J5YEx3x7sFBgNiPlYNO1C7O4a0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D4D9F8062D;
	Wed,  9 Nov 2022 18:16:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91B6EF80217; Wed,  9 Nov 2022 03:44:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C96FF80121
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 03:44:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C96FF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fm3R7eHw"
Received: by mail-ed1-x534.google.com with SMTP id v17so25285064edc.8
 for <alsa-devel@alsa-project.org>; Tue, 08 Nov 2022 18:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZSs9bG/LbFf1fIR0eapTeL6P50DjYrAFt1f1UPagmkc=;
 b=fm3R7eHwEY7icgp5E36AR1x+G3iJ/B+gTC6qXXcb2VuX8T7PYbpIOMaEAEk+z5gP5C
 C30KcgR4lm806IYQfNeeuFx0cfGof3DpzdH786/cCDzuWrdeUNc7jFOrL5vMwTo9Vbtm
 dVxBVDI57pb7BVYvuH3eLaJ4JjrtQb9xL2MZ41TI7RBi2z65S87p9zWDePR0yCVz6VHw
 JOVSi+JRNqY3PBDz9qa44qLlWzFaPdXGRa4GRcfXuEi5nSYmnCJ6Zyk7dG4zjutSYT5H
 vN2MmXbmOeI+y4HkZpv6Bi0bN99D9Nar9mmN1KGg/88Sfc9R8fV6gzM/jPxbXATFIa/1
 F+hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZSs9bG/LbFf1fIR0eapTeL6P50DjYrAFt1f1UPagmkc=;
 b=SeRe8q+pv3RrehgguUE7zheRyTFhdczfi/2rPq1BruwkNg3LNqIiq+gEuCoRvGg+cs
 1Md1w7fONoJ+uvc0KmBANEstC/x4WIIGUwA8+rdOF3UEt50ZYpNroDZL2rHjZ1Cbx7zH
 Uh2U7ZxSoLrpDJhIOrVq5B4o2TVg3grRw2Geul/aPPBTpgRzdJVD9rbeKPgR6bHbVguF
 1YstdBXkl5pvM8o+odvlEG4jFdBe46KZb7Jz9lC0ZLYIe0K6GDydtjNSMto5kZIkvOjd
 WyP6170CUuTEc27pxgZ0TCVdu9TaXDPsAeKFQebMfpJQodt+i6GYAokqWXIBxwcONTqu
 KO0Q==
X-Gm-Message-State: ACrzQf0FO/5skDeW/AOQ2Z9wt8D0mB58E3EuH1KlU2QsntYJBLzkri3d
 +9OHI0crqfWnIhm0Lm6MEDW/S/wfQaMWlqzzAKg=
X-Google-Smtp-Source: AMsMyM4o96Fp/fgGe8bWp9qyaCLc1d6jcauj7urZdaiQjIItG7q8RJuK4x04Dncd47Xu2Mogx93A97DsfgYY/BWPass=
X-Received: by 2002:a05:6402:3806:b0:450:bad8:8cd5 with SMTP id
 es6-20020a056402380600b00450bad88cd5mr59725933edb.305.1667961844484; Tue, 08
 Nov 2022 18:44:04 -0800 (PST)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-58-f6736dec138e@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v2-58-f6736dec138e@cerno.tech>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Wed, 9 Nov 2022 10:43:26 +0800
Message-ID: <CAAfSe-t96pttpdLjLYntof5JCNcVHg0fMckk6zC7YHRRceDw+A@mail.gmail.com>
Subject: Re: [PATCH v2 58/65] clk: sprd: composite: Switch to determine_rate
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 09 Nov 2022 18:15:49 +0100
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-phy@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Abel Vesa <abelvesa@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@gmail.com>,
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
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-renesas-soc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <david@lechnology.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
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

On Fri, 4 Nov 2022 at 21:33, Maxime Ripard <maxime@cerno.tech> wrote:
>
> The Spreadtrum composite clocks implements a mux with a set_parent
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
>
> The driver does implement round_rate() though, which means that we can
> change the rate of the clock, but we will never get to change the
> parent.
>
> However, It's hard to tell whether it's been done on purpose or not.
>
> Since we'll start mandating a determine_rate() implementation, let's
> convert the round_rate() implementation to a determine_rate(), which
> will also make the current behavior explicit. And if it was an
> oversight, the clock behaviour can be adjusted later on.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan

> ---
>  drivers/clk/sprd/composite.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/sprd/composite.c b/drivers/clk/sprd/composite.c
> index ebb644820b1e..d3a852720c07 100644
> --- a/drivers/clk/sprd/composite.c
> +++ b/drivers/clk/sprd/composite.c
> @@ -9,13 +9,19 @@
>
>  #include "composite.h"
>
> -static long sprd_comp_round_rate(struct clk_hw *hw, unsigned long rate,
> -                               unsigned long *parent_rate)
> +static int sprd_comp_determine_rate(struct clk_hw *hw,
> +                                   struct clk_rate_request *req)
>  {
>         struct sprd_comp *cc = hw_to_sprd_comp(hw);
> +       unsigned long rate;
>
> -       return sprd_div_helper_round_rate(&cc->common, &cc->div,
> -                                        rate, parent_rate);
> +       rate = sprd_div_helper_round_rate(&cc->common, &cc->div,
> +                                         req->rate, &req->best_parent_rate);
> +       if (rate < 0)
> +               return rate;
> +
> +       req->rate = rate;
> +       return 0;
>  }
>
>  static unsigned long sprd_comp_recalc_rate(struct clk_hw *hw,
> @@ -53,7 +59,7 @@ const struct clk_ops sprd_comp_ops = {
>         .get_parent     = sprd_comp_get_parent,
>         .set_parent     = sprd_comp_set_parent,
>
> -       .round_rate     = sprd_comp_round_rate,
> +       .determine_rate = sprd_comp_determine_rate,
>         .recalc_rate    = sprd_comp_recalc_rate,
>         .set_rate       = sprd_comp_set_rate,
>  };
>
> --
> b4 0.11.0-dev-99e3a
