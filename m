Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EFF74E770
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 08:38:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3D063E7;
	Tue, 11 Jul 2023 08:37:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3D063E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689057487;
	bh=4+1OPTUKS90sS9jGvC6Wn9idI+xTKRc38R1oLorStVs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ukL0MdsvmAk9Z/mIsWp9+kN4/7GbeghzZ3Aaq/q2ApABsmJ8aCkhgmz5BkWaEdMPP
	 kk4OKLryBMEnR5PdwfYs/Y2y227JjOzYb4GZACbxcw8iHTZHAFqh2xPstW2xDQbd0A
	 XmvtySnRVSSeaG+zI/anvc5HFak8AlfOj5lz4UIY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBF3CF80290; Tue, 11 Jul 2023 08:37:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F842F80236;
	Tue, 11 Jul 2023 08:37:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38E73F80249; Tue, 11 Jul 2023 08:37:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 08134F80093
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 08:36:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08134F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ov0loFaC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689057418; x=1720593418;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4+1OPTUKS90sS9jGvC6Wn9idI+xTKRc38R1oLorStVs=;
  b=Ov0loFaCYdfkDo0BYEygWBVgxF6ZK8BSNoEoxM1iSqVTQUlG67Fvb6Xn
   cvNBMXW4iZ500y9qDedHGFUt26bY0BUJynxRwMqCx4O3pEHBJC3pM/6T6
   +89tjOIi0tdBnGRRzdJmAJTm2aFb5IzLWqbiffBRwwQE/PWGJJ54pKm/a
   NoRahkwU/uku1nNtu+DpevAjBBM5cIyUErfRa7nDD8QyOxGJ6ZBS88xMi
   4mYJkCfDNJR1+fVgUzuR85HAaWw087SMH/Y4xrptZhjcsmOx8fQ9uhrNF
   ZoaWewQvTkBOcd9VMmW3qVgHoJde4SFD7hSMNRDviXfD5xHb93co4Sauu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="362001211"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="362001211"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 23:36:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="698328881"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="698328881"
Received: from baparham-mobl.ger.corp.intel.com (HELO [10.252.44.75])
 ([10.252.44.75])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 23:36:45 -0700
Message-ID: <f12360ff-cd8a-64b6-6cdd-beec2651787c@linux.intel.com>
Date: Mon, 10 Jul 2023 09:35:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH v2] ASoC: Intel: sof_rt5682: add jsl_rt5650 board config
Content-Language: en-US
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Yong Zhi <yong.zhi@intel.com>,
 Uday M Bhat <uday.m.bhat@intel.com>, Gongjun Song <gongjun.song@intel.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Arnd Bergmann <arnd@arndb.de>, Terry Cheong <htcheong@chromium.org>,
 "Dharageswari . R" <dharageswari.r@intel.com>,
 Mac Chiang <mac.chiang@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org
References: <20230710141610.227988-1-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230710141610.227988-1-brent.lu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ASRXLEW7ZL5AGBFEMH3IU3XAW3T366MY
X-Message-ID-Hash: ASRXLEW7ZL5AGBFEMH3IU3XAW3T366MY
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ASRXLEW7ZL5AGBFEMH3IU3XAW3T366MY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/10/23 16:16, Brent Lu wrote:
> This configuration supports JSL boards which implement ALC5650 dual
> I2S interface codec. Two DAI links are added: AIF1 (on codec side) for
> headphone and AIF2 for speakers.
> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> ---
>  sound/soc/intel/boards/Kconfig                |  5 +-
>  sound/soc/intel/boards/sof_rt5682.c           | 81 ++++++++++++++++++-
>  .../intel/common/soc-acpi-intel-jsl-match.c   | 12 +++
>  3 files changed, 93 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
> index f472f603ab75..1fe830af2b84 100644
> --- a/sound/soc/intel/boards/Kconfig
> +++ b/sound/soc/intel/boards/Kconfig
> @@ -475,7 +475,7 @@ endif ## SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC || SND_SOC_SOF_HDA_AUDIO_CODEC
>  
>  if SND_SOC_SOF_HDA_LINK || SND_SOC_SOF_BAYTRAIL
>  config SND_SOC_INTEL_SOF_RT5682_MACH
> -	tristate "SOF with rt5682 codec in I2S Mode"
> +	tristate "SOF with rt5650/rt5682 codec in I2S Mode"
>  	depends on I2C && ACPI
>  	depends on ((SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC) &&\
>  		    (MFD_INTEL_LPSS || COMPILE_TEST)) ||\
> @@ -485,6 +485,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
>  	select SND_SOC_RT1011
>  	select SND_SOC_RT1015
>  	select SND_SOC_RT1015P
> +	select SND_SOC_RT5645
>  	select SND_SOC_RT5682_I2C
>  	select SND_SOC_RT5682S
>  	select SND_SOC_DMIC
> @@ -494,7 +495,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
>  	select SND_SOC_INTEL_SOF_REALTEK_COMMON
>  	help
>  	   This adds support for ASoC machine driver for SOF platforms
> -	   with rt5682 codec.
> +	   with rt5650 or rt5682 codec.
>  	   Say Y if you have such a device.
>  	   If unsure select "N".
>  
> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index 7c034d671cf3..53451c1b67f8 100644
> --- a/sound/soc/intel/boards/sof_rt5682.c
> +++ b/sound/soc/intel/boards/sof_rt5682.c
> @@ -22,6 +22,7 @@
>  #include <sound/soc-acpi.h>
>  #include "../../codecs/rt5682.h"
>  #include "../../codecs/rt5682s.h"
> +#include "../../codecs/rt5645.h"
>  #include "../../codecs/hdac_hdmi.h"
>  #include "../common/soc-intel-quirks.h"
>  #include "hda_dsp_common.h"
> @@ -60,6 +61,7 @@
>  #define SOF_MAX98390_SPEAKER_AMP_PRESENT	BIT(24)
>  #define SOF_MAX98390_TWEETER_SPEAKER_PRESENT	BIT(25)
>  #define SOF_RT1019_SPEAKER_AMP_PRESENT	BIT(26)
> +#define SOF_RT5650_HEADPHONE_CODEC_PRESENT	BIT(27)
>  
>  
>  /* Default: MCLK on, MCLK 19.2M, SSP0  */
> @@ -305,7 +307,7 @@ static int sof_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
>  	struct sof_card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
>  	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
>  	struct snd_soc_jack *jack;
> -	int ret;
> +	int ret, extra;

two lines, and rename to e.g. extra_jack_data


> +	if (sof_rt5682_quirk & SOF_RT5650_HEADPHONE_CODEC_PRESENT) {
> +		extra = SND_JACK_MICROPHONE | SND_JACK_BTN_0;
> +		ret = snd_soc_component_set_jack(component, jack, &extra);

I am a bit confused on why this wasn't set for rt5682?

> +	} else
> +		ret = snd_soc_component_set_jack(component, jack, NULL);

> +static const struct snd_soc_dapm_route rt5650_spk_dapm_routes[] = {
> +	/* speaker */
> +	{ "Left Spk", NULL, "SPOL" },
> +	{ "Right Spk", NULL, "SPOR" },
> +};
> +
>  static const struct snd_soc_dapm_route dmic_map[] = {
>  	/* digital mics */
>  	{"DMic", NULL, "SoC DMIC"},
>  };
>  
> +static int rt5650_spk_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_card *card = rtd->card;
> +	int ret;
> +
> +	ret = snd_soc_dapm_add_routes(&card->dapm, rt5650_spk_dapm_routes,
> +				      ARRAY_SIZE(rt5650_spk_dapm_routes));
> +	if (ret)
> +		dev_err(rtd->dev, "fail to add dapm routes, ret=%d\n", ret);
> +
> +	return ret;
> +}
> +
>  static int dmic_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct snd_soc_card *card = rtd->card;
> @@ -614,6 +656,17 @@ static struct snd_soc_dai_link_component rt5682s_component[] = {
>  	}
>  };
>  
> +static struct snd_soc_dai_link_component rt5650_components[] = {
> +	{
> +		.name = "i2c-10EC5650:00",
> +		.dai_name = "rt5645-aif1",
> +	},
> +	{
> +		.name = "i2c-10EC5650:00",
> +		.dai_name = "rt5645-aif2",
> +	}
> +};

can we move these definitions to realtek_common.c, chances are other
boards will also use this codec. Thanks!
