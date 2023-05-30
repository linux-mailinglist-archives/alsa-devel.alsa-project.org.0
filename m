Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6427164B2
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 16:46:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 331AD6C0;
	Tue, 30 May 2023 16:45:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 331AD6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685457986;
	bh=6kREo6AOjlbkv6izoJghoqHkomjsL7ElGbjU2YWwSlU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lBn5HKgV1BqkGwDNr8Dgf1TSIwGuslZNAymDwCcLBCVtDmwDse6jYcIDnsuvjfHX0
	 R4cWmZFu8qTIaTqj4yHqxOuyHkNGOWNOCZH449b93iBS6SkUHgxHmhpLmqDztUyezO
	 eiTO3s4Om+9XYDqdRnwBhGCDwdXuJq/571B6i2Ng=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CFD9F800DF; Tue, 30 May 2023 16:45:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58EB2F8026A;
	Tue, 30 May 2023 16:45:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7DDAF8042F; Tue, 30 May 2023 16:45:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A4E4F8016B
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 16:45:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A4E4F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lhdgXFTH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685457926; x=1716993926;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6kREo6AOjlbkv6izoJghoqHkomjsL7ElGbjU2YWwSlU=;
  b=lhdgXFTHjUZX8/SUBW3Tj671BiLhveD5EqplqhJw+mVN4JBAxSVRENdg
   9oBCkHw2RdHp/Pgl1klzAcXfBJAnW/IWXurKZu9ol2dxj0CafKtAwmLtb
   IPnYXPdY3OBq8UEaKqJGpKshhiKJb7kzw0U+v4FDEl0xxlEpZY6TCkSN/
   NDZ3P+qrkO8G2iE3x4x99WfM4g3isBQu4nBXtGVlbjL9GWvznkT9gEWrr
   +cUHqGfrMsXr1w4//srmP19EykcleOEts8UC8m74jeOXf6hXEMRznZ5c0
   LFa37me8O3ni5LgGL8jWTDzc+mFbRMEHsduPjjaEfN3lBPlMw9YM2Ywi6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="353776719"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400";
   d="scan'208";a="353776719"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 07:45:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="771570337"
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400";
   d="scan'208";a="771570337"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 07:45:12 -0700
Message-ID: <13b6c019-1034-4f59-4d8f-fb9f478b7764@linux.intel.com>
Date: Tue, 30 May 2023 16:45:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/5] ASoC: soc-pcm.c: use temporary variable at
 soc_get_playback_capture()
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
References: <87zg5mzlrc.wl-kuninori.morimoto.gx@renesas.com>
 <87ttvuzlqe.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87ttvuzlqe.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6YIRUWPXN744DWIK76H6I423NM4TBMCX
X-Message-ID-Hash: 6YIRUWPXN744DWIK76H6I423NM4TBMCX
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6YIRUWPXN744DWIK76H6I423NM4TBMCX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/30/2023 2:50 AM, Kuninori Morimoto wrote:
> soc_get_playback_capture() (A) returns number of substreams for
> playback/capture (B).
> 
> (A)	static int soc_get_playback_capture(...,
> (B)					int *playback, int *capture)
> 	{
> 		...
> 		for_each_xxx(...) {
> 			if (xxx)
> 				return -EINVAL;
> =>			*playback = 1;
> 			...
> =>			*capture = 1;
> 			...
> 		}
> 		...
> 	}
> 
> But, it is directly updating playback/capture which is the result of this
> function even though it might be error. It should be updated in case of
> succeed only. This patch updates it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/soc-pcm.c | 27 ++++++++++++++++-----------
>   1 file changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 47da3be0ff46..b3d569e7ba61 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2733,6 +2733,8 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
>   {
>   	struct snd_soc_dai_link *dai_link = rtd->dai_link;
>   	struct snd_soc_dai *cpu_dai;
> +	int has_playback = 0;
> +	int has_capture  = 0;
>   	int i;
>   
>   	if (dai_link->dynamic && dai_link->num_cpus > 1) {
> @@ -2748,11 +2750,11 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
>   
>   			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
>   				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
> -					*playback = 1;
> +					has_playback = 1;
>   					break;
>   				}
>   			}
> -			if (!*playback) {
> +			if (!has_playback) {
>   				dev_err(rtd->card->dev,
>   					"No CPU DAIs support playback for stream %s\n",
>   					dai_link->stream_name);
> @@ -2764,12 +2766,12 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
>   
>   			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
>   				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
> -					*capture = 1;
> +					has_capture = 1;
>   					break;
>   				}
>   			}
>   
> -			if (!*capture) {
> +			if (!has_capture) {
>   				dev_err(rtd->card->dev,
>   					"No CPU DAIs support capture for stream %s\n",
>   					dai_link->stream_name);
> @@ -2798,30 +2800,33 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
>   
>   			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
>   			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
> -				*playback = 1;
> +				has_playback = 1;
>   			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
>   			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
> -				*capture = 1;
> +				has_capture = 1;
>   		}
>   	}
>   
>   	if (dai_link->playback_only) {
> -		*playback = 1;
> -		*capture = 0;
> +		has_playback = 1;
> +		has_capture = 0;
>   	}
>   
>   	if (dai_link->capture_only) {
> -		*playback = 0;
> -		*capture = 1;
> +		has_playback = 0;
> +		has_capture = 1;
>   	}
>   
> -	if (!*playback && !*capture) {
> +	if (!has_playback && !has_capture) {
>   		dev_err(rtd->dev, "substream %s has no playback, no capture\n",
>   			dai_link->stream_name);
>   
>   		return -EINVAL;
>   	}
>   
> +	*playback = has_playback;
> +	*capture  = has_capture;
> +
>   	return 0;
>   }
>   

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
