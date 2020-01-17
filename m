Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ADA1408F3
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2020 12:32:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 958E31794;
	Fri, 17 Jan 2020 12:31:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 958E31794
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579260755;
	bh=XNuiw2rusRtg0EcV5uwWiYBkZYACwtMU+KIS7JrImvM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VDIEB7Cp4u1RpABYyGfTrxVM82OsOVsEXItUoL+y/LhKRzeSog/tYoQWDIFQ3RrCB
	 BiyU7IdwMEE0XAkFC+nRRolUYgBZa0EcGhj2S8QN4W5/5IHgmSS+nFe7yxXBbnGM0d
	 +aL0sK3urQ25g51hF4CO9gKrk2WsoIn4/W7EQOlM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD526F8027C;
	Fri, 17 Jan 2020 12:28:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A94E9F8014B; Fri, 17 Jan 2020 12:28:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CDCDF800E9
 for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2020 12:28:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CDCDF800E9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jan 2020 03:28:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,330,1574150400"; d="scan'208";a="257769908"
Received: from kaiwenhs-mobl.amr.corp.intel.com (HELO [10.251.11.205])
 ([10.251.11.205])
 by fmsmga002.fm.intel.com with ESMTP; 17 Jan 2020 03:28:33 -0800
To: Bard liao <yung-chuan.liao@linux.intel.com>, broonie@kernel.org,
 tiwai@suse.de
References: <20200116202620.7401-1-yung-chuan.liao@linux.intel.com>
 <20200116202620.7401-4-yung-chuan.liao@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9c698222-609d-c036-7a60-878105e2fb59@linux.intel.com>
Date: Fri, 17 Jan 2020 05:19:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200116202620.7401-4-yung-chuan.liao@linux.intel.com>
Content-Language: en-US
Cc: liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 bard.liao@intel.com, kuninori.morimoto.gx@renesas.com
Subject: Re: [alsa-devel] [PATCH RFC v3 3/4] ASoC: Add multiple CPU DAI
 support in DAPM
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



On 1/16/20 2:26 PM, Bard liao wrote:
> From: Shreyas NC <shreyas.nc@intel.com>
> 
> DAPM handles DAIs during soc_dapm_stream_event() and during addition
> and creation of DAI widgets i.e., dapm_add_valid_dai_widget() and
> dapm_connect_dai_link_widgets().
> 
> Extend these functions to handle multiple cpu dai.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Shreyas NC <shreyas.nc@intel.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>   sound/soc/soc-dapm.c | 131 +++++++++++++++++++++++++------------------
>   1 file changed, 75 insertions(+), 56 deletions(-)
> 
> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
> index 442846f12cd4..7a0538b45faf 100644
> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -4274,16 +4274,15 @@ int snd_soc_dapm_link_dai_widgets(struct snd_soc_card *card)
>   	return 0;
>   }
>   
> -static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
> -					  struct snd_soc_pcm_runtime *rtd)
> +static void dapm_add_valid_dai_widget(struct snd_soc_card *card,
> +				      struct snd_soc_pcm_runtime *rtd,
> +				      struct snd_soc_dai *codec_dai,
> +				      struct snd_soc_dai *cpu_dai)

[...]

> +static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
> +					  struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_dai *codec_dai;
> +	int i;
> +
> +	if (rtd->num_cpus > 1) {
> +		if (rtd->num_codecs == rtd->num_cpus)
> +			for_each_rtd_codec_dai(rtd, i, codec_dai)
> +				dapm_add_valid_dai_widget(card, rtd,
> +							  codec_dai,
> +							  rtd->cpu_dais[i]);
> +		else
> +			dev_err(card->dev,
> +				"N cpus to M codecs link is not supported yet\n");
> +	} else {
> +		for_each_rtd_codec_dai(rtd, i, codec_dai)
> +			dapm_add_valid_dai_widget(card, rtd,
> +						  codec_dai, rtd->cpu_dais[0]);


I would suggest introducing the new helper in an earlier patch, then the 
addition of the multi-cpu-dai case would be a lot easier to review - and 
make sure there's no regression.

This patch is difficult to double-check with too many unrelated code 
moves due to the new helper.

>   	}
>   }
>   
> @@ -4417,9 +4434,11 @@ static void soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream,
>   	int event)
>   {
>   	struct snd_soc_dai *codec_dai;
> +	struct snd_soc_dai *cpu_dai;
>   	int i;
>   
> -	soc_dapm_dai_stream_event(rtd->cpu_dai, stream, event);
> +	for_each_rtd_cpu_dai(rtd, i, cpu_dai)
> +		soc_dapm_dai_stream_event(cpu_dai, stream, event);
>   	for_each_rtd_codec_dai(rtd, i, codec_dai)
>   		soc_dapm_dai_stream_event(codec_dai, stream, event);
>   
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
