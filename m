Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE3A3C6A31
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 08:02:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 042BA16CA;
	Tue, 13 Jul 2021 08:01:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 042BA16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626156157;
	bh=ryQ0+zPJd9ySo1DLMjcOmr42PKyRZ4S8kXwDtSI/Sws=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o7GHn0ZdPZDW/ngk8w/3FgH+DBGhz6/OCkETWO0IFUfgmAJOQ9KNPxpcYfyuwqv0g
	 p9LXOW/IcPP1VBWCypL/Suz9W3ijHvFpoPSKpBn6VeJhA7sLOlGxV8jD6fz6JXnl43
	 vk2PbRyEOPVD5rDHT6P0Oi608+GSnj3AJ/q4sWSA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 728BEF800D3;
	Tue, 13 Jul 2021 08:01:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A4B4F80217; Tue, 13 Jul 2021 08:01:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAD56F800D3
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 08:00:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAD56F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="BSWmSeOZ"
Received: by mail-lf1-x136.google.com with SMTP id v6so11000087lfp.6
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 23:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XbowwkOlZPKIy7qUiLaKQbEvAieUs1LDYV6dRNfuVz4=;
 b=BSWmSeOZ3lnt8pJujadH/Ojkujcv8fw9Dj3dIpyYkHtBPs/QST1XX5YScDTHrF4Xpi
 GRrr+/ZkjOBXBMwP9mvnk34vqRKbuz7Ak6dYeVoNDpWB/KMVdFywyTiHW/FmDNW9xVXO
 w9YyTCPNh7Xyh3C+L3Tqrr0Wg0DOqmA4Ivof8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XbowwkOlZPKIy7qUiLaKQbEvAieUs1LDYV6dRNfuVz4=;
 b=oSDdlb1Aj6OGpHKbA12LYWdSDm+/qAMPJoGTH3tp4knwHLO2OhYuIvpMNuYAMYj3Qj
 T22032l/k09nUoItOfOsnHvgaP0AAkOgWnDra4Ehb7C4JtIm+L2avxKaoVo3jvenbTc7
 3VE17K9tPK1z2rYWAfsAxMFCiDZQ8AxLfFsliDUIdBQMy6iADhNKCZEGkqnxy4P+GC96
 Crq5elawV5BnO8TcU/BuCTYKs/ChchLT548IYnOf3mvmIFeZfBBd7TriRS94iOqXEHS7
 DrU7efonTirijEeduvqeO+uJIkSCOWhpNa90GDrlEbmtrfpVfDWLlEJrhQNr3+jMeAoy
 8pCw==
X-Gm-Message-State: AOAM533CD8GwHtlQjaR152R4XFLjrm2Mbm9/89l5uehe17m1UdroOZYr
 QERx2eKeuOUEjetP2E7TgVRJ7e8IOs8XjHOdt4p3Lw==
X-Google-Smtp-Source: ABdhPJyEbsm9yu7kBxFGXa7udpZe3VxL0CtE8K9MtfQAYBHNC/IQlebb03SMaS3S7EUuOdNIK3Ek0OvFHVzspO7EI2I=
X-Received: by 2002:a05:6512:1303:: with SMTP id
 x3mr2090443lfu.276.1626156055395; 
 Mon, 12 Jul 2021 23:00:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210629014736.31153-1-trevor.wu@mediatek.com>
 <20210629014736.31153-6-trevor.wu@mediatek.com>
 <CAGXv+5FzOs+=9PbYAEahVXvdJG1FnRkSUo_r3AVYZzNKGqg0oA@mail.gmail.com>
 <9929a3a20df1a89fc94baf7c75c0c65d9a61de0f.camel@mediatek.com>
In-Reply-To: <9929a3a20df1a89fc94baf7c75c0c65d9a61de0f.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 13 Jul 2021 14:00:44 +0800
Message-ID: <CAGXv+5HFjM_N_MM5ZddGLcuYVsOXAJwfNuKvB5Cfo0k=nO456g@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] ASoC: mediatek: mt8195: add platform driver
To: Trevor Wu <trevor.wu@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>, bicycle.tsai@mediatek.com,
 tiwai@suse.com, Rob Herring <robh+dt@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Li-Yu Yu <aaronyu@google.com>,
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

On Mon, Jul 12, 2021 at 11:10 PM Trevor Wu <trevor.wu@mediatek.com> wrote:
>
> On Mon, 2021-07-12 at 14:57 +0800, Chen-Yu Tsai wrote:
> >  are all internal Hi,
> >
> > On Tue, Jun 29, 2021 at 9:49 AM Trevor Wu <trevor.wu@mediatek.com>
> > wrote:
> > >
> > > This patch adds mt8195 platform and affiliated driver.
> > >
> > > Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> > > ---
> > >  sound/soc/mediatek/Kconfig                     |    9 +
> > >  sound/soc/mediatek/Makefile                   |    1 +
> > >  sound/soc/mediatek/mt8195/Makefile            |   11 +
> > >  sound/soc/mediatek/mt8195/mt8195-afe-clk.c    |  899 +++++
> > >  sound/soc/mediatek/mt8195/mt8195-afe-clk.h    |  201 +
> > >  sound/soc/mediatek/mt8195/mt8195-afe-common.h |  200 +
> > >  sound/soc/mediatek/mt8195/mt8195-afe-pcm.c    | 3264
> > > +++++++++++++++++
> > >  sound/soc/mediatek/mt8195/mt8195-reg.h        | 2793
> > > ++++++++++++++
> > >  8 files changed, 7378 insertions(+)
> > >  create mode 100644 sound/soc/mediatek/mt8195/Makefile
> > >  create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> > >  create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-clk.h
> > >  create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-common.h
> > >  create mode 100644 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> > >  create mode 100644 sound/soc/mediatek/mt8195/mt8195-reg.h
> > >
> > > diff --git a/sound/soc/mediatek/Kconfig
> > > b/sound/soc/mediatek/Kconfig
> > > index 74dae4332d17..3389f382be06 100644
> > > --- a/sound/soc/mediatek/Kconfig
> > > +++ b/sound/soc/mediatek/Kconfig
> > > @@ -184,3 +184,12 @@ config SND_SOC_MT8192_MT6359_RT1015_RT5682
> > >           with the MT6359 RT1015 RT5682 audio codec.
> > >           Select Y if you have such device.
> > >           If unsure select "N".
> > > +
> > > +config SND_SOC_MT8195
> > > +       tristate "ASoC support for Mediatek MT8195 chip"
> > > +       select SND_SOC_MEDIATEK
> > > +       help
> > > +         This adds ASoC platform driver support for Mediatek
> > > MT8195 chip
> > > +         that can be used with other codecs.
> > > +         Select Y if you have such device.
> > > +         If unsure select "N".
> > > diff --git a/sound/soc/mediatek/Makefile
> > > b/sound/soc/mediatek/Makefile
> > > index f6cb6b8508e3..34778ca12106 100644
> > > --- a/sound/soc/mediatek/Makefile
> > > +++ b/sound/soc/mediatek/Makefile
> > > @@ -5,3 +5,4 @@ obj-$(CONFIG_SND_SOC_MT6797) += mt6797/
> > >  obj-$(CONFIG_SND_SOC_MT8173) += mt8173/
> > >  obj-$(CONFIG_SND_SOC_MT8183) += mt8183/
> > >  obj-$(CONFIG_SND_SOC_MT8192) += mt8192/
> > > +obj-$(CONFIG_SND_SOC_MT8195) += mt8195/
> > > diff --git a/sound/soc/mediatek/mt8195/Makefile
> > > b/sound/soc/mediatek/mt8195/Makefile
> > > new file mode 100644
> > > index 000000000000..b2c9fd88f39e
> > > --- /dev/null
> > > +++ b/sound/soc/mediatek/mt8195/Makefile
> > > @@ -0,0 +1,11 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +
> > > +# platform driver
> > > +snd-soc-mt8195-afe-objs := \
> > > +       mt8195-afe-clk.o \
> > > +       mt8195-afe-pcm.o \
> > > +       mt8195-dai-adda.o \
> > > +       mt8195-dai-etdm.o \
> > > +       mt8195-dai-pcm.o
> > > +
> > > +obj-$(CONFIG_SND_SOC_MT8195) += snd-soc-mt8195-afe.o
> > > diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> > > b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> > > new file mode 100644
> > > index 000000000000..57aa799b4f41
> > > --- /dev/null
> > > +++ b/sound/soc/mediatek/mt8195/mt8195-afe-clk.c
> > > @@ -0,0 +1,899 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * mt8195-afe-clk.c  --  Mediatek 8195 afe clock ctrl
> > > + *
> > > + * Copyright (c) 2021 MediaTek Inc.
> > > + * Author: Bicycle Tsai <bicycle.tsai@mediatek.com>
> > > + *         Trevor Wu <trevor.wu@mediatek.com>
> > > + */
> > > +
> > > +#include <linux/clk.h>
> > > +
> > > +#include "mt8195-afe-common.h"
> > > +#include "mt8195-afe-clk.h"
> > > +#include "mt8195-reg.h"
> > > +
> > > +static const char *aud_clks[MT8195_CLK_NUM] = {
> >
> > Most of these clocks are not described in the device tree binding. If
> > the driver needs to reference them, they should be described. We
> > should
> > not be hard-coding clock names across different drivers.
> >
> Sorry, I didn't know I have to list all clocks in the dt-binding.
> Originally, I thought these clocks will be described in the clock
> binding, so I didn't add them to the binding of afe driver.
> I will add these clocks to mt8195-afe-pcm.yaml.

If the device consumes clocks, then the clocks that get consumed should
be listed in the device's bindings. This is not related to the clock
bindings, which is a clock provider.

> > The more important question is, why does the driver need to reference
> > all of them? Maybe we should take a step back and draw out a clock
> > tree
> > diagram for the hardware?
> >
> The clock structure is PLL -> MUX -> GATE.
> xtal, pll and divider are the possible clock inputs for MUX.
> Because we select the clock input of audio module based on the use
> case, we use clk_get to retrive all clocks which are possible to be
> used.

So I see a couple the driver is doing reparenting:

  a. Reparent audio_h to standard oscillator when ADDA is not used,
     presumably to let the APLL be turned off

Why not just turn off audio_h? It looks like audio_h feeds a couple clock
gates in the audio subsystem. Just a guess, but is this the AHB bus clock?
Why not just have it parented to "univpll_d7" all the time then?

Also, reparenting really should be done implicitly with clk_set_rate()
with the clock driver supporting reparenting on rate changes.

  b. Assignment of PLLs for I2S/PCM MCLK outputs

Is there a reason for explicit assignment, other than clock rate conflicts?
CCF supports requesting and locking the clock rate. And again, implicit
reparenting should be the norm. The clock driver's purpose is to fulfill
any and all clock rate requirements from its consumers. The consumer should
only need to ask for the clock rate, not a specific parent, unless there
are details that are not yet covered by the CCF.

A related question: the chip has five APLLs. How many MCLK combinations
does the application need to support? I assume this includes the standard
24.576 MHz and 22.5792 MHz clock rates.

> Some of them are not used in this series, because some modules are
> still developing. Should I only keep the clocks that have been used in
> the series?

Yes please. Only add the ones that are used. Things that aren't used
don't get tested and verified, and end up as dead code. If there are
plans to extend them in the future, and you can leave comments stating
that intent, and also mention it in the cover letter.

> > > +       /* xtal */
> > > +       [MT8195_CLK_XTAL_26M] = "clk26m",
> > > +       /* pll */
> > > +       [MT8195_CLK_APMIXED_APLL1] = "apll1",
> > > +       [MT8195_CLK_APMIXED_APLL2] = "apll2",
> > > +       [MT8195_CLK_APMIXED_APLL3] = "apll3",
> > > +       [MT8195_CLK_APMIXED_APLL4] = "apll4",
> > > +       [MT8195_CLK_APMIXED_APLL5] = "apll5",
> > > +       [MT8195_CLK_APMIXED_HDMIRX_APLL] = "hdmirx_apll",
> > > +       /* divider */
> > > +       [MT8195_CLK_TOP_APLL1] = "apll1_ck",
> > > +       [MT8195_CLK_TOP_APLL1_D4] = "apll1_d4",
> > > +       [MT8195_CLK_TOP_APLL2] = "apll2_ck",
> > > +       [MT8195_CLK_TOP_APLL2_D4] = "apll2_d4",
> > > +       [MT8195_CLK_TOP_APLL3] = "apll3_ck",
> > > +       [MT8195_CLK_TOP_APLL3_D4] = "apll3_d4",
> > > +       [MT8195_CLK_TOP_APLL4] = "apll4_ck",
> > > +       [MT8195_CLK_TOP_APLL4_D4] = "apll4_d4",
> > > +       [MT8195_CLK_TOP_APLL5] = "apll5_ck",
> > > +       [MT8195_CLK_TOP_APLL5_D4] = "apll5_d4",
> > > +       [MT8195_CLK_TOP_APLL12_DIV0] = "apll12_div0",
> > > +       [MT8195_CLK_TOP_APLL12_DIV1] = "apll12_div1",
> > > +       [MT8195_CLK_TOP_APLL12_DIV2] = "apll12_div2",
> > > +       [MT8195_CLK_TOP_APLL12_DIV3] = "apll12_div3",
> > > +       [MT8195_CLK_TOP_APLL12_DIV4] = "apll12_div4",
> > > +       [MT8195_CLK_TOP_APLL12_DIV9] = "apll12_div9",
> > > +       [MT8195_CLK_TOP_HDMIRX_APLL] = "hdmirx_apll_ck",
> > > +       [MT8195_CLK_TOP_MAINPLL_D4_D4] = "mainpll_d4_d4",
> > > +       [MT8195_CLK_TOP_MAINPLL_D5_D2] = "mainpll_d5_d2",
> > > +       [MT8195_CLK_TOP_MAINPLL_D7_D2] = "mainpll_d7_d2",
> > > +       [MT8195_CLK_TOP_UNIVPLL_D4] = "univpll_d4",
> > > +       /* mux */
> > > +       [MT8195_CLK_TOP_APLL1_SEL] = "apll1_sel",
> > > +       [MT8195_CLK_TOP_APLL2_SEL] = "apll2_sel",
> > > +       [MT8195_CLK_TOP_APLL3_SEL] = "apll3_sel",
> > > +       [MT8195_CLK_TOP_APLL4_SEL] = "apll4_sel",
> > > +       [MT8195_CLK_TOP_APLL5_SEL] = "apll5_sel",
> > > +       [MT8195_CLK_TOP_A1SYS_HP_SEL] = "a1sys_hp_sel",
> > > +       [MT8195_CLK_TOP_A2SYS_SEL] = "a2sys_sel",
> > > +       [MT8195_CLK_TOP_A3SYS_SEL] = "a3sys_sel",
> > > +       [MT8195_CLK_TOP_A4SYS_SEL] = "a4sys_sel",
> > > +       [MT8195_CLK_TOP_ASM_H_SEL] = "asm_h_sel",
> > > +       [MT8195_CLK_TOP_ASM_M_SEL] = "asm_m_sel",
> > > +       [MT8195_CLK_TOP_ASM_L_SEL] = "asm_l_sel",
> > > +       [MT8195_CLK_TOP_AUD_IEC_SEL] = "aud_iec_sel",
> > > +       [MT8195_CLK_TOP_AUD_INTBUS_SEL] = "aud_intbus_sel",
> > > +       [MT8195_CLK_TOP_AUDIO_H_SEL] = "audio_h_sel",
> > > +       [MT8195_CLK_TOP_AUDIO_LOCAL_BUS_SEL] =
> > > "audio_local_bus_sel",
> > > +       [MT8195_CLK_TOP_DPTX_M_SEL] = "dptx_m_sel",
> > > +       [MT8195_CLK_TOP_INTDIR_SEL] = "intdir_sel",
> > > +       [MT8195_CLK_TOP_I2SO1_M_SEL] = "i2so1_m_sel",
> > > +       [MT8195_CLK_TOP_I2SO2_M_SEL] = "i2so2_m_sel",
> > > +       [MT8195_CLK_TOP_I2SI1_M_SEL] = "i2si1_m_sel",
> > > +       [MT8195_CLK_TOP_I2SI2_M_SEL] = "i2si2_m_sel",
> > > +       /* clock gate */
> > > +       [MT8195_CLK_TOP_MPHONE_SLAVE_B] = "mphone_slave_b",
> > > +       [MT8195_CLK_TOP_CFG_26M_AUD] = "cfg_26m_aud",
> > > +       [MT8195_CLK_INFRA_AO_AUDIO] = "infra_ao_audio",
> > > +       [MT8195_CLK_INFRA_AO_AUDIO_26M_B] = "infra_ao_audio_26m_b",
> > > +       [MT8195_CLK_SCP_ADSP_AUDIODSP] = "scp_adsp_audiodsp",
> >
> >
> > > +       [MT8195_CLK_AUD_AFE] = "aud_afe",
> > > +       [MT8195_CLK_AUD_LRCK_CNT] = "aud_lrck_cnt",
> > > +       [MT8195_CLK_AUD_SPDIFIN_TUNER_APLL] =
> > > "aud_spdifin_tuner_apll",
> > > +       [MT8195_CLK_AUD_SPDIFIN_TUNER_DBG] =
> > > "aud_spdifin_tuner_dbg",
> > > +       [MT8195_CLK_AUD_UL_TML] = "aud_ul_tml",
> > > +       [MT8195_CLK_AUD_APLL1_TUNER] = "aud_apll1_tuner",
> > > +       [MT8195_CLK_AUD_APLL2_TUNER] = "aud_apll2_tuner",
> > > +       [MT8195_CLK_AUD_TOP0_SPDF] = "aud_top0_spdf",
> > > +       [MT8195_CLK_AUD_APLL] = "aud_apll",
> > > +       [MT8195_CLK_AUD_APLL2] = "aud_apll2",
> > > +       [MT8195_CLK_AUD_DAC] = "aud_dac",
> > > +       [MT8195_CLK_AUD_DAC_PREDIS] = "aud_dac_predis",
> > > +       [MT8195_CLK_AUD_TML] = "aud_tml",
> > > +       [MT8195_CLK_AUD_ADC] = "aud_adc",
> > > +       [MT8195_CLK_AUD_DAC_HIRES] = "aud_dac_hires",
> > > +       [MT8195_CLK_AUD_A1SYS_HP] = "aud_a1sys_hp",
> > > +       [MT8195_CLK_AUD_AFE_DMIC1] = "aud_afe_dmic1",
> > > +       [MT8195_CLK_AUD_AFE_DMIC2] = "aud_afe_dmic2",
> > > +       [MT8195_CLK_AUD_AFE_DMIC3] = "aud_afe_dmic3",
> > > +       [MT8195_CLK_AUD_AFE_DMIC4] = "aud_afe_dmic4",
> > > +       [MT8195_CLK_AUD_AFE_26M_DMIC_TM] = "aud_afe_26m_dmic_tm",
> > > +       [MT8195_CLK_AUD_UL_TML_HIRES] = "aud_ul_tml_hires",
> > > +       [MT8195_CLK_AUD_ADC_HIRES] = "aud_adc_hires",
> > > +       [MT8195_CLK_AUD_ADDA6_ADC] = "aud_adda6_adc",
> > > +       [MT8195_CLK_AUD_ADDA6_ADC_HIRES] = "aud_adda6_adc_hires",
> > > +       [MT8195_CLK_AUD_LINEIN_TUNER] = "aud_linein_tuner",
> > > +       [MT8195_CLK_AUD_EARC_TUNER] = "aud_earc_tuner",
> > > +       [MT8195_CLK_AUD_I2SIN] = "aud_i2sin",
> > > +       [MT8195_CLK_AUD_TDM_IN] = "aud_tdm_in",
> > > +       [MT8195_CLK_AUD_I2S_OUT] = "aud_i2s_out",
> > > +       [MT8195_CLK_AUD_TDM_OUT] = "aud_tdm_out",
> > > +       [MT8195_CLK_AUD_HDMI_OUT] = "aud_hdmi_out",
> > > +       [MT8195_CLK_AUD_ASRC11] = "aud_asrc11",
> > > +       [MT8195_CLK_AUD_ASRC12] = "aud_asrc12",
> > > +       [MT8195_CLK_AUD_MULTI_IN] = "aud_multi_in",
> > > +       [MT8195_CLK_AUD_INTDIR] = "aud_intdir",
> > > +       [MT8195_CLK_AUD_A1SYS] = "aud_a1sys",
> > > +       [MT8195_CLK_AUD_A2SYS] = "aud_a2sys",
> > > +       [MT8195_CLK_AUD_PCMIF] = "aud_pcmif",
> > > +       [MT8195_CLK_AUD_A3SYS] = "aud_a3sys",
> > > +       [MT8195_CLK_AUD_A4SYS] = "aud_a4sys",
> > > +       [MT8195_CLK_AUD_MEMIF_UL1] = "aud_memif_ul1",
> > > +       [MT8195_CLK_AUD_MEMIF_UL2] = "aud_memif_ul2",
> > > +       [MT8195_CLK_AUD_MEMIF_UL3] = "aud_memif_ul3",
> > > +       [MT8195_CLK_AUD_MEMIF_UL4] = "aud_memif_ul4",
> > > +       [MT8195_CLK_AUD_MEMIF_UL5] = "aud_memif_ul5",
> > > +       [MT8195_CLK_AUD_MEMIF_UL6] = "aud_memif_ul6",
> > > +       [MT8195_CLK_AUD_MEMIF_UL8] = "aud_memif_ul8",
> > > +       [MT8195_CLK_AUD_MEMIF_UL9] = "aud_memif_ul9",
> > > +       [MT8195_CLK_AUD_MEMIF_UL10] = "aud_memif_ul10",
> > > +       [MT8195_CLK_AUD_MEMIF_DL2] = "aud_memif_dl2",
> > > +       [MT8195_CLK_AUD_MEMIF_DL3] = "aud_memif_dl3",
> > > +       [MT8195_CLK_AUD_MEMIF_DL6] = "aud_memif_dl6",
> > > +       [MT8195_CLK_AUD_MEMIF_DL7] = "aud_memif_dl7",
> > > +       [MT8195_CLK_AUD_MEMIF_DL8] = "aud_memif_dl8",
> > > +       [MT8195_CLK_AUD_MEMIF_DL10] = "aud_memif_dl10",
> > > +       [MT8195_CLK_AUD_MEMIF_DL11] = "aud_memif_dl11",
> > > +       [MT8195_CLK_AUD_GASRC0] = "aud_gasrc0",
> > > +       [MT8195_CLK_AUD_GASRC1] = "aud_gasrc1",
> > > +       [MT8195_CLK_AUD_GASRC2] = "aud_gasrc2",
> > > +       [MT8195_CLK_AUD_GASRC3] = "aud_gasrc3",
> > > +       [MT8195_CLK_AUD_GASRC4] = "aud_gasrc4",
> > > +       [MT8195_CLK_AUD_GASRC5] = "aud_gasrc5",
> > > +       [MT8195_CLK_AUD_GASRC6] = "aud_gasrc6",
> > > +       [MT8195_CLK_AUD_GASRC7] = "aud_gasrc7",
> > > +       [MT8195_CLK_AUD_GASRC8] = "aud_gasrc8",
> > > +       [MT8195_CLK_AUD_GASRC9] = "aud_gasrc9",
> > > +       [MT8195_CLK_AUD_GASRC10] = "aud_gasrc10",
> > > +       [MT8195_CLK_AUD_GASRC11] = "aud_gasrc11",
> > > +       [MT8195_CLK_AUD_GASRC12] = "aud_gasrc12",
> > > +       [MT8195_CLK_AUD_GASRC13] = "aud_gasrc13",
> > > +       [MT8195_CLK_AUD_GASRC14] = "aud_gasrc14",
> > > +       [MT8195_CLK_AUD_GASRC15] = "aud_gasrc15",
> > > +       [MT8195_CLK_AUD_GASRC16] = "aud_gasrc16",
> > > +       [MT8195_CLK_AUD_GASRC17] = "aud_gasrc17",
> > > +       [MT8195_CLK_AUD_GASRC18] = "aud_gasrc18",
> > > +       [MT8195_CLK_AUD_GASRC19] = "aud_gasrc19",
> >
> > The MT8195_CLK_AUD_* clocks are all internal to the audio subsystem:
> > the bits that control these clock gates are in the same address space
> > as the audio parts. Would it be possible to model them as internal
> > ASoC SUPPLY widgets? The external ones could be modeled using ASoC
> > CLK_SUPPLY widgets, and the dependencies could be modeled with ASoC
> > routes. The ASoC core could then handle power sequencing, which the
> > driver currently does manually.
> >
> > IMO this is better than having two drivers handling two aspects of
> > the same piece of hardware, while the two aspects are intertwined.
> >
>
> Yes, it's ok to use the CLK_SUPPLY and SUPPLY to model such clocks.
> But those clocks are managed by CCF in the preceding SOCs like mt2701,
> mt6779 and mt8183. Additionally, in some audio modules, clocks should

This being a new driver, we have some more freedom to improve the design.

> be enabled before configuring parameters(hw_params). As far as I know,
> if we use CLK_SUPPLY or SUPPLY to model clocks, the power sequence is
> controlled by DAPM. It seems to be impossible to fulfill all use cases.
> That's why we just keep the manual control sequence and CCF seems to be
> the best choice to model such clock gatess.

I see. So yes, using CCF does give you reference counting, dependency
tracking and other advantages. And using DAPM supplies means you can't
enable the clock gates outside of DAPM without both pieces of code
fighting for control.

Can we at least move the audio clock gates into the audio driver though?
The arbitrary separation into two devices and drivers is fishy. And with
the move the external references to the audio clock gates can be removed.

And regarding the clock requirements for different modules, could we have
that information put in comments somewhere, so if someone were to revisit
it later, they would have the information needed to understand and possibly
improve it? Because right now there's just a bunch of clocks enabled and
disabled and nothing to explain why that's needed.


Regards
ChenYu
