Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1220C808934
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 14:31:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78F5C83A;
	Thu,  7 Dec 2023 14:30:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78F5C83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701955862;
	bh=zwPMEj8AGYxUrl9j0Jq1ozkQShkFbNl7hWQyodjk+mQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iNogtI+DJxejiqHvAoT2ZFxwf3zfW+Ljxg2R7EVISiQN/c1/D3WYueMRzlx2mFCPg
	 1XpER980y3Q8riF6umLy9Cxi8F3V3myprqR5GItnXL6xNvVKUDp70aGt0VZqVeZhI5
	 kUKDULtlabs5hScMBI//YV6eaHXqYwMKaJVlHaNs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35519F80567; Thu,  7 Dec 2023 14:30:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E266F80570;
	Thu,  7 Dec 2023 14:30:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF0A1F800D2; Thu,  7 Dec 2023 14:06:12 +0100 (CET)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97FB9F800D2
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 14:00:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97FB9F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NwL1hqRr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701954049; x=1733490049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zwPMEj8AGYxUrl9j0Jq1ozkQShkFbNl7hWQyodjk+mQ=;
  b=NwL1hqRrUHDlIUw4fvHqy9PndqyDAhkFZForOMf0Imvvg6k2Hmt7ZCWt
   RVKHMzxRB6VrKeuNcA6OOObNb0BrwhVoPAMWq0dANHK2SX+vqGMCz+605
   VhjNzM6EiPceWMLW711VujeyEvZlty/0ROEZbaJ1ukw5zLgmWXlx8+pgx
   QWjDCmegyHMLsQVqIvzJTXSq4rdnT2r0eglIY5W16KRImgdvRMmRVR7EH
   L51YaRlwV9wAvPCVX6rmqH8AMsrcOJcgbeuBY9wnwjzGxUTKgVnHVFbsj
   YHLmXcyZrKQXyQjORqxmmklbkc4UB600Bk9d05olcvmp1/qwuCHjuAT1J
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="12938856"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600";
   d="scan'208";a="12938856"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:00:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1103191636"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600";
   d="scan'208";a="1103191636"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 05:00:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rBDzH-00000002bUI-1HzU;
	Thu, 07 Dec 2023 15:00:19 +0200
Date: Thu, 7 Dec 2023 15:00:19 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Gergo Koteles <soyer@irl.hu>, Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/2] ALSA: hda/tas2563: Add tas2563 HDA driver
Message-ID: <ZXHB4651b8OUAtt8@smile.fi.intel.com>
References: <cover.1701733441.git.soyer@irl.hu>
 <4a2f31d4eb8479789ceb1daf2e93ec0e25c23171.1701733441.git.soyer@irl.hu>
 <90765ee0-a814-4852-9b2a-020cda98d930@linux.intel.com>
 <974d41f6c703d9b65ebcd75a2c659cecf13bd877.camel@irl.hu>
 <a530e70a-2491-4270-b582-cd493d1512b1@linux.intel.com>
 <9c3846ae0da417c0fe5d4fa2d9d4134143184dda.camel@irl.hu>
 <830d8e26-dbb9-4b9c-bbab-a5c4c49a7ffd@linux.intel.com>
 <4cd78962-027c-4bbb-a42a-6ccbca81ac8e@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4cd78962-027c-4bbb-a42a-6ccbca81ac8e@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 5FGOJGYASUZG4PAAEKTHBHBWDSYTTYTU
X-Message-ID-Hash: 5FGOJGYASUZG4PAAEKTHBHBWDSYTTYTU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5FGOJGYASUZG4PAAEKTHBHBWDSYTTYTU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Dec 06, 2023 at 05:07:16PM +0100, Amadeusz Sławiński wrote:
> On 12/5/2023 6:22 PM, Pierre-Louis Bossart wrote:

...

> > > > > > > +	 tas2xxx_generic_fixup(cdc, action, "i2c", "INT8866");
> > > > > > 
> > > > > > Any specific reason to use an Intel ACPI identifier? Why not use
> > > > > > "TIAS2563" ?
> 
> Will just note that prefix should probably be TXNW (not TIAS) as discussed
> recently on list.

...which should come directly from TI as it's their responsibility to allocate
an ACPI ID.

...

> > > > > INT8866 is in the ACPI.
> > > > > I don't know why Lenovo uses this name.
> > > > > I think it's more internal than intel.

This is wrong (PNP) ID.

...

> > > > >              Name (_HID, "INT8866")  // _HID: Hardware ID
> > > > 
> > > > Ouch, I hope they checked with Intel that this isn't an HID already in
> > > > use...
> > > > 
> > > It looks the INT prefix is not reserved. (yet)
> > > https://uefi.org/ACPI_ID_List?acpi_search=INT

You are looking into wrong registry, and yeah, Intel used wrong PNP ID
for years...

> > It's been de-facto reclaimed by Intel over the years, apparently using
> > INTC or INTL was too hard for some of my colleagues...
> 
> Perhaps it should be reserved then, so it is present on above list?

-- 
With Best Regards,
Andy Shevchenko


