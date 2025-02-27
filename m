Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD0AA48299
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Feb 2025 16:12:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D367E60373;
	Thu, 27 Feb 2025 16:12:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D367E60373
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740669176;
	bh=68114DioW8e57wJ2X2rXfMVXoRLSz0oRVW3ocl1Td58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=To56Kk+aLCcLmi87ckUspsPn9rOdSFl4ASOPQ9H6VqNk7693nuGOp5bTWHO0cSrdX
	 uVlm196Dy7HDwPx8zjagQwYgmclfcw15DXw2HbAG+rf0mRosk80E0sOD5Tst2fVuGT
	 eJG0yvP3enMb9V8bNWd4zYnG3oKvZ54fJz4eBNWo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC30CF805C4; Thu, 27 Feb 2025 16:12:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40466F805AC;
	Thu, 27 Feb 2025 16:12:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92C6DF8021D; Thu, 27 Feb 2025 16:12:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48E16F80116
	for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2025 16:12:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48E16F80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ETbjKpXb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740669137; x=1772205137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=68114DioW8e57wJ2X2rXfMVXoRLSz0oRVW3ocl1Td58=;
  b=ETbjKpXbLmpFvE/nokPY9UdUuGZckN8uk3s0otyp0hC18YT42EgYeufS
   tOJaICVb1zx6Yh5/bEEjyrHJMgN+hFFL2Ww0oO/IZkOLZye5jwuJehxA3
   yuGTi19Ecn3dV5/fCxdaYGL5BDyQ3hrCHZ+PaUHJCXZ85+3K/w/HTZQLj
   DXL/o3V5DJ3CdUAz+mKjxTHeaSNhfNlHLZD5qB4cHivgmJEuLiO3/zrKz
   REus8U8HB+MTT58ZYM8sNfO6Pnh83i0BkuSG9kreejnoxKCGjhuhbgPWh
   g9XSbFhgLsW8BZtyZVeBDfBVdORHRQoJDu4pfnSo97VvejH07hc1iewI5
   Q==;
X-CSE-ConnectionGUID: /PcKRNwpT9yir67gT5I40Q==
X-CSE-MsgGUID: iQHUnQaRQkKiZWAUmjBhxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="64030943"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000";
   d="scan'208";a="64030943"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 07:12:14 -0800
X-CSE-ConnectionGUID: 0LElpVoVS+aAkSs8m5xXow==
X-CSE-MsgGUID: Xb2IvFMkROuTI46pmpq3nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000";
   d="scan'208";a="116846065"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 07:12:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tnfYX-0000000Fd55-07e7;
	Thu, 27 Feb 2025 17:12:09 +0200
Date: Thu, 27 Feb 2025 17:12:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Ding, Shenghao" <shenghao-ding@ti.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
	"tiwai@suse.de" <tiwai@suse.de>,
	"13916275206@139.com" <13916275206@139.com>,
	"13564923607@139.com" <13564923607@139.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"Xu, Baojun" <baojun.xu@ti.com>
Subject: Re: [EXTERNAL] Re: [PATCH v3] ASoC: tas2781: Support dsp firmware
 Alpha and Beta seaies
Message-ID: <Z8CAyFOKg9JJ1yZF@smile.fi.intel.com>
References: <20250225140316.1049-1-shenghao-ding@ti.com>
 <Z73WZLrBrtVc69dn@smile.fi.intel.com>
 <bc2147c6f31d47afbec108cfdb5acfd2@ti.com>
 <Z8CAHiFyJ3B8tzZ5@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8CAHiFyJ3B8tzZ5@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: BVGBBWKRR2ONCXKL726WLLKVVW77OT3K
X-Message-ID-Hash: BVGBBWKRR2ONCXKL726WLLKVVW77OT3K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BVGBBWKRR2ONCXKL726WLLKVVW77OT3K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Feb 27, 2025 at 05:09:18PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 27, 2025 at 11:58:24AM +0000, Ding, Shenghao wrote:
> > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Sent: Tuesday, February 25, 2025 10:41 PM
> > > On Tue, Feb 25, 2025 at 10:03:16PM +0800, Shenghao Ding wrote:

...

> Then in the loop you do the following (just an example, can be done
> differently):
> 
> 	union {
> 		const char name[20];
> 
> 		struct fct_param_alias_u8 *u8;

> 		struct fct_param_alias_u24 *u24;

Sorry, these should be not the pointers.

> 		...
> 		const void *data;

and this is not needed, as we have to use the pointer to the union itself.

> 	} a;

	} *a;

> 	a.data = data;

	a = data;

> 	if (!strncmp(a.name, ..., sizeof(a.name)))
> 		foo = ...(a.u24->book, a.u24->page, a.u24->offset);

	if (!strncmp(a->name, ..., sizeof(a->name)))
		foo = ...(a->u24.book, a->u24.page, a->u24.offset);

> 	else if (...)
> 		...

-- 
With Best Regards,
Andy Shevchenko


