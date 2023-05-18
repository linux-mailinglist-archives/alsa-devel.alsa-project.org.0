Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BAF5707E48
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 12:41:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AB8B7F4;
	Thu, 18 May 2023 12:40:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AB8B7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684406491;
	bh=hsH7E9LTmmvb4jWy4vKnXU1p3cIrXooa9b1f3V/OfWY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jyaK8FbMkg54ErVcKUA3sFynfZdZDxks7uXnQk4dNFwDKYr4gWdjImZ1pFG27ckPE
	 U2q0/qN2qT7ZyWs6lNGMqzKbD0MPdGLt6nMxWK4M/mv4b9H06J1IffxKI1dQRxW4pA
	 3dPpt7olf1872jSdQ13LcxFn98lY1V+m++Lts5Fk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA32FF80579; Thu, 18 May 2023 12:39:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5980FF80564;
	Thu, 18 May 2023 12:39:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53FE1F8058C; Thu, 18 May 2023 12:39:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36BABF80564
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 12:39:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36BABF80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CuiAcBbu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684406379; x=1715942379;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hsH7E9LTmmvb4jWy4vKnXU1p3cIrXooa9b1f3V/OfWY=;
  b=CuiAcBbux14Q/FMtre53hubrrcO3UElLtJqhCLqWShmTdsXrk0hefRIO
   cuNi9KkOnu8d67vF1DeS8MsLLfqc0gsf1qY9NU9/nNmq4LRZURIB7fLiL
   PAecyENJQ8jveTAOIVbDiRDvmwFXiOFwk+zIMp0wWfT07ER3TMKEq6OIU
   jpK1SDDZ5I6vrRe3daRgrusl/jNcAiLNZY17ZCXvNEBAQw3mxDesA1UXm
   ccmI3AxTT56FsIgQF7VfNdjbufmcwozU1FeS4oSHdQQG6OZVAAHaOuRaJ
   e6VIMUlawzBY5pMu8SQL66+HGQXZkQKaJm9UKzbfYcJcUHKF+HqMyf4NG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="415458425"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200";
   d="scan'208";a="415458425"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 03:39:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="696250646"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200";
   d="scan'208";a="696250646"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 03:39:32 -0700
Message-ID: <43a183ac-544d-48c2-f9d5-71ca8a0cc09f@linux.intel.com>
Date: Thu, 18 May 2023 12:39:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 16/20] ASoC: soc-dai.c: replace dpcm_playback/capture to
 playback/capture_only
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
 <87fs7up4t5.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87fs7up4t5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6SY5OFTGB2D2AIBB6RKDTWTCEZLLXWVA
X-Message-ID-Hash: 6SY5OFTGB2D2AIBB6RKDTWTCEZLLXWVA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6SY5OFTGB2D2AIBB6RKDTWTCEZLLXWVA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/18/2023 7:49 AM, Kuninori Morimoto wrote:
> soc_get_playback_capture() is now handling DPCM and normal comprehensively
> for playback/capture stream. We can use playback/capture_only flag
> instead of using dpcm_playback/capture. This patch replace these.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/soc-dai.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
> index 02dd64dea179..e61414bb0b72 100644
> --- a/sound/soc/soc-dai.c
> +++ b/sound/soc/soc-dai.c
> @@ -505,8 +505,8 @@ void snd_soc_dai_link_set_capabilities(struct snd_soc_dai_link *dai_link)
>   		supported[direction] = supported_cpu && supported_codec;
>   	}
>   
> -	dai_link->dpcm_playback = supported[SNDRV_PCM_STREAM_PLAYBACK];
> -	dai_link->dpcm_capture  = supported[SNDRV_PCM_STREAM_CAPTURE];
> +	dai_link->playback_only = !supported[SNDRV_PCM_STREAM_CAPTURE];
> +	dai_link->capture_only  = !supported[SNDRV_PCM_STREAM_PLAYBACK];
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_dai_link_set_capabilities);
>   

What happens if somehow both supported[SNDRV_PCM_STREAM_CAPTURE] and 
supported[SNDRV_PCM_STREAM_PLAYBACK] are false, and so both 
dai_link->playback_only & dai_link->capture_only get set to true?

Perhaps assignment should be more like:
dai_link->playback_only = supported[SNDRV_PCM_STREAM_PLAYBACK] && 
!supported[SNDRV_PCM_STREAM_CAPTURE];
dai_link->playback_only = supported[SNDRV_PCM_STREAM_CAPTURE] && 
!supported[SNDRV_PCM_STREAM_PLAYBACK];
