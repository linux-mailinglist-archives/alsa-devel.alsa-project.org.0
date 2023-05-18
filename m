Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E27707E4B
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 12:41:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A1DC200;
	Thu, 18 May 2023 12:41:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A1DC200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684406513;
	bh=SqiEgNaSPgzVYOE+khpkENHJML/gbDItzYu1ntFr6eE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gS9tScRxqrsE7lZEnoIY31vVvQsHVRwBS5JKKlVQbl78VgDehaXFpAtnQT+iiJ37I
	 uYBDDesxkotFCZERlZGHDoGRJd4R2lxwwwLd1XAheNm31xoRvqTU2YjOLnyvH5gZDT
	 fxjEGnn1CdJDTHhu2sThvg+yI0HETeYUA26h35xg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43C61F80564; Thu, 18 May 2023 12:40:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E23C9F8055C;
	Thu, 18 May 2023 12:40:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91B1FF80570; Thu, 18 May 2023 12:40:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3865DF8055C
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 12:40:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3865DF8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=d9HECZ9H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684406405; x=1715942405;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SqiEgNaSPgzVYOE+khpkENHJML/gbDItzYu1ntFr6eE=;
  b=d9HECZ9HC5QqbKdzGqwvbi+LVjmJFpfMfOZ+Dl78lv2bJQW6iZ7YXyg4
   IeYo5+CBL8FaVYOQwvtBUo90r5DL3y9IhaIIolzvwjV+rfN746R/SWzy3
   SPgG8jHRRPOunzdcvF2NilQDUVkmeoD7F1xh8YZBjYbyxHKJQSvZhaw6B
   IpM2O7HGA0r8SXMcg6cLlqSTSjdFqD4MbY6nrFHfvoBUrBjYL7Vrg+ykh
   A11gOpslL1quPt1AOIoaJiSdt4ZF/gnPQklnY5vngNIrsyUaEkrZE+P1F
   Dvs83KLRbYVfjyBEjs0TV427gOKLgX5wzbOeJRuJtlr9A6r/j0pCEKeXc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="415458472"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200";
   d="scan'208";a="415458472"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 03:40:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="696250700"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200";
   d="scan'208";a="696250700"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 03:40:00 -0700
Message-ID: <9510b20d-6f92-9d34-6f5b-a1e4a979c628@linux.intel.com>
Date: Thu, 18 May 2023 12:39:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 17/20] ASoC: soc-core.c: replace dpcm_playback/capture to
 playback/capture_only
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
 <87ednep4sz.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87ednep4sz.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VT6HVSB4R5KMMPNRXSVHCMXBTSJGTRRP
X-Message-ID-Hash: VT6HVSB4R5KMMPNRXSVHCMXBTSJGTRRP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VT6HVSB4R5KMMPNRXSVHCMXBTSJGTRRP/>
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
>   sound/soc/soc-core.c | 20 +-------------------
>   1 file changed, 1 insertion(+), 19 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index b48efc3a08d2..f57911e4e4d5 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1781,25 +1781,7 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
>   				dai_link->platforms->name = component->name;
>   
>   			/* convert non BE into BE */
> -			if (!dai_link->no_pcm) {
> -				dai_link->no_pcm = 1;
> -
> -				if (dai_link->dpcm_playback)
> -					dev_warn(card->dev,
> -						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_playback=1\n",
> -						 dai_link->name);
> -				if (dai_link->dpcm_capture)
> -					dev_warn(card->dev,
> -						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_capture=1\n",
> -						 dai_link->name);
> -
> -				/* convert normal link into DPCM one */
> -				if (!(dai_link->dpcm_playback ||
> -				      dai_link->dpcm_capture)) {
> -					dai_link->dpcm_playback = !dai_link->capture_only;
> -					dai_link->dpcm_capture = !dai_link->playback_only;
> -				}
> -			}
> +			dai_link->no_pcm = 1;
>   
>   			/*
>   			 * override any BE fixups

Somehow feels bit weird, but logically it makes sense, so

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

