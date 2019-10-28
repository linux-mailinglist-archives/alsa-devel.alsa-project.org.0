Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC917E77A1
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 18:33:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2891220A0;
	Mon, 28 Oct 2019 18:32:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2891220A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572284027;
	bh=YdusZrW/jh8tQj+nUXWd8KqUf4AePoenLIa+GuZeORE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uqxcd23OILlJw+CNNBOSvKUOt2HmQbeU6GXyYbkU5hj+ZGx/2Il0GZhIkrqkJZECf
	 XO8CxUPWKEWWC2OfEqBeD+6ocoGwHENDFyDF39zjVxjtJaDxNrL1sC6oFNbrox8EUn
	 wB7jZwXisTygiB6prJufcOKHSVD8jB7TvRP0ivII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78F08F802BD;
	Mon, 28 Oct 2019 18:32:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF431F80361; Mon, 28 Oct 2019 18:32:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6CE5F80145
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 18:31:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6CE5F80145
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 10:31:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,240,1569308400"; d="scan'208";a="229764451"
Received: from jshaw2-mobl2.amr.corp.intel.com (HELO [10.252.142.88])
 ([10.252.142.88])
 by fmsmga002.fm.intel.com with ESMTP; 28 Oct 2019 10:31:51 -0700
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20191028164624.14334-1-perex@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4224f960-1072-7334-c7a4-bcaec504501f@linux.intel.com>
Date: Mon, 28 Oct 2019 12:31:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191028164624.14334-1-perex@perex.cz>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: intel - fix the card names
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



On 10/28/19 11:46 AM, Jaroslav Kysela wrote:
> Those strings are exposed to the user space as the
> card name thus used in the GUIs. The common
> standard is to avoid '_' here. The worst case
> is 'sof-skl_hda_card' string.

We're likely to break a couple of setups with these changes (UCM files 
need similar renaming), but in hindsight the initial naming was a 
mistake, and since all these platforms are still going through 
development there isn't a huge risk impacting a very large user base.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> 
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Mark Brown <broonie@kernel.org>
> ---
>   sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c | 2 +-
>   sound/soc/intel/boards/skl_hda_dsp_generic.c        | 2 +-
>   sound/soc/intel/boards/sof_rt5682.c                 | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> index 74dda8784f1a..d14ca327c684 100644
> --- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> +++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
> @@ -623,7 +623,7 @@ static int kabylake_card_late_probe(struct snd_soc_card *card)
>    * kabylake audio machine driver for  MAX98927 + RT5514 + RT5663
>    */
>   static struct snd_soc_card kabylake_audio_card = {
> -	.name = "kbl_r5514_5663_max",
> +	.name = "kbl-r5514-5663-max",
>   	.owner = THIS_MODULE,
>   	.dai_link = kabylake_dais,
>   	.num_links = ARRAY_SIZE(kabylake_dais),
> diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
> index 1778acdc367c..e8d676c192f6 100644
> --- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
> +++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
> @@ -90,7 +90,7 @@ skl_hda_add_dai_link(struct snd_soc_card *card, struct snd_soc_dai_link *link)
>   }
>   
>   static struct snd_soc_card hda_soc_card = {
> -	.name = "skl_hda_card",
> +	.name = "hda-dsp",
>   	.owner = THIS_MODULE,
>   	.dai_link = skl_hda_be_dai_links,
>   	.dapm_widgets = skl_hda_widgets,
> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index 4f6e58c3954a..320a9b9273db 100644
> --- a/sound/soc/intel/boards/sof_rt5682.c
> +++ b/sound/soc/intel/boards/sof_rt5682.c
> @@ -370,7 +370,7 @@ static int dmic_init(struct snd_soc_pcm_runtime *rtd)
>   
>   /* sof audio machine driver for rt5682 codec */
>   static struct snd_soc_card sof_audio_card_rt5682 = {
> -	.name = "sof_rt5682",
> +	.name = "rt5682", /* the sof- prefix is added by the core */
>   	.owner = THIS_MODULE,
>   	.controls = sof_controls,
>   	.num_controls = ARRAY_SIZE(sof_controls),
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
