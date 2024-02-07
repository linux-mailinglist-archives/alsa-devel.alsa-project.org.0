Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA5F84CEFD
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 17:36:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26057822;
	Wed,  7 Feb 2024 17:36:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26057822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707323812;
	bh=VoywwgjLXTwUOhSbbLxontbmbKuuFTrPOSRwdOlJD3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G0gE8OZrnGpdjVuTUiyO9045Y57uxsh6jPj96oFE+SaYMm0IgWI+3OWKpCd1bms2Q
	 mELkqychYx6tZePAqXSkRloQi3unxl0FBPV/ffNA5r0kjd2dvzNVWJl4uXmNxtmQxT
	 gtkMJ7xMNYalQtzoALjKoAv//E94U6CdltNs/Gkk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02C1DF801EB; Wed,  7 Feb 2024 17:36:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B458F805A9;
	Wed,  7 Feb 2024 17:36:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 075EEF801EB; Wed,  7 Feb 2024 17:36:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14C80F800EE
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 17:36:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14C80F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dYfvwdMz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707323769; x=1738859769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VoywwgjLXTwUOhSbbLxontbmbKuuFTrPOSRwdOlJD3g=;
  b=dYfvwdMzDrPKaLas1a+SxgRz8ovScRjHoqJLzZ1nchSPjE/UQ3i5rXt1
   8UuQf5kbr+wnT+VP+7p499fWmaLsWKwXrYCdKUyVKJi5oq4YYTr+6/cbf
   mrOODea4pY1wbRSmi54Rx1S01U9gI3KyzRozQBI2O0JBlybR5Z7fyS1HI
   D0fBP//JASyQhiI2TwBq6ixwx1KQ2sixcdFf+UvgLWwTfBtXZZGos3QdG
   z/QVIB2aKAPtRuXwyVmAfoId9zEoH1Ecn4Q4i+1iQFhVtd75LIbFZ27QH
   /8DCN8Gsu2HvlR9yGzihGclKoVEzs89SmT0gZ1Xzk86vG18JxiJNZnrAV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="12384564"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400";
   d="scan'208";a="12384564"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 08:36:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="910038493"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400";
   d="scan'208";a="910038493"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 08:35:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rXktw-00000002eqb-1cXu;
	Wed, 07 Feb 2024 18:35:56 +0200
Date: Wed, 7 Feb 2024 18:35:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, lgirdwood@gmail.com,
	perex@perex.cz, pierre-louis.bossart@linux.intel.com,
	13916275206@139.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
	bard.liao@intel.com, mengdong.lin@intel.com,
	yung-chuan.liao@linux.intel.com, baojun.xu@ti.com, kevin-lu@ti.com,
	navada@ti.com, tiwai@suse.de, soyer@irl.hu
Subject: Re: [PATCH v7] ASoc: tas2783: Add tas2783 codec driver
Message-ID: <ZcOxbA_plPDqN3YA@smile.fi.intel.com>
References: <20240207054743.1504-1-shenghao-ding@ti.com>
 <ZcOWZlXu1fL_haFU@smile.fi.intel.com>
 <ZcOiCFlqsnyAEgl3@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZcOiCFlqsnyAEgl3@finisterre.sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: LKPUXEPMWVCZPUJGVGYJZ6DJB4LDBOC7
X-Message-ID-Hash: LKPUXEPMWVCZPUJGVGYJZ6DJB4LDBOC7
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LKPUXEPMWVCZPUJGVGYJZ6DJB4LDBOC7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Feb 07, 2024 at 03:30:16PM +0000, Mark Brown wrote:
> On Wed, Feb 07, 2024 at 04:40:38PM +0200, Andy Shevchenko wrote:
> > On Wed, Feb 07, 2024 at 01:47:42PM +0800, Shenghao Ding wrote:

...

> > > +	.max_register = 0x44ffffff,
> 
> > I'm always wondering how this can work in debugfs when one tries to dump all
> > registers...
> 
> regmap will filter out non-readable registers from what it shows in
> debugfs so sparse regmaps will end up much smaller than they might look.
> The debugfs code also has support for seeking into the output (since
> each register is a fixed size) so we'll only actually render whatever is
> being read in an individual read().

Thanks, good to know.

...


> > > +static const struct dev_pm_ops tas2783_sdca_pm = {
> > > +	SET_SYSTEM_SLEEP_PM_OPS(tas2783_sdca_dev_suspend,
> > > +		tas2783_sdca_dev_resume)
> > > +	SET_RUNTIME_PM_OPS(tas2783_sdca_dev_suspend,
> > > +		tas2783_sdca_dev_resume, NULL)
> > > +};
> 
> > Use new PM macros.
> 
> ...which are?

SYSTEM_SLEEP_PM_OPS()
RUNTIME_PM_OPS()

and pm_ptr() in the .driver.pm assignment.


-- 
With Best Regards,
Andy Shevchenko


