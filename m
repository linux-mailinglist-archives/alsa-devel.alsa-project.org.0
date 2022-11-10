Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D41624A4E
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 20:07:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 256FF1677;
	Thu, 10 Nov 2022 20:06:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 256FF1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668107262;
	bh=WoIZXbVEqfvMNSXd8O2ReI8IMSVrc5fVSYCg9jRtcuQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ma3zCA01ZINuiYScsEOVBw/vf79v6WKHZ3YgmjmOn8obaGjb1F7D+cl41I6ZXtJPz
	 WnhVM1tYWGh0QXbk2VooH6hwrmzfdBTjOACnm8lk1gKBrkT70Pp6S7Y+d/EVMIardl
	 DfDNBJcnElbJwcglwv4aGz9daoIh4xFnG3td+CdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43539F80507;
	Thu, 10 Nov 2022 20:06:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07469F8021D; Thu, 10 Nov 2022 12:40:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C14BDF80114
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 12:39:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C14BDF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cLoqN/9H"
Received: by mail-ed1-x532.google.com with SMTP id a67so2605571edf.12
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 03:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ck1BFgYQUoxfjthSY0Z/ICMvhRDs51HkE0D/E51e4wU=;
 b=cLoqN/9Hw4WN89uoDoxpq9Ce/Ps341RBpybWaA/Ttn7dX0XjEZSpQMeE/cLupilSy+
 h9M/AwRJwi+wD3lcUZtgCbl5J3Y1/4+a+UG987xrzyBKVQSsdTGx1Fm9p56BVwQCgeqw
 ImbNP+V0cuLG09qZBqDEVWEBH4JmnDYapBzy20rI0QOEnuyEvU41wtqwWtHQ/Ku+SIq6
 z/iAwWeg98cPs684u3jM1bZkrHRFlxBeM553WE2HZydhyBqAswoiUSyHfbMc8MScHPVp
 jTxj/0bSYX2PEajd6PNI/IV0ZBru+l7g17Wn1GCvWMrBI6s8qLNSd3U7dwQx3hiin+sp
 LiYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ck1BFgYQUoxfjthSY0Z/ICMvhRDs51HkE0D/E51e4wU=;
 b=MRSsIcKnwd7IwUrWdJmjV7SVV1ewLJuuI6e3VyGVEuBci5CXlUtXiQJT67ZrIhomod
 RAbD7VN+WD0myh7DWh9vILq14d7lpTVxehUziAxE4N6Li3Y1z731PY/IWc4Oxpgz2w1j
 ZwoybmtGTT1BwZiZltZviTnt0Toxksk8chBqYQlkdrE7m76VZcbtOBaE6Es24J0sE7DF
 PO4zxslKI65+6bm2ozY+TZ3ESITUDunEEn6ETJ6lOhpaW20r+0tI54GaQCTyBNfnL9M5
 g+jO2JqcevULkr0owucp2RU1s+zNaWHXxa7czzpnh+WufTTX77blnYMf/raxG6PALHdp
 FYbw==
X-Gm-Message-State: ACrzQf36tfoqf+cwLmigReCXPe7lCTo8A3dTnFodyK0QdEY7rj2lp/3i
 j50+2SqgMslh6S6U+BUi2nS28HK7oWIMqKIHinRddg==
X-Google-Smtp-Source: AMsMyM6KPfAGNVILTJIJybxZbWNcNW1j294XPOEkghGZsATADMyuAh5FXMGRYiA9Y0UOLTHKSZCe9zdW3Mb4U369XWo=
X-Received: by 2002:a05:6402:4002:b0:463:bc31:2604 with SMTP id
 d2-20020a056402400200b00463bc312604mr2100488eda.32.1668080397979; Thu, 10 Nov
 2022 03:39:57 -0800 (PST)
MIME-Version: 1.0
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech>
 <CAPDyKFoycVedCJMy0=UK+q5SiPQHqje_8bSN-gdkpBa6KhFfkg@mail.gmail.com>
In-Reply-To: <CAPDyKFoycVedCJMy0=UK+q5SiPQHqje_8bSN-gdkpBa6KhFfkg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Nov 2022 12:39:46 +0100
Message-ID: <CACRpkdYOj8uozJZO4MV-_OAKeOsQHhoEM=PyynVuNY-JkpgTOw@mail.gmail.com>
Subject: Re: [PATCH v2 35/65] clk: ux500: sysctrl: Add a determine_rate hook
To: Ulf Hansson <ulf.hansson@linaro.org>
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

On Thu, Nov 10, 2022 at 12:29 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Fri, 4 Nov 2022 at 14:32, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > The UX500 sysctrl "set_parent" clocks implement a mux with a set_parent
> > hook, but doesn't provide a determine_rate implementation.
> >
> > This is a bit odd, since set_parent() is there to, as its name implies,
> > change the parent of a clock. However, the most likely candidate to
> > trigger that parent change is a call to clk_set_rate(), with
> > determine_rate() figuring out which parent is the best suited for a
> > given rate.
> >
> > The other trigger would be a call to clk_set_parent(), but it's far less
> > used, and it doesn't look like there's any obvious user for that clock.
>
> If I recall correctly, that is the use case we did target for these
> types of clocks. See sound/soc/ux500/ux500_ab85xx.c, for example.

Hm I am trying to get that driver to work ... from time to time.
It's just that ALSA SoC DT has changed to much that it turns out
into a complete rewrite :/

So in sound/soc/ux500/mop500_ab8500.c
I see this:

        status = clk_set_parent(drvdata->clk_ptr_intclk, clk_ptr);
        if (status)
(...)

and there is elaborate code to switch between "SYSCLK" and
"ULPCLK" (ulta-low power clock). Just like you say... however
a clock named SYSCLK or ULPCLK does not appear in the
code in drivers/clk/ux500 or any DT bindings so... it seems to
be non-working for the time being.

Yours,
Linus Walleij
