Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4E175C4E2
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 12:43:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5339208;
	Fri, 21 Jul 2023 12:42:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5339208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689936200;
	bh=YJlPOuKgHIq7wccQKnt6l+jd6D94pZUedrcfoFEHae4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R4bNKjf6NKv6xMxcFn1pGGFqX7WXP2cEyihRp55GpmEnjfhz3TkJZSkrYHTKtBDfO
	 YYy/+6Zgd6CpMRJ/MHXux5BNu9EeWlRfldy0SUmzDj/M3N4wPG5vNS0sHJ9RsZionk
	 +ybnJIDHQflXf4rygG15qFFWNDhmV8PjU745xW0Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11B1CF800D2; Fri, 21 Jul 2023 12:42:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93389F8032D;
	Fri, 21 Jul 2023 12:42:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D226F8047D; Fri, 21 Jul 2023 12:42:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2E744F8027B
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 12:42:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E744F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CwaLTQD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689936140; x=1721472140;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YJlPOuKgHIq7wccQKnt6l+jd6D94pZUedrcfoFEHae4=;
  b=CwaLTQD4/4gZILBfKwnfEf4wRyCWqxwcK7TrQNISNkzVgd6EiAm+0s0A
   InNRFXhDDJY2P4W7WyOd3n7ACx4eeIcekWrcEFjurJQKezqUq5QP7exDe
   mu54aJfGcV5ybUR++u4iI65aB+4sqUjx+HX7VhQJNR3PXwH5h+w1emKIj
   Pae8DFA2mo0UMmaYENGEwAyezhd6JNNZUDU6mZcZ/zkgi9CinHXg4hUHw
   BPj46cUjMTn+iRwHa5Qjt/Sm+kMkJ5B+ESsP8Wt6L03CCCv54xndxFn8t
   W/Ky/tJYNWL2stSajSrs5RreIP/eumUGAX8XUaSRCEzcHhhsZvvLJq5X0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="367031884"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="367031884"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 03:42:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="838510268"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200";
   d="scan'208";a="838510268"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 21 Jul 2023 03:42:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qMnaK-000WQ3-2e;
	Fri, 21 Jul 2023 13:42:08 +0300
Date: Fri, 21 Jul 2023 13:42:08 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v1 1/1] ALSA: korg1212: Re-use sockptr_t and respective
 APIs
Message-ID: <ZLphAJG4Tz8zLUSN@smile.fi.intel.com>
References: <20230721100146.67293-1-andriy.shevchenko@linux.intel.com>
 <878rb9h901.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878rb9h901.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: MPZUQ2GPLJ3XZQVJ4QLYQ3UVVCZN4BJF
X-Message-ID-Hash: MPZUQ2GPLJ3XZQVJ4QLYQ3UVVCZN4BJF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MPZUQ2GPLJ3XZQVJ4QLYQ3UVVCZN4BJF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jul 21, 2023 at 12:08:46PM +0200, Takashi Iwai wrote:
> On Fri, 21 Jul 2023 12:01:46 +0200,
> Andy Shevchenko wrote:
> > 
> > The sockptr_t (despite the naming) is a generic type to hold kernel
> > or user pointer and there are respective APIs to copy data to or
> > from it. Replace open coded variants in the driver by them.
> 
> While I see the benefit, I feel this is very confusing.  If we use the
> API for a generic use, it should be renamed at first.
> 
> Also, the current function actually follows the call pattern, and we
> know in the caller side whether it's called for a kernel pointer or a
> user pointer.  So, if any, the PCM core callbacks should be revised to
> use a generic pointer instead of fiddling in each driver side.

Any suggestion for the name?
And I believe for the bigger series the new callback should be added first.

-- 
With Best Regards,
Andy Shevchenko


