Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3157704190
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 01:57:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7060820;
	Tue, 16 May 2023 01:57:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7060820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684195073;
	bh=mdO9taQNjMvU0buNSEo7PukGqubJTFlqM2pggNB0/eE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DsR0xCVrQbgLDKsD+3TvdiSaIwg0mDI6GVk3yXm70t11rlIIh+zLPKS6K2dkmZfO3
	 W0Vqzk2tZzHMsU7Xu4lSVzDhEp7yTdCn9Ak3RO/ATiK2moWyvGnDP1cTFIZIMgeC1z
	 xovJnvN0jeMh22tFG92SJ/3oqduyPATZvTOn4I+o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C5B7F802E8; Tue, 16 May 2023 01:56:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAC30F8025A;
	Tue, 16 May 2023 01:56:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18C1FF80272; Tue, 16 May 2023 01:56:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68DD9F8016A
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 01:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68DD9F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NcLZLHd3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684194989; x=1715730989;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mdO9taQNjMvU0buNSEo7PukGqubJTFlqM2pggNB0/eE=;
  b=NcLZLHd34uueBoVhkYKdjGtg57Payt35gJ77cuEUbTWNPDd2RqagK5bA
   YhDnsrDnDENKT2nc0i/1kdcQnrBBWaGPPUNv91EsBgSWm+T5ZrnBgUPdE
   MuPyindAEVx9qUVyGOEDNW2HeGrlclF2JihYp+5tOZ43p3Coz2tDKaRBc
   RpU+LdL/R1NbfOFOyJtS0YVdEY0v7/VxelSz7cz3F46nRS5VGFL9LHvZu
   F5pNPmIemyfSoQPT7CC17LplCkGXKoAUMD0aEmo5QqbADXrw6rQQPZ80c
   hhQSeOcoxa90pVNgt94gPHGk7gl4IhaS0OSoQIegDQAmFNz5v5HO1evia
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="340695819"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200";
   d="scan'208";a="340695819"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 16:56:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="731796522"
X-IronPort-AV: E=Sophos;i="5.99,277,1677571200";
   d="scan'208";a="731796522"
Received: from molivas-mobl.amr.corp.intel.com (HELO [10.251.17.233])
 ([10.251.17.233])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 16:56:23 -0700
Message-ID: <e84d7ffe-1a7f-be3c-4c29-c66ab0432bb3@linux.intel.com>
Date: Mon, 15 May 2023 18:56:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: Audio output heavily distorted on Xen PV dom0 if not recording
 (Intel ADL)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Alex Xu <alex_y_xu@yahoo.ca>,
 Harald Arnesen <harald@skogtun.org>, Jaroslav Kysela <perex@perex.cz>
References: <ZGJSRmtZ5SBOLe5u@mail-itl> <87a5y5pdq1.wl-tiwai@suse.de>
 <ZGKhPxwfXJaxnjZt@mail-itl>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZGKhPxwfXJaxnjZt@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7FN3XZGVWSDMTCDQQCACLVDDM74KI6QO
X-Message-ID-Hash: 7FN3XZGVWSDMTCDQQCACLVDDM74KI6QO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7FN3XZGVWSDMTCDQQCACLVDDM74KI6QO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




>>> I have a rather interesting issue on HP EliteBook 1040, with Intel ADL
>>> HDA. Sometimes (often) audio output is heavily distorted, but then
>>> opening pavucontrol or just launching `parecord /dev/null` fixes the issue
>>> instantly. But, when the mixer or recording is closed, then few seconds
>>> later issue comes back.
>>>
>>> You can hear this at https://cloud.marmarek.net/s/46prqZnwrqDkBdD
>>> Initially recording was running, then about 10s stopped and you can
>>> hear the issue few seconds later. Then I starter recording again, and
>>> the issue is gone.
>>> This is how it should sound: https://youtube.com/watch?v=4Tr0otuiQuU
>>> I do not see any kernel messages when issue happens.
>>>
>>> The issue happens on Linux 6.1.26, 6.2.10, and 6.3.2. I haven't tested
>>> other versions. It happens only when running under Xen (in PV dom0). The
>>> very same Linux started directly works fine. Full dmesg of both native
>>> and Xen boots is at https://gist.github.com/marmarek/548ee79282446344a172109bcd943930
>>>
>>> When running Linux 6.3.2 there, I noticed that just after boot first
>>> playback is okay, but if I start and stop recording it breaks. And then
>>> after some time of idle it fixes itself again. I have not observed this
>>> behavior on 6.2.10 (it was broken initially too), but I could be also
>>> doing some things differently. 
>>>
>>> I have few other ADL-based systems (but not HP), and they do not show
>>> this issue, only this HP laptop is affected. Example dmesg from another
>>> ADL-based system:
>>> https://gist.github.com/marmarek/38c5ba3ec58f9300fbc1842ddc9fa4f5

>>
>> Could you try to switch to the legacy HD-audio driver (e.g. by passing
>> snd_intel_dspcfg.dsp_driver=1 option) and check whether the issue
>> persists or not?  This will narrow down whether it's SOF-specific
>> problem or not, at least.
> 
> This does help! With snd_intel_dspcfg.dsp_driver=1 the issue doesn't
> happen anymore, the audio output just works the whole time. But, the
> built-in microphone disappeared, only external (unplugged) is listed. I
> guess that's kind-of expected.

Can you check what happens with a headphone and the SOF driver?

The SOF driver doesn't really know/care what is on the other side of the
HDaudio bus, so it'd be good to rule-out an amplifier-specific
configuration issue.

