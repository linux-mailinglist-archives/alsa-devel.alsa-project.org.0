Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D049770E5BB
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 21:37:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13A221ED;
	Tue, 23 May 2023 21:37:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13A221ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684870677;
	bh=bIDV6MM067Jxy1Em6Dzjmp3FnQwt9XSOxCVomJpmKhs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UxtuOdDvfebOwSYigVHsyv2SFGEKVElqm/j2AUze5METzv1w0/3X4e8jEqtnHDL9/
	 IdH32wtaDStKK7WddD2OdtgaPPjobeEN40JubtCVkQ2UAiuDVmBOjekViOj89rx4U2
	 kA9U3WgXuSlgnyCLeB46C6Ku6oPIjgft3dGBdK9Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4694CF80544; Tue, 23 May 2023 21:37:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6AA8F80249;
	Tue, 23 May 2023 21:37:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 637E1F8024E; Tue, 23 May 2023 21:37:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1674DF800DF
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 21:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1674DF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mNIFSeWc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684870619; x=1716406619;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bIDV6MM067Jxy1Em6Dzjmp3FnQwt9XSOxCVomJpmKhs=;
  b=mNIFSeWclJ0QM9SA9yPTTOmKd8gPD0FEhTfot6sOiA7tVPR7m3mBd4Pr
   xU6B4Ej9iQ9EsKufUPNQPFGzAAfKBYbsfUizJULPHPGrjPfYspPs8Y070
   h9NqyGW9IwIR0rv0R5z2sLSXREaJ6qOIfmGLfKnoWNrDN8ktkD2Llt3s9
   T67qqrK5a8p0qOQ4vGlntuGgw2JevsqB8z+2pA31XNo2vRd53OfNkWWoa
   MSZaKXlewNQxj/4qTPg8zfHYVYYbZ7/lwvNQ9Vo8AaATiR4Z/8+DJf0rS
   Q0ybz1+4nZ25UO+o71fjbIP0D24pAlao22IUX6HAOb24LdYhzfUTDcr4R
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="416801021"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400";
   d="scan'208";a="416801021"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 12:36:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="698187849"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400";
   d="scan'208";a="698187849"
Received: from srusakov-mobl.amr.corp.intel.com (HELO [10.209.35.87])
 ([10.209.35.87])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 12:36:54 -0700
Message-ID: <c8010d93-b02e-4d13-e0ae-b265151fc155@linux.intel.com>
Date: Tue, 23 May 2023 14:36:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: rt5682: Use a maple tree based register cache
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20230419-asoc-rt5682-maple-v1-1-ed40369c9099@kernel.org>
 <1ce6bb84-3140-3953-e995-00eb7b16f386@linux.intel.com>
 <73925372-33dc-46ac-9d01-a43f10988d28@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <73925372-33dc-46ac-9d01-a43f10988d28@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RLF7CHEHFWXYPVSA7EAFQLZBKDB36D2H
X-Message-ID-Hash: RLF7CHEHFWXYPVSA7EAFQLZBKDB36D2H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RLF7CHEHFWXYPVSA7EAFQLZBKDB36D2H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/23/23 14:28, Mark Brown wrote:
> On Tue, May 23, 2023 at 02:24:53PM -0500, Pierre-Louis Bossart wrote:
> 
>> Wondering if this is the root cause of the regression we're seeing in
>> [1] on a Chromebook with rt5682 in SoundWire mode?
> 
>> I don't see any other changes to this codec driver and the first problem
>> detected seemed to happen when we did an upstream merge last week.
>> Unfortunately the last merge was on April 24 (sof-dev-rebase-20230424)
>> which is just the day before this commit was added...
> 
> Try a revert?

I can try, unfortunately that device is not directly testable with a
simple PR test so it'll take time.

I was just hoping that someone smarter than me had an explanation on the
locking issue. We only use interrupt threads and workqueues, not sure
why sleeping is an issue.
