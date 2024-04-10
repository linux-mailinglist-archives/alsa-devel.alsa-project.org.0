Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7207C89EE04
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Apr 2024 10:52:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B795223DE;
	Wed, 10 Apr 2024 10:52:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B795223DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712739136;
	bh=llflBMjpVikAxFW8rePp9UokFvoLbTOioq/ngw5Q7bc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X/16vWGiLUMV4uhuJaBvtg3x28B13ed76bXWTBQrlhHqbXf/INgYQ6JldFqLceUOK
	 sh4mCFAuK71/a5f9jplYCyRRANGxBWKAuXhJKlwjBqkBoT3reDe6h6EDqO0VhKsKu7
	 o6dTiR6TXmvfH/BlBvY6A74ZDULKkrKbLXp55Umk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9FBDF805A0; Wed, 10 Apr 2024 10:51:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE492F8059F;
	Wed, 10 Apr 2024 10:51:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C7F8F8026D; Wed, 10 Apr 2024 10:49:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49F37F8013D
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 10:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49F37F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=n5lL1pZg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712738937; x=1744274937;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=llflBMjpVikAxFW8rePp9UokFvoLbTOioq/ngw5Q7bc=;
  b=n5lL1pZgN9g98cRNdtvZLfZo1++bvfHUKkdDWjMsZasDqCkHURIMN9be
   xo325M5NBJhuL64TpeF/fxXU09iVhcuqq3Uc0oxemh0Dgp6AOOY00DaDb
   LVOWshqOZtxkcHoTzEp1aHqvShQxoZtxEZFKXhYWAaK4xpdu8zmuxNz4h
   B+/N07Bq2fsCPaZ5ekpbMvQlY7dk4svKp11Bodt23dr9zIFrEzqLSGeLu
   Hm3w+BdeZHVXgyUmfmJvZ6v2luc4v8N4Jmr9Jl86fZiLBeA+FjSTM73Ww
   9wLDZUZ6u4q5PUUphe1Tp/1wGi7FqstMeSx53oCleOoy5SWNH4Xc5XNFW
   A==;
X-CSE-ConnectionGUID: HZnBLLOGQBmhrKD/M+fNDw==
X-CSE-MsgGUID: EYKGFt2eS9SuZrcxdF+nMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7946686"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000";
   d="scan'208";a="7946686"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 01:48:51 -0700
X-CSE-ConnectionGUID: hRDkTEuFS5aMLs4/x8bsJA==
X-CSE-MsgGUID: 66yrYos4S4ucf3MU4jxtUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000";
   d="scan'208";a="20962978"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 01:48:50 -0700
Message-ID: <f86cbe94-3a31-40f2-a637-576b15fb75ac@linux.intel.com>
Date: Wed, 10 Apr 2024 10:48:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2.5] ASoC: Replace dpcm_playback/capture to
 playback/capture_assertion
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, Cezary Rojewski <cezary.rojewski@intel.com>
References: <87msq2kjvo.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87msq2kjvo.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HVVOGEIVU6SRBZXONVYPINNFCJY6XW7K
X-Message-ID-Hash: HVVOGEIVU6SRBZXONVYPINNFCJY6XW7K
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HVVOGEIVU6SRBZXONVYPINNFCJY6XW7K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 4/10/2024 4:54 AM, Kuninori Morimoto wrote:
> 
> Hi Mark, Amadeusz, Jerome, Pierre-Louis
> 
> This is v2.5 patch which is preparation for v3.
> Because full-patch-set has over 20 patches, to avoid posting huge
> patch-bomb, I try to post main patch only for preparation.
> 
> In v2.5, it will use xxx_assertion flag, and exising dpcm_xxx
> and xxx_only flags will be converted to it. I think it can keep
> compatibility and possible to indicate link error same as before
> which was conserned by Pierre-Louis. Please let me know if it still
> not good match.
> 
> One of my big consern is Amadeusz/Jerome's idea which uses "XXX | YYY"
> style. To avoid confusion, let's name each style as below here.
> 
> [Flag style]
> 	unsigned int flags;
> 	#define SND_SOC_FLAGS_ASSERTION_PLAYBACK	BIT(x)
> 	#define SND_SOC_FLAGS_ASSERTION_CAPTURE		BIT(x)
> 	...
> 
> [BitField style]
> 	unsigned int playback_assertion:1;
> 	unsigned int capture_assertion:1;
> 	...
> 
> This v2.5 patch is using [BitField style] and I think it is not a big
> problem from "code point of view", but I think [Flag style] is
> better for "human understandable point of view", because we can define like
> below, for example.
> 
> 	#define SND_SOC_FLAGS_AVAILABLE_PLAYBACK			/* no flag is needed */
> 	#define SND_SOC_FLAGS_AVAILABLE_PLAYBACK_WITH_ASSERTION		SND_SOC_FLAGS_ASSERTION_PLAYBACK
> 	#define SND_SOC_FLAGS_AVAILABLE_CAPTURE				/* no flag is needed */
> 	#define SND_SOC_FLAGS_AVAILABLE_CAPTURE_WITH_ASSERTION		SND_SOC_FLAGS_ASSERTION_CAPTURE
> 	#define SND_SOC_FLAGS_AVAILABLE_BIDIRECTIONAL			/* no flag is needed */
> 	#define SND_SOC_FLAGS_AVAILABLE_BIDIRECTIONAL_WITH_ASSERTION	(SND_SOC_FLAGS_ASSERTION_PLAYBACK | SND_SOC_FLAGS_ASSERTION_CAPTURE)
> 	#define SND_SOC_FLAGS_AVAILABLE_PLAYBACK_ONLY			SND_SOC_FLAGS_ASSERTION_PLAYBACK
> 	#define SND_SOC_FLAGS_AVAILABLE_CAPTURE_ONLY		 	SND_SOC_FLAGS_ASSERTION_CAPTURE
> 
> Switch to [Flag style] is OK for me, but one consern is that in such
> case, people will wonder "why ASoC is using both [Flag style] and
> [BitField style] in the same time ?", because we are using
> [BitField style] for other flags.
> 
> So, my suggestion is that next v3 patch uses [Flag style].
> And after that, post new patch-set to switch
> [BitField style] to [Flag style] for other flags.
> But I wonder is this good approach ?
> 
> v2 -> v2.5
> 	- use xxx_assertion flag
> 	- dpcm_xxx -> xxx_assertion
> 	- xxx_only -> xxx_assertion
> 	- only [01/xx] patch
> 
> v1 -> v2
> 	- based on latest ASoC branch
> 	- keep comment on Intel
> 	- tidyup patch title
> 	- tidyup DPCM BE warning output condition
> 	- Add new patch for Document
> 
> Link: https://lore.kernel.org/r/87o7b353of.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Renesas Electronics
> Ph.D. Kuninori Morimoto

Hi,

I've looked a bit at why the original flags were introduced.

For dpcm_playback and dpcm_capture there is
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1e9de42f4324b91ce2e9da0939cab8fc6ae93893
it feels like it works around the fact that some DAIs didn't had set 
channels_min properly, which will of course not work with 
snd_soc_dai_stream_valid(). Perhaps if we want to remove this flag we 
should just set channels_min everywhere where we want to have playback 
or capture and just remove flag?

Similar story with playback_only and capture_only, which was introduced 
in two patch series to remove unsupported FEs from list of available ones:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d6bead020d8f8bcaca5cdcb035250c44b21c93e7
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a90e6053baa61feed8b19a9f4cbec6b56479d1ba
I feel like if driver author knows that one of directions should be 
unused they should just set min_channels to 0 to disable it on either BE 
or FE DAI (personally I would prefer FE DAI in most cases).

Following above we would have no need for any flags at all. What do you 
think?

Thanks,
Amadeusz
