Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5362B707E4C
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 12:42:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A07782B;
	Thu, 18 May 2023 12:41:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A07782B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684406521;
	bh=Nmn45Czl5nwOF8kJeyYnx1bB0W2Nvm9N9TyeoSsuzNI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cTRvXWyJz89AIAzUP3g+gjLXIwNEHl/uxp5GabVFToB5PIIXhJ/4pZi2w0aB6O2He
	 SYjG8QS+Yk7n91JkD/jan61HVUELsmAmp+JQPkef40xDDxFy8zx/gD51wAhTvHn0Qg
	 wihfy+zmbrnKbTpzmYsvpPeMebxJIsM8fB3/YWL0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F49EF80567; Thu, 18 May 2023 12:40:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0A53F8053D;
	Thu, 18 May 2023 12:40:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0626F80553; Thu, 18 May 2023 12:40:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22D93F80087
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 12:40:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22D93F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mhsIV/qb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684406431; x=1715942431;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Nmn45Czl5nwOF8kJeyYnx1bB0W2Nvm9N9TyeoSsuzNI=;
  b=mhsIV/qbZOPo7tVbo8PEkQWzqqSJ3iSH7KwcduLjegzvI01rGqbcSu9r
   SKoDmFipfUFr2GjoQbcUQg9hIAqUn5JlOlHSwu6kNDQZEi1xSBPxCZwF8
   swEXuZNAwnmOOxpNIPnc6TrjPCq4OnOLf2+B+MeYpYMLHwPI6QqITNIsw
   ZkKhslQkWbIf/tS5b/cOt9b7TL1xLUbB9ubXWOM2760LHX9lK9rOfJ0ht
   BPcB+bQeLdqd7tPVqVHHqtpEOXmLNLL8eKanOsT0frcDstYWhXifxIYMZ
   JOggnq7TsZ0SF3nJKHEYj80V6HnMI0aa16BsNHm0No+UiAopO0hnXTI06
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="331648762"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200";
   d="scan'208";a="331648762"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 03:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="767149299"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200";
   d="scan'208";a="767149299"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 03:40:16 -0700
Message-ID: <7a025c80-9f81-25e1-035b-ffb32a48c9c7@linux.intel.com>
Date: Thu, 18 May 2023 12:40:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 18/20] ASoC: soc-topology.c: replace dpcm_playback/capture
 to playback/capture_only
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=83=c2=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
 <87cz2yp4st.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87cz2yp4st.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AWQB3FFSIF6L65KWASO6UMUODZKCZQHC
X-Message-ID-Hash: AWQB3FFSIF6L65KWASO6UMUODZKCZQHC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AWQB3FFSIF6L65KWASO6UMUODZKCZQHC/>
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
>   sound/soc/soc-topology-test.c | 2 --
>   sound/soc/soc-topology.c      | 4 ++--
>   2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
> index 2cd3540cec04..703a366e0abe 100644
> --- a/sound/soc/soc-topology-test.c
> +++ b/sound/soc/soc-topology-test.c
> @@ -94,8 +94,6 @@ static struct snd_soc_dai_link kunit_dai_links[] = {
>   		.nonatomic = 1,
>   		.dynamic = 1,
>   		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
> -		.dpcm_playback = 1,
> -		.dpcm_capture = 1,
>   		SND_SOC_DAILINK_REG(dummy, dummy, platform),
>   	},
>   };
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index 47ab5cf99497..16a3d570463a 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -1735,8 +1735,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
>   	/* enable DPCM */
>   	link->dynamic = 1;
>   	link->ignore_pmdown_time = 1;
> -	link->dpcm_playback = le32_to_cpu(pcm->playback);
> -	link->dpcm_capture = le32_to_cpu(pcm->capture);
> +	link->playback_only = !le32_to_cpu(pcm->capture);
> +	link->capture_only  = !le32_to_cpu(pcm->playback);

This seems to be similar case to patch 16, should it be:
link->playback_only = le32_to_cpu(pcm->playback) && 
!le32_to_cpu(pcm->capture);
link->capture_only  = le32_to_cpu(pcm->capture) && 
!le32_to_cpu(pcm->playback);
?

>   	if (pcm->flag_mask)
>   		set_link_flags(link,
>   			       le32_to_cpu(pcm->flag_mask),

