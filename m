Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9448C9E51
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 15:46:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03F9B823;
	Mon, 20 May 2024 15:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03F9B823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716212782;
	bh=Z6En2rQ56rYKGpCjhvIFLvYQgqhZLyaWZXFlrV2UYzI=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X3JFSHEwuW+6qyH4BeGuPnfDbg0jbV53fPp2vvazZ89iZRpsmv2yrSW9OeE1C6AV1
	 Fe2KiHAIvIfCo8ycUFX4kxAgwlL8ZLQwFRtUDyw3Kjj30VrNRbPvEqYcQ6jQY2a9EK
	 NdfkQ0+P0jnOfjsNGXNWnf/GnaGbLzNSpjMXPD4g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E68DDF805D5; Mon, 20 May 2024 15:45:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8072F80588;
	Mon, 20 May 2024 15:45:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 050F2F805B2; Mon, 20 May 2024 14:51:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F8DDF8028B
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 14:51:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F8DDF8028B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lWhs3HPx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716209514; x=1747745514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z6En2rQ56rYKGpCjhvIFLvYQgqhZLyaWZXFlrV2UYzI=;
  b=lWhs3HPxPDHUL+pebMgBsDWKe7YuLx2RaKqtjVzKVz4EXHbrJE/qo5j4
   j4gJ4w8fxZE77EfYW51m75OOVadhLfi97qDxrrPYjc8SyDdoD58rstXC0
   +wG2M11BeRsUc+htiWbGOq/O+ikxBm5VE71IMphkYL00i+hv/LJ5iVQAI
   /TqNynjG4t7og2gVgsrzd+QMugiEl6wVKyOsd9UNhRJdbYgbC6MP8WXg5
   WdYrJ5rYrSyZuBLyMm7/D/5HmX7rK1fR0o1i6A4CojYI8SBrz8E94Bl23
   ehK0eIBOUevF5I0e3dl2g/7HTqpTbYMt3jkpcUl/xlEqmN/MVdj7YgVTB
   w==;
X-CSE-ConnectionGUID: ZQiTH5FmQ7WGMciJrMMXuA==
X-CSE-MsgGUID: sFAqsCRpRdyqie55H+l+6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12255560"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000";
   d="scan'208";a="12255560"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 02:29:47 -0700
X-CSE-ConnectionGUID: usaW+o1zQ/muIcggFC+9Yg==
X-CSE-MsgGUID: lNzpnIzCR2iuKpS7LCl60A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000";
   d="scan'208";a="32495689"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 02:29:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s8zKv-00000009GKJ-0Cwl;
	Mon, 20 May 2024 12:29:41 +0300
Date: Mon, 20 May 2024 12:29:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Subject: Re: [PATCH v1] ASoC: tas2552: Add TX path for capturing AUDIO-OUT
 data
Message-ID: <ZksYBOk_gHprCd_x@smile.fi.intel.com>
References: <20240518033515.866-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240518033515.866-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 6JSUEESZEBLHVRPEB4MO2GMB7DSXVOF3
X-Message-ID-Hash: 6JSUEESZEBLHVRPEB4MO2GMB7DSXVOF3
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: broonie@kernel.org, i-salazar@ti.com,
 pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 liam.r.girdwood@intel.com, kevin-lu@ti.com, tiwai@suse.de, baojun.xu@ti.com,
 soyer@irl.hu, Baojun.Xu@fpt.com
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, May 18, 2024 at 11:35:15AM +0800, Shenghao Ding wrote:
> TAS2552 is a Smartamp with I/V sense data, add TX path
> to support capturing I/V data.

...

>  /*
>   * tas2552.c - ALSA SoC Texas Instruments TAS2552 Mono Audio Amplifier
>   *
> - * Copyright (C) 2014 Texas Instruments Incorporated -  https://www.ti.com
> + * Copyright (C) 2014 - 2024 Texas Instruments Incorporated -
> + *	https://www.ti.com

Is it okay to wrap the (c) line? (Just asking.)

>   * Author: Dan Murphy <dmurphy@ti.com>
>   */

-- 
With Best Regards,
Andy Shevchenko


