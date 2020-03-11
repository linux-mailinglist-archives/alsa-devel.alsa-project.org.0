Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF019180DD2
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 03:02:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CE991657;
	Wed, 11 Mar 2020 03:01:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CE991657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583892142;
	bh=WveN29ZZubfIa3ZjgLMBOyvjUpEBWGdMe/dbpSRu3AQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ezqHQeiGma28mVLfJR+9JCgoiFPZy6mJ2qdYmrYvma7MW6UAkoGEC/N/8Zpp/BEvP
	 CqS5Zmg+FOeUXg2dUFWyi9Y7DEu0M6zN6WtMqwfPOwqfTYxDzIvCtzsBt9l7Dh4FIl
	 XEFcKpGirROcMzTO5RRTJCr8JwAC9BA/VI+5oLJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43870F800BC;
	Wed, 11 Mar 2020 03:00:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 100F4F8020C; Wed, 11 Mar 2020 03:00:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CDA6F800BC
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 03:00:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CDA6F800BC
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 19:00:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,539,1574150400"; d="scan'208";a="389116786"
Received: from vssomaya-mobl1.amr.corp.intel.com (HELO [10.252.138.210])
 ([10.252.138.210])
 by orsmga004.jf.intel.com with ESMTP; 10 Mar 2020 19:00:32 -0700
Subject: Re: [PATCH 7/7] ASoC: soc-pcm: Merge CPU/Codec at soc_pcm_pointer()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87y2s7vgxb.wl-kuninori.morimoto.gx@renesas.com>
 <87o8t3vgur.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1968b2ea-f094-709e-b5b2-784f7aec5081@linux.intel.com>
Date: Tue, 10 Mar 2020 21:00:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87o8t3vgur.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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



On 3/10/20 8:07 PM, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> soc_pcm_pointer() is getting eash DAI's delay via snd_soc_dai_delay(),
> but, it is adding CPU delay and Codec delay.
> We need is not "added delay", but "max delay" of CPU/Codec.
> This patch finds maximum delay from CPU/Codec.

The max() used between all cpu or codec dais for the same dailink is 
largely defensive programming, in practice it's not clear to me if we 
have different delays reported by differents codec or cpu_dais. I would 
expect all cpu dais in the same dailink to report the same delay, and 
likewise all codecs dais in the same dailink should provide the same value.

Now doing a max between cpu and codec dais does not seem right to me. 
You may have a delay in a DSP and a delay in a codec, and worst case the 
delay is the total of the two. It wouldn't matter too much with a 
'simple' codec with limited buffering, but the moment the codec itself 
has a DSP and internal buffering this change in accounting would 
introduce a real offset.


> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/soc-pcm.c | 27 +++++++--------------------
>   1 file changed, 7 insertions(+), 20 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index c0f318699fe4..675de7c0eaa4 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -1274,13 +1274,10 @@ static int soc_pcm_bespoke_trigger(struct snd_pcm_substream *substream,
>   static snd_pcm_uframes_t soc_pcm_pointer(struct snd_pcm_substream *substream)
>   {
>   	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> -	struct snd_soc_dai *cpu_dai;
> -	struct snd_soc_dai *codec_dai;
> +	struct snd_soc_dai *dai;
>   	struct snd_pcm_runtime *runtime = substream->runtime;
>   	snd_pcm_uframes_t offset = 0;
> -	snd_pcm_sframes_t delay = 0;
> -	snd_pcm_sframes_t codec_delay = 0;
> -	snd_pcm_sframes_t cpu_delay = 0;
> +	snd_pcm_sframes_t add_delay = 0;
>   	int i;
>   
>   	/* clearing the previous total delay */
> @@ -1288,22 +1285,12 @@ static snd_pcm_uframes_t soc_pcm_pointer(struct snd_pcm_substream *substream)
>   
>   	offset = snd_soc_pcm_component_pointer(substream);
>   
> -	/* base delay if assigned in pointer callback */
> -	delay = runtime->delay;
> -
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
> +	for_each_rtd_dais(rtd, i, dai)
> +		add_delay = max(add_delay,
> +				snd_soc_dai_delay(dai, substream));
>   
> -	runtime->delay = delay;
> +	/* base delay if assigned in pointer callback */
> +	runtime->delay += add_delay;
>   
>   	return offset;
>   }
> 
