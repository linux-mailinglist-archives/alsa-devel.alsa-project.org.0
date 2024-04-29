Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A928B53A3
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2024 11:02:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 710DEAE8;
	Mon, 29 Apr 2024 11:01:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 710DEAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714381328;
	bh=3bknnk4LrD1mdHceJ8bAPbqx4BAk8TNBu4OWYtRtEm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G9bsIOpaJ1kluxk7DG0SLpgoEoa4xoh5wTvKtfeV4qLr1NDKeYx5aPsRVBroF6uXH
	 RlxIN5MyVHFSm9Ot9wPySMrRMwiUS3O4Uyw6KRmw1r2VpwozMxdbGmr9XI8Xx5fee7
	 n6sX3HNEVFGIEikG8D4txyN3WE46ZsFnQPNv479k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 802E1F805AB; Mon, 29 Apr 2024 11:01:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45EFCF80568;
	Mon, 29 Apr 2024 11:01:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1374AF8028D; Mon, 29 Apr 2024 11:01:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC4F9F8003C
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 11:01:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC4F9F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dkTKib64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714381273; x=1745917273;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3bknnk4LrD1mdHceJ8bAPbqx4BAk8TNBu4OWYtRtEm4=;
  b=dkTKib64aac3XxQZ+tWHz32OSmoKG6HEIqNn6BSUodF+LOZtGFUe1kzb
   eelGOGEW8zsbhEcX7HTEOq073Invku8knFCBYcWug8Ll4RRZYHWOtxs8C
   g3XKZcxhyGvbn6+2RjwfTkdimHfhhpCgX3Zz8sFxqBQFU0Ehv1S80BQdg
   Ol4FC3Gs6kpeb5K5yOhbfXKgAhD4H66Ay4MvRINRv7m415IsHclJaOdwz
   o4f2VDBKrvnDbuueyR/eQIe7N8JN5BOs8gFcSIArxLXZXBdmG/eMIPYFX
   y8B7xEPdgaT4wF2a2aVP6aoCgU4z4VdPcxBLmSkKsOC6sG3/Rj/1eicpj
   w==;
X-CSE-ConnectionGUID: aj8l71WhTBKVlCqY4XdUMw==
X-CSE-MsgGUID: FOU4Jxj1Qz21ZQO86Py+Eg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10251257"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000";
   d="scan'208";a="10251257"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 02:01:03 -0700
X-CSE-ConnectionGUID: Rn3Odvd/Swuy90tipAcstw==
X-CSE-MsgGUID: ZPwZp9eTQ5CR4MBbzdxKKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000";
   d="scan'208";a="49266888"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 02:00:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s1MsB-00000002GOa-0QRQ;
	Mon, 29 Apr 2024 12:00:31 +0300
Date: Mon, 29 Apr 2024 12:00:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	mimperial@lenovo.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
	bard.liao@intel.com, yung-chuan.liao@linux.intel.com,
	kevin-lu@ti.com, cameron.berkenpas@gmail.com, tiwai@suse.de,
	baojun.xu@ti.com, soyer@irl.hu, Baojun.Xu@fpt.com
Subject: Re: [PATCH v1] ALSA: ASoc/tas2781: fixed wrong loading calibrated
 data sequence
Message-ID: <Zi9hrs3G3i4dNtro@smile.fi.intel.com>
References: <20240427052858.265-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240427052858.265-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: KYOXDL4GUT32CFO3TPNXCHCY4OLCLHLN
X-Message-ID-Hash: KYOXDL4GUT32CFO3TPNXCHCY4OLCLHLN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KYOXDL4GUT32CFO3TPNXCHCY4OLCLHLN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Apr 27, 2024 at 01:28:57PM +0800, Shenghao Ding wrote:

In the Subject:  fixed --> Fix

> Calibrated data will be set to default after loading dsp config params,

DSP

> which will cause speaker protection work abnormally. Reload calibrated
> data after loading dsp config params.

DSP

...

> -// Copyright (C) 2022 - 2023 Texas Instruments Incorporated
> +// Copyright (C) 2022 - 2024 Texas Instruments Incorporated

> -// Copyright 2023 Texas Instruments, Inc.
> +// Copyright 2023 - 2024 Texas Instruments, Inc.

Seems unrelated changes, but harmless.

...

> +						load_calib_data(tas_priv,
> +							&(cal->dev_data));

Why do you need parentheses for & (dereference) operator?

-- 
With Best Regards,
Andy Shevchenko


