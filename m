Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF34388C620
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 16:01:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11F9C238A;
	Tue, 26 Mar 2024 16:00:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11F9C238A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711465269;
	bh=euufMSB4SVE5RBXsdwnHwJCF8Qu8BkG8kahi1cBb2O4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jKBPlWOoFREHE20XuIm3yKf97qQZwqgKhYptbyJfqVvrUqYT/POIIBuWeJWB8WTkF
	 FJpSActAwUo0gDJOiL+7VcIjPs9NDmgNCuHnh3rc20dGd1iRGzeUDbiOUWDadn0Bci
	 7UHNh1hMQmbFn6gEDOMdYjzl5VzVWa0N68ky0LmU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC0D3F80093; Tue, 26 Mar 2024 16:00:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44492F80093;
	Tue, 26 Mar 2024 16:00:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E38CF8025F; Tue, 26 Mar 2024 15:59:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE2A9F801D5
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 15:58:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE2A9F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ab+hFY/I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711465140; x=1743001140;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=euufMSB4SVE5RBXsdwnHwJCF8Qu8BkG8kahi1cBb2O4=;
  b=Ab+hFY/IK8wRnKRsT0IkHFvum0FrRxC9JD63q9ucWi6+McilMmptgwdh
   lKVKyOOPIRetWxL13/3+j4MiknFsPjEOkz1tZ05j6fHNwx/jg6NZLiD6c
   iAF6Po2TEIoZRnFjOticv928tEcKxqQvpc7DmVTwkl5o5i4h0hxW+eDwm
   oKQ8e/GIFwDUPInmG6yqOLwKoyWh7AlbuJhOjEx59adPZVXrigWswpyQs
   6iOiUf+i3LyK5WOj+7fVrhabxRRcy6aeuGSL/ZnfEBKt49PNXcBlJIjh6
   cTWTqUS9hJKDzj2Nz2kKZYuDhMUXdYgm2rEvgELBcdGQuIZ2C0FU/NVWu
   g==;
X-CSE-ConnectionGUID: 4U6T5JAtT+iqVtP6gTXjSg==
X-CSE-MsgGUID: Da+7CgAQSpyhqALyZjSA9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="29000283"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="29000283"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 07:58:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="914882629"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="914882629"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 07:58:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rp8GF-0000000GKhL-46Jt;
	Tue, 26 Mar 2024 16:58:47 +0200
Date: Tue, 26 Mar 2024 16:58:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, kevin-lu@ti.com,
	13916275206@139.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
	yung-chuan.liao@linux.intel.com, broonie@kernel.org, soyer@irl.hu
Subject: Re: [PATCH v1 1/8] ALSA: hda/tas2781: Add tas2781 SPI-based driver
Message-ID: <ZgLipy9f67JfZhx4@smile.fi.intel.com>
References: <20240326010905.2147-1-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326010905.2147-1-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: TDUAKPMCZ7FUL64MC3VPU6ZHYF7HTPYS
X-Message-ID-Hash: TDUAKPMCZ7FUL64MC3VPU6ZHYF7HTPYS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TDUAKPMCZ7FUL64MC3VPU6ZHYF7HTPYS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Mar 26, 2024 at 09:08:58AM +0800, Baojun Xu wrote:
> Add TXNW2781 support in smi.

What is 'smi'? Can you make message less cryptic, please?
Also explain why it should be in that list in scan.c.

Code wise LGTM, so with commit message fixed,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


