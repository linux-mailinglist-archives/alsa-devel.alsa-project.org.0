Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F01B749B65
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 09:48:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79E1316F8;
	Tue, 18 Jun 2019 09:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79E1316F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560844097;
	bh=XZup5GjqLJT2DZkngUifywIbf1gkhIIutfOlhavl+1E=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SQwWg2VbFN/0aG+EADlKc3Ga5LD7uk+392fmrZ2xRwGV7LFF+Qq9P0qoaOwN3Rfs4
	 Lb5HlhKE9vVJrcC+NN/Kj2R0We29sSwvi57gnbfEOOjgcdL6aSTUNbUDcyzDsgUcjD
	 zohopk+eH+/Qrw6PLKijgiaMozQ4Az2p3Z85dohY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3EBCF896F4;
	Tue, 18 Jun 2019 09:46:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1489EF896F4; Tue, 18 Jun 2019 09:46:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DDBFF80CC4
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 09:46:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DDBFF80CC4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jun 2019 00:46:26 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by orsmga006.jf.intel.com with ESMTP; 18 Jun 2019 00:46:25 -0700
Received: from rkammarx-mobl3.ger.corp.intel.com (unknown [10.252.61.163])
 by linux.intel.com (Postfix) with ESMTP id 414B85801A8;
 Tue, 18 Jun 2019 00:46:24 -0700 (PDT)
To: Tzung-Bi Shih <tzungbi@google.com>, broonie@kernel.org
References: <20190618070503.36310-1-tzungbi@google.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f3ccd6a2-a9b1-15a6-6b0f-b044a2def5d7@linux.intel.com>
Date: Tue, 18 Jun 2019 09:46:24 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190618070503.36310-1-tzungbi@google.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, dgreid@google.com, cychiang@google.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: skl: extract common function
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

On 6/18/19 9:05 AM, Tzung-Bi Shih wrote:
> Extract common logic to a function to avoid duplicate code.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> Refactor HDMI init to as most Intel machine drivers did, e.g.
> kbl_da7219_max98357a.c.

HDMI support is a mess for sure, but I am not sure this is the right way 
to refactor the code. See e.g. bxt_da7219_max98357a, a single init 
callback was used. you can use dai->id to manage the right offset,

pcm->device = SKL_DPCM_AUDIO_HDMI1_PB + dai->id; or
pcm->device = dai->id;

instead of hard-coding the values in a parameter.

> 
>   .../soc/intel/boards/skl_nau88l25_max98357a.c | 39 +++++-------------
>   sound/soc/intel/boards/skl_nau88l25_ssm4567.c | 40 +++++--------------
>   2 files changed, 18 insertions(+), 61 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/skl_nau88l25_max98357a.c b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
> index 3ce8efbeed12..485614c4fa47 100644
> --- a/sound/soc/intel/boards/skl_nau88l25_max98357a.c
> +++ b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
> @@ -179,7 +179,7 @@ static int skylake_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
>   	return ret;
>   }
>   
> -static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
> +static int skylake_hdmi_init(struct snd_soc_pcm_runtime *rtd, int device)
>   {
>   	struct skl_nau8825_private *ctx = snd_soc_card_get_drvdata(rtd->card);
>   	struct snd_soc_dai *dai = rtd->codec_dai;
> @@ -189,7 +189,7 @@ static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
>   	if (!pcm)
>   		return -ENOMEM;
>   
> -	pcm->device = SKL_DPCM_AUDIO_HDMI1_PB;
> +	pcm->device = device;
>   	pcm->codec_dai = dai;
>   
>   	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
> @@ -197,40 +197,19 @@ static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
>   	return 0;
>   }
>   
> -static int skylake_hdmi2_init(struct snd_soc_pcm_runtime *rtd)
> +static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
>   {
> -	struct skl_nau8825_private *ctx = snd_soc_card_get_drvdata(rtd->card);
> -	struct snd_soc_dai *dai = rtd->codec_dai;
> -	struct skl_hdmi_pcm *pcm;
> -
> -	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
> -	if (!pcm)
> -		return -ENOMEM;
> -
> -	pcm->device = SKL_DPCM_AUDIO_HDMI2_PB;
> -	pcm->codec_dai = dai;
> -
> -	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
> +	return skylake_hdmi_init(rtd, SKL_DPCM_AUDIO_HDMI1_PB);
> +}
>   
> -	return 0;
> +static int skylake_hdmi2_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	return skylake_hdmi_init(rtd, SKL_DPCM_AUDIO_HDMI2_PB);
>   }
>   
>   static int skylake_hdmi3_init(struct snd_soc_pcm_runtime *rtd)
>   {
> -	struct skl_nau8825_private *ctx = snd_soc_card_get_drvdata(rtd->card);
> -	struct snd_soc_dai *dai = rtd->codec_dai;
> -	struct skl_hdmi_pcm *pcm;
> -
> -	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
> -	if (!pcm)
> -		return -ENOMEM;
> -
> -	pcm->device = SKL_DPCM_AUDIO_HDMI3_PB;
> -	pcm->codec_dai = dai;
> -
> -	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
> -
> -	return 0;
> +	return skylake_hdmi_init(rtd, SKL_DPCM_AUDIO_HDMI3_PB);
>   }
>   
>   static int skylake_nau8825_fe_init(struct snd_soc_pcm_runtime *rtd)
> diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
> index 1a7ac8bdf543..772cbd6940db 100644
> --- a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
> +++ b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
> @@ -198,7 +198,7 @@ static int skylake_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
>   	return ret;
>   }
>   
> -static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
> +static int skylake_hdmi_init(struct snd_soc_pcm_runtime *rtd, int device)
>   {
>   	struct skl_nau88125_private *ctx = snd_soc_card_get_drvdata(rtd->card);
>   	struct snd_soc_dai *dai = rtd->codec_dai;
> @@ -208,7 +208,7 @@ static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
>   	if (!pcm)
>   		return -ENOMEM;
>   
> -	pcm->device = SKL_DPCM_AUDIO_HDMI1_PB;
> +	pcm->device = device;
>   	pcm->codec_dai = dai;
>   
>   	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
> @@ -216,41 +216,19 @@ static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
>   	return 0;
>   }
>   
> -static int skylake_hdmi2_init(struct snd_soc_pcm_runtime *rtd)
> +static int skylake_hdmi1_init(struct snd_soc_pcm_runtime *rtd)
>   {
> -	struct skl_nau88125_private *ctx = snd_soc_card_get_drvdata(rtd->card);
> -	struct snd_soc_dai *dai = rtd->codec_dai;
> -	struct skl_hdmi_pcm *pcm;
> -
> -	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
> -	if (!pcm)
> -		return -ENOMEM;
> -
> -	pcm->device = SKL_DPCM_AUDIO_HDMI2_PB;
> -	pcm->codec_dai = dai;
> -
> -	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
> -
> -	return 0;
> +	return skylake_hdmi_init(rtd, SKL_DPCM_AUDIO_HDMI1_PB);
>   }
>   
> +static int skylake_hdmi2_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	return skylake_hdmi_init(rtd, SKL_DPCM_AUDIO_HDMI2_PB);
> +}
>   
>   static int skylake_hdmi3_init(struct snd_soc_pcm_runtime *rtd)
>   {
> -	struct skl_nau88125_private *ctx = snd_soc_card_get_drvdata(rtd->card);
> -	struct snd_soc_dai *dai = rtd->codec_dai;
> -	struct skl_hdmi_pcm *pcm;
> -
> -	pcm = devm_kzalloc(rtd->card->dev, sizeof(*pcm), GFP_KERNEL);
> -	if (!pcm)
> -		return -ENOMEM;
> -
> -	pcm->device = SKL_DPCM_AUDIO_HDMI3_PB;
> -	pcm->codec_dai = dai;
> -
> -	list_add_tail(&pcm->head, &ctx->hdmi_pcm_list);
> -
> -	return 0;
> +	return skylake_hdmi_init(rtd, SKL_DPCM_AUDIO_HDMI3_PB);
>   }
>   
>   static int skylake_nau8825_fe_init(struct snd_soc_pcm_runtime *rtd)
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
