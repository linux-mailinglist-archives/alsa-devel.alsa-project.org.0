Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5491629FFA
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 18:09:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41CD11630;
	Tue, 15 Nov 2022 18:08:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41CD11630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668532177;
	bh=D7WS1/Iq9HsSGiJfZeeNpWeUbfN2wCTKHRwR1waF5b8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kp0QocfCU9DscH3OVWbcIi9XSzxzyr5Fr8Wai4qyxZv6lVOad9xqIWF0NEl3hZdqV
	 wNceQaTtNuLOT9438feKzA2Jlq2SKtaZhRp/XVrUfcHZJBEUGhEkwijbNfRSzUwV/z
	 VHI4lpk5gp6fPNoA3KbQwA5U4AG2Hs/uzLFmpARs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7D7BF800B8;
	Tue, 15 Nov 2022 18:08:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75152F80431; Mon, 14 Nov 2022 10:05:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A10BFF800B8
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 10:05:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A10BFF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gu23KWX+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0AC7E60F67;
 Mon, 14 Nov 2022 09:05:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA65C433C1;
 Mon, 14 Nov 2022 09:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668416750;
 bh=D7WS1/Iq9HsSGiJfZeeNpWeUbfN2wCTKHRwR1waF5b8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gu23KWX+hkd2VrW8L8cgRL+RvzQoNmHr4ZHYqyx7b9ggw62j+4gl+srj7mMWbYEWO
 eMq9AeoWeTXuHN/JCWdPJOC4s9/SfymP7ivydCT3Rc5lzvj0XxUfCGvOXg+FUovve3
 mBjFDbEU8fbv5pZjeBcZG4yoTG+UTWC2w0hMhrdGaf5jiuivlIjmg6M0icdu4BayDd
 QORZ6I5Y6XZL3p7KDrZaQgns3WiyBQD5S5uJ7AJ3isJBuf/JmKGDVf410NdJ4z5Krb
 lm/rhmS+2/v3szQ2Sg6geE8bZDNcFgYVQt+IzZj3PeuYYzaH8viYNnTeheDKRc95zq
 VsYSZrpR3L72Q==
Date: Mon, 14 Nov 2022 09:05:34 +0000
From: Lee Jones <lee@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 35/65] clk: ux500: sysctrl: Add a determine_rate hook
Message-ID: <Y3IE3ta8hLLUcu7H@google.com>
References: <20221018-clk-range-checks-fixes-v2-0-f6736dec138e@cerno.tech>
 <20221018-clk-range-checks-fixes-v2-35-f6736dec138e@cerno.tech>
 <CAPDyKFoycVedCJMy0=UK+q5SiPQHqje_8bSN-gdkpBa6KhFfkg@mail.gmail.com>
 <CACRpkdYOj8uozJZO4MV-_OAKeOsQHhoEM=PyynVuNY-JkpgTOw@mail.gmail.com>
 <CAPDyKFr6VeF3s47JfzJ9urtMsEem+GiBtHeU=_S8jNaz-D+qnw@mail.gmail.com>
 <CACRpkdb8uYfs6w99FVjD_t6nZgDhPUx=yB1j=CmpHTHAM2QGQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdb8uYfs6w99FVjD_t6nZgDhPUx=yB1j=CmpHTHAM2QGQw@mail.gmail.com>
X-Mailman-Approved-At: Tue, 15 Nov 2022 18:08:42 +0100
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-phy@lists.infradead.org, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Abel Vesa <abelvesa@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
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
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
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

On Fri, 11 Nov 2022, Linus Walleij wrote:

> On Thu, Nov 10, 2022 at 2:05 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > On Thu, 10 Nov 2022 at 12:39, Linus Walleij <linus.walleij@linaro.org> wrote:
> > >
> > > On Thu, Nov 10, 2022 at 12:29 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > On Fri, 4 Nov 2022 at 14:32, Maxime Ripard <maxime@cerno.tech> wrote:
> > > > >
> > > > > The UX500 sysctrl "set_parent" clocks implement a mux with a set_parent
> > > > > hook, but doesn't provide a determine_rate implementation.
> > > > >
> > > > > This is a bit odd, since set_parent() is there to, as its name implies,
> > > > > change the parent of a clock. However, the most likely candidate to
> > > > > trigger that parent change is a call to clk_set_rate(), with
> > > > > determine_rate() figuring out which parent is the best suited for a
> > > > > given rate.
> > > > >
> > > > > The other trigger would be a call to clk_set_parent(), but it's far less
> > > > > used, and it doesn't look like there's any obvious user for that clock.
> > > >
> > > > If I recall correctly, that is the use case we did target for these
> > > > types of clocks. See sound/soc/ux500/ux500_ab85xx.c, for example.
> > >
> > > Hm I am trying to get that driver to work ... from time to time.
> > > It's just that ALSA SoC DT has changed to much that it turns out
> > > into a complete rewrite :/
> > >
> > > So in sound/soc/ux500/mop500_ab8500.c
> > > I see this:
> > >
> > >         status = clk_set_parent(drvdata->clk_ptr_intclk, clk_ptr);
> > >         if (status)
> > > (...)
> > >
> > > and there is elaborate code to switch between "SYSCLK" and
> > > "ULPCLK" (ulta-low power clock). Just like you say... however
> > > a clock named SYSCLK or ULPCLK does not appear in the
> > > code in drivers/clk/ux500 or any DT bindings so... it seems to
> > > be non-working for the time being.
> >
> > It's definitely not working, but the corresponding clocks ("ulpclk",
> > "intclk", "audioclk", etc) are being registered in ab8500_reg_clks().
> >
> > What seems to be missing is a DT conversion for these clocks, so they
> > can be consumed properly. Right?
> 
> Yeps that and a few more things, I have a scratch rewrite here:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-stericsson.git/log/?h=ux500-audio-rewrite
> 
> I remember Lee said he had audio working with the mainline kernel
> on Snowball at one point, unfortunately I think that was before we
> started with the DT conversions and then we probably broke it.

That was also 100 years ago. :)

But yes, it used to work at one point.

-- 
Lee Jones [李琼斯]
