Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E4165D0A9
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 11:30:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FD3EA370;
	Wed,  4 Jan 2023 11:29:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FD3EA370
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672828246;
	bh=arwmrU6pTPoOLqCBDphrff/+pF//A9r4I80+Attw2tM=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NTqQK0daEFscFy3oawN8J85bNc3uVwhNdHowvmW2s2PSA48F2fzPw/2e9komxEq94
	 WPjZpPabkAC+joDmvEzlS0EGCLtSYNGBB/g0N9pW799yK9S9Fm5a3KdglpOGWDK3um
	 RZsGfvN8J0cqfr+G7moKMaOkmoP91nMO1fpIvqRY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0F8CF8023B;
	Wed,  4 Jan 2023 11:29:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B18CF80553; Wed,  4 Jan 2023 11:29:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 404A9F80553
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 11:29:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 404A9F80553
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VKbd0v6a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672828181; x=1704364181;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=arwmrU6pTPoOLqCBDphrff/+pF//A9r4I80+Attw2tM=;
 b=VKbd0v6aZORSvT71d5cqwMFkncLd3P8K8xDhHVSA6jFmyUwyO2+xf+I2
 fYkb5TwOS/zA8tFCwQTDpD7g+4XEl9pU/xgbgWdx4q9Uc8mPxAPVqhYHt
 wuusCXzd5RvgLf0wiS4qxYozDATbu8FmbEcB8egr/gcdDz/7UGMveCMVQ
 HkNQnbFLYCWVmKswAMRfGDZpMhOT2T+ipf7tab+AplihOn3zfdfT37f6a
 +SamMAbGsMv4AGD9CSf19gb1Uuegl3imwhx72E66Wnqqu6jq6fbHDEd2z
 OHaeVej0H+YxhLX09Japtt8Dp8cvP+tr95yQ7Hp55/8kmmfIpk7Q/OPqs A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="305406982"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="305406982"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:29:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="718407267"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="718407267"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga008.fm.intel.com with ESMTP; 04 Jan 2023 02:29:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pD11W-004GDy-0d; Wed, 04 Jan 2023 12:29:30 +0200
Date: Wed, 4 Jan 2023 12:29:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v1 1/5] ASoC: Intel: bytcht_cx2072x: Replace open coded
 acpi_dev_put()
Message-ID: <Y7VVCc7TjY3YsJoV@smile.fi.intel.com>
References: <20230102203037.16120-1-andriy.shevchenko@linux.intel.com>
 <731b2d59-22f1-a456-bcfc-040a1adccce0@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <731b2d59-22f1-a456-bcfc-040a1adccce0@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Jan 03, 2023 at 09:08:20AM -0600, Pierre-Louis Bossart wrote:
> On 1/2/23 14:30, Andy Shevchenko wrote:
> > Instead of calling put_device(&adev->dev) where adev is a pointer
> > to an ACPI device, use specific call, i.e. acpi_dev_put().
> > 
> > Also move it out of the conditional to make it more visible in case
> > some other code will be added which may use that pointer. We need
> > to keep a reference as long as we use the pointer.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Answering for the series: we should make the change across all Intel
> machine drivers. I see at least four cases that were missed
> 
> bytcr_rt5640.c:         put_device(&adev->dev);
> bytcr_rt5651.c:         put_device(&adev->dev);
> bytcr_wm5102.c: put_device(&adev->dev);
> sof_es8336.c:           put_device(&adev->dev);

Aren't they (they all problematic, btw) covered by the fixes series
https://lore.kernel.org/r/20230102203014.16041-1-andriy.shevchenko@linux.intel.com?

-- 
With Best Regards,
Andy Shevchenko


