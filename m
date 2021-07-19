Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D921F3CD184
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jul 2021 12:07:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DC511658;
	Mon, 19 Jul 2021 12:06:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DC511658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626689229;
	bh=Nj79ajt1FUDjq21Ds51HYCJC9gqYSFBf5OrQ5EWdmDU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eIydtM+xHChyKgJNQj+seK2XX737LnS1MwwAUEH+fcN8AS2+Sxj4m1NgRsP76Vd/o
	 ZN/2eHVDTEZ5jdDTyhcbM1xkpnx+CClsQBXd4qJWPMLy1pMpYYhp+9u8C4ApCu1KG7
	 ++eumWWJS6a+IJlFHc2HuVAu7x2aLQ9F6cvMdmlA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC229F80256;
	Mon, 19 Jul 2021 12:05:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D82AEF80227; Mon, 19 Jul 2021 12:05:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA7ABF800C5
 for <alsa-devel@alsa-project.org>; Mon, 19 Jul 2021 12:05:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA7ABF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="CrR0V9Mt"
Received: by mail-lj1-x22b.google.com with SMTP id r16so25458742ljk.9
 for <alsa-devel@alsa-project.org>; Mon, 19 Jul 2021 03:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ROS63eA4eMtueLLBIpoZBWybNJst7HeNqrpv8eomGtY=;
 b=CrR0V9MtAJhrmDYHgx6QMBClk/pgCC0p1kSblCK+aXICGhCIv0JhRgQFy7K4oGAr3J
 T3ofioI+RrZu3zZCBCBfkVVGfZ9m/tFK2C3hpyDaTH0Nv7Dy6oAnKLupG3SxTHYJRYEV
 4Ux5rEMVFNA1vxMBvIzaI7+wVsdTfZ9Hvn90k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ROS63eA4eMtueLLBIpoZBWybNJst7HeNqrpv8eomGtY=;
 b=KL9Yjk40ilh+PhXFr7znSWgMe1y7Rvbgtw7JuV8i79N6UsVA40KmnOc2YCXtCT93eS
 2/DG3YPLUgvXom8ee1StiHQag5omDoSOsUu2GhOofSFzSAVgInopd0QcyjR11YQxT2zM
 o6yMtHNLQeElJy/Ly1TaczIRSx5ALXcemUgetgC6rlv9Mlk1sNYLgyYaQuqeXdbAuaaK
 q0+QiI0JGzNoA63EHP2jExymcqKPfAq97z3PEZij3yfOq7VDfe8xiCerFqu10kAFcJa3
 bDWhA+CS9ayndPK+1eqLjiIkGpouNaPXWlAG+vAMYhJDF7+QpPe4t2FMxzC5kwG4Y/iF
 UFgw==
X-Gm-Message-State: AOAM532E5vQ8at+C3aECvJ6MKMGFRgtHS6m2V7WiZW+3No5dN59TtPOn
 sC945KpNXxy4cDp5pZVYleoeh/rBHaSZF523Ti3xhA==
X-Google-Smtp-Source: ABdhPJy3yMQLjmuUCZgE18WRtXTymtKSnw1VMjs4GT/YulhmJdffaDX7c+0mUzGHzjpZDjRmahLdxUOoOErZl8xN7e0=
X-Received: by 2002:a2e:b6c2:: with SMTP id m2mr243906ljo.91.1626689132553;
 Mon, 19 Jul 2021 03:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210629014736.31153-1-trevor.wu@mediatek.com>
 <20210629014736.31153-6-trevor.wu@mediatek.com>
 <CAGXv+5FzOs+=9PbYAEahVXvdJG1FnRkSUo_r3AVYZzNKGqg0oA@mail.gmail.com>
 <9929a3a20df1a89fc94baf7c75c0c65d9a61de0f.camel@mediatek.com>
 <CAGXv+5HFjM_N_MM5ZddGLcuYVsOXAJwfNuKvB5Cfo0k=nO456g@mail.gmail.com>
 <266fd1f5de56743292ac5fc64664113c0bb0e41a.camel@mediatek.com>
In-Reply-To: <266fd1f5de56743292ac5fc64664113c0bb0e41a.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 19 Jul 2021 18:05:21 +0800
Message-ID: <CAGXv+5FVWNgCeAseULOJbU3=6ggQ=b=mtP_sEQd0NgtdX-ttiQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] ASoC: mediatek: mt8195: add platform driver
To: Trevor Wu <trevor.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, tiwai@suse.com,
 Rob Herring <robh+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 broonie@kernel.org, linux-mediatek@lists.infradead.org,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Li-Yu Yu <aaronyu@google.com>, bicycle.tsai@mediatek.com,
 linux-arm-kernel@lists.infradead.org
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

Hi,

On Thu, Jul 15, 2021 at 7:05 PM Trevor Wu <trevor.wu@mediatek.com> wrote:
>
> On Tue, 2021-07-13 at 14:00 +0800, Chen-Yu Tsai wrote:
> > On Mon, Jul 12, 2021 at 11:10 PM Trevor Wu <trevor.wu@mediatek.com>
> > wrote:
> > >
> > > On Mon, 2021-07-12 at 14:57 +0800, Chen-Yu Tsai wrote:
> > > >  are all internal Hi,
> > > >
> > > > On Tue, Jun 29, 2021 at 9:49 AM Trevor Wu <trevor.wu@mediatek.com
> > > > >
> > > > wrote:
> > > > >
> > > > > This patch adds mt8195 platform and affiliated driver.
> > > > >
> > > > > Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> > > > > ---
> > > > >  sound/soc/mediatek/Kconfig                     |    9 +
> > > > >  sound/soc/mediatek/Makefile                   |    1 +
> > > > >  sound/soc/mediatek/mt8195/Makefile            |   11 +
> > > > >  sound/soc/mediatek/mt8195/mt8195-afe-clk.c    |  899 +++++
> > > > >  sound/soc/mediatek/mt8195/mt8195-afe-clk.h    |  201 +
> > > > >  sound/soc/mediatek/mt8195/mt8195-afe-common.h |  200 +
> > > > >  sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    | 3264
> > > > > +++++++++++++++++
> > > > >  sound/soc/mediatek/mt8195/mt8195-reg.h        | 2793
> > > > > ++++++++++++++
> > > > >  8 files changed, 7378 insertions(+)
> > > > >  create mode 100644 sound/soc/mediatek/mt8195/Makefile
> > > > >  create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> > > > >  create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-clk.h
> > > > >  create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-
> > > > > common.h
> > > > >  create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> > > > >  create mode 100644 sound/soc/mediatek/mt8195/mt8195-reg.h
> > > > >
> > > > > diff --git a/sound/soc/mediatek/Kconfig
> > > > > b/sound/soc/mediatek/Kconfig
> > > > > index 74dae4332d17..3389f382be06 100644
> > > > > --- a/sound/soc/mediatek/Kconfig
> > > > > +++ b/sound/soc/mediatek/Kconfig
> > > > > @@ -184,3 +184,12 @@ config SND_SOC_MT8192_MT6359_RT1015_RT5682
> > > > >           with the MT6359 RT1015 RT5682 audio codec.
> > > > >           Select Y if you have such device.
> > > > >           If unsure select "N".
> > > > > +
> > > > > +config SND_SOC_MT8195
> > > > > +       tristate "ASoC support for Mediatek MT8195 chip"
> > > > > +       select SND_SOC_MEDIATEK
> > > > > +       help
> > > > > +         This adds ASoC platform driver support for Mediatek
> > > > > MT8195 chip
> > > > > +         that can be used with other codecs.
> > > > > +         Select Y if you have such device.
> > > > > +         If unsure select "N".
> > > > > diff --git a/sound/soc/mediatek/Makefile
> > > > > b/sound/soc/mediatek/Makefile
> > > > > index f6cb6b8508e3..34778ca12106 100644
> > > > > --- a/sound/soc/mediatek/Makefile
> > > > > +++ b/sound/soc/mediatek/Makefile
> > > > > @@ -5,3 +5,4 @@ obj-$(CONFIG_SND_SOC_MT6797) += mt6797/
> > > > >  obj-$(CONFIG_SND_SOC_MT8173) += mt8173/
> > > > >  obj-$(CONFIG_SND_SOC_MT8183) += mt8183/
> > > > >  obj-$(CONFIG_SND_SOC_MT8192) += mt8192/
> > > > > +obj-$(CONFIG_SND_SOC_MT8195) += mt8195/
> > > > > diff --git a/sound/soc/mediatek/mt8195/Makefile
> > > > > b/sound/soc/mediatek/mt8195/Makefile
> > > > > new file mode 100644
> > > > > index 000000000000..b2c9fd88f39e
> > > > > --- /dev/null
> > > > > +++ b/sound/soc/mediatek/mt8195/Makefile
> > > > > @@ -0,0 +1,11 @@
> > > > > +# SPDX-License-Identifier: GPL-2.0
> > > > > +
> > > > > +# platform driver
> > > > > +snd-soc-mt8195-afe-objs := \
> > > > > +       mt8195-afe-clk.o \
> > > > > +       mt8195-afe-pcm.o \
> > > > > +       mt8195-dai-adda.o \
> > > > > +       mt8195-dai-etdm.o \
> > > > > +       mt8195-dai-pcm.o
> > > > > +
> > > > > +obj-$(CONFIG_SND_SOC_MT8195) += snd-soc-mt8195-afe.o
> > > > > diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> > > > > b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> > > > > new file mode 100644
> > > > > index 000000000000..57aa799b4f41
> > > > > --- /dev/null
> > > > > +++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> > > > > @@ -0,0 +1,899 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > +/*
> > > > > + * mt8195-afe-clk.c  --  Mediatek 8195 afe clock ctrl
> > > > > + *
> > > > > + * Copyright (c) 2021 MediaTek Inc.
> > > > > + * Author: Bicycle Tsai <bicycle.tsai@mediatek.com>
> > > > > + *         Trevor Wu <trevor.wu@mediatek.com>
> > > > > + */
> > > > > +
> > > > > +#include <linux/clk.h>
> > > > > +
> > > > > +#include "mt8195-afe-common.h"
> > > > > +#include "mt8195-afe-clk.h"
> > > > > +#include "mt8195-reg.h"
> > > > > +
> > > > > +static const char *aud_clks[MT8195_CLK_NUM] = {
> > > >
> > > > Most of these clocks are not described in the device tree
> > > > binding. If
> > > > the driver needs to reference them, they should be described. We
> > > > should
> > > > not be hard-coding clock names across different drivers.
> > > >
> > >
> > > Sorry, I didn't know I have to list all clocks in the dt-binding.
> > > Originally, I thought these clocks will be described in the clock
> > > binding, so I didn't add them to the binding of afe driver.
> > > I will add these clocks to mt8195-afe-pcm.yaml.
> >
> > If the device consumes clocks, then the clocks that get consumed
> > should
> > be listed in the device's bindings. This is not related to the clock
> > bindings, which is a clock provider.
> >
> Got it. Thanks.
>
> > > > The more important question is, why does the driver need to
> > > > reference
> > > > all of them? Maybe we should take a step back and draw out a
> > > > clock
> > > > tree
> > > > diagram for the hardware?
> > > >
> > >
> > > The clock structure is PLL -> MUX -> GATE.
> > > xtal, pll and divider are the possible clock inputs for MUX.
> > > Because we select the clock input of audio module based on the use
> > > case, we use clk_get to retrive all clocks which are possible to be
> > > used.
> >
> > So I see a couple the driver is doing reparenting:
> >
> >   a. Reparent audio_h to standard oscillator when ADDA is not used,
> >      presumably to let the APLL be turned off
> >
> > Why not just turn off audio_h? It looks like audio_h feeds a couple
> > clock
> > gates in the audio subsystem. Just a guess, but is this the AHB bus
> > clock?
> > Why not just have it parented to "univpll_d7" all the time then?
> >
>
> Sorry, I am not sure if it is the AHB bus clock.
> I only know how audio module uses the clock.
> audio_h feeds to some clock gate like aud_adc_hires, which is used when
> sampling rate is higher than 48kHz, and hardware designer suggests us
> use apll1_ck when AFE requrires the clock.

I see. So the simplified explanation is high clock rate for high res audio.
Would high clock rate work for standard sample rates?
Would using apll1 or univpll all the time work, instead of reparenting?
What's the gain if we do reparenting?

> As I know, DSP also requires audio_h.
> When we disable the clock in AFE driver, the ref count in CCF is not
> becoming zero if DSP still uses it.
> But only AFE requires higher clock rate, so we reparent audio_h to 26M
> when it's not required in adda module.

I see. Wouldn't reparenting the clock while it is in use by another module
cause glitches?

> > Also, reparenting really should be done implicitly with
> > clk_set_rate()
> > with the clock driver supporting reparenting on rate changes.
> >
> >   b. Assignment of PLLs for I2S/PCM MCLK outputs
> >
> > Is there a reason for explicit assignment, other than clock rate
> > conflicts?
> > CCF supports requesting and locking the clock rate. And again,
> > implicit
> > reparenting should be the norm. The clock driver's purpose is to
> > fulfill
> > any and all clock rate requirements from its consumers. The consumer
> > should
> > only need to ask for the clock rate, not a specific parent, unless
> > there
> > are details that are not yet covered by the CCF.
> >
>
> For MCLK output, we should configure divider to get the target rate,
> and it can only divide the clock from current parent source.
> So we should do reparent to divider's parent in case the parent rate is
> not a multiple of target rate.

Right. That is expected. What I'm saying is that the CCF provides the
framework for automatically reparenting based on the requested clock
rate. This is done in the clock driver's .determine_rate op.

When properly implemented, and also restricting or locking the clock rates
of the PLLs, then you can simply request a clock rate on the leaf clock,
in this case one of the MCLKs, and the CCF and clock driver would handle
everything else. The consumer should not be reparenting clocks manually
unless for a very good reason which cannot be satisfied by the CCF.

> > A related question: the chip has five APLLs. How many MCLK
> > combinations
> > does the application need to support? I assume this includes the
> > standard
> > 24.576 MHz and 22.5792 MHz clock rates.
> >
>
> APLL1 and APLL2 are used in most AFE modules, so their rate should be
> fixed.
> APLL1 is fixed to 196608000Hz.
> APLL2 is fixed to 180633600Hz.
> APLL is inputed to the divider(8bit), and MCLK is the output of
> divider.
> Other APLLs are reserved for some special usage which can't be
> supported by APLL1 & APLL2.
> But APLL3~APLL5 aren't used in the series, so I will remove them in v3.
>
> > > Some of them are not used in this series, because some modules are
> > > still developing. Should I only keep the clocks that have been used
> > > in
> > > the series?
> >
> > Yes please. Only add the ones that are used. Things that aren't used
> > don't get tested and verified, and end up as dead code. If there are
> > plans to extend them in the future, and you can leave comments
> > stating
> > that intent, and also mention it in the cover letter.
> >
> OK, I will remove the unused clock in v3.
>
> > > > > +       /* xtal */
> > > > > +       [MT8195_CLK_XTAL_26M] = "clk26m",
> > > > > +       /* pll */
> > > > > +       [MT8195_CLK_APMIXED_APLL1] = "apll1",
> > > > > +       [MT8195_CLK_APMIXED_APLL2] = "apll2",
> > > > > +       [MT8195_CLK_APMIXED_APLL3] = "apll3",
> > > > > +       [MT8195_CLK_APMIXED_APLL4] = "apll4",
> > > > > +       [MT8195_CLK_APMIXED_APLL5] = "apll5",
> > > > > +       [MT8195_CLK_APMIXED_HDMIRX_APLL] = "hdmirx_apll",
> > > > > +       /* divider */
> > > > > +       [MT8195_CLK_TOP_APLL1] = "apll1_ck",
> > > > > +       [MT8195_CLK_TOP_APLL1_D4] = "apll1_d4",
> > > > > +       [MT8195_CLK_TOP_APLL2] = "apll2_ck",
> > > > > +       [MT8195_CLK_TOP_APLL2_D4] = "apll2_d4",
> > > > > +       [MT8195_CLK_TOP_APLL3] = "apll3_ck",
> > > > > +       [MT8195_CLK_TOP_APLL3_D4] = "apll3_d4",
> > > > > +       [MT8195_CLK_TOP_APLL4] = "apll4_ck",
> > > > > +       [MT8195_CLK_TOP_APLL4_D4] = "apll4_d4",
> > > > > +       [MT8195_CLK_TOP_APLL5] = "apll5_ck",
> > > > > +       [MT8195_CLK_TOP_APLL5_D4] = "apll5_d4",
> > > > > +       [MT8195_CLK_TOP_APLL12_DIV0] = "apll12_div0",
> > > > > +       [MT8195_CLK_TOP_APLL12_DIV1] = "apll12_div1",
> > > > > +       [MT8195_CLK_TOP_APLL12_DIV2] = "apll12_div2",
> > > > > +       [MT8195_CLK_TOP_APLL12_DIV3] = "apll12_div3",
> > > > > +       [MT8195_CLK_TOP_APLL12_DIV4] = "apll12_div4",
> > > > > +       [MT8195_CLK_TOP_APLL12_DIV9] = "apll12_div9",
> > > > > +       [MT8195_CLK_TOP_HDMIRX_APLL] = "hdmirx_apll_ck",
> > > > > +       [MT8195_CLK_TOP_MAINPLL_D4_D4] = "mainpll_d4_d4",
> > > > > +       [MT8195_CLK_TOP_MAINPLL_D5_D2] = "mainpll_d5_d2",
> > > > > +       [MT8195_CLK_TOP_MAINPLL_D7_D2] = "mainpll_d7_d2",
> > > > > +       [MT8195_CLK_TOP_UNIVPLL_D4] = "univpll_d4",
> > > > > +       /* mux */
> > > > > +       [MT8195_CLK_TOP_APLL1_SEL] = "apll1_sel",
> > > > > +       [MT8195_CLK_TOP_APLL2_SEL] = "apll2_sel",
> > > > > +       [MT8195_CLK_TOP_APLL3_SEL] = "apll3_sel",
> > > > > +       [MT8195_CLK_TOP_APLL4_SEL] = "apll4_sel",
> > > > > +       [MT8195_CLK_TOP_APLL5_SEL] = "apll5_sel",
> > > > > +       [MT8195_CLK_TOP_A1SYS_HP_SEL] = "a1sys_hp_sel",
> > > > > +       [MT8195_CLK_TOP_A2SYS_SEL] = "a2sys_sel",
> > > > > +       [MT8195_CLK_TOP_A3SYS_SEL] = "a3sys_sel",
> > > > > +       [MT8195_CLK_TOP_A4SYS_SEL] = "a4sys_sel",
> > > > > +       [MT8195_CLK_TOP_ASM_H_SEL] = "asm_h_sel",
> > > > > +       [MT8195_CLK_TOP_ASM_M_SEL] = "asm_m_sel",
> > > > > +       [MT8195_CLK_TOP_ASM_L_SEL] = "asm_l_sel",
> > > > > +       [MT8195_CLK_TOP_AUD_IEC_SEL] = "aud_iec_sel",
> > > > > +       [MT8195_CLK_TOP_AUD_INTBUS_SEL] = "aud_intbus_sel",
> > > > > +       [MT8195_CLK_TOP_AUDIO_H_SEL] = "audio_h_sel",
> > > > > +       [MT8195_CLK_TOP_AUDIO_LOCAL_BUS_SEL] =
> > > > > "audio_local_bus_sel",
> > > > > +       [MT8195_CLK_TOP_DPTX_M_SEL] = "dptx_m_sel",
> > > > > +       [MT8195_CLK_TOP_INTDIR_SEL] = "intdir_sel",
> > > > > +       [MT8195_CLK_TOP_I2SO1_M_SEL] = "i2so1_m_sel",
> > > > > +       [MT8195_CLK_TOP_I2SO2_M_SEL] = "i2so2_m_sel",
> > > > > +       [MT8195_CLK_TOP_I2SI1_M_SEL] = "i2si1_m_sel",
> > > > > +       [MT8195_CLK_TOP_I2SI2_M_SEL] = "i2si2_m_sel",
> > > > > +       /* clock gate */
> > > > > +       [MT8195_CLK_TOP_MPHONE_SLAVE_B] = "mphone_slave_b",
> > > > > +       [MT8195_CLK_TOP_CFG_26M_AUD] = "cfg_26m_aud",
> > > > > +       [MT8195_CLK_INFRA_AO_AUDIO] = "infra_ao_audio",
> > > > > +       [MT8195_CLK_INFRA_AO_AUDIO_26M_B] =
> > > > > "infra_ao_audio_26m_b",
> > > > > +       [MT8195_CLK_SCP_ADSP_AUDIODSP] = "scp_adsp_audiodsp",
> > > >
> > > >
> > > > > +       [MT8195_CLK_AUD_AFE] = "aud_afe",
> > > > > +       [MT8195_CLK_AUD_LRCK_CNT] = "aud_lrck_cnt",
> > > > > +       [MT8195_CLK_AUD_SPDIFIN_TUNER_APLL] =
> > > > > "aud_spdifin_tuner_apll",
> > > > > +       [MT8195_CLK_AUD_SPDIFIN_TUNER_DBG] =
> > > > > "aud_spdifin_tuner_dbg",
> > > > > +       [MT8195_CLK_AUD_UL_TML] = "aud_ul_tml",
> > > > > +       [MT8195_CLK_AUD_APLL1_TUNER] = "aud_apll1_tuner",
> > > > > +       [MT8195_CLK_AUD_APLL2_TUNER] = "aud_apll2_tuner",
> > > > > +       [MT8195_CLK_AUD_TOP0_SPDF] = "aud_top0_spdf",
> > > > > +       [MT8195_CLK_AUD_APLL] = "aud_apll",
> > > > > +       [MT8195_CLK_AUD_APLL2] = "aud_apll2",
> > > > > +       [MT8195_CLK_AUD_DAC] = "aud_dac",
> > > > > +       [MT8195_CLK_AUD_DAC_PREDIS] = "aud_dac_predis",
> > > > > +       [MT8195_CLK_AUD_TML] = "aud_tml",
> > > > > +       [MT8195_CLK_AUD_ADC] = "aud_adc",
> > > > > +       [MT8195_CLK_AUD_DAC_HIRES] = "aud_dac_hires",
> > > > > +       [MT8195_CLK_AUD_A1SYS_HP] = "aud_a1sys_hp",
> > > > > +       [MT8195_CLK_AUD_AFE_DMIC1] = "aud_afe_dmic1",
> > > > > +       [MT8195_CLK_AUD_AFE_DMIC2] = "aud_afe_dmic2",
> > > > > +       [MT8195_CLK_AUD_AFE_DMIC3] = "aud_afe_dmic3",
> > > > > +       [MT8195_CLK_AUD_AFE_DMIC4] = "aud_afe_dmic4",
> > > > > +       [MT8195_CLK_AUD_AFE_26M_DMIC_TM] =
> > > > > "aud_afe_26m_dmic_tm",
> > > > > +       [MT8195_CLK_AUD_UL_TML_HIRES] = "aud_ul_tml_hires",
> > > > > +       [MT8195_CLK_AUD_ADC_HIRES] = "aud_adc_hires",
> > > > > +       [MT8195_CLK_AUD_ADDA6_ADC] = "aud_adda6_adc",
> > > > > +       [MT8195_CLK_AUD_ADDA6_ADC_HIRES] =
> > > > > "aud_adda6_adc_hires",
> > > > > +       [MT8195_CLK_AUD_LINEIN_TUNER] = "aud_linein_tuner",
> > > > > +       [MT8195_CLK_AUD_EARC_TUNER] = "aud_earc_tuner",
> > > > > +       [MT8195_CLK_AUD_I2SIN] = "aud_i2sin",
> > > > > +       [MT8195_CLK_AUD_TDM_IN] = "aud_tdm_in",
> > > > > +       [MT8195_CLK_AUD_I2S_OUT] = "aud_i2s_out",
> > > > > +       [MT8195_CLK_AUD_TDM_OUT] = "aud_tdm_out",
> > > > > +       [MT8195_CLK_AUD_HDMI_OUT] = "aud_hdmi_out",
> > > > > +       [MT8195_CLK_AUD_ASRC11] = "aud_asrc11",
> > > > > +       [MT8195_CLK_AUD_ASRC12] = "aud_asrc12",
> > > > > +       [MT8195_CLK_AUD_MULTI_IN] = "aud_multi_in",
> > > > > +       [MT8195_CLK_AUD_INTDIR] = "aud_intdir",
> > > > > +       [MT8195_CLK_AUD_A1SYS] = "aud_a1sys",
> > > > > +       [MT8195_CLK_AUD_A2SYS] = "aud_a2sys",
> > > > > +       [MT8195_CLK_AUD_PCMIF] = "aud_pcmif",
> > > > > +       [MT8195_CLK_AUD_A3SYS] = "aud_a3sys",
> > > > > +       [MT8195_CLK_AUD_A4SYS] = "aud_a4sys",
> > > > > +       [MT8195_CLK_AUD_MEMIF_UL1] = "aud_memif_ul1",
> > > > > +       [MT8195_CLK_AUD_MEMIF_UL2] = "aud_memif_ul2",
> > > > > +       [MT8195_CLK_AUD_MEMIF_UL3] = "aud_memif_ul3",
> > > > > +       [MT8195_CLK_AUD_MEMIF_UL4] = "aud_memif_ul4",
> > > > > +       [MT8195_CLK_AUD_MEMIF_UL5] = "aud_memif_ul5",
> > > > > +       [MT8195_CLK_AUD_MEMIF_UL6] = "aud_memif_ul6",
> > > > > +       [MT8195_CLK_AUD_MEMIF_UL8] = "aud_memif_ul8",
> > > > > +       [MT8195_CLK_AUD_MEMIF_UL9] = "aud_memif_ul9",
> > > > > +       [MT8195_CLK_AUD_MEMIF_UL10] = "aud_memif_ul10",
> > > > > +       [MT8195_CLK_AUD_MEMIF_DL2] = "aud_memif_dl2",
> > > > > +       [MT8195_CLK_AUD_MEMIF_DL3] = "aud_memif_dl3",
> > > > > +       [MT8195_CLK_AUD_MEMIF_DL6] = "aud_memif_dl6",
> > > > > +       [MT8195_CLK_AUD_MEMIF_DL7] = "aud_memif_dl7",
> > > > > +       [MT8195_CLK_AUD_MEMIF_DL8] = "aud_memif_dl8",
> > > > > +       [MT8195_CLK_AUD_MEMIF_DL10] = "aud_memif_dl10",
> > > > > +       [MT8195_CLK_AUD_MEMIF_DL11] = "aud_memif_dl11",
> > > > > +       [MT8195_CLK_AUD_GASRC0] = "aud_gasrc0",
> > > > > +       [MT8195_CLK_AUD_GASRC1] = "aud_gasrc1",
> > > > > +       [MT8195_CLK_AUD_GASRC2] = "aud_gasrc2",
> > > > > +       [MT8195_CLK_AUD_GASRC3] = "aud_gasrc3",
> > > > > +       [MT8195_CLK_AUD_GASRC4] = "aud_gasrc4",
> > > > > +       [MT8195_CLK_AUD_GASRC5] = "aud_gasrc5",
> > > > > +       [MT8195_CLK_AUD_GASRC6] = "aud_gasrc6",
> > > > > +       [MT8195_CLK_AUD_GASRC7] = "aud_gasrc7",
> > > > > +       [MT8195_CLK_AUD_GASRC8] = "aud_gasrc8",
> > > > > +       [MT8195_CLK_AUD_GASRC9] = "aud_gasrc9",
> > > > > +       [MT8195_CLK_AUD_GASRC10] = "aud_gasrc10",
> > > > > +       [MT8195_CLK_AUD_GASRC11] = "aud_gasrc11",
> > > > > +       [MT8195_CLK_AUD_GASRC12] = "aud_gasrc12",
> > > > > +       [MT8195_CLK_AUD_GASRC13] = "aud_gasrc13",
> > > > > +       [MT8195_CLK_AUD_GASRC14] = "aud_gasrc14",
> > > > > +       [MT8195_CLK_AUD_GASRC15] = "aud_gasrc15",
> > > > > +       [MT8195_CLK_AUD_GASRC16] = "aud_gasrc16",
> > > > > +       [MT8195_CLK_AUD_GASRC17] = "aud_gasrc17",
> > > > > +       [MT8195_CLK_AUD_GASRC18] = "aud_gasrc18",
> > > > > +       [MT8195_CLK_AUD_GASRC19] = "aud_gasrc19",
> > > >
> > > > The MT8195_CLK_AUD_* clocks are all internal to the audio
> > > > subsystem:
> > > > the bits that control these clock gates are in the same address
> > > > space
> > > > as the audio parts. Would it be possible to model them as
> > > > internal
> > > > ASoC SUPPLY widgets? The external ones could be modeled using
> > > > ASoC
> > > > CLK_SUPPLY widgets, and the dependencies could be modeled with
> > > > ASoC
> > > > routes. The ASoC core could then handle power sequencing, which
> > > > the
> > > > driver currently does manually.
> > > >
> > > > IMO this is better than having two drivers handling two aspects
> > > > of
> > > > the same piece of hardware, while the two aspects are
> > > > intertwined.
> > > >
> > >
> > > Yes, it's ok to use the CLK_SUPPLY and SUPPLY to model such clocks.
> > > But those clocks are managed by CCF in the preceding SOCs like
> > > mt2701,
> > > mt6779 and mt8183. Additionally, in some audio modules, clocks
> > > should
> >
> > This being a new driver, we have some more freedom to improve the
> > design.
> >
> > > be enabled before configuring parameters(hw_params). As far as I
> > > know,
> > > if we use CLK_SUPPLY or SUPPLY to model clocks, the power sequence
> > > is
> > > controlled by DAPM. It seems to be impossible to fulfill all use
> > > cases.
> > > That's why we just keep the manual control sequence and CCF seems
> > > to be
> > > the best choice to model such clock gatess.
> >
> > I see. So yes, using CCF does give you reference counting, dependency
> > tracking and other advantages. And using DAPM supplies means you
> > can't
> > enable the clock gates outside of DAPM without both pieces of code
> > fighting for control.
> >
> > Can we at least move the audio clock gates into the audio driver
> > though?
> > The arbitrary separation into two devices and drivers is fishy. And
> > with
> > the move the external references to the audio clock gates can be
> > removed.
> >
> Because DAPM SUPPLY can't fit our control scenario.
> Did you suggest us implement the simple logic control(including ref
> count, clock dependency) for clock gate(MT8195_CLK_AUD_*) in afe driver
> instead of using CCF?

I meant simply moving the CCF-based clk driver code (clk-mt8516-aud.c)
from `drivers/clk` and incorporating it into the audio driver, likely
in `mt8195-afe-clk.c` or maybe as a separate file. So the audio driver
would be a clock provider, and a clock consumer. It will directly use
the clocks it provides, internally, and you could remove all those
clock references from the device tree.

The goal is to have one hardware representation (device node) only, so
that it matches the hardware, which is one single unified block.

After the driver is completed, we can look for opportunities to improve
it, if resources are available.

> > And regarding the clock requirements for different modules, could we
> > have
> > that information put in comments somewhere, so if someone were to
> > revisit
> > it later, they would have the information needed to understand and
> > possibly
> > improve it? Because right now there's just a bunch of clocks enabled
> > and
> > disabled and nothing to explain why that's needed.
> >
>
> For example,
> MT8195_CLK_AUD_ADC(clock gate) is one of the clock feeding to ADDA
> module.
> Did you want me show the clock gate list feeding to ADDA?
> On the other hand, I didn't know how to show the information properly
> in comments. Could you kindly share me an example for reference?


For example, in `mt8195_afe_enable_reg_rw_clk()` in mt8195-afe-clk.c:

        unsigned int clk_array[] = {
                MT8195_CLK_SCP_ADSP_AUDIODSP,
                MT8195_CLK_TOP_AUDIO_LOCAL_BUS_SEL,
                MT8195_CLK_TOP_CFG_26M_AUD,
                MT8195_CLK_INFRA_AO_AUDIO,
                MT8195_CLK_INFRA_AO_AUDIO_26M_B,
                MT8195_CLK_TOP_AUD_INTBUS_SEL,
                MT8195_CLK_TOP_A1SYS_HP_SEL,
                MT8195_CLK_AUD_A1SYS_HP,
                MT8195_CLK_AUD_A1SYS,
                MT8195_CLK_TOP_AUDIO_H_SEL,
        };

You could add a comment after each line stating why that clock needs to
be enabled. A simple note like "bus access clock" or "internal logic clock"
would suffice.

The above list also has some redundancies that could be eliminated.
MT8195_CLK_TOP_A1SYS_HP_SEL is parent to both MT8195_CLK_AUD_A1SYS_HP and
MT8195_CLK_AUD_A1SYS. When clocks are enabled, their parents are also
enabled by CCF, so there's no need to enable them explicitly, unless
that clock also directly feeds the clock consumer.


Another thing I wanted to bring up: is any of the code after

    struct mt8195_afe_tuner_cfg {

used? It looks like it is used to configure the five extra PLLs in the audio
subsystem, but the exposed (non-static) functions don't seem to be called
anywhere. Are they for modules not yet supported?


Regards
ChenYu
