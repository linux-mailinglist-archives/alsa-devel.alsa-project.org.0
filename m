Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8741511FBE
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 18:10:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EABDC1812;
	Thu,  2 May 2019 18:09:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EABDC1812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556813403;
	bh=JOKgczLBYRLoEOgQoppNyn4s8AAxvSRn9OYQUBkuuik=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L9ILSNHybgr5bCMXJ/D5gwXMyKFVO+8HfUn1nj62w7iqCzvfNNjctF3cm9Ov1aY6I
	 3SFPdqEicLiPMU9ORHnZnzurlcuMjCer4bLNowI0HPG8oDkVJuwIkP8m/pucoygAvX
	 tUIYWfuo3Is1Y4Js8Y77Yy6hzAuL3NQMpVon77Xg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80C4AF896E3;
	Thu,  2 May 2019 18:08:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65B29F896AA; Thu,  2 May 2019 18:08:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D485DF8075A
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 18:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D485DF8075A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 May 2019 09:08:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,422,1549958400"; d="scan'208";a="320881004"
Received: from sfloyd-t480s.amr.corp.intel.com (HELO [10.251.147.239])
 ([10.251.147.239])
 by orsmga005.jf.intel.com with ESMTP; 02 May 2019 09:08:09 -0700
To: mac.chiang@intel.com, alsa-devel@alsa-project.org
References: <1556780786-23805-1-git-send-email-mac.chiang@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9a1fd4d6-ac57-d27d-3aec-022c2c0cce12@linux.intel.com>
Date: Thu, 2 May 2019 11:08:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556780786-23805-1-git-send-email-mac.chiang@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, chintan.m.patel@intel.com, jenny.tc@intel.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: boards: kbl_da7219_max98927:
 add dai_trigger function
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 5/2/19 2:06 AM, mac.chiang@intel.com wrote:
> From: Mac Chiang <mac.chiang@intel.com>
> 
> amplifier feedback is not modeled as being dependent on any active
> output. Even when there is no playback happening, parts of the graph,
> specifically the IV sense->speaker protection->output remains active
> and this prevents the DSP from entering low-power states.
> 
> This patch suggest a machine driver level approach where the speaker
> pins are enabled/disabled dynamically depending on stream start/stop
> events. DPAM graph representations show the feedback loop is indeed
> disabled and low-power states can be reached.
> 
> Signed-off-by: Jenny TC <jenny.tc@intel.com>
> Signed-off-by: Harshapriya.n <harshapriya.n@intel.com>
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>

I am confused here.

There was a first patch sent on March 1, then updates posted by Jenny TC 
with a v3 that I acked on March 8, but there's also a v4 on April 1.

So is this the same as v4? if yes why did you drop the change log or not 
add a note it's a resend? If no, what has changed?

> ---
>   sound/soc/intel/boards/kbl_da7219_max98927.c | 73 +++++++++++++++++++++++++++-
>   1 file changed, 71 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
> index f72a7bf..1efe7fd 100644
> --- a/sound/soc/intel/boards/kbl_da7219_max98927.c
> +++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
> @@ -219,8 +219,60 @@ static int kabylake_ssp0_hw_params(struct snd_pcm_substream *substream,
>   	return 0;
>   }
>   
> +static int kabylake_ssp0_trigger(struct snd_pcm_substream *substream, int cmd)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	int j, ret;
> +
> +	for (j = 0; j < rtd->num_codecs; j++) {
> +		struct snd_soc_dai *codec_dai = rtd->codec_dais[j];
> +		const char *name = codec_dai->component->name;
> +		struct snd_soc_component *component = codec_dai->component;
> +		struct snd_soc_dapm_context *dapm =
> +				snd_soc_component_get_dapm(component);
> +		char pin_name[20];
> +
> +		if (strcmp(name, MAX98927_DEV0_NAME) &&
> +			strcmp(name, MAX98927_DEV1_NAME) &&
> +			strcmp(name, MAX98373_DEV0_NAME) &&
> +			strcmp(name, MAX98373_DEV1_NAME))
> +			continue;
> +
> +		snprintf(pin_name, ARRAY_SIZE(pin_name), "%s Spk",
> +			codec_dai->component->name_prefix);
> +
> +		switch (cmd) {
> +		case SNDRV_PCM_TRIGGER_START:
> +		case SNDRV_PCM_TRIGGER_RESUME:
> +		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +			ret = snd_soc_dapm_enable_pin(dapm, pin_name);
> +			if (ret) {
> +				dev_err(rtd->dev, "failed to enable %s: %d\n",
> +				pin_name, ret);
> +				return ret;
> +			}
> +			snd_soc_dapm_sync(dapm);
> +			break;
> +		case SNDRV_PCM_TRIGGER_STOP:
> +		case SNDRV_PCM_TRIGGER_SUSPEND:
> +		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +			ret = snd_soc_dapm_disable_pin(dapm, pin_name);
> +			if (ret) {
> +				dev_err(rtd->dev, "failed to disable %s: %d\n",
> +				pin_name, ret);
> +				return ret;
> +			}
> +			snd_soc_dapm_sync(dapm);
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static struct snd_soc_ops kabylake_ssp0_ops = {
>   	.hw_params = kabylake_ssp0_hw_params,
> +	.trigger = kabylake_ssp0_trigger,
>   };
>   
>   static int kabylake_ssp_fixup(struct snd_soc_pcm_runtime *rtd,
> @@ -950,6 +1002,7 @@ static int kabylake_card_late_probe(struct snd_soc_card *card)
>   {
>   	struct kbl_codec_private *ctx = snd_soc_card_get_drvdata(card);
>   	struct kbl_hdmi_pcm *pcm;
> +	struct snd_soc_dapm_context *dapm = &card->dapm;
>   	struct snd_soc_component *component = NULL;
>   	int err, i = 0;
>   	char jack_name[NAME_SIZE];
> @@ -976,9 +1029,25 @@ static int kabylake_card_late_probe(struct snd_soc_card *card)
>   	if (!component)
>   		return -EINVAL;
>   
> -	return hdac_hdmi_jack_port_init(component, &card->dapm);
>   
> -	return 0;
> +	err = hdac_hdmi_jack_port_init(component, &card->dapm);
> +
> +	if (err < 0)
> +		return err;
> +
> +	err = snd_soc_dapm_disable_pin(dapm, "Left Spk");
> +	if (err) {
> +		dev_err(card->dev, "failed to disable Left Spk: %d\n", err);
> +		return err;
> +	}
> +
> +	err = snd_soc_dapm_disable_pin(dapm, "Right Spk");
> +	if (err) {
> +		dev_err(card->dev, "failed to disable Right Spk: %d\n", err);
> +		return err;
> +	}
> +
> +	return snd_soc_dapm_sync(dapm);
>   }
>   
>   /* kabylake audio machine driver for SPT + DA7219 */
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
