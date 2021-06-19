Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9F03ADB8D
	for <lists+alsa-devel@lfdr.de>; Sat, 19 Jun 2021 21:54:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9908C16F9;
	Sat, 19 Jun 2021 21:53:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9908C16F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624132454;
	bh=GP28Vnq0XwQt+MxCZs+txE3SPTZiW4i6wZhG8NulGos=;
	h=To:References:From:Subject:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m33GBg5i3bgXg1haoGiTyGJSXxDLGdfuwVbjLdJCBerDSd/1aigFV8aTBl9R4m+8b
	 Ja4UXy8bG6M16XdAbKZU4nBG2Gc1s1wPPV5RvUBVsot4GJRE+BoE10VQyeRPzmhyru
	 /PxSe+VOxqh6ld7aoq7lrWGhER6jtqYcvv3lx178=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C496F8019B;
	Sat, 19 Jun 2021 21:52:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA928F8025A; Sat, 19 Jun 2021 21:52:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3CD8F80084
 for <alsa-devel@alsa-project.org>; Sat, 19 Jun 2021 21:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3CD8F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="tpzvjyDM"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="X+pB+7jY"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id B0ED91414;
 Sat, 19 Jun 2021 15:52:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sat, 19 Jun 2021 15:52:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 to:cc:references:from:subject:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=B
 OKXUwoUdshth40cRhUhwAHqs/93mVTPn01/eBhAFeQ=; b=tpzvjyDMveu2ziQtQ
 WH1Gdgtrlja7+4eyP29OVjR0f11yecyvoPma7Q4yTEpGrFup5rXnzCJWjsiBXrJD
 /WyIY1JBBTNJHAJdmCSmyoF1lb+yUWYQxMaStmc38uCty16wiY+JIwAq7Fck/oiy
 Tl96DXTCALJcFy5QrVt5yrfANPAV2gxAdEStToTgXeEb5KQ6yIWf5B9tQZPDaVbh
 tIowa38Y0QFC5rzZEB9p40PO6HmUmRrmP+mj6aB7V9/gtUTl+elFqqrbkVFSNYs2
 6mIGsIl7GtgmYPZSoA1eXFLoucKrkCx7VmasMueXlhgo5N+wl2keJNT9Mxxtnc34
 4912g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=BOKXUwoUdshth40cRhUhwAHqs/93mVTPn01/eBhAF
 eQ=; b=X+pB+7jYt3nqngS3ZtUBtK5vcHqpwSv0sXVbLdhiEyigKGws1kgfg4FU+
 R+04dFAv+S6Sgi/FL83kuWLBhzTh9/0TONKgokrLywCnGrOXTqswBsDgtWFEqAB3
 v4t8AbP/ZatpaVu6g0yAV/OgJIksckqxpIDSSw/JO0IslBnsJFvmjLkaFf+m9S3j
 im9/EXUkLlhXub+rytRBGWs3TOzYMMMnVcmQof6WvCbHrk5lemHNboMs6U/AVzUp
 FdzGYIYv3Utgg94v3lNB5RGj+PTRbIHPvYY7m5IMhyjZmw1i28VvCq9Npg/bYLnE
 P7hGp2L1thmTkZCoP1B4LaFZiXmPQ==
X-ME-Sender: <xms:_ErOYLAK0yZfLcDSbh2218Z1ytkVdJgjU6HDYgX2TpO1F8FO9FCW3g>
 <xme:_ErOYBjJq-X5VFuuhFvXowsKSzbMl4HLkyp-GANFYJNfIqYW5nKORxsxPYKnvPVig
 scHUQV7Wqak226eTA>
X-ME-Received: <xmr:_ErOYGmHUErDg9zIsnK3qWYR4xgz4AGO7eUd1FdwMGg8keQylkhur-db9Y-eFHLd7G7JzOd_i1DIHr2JwmQvI11iAS3XHaKe3y4BsnaWKh1lL6EQPw_c2SELhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefiedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefvfhfhuffkffgfgggjtgfgsehtke
 ertddtfeejnecuhfhrohhmpefurghmuhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhes
 shhhohhllhgrnhgurdhorhhgqeenucggtffrrghtthgvrhhnpedvtddtjeeiuddugfffve
 etkeffgeffgedutdfgfeekudevudekffehtdefveeuvdenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurd
 horhhg
X-ME-Proxy: <xmx:_ErOYNxpoSU4Bk_EKYjMGHalpAK6HptGbAnQoeIdyGHLDVZk6b-BRg>
 <xmx:_ErOYAR_6aVmZ9Oig6PwnG8DglE5Cx1mxpo7kNbv2fW8HRLFT4lOMQ>
 <xmx:_ErOYAZJH31G0-7zrCqw4XrEPG8Cz68wSZM8TXlYGcau_dZv2kT73A>
 <xmx:_krOYHJ6rBig8jmJvDOl82A8D2NuzT5Vk-_BaK1MptemD1d_T4JFm7Ewb_0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 19 Jun 2021 15:52:28 -0400 (EDT)
To: =?UTF-8?B?54+t5rab?= <fengzheng923@gmail.com>
References: <20210615130326.2044-1-fengzheng923@gmail.com>
 <8fa2cd5b-b7b0-f39f-2c97-a8a839642fc2@sholland.org>
 <CAE=m61_aiPWUvDEcjRTG9+FmMzPTxaL7-n2ZM3r3e7fqg2B1TQ@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 1/2] ASoC: sunxi: Add Allwinner H6 Digital MIC driver
Message-ID: <68482244-aec8-db57-3b87-7099cbc219d6@sholland.org>
Date: Sat, 19 Jun 2021 14:52:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAE=m61_aiPWUvDEcjRTG9+FmMzPTxaL7-n2ZM3r3e7fqg2B1TQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, krzk@kernel.org, linux-kernel@vger.kernel.org,
 tiwai@suse.com, mripard@kernel.org, lgirdwood@gmail.com, wens@csie.org,
 broonie@kernel.org, jernej.skrabec@gmail.com, p.zabel@pengutronix.de,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

On 6/16/21 1:21 AM, 班涛 wrote:
> Hi，
> 
> Samuel Holland <samuel@sholland.org> 于2021年6月16日周三 上午11:06写道：
> 
>> Hello,
>>
>> On 6/15/21 8:03 AM, Ban Tao wrote:
>>> The Allwinner H6 and later SoCs have an DMIC block
>>> which is capable of capture.
>>>
>>> Signed-off-by: Ban Tao <fengzheng923@gmail.com>
>>> ---
>>>  MAINTAINERS                   |   7 +
>>>  sound/soc/sunxi/Kconfig       |   8 +
>>>  sound/soc/sunxi/Makefile      |   1 +
>>>  sound/soc/sunxi/sun50i-dmic.c | 408 ++++++++++++++++++++++++++++++++++
>>>  4 files changed, 424 insertions(+)
>>>  create mode 100644 sound/soc/sunxi/sun50i-dmic.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index b4094f07214e..1b87225c39b0 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -760,6 +760,13 @@ L:       linux-media@vger.kernel.org
>>>  S:   Maintained
>>>  F:   drivers/staging/media/sunxi/cedrus/
>>>
>>> +ALLWINNER DMIC DRIVERS
>>> +M:   Ban Tao <fengzheng923@gmail.com>
>>> +L:   alsa-devel@alsa-project.org (moderated for non-subscribers)
>>> +S:   Maintained
>>> +F:
>>  Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
>>> +F:   sound/soc/sunxi/sun50i-dmic.c
>>> +
>>>  ALPHA PORT
>>>  M:   Richard Henderson <rth@twiddle.net>
>>>  M:   Ivan Kokshaysky <ink@jurassic.park.msu.ru>
>>> diff --git a/sound/soc/sunxi/Kconfig b/sound/soc/sunxi/Kconfig
>>> index ddcaaa98d3cb..2a3bf7722e11 100644
>>> --- a/sound/soc/sunxi/Kconfig
>>> +++ b/sound/soc/sunxi/Kconfig
>>> @@ -56,6 +56,14 @@ config SND_SUN4I_SPDIF
>>>         Say Y or M to add support for the S/PDIF audio block in the
>> Allwinner
>>>         A10 and affiliated SoCs.
>>>
>>> +config SND_SUN50I_DMIC
>>> +     tristate "Allwinner H6 DMIC Support"
>>> +     depends on (OF && ARCH_SUNXI) || COMPILE_TEST
>>> +     select SND_SOC_GENERIC_DMAENGINE_PCM
>>> +     help
>>> +       Say Y or M to add support for the DMIC audio block in the
>> Allwinner
>>> +       H6 and affiliated SoCs.
>>> +
>>>  config SND_SUN8I_ADDA_PR_REGMAP
>>>       tristate
>>>       select REGMAP
>>> diff --git a/sound/soc/sunxi/Makefile b/sound/soc/sunxi/Makefile
>>> index a86be340a076..4483fe9c94ef 100644
>>> --- a/sound/soc/sunxi/Makefile
>>> +++ b/sound/soc/sunxi/Makefile
>>> @@ -6,3 +6,4 @@ obj-$(CONFIG_SND_SUN8I_CODEC_ANALOG) +=
>> sun8i-codec-analog.o
>>>  obj-$(CONFIG_SND_SUN50I_CODEC_ANALOG) += sun50i-codec-analog.o
>>>  obj-$(CONFIG_SND_SUN8I_CODEC) += sun8i-codec.o
>>>  obj-$(CONFIG_SND_SUN8I_ADDA_PR_REGMAP) += sun8i-adda-pr-regmap.o
>>> +obj-$(CONFIG_SND_SUN50I_DMIC) += sun50i-dmic.o
>>> diff --git a/sound/soc/sunxi/sun50i-dmic.c
>> b/sound/soc/sunxi/sun50i-dmic.c
>>> new file mode 100644
>>> index 000000000000..78d512d93974
>>> --- /dev/null
>>> +++ b/sound/soc/sunxi/sun50i-dmic.c
>>> @@ -0,0 +1,408 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +/*
>>> + * ALSA SoC DMIC Audio Layer
>>> + *
>>> + * Copyright 2021 Ban Tao <fengzheng923@gmail.com>
>>> + *
>>> + */
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/device.h>
>>> +#include <linux/of_device.h>
>>> +#include <linux/module.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/reset.h>
>>> +#include <sound/dmaengine_pcm.h>
>>> +#include <sound/pcm_params.h>
>>> +#include <sound/soc.h>
>>> +
>>> +
>>> +#define SUN50I_DMIC_EN_CTL           (0x00)
>>> +     #define SUN50I_DMIC_EN_CTL_GLOBE                        BIT(8)
>>> +     #define SUN50I_DMIC_EN_CTL_CHAN(v)              ((v) << 0)
>>> +     #define SUN50I_DMIC_EN_CTL_CHAN_MASK            GENMASK(7, 0)
>>> +#define SUN50I_DMIC_SR                       (0x04)
>>> +     #define SUN50I_DMIC_SR_SAMOLE_RATE(v)           ((v) << 0)
>>> +     #define SUN50I_DMIC_SR_SAMOLE_RATE_MASK         GENMASK(2, 0)
>>> +#define SUN50I_DMIC_CTL                      (0x08)
>>> +     #define SUN50I_DMIC_CTL_OVERSAMPLE_RATE         BIT(0)
>>> +#define SUN50I_DMIC_DATA                     (0x10)
>>> +#define SUN50I_DMIC_INTC                     (0x14)
>>> +     #define SUN50I_DMIC_FIFO_DRQ_EN                 BIT(2)
>>> +#define SUN50I_DMIC_INT_STA          (0x18)
>>> +     #define SUN50I_DMIC_INT_STA_OVERRUN_IRQ_PENDING BIT(1)
>>> +     #define SUN50I_DMIC_INT_STA_DATA_IRQ_PENDING    BIT(0)
>>> +#define SUN50I_DMIC_RXFIFO_CTL               (0x1c)
>>> +     #define SUN50I_DMIC_RXFIFO_CTL_FLUSH            BIT(31)
>>> +     #define SUN50I_DMIC_RXFIFO_CTL_MODE             BIT(9)
>>> +     #define SUN50I_DMIC_RXFIFO_CTL_RESOLUTION       BIT(8)
>>> +#define SUN50I_DMIC_CH_NUM           (0x24)
>>> +     #define SUN50I_DMIC_CH_NUM_N(v)                 ((v) << 0)
>>> +     #define SUN50I_DMIC_CH_NUM_N_MASK               GENMASK(2, 0)
>>> +#define SUN50I_DMIC_CNT                      (0x2c)
>>> +     #define SUN50I_DMIC_CNT_N                       BIT(0)
>>> +#define SUN50I_DMIC_HPF_CTRL         (0x38)
>>> +#define SUN50I_DMIC_VERSION          (0x50)
>>> +
>>> +
>>> +struct sun50i_dmic_dev {
>>> +     struct platform_device *pdev;
>>> +     struct clk *dmic_clk;
>>> +     struct clk *apb_clk;
>>> +     struct reset_control *rst;
>>> +     struct regmap *regmap;
>>> +     struct snd_dmaengine_dai_dma_data dma_params_rx;
>>> +     unsigned int chan_en;
>>> +};
>>> +
>>> +struct dmic_rate {
>>> +     unsigned int samplerate;
>>> +     unsigned int rate_bit;
>>> +};
>>> +
>>> +static void sun50i_snd_rxctrl_enable(struct snd_pcm_substream
>> *substream,
>>> +                                 struct sun50i_dmic_dev *host, bool
>> enable)
>>> +{
>>> +     if (enable) {
>>> +             /* DRQ ENABLE */
>>> +             regmap_update_bits(host->regmap, SUN50I_DMIC_INTC,
>>> +                                SUN50I_DMIC_FIFO_DRQ_EN,
>>> +                                SUN50I_DMIC_FIFO_DRQ_EN);
>>> +             regmap_update_bits(host->regmap, SUN50I_DMIC_EN_CTL,
>>> +                                SUN50I_DMIC_EN_CTL_CHAN_MASK,
>>> +                                SUN50I_DMIC_EN_CTL_CHAN(host->chan_en));
>>> +             /* Global enable */
>>> +             regmap_update_bits(host->regmap, SUN50I_DMIC_EN_CTL,
>>> +                                SUN50I_DMIC_EN_CTL_GLOBE,
>>> +                                SUN50I_DMIC_EN_CTL_GLOBE);
>>> +     } else {
>>> +             /* DRQ DISABLE */
>>> +             regmap_update_bits(host->regmap, SUN50I_DMIC_INTC,
>>> +                                SUN50I_DMIC_FIFO_DRQ_EN, 0);
>>> +             regmap_update_bits(host->regmap, SUN50I_DMIC_EN_CTL,
>>> +                                SUN50I_DMIC_EN_CTL_CHAN_MASK,
>>> +                                SUN50I_DMIC_EN_CTL_CHAN(0));
>>> +             /* Global disable */
>>> +             regmap_update_bits(host->regmap, SUN50I_DMIC_EN_CTL,
>>> +                                SUN50I_DMIC_EN_CTL_GLOBE, 0);
>>> +     }
>>> +}
>>> +
>>> +static int sun50i_dmic_startup(struct snd_pcm_substream *substream,
>>> +                            struct snd_soc_dai *cpu_dai)
>>> +{
>>> +     struct snd_soc_pcm_runtime *rtd = substream->private_data;
>>> +     struct sun50i_dmic_dev *host =
>> snd_soc_dai_get_drvdata(rtd->cpu_dai);
>>
>> This is equivalent to the simpler code you use below:
>>
>> struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
>>
>>> +
>>> +     /* only support capture */
>>> +     if (substream->stream != SNDRV_PCM_STREAM_CAPTURE)
>>> +             return -EINVAL;
>>> +
>>> +     regmap_write(host->regmap, SUN50I_DMIC_INT_STA,
>>> +                  SUN50I_DMIC_INT_STA_OVERRUN_IRQ_PENDING |
>>> +                  SUN50I_DMIC_INT_STA_DATA_IRQ_PENDING);
>>
>> The interrupt is never enabled, so do we really care about IRQ status?
>>
> 
> Ok, I will delete it .
> 
>>
>>> +     regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
>>> +                        SUN50I_DMIC_RXFIFO_CTL_FLUSH,
>>> +                        SUN50I_DMIC_RXFIFO_CTL_FLUSH);
>>> +     regmap_write(host->regmap, SUN50I_DMIC_CNT, SUN50I_DMIC_CNT_N);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int sun50i_dmic_hw_params(struct snd_pcm_substream *substream,
>>> +                              struct snd_pcm_hw_params *params,
>>> +                              struct snd_soc_dai *cpu_dai)
>>> +{
>>> +     int i = 0;
>>> +     unsigned long rate = params_rate(params);
>>> +     unsigned int channels = params_channels(params);
>>> +     struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
>>> +     struct platform_device *pdev = host->pdev;
>>> +     struct dmic_rate dmic_rate_s[] = {
>>> +             {44100, 0x0},
>>> +             {48000, 0x0},
>>> +             {22050, 0x2},
>>> +             {24000, 0x2},
>>> +             {11025, 0x4},
>>> +             {12000, 0x4},
>>> +             {32000, 0x1},
>>> +             {16000, 0x3},
>>> +             {8000,  0x5},
>>> +     };
>>> +
>>> +     /* DMIC num is N+1 */
>>> +     regmap_update_bits(host->regmap, SUN50I_DMIC_CH_NUM,
>>> +                        SUN50I_DMIC_CH_NUM_N_MASK,
>>> +                        SUN50I_DMIC_CH_NUM_N(channels - 1));
>>> +     host->chan_en = (1 << channels) - 1;
>>> +     regmap_write(host->regmap, SUN50I_DMIC_HPF_CTRL, host->chan_en);
>>> +
>>> +     switch (params_format(params)) {
>>> +     case SNDRV_PCM_FORMAT_S16_LE:
>>> +             regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
>>> +                                SUN50I_DMIC_RXFIFO_CTL_MODE,
>>> +                                SUN50I_DMIC_RXFIFO_CTL_MODE);
>>> +             regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
>>> +                                SUN50I_DMIC_RXFIFO_CTL_RESOLUTION, 0);
>>> +             break;
>>> +     case SNDRV_PCM_FORMAT_S24_LE:
>>> +             regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
>>> +                                SUN50I_DMIC_RXFIFO_CTL_MODE, 0);
>>
>> In SNDRV_PCM_FORMAT_S24_LE, the sample is in the three least significant
>> bytes, so wouldn't we want to still use mode 1 here? To me, mode 0 only
>> makes sense when using SNDRV_PCM_FORMAT_S32_LE.
>>
> 
> I don't understand. The DMIC does not support 32bits, why use
> SNDRV_PCM_FORMAT_S32_LE ?

The hardware supports extending the samples to 32 bits. So if userspace
wants 32-bit samples (for whatever reason), it is more efficient to do
the extension in hardware than in software. You do not need to add
support for SNDRV_PCM_FORMAT_S32_LE; the driver will work fine without it.

But this is unrelated to the fact that mode 0 is wrong for
SNDRV_PCM_FORMAT_S24_LE.

SNDRV_PCM_FORMAT_S16_LE => samples must be in 2 lower bytes.
   Mode 1 does this. The upper 2 bytes are ignored.

SNDRV_PCM_FORMAT_S24_LE => samples must be in 3 lower bytes.
   Mode 1 does this. The 21-bit sample is extended with 3 zeroes.

In fact, since only 21 bits in the 24-bit sample are meaningful, you
should set the sig_bits field in the DAI driver so userspace can know.

(Does it make sense that extending 21 -> 24 bits to fit in a standard
PCM format serves the same purpose as extending 21 -> 32 bits?)

>>
>>> +             regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
>>> +                                SUN50I_DMIC_RXFIFO_CTL_RESOLUTION,
>>> +                                SUN50I_DMIC_RXFIFO_CTL_RESOLUTION);
>>> +             break;
>>> +     default:
>>> +             dev_err(&pdev->dev, "Invalid format!\n");
>>
>> The calls to dev_err() can use cpu_dai->dev. Then you don't need to keep
>> a pointer to pdev in the driver data.
>>
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     for (i = 0; i < ARRAY_SIZE(dmic_rate_s); i++) {
>>> +             if (dmic_rate_s[i].samplerate == rate) {
>>> +                     regmap_update_bits(host->regmap, SUN50I_DMIC_SR,
>>> +                                        SUN50I_DMIC_SR_SAMOLE_RATE_MASK,
>>> +
>> SUN50I_DMIC_SR_SAMOLE_RATE(dmic_rate_s[i].rate_bit));
>>> +                     break;
>>> +             }
>>> +     }
>>> +     if (i == ARRAY_SIZE(dmic_rate_s)) {
>>> +             dev_err(&pdev->dev, "Invalid rate!\n");
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     /* oversamplerate adjust */
>>> +     if (params_rate(params) >= 24000)
>>> +             regmap_update_bits(host->regmap, SUN50I_DMIC_CTL,
>>> +                                SUN50I_DMIC_CTL_OVERSAMPLE_RATE,
>>> +                                SUN50I_DMIC_CTL_OVERSAMPLE_RATE);
>>> +     else
>>> +             regmap_update_bits(host->regmap, SUN50I_DMIC_CTL,
>>> +                                SUN50I_DMIC_CTL_OVERSAMPLE_RATE, 0);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int sun50i_dmic_trigger(struct snd_pcm_substream *substream, int
>> cmd,
>>> +                            struct snd_soc_dai *dai)
>>> +{
>>> +     int ret = 0;
>>> +     struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(dai);
>>> +
>>> +     if (substream->stream != SNDRV_PCM_STREAM_CAPTURE)
>>> +             return -EINVAL;
>>> +
>>> +     switch (cmd) {
>>> +     case SNDRV_PCM_TRIGGER_START:
>>> +     case SNDRV_PCM_TRIGGER_RESUME:
>>> +     case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>>> +             sun50i_snd_rxctrl_enable(substream, host, true);
>>> +             break;
>>> +
>>> +     case SNDRV_PCM_TRIGGER_STOP:
>>> +     case SNDRV_PCM_TRIGGER_SUSPEND:
>>> +     case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>>> +             sun50i_snd_rxctrl_enable(substream, host, false);
>>> +             break;
>>> +
>>> +     default:
>>> +             ret = -EINVAL;
>>> +             break;
>>> +     }
>>> +     return ret;
>>> +}
>>> +
>>> +static int sun50i_dmic_set_sysclk(struct snd_soc_dai *dai, int clk_id,
>>> +                              unsigned int freq, int dir)
>>> +{
>>> +     struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(dai);
>>> +
>>> +     if (clk_set_rate(host->dmic_clk, freq)) {
>>
>> Currently, mainline does not have any sunxi-specific machine drivers. We
>> are using simple-audio-card for sun50i. And asoc_simple_hw_params() only
>> calls .set_sysclk if mclk-fs is set to some fixed value, from the device
>> tree. However, for sunxi, mclk-fs cannot be a fixed value, because
>> sysclk is the same 22/24 MHz regardless of sample rate. So .set_sysclk
>> will never be called.
>>
>> So for now I would suggest calling clk_set_rate() from .hw_params, using
>> something like sun8i_codec_get_sysclk_rate() to get the right frequency.
>>
> 
> Thanks, i will do it
> 
>>
>>> +             dev_err(dai->dev, "Freq : %u not support\n", freq);
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int sun50i_dmic_soc_dai_probe(struct snd_soc_dai *dai)
>>> +{
>>> +     struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(dai);
>>> +
>>> +     snd_soc_dai_init_dma_data(dai, NULL, &host->dma_params_rx);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static const struct snd_soc_dai_ops sun50i_dmic_dai_ops = {
>>> +     .startup        = sun50i_dmic_startup,
>>> +     .trigger        = sun50i_dmic_trigger,
>>> +     .hw_params      = sun50i_dmic_hw_params,
>>> +     .set_sysclk     = sun50i_dmic_set_sysclk,
>>> +};
>>> +
>>> +static const struct regmap_config sun50i_dmic_regmap_config = {
>>> +     .reg_bits = 32,
>>> +     .reg_stride = 4,
>>> +     .val_bits = 32,
>>> +     .max_register = SUN50I_DMIC_VERSION,
>>> +     .cache_type = REGCACHE_NONE,
>>> +};
>>> +
>>> +#define      SUN50I_DMIC_RATES (SNDRV_PCM_RATE_8000_48000 |
>> SNDRV_PCM_RATE_KNOT)
>>
>> If you use SNDRV_PCM_RATE_KNOT, you also need to provide a list of
>> sample rates as a constraint in .startup.
>>
>>> +#define SUN50I_FORMATS       (SNDRV_PCM_FMTBIT_S16_LE |
>> SNDRV_PCM_FMTBIT_S24_LE)
>>> +
>>> +static struct snd_soc_dai_driver sun50i_dmic_dai = {
>>> +     .capture = {
>>> +             .channels_min = 1,
>>> +             .channels_max = 8,
>>> +             .rates = SUN50I_DMIC_RATES,
>>> +             .formats = SUN50I_FORMATS,

".sig_bits = 21," should go here.

Regards,
Samuel

>>> +     },
>>> +     .probe = sun50i_dmic_soc_dai_probe,
>>> +     .ops = &sun50i_dmic_dai_ops,
>>> +     .name = "dmic",
>>> +};
>>> +
>>> +static const struct of_device_id sun50i_dmic_of_match[] = {
>>> +     {
>>> +             .compatible = "allwinner,sun50i-h6-dmic",
>>> +     },
>>> +     { /* sentinel */ }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, sun50i_dmic_of_match);
>>> +
>>> +static const struct snd_soc_component_driver sun50i_dmic_component = {
>>> +     .name           = "sun50i-dmic",
>>> +};
>>> +
>>> +static int sun50i_dmic_runtime_suspend(struct device *dev)
>>> +{
>>> +     struct sun50i_dmic_dev *host  = dev_get_drvdata(dev);
>>> +
>>> +     clk_disable_unprepare(host->dmic_clk);
>>> +     clk_disable_unprepare(host->apb_clk);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int sun50i_dmic_runtime_resume(struct device *dev)
>>> +{
>>> +     struct sun50i_dmic_dev *host  = dev_get_drvdata(dev);
>>> +     int ret;
>>> +
>>> +     ret = clk_prepare_enable(host->dmic_clk);
>>> +     if (ret)
>>> +             return ret;
>>> +     ret = clk_prepare_enable(host->apb_clk);
>>> +     if (ret)
>>> +             clk_disable_unprepare(host->dmic_clk);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static int sun50i_dmic_probe(struct platform_device *pdev)
>>> +{
>>> +     struct sun50i_dmic_dev *host;
>>> +     struct resource *res;
>>> +     int ret;
>>> +     void __iomem *base;
>>> +
>>> +     host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
>>> +     if (!host)
>>> +             return -ENOMEM;
>>> +
>>> +     host->pdev = pdev;
>>> +
>>> +     /* Get the addresses */
>>> +     res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>> +     base = devm_ioremap_resource(&pdev->dev, res);
>>> +     if (IS_ERR(base))
>>> +             return dev_err_probe(&pdev->dev, PTR_ERR(base),
>>> +                                  "get resource failed.\n");
>>> +
>>> +     host->regmap = devm_regmap_init_mmio(&pdev->dev, base,
>>> +
>>  &sun50i_dmic_regmap_config);
>>> +
>>> +     /* Clocks */
>>> +     host->apb_clk = devm_clk_get(&pdev->dev, "apb");
>>> +     if (IS_ERR(host->apb_clk))
>>> +             return dev_err_probe(&pdev->dev, PTR_ERR(host->apb_clk),
>>> +                                  "failed to get apb clock.\n");
>>> +
>>> +     host->dmic_clk = devm_clk_get(&pdev->dev, "dmic");
>>> +     if (IS_ERR(host->dmic_clk))
>>> +             return dev_err_probe(&pdev->dev, PTR_ERR(host->dmic_clk),
>>> +                                  "failed to get dmic clock.\n");
>>> +
>>> +     host->dma_params_rx.addr = res->start + SUN50I_DMIC_DATA;
>>> +     host->dma_params_rx.maxburst = 8;
>>> +     host->dma_params_rx.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
>>
>> This needs to be DMA_SLAVE_BUSWIDTH_4_BYTES if you are using larger than
>> 16-bit samples. See for example sun4i_i2s_hw_params().
>>
>> Regards,
>> Samuel
>>
> 

