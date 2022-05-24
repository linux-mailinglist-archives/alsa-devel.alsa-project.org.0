Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B5E5322AB
	for <lists+alsa-devel@lfdr.de>; Tue, 24 May 2022 07:56:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70D3A170F;
	Tue, 24 May 2022 07:55:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70D3A170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653371796;
	bh=+hQA/CQ0mPnHsKEr3QiTLIFu0iLOXr59kyw+mFPHWFM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EYoM3gi3I50r/pFy2AWAkStKAqCOQAaLv85PCPSHgsf3W1lSmkkXY+Gdsd1BUPdmY
	 1RphcR/kWvJ1Cq4c+MEQ7MdmN8hTmn4t+AfXaetAGwkxPzg9APfY+MTqeLtHxVklDP
	 c5+eHQDpuno/xQ+vjACPEcQU3lEQ5Fuu1EbdFpTg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 025DFF800E3;
	Tue, 24 May 2022 07:55:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38B08F800E3; Tue, 24 May 2022 07:55:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05CAEF800E3
 for <alsa-devel@alsa-project.org>; Tue, 24 May 2022 07:54:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05CAEF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aP/auRN/"
Received: by mail-pf1-x429.google.com with SMTP id v11so15557478pff.6
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 22:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zZc7ffNX1WVL2una21e5i5WcOXkncWOaFTmkhoy5+RM=;
 b=aP/auRN/HRIiNKk9/qN7aAnbIDZBP4H8vHDAdoC2tEj+VHZjbqhGGKXlgDUA5MEzdC
 H1Mn8/pwaCEfT/vWWdr5+aYiW1vhcQ3uh9VRnwuVtfyUB6gXwPSTGOWh8HwTPHxdGkn2
 BN9gyhHYUvQtCWIKhWVD275DjqPDbEZ0VHHxCx9d+1bEtJDo5pyUJYPL3KOzoOugWklI
 qDyAU11bSaKMzN1lo8R+q2qK6yI3NTBsT8mHeiKgnbOqLk3qdIXrhbVUqbT1jWUo5wSy
 jZPvfXsVz9yfx+O877nzaOJ8jI/R2Hmfr+kEjQE/YZfNGbpbtJPHFGfYELe62AwyIdY8
 R9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zZc7ffNX1WVL2una21e5i5WcOXkncWOaFTmkhoy5+RM=;
 b=TcMKD28tZ8Wl3H08geow/YOxFodxyJ6yilSdyY9rRUyLClwaSFL6ZYoQ6UWxTa/BHB
 H6xkt/clP1ejLViC9ZfoLKawavv5jM18JcGm/vnhwM/I3aMaKKgJfqgPUtOnVTE+vBLZ
 w0UtV6fT8fOV994mnsrznPScAwZW65Df0SeKqpq28EC+F+4foGqLXgUK+mesEOVXer6D
 2C063gMoOG/bvg1iaCXPmYWh+utr0Z8HmRFjcCDBZdaVJTJV0iyE/hRsbpsgMbbvq5MN
 ZJZel5i60PlQXEz1z2d/KpMwO/WzMyxkoSLMgh0ftNwU2NPJSAIZISc33AqEwdeKOMZg
 sqPw==
X-Gm-Message-State: AOAM533bzae5WH/yJwNt/oclV1N2Lf5Ba8wjgeakjnN0fcs7reF7R6o4
 aQkSEvrC+hzAFbVbL4pGEY8=
X-Google-Smtp-Source: ABdhPJwmNwcIYIS29Cd1T9co2OKwFjIB5lRQB58zKCih40WJbfV3H6Nt3dWbf1FZGv+sHBaMyZvgJA==
X-Received: by 2002:a63:5f45:0:b0:3fa:b2be:fa8d with SMTP id
 t66-20020a635f45000000b003fab2befa8dmr775650pgb.573.1653371685681; 
 Mon, 23 May 2022 22:54:45 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 jf11-20020a170903268b00b0015e8d4eb225sm6159813plb.111.2022.05.23.22.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 22:54:45 -0700 (PDT)
Message-ID: <f54fc0be-5172-f518-4a78-b765e34bfaca@gmail.com>
Date: Tue, 24 May 2022 14:54:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 1/2] ASoC: amd: acp: Add support for nau8825 and
 max98360 card
Content-Language: en-US
To: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220523132353.1767614-1-Vsujithkumar.Reddy@amd.com>
 <20220523132353.1767614-2-Vsujithkumar.Reddy@amd.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220523132353.1767614-2-Vsujithkumar.Reddy@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, Geert Uytterhoeven <geert+renesas@glider.be>,
 ajitkumar.pandey@amd.com, Kai Vehmanen <kai.vehmanen@intel.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jia-Ju Bai <baijiaju1990@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Vijendar.Mukunda@amd.com, Daniel Baluta <daniel.baluta@nxp.com>,
 Bard Liao <bard.liao@intel.com>
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

On 2022/05/23 22:23, V sujith kumar Reddy wrote:
> We have new platform with nau8825 as a primary codec and max98360 as an
> amp codec. Add machine struct to register sof audio based sound card
> on such Chrome machine.
> 
> Signed-off-by: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
> ---
>   sound/soc/amd/acp-config.c          |  21 ++++
>   sound/soc/amd/acp/Kconfig           |   1 +
>   sound/soc/amd/acp/acp-mach-common.c | 166 +++++++++++++++++++++++++++-
>   sound/soc/amd/acp/acp-mach.h        |   3 +
>   sound/soc/amd/acp/acp-sof-mach.c    |  15 +++
>   sound/soc/amd/mach-config.h         |   1 +
>   6 files changed, 201 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
> index 5cbc82eca4c9..f73c187fee03 100644
> --- a/sound/soc/amd/acp-config.c
> +++ b/sound/soc/amd/acp-config.c
> @@ -130,4 +130,25 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_sof_machines[] = {
>   };
>   EXPORT_SYMBOL(snd_soc_acpi_amd_sof_machines);
>   
> +struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_sof_machines[] = {
> +	{
> +		.id = "AMDI1019",
> +		.drv_name = "rmb-dsp",
> +		.pdata = (void *)&acp_quirk_data,
> +		.fw_filename = "sof-rmb.ri",
> +		.sof_tplg_filename = "sof-acp-rmb.tplg",
> +	},
> +	{
> +		.id = "10508825",
> +		.drv_name = "nau8825-max",
> +		.pdata = (void *)&acp_quirk_data,
> +		.machine_quirk = snd_soc_acpi_codec_list,
> +		.quirk_data = &amp_max,
> +		.fw_filename = "sof-rmb.ri",
> +		.sof_tplg_filename = "sof-acp-rmb.tplg",
> +	},
> +	{},
> +};
> +EXPORT_SYMBOL(snd_soc_acpi_amd_rmb_sof_machines);
> +
>   MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/sound/soc/amd/acp/Kconfig b/sound/soc/amd/acp/Kconfig
> index 9dae2719084c..7e56d2644105 100644
> --- a/sound/soc/amd/acp/Kconfig
> +++ b/sound/soc/amd/acp/Kconfig
> @@ -49,6 +49,7 @@ config SND_SOC_AMD_MACH_COMMON
>   	select SND_SOC_RT1019
>   	select SND_SOC_MAX98357A
>   	select SND_SOC_RT5682S
> +	select SND_SOC_NAU8825
>   	help
>   	  This option enables common Machine driver module for ACP.
>   
> diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
> index 6ae454bf60af..4f5cfa26c58d 100644
> --- a/sound/soc/amd/acp/acp-mach-common.c
> +++ b/sound/soc/amd/acp/acp-mach-common.c
> @@ -24,6 +24,7 @@
>   #include "../../codecs/rt5682.h"
>   #include "../../codecs/rt1019.h"
>   #include "../../codecs/rt5682s.h"
> +#include "../../codecs/nau8825.h"
>   #include "acp-mach.h"
>   
>   #define PCO_PLAT_CLK 48000000
> @@ -175,7 +176,8 @@ static void acp_card_shutdown(struct snd_pcm_substream *substream)
>   	struct snd_soc_card *card = rtd->card;
>   	struct acp_card_drvdata *drvdata = card->drvdata;
>   
> -	clk_disable_unprepare(drvdata->wclk);
> +	if (!drvdata->soc_mclk)
> +		clk_disable_unprepare(drvdata->wclk);
>   }
>   
>   static const struct snd_soc_ops acp_card_rt5682_ops = {
> @@ -363,7 +365,7 @@ static int acp_card_amp_startup(struct snd_pcm_substream *substream)
>   	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
>   	struct snd_soc_card *card = rtd->card;
>   	struct acp_card_drvdata *drvdata = card->drvdata;
> -	int ret;
> +	int ret = 0;
>   
>   	runtime->hw.channels_max = DUAL_CHANNEL;
>   	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
> @@ -371,10 +373,13 @@ static int acp_card_amp_startup(struct snd_pcm_substream *substream)
>   	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
>   				      &constraints_rates);
>   
> -	ret = acp_clk_enable(drvdata);
> -	if (ret < 0)
> -		dev_err(rtd->card->dev, "Failed to enable AMP clk: %d\n", ret);
> -
> +	if (!drvdata->soc_mclk) {
> +		ret = acp_clk_enable(drvdata);
> +		if (ret < 0) {
> +			dev_err(rtd->card->dev, "Failed to enable AMP clk: %d\n", ret);
> +			return ret;
> +		}
> +	}
>   	return ret;
>   }
>   
> @@ -409,6 +414,104 @@ static const struct snd_soc_ops acp_card_maxim_ops = {
>   	.shutdown = acp_card_shutdown,
>   };
>   
> +/* Declare nau8825 codec components */
> +SND_SOC_DAILINK_DEF(nau8825,
> +		    DAILINK_COMP_ARRAY(COMP_CODEC("i2c-10508825:00", "nau8825-hifi")));
> +
> +static const struct snd_soc_dapm_route nau8825_map[] = {
> +	{ "Headphone Jack", NULL, "HPOL" },
> +	{ "Headphone Jack", NULL, "HPOR" },
> +};
> +
> +static int acp_card_nau8825_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_card *card = rtd->card;
> +	struct acp_card_drvdata *drvdata = card->drvdata;
> +	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +	struct snd_soc_component *component = codec_dai->component;
> +	unsigned int fmt;
> +	int ret;
> +
> +	dev_info(rtd->dev, "codec dai name = %s\n", codec_dai->name);
> +
> +	if (drvdata->hs_codec_id != NAU8825)
> +		return -EINVAL;
> +
> +	if (drvdata->soc_mclk)
> +		fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBC_CFC;
> +	else
> +		fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBP_CFP;
> +
> +	ret =  snd_soc_dai_set_fmt(codec_dai, fmt);
> +	if (ret < 0) {
> +		dev_err(rtd->card->dev, "Failed to set dai fmt: %d\n", ret);
> +		return ret;
> +	}
> +	ret = snd_soc_card_jack_new_pins(card, "Headset Jack",
> +					 SND_JACK_HEADSET | SND_JACK_LINEOUT |
> +					 SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +					 SND_JACK_BTN_2 | SND_JACK_BTN_3,
> +					 &pco_jack, NULL, 0);

Here, snd_soc_card_jack_new() should be used instead. Please refer 
comments in sound/soc/soc-card.c for differences between those two 
functions.

Regards,
Akihiko Odaki

> +	if (ret) {
> +		dev_err(card->dev, "HP jack creation failed %d\n", ret);
> +		return ret;
> +	}
> +
> +	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
> +	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
> +	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
> +	snd_jack_set_key(pco_jack.jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
> +
> +	ret = snd_soc_component_set_jack(component, &pco_jack, NULL);
> +	if (ret) {
> +		dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return snd_soc_dapm_add_routes(&rtd->card->dapm, nau8825_map, ARRAY_SIZE(nau8825_map));
> +}
> +
> +static int acp_nau8825_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> +	int ret;
> +
> +	ret = snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_FLL_FS,
> +				     (48000 * 256), SND_SOC_CLOCK_IN);
> +	if (ret < 0)
> +		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
> +
> +	ret = snd_soc_dai_set_pll(codec_dai, 0, 0, params_rate(params),
> +				  params_rate(params) * 256);
> +	if (ret < 0) {
> +		dev_err(rtd->dev, "can't set FLL: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static int acp_nau8825_startup(struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +
> +	runtime->hw.channels_max = 2;
> +	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
> +				   &constraints_channels);
> +
> +	runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
> +	snd_pcm_hw_constraint_list(runtime, 0,
> +				   SNDRV_PCM_HW_PARAM_RATE, &constraints_rates);
> +	return 0;
> +}
> +
> +static const struct snd_soc_ops acp_card_nau8825_ops = {
> +	.startup =  acp_nau8825_startup,
> +	.hw_params = acp_nau8825_hw_params,
> +};
> +
>   /* Declare DMIC codec components */
>   SND_SOC_DAILINK_DEF(dmic_codec,
>   		DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec", "dmic-hifi")));
> @@ -437,6 +540,8 @@ SND_SOC_DAILINK_DEF(i2s_sp,
>   	DAILINK_COMP_ARRAY(COMP_CPU("acp-i2s-sp")));
>   SND_SOC_DAILINK_DEF(sof_sp,
>   	DAILINK_COMP_ARRAY(COMP_CPU("acp-sof-sp")));
> +SND_SOC_DAILINK_DEF(sof_hs,
> +		    DAILINK_COMP_ARRAY(COMP_CPU("acp-sof-hs")));
>   SND_SOC_DAILINK_DEF(sof_dmic,
>   	DAILINK_COMP_ARRAY(COMP_CPU("acp-sof-dmic")));
>   SND_SOC_DAILINK_DEF(pdm_dmic,
> @@ -491,6 +596,31 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
>   		i++;
>   	}
>   
> +	if (drv_data->hs_cpu_id == I2S_HS) {
> +		links[i].name = "acp-headset-codec";
> +		links[i].id = HEADSET_BE_ID;
> +		links[i].cpus = sof_hs;
> +		links[i].num_cpus = ARRAY_SIZE(sof_hs);
> +		links[i].platforms = sof_component;
> +		links[i].num_platforms = ARRAY_SIZE(sof_component);
> +		links[i].dpcm_playback = 1;
> +		links[i].dpcm_capture = 1;
> +		links[i].nonatomic = true;
> +		links[i].no_pcm = 1;
> +		if (!drv_data->hs_codec_id) {
> +			/* Use dummy codec if codec id not specified */
> +			links[i].codecs = dummy_codec;
> +			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
> +		}
> +		if (drv_data->hs_codec_id == NAU8825) {
> +			links[i].codecs = nau8825;
> +			links[i].num_codecs = ARRAY_SIZE(nau8825);
> +			links[i].init = acp_card_nau8825_init;
> +			links[i].ops = &acp_card_nau8825_ops;
> +		}
> +		i++;
> +	}
> +
>   	if (drv_data->amp_cpu_id == I2S_SP) {
>   		links[i].name = "acp-amp-codec";
>   		links[i].id = AMP_BE_ID;
> @@ -523,6 +653,30 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
>   		i++;
>   	}
>   
> +	if (drv_data->amp_cpu_id == I2S_HS) {
> +		links[i].name = "acp-amp-codec";
> +		links[i].id = AMP_BE_ID;
> +		links[i].cpus = sof_hs;
> +		links[i].num_cpus = ARRAY_SIZE(sof_hs);
> +		links[i].platforms = sof_component;
> +		links[i].num_platforms = ARRAY_SIZE(sof_component);
> +		links[i].dpcm_playback = 1;
> +		links[i].nonatomic = true;
> +		links[i].no_pcm = 1;
> +		if (!drv_data->amp_codec_id) {
> +			/* Use dummy codec if codec id not specified */
> +			links[i].codecs = dummy_codec;
> +			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
> +		}
> +		if (drv_data->amp_codec_id == MAX98360A) {
> +			links[i].codecs = max98360a;
> +			links[i].num_codecs = ARRAY_SIZE(max98360a);
> +			links[i].ops = &acp_card_maxim_ops;
> +			links[i].init = acp_card_maxim_init;
> +		}
> +		i++;
> +	}
> +
>   	if (drv_data->dmic_cpu_id == DMIC) {
>   		links[i].name = "acp-dmic-codec";
>   		links[i].id = DMIC_BE_ID;
> diff --git a/sound/soc/amd/acp/acp-mach.h b/sound/soc/amd/acp/acp-mach.h
> index 5dc47cfbff10..c95ee1c52eb1 100644
> --- a/sound/soc/amd/acp/acp-mach.h
> +++ b/sound/soc/amd/acp/acp-mach.h
> @@ -26,6 +26,7 @@ enum be_id {
>   
>   enum cpu_endpoints {
>   	NONE = 0,
> +	I2S_HS,
>   	I2S_SP,
>   	I2S_BT,
>   	DMIC,
> @@ -37,6 +38,7 @@ enum codec_endpoints {
>   	RT1019,
>   	MAX98360A,
>   	RT5682S,
> +	NAU8825,
>   };
>   
>   struct acp_card_drvdata {
> @@ -49,6 +51,7 @@ struct acp_card_drvdata {
>   	unsigned int dai_fmt;
>   	struct clk *wclk;
>   	struct clk *bclk;
> +	bool soc_mclk;
>   };
>   
>   int acp_sofdsp_dai_links_create(struct snd_soc_card *card);
> diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
> index d1531cdab110..adbae809f2aa 100644
> --- a/sound/soc/amd/acp/acp-sof-mach.c
> +++ b/sound/soc/amd/acp/acp-sof-mach.c
> @@ -56,6 +56,16 @@ static struct acp_card_drvdata sof_rt5682s_max_data = {
>   	.dmic_codec_id = DMIC,
>   };
>   
> +static struct acp_card_drvdata sof_nau8825_data = {
> +	.hs_cpu_id = I2S_HS,
> +	.amp_cpu_id = I2S_HS,
> +	.dmic_cpu_id = DMIC,
> +	.hs_codec_id = NAU8825,
> +	.amp_codec_id = MAX98360A,
> +	.dmic_codec_id = DMIC,
> +	.soc_mclk = true,
> +};
> +
>   static const struct snd_kcontrol_new acp_controls[] = {
>   	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
>   	SOC_DAPM_PIN_SWITCH("Headset Mic"),
> @@ -124,6 +134,10 @@ static const struct platform_device_id board_ids[] = {
>   		.name = "rt5682s-rt1019",
>   		.driver_data = (kernel_ulong_t)&sof_rt5682s_rt1019_data
>   	},
> +	{
> +		.name = "nau8825-max",
> +		.driver_data = (kernel_ulong_t)&sof_nau8825_data
> +	},
>   	{ }
>   };
>   static struct platform_driver acp_asoc_audio = {
> @@ -143,4 +157,5 @@ MODULE_ALIAS("platform:rt5682-rt1019");
>   MODULE_ALIAS("platform:rt5682-max");
>   MODULE_ALIAS("platform:rt5682s-max");
>   MODULE_ALIAS("platform:rt5682s-rt1019");
> +MODULE_ALIAS("platform:nau8825-max");
>   MODULE_LICENSE("GPL v2");
> diff --git a/sound/soc/amd/mach-config.h b/sound/soc/amd/mach-config.h
> index 0a54567a2841..7b4c625da40d 100644
> --- a/sound/soc/amd/mach-config.h
> +++ b/sound/soc/amd/mach-config.h
> @@ -19,6 +19,7 @@
>   #define ACP_PCI_DEV_ID			0x15E2
>   
>   extern struct snd_soc_acpi_mach snd_soc_acpi_amd_sof_machines[];
> +extern struct snd_soc_acpi_mach snd_soc_acpi_amd_rmb_sof_machines[];
>   
>   struct config_entry {
>   	u32 flags;

