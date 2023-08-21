Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 011AC782639
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 11:27:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90D88832;
	Mon, 21 Aug 2023 11:26:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90D88832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692610052;
	bh=oligcDY65hRN+faG6t2KYv3VGifp5EVHySffw6MwQCI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PkerZbmFqe9xZ0/GdjmzaRXGk8MegzNOPtPg3VIhqBNijvSySptwub30GvMlOTpHP
	 CfDyacliQMO26qlhaDs5BT+FWEqE1eRjibJEgTLPJMNBAFOEBODsLoF9FRJF6kVw41
	 0XQRBzVmTyTx5AhDCJ9sRDF4EKJhXbenDQ7EI+MI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A5CDF80508; Mon, 21 Aug 2023 11:26:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C012AF8016C;
	Mon, 21 Aug 2023 11:26:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 939B0F80199; Mon, 21 Aug 2023 11:26:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27F3AF800BF
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 11:26:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27F3AF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=URRzjQuC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692609996; x=1724145996;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oligcDY65hRN+faG6t2KYv3VGifp5EVHySffw6MwQCI=;
  b=URRzjQuCMMrpqmb2duNuk43IK/DEgH4bDmFiTQorIA5830s92cZlvmWq
   BXb+LKUotKTYIbA7VqnzR8uBdngtO41mKeg5g/w1NmMMMPcIBa25Bkx1z
   osk/i9oknGwKiTThlDy6S8gX/AJBH8p2uKf0etuHKs7296tuXpH22pryu
   9m5rayYMm15XHCyBK45zZAF7OB/zJ2YGNd/RGjIZbJe0MUn23fVx/WGVU
   nmEAS37wE7sEGJFiW38GSfkUGtzve5Pp/D1SRDTYEbiWt9N45Ztxl1bdf
   fCaVStzsE9RbItr8iKW6BsSG7EMVPhBb81Q2qGwwIVScFiUYOIfQq4d3Y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="372444989"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200";
   d="scan'208";a="372444989"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 02:26:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="770874433"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200";
   d="scan'208";a="770874433"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 21 Aug 2023 02:26:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qY1B1-007cDD-0e;
	Mon, 21 Aug 2023 12:26:23 +0300
Date: Mon, 21 Aug 2023 12:26:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Shenghao Ding <shenghao-ding@ti.com>, robh+dt@kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, kevin-lu@ti.com,
	13916275206@139.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
	mengdong.lin@intel.com, baojun.xu@ti.com, thomas.gfeller@q-drop.com,
	peeyush@ti.com, navada@ti.com, broonie@kernel.org,
	gentuser@gmail.com
Subject: Re: [PATCH v3 2/2] ALSA: hda/tas2781: Add tas2781 HDA driver
Message-ID: <ZOMtvgKiCsGY+iOz@smile.fi.intel.com>
References: <20230818085558.1431-1-shenghao-ding@ti.com>
 <20230818085558.1431-2-shenghao-ding@ti.com>
 <4c1b44b5-995a-fac7-a72b-89b8bf816dd2@linux.intel.com>
 <ZN+j3LmfUW2vB+QS@smile.fi.intel.com>
 <87jztq9iqv.wl-tiwai@suse.de>
 <ZOMpDEZoF8ZK7vU0@smile.fi.intel.com>
 <87jzto92p8.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzto92p8.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: NPZGHWCYSVOSWANVLQGHF5HA57EPELSC
X-Message-ID-Hash: NPZGHWCYSVOSWANVLQGHF5HA57EPELSC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NPZGHWCYSVOSWANVLQGHF5HA57EPELSC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 21, 2023 at 11:14:59AM +0200, Takashi Iwai wrote:
> On Mon, 21 Aug 2023 11:06:20 +0200,
> Andy Shevchenko wrote:
> > On Sun, Aug 20, 2023 at 11:16:08AM +0200, Takashi Iwai wrote:
> > > On Fri, 18 Aug 2023 19:01:16 +0200,
> > > Andy Shevchenko wrote:
> > > > On Fri, Aug 18, 2023 at 11:00:34AM -0500, Pierre-Louis Bossart wrote:

...

> > > > > > +	 tas2781_generic_fixup(cdc, action, "i2c", "TIAS2781");
> > > > > 
> > > > > TI ACPI ID is TXNW
> > > > > 
> > > > > https://uefi.org/ACPI_ID_List?search=TEXAS
> > > > > 
> > > > > There's also a PNP ID PXN
> > > > > 
> > > > > https://uefi.org/PNP_ID_List?search=TEXAS
> > > > > 
> > > > > "TIAS" looks like an invented identifier. It's not uncommon but should
> > > > > be recorded with a comment if I am not mistaken.
> > > > > 
> > > > > > +}
> > > > 
> > > > Thank you, but actually it's a strong NAK to this even with the comment.
> > > > We have to teach people to follow the specification (may be even hard way).
> > > > 
> > > > So where did you get the ill-formed ACPI ID?
> > > > Is Texas Instrument aware of this?
> > > > Can we have a confirmation letter from TI for this ID, please?
> > > 
> > > This is used already for products that have been long in the market,
> > > so it's way too late to correct it, I'm afraid.
> > > 
> > > What we can do is to get the confirmation from TI, complain it, and
> > > some verbose comment in the code, indeed.
> > 
> > Oh, no! Who made that ID, I really want to point that at their faces.
> > Look at the Coreboot (successful) case, they created something, but
> > in time asked and then actually fixed the ill-formed ID (that was for
> > one of RTC chips).
> > 
> > For this, please make sure that commit message has that summary, explaining that
> > - states that ID is ill-formed
> > - states that there are products with it (DSDT excerpt is a must)
> > - lists (a few?) products where that ID is used
> > - ideally explains who invented that and Cc them to the patch, so they will
> >   know they made a big mistake
> 
> Sure, we should complain further and ask them that such a problem
> won't happen again.  I'm 100% for it.
> 
> But the fact is that lots of machines have been already shipped with
> this ID since long time ago, and 99.99% of them have been running on
> Windows.  Hence I expect that the chance to get a corrected ID is very
> very low, and waiting for the support on Linux until the correction of
> ID actually happens makes little sense; that's my point.

Yes, I understand that. But we have to inform them to prevent from
repeating this big mistake in the future.

-- 
With Best Regards,
Andy Shevchenko


