Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD0534AEC
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 16:49:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 925451673;
	Tue,  4 Jun 2019 16:49:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 925451673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559659798;
	bh=NUVcciXkj8RjiND3Kw57gu9mZFvlfYmc1jKK2NHa7wI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AiIu26mPs+FQfmq2T+0OpwT01yu7CTGLOrdMqPo2S0QJOHGXFGYv9iupBQLRFaO7L
	 Xlr5c6GQ34zK8p7fUOMmRgIv16uxgIoqLtOBlMNWYx+MXjf540H/OvJYyg1ADfK0hR
	 siHSVxiaOqgXRywlPubHf7mh0wL7VvNjcX//eQUE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01869F896FE;
	Tue,  4 Jun 2019 16:48:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E489CF896F7; Tue,  4 Jun 2019 16:48:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CD83F80054
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 16:48:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CD83F80054
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 07:48:06 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 04 Jun 2019 07:48:05 -0700
Received: from kwong4-mobl.amr.corp.intel.com (unknown [10.252.203.122])
 by linux.intel.com (Postfix) with ESMTP id 5FCCD5803EA;
 Tue,  4 Jun 2019 07:48:04 -0700 (PDT)
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>, linux-kernel@vger.kernel.org
References: <20190604104909.112984-1-yuhsuan@chromium.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5de28b91-2d87-f013-3438-8708160db63d@linux.intel.com>
Date: Tue, 4 Jun 2019 09:48:04 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190604104909.112984-1-yuhsuan@chromium.org>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
 Mark Brown <broonie@kernel.org>, dgreid@chromium.org, cychiang@chromium.org
Subject: Re: [alsa-devel] [PATCH v4] ASoC: max98090: remove 24-bit format
 support if RJ is 0
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

On 6/4/19 5:49 AM, Yu-Hsuan Hsu wrote:
> The supported formats are S16_LE and S24_LE now. However, by datasheet
> of max98090, S24_LE is only supported when it is in the right justified
> mode. We should remove 24-bit format if it is not in that mode to avoid
> triggering error.
> 
> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> ---
>   Remove Change-Id.
> 
>   sound/soc/codecs/max98090.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
> index 7619ea31ab50..ada8c25e643d 100644
> --- a/sound/soc/codecs/max98090.c
> +++ b/sound/soc/codecs/max98090.c
> @@ -1909,6 +1909,21 @@ static int max98090_configure_dmic(struct max98090_priv *max98090,
>   	return 0;
>   }
>   
> +static int max98090_dai_startup(struct snd_pcm_substream *substream,
> +				struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct max98090_priv *max98090 = snd_soc_component_get_drvdata(component);
> +	unsigned int fmt = max98090->dai_fmt;
> +
> +	/* Remove 24-bit format support if it is not in right justified mode. */
> +	if ((fmt & SND_SOC_DAIFMT_FORMAT_MASK) != SND_SOC_DAIFMT_RIGHT_J) {
> +		substream->runtime->hw.formats = SNDRV_PCM_FMTBIT_S16_LE;
> +		snd_pcm_hw_constraint_msbits(substream->runtime, 0, 16, 16);
> +	}
> +	return 0;
> +}

The data sheet is ambiguous, it states that 24-bit data is supported in 
RJ mode when TDM is 0. It doesn't say TDM can only support 16 bits.

That said, it's not clear to me if TDM is supported or not in this 
driver, there are multiple references to tdm_slots but DSP_A and DSP_B 
are not supported.

> +
>   static int max98090_dai_hw_params(struct snd_pcm_substream *substream,
>   				   struct snd_pcm_hw_params *params,
>   				   struct snd_soc_dai *dai)
> @@ -2316,6 +2331,7 @@ EXPORT_SYMBOL_GPL(max98090_mic_detect);
>   #define MAX98090_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
>   
>   static const struct snd_soc_dai_ops max98090_dai_ops = {
> +	.startup = max98090_dai_startup,
>   	.set_sysclk = max98090_dai_set_sysclk,
>   	.set_fmt = max98090_dai_set_fmt,
>   	.set_tdm_slot = max98090_set_tdm_slot,
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
