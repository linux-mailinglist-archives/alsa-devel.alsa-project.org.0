Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C07394F5AD
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2024 19:13:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F11F21A1;
	Mon, 12 Aug 2024 19:13:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F11F21A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723482820;
	bh=aL4DOc2Na+/OPEQw8CVeC4lC8QebtBc1CYlW3Jh60kE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ye/8mdom94sLWQIKp9ZlpMzG5AGDjP3RLI7FUzEY1UKzrNZ4hkkvNvEofGve2Pf4z
	 0Aj8JvmswnT9S3gH8u/Z+QM6xTfRPfQf8wa5bjD+t5sKTUgRsqqnwVXmcQKCcL7YMq
	 MhXvke61vnetieKSO87nHUomRaFF9mn1oUI1pqgA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83930F80107; Mon, 12 Aug 2024 19:13:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0E60F8016E;
	Mon, 12 Aug 2024 19:13:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B750F80423; Mon, 12 Aug 2024 19:12:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1382DF8016E
	for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2024 19:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1382DF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mj6AhL1h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723482741; x=1755018741;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aL4DOc2Na+/OPEQw8CVeC4lC8QebtBc1CYlW3Jh60kE=;
  b=mj6AhL1h8YNNOFhGmGLBwDebptP/lXAhS8xJvMPxV7DmpAtiQZmfUr0W
   cVz+ZuKGQ3PueTTfJr3D3CiJgc66d13etVXCvdt8R18YTLhWnUqoKPq1/
   kGuluCpj9wkYHSxHjIQYhCWAKU4zpySaEHsyXjq3MFywr9bO95bWfwCdn
   6OeWS7scBMVQLCUYCxdbe0Y+DYlynrtLCNbTCcxQqhSiXZzV8yO4Xr3Ue
   wibZR0fPnYfiOpJyYKo5cCoj9o/srpzOtzLu+1XtN784Si/TvTo9nSRTg
   qPx/X2HM50feNKBTu6o3Z7vhLn+zcXRAwm8W3rZ2K5WSTZPlHGsVWEVYa
   g==;
X-CSE-ConnectionGUID: oG0Zy9BHTty0MaQtBxIfgg==
X-CSE-MsgGUID: bAW7zAfdQ/CybMuE/LZ17w==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21772323"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800";
   d="scan'208";a="21772323"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 10:12:15 -0700
X-CSE-ConnectionGUID: 4tHKUzgKQ4O7C28hz8LUuQ==
X-CSE-MsgGUID: DU89H2vBR2i1FPoEZlh9Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800";
   d="scan'208";a="81584021"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 10:12:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sdYaT-0000000EQMB-1R2S;
	Mon, 12 Aug 2024 20:12:05 +0300
Date: Mon, 12 Aug 2024 20:12:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
	linux-kernel@vger.kernel.org, j-chadha@ti.com,
	liam.r.girdwood@intel.com, jaden-yue@ti.com,
	yung-chuan.liao@linux.intel.com, dipa@ti.com, yuhsuan@google.com,
	henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com, soyer@irl.hu,
	Baojun.Xu@fpt.com, judyhsiao@google.com, navada@ti.com,
	cujomalainey@google.com, aanya@ti.com, nayeem.mahmud@ti.com,
	savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com,
	jesse-ji@ti.com, darren.ye@mediatek.com, antheas.dk@gmail.com,
	Jerry2.Huang@lcfuturecenter.com
Subject: Re: [PATCH] ASoc: tas2781: Rename dai_driver name to unify the name
 between TAS2563 and TAS2781
Message-ID: <ZrpCZfuNOdBhRMh4@smile.fi.intel.com>
References: <20240806041719.1477-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806041719.1477-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: ZC6DR5KHQPVW2666Q4UZQMSWZCH3RAJP
X-Message-ID-Hash: ZC6DR5KHQPVW2666Q4UZQMSWZCH3RAJP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZC6DR5KHQPVW2666Q4UZQMSWZCH3RAJP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 06, 2024 at 12:17:17PM +0800, Shenghao Ding wrote:
> Rename dai_driver name to unify the name between TAS2563 and
> TAS2781.

I am not sure this is a good change. Theoretically one with the platform that
has a certain codec may connect the other one. How that will be distinguished?

If there is no issue for such configurations, please mention this fact in the
commit message.

-- 
With Best Regards,
Andy Shevchenko


