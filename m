Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B17A74357A
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 09:03:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 224817F4;
	Fri, 30 Jun 2023 09:03:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 224817F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688108630;
	bh=q2pTNjzhHW8jlt3w9eHrC1G1fKxCJqmX45Axu4S3b+k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EezMm1Uj78Q2froecDrHC40MBh+mX6zalYx7KE1qmtC/Js034/3oWW10BLJRRoejS
	 WVhX/88ntBJmJ+KYJYejcbTCu6lTW8huw+VZH8VuqxtsQ+4pGMVm656dzDMEL0RLdy
	 hK/19yW75gg0whkiUAUZbSydITJKiI3zjdKDE5bs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CFBDF80535; Fri, 30 Jun 2023 09:02:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11D6AF80212;
	Fri, 30 Jun 2023 09:02:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0959F80246; Fri, 30 Jun 2023 09:02:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 711BEF80169
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 09:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 711BEF80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=U+u2IIyV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688108570; x=1719644570;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=q2pTNjzhHW8jlt3w9eHrC1G1fKxCJqmX45Axu4S3b+k=;
  b=U+u2IIyVtsZkvAqqNr8DVahQsRCqoe8zJxZzX393rgTxgnVHXDZr5JjJ
   j1Id0eJbhosYDdonqeV6bHd8fOZfLyapIYaoTlq4Zam5IwwRMMx1B/ozL
   LP/+s+N6W4Tc/cZ6vnRP2CMH4kENlwMne08YHruiL0Tykh2OtY7n0iPi5
   O6UlRXL6lDIOwKfx+Sqr2JttyKI6CWLL2qWBg/k0uxl5dKoANJwh5Bc/b
   uoRfeTA3X8kHECwJCwWYiNcfxxQ62CfruOoCRS3I6E+WB6Dj66dhp3Bg/
   xZfoCCqF7+A1xn9N5na6D0g5QM0q+AE1s6s2qnxBNYlLGl2GxHM+0yxbu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="352154569"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200";
   d="scan'208";a="352154569"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 23:59:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="782983109"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200";
   d="scan'208";a="782983109"
Received: from ggoutam-mobl.amr.corp.intel.com (HELO [10.251.217.215])
 ([10.251.217.215])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 23:59:39 -0700
Message-ID: <ed61ddea-9a54-f42e-59f5-60472f09fc90@linux.intel.com>
Date: Fri, 30 Jun 2023 08:59:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 0/3] ASoC: SOF: pcm/Intel: Handle IPC dependent sequencing
 correctly
To: Sam Edwards <cfsworks@gmail.com>, peter.ujfalusi@linux.intel.com
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
References: <20230322094346.6019-1-peter.ujfalusi@linux.intel.com>
 <875080d0-8771-c47f-a86b-821fe33301b0@gmail.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <875080d0-8771-c47f-a86b-821fe33301b0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XZZFY3J62U4EOYKXQPZXN5OE7E6MKSRD
X-Message-ID-Hash: XZZFY3J62U4EOYKXQPZXN5OE7E6MKSRD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XZZFY3J62U4EOYKXQPZXN5OE7E6MKSRD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/30/23 08:33, Sam Edwards wrote:
> Hi folks,
> 
> When I upgraded my system to 6.4.0, I encountered a regression in audio
> output. In regression testing, I found that patch 1/3 here was the
> culprit, and the regression goes away entirely (on 6.4.0 final) when
> applying a patch that reverts this whole patchset. The problem is
> currently still unresolved even in broonie/sound.git.
> 
> The regression is an intermittent (few minutes on, few minutes off)
> distortion in audio output on my Tigerlake->ALC298 path. When playing a
> 440 Hz test tone, the output spectrum is distorted into 440 Hz, 560 Hz,
> 1440 Hz, 1560 Hz, 2440 Hz, 2560 Hz, and so on. Since this is the exact
> spectrum one would get if the output were modulated with a 1000 Hz Dirac
> comb, I interpret this to mean that the audio subsystem is dropping
> (zeroing) 1 sample every 1ms.
> 
> There seem to be conditions for this problem to come and go
> spontaneously -- in particular, it won't happen if my nvidia driver is
> unloaded. However, I can make it occur (even with no out-of-tree modules
> loaded) by sending several SIGSTOP->10ms->SIGCONT sequences to my
> pipewire daemon while it's playing audio. The distortion then continues
> until I send several more signals of that same sequence.
> 
> Now, aside from having some DSP background, I'm a total outsider to the
> ALSA and SOF world, so what follows is mere speculation on my part: I
> believe the problem has some probability of being "toggled" by a buffer
> underrun, which happens either deliberately by briefly interrupting
> pipewire, or accidentally due to bus contention from having my GPU
> active. Something (userspace? ALSA?) tries to restart the stream in
> response to that underrun, but this patchset makes stream stop+start
> more of a "warm reset," in that it doesn't clean up DMA. As a result, an
> off-by-one error somehow creeps into the DMA size, thus omitting the
> final sample of every 1ms transfer.
> 
> I am not sure if this is a regression introduced with this patchset, or
> merely a different bug that became apparent now that DMA isn't being
> reset when underruns happen. If it's the latter case, I'm happy to open
> an issue on Bugzilla instead. In either case, let me know if I can
> provide any additional troubleshooting information.

please file an issue here: https://github.com/thesofproject/linux/issues

It would help if you clarified a bit more what the issue is, it's not
clear to me if the problem happens during a long continuous playback or
when starting/stopping the stream.

Also try to disable SOF with the instructions in
https://thesofproject.github.io/latest/getting_started/intel_debug/suggestions.html
to make sure it's not an HDaudio codec issue.

Thanks!
