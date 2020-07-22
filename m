Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9905228E83
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 05:17:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37B2D167F;
	Wed, 22 Jul 2020 05:16:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37B2D167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595387858;
	bh=bPzCpmibRq6iPgTyXQETtTToqzwLG/WR8oVm9T35sv4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CLmrC9L+crjeu1BK58HhVMX/gX5IQbvQsCWs77sRc46nvck7TEfLlU2nU7PV6kz0G
	 Uag3vvHN5Q/uIKPwyU75kkg36ym3Rq30Bw3i2kEZPg4fdbmVHFPaZVkuro6NSKieBy
	 cUg+rhKXeDHy5KF+aVf5+1f0OdoMXqdYCclV0Qm8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AD17F800CE;
	Wed, 22 Jul 2020 05:15:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A3D0F8014C; Wed, 22 Jul 2020 05:15:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E1A7F800CE
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 05:15:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E1A7F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="o+sfsjMC"
Received: by mail-io1-xd44.google.com with SMTP id c16so1010028ioi.9
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 20:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=45JomO1d9wejy1HPoYxaCzisM7wW+NcLf1i+9Sigraw=;
 b=o+sfsjMCDuKPzbe/qIeYMbzrEqO1c3cG6lOfmpnyTEQm+sA/yJ7z+qHiKEtgfUSGpV
 wMHw163AiILZEL7mx9dOU1WNE5kixKXY7q5NnrEUACGAFtwWFsWKdiRNJUyepwilvgnY
 iUn0p2++v3ZaNkQioAz7VGloQD2D6dHBNUGz5/vSQwvYkSesZoiwJQ8HnhyMZ6enhZKr
 DkV6zb9TmsuIxgw003JvA4UaCJ2+HAtqFGqwIpq6Yo3VADMSwQfMzOgQnC2bjgrGkQvB
 i3j1u9ZQZnzkMYpllOWdDbcDqymwGviqmmwK2tUcfutCvtQpZAb2xrrWvd8ElWMbZGO0
 7aTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=45JomO1d9wejy1HPoYxaCzisM7wW+NcLf1i+9Sigraw=;
 b=arow22+aO/m0rHdLlvcbUWpQomXjj8EUG+AGrpY40aNRAlc4HswUq/b40QzoB9D2io
 VwtvZIgOfhUj1S7eEL4LUR5y+lhIV1RGBIWB70E9uruPtL18CVkUw4D/NHVNczGmh4fd
 5r+IAC+oFGLZFt0smey3cUw0IqZBMjxYV8qovbCy/zreXtmmG5NbBBNBPlu7Tl9M7UNa
 tq66VnhKrfXGXgUUGVwz2JnIXJL6CLhugux6wOmfgkZjIR4wANACTavbEn5pun3/y+Cz
 +LdJberqtzj5z4Uhs79uzc3DuxP2jhVf5FoOYIT7F6qc9/iEsvyNQg+NDQK6Pzs21uZ8
 bCow==
X-Gm-Message-State: AOAM5317r5QBYRtfCW/1cycftWbe3IFTcbVgPR1UYLvkRFUHrGrEf34G
 zUfh/Kxr+3F4sKgBFG3NTVmHQIkiWFJddx0Zw4cfPA==
X-Google-Smtp-Source: ABdhPJytvgzhX6bIeTKuXIhQ8Ogfb1O2KxTd1ZdvSE0ibGG3xWtYgYMUBBjc4eOOaKb7vSbZzLHEhfw0MosrRiQSayg=
X-Received: by 2002:a6b:d301:: with SMTP id s1mr30475980iob.146.1595387743234; 
 Tue, 21 Jul 2020 20:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200721104422.369368-1-cychiang@chromium.org>
 <20200721104422.369368-3-cychiang@chromium.org>
In-Reply-To: <20200721104422.369368-3-cychiang@chromium.org>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 22 Jul 2020 11:15:32 +0800
Message-ID: <CA+Px+wUEQqe0dOeHBFxOEFG5QctTipj6egu94OD+LvYmSunaTQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: qcom: sc7180: Add machine driver for sound
 card registration
To: Cheng-Yi Chiang <cychiang@chromium.org>
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
 Ajit Pandey <ajitp@codeaurora.org>, dgreid@chromium.org,
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

On Tue, Jul 21, 2020 at 6:44 PM Cheng-Yi Chiang <cychiang@chromium.org> wrote:
> diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
> new file mode 100644
> index 000000000000..3beb2b129d01
> --- /dev/null
> +++ b/sound/soc/qcom/sc7180.c
> @@ -0,0 +1,380 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +//Copyright (c) 2020, The Linux Foundation. All rights reserved.
> +//
> +//sc7180.c -- ALSA SoC Machine driver for SC7180
Insert an extra space between // and text to make it look better.

> +static int sc7180_headset_init(struct snd_soc_component *component);
> +
> +static struct snd_soc_aux_dev sc7180_headset_dev = {
> +       .dlc = COMP_EMPTY(),
> +       .init = sc7180_headset_init,
> +};
Move definition of sc7180_headset_dev after sc7180_headset_init( ) so
that you don't need forward declaration of sc7180_headset_init( ).

> +static unsigned int primary_dai_fmt = SND_SOC_DAIFMT_CBS_CFS |
> +                                     SND_SOC_DAIFMT_NB_NF |
> +                                     SND_SOC_DAIFMT_I2S;
> +
> +static int sc7180_snd_startup(struct snd_pcm_substream *substream)
> +{
> +       struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +       struct snd_soc_card *card = rtd->card;
> +       struct sc7180_snd_data *data = snd_soc_card_get_drvdata(card);
> +       struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> +       struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +       int ret;
> +
> +       switch (cpu_dai->id) {
> +       case MI2S_PRIMARY:
> +               if (++data->pri_mi2s_clk_count == 1) {
> +                       snd_soc_dai_set_sysclk(cpu_dai,
> +                                              LPASS_MCLK0,
> +                                              DEFAULT_MCLK_RATE,
> +                                              SNDRV_PCM_STREAM_PLAYBACK);
> +               }
> +               snd_soc_dai_set_fmt(codec_dai, primary_dai_fmt);
My comment on the previous thread may mislead.  My original intent:
move the DAIFMT setting to DAI link->dai_fmt in sc7180_parse_of( ).

If you need to keep it as is: inline the SND_SOC_DAIFMT_* into
snd_soc_dai_set_fmt( ) (i.e. eliminate primary_dai_fmt).

> +static int sc7180_parse_of(struct snd_soc_card *card)
> +{
> +       struct device_node *np;
> +       struct device_node *codec = NULL;
> +       struct device_node *platform = NULL;
The function doesn't use platform.

> +       struct device_node *cpu = NULL;
> +       struct device *dev = card->dev;
> +       struct snd_soc_dai_link *link;
> +       struct of_phandle_args args;
> +       struct snd_soc_dai_link_component *dlc;
> +       int ret, num_links;
> +
> +       ret = snd_soc_of_parse_card_name(card, "model");
> +       if (ret) {
> +               dev_err(dev, "Error parsing card name: %d\n", ret);
> +               return ret;
> +       }
> +
> +       /* DAPM routes */
> +       if (of_property_read_bool(dev->of_node, "audio-routing")) {
> +               ret = snd_soc_of_parse_audio_routing(card,
> +                                                    "audio-routing");
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       /* headset aux dev. */
> +       sc7180_headset_dev.dlc.of_node = of_parse_phandle(
> +                       dev->of_node, "aux-dev", 0);
> +       if (!sc7180_headset_dev.dlc.of_node) {
> +               dev_err(dev,
> +                       "Property 'aux-dev' missing/invalid\n");
> +               return -EINVAL;
> +       }
> +
> +       /* Populate links */
> +       num_links = of_get_child_count(dev->of_node);
Eliminate num_links but use card->num_links directly.

> +
> +       /* Allocate the DAI link array */
> +       card->dai_link = devm_kcalloc(dev, num_links, sizeof(*link),
> +                                     GFP_KERNEL);
> +       if (!card->dai_link)
> +               return -ENOMEM;
> +
> +       card->num_links = num_links;
Ditto, eliminate it.

> +       link = card->dai_link;
> +
Eliminate the blank line to make "link = card->dai_link" and the
following for-loop "a whole thing".

> +       for_each_child_of_node(dev->of_node, np) {
> +               dlc = devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
> +               if (!dlc)
> +                       return -ENOMEM;
> +
> +               link->cpus      = &dlc[0];
> +               link->platforms = &dlc[1];
> +
> +               link->num_cpus          = 1;
> +               link->num_platforms     = 1;
> +
> +               ret = of_property_read_string(np, "link-name", &link->name);
> +               if (ret) {
> +                       dev_err(card->dev,
> +                               "error getting codec dai_link name\n");
> +                       goto err;
> +               }
> +
> +               link->playback_only = of_property_read_bool(np,
> +                                                           "playback_only");
> +               link->capture_only = of_property_read_bool(np,
> +                                                          "capture_only");
> +
> +               if (link->playback_only && link->capture_only) {
> +                       dev_err(card->dev,
> +                               "getting both playback and capture only\n");
ret = -EINVAL;

> +                       goto err;
> +               }
> +
> +               cpu = of_get_child_by_name(np, "cpu");
> +               codec = of_get_child_by_name(np, "codec");
Move to below.

> +
> +               if (!cpu) {
> +                       dev_err(dev, "%s: Can't find cpu DT node\n",
> +                               link->name);
> +                       ret = -EINVAL;
> +                       goto err;
> +               }
> +
> +               ret = of_parse_phandle_with_args(cpu, "sound-dai",
> +                                                "#sound-dai-cells", 0, &args);
I may overlook it but I failed to find "#sound-dai-cells" in the
dt-binding example.  I think it should be in DTS?

> +               if (ret) {
> +                       dev_err(card->dev, "%s: error getting cpu phandle\n",
> +                               link->name);
> +                       goto err;
> +               }
> +               link->cpus->of_node = args.np;
> +               link->id = args.args[0];
I am not quite sure what it will be.  I guess one of the following
comes from DTS node name.
#define MI2S_PRIMARY 0
#define MI2S_SECONDARY 1

> +
> +               ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name);
> +               if (ret) {
> +                       dev_err(card->dev, "%s: error getting cpu dai name\n",
> +                               link->name);
> +                       goto err;
> +               }
> +

Move "codec = of_get_child_by_name(np, "codec");" to here.
> +               if (codec) {
> +                       ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
> +                       if (ret < 0) {
> +                               dev_err(card->dev, "%s: codec dai not found\n",
> +                                       link->name);
> +                               goto err;
> +                       }
> +               } else {
> +                       dlc = devm_kzalloc(dev, sizeof(*dlc), GFP_KERNEL);
> +                       if (!dlc)
> +                               return -ENOMEM;
> +
> +                       link->codecs     = dlc;
> +                       link->num_codecs = 1;
> +
> +                       link->codecs->dai_name = "snd-soc-dummy-dai";
> +                       link->codecs->name = "snd-soc-dummy";
> +               }
> +
> +               link->platforms->of_node = link->cpus->of_node;
> +               link->stream_name = link->name;
> +               link->ops = &sc7180_ops;
> +               link++;
> +
> +               of_node_put(cpu);
> +               of_node_put(codec);
cpu = NULL;
codec = NULL;
In case of double of_node_put( ).

> +       }
> +
> +       return 0;
> +err:
> +       of_node_put(np);
I guess you don't need this.

> +       of_node_put(cpu);
> +       of_node_put(codec);
> +       of_node_put(platform);
Eliminate it, not used.

> +static int sc7180_snd_platform_probe(struct platform_device *pdev)
> +{
> +       struct snd_soc_card *card;
> +       struct sc7180_snd_data *data;
> +       struct device *dev = &pdev->dev;
> +       int ret;
> +
> +       card = &sc7180_card;
In this case, inline the initialization while declaration.

> +
> +       /* Allocate the private data */
> +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       card->dapm_widgets = sc7180_snd_widgets;
> +       card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets);
Remove them.

> +       card->dev = dev;
> +       dev_set_drvdata(dev, card);
I guess you don't need this if using devm_snd_soc_register_card(...).

Insert a blank line.
> +       ret = sc7180_parse_of(card);
> +       if (ret) {
> +               dev_err(dev, "Error parsing OF data\n");
> +               return ret;
> +       }
> +
> +       data->card = card;
Looks like data->card is not used.

> +       snd_soc_card_set_drvdata(card, data);
> +
> +       ret = snd_soc_register_card(card);
> +       if (ret) {
> +               dev_err(dev, "Sound card registration failed\n");
> +               return ret;
> +       }
> +       return ret;
Just return devm_snd_soc_register_card(...);

> +static int sc7180_snd_platform_remove(struct platform_device *pdev)
> +{
> +       struct snd_soc_card *card = dev_get_drvdata(&pdev->dev);
> +
> +       snd_soc_unregister_card(card);
> +       return 0;
> +}
Can be removed if using devm_snd_soc_register_card( ).


I didn't go through all the cases.  But it would be better if all "if
(ret < 0)" can be replaced to "if (ret)".
