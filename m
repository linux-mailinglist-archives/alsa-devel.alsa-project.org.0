Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D9278C732
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 16:18:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67B85DEE;
	Tue, 29 Aug 2023 16:17:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67B85DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693318692;
	bh=mIXi4VnZ2Tu1yVzadE65zNJqQwtahCq6DztaxKEtuMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WQ9GvNqb3KjBz5etExkoAEFPEuejAHykeiQr6HgNWanBwGKmZMW7Jg5ecBCMZjj70
	 qlpyXXlXvMItsOjJl6NxtrZk0zhYOtMDH9wPnBwEeaAlwKNwROdlMPu01OUCkg+/ZE
	 ZGPvy4CR988z4tBuxGPJT1ums8lSSrswWIylFErM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 001E0F8055C; Tue, 29 Aug 2023 16:16:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69CABF80536;
	Tue, 29 Aug 2023 16:16:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EE7AF80536; Tue, 29 Aug 2023 16:16:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E70CDF80094
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 16:16:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E70CDF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VH7BNc9R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693318608; x=1724854608;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mIXi4VnZ2Tu1yVzadE65zNJqQwtahCq6DztaxKEtuMc=;
  b=VH7BNc9RkB8tvgCKvbyOZ8TVZTZ/3ewj/dS/asERZnM9HWYlgOFxfw3S
   y2liFL0roC8VCYF/zrkPdZrp2LXvqgPs3Q8/FmxsZV+iPoxw7/GOXG1x0
   S0cJmD8pULK3csz12TNzTKjLUwJ98X2+8cM99JHBzvW6ILiA+fSrz/7Tp
   zPOXby16g9QdtiRdF/WWtlMAUUOJwC/hp9XKryWeQtUdaK9ZypWu+NxO9
   N0sCgqYXMAuWHLcwRfRnZCOFZKVzui9C4Y7PZboygScD59zdThKnnboPI
   diDJSt6rl5zk7rqtIeLDW2Dg+L26e8qkb2RBMFJ0HuTES3zdA/EVv2xC3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="439329359"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000";
   d="scan'208";a="439329359"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 07:16:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="862259273"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000";
   d="scan'208";a="862259273"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 29 Aug 2023 07:16:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qazWC-004tqV-1k;
	Tue, 29 Aug 2023 17:16:32 +0300
Date: Tue, 29 Aug 2023 17:16:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 1/1] ALSA: control: Use list_for_each_entry_safe()
Message-ID: <ZO39wMfKDmXc1+ms@smile.fi.intel.com>
References: <20230829135252.3915124-1-andriy.shevchenko@linux.intel.com>
 <87ttsit08x.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ttsit08x.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: D3Z5T5EVXR64DYYU7USPDBV23ZOWFHSI
X-Message-ID-Hash: D3Z5T5EVXR64DYYU7USPDBV23ZOWFHSI
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D3Z5T5EVXR64DYYU7USPDBV23ZOWFHSI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 29, 2023 at 04:02:38PM +0200, Takashi Iwai wrote:
> On Tue, 29 Aug 2023 15:52:52 +0200,
> Andy Shevchenko wrote:
> > 
> > Instead of reiterating the list, use list_for_each_entry_safe()
> > that allows to continue without starting over.

> Through a quick glance, it should be OK, but I need to read and
> understand whether this change is perfectly safe or not -- unless
> Jaroslav gives his review and ack.

Sure.

> > ---
> > 
> > Takashi, if you have anybody or want yourself to spend some time,
> > I believe you can simplify a lot the parser in this file with
> > the help of lib/cmdline.c APIs.
> 
> Thanks for the hint.  Yeah, it looks feasible, but too late for 6.6,
> it's a nice TODO ;)

Of course.

Just a reference what I did to gpio-aggregator module:
ac505b6f5fa8 ("gpio: aggregator: Replace custom get_arg() with a generic next_arg()")
deb631c40114 ("gpio: aggregator: Replace isrange() by using get_options()")


-- 
With Best Regards,
Andy Shevchenko


