Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF8326493D
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 18:00:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 147B11697;
	Thu, 10 Sep 2020 17:59:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 147B11697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599753618;
	bh=iOzjE3nM7caOTEDriPK44DNDf1WCCjcMAhedA+1dF8Y=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mtnyf3psavjc3tP1UPEiCOmW6mpNnR+5R3XQ+qFSm+fUmwTIJCHZ4wASaDZQllOdh
	 I6PkPfI7SQeuh7+eBp1gWdXRncyelp2ylSC3aCpZw4baGYnbBtanXcWQThYKTNJW7d
	 M4ZRRSaudnzCMtd8ytJPBh1dYjj/i3NcW6aqWEmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17338F8026F;
	Thu, 10 Sep 2020 17:58:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8B52F80277; Thu, 10 Sep 2020 17:58:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5CAAF8026F
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 17:58:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5CAAF8026F
IronPort-SDR: ELvwoWP+TK1In2Bk6mr1vE84ibuI0UroviE8EHgh13tADDnm5W/i6Zmu04urkNcFLJngfzsh/x
 b4jRD++WSvAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="138086603"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="138086603"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 08:58:07 -0700
IronPort-SDR: 3Bg/cfY17+l26vMZ6wYEXHbW4zHNvdWRMGyUZvLSlVEXd8Q1/wGRyOW2aGLqCEfub1rlWLwR96
 yWkdbYKEW0Zw==
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="449644546"
Received: from mulimedw-mobl.amr.corp.intel.com (HELO [10.213.173.59])
 ([10.213.173.59])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 08:58:05 -0700
Subject: Re: [PATCH V4] ASoC: Intel: boards: Use FS as nau8825 sysclk in
 nau88125_* machine
To: Radoslaw Biernacki <rad@semihalf.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20200910154056.30962-1-rad@semihalf.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <333f3365-1ef4-068a-5845-feb01bf46d03@linux.intel.com>
Date: Thu, 10 Sep 2020 10:58:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910154056.30962-1-rad@semihalf.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Lech Betlej <Lech.Betlej@intel.com>, alsa-devel@alsa-project.org,
 Todd Broch <tbroch@google.com>, Harshapriya <harshapriya.n@intel.com>,
 John Hsu <KCHSU0@nuvoton.com>, linux-kernel@vger.kernel.org,
 michal.sienkiewicz@intel.com, Ben Zhang <benzh@chromium.org>,
 Mac Chiang <mac.chiang@intel.com>, Yong Zhi <yong.zhi@intel.com>,
 Marcin Wojtas <mw@semihalf.com>,
 Vamshi Krishna <vamshi.krishna.gopal@intel.com>,
 Alex Levin <levinale@google.com>
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

almost there, only couple of typos below. The comments are really good now!

> +static int skylake_nau8825_trigger(struct snd_pcm_substream *substream, int cmd)
>   {
>   	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_pcm_runtime *runtime = substream->runtime;
>   	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> -	int ret;
> -
> -	ret = snd_soc_dai_set_sysclk(codec_dai,
> -			NAU8825_CLK_MCLK, 24000000, SND_SOC_CLOCK_IN);
> -
> -	if (ret < 0)
> -		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
> +	int ret = 0;
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +		/* Since 256xFS clocks cannot be generated by SKL, the NAU8825
> +		 * is configured to re-generate its system clock from the BCLK
> +		 * using the FLL.
> +		 * We must switch system clock (FLL to use BCLK) here as it is
> +		 * not given eariler by FW (like in hw_param). We let nau8825 to

typo: earlier

> +		 * use internal VCO clock till now which reduces the audiable

type: audible

> +		 * pop's. */
> +
> +		/* fall through */

I don't think it's required if there's no code?

> +
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +		/* Once device resumes, the system will only enable power
> +		 * sequence for playback without doing hardware parameter, audio
> +		 * format, and PLL configure. In the mean time, the jack
> +		 * detecion sequence has changed PLL parameters and switched to

typo: detection

> +		 * internal clock. Thus, the playback signal distorted without
> +		 * correct PLL parameters. Therefore we need to configure PLL
> +		 * again */
> +		ret = snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_FLL_FS, 0,
> +					     SND_SOC_CLOCK_IN);
> +		if (ret < 0) {
> +			dev_err(codec_dai->dev, "can't set FS clock %d\n", ret);
> +			break;
> +		}
> +		ret = snd_soc_dai_set_pll(codec_dai, 0, 0, runtime->rate,
> +					  runtime->rate * 256);
> +		if (ret < 0)
> +			dev_err(codec_dai->dev, "can't set FLL: %d\n", ret);
> +		break;
> +	}

same comments for the other machine driver.
>   
>   	return ret;
>   }
>   
> -static const struct snd_soc_ops skylake_nau8825_ops = {
> -	.hw_params = skylake_nau8825_hw_params,
> +static struct snd_soc_ops skylake_nau8825_ops = {
> +	.trigger = skylake_nau8825_trigger,
>   };
>   
>   static int skylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
> diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
> index 4b317bcf6ea0..d076f19f9b78 100644
> --- a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
> +++ b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
> @@ -12,6 +12,7 @@
>   
>   #include <linux/module.h>
>   #include <linux/platform_device.h>
> +#include <linux/delay.h>
>   #include <sound/core.h>
>   #include <sound/pcm.h>
>   #include <sound/soc.h>
> @@ -57,12 +58,12 @@ static const struct snd_kcontrol_new skylake_controls[] = {
>   };
>   
>   static int platform_clock_control(struct snd_soc_dapm_widget *w,
> -		struct snd_kcontrol *k, int  event)
> +		struct snd_kcontrol *k, int event)
>   {
>   	struct snd_soc_dapm_context *dapm = w->dapm;
>   	struct snd_soc_card *card = dapm->card;
>   	struct snd_soc_dai *codec_dai;
> -	int ret;
> +	int ret = 0;
>   
>   	codec_dai = snd_soc_card_get_codec_dai(card, SKL_NUVOTON_CODEC_DAI);
>   	if (!codec_dai) {
> @@ -70,14 +71,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
>   		return -EIO;
>   	}
>   
> -	if (SND_SOC_DAPM_EVENT_ON(event)) {
> -		ret = snd_soc_dai_set_sysclk(codec_dai,
> -				NAU8825_CLK_MCLK, 24000000, SND_SOC_CLOCK_IN);
> -		if (ret < 0) {
> -			dev_err(card->dev, "set sysclk err = %d\n", ret);
> -			return -EIO;
> -		}
> -	} else {
> +	if (!SND_SOC_DAPM_EVENT_ON(event)) {
>   		ret = snd_soc_dai_set_sysclk(codec_dai,
>   				NAU8825_CLK_INTERNAL, 0, SND_SOC_CLOCK_IN);
>   		if (ret < 0) {
> @@ -85,6 +79,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
>   			return -EIO;
>   		}
>   	}
> +
>   	return ret;
>   }
>   
> @@ -344,24 +339,51 @@ static int skylake_dmic_fixup(struct snd_soc_pcm_runtime *rtd,
>   	return 0;
>   }
>   
> -static int skylake_nau8825_hw_params(struct snd_pcm_substream *substream,
> -	struct snd_pcm_hw_params *params)
> +static int skylake_nau8825_trigger(struct snd_pcm_substream *substream, int cmd)
>   {
>   	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_pcm_runtime *runtime = substream->runtime;
>   	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
> -	int ret;
> -
> -	ret = snd_soc_dai_set_sysclk(codec_dai,
> -			NAU8825_CLK_MCLK, 24000000, SND_SOC_CLOCK_IN);
> -
> -	if (ret < 0)
> -		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n", ret);
> +	int ret = 0;
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +		/* Since 256xFS clocks cannot be generated by SKL, the NAU8825
> +		 * is configured to re-generate its system clock from the BCLK
> +		 * using the FLL.
> +		 * We must switch system clock (FLL to use BCLK) here as it is
> +		 * not given eariler by FW (like in hw_param). We let nau8825 to
> +		 * use internal VCO clock till now which reduces the audiable
> +		 * pop's. */
> +
> +		/* fall through */
> +
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +		/* Once device resumes, the system will only enable power
> +		 * sequence for playback without doing hardware parameter, audio
> +		 * format, and PLL configure. In the mean time, the jack
> +		 * detecion sequence has changed PLL parameters and switched to
> +		 * internal clock. Thus, the playback signal distorted without
> +		 * correct PLL parameters. Therefore we need to configure PLL
> +		 * again */
> +		ret = snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_FLL_FS, 0,
> +					     SND_SOC_CLOCK_IN);
> +		if (ret < 0) {
> +			dev_err(codec_dai->dev, "can't set FS clock %d\n", ret);
> +			break;
> +		}
> +		ret = snd_soc_dai_set_pll(codec_dai, 0, 0, runtime->rate,
> +					  runtime->rate * 256);
> +		if (ret < 0)
> +			dev_err(codec_dai->dev, "can't set FLL: %d\n", ret);
> +		break;
> +	}
>   
>   	return ret;
>   }
>   
> -static const struct snd_soc_ops skylake_nau8825_ops = {
> -	.hw_params = skylake_nau8825_hw_params,
> +static struct snd_soc_ops skylake_nau8825_ops = {
> +	.trigger = skylake_nau8825_trigger,
>   };
>   
>   static const unsigned int channels_dmic[] = {
> @@ -582,6 +604,7 @@ static struct snd_soc_dai_link skylake_dais[] = {
>   		.init = skylake_ssm4567_codec_init,
>   		.ignore_pmdown_time = 1,
>   		.be_hw_params_fixup = skylake_ssp_fixup,
> +		.ops = &skylake_nau8825_ops,
>   		.dpcm_playback = 1,
>   		.dpcm_capture = 1,
>   		SND_SOC_DAILINK_REG(ssp0_pin, ssp0_codec, platform),
> 
