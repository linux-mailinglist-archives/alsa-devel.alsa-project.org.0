Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD32453B2D
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 21:45:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A31D188A;
	Tue, 16 Nov 2021 21:44:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A31D188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637095514;
	bh=6cRJpSX5Ff/VJA6lvSF8bt8uzvrweKJfjDcv9ETPiAg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZsVuPyNHO2aicu+Xh1kC/OnTFzUFuUFsIDhxLzUukv+YLfH7/98ggaVPNTZl9UGSc
	 MDLxXn6b1B4f92jGyZaFsKAto1h/1j5lsIKrmllkvLPoT6trcR6z5aN8pzcVuVYter
	 bIsguW7x7x/oG2lvrdDgtbOPyrTm9Kmwxtoo/LO8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7005DF800FA;
	Tue, 16 Nov 2021 21:43:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FFE9F80272; Tue, 16 Nov 2021 21:43:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D29F7F80134
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 21:43:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D29F7F80134
X-IronPort-AV: E=McAfee;i="6200,9189,10170"; a="231288246"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="231288246"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 12:43:34 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; d="scan'208";a="536055468"
Received: from amritamu-mobl1.amr.corp.intel.com (HELO [10.209.162.237])
 ([10.209.162.237])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 12:43:33 -0800
Subject: Re: [PATCH 1/5] ASoC: soc-dai: update snd_soc_dai_delay() to
 snd_soc_pcm_dai_delay()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <877dd8y26l.wl-kuninori.morimoto.gx@renesas.com>
 <875yssy25z.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2cc78158-e288-e949-594f-0ab939a35942@linux.intel.com>
Date: Tue, 16 Nov 2021 14:43:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <875yssy25z.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.com>,
 Hans de Goede <hdegoede@redhat.com>, Gu Shengxian <gushengxian@yulong.com>
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



On 11/16/21 1:45 AM, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Current soc_pcm_pointer() is manually calculating
> both CPU-DAI's   max delay (= A)
> and  Codec-DAI's max delay (= B).
> 
> 	static snd_pcm_uframes_t soc_pcm_pointer(...)
> 	{
> 		...
>  ^		for_each_rtd_cpu_dais(rtd, i, cpu_dai)
> (A)			cpu_delay = max(cpu_delay, ...);
>  v		delay += cpu_delay;
> 
>  ^		for_each_rtd_codec_dais(rtd, i, codec_dai)
> (B)			codec_delay = max(codec_delay, ...);
>  v		delay += codec_delay;
> 
> 		runtime->delay = delay;
> 		...
> 	}
> 
> Current soc_pcm_pointer() and the total delay calculating
> is not readable / difficult to understand.
> 
> This patch update snd_soc_dai_delay() to snd_soc_pcm_dai_delay(),
> and calcule both CPU/Codec delay in one function.

When the hw_ptr is updated, the avail/delay value are also modified.

see the diagram in
https://www.kernel.org/doc/html/latest/sound/designs/timestamping.html?highlight=pcm%20timestamping

I would think it's more accurate to update the delay information while
dealing with the hw_ptr update, no?

> 
> Link: https://lore.kernel.org/r/87fszl4yrq.wl-kuninori.morimoto.gx@renesas.com
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc-dai.h |  4 ++--
>  sound/soc/soc-dai.c     | 40 ++++++++++++++++++++++++++++------------
>  sound/soc/soc-pcm.c     | 18 ++----------------
>  3 files changed, 32 insertions(+), 30 deletions(-)
> 
> diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
> index 0dcb361a98bb..5d4dd7c5450b 100644
> --- a/include/sound/soc-dai.h
> +++ b/include/sound/soc-dai.h
> @@ -208,8 +208,6 @@ int snd_soc_dai_startup(struct snd_soc_dai *dai,
>  			struct snd_pcm_substream *substream);
>  void snd_soc_dai_shutdown(struct snd_soc_dai *dai,
>  			  struct snd_pcm_substream *substream, int rollback);
> -snd_pcm_sframes_t snd_soc_dai_delay(struct snd_soc_dai *dai,
> -				    struct snd_pcm_substream *substream);
>  void snd_soc_dai_suspend(struct snd_soc_dai *dai);
>  void snd_soc_dai_resume(struct snd_soc_dai *dai);
>  int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
> @@ -238,6 +236,8 @@ int snd_soc_pcm_dai_trigger(struct snd_pcm_substream *substream, int cmd,
>  			    int rollback);
>  int snd_soc_pcm_dai_bespoke_trigger(struct snd_pcm_substream *substream,
>  				    int cmd);
> +void snd_soc_pcm_dai_delay(struct snd_pcm_substream *substream,
> +			   snd_pcm_sframes_t *cpu_delay, snd_pcm_sframes_t *codec_delay);
>  
>  int snd_soc_dai_compr_startup(struct snd_soc_dai *dai,
>  			      struct snd_compr_stream *cstream);
> diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
> index 3db0fcf24385..6078afe335f8 100644
> --- a/sound/soc/soc-dai.c
> +++ b/sound/soc/soc-dai.c
> @@ -453,18 +453,6 @@ void snd_soc_dai_shutdown(struct snd_soc_dai *dai,
>  	soc_dai_mark_pop(dai, substream, startup);
>  }
>  
> -snd_pcm_sframes_t snd_soc_dai_delay(struct snd_soc_dai *dai,
> -				    struct snd_pcm_substream *substream)
> -{
> -	int delay = 0;
> -
> -	if (dai->driver->ops &&
> -	    dai->driver->ops->delay)
> -		delay = dai->driver->ops->delay(substream, dai);
> -
> -	return delay;
> -}
> -
>  int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
>  			     struct snd_soc_pcm_runtime *rtd, int num)
>  {
> @@ -693,6 +681,34 @@ int snd_soc_pcm_dai_bespoke_trigger(struct snd_pcm_substream *substream,
>  	return 0;
>  }
>  
> +void snd_soc_pcm_dai_delay(struct snd_pcm_substream *substream,
> +			   snd_pcm_sframes_t *cpu_delay,
> +			   snd_pcm_sframes_t *codec_delay)
> +{
> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +	struct snd_soc_dai *dai;
> +	int i;
> +
> +	/*
> +	 * We're looking for the delay through the full audio path so it needs to
> +	 * be the maximum of the DAIs doing transmit and the maximum of the DAIs
> +	 * doing receive (ie, all CPUs and all CODECs) rather than just the maximum
> +	 * of all DAIs.
> +	 */
> +
> +	/* for CPU */
> +	for_each_rtd_cpu_dais(rtd, i, dai)
> +		if (dai->driver->ops &&
> +		    dai->driver->ops->delay)
> +			*cpu_delay = max(*cpu_delay, dai->driver->ops->delay(substream, dai));
> +
> +	/* for Codec */
> +	for_each_rtd_codec_dais(rtd, i, dai)
> +		if (dai->driver->ops &&
> +		    dai->driver->ops->delay)
> +			*codec_delay = max(*codec_delay, dai->driver->ops->delay(substream, dai));
> +}
> +
>  int snd_soc_dai_compr_startup(struct snd_soc_dai *dai,
>  			      struct snd_compr_stream *cstream)
>  {
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 4309e6131c40..b1ef4d02511f 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -1084,15 +1084,11 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
>   */
>  static snd_pcm_uframes_t soc_pcm_pointer(struct snd_pcm_substream *substream)
>  {
> -	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> -	struct snd_soc_dai *cpu_dai;
> -	struct snd_soc_dai *codec_dai;
>  	struct snd_pcm_runtime *runtime = substream->runtime;
>  	snd_pcm_uframes_t offset = 0;
>  	snd_pcm_sframes_t delay = 0;
>  	snd_pcm_sframes_t codec_delay = 0;
>  	snd_pcm_sframes_t cpu_delay = 0;
> -	int i;
>  
>  	/* clearing the previous total delay */
>  	runtime->delay = 0;
> @@ -1102,19 +1098,9 @@ static snd_pcm_uframes_t soc_pcm_pointer(struct snd_pcm_substream *substream)
>  	/* base delay if assigned in pointer callback */
>  	delay = runtime->delay;
>  
> -	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> -		cpu_delay = max(cpu_delay,
> -				snd_soc_dai_delay(cpu_dai, substream));
> -	}
> -	delay += cpu_delay;
> -
> -	for_each_rtd_codec_dais(rtd, i, codec_dai) {
> -		codec_delay = max(codec_delay,
> -				  snd_soc_dai_delay(codec_dai, substream));
> -	}
> -	delay += codec_delay;
> +	snd_soc_pcm_dai_delay(substream, &cpu_delay, &codec_delay);
>  
> -	runtime->delay = delay;
> +	runtime->delay = delay + cpu_delay + codec_delay;
>  
>  	return offset;
>  }
> 
