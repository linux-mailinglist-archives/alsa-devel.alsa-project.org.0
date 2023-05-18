Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CEE707E42
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 12:39:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 342A1823;
	Thu, 18 May 2023 12:38:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 342A1823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684406386;
	bh=iDZY43pclmafakXz/03mCNBQ2jzIlhArQcrD3pwfXlM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IvVKEvexCjQWwdBY953aQwLAv5RV4s9OF1UaQTXDaT7nC1JK6zsgJGNJ+mvGQHCOD
	 ijHFv1f5HVy7us7Lfj8EUSuG1VtnIVZov4mdYBiwTogiS8ikTziSzaETVFcWc9Ts25
	 LyrrdD+Ze5LWLZqPiEVzQA9vQsfV9IJ1HxRr3HYQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DBBEF80588; Thu, 18 May 2023 12:38:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6115F8057F;
	Thu, 18 May 2023 12:38:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FE65F80588; Thu, 18 May 2023 12:38:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1AE16F8057F
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 12:38:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AE16F8057F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ua7V8zXL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684406295; x=1715942295;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iDZY43pclmafakXz/03mCNBQ2jzIlhArQcrD3pwfXlM=;
  b=Ua7V8zXLZjAmbJgqTcduqvlt6SZcjoIKoFfXy2orufKpUXLnJGuy8zwt
   yWRJaH1/deoAGyh8A3iyinAGojU+XD59e9ZbHO/mIn4wVro2YFCsao9V8
   tScgG1L4ewhdVf3+ujLqxIMdJp5AeZ15Zxiw000NgQo/VMtliLCephP1e
   fNDaiLqsS98kP2v8gyup46Mq/3riVo8HyKkn2a+hfTam4QMLn+VoT+CiW
   LrP/3uy3MQLRy2k2OvUxwWmG+HBKH9lY1x4sNJsoe1pBhptcGu+5VdO9c
   ZIPhE0rVAHi9jiffpvWJmcjdU6FLpJ28unEYxfbaqMqAsrLSCtvuQq6w5
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="349544932"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200";
   d="scan'208";a="349544932"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 03:38:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="791929693"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200";
   d="scan'208";a="791929693"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 03:38:12 -0700
Message-ID: <053f0ed1-e175-90ae-73cd-fd22b1d508d0@linux.intel.com>
Date: Thu, 18 May 2023 12:38:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 04/20] ASoC: soc-pcm.c: use temporary variable at
 soc_get_playback_capture()
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
 <87wn16p4x4.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87wn16p4x4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ILPHGKXAQUR2RCKPU5MIH3LC2ORJSZ7L
X-Message-ID-Hash: ILPHGKXAQUR2RCKPU5MIH3LC2ORJSZ7L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ILPHGKXAQUR2RCKPU5MIH3LC2ORJSZ7L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/18/2023 7:47 AM, Kuninori Morimoto wrote:
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
> index 47da3be0ff46..c127ab9de61f 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2733,6 +2733,8 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
>   {
>   	struct snd_soc_dai_link *dai_link = rtd->dai_link;
>   	struct snd_soc_dai *cpu_dai;
> +	int tmp_playback = 0;
> +	int tmp_capture  = 0;
>   	int i;
>   

Maybe name it something more descriptive, like "has_playback" and 
"has_capture", I think it would make core more readable in context?

