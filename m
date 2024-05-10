Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D9B8C2782
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2024 17:17:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C4C2E65;
	Fri, 10 May 2024 17:17:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C4C2E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715354246;
	bh=IRB+pc4QjEmCYoDfPo7B7gkb2wYKCD7OVN0a/6SXhVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tI30teZF02Sgn9DCDTp5g9jGuZTvTBJvHayunftbIBK+zk4OsTGCFRSpjc8GCIj3g
	 3xyllYTZT9ZH/9zRNB4rsJtD4zqwq9V9yRClai/RvpsuMEgdDdL1ChtisAI3cCUDtX
	 qMJS/Kq6IZNN4kcqTSqjA8tMOsPA5I9ut0hXCKag=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD5DAF80423; Fri, 10 May 2024 17:16:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 980C9F8059F;
	Fri, 10 May 2024 17:16:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89AE4F8049C; Fri, 10 May 2024 17:13:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E166F8024C
	for <alsa-devel@alsa-project.org>; Fri, 10 May 2024 17:12:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E166F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KAHNKCRF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715353979; x=1746889979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IRB+pc4QjEmCYoDfPo7B7gkb2wYKCD7OVN0a/6SXhVg=;
  b=KAHNKCRFBrSZvhj40X953qqx2MrXsZkNoC3h0UTPM91K1yqOX/BfEYGA
   rAgDNooctdSfnTef9mFOTddPOsUjKbC0OV+QtcUwAZfR59ZByxAEgNY8m
   gU7IGCcqFgNQ/1Fi4tpaa0KWW4xAkKHBF91ne4QNe7xZLk4y2SdAkpkJ2
   DN3EAIpx8xQ2iODf6014B2XPqzicPNN3Mye7BL9V18PSVt0HLaZYGoNNH
   ZpD+SI9nhv/PrP8L2ktR2an7/iVPdSuR/rSNazHmfo+80HwFcmmgHF3VH
   0BEgC12Bhm75MLyzcWmZ/991MqJWiDGkynScbIKjUqsnPmoCYP4NUgO0A
   Q==;
X-CSE-ConnectionGUID: /sXWMaMJRri9B+j8jwLIxA==
X-CSE-MsgGUID: 0OdoGh68SDOqXAv5FuIxmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11201790"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000";
   d="scan'208";a="11201790"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:12:53 -0700
X-CSE-ConnectionGUID: ScQD7gxITEGKr8SJL28UfQ==
X-CSE-MsgGUID: 6GMjUwSsRR2qf6kS2BbL+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000";
   d="scan'208";a="29492945"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 08:12:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s5RvR-000000068kM-3SGV;
	Fri, 10 May 2024 18:12:45 +0300
Date: Fri, 10 May 2024 18:12:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com, bard.liao@intel.com,
	yung-chuan.liao@linux.intel.com, kevin-lu@ti.com,
	cameron.berkenpas@gmail.com, tiwai@suse.de, baojun.xu@ti.com,
	soyer@irl.hu, Baojun.Xu@fpt.com
Subject: Re: [PATCH v4 1/3] ALSA: ASoc/tas2781: Fix wrong loading calibrated
 data sequence
Message-ID: <Zj45bfx4twerXKwc@smile.fi.intel.com>
References: <20240510034123.1181-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240510034123.1181-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: IUCM7JDTMXOKR3IHV5LW7SB7EPOBFRI6
X-Message-ID-Hash: IUCM7JDTMXOKR3IHV5LW7SB7EPOBFRI6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IUCM7JDTMXOKR3IHV5LW7SB7EPOBFRI6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 10, 2024 at 11:41:19AM +0800, Shenghao Ding wrote:
> Calibrated data will be set to default after loading DSP config params,
> which will cause speaker protection work abnormally. Reload calibrated
> data after loading DSP config params.
> 
> Fixes: ef3bcde75d06 ("ASoc: tas2781: Add tas2781 driver")

How on earth this can be a fix?..

> -// Copyright (C) 2022 - 2023 Texas Instruments Incorporated
> +// Copyright (C) 2022 - 2024 Texas Instruments Incorporated

> -#ifndef __TASDEVICE_DSP_H__
> -#define __TASDEVICE_DSP_H__
> +#ifndef __TAS2781_DSP_H__
> +#define __TAS2781_DSP_H__

> -int tasdevice_prmg_calibdata_load(void *context, int prm_no);

-- 
With Best Regards,
Andy Shevchenko


