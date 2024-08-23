Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E82E095CE24
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2024 15:40:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F1C87F8;
	Fri, 23 Aug 2024 15:40:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F1C87F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724420452;
	bh=gCp4tvTxqcPFYkPmnJ7rlXVZP16ho/yQvJIWmBCEqIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GDMyvTN2CK022wIUoVs8SsYwsABvGZqesSYgv9rLp7Yfzuo3O2asVfqjmjQcE/dFH
	 S79Dm3h9mYSrnZwx6exZ3VfxWJjCrHYLbClv4oI6SXWRdAADsQZbi8/n4PaFjn9vhN
	 2kp2poHTpti5xEhoC6PRuSCJ6+8FMbBwLqEC+K3o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82FAFF80579; Fri, 23 Aug 2024 15:40:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D646CF805AE;
	Fri, 23 Aug 2024 15:40:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F442F80496; Fri, 23 Aug 2024 15:34:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 187A6F80107
	for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2024 15:34:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 187A6F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LjX2VQa3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724420076; x=1755956076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gCp4tvTxqcPFYkPmnJ7rlXVZP16ho/yQvJIWmBCEqIs=;
  b=LjX2VQa3sDQgrIDbOLQH9rpQzXKEv+K1SIjEPIYlj9Nz+Oe6e9O+HFfk
   BY7mKp8VvN4le0h8pZpwBKHubDsmYOr+y6uzCX1gmBZwj6vYcB6X0pTLJ
   k/m+YCaI5R9RJtsnsJRjmJM54B2iyOIiSHQ/Ig4HbdfhwlFLLDYAi779p
   1pcecdTOnQFvuK+aoUNIT+F6d/et6W9B7KDHmQ5LjRIC8Kr2862zzOJhp
   NEq220Rw5a4nn7kvsN2Hwsu+1gUnKwv8CMGP5iNNebu0H4/PPlTMNBG27
   l8VCMfFT9SJy6tP+l0Ag4859XzknUai0ZExSgpte6WMqEVu0Obz51kAku
   g==;
X-CSE-ConnectionGUID: bOo9Zt+qSqmhLQWtbPg/Kw==
X-CSE-MsgGUID: LGd+INBORWSAy7U60LXKUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40352198"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600";
   d="scan'208";a="40352198"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 06:34:31 -0700
X-CSE-ConnectionGUID: M3UzNV+VQPynkvwVIfbDfw==
X-CSE-MsgGUID: OQKPDpKXQCi5SvHoy5ljXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600";
   d="scan'208";a="84979303"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 06:34:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1shUQW-00000000o2D-35cn;
	Fri, 23 Aug 2024 16:34:04 +0300
Date: Fri, 23 Aug 2024 16:34:04 +0300
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
Message-ID: <ZsiPzPevJ0ucM-_5@smile.fi.intel.com>
References: <20240822063205.662-1-shenghao-ding@ti.com>
 <Zsc-9PVnh8GpPrrP@smile.fi.intel.com>
 <0ec3e8f6fb404fee94fa9195cf67b044@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ec3e8f6fb404fee94fa9195cf67b044@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: QBXM5WDRLVCTEH4PNBDXKLWVJR24OB3O
X-Message-ID-Hash: QBXM5WDRLVCTEH4PNBDXKLWVJR24OB3O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QBXM5WDRLVCTEH4PNBDXKLWVJR24OB3O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Aug 23, 2024 at 02:24:17AM +0000, Ding, Shenghao wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Thursday, August 22, 2024 9:37 PM
> > To: Ding, Shenghao <shenghao-ding@ti.com>
> > On Thu, Aug 22, 2024 at 02:32:02PM +0800, Shenghao Ding wrote:

...

> > >  /* pow(10, db/20) * pow(2,30) */
> > > -static const unsigned char tas2563_dvc_table[][4] = {
> > > +static const __maybe_unused unsigned char tas2563_dvc_table[][4] = {
> > >  	{ 0X00, 0X00, 0X00, 0X00 }, /* -121.5db */
> > >  	{ 0X00, 0X00, 0X03, 0XBC }, /* -121.0db */
> > >  	{ 0X00, 0X00, 0X03, 0XF5 }, /* -120.5db */
> > 
> > As far as I can see in the latest Linux Next the above mentioned table is used
> > solely in sound/soc/codecs/tas2781-i2c.c. Why not moving it to the C file
> > instead?
> We have a big plan to implement the digital gain for tas2563 in the side
> codec driver too, so abstracted this table into a separated header file.

So, this __maybe_unused is a temporary stub, correct? Just don't forget to
remove it when the mentioned functionality will be ready.

Thanks for the explanation.

-- 
With Best Regards,
Andy Shevchenko


