Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F1570B8AB
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 11:15:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CC16822;
	Mon, 22 May 2023 11:15:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CC16822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684746954;
	bh=Ae/7ezdtS0CXNql3LnmoqchQe9c0H3iwJPJpulgDUeI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=erdZUoKv8XZ2GxG2O/cRRXFBBYk610vbOnNUZx1Hh/2EbkOZSsg7ilKhQRe7pYXqJ
	 8sUGJNRcsea8jVBGoeGw0w/D54DYW37sPG8vE+M8ziL5rINetgXn/upuN1zgJe7xMu
	 4UGh2DZrDGcIUWnZVI7pxk0lPbP4b+DamNIkSNcg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A13FAF80425; Mon, 22 May 2023 11:14:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09CBFF80249;
	Mon, 22 May 2023 11:14:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98ECDF8024E; Mon, 22 May 2023 11:14:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2C07F8016A
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 11:14:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2C07F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UfuBaMnV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684746870; x=1716282870;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ae/7ezdtS0CXNql3LnmoqchQe9c0H3iwJPJpulgDUeI=;
  b=UfuBaMnVxL3ejLtKlJH2P9Z74fcEl9MOJOOY+nN4f8vzkcKutHAsTc//
   Bic5SR9sdVDfUuOUQIiL93GbJ8hfqaaci04efHxQ/nIFsO9KwWKdw/kHF
   JRf19IkpgJRlmXsC4e1UHx529iaRav3R6Wt8uG+QIQdid/LSh14LTl07I
   OwbZn43FB+FhnGHYk0XhG3N57T5+hnfszDYTsuZ/kvEfu9y+7KDDXfoDo
   4wXvDIOza696yCuPAfrAVcNx9pPL9ondVUS4xjGb74HcoQsUPd7KMygBh
   jLjIPj50Tn2fWrc4Eem/YAuHMqd+38cmpPTn69FpP3AH3CkIRNnEqyvO1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="350381499"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="350381499"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 02:14:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="653873758"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400";
   d="scan'208";a="653873758"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 02:14:22 -0700
Message-ID: <8f977a29-14c2-a160-5eea-10fce6a73742@linux.intel.com>
Date: Mon, 22 May 2023 11:14:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 08/20] ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
 <87r0rep4we.wl-kuninori.morimoto.gx@renesas.com>
 <2e84d6f3-902f-d6f3-0084-ddfbd61ffa1f@linux.intel.com>
 <87lehh2db4.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87lehh2db4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: P7LMQX4ET24SPEAI5VKI7XZS5WG27A5B
X-Message-ID-Hash: P7LMQX4ET24SPEAI5VKI7XZS5WG27A5B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P7LMQX4ET24SPEAI5VKI7XZS5WG27A5B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/22/2023 6:35 AM, Kuninori Morimoto wrote:
> 
> Hi Amadeusz
> 
> Thank you for testing
> 
>> I put the patchset to test and it fails to enumerate devices on our
>> platforms.
>>
>> Bisect leads me to this patch, here is dmesg fragment:
> (snip)
>> [   34.617601] avs_hdaudio avs_hdaudio.2: ASoC: Parent card not yet
>> available, widget card binding deferred
> (snip)
>> [   34.619973]  probing-LINK: substream (null) has no playback, no capture
> 
> Hmm..  I tested it on my many type of connections,
> but couldn't reproduce the error...
> 
> It seems you got [01/20] patch error = no playback, no capture.
> This means has_playback/capture both flags are 0.
> 
> It seems you are using soc-topology.
> Is it topology specific something ?
> 
> But hmm.. ?
> 
> static int soc_get_playback_capture(...)
> {
> 	...
> (A)	if (dai_link->dynamic || dai_link->no_pcm) {
> 		...
> 		if (dai_link->dpcm_playback) {
> 			...
> (B)			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> 				...
> 			}
> 			...
> 		}
> 		if (dai_link->dpcm_capture) {
> 			...
> (B)			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> 				...
> 			}
> 		}
> 		...
> 	}
> }
> 
> It checks CPU (B) when no_pcm (A) on original.
> But I think "no_pcm - CPU" is dummy DAI -> above check is no meaning.
> After the patch, it checks both CPU/Codec.

no_pcm means that we are describing Back End, if you check any file in 
sound/soc/intel/avs/boards, they set link->no_pcm to 1 - those files 
describe card and BE (codec) configuration.
Topology in case of our driver describe Front Ends (what is visible when 
you do "aplay -l"), as well as DSP path. Topology sets link->dynamic to 
1 in soc_tplg_fe_link_create().
Do note that card and topology are loaded separately hence the "card 
binding deferred" message in dmesg above.

> I wonder is your Codec which is connected to no_pcm DAI valid ?
> 

I'm not sure what do you mean, if it is valid? It works fine before this 
patch ;)

