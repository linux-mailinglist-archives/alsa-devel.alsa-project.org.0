Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C1A539BB8
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jun 2022 05:35:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DD0C1820;
	Wed,  1 Jun 2022 05:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DD0C1820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654054557;
	bh=v3QaPvZgMxu7WIZ9dzByztzeoDdZKoIK8MHfqZjZRKo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vaXWU4AJxN6oHbgZvDbKimDpwqT+fUUWMgDUgzmEQ6gzGOp+cHCMEFdH+PUqIPDZ+
	 hxVnt8En/5DyLT8njZPROaMBuOcHQFyq0LZRNBbHo7XUgQEKoEuBNUpYA5EWyXHTAJ
	 RIaVSLnqQu0XnuW5XT3XaNbqRaZhfBr1LlQ/bnwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0232EF8025A;
	Wed,  1 Jun 2022 05:35:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4912EF80238; Wed,  1 Jun 2022 05:34:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBD7BF80149
 for <alsa-devel@alsa-project.org>; Wed,  1 Jun 2022 05:34:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBD7BF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nu83etTT"
Received: by mail-pl1-x633.google.com with SMTP id c2so584105plh.2
 for <alsa-devel@alsa-project.org>; Tue, 31 May 2022 20:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hdDT/6T7l0ZVb1VtMK15A9JVqcIXYuqHXeMW+nsYzMM=;
 b=nu83etTT7v4Bi61fWEcFiNcTl52/A5ff8UG4LKYXuSd6Z7u86xValOi7nAZivhRc3L
 15RlW7eFcE7F9cFL18QHvKgieiL/agFgwnpNCtLFDznR7hkPkTrIkdXOnUDfBHgiU/zV
 UhCy1p3cYOOPDCqKo1B6Tc8Oy2JqAV+R1ivrqAr50lg9tOZYulySkRjqcHQpL8jzQypo
 GIARk2JWOqO8dXJk6EMxB0V6gidYgijC3Oh38hjCBN2he22tkj5ZKCll64nReEZhrZAj
 6XngxeLnrHvmOnPHWxLXGR5z5Ei+zv7pkedOziLcItLmUw+SRKSJr1YiAXrgOX/MNQWp
 WAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hdDT/6T7l0ZVb1VtMK15A9JVqcIXYuqHXeMW+nsYzMM=;
 b=JWpEqQc3Nyl6Xr40Z5NspSd2tefx+H4vN8FyyA07Yv06F/+zWLJPIS+iJZVEc08Z7v
 RBeMfOLtzK7kx1aLmesWhUKpJLIgrzIfzasoriqAFxXIKsKHP22P4gxaLCPwBQxRO63P
 TMMJhRbId11AbcIUF/hPYO82y7tHZJkB7EISLvZA+5QAodPS2ATid7cZppTxjcVGls6P
 aDyxoKEUjOh3e42+2ovxygV9k++fK1zzskjolZPxsLYbLf9Y/F/kRPszNJuvqsN5v2qN
 B/FCZmQOUGJcd/0ghUjiRfY+Kle/IYgAuunNS9BOrqS5GjpiW/CIeHowYHgXRKSzYGFy
 QpXA==
X-Gm-Message-State: AOAM530xqnuLpmk6iCj7NPkKJxDmdKy/7HeR/SCBWMQReOrnULZTXoCs
 jyEME8pD8UGQ+e5QM/W+5FE=
X-Google-Smtp-Source: ABdhPJxeCJoE+Cj666G4co/Wy8Q/kqOihdyEW+uDJpK6y4/BL5V5vHaS4PZG6i+blycBaEzg9gyj3g==
X-Received: by 2002:a17:90a:7349:b0:1dc:9314:8699 with SMTP id
 j9-20020a17090a734900b001dc93148699mr32296801pjs.184.1654054485712; 
 Tue, 31 May 2022 20:34:45 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a170903210300b0015e8d4eb272sm270506ple.188.2022.05.31.20.34.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 20:34:44 -0700 (PDT)
Message-ID: <ea45517c-82cd-0c2d-71cb-770e06b7e957@gmail.com>
Date: Wed, 1 Jun 2022 12:34:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 1/2] ASoC: amd: acp: Add support for nau8825 and
 max98360 card
Content-Language: en-US
To: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20220531120813.47116-1-Vsujithkumar.Reddy@amd.com>
 <20220531120813.47116-2-Vsujithkumar.Reddy@amd.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220531120813.47116-2-Vsujithkumar.Reddy@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sunil-kumar.Dommati@amd.com, Geert Uytterhoeven <geert+renesas@glider.be>,
 ajitkumar.pandey@amd.com, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jia-Ju Bai <baijiaju1990@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>

On 2022/05/31 21:08, V sujith kumar Reddy wrote:
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
> index 5cbc82eca4c9..3b9f851bf50d 100644
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
> +		.pdata = &acp_quirk_data,
> +		.fw_filename = "sof-rmb.ri",
> +		.sof_tplg_filename = "sof-acp-rmb.tplg",
> +	},
> +	{
> +		.id = "10508825",
> +		.drv_name = "nau8825-max",
> +		.pdata = &acp_quirk_data,
> +		.machine_quirk = snd_soc_acpi_codec_list,
> +		.quirk_data = &amp_max,
> +		.fw_filename = "sof-rmb.ri",
> +		.sof_tplg_filename = "sof-rmb-nau8825-max98360.tplg",
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
> index 6ae454bf60af..a03b396d96bb 100644
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
> +	ret = snd_soc_card_jack_new(card, "Headset Jack",
> +					 SND_JACK_HEADSET | SND_JACK_LINEOUT |
> +					 SND_JACK_BTN_0 | SND_JACK_BTN_1 |
> +					 SND_JACK_BTN_2 | SND_JACK_BTN_3,
> +					 &pco_jack);
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
>   	u32 flags
