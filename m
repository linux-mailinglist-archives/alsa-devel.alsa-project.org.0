Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBE472077C
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 18:24:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 786A11D7;
	Fri,  2 Jun 2023 18:23:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 786A11D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685723063;
	bh=L/1L66rn4RL9w+TYSZfp9KQW0Di4tDa8VVzdl1VNe24=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=agG88CdykdSDC4UjhxmPU8iHnyiGiNRdkyG0BWEY5hydpuCaxkDmMcXfsgeOprQnH
	 uenmkMpaTj2mpM4ROr9vKPets5CatHvcql601Z5trtal06AyFI+vrEY6a7gTWKJCba
	 reOL5bLQrmn6dwpN0zGN+UwS977VMJEknVB0w25A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8B12F8016B; Fri,  2 Jun 2023 18:23:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82950F80132;
	Fri,  2 Jun 2023 18:23:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57B67F8016B; Fri,  2 Jun 2023 18:23:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3250EF800C1
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 18:23:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3250EF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ihuUpgpy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685723006; x=1717259006;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=L/1L66rn4RL9w+TYSZfp9KQW0Di4tDa8VVzdl1VNe24=;
  b=ihuUpgpyKXDCb7Qd14GpplQHXfxWKt6HUoenr9s70rtEB7aOoCgvvLqJ
   qHxQM0OQh33idRNHjGBbSBs+T9KDzAAJisT/KSwGFDLjLEtVHCUBsczXX
   7heT94blg0BTiWrZ2c/h0olqyes04mbjpoLyRx8JTQkW6WelkQMojk2l5
   +BC4vFPY3H2Ot/jJjAwRSC4kFlsgDG0/H/8dz9heGT8GAfHRUPr//LMCm
   cH3KqVvmkeMg+dqwa+8aiLtPZAo2npkRPZU1L7B+ntvQyndmz9wubmpX1
   ngPewNaS6ipoRrZEyMggBrEZ8RgzN8LBK/ZAJoJZJei8j0QpfPxvmA9NG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="442285432"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400";
   d="scan'208";a="442285432"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 09:23:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="685367773"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400";
   d="scan'208";a="685367773"
Received: from joshkuo-mobl.amr.corp.intel.com (HELO [10.209.39.242])
 ([10.209.39.242])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 09:23:12 -0700
Message-ID: <ba2d6ec7-6337-d6e5-cc11-9f0c4f17df3c@linux.intel.com>
Date: Fri, 2 Jun 2023 09:53:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH v2 00/21] ASoC: replace dpcm_playback/capture to
 playback/capture_only
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
 <ff4586eb-4363-2592-97f7-d2fa8bbdee8a@linux.intel.com>
 <875y8fx5fy.wl-kuninori.morimoto.gx@renesas.com>
 <87mt1ihhm3.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87mt1ihhm3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: S5WFBSQPMF2QQ5CFP5GVEQD62KT23QZM
X-Message-ID-Hash: S5WFBSQPMF2QQ5CFP5GVEQD62KT23QZM
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S5WFBSQPMF2QQ5CFP5GVEQD62KT23QZM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/1/23 18:45, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis
> Cc Mark
> 
> Can I ask you about your opinion ?
> 
>>> This is problematic, 1:4 connections have been handled for a very long
>>> time, this is basic TDM.
> 
> 	static int soc_get_playback_capture(...)
> 	{
> 		...
> 		if (dai_link->dynamic || dai_link->no_pcm) {
> 			...
> 		} else {
> 			...
> 			for_each_rtd_codec_dais(rtd, i, codec_dai) {
> 				if (dai_link->num_cpus == 1) {
> 					cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> 				} else if (dai_link->num_cpus == dai_link->num_codecs) {
> 					cpu_dai = asoc_rtd_to_cpu(rtd, i);
> 				} else {
> 					dev_err(rtd->card->dev,
> 						"N cpus to M codecs link is not supported yet\n");
> 					return -EINVAL;
> 				}
> 
> 				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
> 				    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
> =>					has_playback = 1;
> 				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
> 				    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
> =>					has_capture = 1;
> 			}
> 		...
> 	}
> 
> In case of CPU:Codec = 1:N, and if its validation were
> 
> 	CPU   : OK
> 
> 	Codec : OK
> 	Codec : NG
> 	...
> 
> Current soc_get_playback_capture() will have has_playback/capture = 1
> evan though one of Codec was NG.
> I think it should be error, but am I right ?

Indeed, we should only enable playback (resp. capture) when all codec
dais have the same settings. We should revert the logic here IMHO to go
from 'at least one' to 'all'.

