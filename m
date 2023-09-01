Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E547878FE3B
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Sep 2023 15:21:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BA5E9F6;
	Fri,  1 Sep 2023 15:20:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BA5E9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693574497;
	bh=bVS1ZI8wPeWDhI67JkVGmsuo/p94NgEEvHOQ73yeu8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NffiWiMdklAvglN7cGyDUcGiUD8h/mH1Tp5XwUNVWwp6yHn6CATo/1BvJRG/d9biO
	 SsbTIeQuQp0bl0/3D1UJWYxTh66x/fVvyvpi4d39R2afbpqqlXPbU5HzoeG443DHvR
	 7DWt8D/hvFcUB7eE1WJnm/boAhO1G3EWwvWDzlIc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2340F8032D; Fri,  1 Sep 2023 15:20:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 933ECF80155;
	Fri,  1 Sep 2023 15:20:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C4B6F80158; Fri,  1 Sep 2023 15:20:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80B1EF80094
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 15:20:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80B1EF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cjG1Q++d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693574420; x=1725110420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bVS1ZI8wPeWDhI67JkVGmsuo/p94NgEEvHOQ73yeu8g=;
  b=cjG1Q++dJPRuJjDwyXZuvHSOMGg9nRPFBPw2Wc/s7WHoy8+mCb7fGF6b
   IQ8jGwJlRXIAT6MvuTFIgVTp7auTiK6SSQ68U3IqHZx7QvmCYK5RRBQ6w
   hQ1SIKvUFQ6sVHWOLjihohC6DmhN7a6xYFJLjE28rfyTefKr9N6JkG27F
   NrSaLxGioR3ZEuHI17rrTO1WxhG6Hv7STpHQELlDUsblGu6QQLVG3zent
   kqdnWfatsyFaa+4BD6hVnuKVbwC0+lpGHvGtjVcuLZMfezbh+LQ722v3h
   MBZykqbYv5/uKfAkEnC22AK0G5FnGrS0OKPi74akp9rqWRZ3J47p7a4Zh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="380005970"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000";
   d="scan'208";a="380005970"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 06:19:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="986676875"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000";
   d="scan'208";a="986676875"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 06:19:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qc43y-005gKB-2p;
	Fri, 01 Sep 2023 16:19:50 +0300
Date: Fri, 1 Sep 2023 16:19:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v4 2/3] ASoC: wm8580: Remove trailing comma in the
 terminator entry
Message-ID: <ZPHk9tSC64clliFc@smile.fi.intel.com>
References: <20230901065952.18760-1-biju.das.jz@bp.renesas.com>
 <20230901065952.18760-3-biju.das.jz@bp.renesas.com>
 <ZPGmiWDErxnjGlMR@smile.fi.intel.com>
 <baefefc8-55d7-430a-9ec5-2c17c4577d11@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <baefefc8-55d7-430a-9ec5-2c17c4577d11@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 7XZKTTZAAAP2LFYE5WHRDQULGIQZR6RX
X-Message-ID-Hash: 7XZKTTZAAAP2LFYE5WHRDQULGIQZR6RX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7XZKTTZAAAP2LFYE5WHRDQULGIQZR6RX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Sep 01, 2023 at 01:54:58PM +0100, Mark Brown wrote:
> On Fri, Sep 01, 2023 at 11:53:29AM +0300, Andy Shevchenko wrote:
> > On Fri, Sep 01, 2023 at 07:59:51AM +0100, Biju Das wrote:
> 
> > > Remove trailing comma in the terminator entry for OF table.
> 
> > You are so fast :-)
> > This will produce an unneeded churn as you touch the same line twice in a row.
> 
> So do reviews which focus on very pedantic issues like this one...

If you fine with a series as is, take it!
It's really nothing to bikeshed about.

-- 
With Best Regards,
Andy Shevchenko


