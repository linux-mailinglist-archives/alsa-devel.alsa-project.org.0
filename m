Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0AE624A4F
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 20:08:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7F20167E;
	Thu, 10 Nov 2022 20:07:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7F20167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668107283;
	bh=KNIdyjTIHwogLXoD9QnV1UUSP3xbQbBiVNa+Zt4tGqw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X0U61bO4WO6cpXc5BKGZ80TH1Z0ZGnh8r0KIQpeSfKp7JJZZL2XXy6/5oP/o+8aR6
	 I/YRbSUsAA2KhAXV9BttLFf8/WYRFYvbKQrduGqOFsMbi8hVY+q+lLsUL+zOhsL+3a
	 R9gyEo5tfn11M9Tv5juUz+MOAMNEqGNTMwUX8CvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6054F80558;
	Thu, 10 Nov 2022 20:06:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F25DF80163; Thu, 10 Nov 2022 14:06:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DC5EF80104
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 14:05:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DC5EF80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="GVZ09h+n"
Received: by mail-pj1-x102f.google.com with SMTP id
 d13-20020a17090a3b0d00b00213519dfe4aso1482315pjc.2
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 05:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lrV3scjxXBUgyRehk9/on/q8TxNDq8MdTdotV2WeMBQ=;
 b=GVZ09h+ngHWOecbTC/uzghXW93HVi79Hc3aHUMBuHut0K+MRP4qjrmbxOsy9wAvyhh
 CzAf4wAUsz2LX8ScnTSnBYBlU0zD4SfZXHjTGLx4odMNe2HTZmWoc8/O0MjERSTJDuKQ
 9UeL9YNFV2iAuj4M769TxWHJzx0wEKM1UD/fL8Quarzgi8/jAHx03TmKPyEcNniVs1JP
 E1bQ9YyT5yBnS4K6hTH0QDyjNMb9vjtJqKa6/m2IeBhMmf0jPp66hTlfQCyxBUHnorSo
 4QxzB8BVVnzEGtFh63S81NhnvCx7MGrBaQEPEUdQo8KV1MCY/puvxsLONjSQ8GgFephe
 xQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lrV3scjxXBUgyRehk9/on/q8TxNDq8MdTdotV2WeMBQ=;
 b=bZEWz8JJV18yNi6jO+S+657JyjPwgUTfsOZMUcrfMbdWuEN1ARqH95Imb0CD7B98NI
 Nnw7crW063/xo6J0mGVpWBcOezdXmexUqizY53QlS9EfjVkWz04nFtguPTOdKBWiCJhH
 FmqEWi/LgTlvpnAtv175iaKNaPru7wMkjxEAWo6ApBiWsnkGpgC8rOD2ehYbpaxWsZuY
 k8nGA1mLKwPltVneR1wQbWtgMfYe9uRjZDp+EmpVTJn9aAdVgyf4jl8dwmthRjSuNtXI
 GFcF4ymgD8azipzrlw79rGg0i56rvN8MItfYhMXu93QF5PHE+pGS6eTm8fSui81vCTuU
 HxAw==
X-Gm-Message-State: ACrzQf0+vpvyUAbZubBNwmQ4L6OU9z8eryBVXzQ+Ul1c5O1EqsFZaxq9
 2/9mB7GE40t3tw+hSn/YhL6mcGsQ2iZjhQSIT3likQ==
X-Google-Smtp-Source: AMsMyM4ntafpxKu1kZoVYdCyuwK4y2qgGm0PDcBHChl8r8c0pj7m0JmQ6SHmodBY/Un25AY0R73awNrQX1GtCyrtwGQ=
X-Received: by 2002:a17:903:100c:b0:186:63a1:3b5d with SMTP id
 a12-20020a170903100c00b0018663a13b5dmr65965693plb.148.1668085553525; Thu, 10
 Nov 2022 05:05:53 -0800 (PST)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech>
 <CAPDyKFoycVedCJMy0=UK+q5SiPQHqje_8bSN-gdkpBa6KhFfkg@mail.gmail.com>
 <CACRpkdYOj8uozJZO4MV-_OAKeOsQHhoEM=PyynVuNY-JkpgTOw@mail.gmail.com>
In-Reply-To: <CACRpkdYOj8uozJZO4MV-_OAKeOsQHhoEM=PyynVuNY-JkpgTOw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 10 Nov 2022 14:05:16 +0100
Message-ID: <CAPDyKFr6VeF3s47JfzJ9urtMsEem+GiBtHeU=_S8jNaz-D+qnw@mail.gmail.com>
Subject: Re: [PATCH v2 35/65] clk: ux500: sysctrl: Add a determine_rate hook
To: Linus Walleij <linus.walleij@linaro.org>
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
 linux-sunxi@lists.linux.dev, linux-rtc@vger.kernel.org,
 linux-clk@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Daniel Vetter <daniel@ffwll.ch>, alsa-devel@alsa-project.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-kernel@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-actions@lists.infradead.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Stephen Boyd <sboyd@kernel.org>,
 patches@opensource.cirrus.com, Peter De Schrijver <pdeschrijver@nvidia.com>,
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

On Thu, 10 Nov 2022 at 12:39, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Nov 10, 2022 at 12:29 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > On Fri, 4 Nov 2022 at 14:32, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > The UX500 sysctrl "set_parent" clocks implement a mux with a set_parent
> > > hook, but doesn't provide a determine_rate implementation.
> > >
> > > This is a bit odd, since set_parent() is there to, as its name implies,
> > > change the parent of a clock. However, the most likely candidate to
> > > trigger that parent change is a call to clk_set_rate(), with
> > > determine_rate() figuring out which parent is the best suited for a
> > > given rate.
> > >
> > > The other trigger would be a call to clk_set_parent(), but it's far less
> > > used, and it doesn't look like there's any obvious user for that clock.
> >
> > If I recall correctly, that is the use case we did target for these
> > types of clocks. See sound/soc/ux500/ux500_ab85xx.c, for example.
>
> Hm I am trying to get that driver to work ... from time to time.
> It's just that ALSA SoC DT has changed to much that it turns out
> into a complete rewrite :/
>
> So in sound/soc/ux500/mop500_ab8500.c
> I see this:
>
>         status = clk_set_parent(drvdata->clk_ptr_intclk, clk_ptr);
>         if (status)
> (...)
>
> and there is elaborate code to switch between "SYSCLK" and
> "ULPCLK" (ulta-low power clock). Just like you say... however
> a clock named SYSCLK or ULPCLK does not appear in the
> code in drivers/clk/ux500 or any DT bindings so... it seems to
> be non-working for the time being.

It's definitely not working, but the corresponding clocks ("ulpclk",
"intclk", "audioclk", etc) are being registered in ab8500_reg_clks().

What seems to be missing is a DT conversion for these clocks, so they
can be consumed properly. Right?

Kind regards
Uffe
