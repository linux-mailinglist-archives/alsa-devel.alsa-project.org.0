Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F1795F13E
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2024 14:23:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81C52828;
	Mon, 26 Aug 2024 14:23:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81C52828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724675002;
	bh=nrCh+MbG7gRxvIMzEnBTFyKz9LeiQJGA21Had33NToE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sInlXcVjgnak/9H0ExUUKVnAjL395joe81/hjsczgrA08gM66a/HKa2Vm2hpzY4fX
	 O0TZdUmfYYEYKZA2Q9KObV7KVYGUazmmyn5Tb+aK6lVYnyB40ORyj1qOpA8GNtA9bj
	 B6MhKx8Oq4gCtR8PG8yDfTaH706GAw1U5XvkR/ME=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CE3CF805AF; Mon, 26 Aug 2024 14:22:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DA6CF805AA;
	Mon, 26 Aug 2024 14:22:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 591F8F80423; Mon, 26 Aug 2024 14:22:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7232F800AC
	for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2024 14:22:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7232F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=c4urj4WZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724674930; x=1756210930;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nrCh+MbG7gRxvIMzEnBTFyKz9LeiQJGA21Had33NToE=;
  b=c4urj4WZITcvPqXJLI7heDtgQeIq7zTieBE0zlNLmt6rzVq2R4mGDE+0
   kEHNe+P/lFQsM2d+mtx3XZwu2H/euRmdhYKMJotMr1umu5204j6mT0IYl
   go4b1Xn6nz2waYEiDrVVkXt1S6fDYaptJ33xZhLbbQy0d/xEZj2CkMzeY
   zGWgpcJJ4ENKQ2TKK0DhuSP0qMCgfTFhLWHRD0ltSHRaLIcVt2/8gKEZB
   2+u7iDayVtsr2boLzpoiekm/d50Tbja/B21AtHyu1Fsg+JKQhuOzLNua7
   VYjXq50hLkTS7c0rsTIyBMTQ5t4J4lKV7u8xXndP9IM8wAXj8Om+NYekp
   w==;
X-CSE-ConnectionGUID: F0pcG9QtTP2t5rkyUFvaxg==
X-CSE-MsgGUID: 7RqGvSm+SVOxxNU4D+Omqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="26843340"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600";
   d="scan'208";a="26843340"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 03:02:43 -0700
X-CSE-ConnectionGUID: CH7XDuMNQJqNtfnFa+2fHA==
X-CSE-MsgGUID: 5TTPLJ8hSOCmWgnsBO6BBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600";
   d="scan'208";a="62979990"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 03:02:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1siWYR-00000001pDM-3oMG;
	Mon, 26 Aug 2024 13:02:31 +0300
Date: Mon, 26 Aug 2024 13:02:31 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Ding, Shenghao" <shenghao-ding@ti.com>
Cc: "broonie@kernel.org" <broonie@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
	"13916275206@139.com" <13916275206@139.com>,
	"zhourui@huaqin.com" <zhourui@huaqin.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"Salazar, Ivan" <i-salazar@ti.com>,
	"liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
	"Yue, Jaden" <jaden-yue@ti.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"Rao, Dipa" <dipa@ti.com>,
	"yuhsuan@google.com" <yuhsuan@google.com>,
	"Lo, Henry" <henry.lo@ti.com>, "tiwai@suse.de" <tiwai@suse.de>,
	"Xu, Baojun" <baojun.xu@ti.com>,
	"Baojun.Xu@fpt.com" <Baojun.Xu@fpt.com>,
	"judyhsiao@google.com" <judyhsiao@google.com>,
	"Navada Kanyana, Mukund" <navada@ti.com>,
	"cujomalainey@google.com" <cujomalainey@google.com>,
	"Kutty, Aanya" <aanya@ti.com>,
	"Mahmud, Nayeem" <nayeem.mahmud@ti.com>,
	"savyasanchi.shukla@netradyne.com" <savyasanchi.shukla@netradyne.com>,
	"flaviopr@microsoft.com" <flaviopr@microsoft.com>,
	"Ji, Jesse" <jesse-ji@ti.com>,
	"darren.ye@mediatek.com" <darren.ye@mediatek.com>,
	"antheas.dk@gmail.com" <antheas.dk@gmail.com>,
	"Jerry2.Huang@lcfuturecenter.com" <Jerry2.Huang@lcfuturecenter.com>,
	"jim.shil@goertek.com" <jim.shil@goertek.com>
Subject: Re: [EXTERNAL] Re: [PATCH v1] ASoC: tas2781: mark const variables
 tas2563_dvc_table as __maybe_unused
Message-ID: <ZsxStyum6bU4z3eS@smile.fi.intel.com>
References: <20240822063205.662-1-shenghao-ding@ti.com>
 <Zsc-9PVnh8GpPrrP@smile.fi.intel.com>
 <0ec3e8f6fb404fee94fa9195cf67b044@ti.com>
 <ZsiPzPevJ0ucM-_5@smile.fi.intel.com>
 <b9293d922c194d62b845c4ec6b1bf2b6@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9293d922c194d62b845c4ec6b1bf2b6@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 4DBX2WDE5XAKHB4KGDOFIDGWTQ2HTJFT
X-Message-ID-Hash: 4DBX2WDE5XAKHB4KGDOFIDGWTQ2HTJFT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4DBX2WDE5XAKHB4KGDOFIDGWTQ2HTJFT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Aug 24, 2024 at 06:33:41AM +0000, Ding, Shenghao wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Friday, August 23, 2024 9:34 PM
> > On Fri, Aug 23, 2024 at 02:24:17AM +0000, Ding, Shenghao wrote:
> > > > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > Sent: Thursday, August 22, 2024 9:37 PM
> > > > To: Ding, Shenghao <shenghao-ding@ti.com> On Thu, Aug 22, 2024 at
> > > > 02:32:02PM +0800, Shenghao Ding wrote:

...

> > > > >  /* pow(10, db/20) * pow(2,30) */
> > > > > -static const unsigned char tas2563_dvc_table[][4] = {
> > > > > +static const __maybe_unused unsigned char tas2563_dvc_table[][4]
> > > > > += {
> > > > >  	{ 0X00, 0X00, 0X00, 0X00 }, /* -121.5db */
> > > > >  	{ 0X00, 0X00, 0X03, 0XBC }, /* -121.0db */
> > > > >  	{ 0X00, 0X00, 0X03, 0XF5 }, /* -120.5db */
> > > >
> > > > As far as I can see in the latest Linux Next the above mentioned
> > > > table is used solely in sound/soc/codecs/tas2781-i2c.c. Why not
> > > > moving it to the C file instead?
> > > We have a big plan to implement the digital gain for tas2563 in the
> > > side codec driver too, so abstracted this table into a separated header file.
> > 
> > So, this __maybe_unused is a temporary stub, correct? Just don't forget to
> > remove it when the mentioned functionality will be ready.
> > 
> > Thanks for the explanation.
> To add __maybe_unused is not temporary, because this driver support both 
> tas2563 and tas2781, if the hardware only contains tas2781 chips, 
> tas2563_dvc_table is obviously useless, so marked it as __maybe_unused.

You got me confused.

__maybe_unused is a compile-time (okay, link-time) attribute. If what you are
telling is true, why do you need it and can't use respective #ifdef?

Otherwise, why is it in the _header_ file and not in the C-file?

-- 
With Best Regards,
Andy Shevchenko


