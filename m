Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3102778C9B6
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 18:34:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEEFD203;
	Tue, 29 Aug 2023 18:33:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEEFD203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693326886;
	bh=JnCh5FlEFD2yMrgm5pRcs0ZJWSNt4zX444Chq8Xi3rE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W9f1pRIsjw7sAr32zHmshQcE6lLvY0NTWkMSEnxa0O/oD0y4IXS2wWrTid2AcVzn1
	 fNkGhLFPrzLS1+B6KCkLzCcvQwYFfqRh4Xisxj7YNiP3iPRk5Tv21JcTaBoaKhrowx
	 uT3PbKm9PurCVMFnKeoFEmWQyFLFyt9GUgxo37cE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F847F8032D; Tue, 29 Aug 2023 18:33:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C4E3F80155;
	Tue, 29 Aug 2023 18:33:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4367FF80158; Tue, 29 Aug 2023 18:33:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B15BF80094
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 18:33:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B15BF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FHnzMe/L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693326825; x=1724862825;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JnCh5FlEFD2yMrgm5pRcs0ZJWSNt4zX444Chq8Xi3rE=;
  b=FHnzMe/LP25fCPmeCPBDPyjrymNzWfKcoRzsffVoYjLU97/Zwqee3G9O
   eFugBEzrfkNPOnLozcN142HERx7sJQoCKZR/D1P5JdtFA6NovPc12hpLR
   JmY+zyV7T7tneiU1tUPGSw8DZgO5Je9Bvp8mziF9lYC1xPZe+JR5XC76n
   4E8B3RH6vEthwFOxNX5yICQg1CcOvU6rRv+EfVlEWXEdjFtpx7+oMwy6c
   A0xFVKpkQJzcKx3WPuPutD6LC3ocnO3sTmn89zJUzl7l6Z7SvmN/NktPR
   EsYdNo9mPKmUh8c5GGhTwwNw9w8W8jBSOD29571XA2nZQ0x/8B+fgsJFT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="360417028"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000";
   d="scan'208";a="360417028"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 09:30:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="1069529171"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000";
   d="scan'208";a="1069529171"
Received: from dcatx-mobl2.amr.corp.intel.com (HELO [10.209.185.124])
 ([10.209.185.124])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 09:30:13 -0700
Message-ID: <cc15a374-97b9-9b58-78b2-34241c5dd2a9@linux.intel.com>
Date: Tue, 29 Aug 2023 11:30:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] ucm: docs: Add EchoReferenceDev
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>,
 Curtis Malainey <cujomalainey@google.com>
Cc: cujomalainey@chromium.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 ethan.geller@gmail.com
References: <20230824213312.1258499-1-cujomalainey@chromium.org>
 <ce20d02b-56ed-acd1-411b-8c68d8cabea8@perex.cz>
 <CAOReqxiDZOAEYYb5c73AHu+Nd2vZinLR5qdMAVJnEcV8TS6=Nw@mail.gmail.com>
 <6d498d35-841d-4ea4-2fd9-990f9b02563e@linux.intel.com>
 <6fc8a33a-52f2-0cd1-6259-b2b974548602@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <6fc8a33a-52f2-0cd1-6259-b2b974548602@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SG47EGPNYHKD3BZDVXVTDYG5G6VO47FF
X-Message-ID-Hash: SG47EGPNYHKD3BZDVXVTDYG5G6VO47FF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SG47EGPNYHKD3BZDVXVTDYG5G6VO47FF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




> It seems that there are some assumptions. I will try to address some
> things:
> 
> You can enable/use multiple modifiers per device.
> 
> The modifiers may define extra PCM streams in the standard Value section
> - you can use CapturePCM value for the modifier like "Echo Reference".
> Modifiers may alter the characteristics of the original UCM device
> stream (using command sequences), too.

Sorry, not following.

The 'modifier' has to be selected by userspace, isn't it? "someone" has
to tell UCM that the 'echo reference' is on.

And that's precisely the conceptual issue I have. The echo reference in
our cases is ALWAYS available when the speaker output is selected.

In other words, we are asking userspace to select something that is
always present and available. Or put differently, a modifier that's
always applicable is not really a modifier, is it?

And last, the whole story of the echo reference is that it needs to be
opened when the speaker output is opened. How would we model this with
the modifier concept?

> Modifiers are an extra layer on top of devices. I don't think that we
> have any default relation between the modifier PCM device and the
> original PCM device (from the UCM device definition). A new value to
> describe this (like "ReplacePlaybackPCM 1") may be introduced. Another
> issue is when multiple modifiers with this description are active - they
> conflict, so it should be described somewhere, too. Perhaps,
> "ConflictingModifier" array may be added to API. But those extensions
> are not required for the "Echo Reference" modifier.

Right, the main issue here is that the PlaybackPCM and Echo reference
PCM are joined and need to be handled at the same time. It's not a
conflict, they are a bundle or a set of devices that cannot be used
independently.
