Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD406782607
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 11:07:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CE027F1;
	Mon, 21 Aug 2023 11:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CE027F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692608862;
	bh=N/gT1jRRqJehuoUm6AcE3sUEu+8uIMdenNWlAYPfT30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FlDy4NHIotTpJLADxn4uNrOGgJmB5aITFQhEjOQFmMFfNnI71SiGi2z3g3HDmQ+t9
	 j+l/gk4EOSgvP8XitJDucsAT1x72mLdKTZzkpd5IWYz+qHeLal+VM/j1/ey5q1uBFd
	 fLB1DKlG0Gs1exCSnzRRbtFKWdiNKWIAyqMtWLXc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75C9CF80549; Mon, 21 Aug 2023 11:06:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 280B9F8016C;
	Mon, 21 Aug 2023 11:06:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92B5AF80199; Mon, 21 Aug 2023 11:06:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6C36F800BF
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 11:06:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6C36F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kuV5JJwz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692608798; x=1724144798;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=N/gT1jRRqJehuoUm6AcE3sUEu+8uIMdenNWlAYPfT30=;
  b=kuV5JJwzL56hw4JpgFPLcV7uCduKVuNL4mJccKYbiQWmKkW/1xoa6W2Y
   68iDxzm/iQDXrs1FuG1stGn3YW4U1Xo3oltrioSPAtNSygeUfFjKec3X8
   dHlEacO+711M/apDpPDgaBRmhs06k5mnGaIIOaY5xbsyCk8gZkBqoib2T
   mwQytVOlrllHxLwJk9YXlUrokRKzUeIrJHoOT9sPFX7YNXAibkIY3w3dI
   l49RvcX7BCzdNIH370jUzwWwauVJyiVNx9cUWjvqIGm2Das7u2sHNkGHd
   CdJSKw5aI8E8+lgZ+oU25J7j6CkyhRhkoosVQ9H+JZzBfH5AkGhirpKs8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="377278043"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200";
   d="scan'208";a="377278043"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 02:06:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="805862641"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200";
   d="scan'208";a="805862641"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 21 Aug 2023 02:06:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qY0rc-006vuu-1y;
	Mon, 21 Aug 2023 12:06:20 +0300
Date: Mon, 21 Aug 2023 12:06:20 +0300
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
Message-ID: <ZOMpDEZoF8ZK7vU0@smile.fi.intel.com>
References: <20230818085558.1431-1-shenghao-ding@ti.com>
 <20230818085558.1431-2-shenghao-ding@ti.com>
 <4c1b44b5-995a-fac7-a72b-89b8bf816dd2@linux.intel.com>
 <ZN+j3LmfUW2vB+QS@smile.fi.intel.com>
 <87jztq9iqv.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jztq9iqv.wl-tiwai@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: QVNDXBDSWQDYF6GISAZRREQU5TQ7LKLV
X-Message-ID-Hash: QVNDXBDSWQDYF6GISAZRREQU5TQ7LKLV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QVNDXBDSWQDYF6GISAZRREQU5TQ7LKLV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Aug 20, 2023 at 11:16:08AM +0200, Takashi Iwai wrote:
> On Fri, 18 Aug 2023 19:01:16 +0200,
> Andy Shevchenko wrote:
> > On Fri, Aug 18, 2023 at 11:00:34AM -0500, Pierre-Louis Bossart wrote:

...

> > > > +static void tas2781_fixup_i2c(struct hda_codec *cdc,
> > > > +	const struct hda_fixup *fix, int action)
> > > > +{
> > > > +	 tas2781_generic_fixup(cdc, action, "i2c", "TIAS2781");
> > > 
> > > TI ACPI ID is TXNW
> > > 
> > > https://uefi.org/ACPI_ID_List?search=TEXAS
> > > 
> > > There's also a PNP ID PXN
> > > 
> > > https://uefi.org/PNP_ID_List?search=TEXAS
> > > 
> > > "TIAS" looks like an invented identifier. It's not uncommon but should
> > > be recorded with a comment if I am not mistaken.
> > > 
> > > > +}
> > 
> > Thank you, but actually it's a strong NAK to this even with the comment.
> > We have to teach people to follow the specification (may be even hard way).
> > 
> > So where did you get the ill-formed ACPI ID?
> > Is Texas Instrument aware of this?
> > Can we have a confirmation letter from TI for this ID, please?
> 
> This is used already for products that have been long in the market,
> so it's way too late to correct it, I'm afraid.
> 
> What we can do is to get the confirmation from TI, complain it, and
> some verbose comment in the code, indeed.

Oh, no! Who made that ID, I really want to point that at their faces.
Look at the Coreboot (successful) case, they created something, but
in time asked and then actually fixed the ill-formed ID (that was for
one of RTC chips).

For this, please make sure that commit message has that summary, explaining that
- states that ID is ill-formed
- states that there are products with it (DSDT excerpt is a must)
- lists (a few?) products where that ID is used
- ideally explains who invented that and Cc them to the patch, so they will
  know they made a big mistake

-- 
With Best Regards,
Andy Shevchenko


