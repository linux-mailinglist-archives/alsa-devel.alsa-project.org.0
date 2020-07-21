Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 869FF227F11
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 13:38:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2843316A9;
	Tue, 21 Jul 2020 13:37:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2843316A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595331513;
	bh=B66K6fnijF5I361cOXLplXp8LplB9EhxeF1u8IeeAec=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A+LHeJBp0S+2YCtX4nnwm+OT43RtQ9AfklHR924IGCSemGTV1v49vfDD+rbj9NEEj
	 pKdrHnGlaUMTclX03ZpG7zb3CHMyMgFUfXEeBUjxrCrmN+2MUCe+cbNvgl5GgWq8l0
	 AMVyvhg5jtwxqt2ZCQh4CDwieF6Vm9K6pkGmCnRw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C221F800CE;
	Tue, 21 Jul 2020 13:36:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E92AF8024A; Tue, 21 Jul 2020 13:36:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, HEADER_FROM_DIFFERENT_DOMAINS, SPF_HELO_NONE,
 SPF_PASS, 
 URIBL_BLOCKED,USER_IN_DEF_SPF_WL autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83F5EF800CE
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 13:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83F5EF800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Ra1p4Van"
Received: by mail-wm1-x343.google.com with SMTP id 22so2491762wmg.1
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 04:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yj1qnl1WLfnKvv1xFJMIVkm5J+E8pmta5ysPZcg545M=;
 b=Ra1p4VangqmV7CM2mbg0ENHiGKAvqOGmm3QzHbwuXOK6VwYR47xfLyfWeo4Z9vQOKG
 xNLUEYZ4KalALdotcQoLjc0oegPpaaIMiry4Npz1FVNm4E1sHQQ7RwqhFy+x89bkbaVN
 1cIXj7j9IG5jR3Ki9Dshx719g4/0p3B0VXkOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yj1qnl1WLfnKvv1xFJMIVkm5J+E8pmta5ysPZcg545M=;
 b=eRT9484mQG0FivCxIWsdRIOjWHygpF7W1DHemJujKNR63VlBGup9RVa9hZcPbPewMt
 giG5DNsYbYeLG9FbJzcfO0JqVvUAverqHmxKW3Fg2tkld9nAd98uaGm2jKZQ42c/hQhR
 gZWjdXUnSkr2+PG6Lup2X4Hzgvex+YSuTHy58eLcWBW29bk5TFkNu9Uc42HZDCOtc7c2
 Gx6mQ19aNLq0PTLMkjaQoTnoyxD7NoNbQbioOaIBWQVQMrEL3crzIXpn5M9zaKd0k0RP
 bcwxyZ3z7IE2RbquM6e0G+tHHoM2k8HWqMONEL6bQHXaSOLSmjTSXCkgC7vQnEYJpfOr
 NCdw==
X-Gm-Message-State: AOAM531ZSTiWf93jb2T5JRrVeYPx6IoUw7Aj6VkFUgrQm4Fj4dzRR1QB
 kZzUdLtwVfyrh5R6XBA2jlAh2Jiei04tLX/dyxQWBQ==
X-Google-Smtp-Source: ABdhPJwh6lTkGfTci7wgoDwi1kHu85IEqFzskg/QiL2w0OvgAKxpMaamWsYAIfpujP6j1Keo8EsqOTDtjZZF3ildGPU=
X-Received: by 2002:a1c:6246:: with SMTP id w67mr3574806wmb.42.1595331397735; 
 Tue, 21 Jul 2020 04:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200717120207.3471030-1-cychiang@chromium.org>
 <20200717120207.3471030-2-cychiang@chromium.org>
 <CA+Px+wV211AhRVTecU7OS6uP2AQw7v7Gu5x41L4dgW3xR8mA-A@mail.gmail.com>
In-Reply-To: <CA+Px+wV211AhRVTecU7OS6uP2AQw7v7Gu5x41L4dgW3xR8mA-A@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 21 Jul 2020 19:36:10 +0800
Message-ID: <CAFv8Nw+n9nQio7-3GS0sYrj58D9+Rpq39u4RTDJ0rVgvKtdj1A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: qcom: sc7180: Add machine driver for sound card
 registration
To: Tzung-Bi Shih <tzungbi@google.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 ALSA development <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 Andy Gross <agross@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 Ajit Pandey <ajitp@codeaurora.org>, Dylan Reid <dgreid@chromium.org>,
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

Hi Tzung-Bi,
Thanks for the review!
On Mon, Jul 20, 2020 at 10:47 AM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Fri, Jul 17, 2020 at 8:02 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
> > diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
> > new file mode 100644
> > index 000000000000..cbe6b487d432
> > --- /dev/null
> > +++ b/sound/soc/qcom/sc7180.c
> > @@ -0,0 +1,410 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> > + *
> > + * sc7180.c -- ALSA SoC Machine driver for SC7180
> > + */
> Use "//" for all lines (see https://lkml.org/lkml/2020/5/14/332).
>

Thanks for the pointer. Fixed in v2.

> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/of_device.h>
> > +#include <sound/core.h>
> > +#include <sound/pcm.h>
> > +#include <sound/pcm_params.h>
> > +#include <sound/jack.h>
> > +#include <sound/soc.h>
> > +#include <uapi/linux/input-event-codes.h>
> > +#include <dt-bindings/sound/sc7180-lpass.h>
> > +#include "../codecs/rt5682.h"
> > +#include "common.h"
> > +#include "lpass.h"
> Insert a blank line in between <...> and "..." and sort the list
> alphabetically to make it less likely to conflict.

Fixed in v2.

>
> > +static int sc7180_snd_hw_params(struct snd_pcm_substream *substream,
> > +                               struct snd_pcm_hw_params *params)
> > +{
> Dummy function?  Or is it still work in progress?
>
Removed in v2.

> > +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> > +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> > +       int ret = 0;
> > +
> > +       switch (cpu_dai->id) {
> > +       case MI2S_PRIMARY:
> > +               break;
> > +       case MI2S_SECONDARY:
> > +               break;
> > +       default:
> > +               pr_err("%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
> -EINVAL.
>
Removed in v2.
> > +static int sc7180_dai_init(struct snd_soc_pcm_runtime *rtd)
> > +{
> > +       struct snd_soc_component *component;
> > +       struct snd_soc_card *card = rtd->card;
> > +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> > +       struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> > +       struct sc7180_snd_data *pdata = snd_soc_card_get_drvdata(card);
> > +       struct snd_jack *jack;
> > +       int rval;
> > +
> > +       if (!pdata->jack_setup) {
> > +               rval = snd_soc_card_jack_new(
> > +                               card, "Headset Jack",
> > +                               SND_JACK_HEADSET |
> > +                               SND_JACK_HEADPHONE |
> > +                               SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> > +                               SND_JACK_BTN_2 | SND_JACK_BTN_3,
> > +                               &pdata->jack, NULL, 0);
> > +
> > +               if (rval < 0) {
> > +                       dev_err(card->dev, "Unable to add Headphone Jack\n");
> > +                       return rval;
> > +               }
> > +
> > +               jack = pdata->jack.jack;
> > +
> > +               snd_jack_set_key(jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
> > +               snd_jack_set_key(jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
> > +               snd_jack_set_key(jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
> > +               snd_jack_set_key(jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
> > +               pdata->jack_setup = true;
> This block is something I don't expect to be in "dai_init" (i.e. there
> is only 1 headset jack, why do we need to run the code for n times).
>
Thanks for the suggestion. In v2 I am using aux device so this
function is cleaned up to be specific to aux device for jack
detection.

> > +       switch (cpu_dai->id) {
> > +       case MI2S_PRIMARY:
> > +               jack  = pdata->jack.jack;
> > +               component = codec_dai->component;
> > +
> > +               jack->private_data = component;
> > +               jack->private_free = sc7180_jack_free;
> > +               rval = snd_soc_component_set_jack(component,
> > +                                                 &pdata->jack, NULL);
> > +               if (rval != 0 && rval != -EOPNOTSUPP) {
> > +                       dev_warn(card->dev, "Failed to set jack: %d\n", rval);
> > +                       return rval;
> > +               }
> > +               break;
> > +       case MI2S_SECONDARY:
> > +               break;
> > +       default:
> > +               pr_err("%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
> -EINVAL.
>
Removed in v2.
> > +static int sc7180_snd_startup(struct snd_pcm_substream *substream)
> > +{
> > +       unsigned int codec_dai_fmt = SND_SOC_DAIFMT_CBS_CFS;
> > +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> > +       struct snd_soc_card *card = rtd->card;
> > +       struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
> > +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> > +       struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> > +       int ret;
> > +
> > +       switch (cpu_dai->id) {
> > +       case MI2S_PRIMARY:
> > +               codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
> If the format is fixed, could it put somewhere statically?
>
Fixed in v2.
> > +               if (++data->pri_mi2s_clk_count == 1) {
> Don't it need to be atomic?
>
soc_pcm_open and soc_pcm_close are protected by card->pcm_mutex so
they will happen in sequence.

> > +                       snd_soc_dai_set_sysclk(cpu_dai,
> > +                                              LPASS_MCLK0,
> > +                                              DEFAULT_MCLK_RATE,
> > +                                              SNDRV_PCM_STREAM_PLAYBACK);
> > +               }
> > +               snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
> > +
> > +               /* Configure PLL1 for codec */
> > +               ret = snd_soc_dai_set_pll(codec_dai, 0, RT5682_PLL1_S_MCLK,
> > +                                         DEFAULT_MCLK_RATE, RT5682_PLL1_FREQ);
> > +               if (ret < 0) {
> > +                       dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
> > +                       return ret;
> > +               }
> > +
> > +               /* Configure sysclk for codec */
> > +               ret = snd_soc_dai_set_sysclk(codec_dai, RT5682_SCLK_S_PLL1,
> > +                                            RT5682_PLL1_FREQ,
> > +                                            SND_SOC_CLOCK_IN);
> > +               if (ret < 0)
> > +                       dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n",
> > +                               ret);
> > +
> > +               break;
> > +       case MI2S_SECONDARY:
> > +               break;
> > +       default:
> > +               pr_err("%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
> -EINVAL.
Fixed in v2
>
> > +static void  sc7180_snd_shutdown(struct snd_pcm_substream *substream)
> > +{
> > +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> > +       struct snd_soc_card *card = rtd->card;
> > +       struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
> > +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> > +
> > +       switch (cpu_dai->id) {
> > +       case MI2S_PRIMARY:
> > +               if (--data->pri_mi2s_clk_count == 0) {
> Atomic?
ditto
>
> > +                       snd_soc_dai_set_sysclk(cpu_dai,
> > +                                              LPASS_MCLK0,
> > +                                              0,
> > +                                              SNDRV_PCM_STREAM_PLAYBACK);
> > +               }
> > +               break;
> > +       case MI2S_SECONDARY:
> > +               break;
> > +       default:
> > +               pr_err("%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
> -EINVAL.
>
not needed since this returns void
> > +static int sc7180_snd_platform_probe(struct platform_device *pdev)
> > +{
> > +       struct snd_soc_card *card;
> > +       struct sc7180_snd_data *data;
> > +       struct device *dev = &pdev->dev;
> > +       int ret;
> > +
> > +       card = kzalloc(sizeof(*card), GFP_KERNEL);
> > +       if (!card)
> > +               return -ENOMEM;
> Looks like you don't need to allocate the card in runtime.  Also you
> need to use the devm version if needed.
>
Thanks for the great suggestion. In v2 I am using a static sound card.
Also, use devm wherever possible to greatly simplify the code.

> > +       /* Allocate the private data */
> > +       data = kzalloc(sizeof(*data), GFP_KERNEL);
> Use devm.
>
Fixed in v2.
> > +       card->dapm_widgets = sc7180_snd_widgets;
> > +       card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets);
> Can the struct snd_soc_card allocate statically?
>
Fixed in v2.
> > +       sc7180_add_ops(card);
> > +       ret = snd_soc_register_card(card);
> devm.
>
>
> I didn't dive into the logic too much.  Would need another round
> review if any newer version.

Thanks again.
