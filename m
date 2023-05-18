Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4787707E46
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 12:41:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BAE3825;
	Thu, 18 May 2023 12:40:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BAE3825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684406463;
	bh=aRTmJqhQyvjztb072GS85xdgfrl6xKTTgPNENaqhyK4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o8kLAFIWAnvG47UPS0Dg+Ztxx5M59UgUgQ4AAlL8ngEPywwfwY/+vdwprp7QDmVhV
	 Pt64285ILNto0WINZppg/dAHMnRVDOrDy+5BWeIPewKBboYlPMkMMvo97lvgY0n8Pa
	 95VVPJN9HGiw32fmfiDVCyr9H/izE3ym3Fw4Y4ik=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD093F805B5; Thu, 18 May 2023 12:39:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D0A7F80542;
	Thu, 18 May 2023 12:39:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09354F80563; Thu, 18 May 2023 12:39:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57586F80087
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 12:38:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57586F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NQPU/MV3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684406334; x=1715942334;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aRTmJqhQyvjztb072GS85xdgfrl6xKTTgPNENaqhyK4=;
  b=NQPU/MV3zGfL7nk0Ralh4CYflbkNfQcajtzC4qhBPtfEinK1MMPQ76iw
   OJX7Mz5wq7cnMM3pl2+oayv1Y9Ly2TYQhB6uo/WaMfoF3mcUvtMU+v1uU
   WTZjEuW6P8XRJzHUOJZ93rhpO6NyhYLpKMYGBDlit+TOdWs2UG9tTvrvJ
   +Kzs3pLVwOjEH0LcgvpUSzifTnAjHIKIMxyJymM4RPUOxUj6yelouOD0r
   To7BktJTjeXR7PgMLgDg4WQgxSqnQH3tY8cyZvaFbIdf/3xHixxSpTf1a
   IiqIbHOOyHJXeyLiOI3uTuUoBGIv1GUGVSexVbmJ72LfRxATMZSCiu3C+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="350865603"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200";
   d="scan'208";a="350865603"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 03:38:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="735034895"
X-IronPort-AV: E=Sophos;i="5.99,285,1677571200";
   d="scan'208";a="735034895"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 03:38:49 -0700
Message-ID: <083450a1-25c6-6c1f-c004-02e86e9070d9@linux.intel.com>
Date: Thu, 18 May 2023 12:38:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 08/20] ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
 <87r0rep4we.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87r0rep4we.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WIEGPNC4FDUSHL4DYQNMMFXG5NP5FYVM
X-Message-ID-Hash: WIEGPNC4FDUSHL4DYQNMMFXG5NP5FYVM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WIEGPNC4FDUSHL4DYQNMMFXG5NP5FYVM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/18/2023 7:47 AM, Kuninori Morimoto wrote:
> Current soc_get_playback_capture() (A) is checking playback/capture
> availability for DPCM (X) / Normal (Y) / Codec2Codec (Z) connections.
> 
> (A)	static int soc_get_playback_capture(...)
> 	{
> 		...
>   ^		if (dai_link->dynamic || dai_link->no_pcm) {
>   |			...
>   |(a)			if (dai_link->dpcm_playback) {
>   |				...
>   | ^				for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
>   |(*)					...
>   | v				}
>   |				...
> (X)			}
>   |(b)			if (dai_link->dpcm_capture) {
>   |				...
>   | ^				for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
>   |(*)					...
>   | v				}
>   |				...
>   v			}
> 		} else {
>   ^ ^			/* Adapt stream for codec2codec links */
>   |(Z)			int cpu_capture = ...
>   | v			int cpu_playback = ...
> (Y)
>   | ^			for_each_rtd_codec_dais(rtd, i, codec_dai) {
>   |(*)				...
>   v v			}
> 		}
> 		...
> 	}
> 
> (*) part is checking each DAI's availability.
> 
> At first, (X) part is for DPCM, and it checks playback/capture
> availability if dai_link has dpcm_playback/capture flag (a)(b).
> But we are already using playback/capture_only flag.
> for Normal (Y) and Codec2Codec (Z). We can use this flags for DPCM too.
> 
> Before				After
> 	dpcm_playback = 1;	=>	/* no flags */
> 	dpcm_capture  = 1;
> 
> 	dpcm_playback = 1;	=>	playback_only = 1;
> 
> 	dpcm_capture = 1;	=>	capture_only = 1;
> 
> This patch enables both flags case, but dpcm_playback/capture flags
> will be removed if all driver were switched to new playback/capture_only
> flags.
> 
> Here, CPU <-> Codec relationship is like this
> 
> 	DPCM
> 		[CPU/dummy]-[dummy/Codec]
> 		^^^^^^^^^^^
> 	Normal
> 		[CPU/Codec]
> 		^^^^^^^^^^^
> 
> (X) part is checking only CPU       DAI, and
> (Y) part is checking both CPU/Codec DAI
> 
> This means (X)/(Y) are checking same position.
> Because dammy DAI is always available,
> we can share same code for all cases (= X/Y/Z).
> 
> This patch merge these.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

