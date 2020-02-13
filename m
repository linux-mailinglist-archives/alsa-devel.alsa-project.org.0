Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFEA15C920
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 18:07:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 855E016DE;
	Thu, 13 Feb 2020 18:06:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 855E016DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581613661;
	bh=86w2jHAUEg8W/PL9775DJYaqw2N/JClf4+V6o1qSA3o=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T7wXHy/y+qkUZLEPtgk7fBTjx8ChlNOCxeDpLzBoW8Uvj8HDYGO2F9aK0PRK0zXBv
	 nmXLSG+/uvwDIc4B5mkatcLj7gMgQ8yFmr4fk9LqQNq2wtD5yi6BYNLOLetCZo8oYM
	 basZcRkxlvWDbsIYRX1pVmi9YswsbfHANn0kPfyo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11D81F8025E;
	Thu, 13 Feb 2020 18:04:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E367F801DA; Thu, 13 Feb 2020 18:04:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56DB7F8013E
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 18:04:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56DB7F8013E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Feb 2020 09:04:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,437,1574150400"; d="scan'208";a="222709223"
Received: from rebrandt-mobl.amr.corp.intel.com (HELO [10.251.9.115])
 ([10.251.9.115])
 by orsmga007.jf.intel.com with ESMTP; 13 Feb 2020 09:04:45 -0800
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87blq3ru4w.wl-kuninori.morimoto.gx@renesas.com>
 <87y2t7qfi9.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <09d31018-abdf-0383-ac55-29cc7d5ad103@linux.intel.com>
Date: Thu, 13 Feb 2020 10:10:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87y2t7qfi9.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 09/10] ASoC: soc-pcm: care Multi Codec at
 soc_dpcm_fe_runtime_update()
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



On 2/12/20 10:26 PM, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> soc_dpcm_fe_runtime_update() doesn't care Multi Codec now.
> We need to care it. This patch fixup it.

Humm, maybe a stupid question but for my education is there an actual 
case where a front-end dailink uses more that one codec_dai? All the 
examples I see for Intel rely on COMP_DUMMY().

> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/soc-pcm.c | 24 ++++++++++++++++++------
>   1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 95fe915f26b0..962fe6cb7d3e 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2614,8 +2614,10 @@ static int dpcm_run_old_update(struct snd_soc_pcm_runtime *fe, int stream)
>   
>   static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
>   {
> +	struct snd_soc_dai *codec_dai;
>   	struct snd_soc_dapm_widget_list *list;
>   	int count, paths;
> +	int i;
>   
>   	if (!fe->dai_link->dynamic)
>   		return 0;
> @@ -2629,13 +2631,18 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
>   		new ? "new" : "old", fe->dai_link->name);
>   
>   	/* skip if FE doesn't have playback capability */
> -	if (!snd_soc_dai_stream_valid(fe->cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK) ||
> -	    !snd_soc_dai_stream_valid(fe->codec_dai, SNDRV_PCM_STREAM_PLAYBACK))
> +	if (!snd_soc_dai_stream_valid(fe->cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK))
>   		goto capture;
> +	for_each_rtd_codec_dai(fe, i, codec_dai)
> +		if (!snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK))
> +			goto capture;
>   
>   	/* skip if FE isn't currently playing */
> -	if (!fe->cpu_dai->playback_active || !fe->codec_dai->playback_active)
> +	if (!fe->cpu_dai->playback_active)
>   		goto capture;
> +	for_each_rtd_codec_dai(fe, i, codec_dai)
> +		if (!codec_dai->playback_active)
> +			goto capture;
>   
>   	paths = dpcm_path_get(fe, SNDRV_PCM_STREAM_PLAYBACK, &list);
>   	if (paths < 0) {
> @@ -2660,13 +2667,18 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
>   
>   capture:
>   	/* skip if FE doesn't have capture capability */
> -	if (!snd_soc_dai_stream_valid(fe->cpu_dai,   SNDRV_PCM_STREAM_CAPTURE) ||
> -	    !snd_soc_dai_stream_valid(fe->codec_dai, SNDRV_PCM_STREAM_CAPTURE))
> +	if (!snd_soc_dai_stream_valid(fe->cpu_dai,   SNDRV_PCM_STREAM_CAPTURE))
>   		return 0;
> +	for_each_rtd_codec_dai(fe, i, codec_dai)
> +		if (!snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE))
> +			return 0;
>   
>   	/* skip if FE isn't currently capturing */
> -	if (!fe->cpu_dai->capture_active || !fe->codec_dai->capture_active)
> +	if (!fe->cpu_dai->capture_active)
>   		return 0;
> +	for_each_rtd_codec_dai(fe, i, codec_dai)
> +		if (!codec_dai->capture_active)
> +			return 0;
>   
>   	paths = dpcm_path_get(fe, SNDRV_PCM_STREAM_CAPTURE, &list);
>   	if (paths < 0) {
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
