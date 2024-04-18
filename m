Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 986EC8A991A
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 13:54:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DB3DE0F;
	Thu, 18 Apr 2024 13:54:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DB3DE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713441270;
	bh=tkl33SZf8yom7WU4rICjpTPTPslg5lqttSlZkZ3e+8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bjGK0QqRb4rUSu6t0kYe8D1mVN15VzPblQL+gMWAKUf782SI/gPAUkYzEJd1z9ieU
	 eXoN2Zqq2liMC7Vjn+aA9I8O/4aRkXKdoHUDtIqV8Eti7jVi1IdiDFHBexUiNR8Qe4
	 4iafLUxSQs8sXacPTdVN9uuEw/vLs+kT4mO6z2hU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28343F805A1; Thu, 18 Apr 2024 13:53:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B8F4F805A1;
	Thu, 18 Apr 2024 13:53:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C794AF8025A; Thu, 18 Apr 2024 13:53:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E13C5F8003A
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 13:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E13C5F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SFzUOqa3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713441229; x=1744977229;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=tkl33SZf8yom7WU4rICjpTPTPslg5lqttSlZkZ3e+8s=;
  b=SFzUOqa3JEK+pBGSIMli5gRBaUiUP1ujwRO+hyBi5vXxGPa8CZFRIKif
   Ks2CXmR5CPPbzwCoHhqlrewnsgzk6GPEanNQjfwO3NDgHEt3bYHBswDw4
   gRFl8Do+PlXajxPHwy649EeGPyIwzGFDKevBZJLd2gXfir+3fh5WiHzyN
   HbIlHAuPEESk38aRudty+IGP1yotUoT9nP4m0NQGDwBYV+v5pcrPliKoC
   eA0VdTQZ9RjfmyLFH7TBM10ui0mp/BkBue4E6ZlWlrJZf5v+MzqgaGbiH
   mcp2N4qamj5FkPMVoxTO3bCxACmfNNTJY7vPQFdDKarHLawi905PDEC7c
   A==;
X-CSE-ConnectionGUID: CJGPu6DDQzWkHfsJcz3Rqw==
X-CSE-MsgGUID: 3RY8fC1dSCuG/8YXNLg3kA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12766877"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000";
   d="scan'208";a="12766877"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 04:53:45 -0700
X-CSE-ConnectionGUID: 0oftRFAaTVSyIA87JqdqZw==
X-CSE-MsgGUID: j30FugN4QeWRlkXR6gDe2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000";
   d="scan'208";a="27773357"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 04:53:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rxQKg-00000000JdM-3CI3;
	Thu, 18 Apr 2024 14:53:38 +0300
Date: Thu, 18 Apr 2024 14:53:38 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Xu, Baojun" <baojun.xu@ti.com>
Cc: "tiwai@suse.de" <tiwai@suse.de>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"perex@perex.cz" <perex@perex.cz>,
	"pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
	"Lu, Kevin" <kevin-lu@ti.com>,
	"Ding, Shenghao" <shenghao-ding@ti.com>,
	"Navada Kanyana, Mukund" <navada@ti.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"liam.r.girdwood@intel.com" <liam.r.girdwood@intel.com>,
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"soyer@irl.hu" <soyer@irl.hu>
Subject: Re: [EXTERNAL] Re: [PATCH v2 2/3] ALSA: hda/tas2781: Main code of
 tas2781 driver for SPI
Message-ID: <ZiEJwr5iv77wLkwd@smile.fi.intel.com>
References: <20240409024816.1180-1-baojun.xu@ti.com>
 <20240409024816.1180-3-baojun.xu@ti.com>
 <ZhVA1_HTET4Q4T9d@smile.fi.intel.com>
 <e3f73d92d1fa466cb70e3d738a7926c9@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3f73d92d1fa466cb70e3d738a7926c9@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: MVPXSHPJK2JFCML3URF7WCIB7JN45T2Z
X-Message-ID-Hash: MVPXSHPJK2JFCML3URF7WCIB7JN45T2Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MVPXSHPJK2JFCML3URF7WCIB7JN45T2Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Apr 18, 2024 at 05:12:03AM +0000, Xu, Baojun wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: 09 April 2024 21:21
> > To: Xu, Baojun
> > On Tue, Apr 09, 2024 at 10: 48: 14AM +0800, Baojun Xu wrote:
> > On Tue, Apr 09, 2024 at 10:48:14AM +0800, Baojun Xu wrote:

...

> > > +#ifndef __TAS2781_SPI_H__
> > > +#define __TAS2781_SPI_H__
> > 
> > + bits.h
> > + mutex.h
> > + time.h? (for struct tm)
> > + types.h
> > 
> > struct calidata is from?..
> > 
> > > +#include <sound/tas2781-dsp.h>
> > 
> > Not sure how this is being used.
> 
> Was used for firmware binary file parser, all of file format information
> was defined in this header file. It can be shared between SPI & I2C.

_This header_ file seems not using anything from it, does it?

> > Also some forward declarations:
> > 
> > + struct device;
> > + struct firmware;
> > + struct gpio_desc;
> > + struct regmap;

-- 
With Best Regards,
Andy Shevchenko


