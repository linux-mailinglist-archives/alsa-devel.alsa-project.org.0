Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AA3AB7FCD
	for <lists+alsa-devel@lfdr.de>; Thu, 15 May 2025 10:07:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CFA363562;
	Thu, 15 May 2025 10:03:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CFA363562
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747296214;
	bh=WAOvh/4GnvFhcgh061nbP20b/JnhXfig2pIhpA4U20k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JevpcgBj4LISVYHPLA0or+YWeAm5wMiTBar+Z9VrhFWdkbWElp1PeioP3eevGsc85
	 gojBw41Qv65gelDOiuPz+lL5fB2f5mu3GBBxaMzPAq6on6+WlvFVWuGcvFvXIbdiy1
	 4CZcIXsrl4c/H2G8befguajdtKKM9Q06GCOXuir0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0547F899F4; Mon, 12 May 2025 10:48:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B20B7F899ED;
	Mon, 12 May 2025 10:48:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCCCEF899BB; Mon, 12 May 2025 10:48:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99B29F897FB
	for <alsa-devel@alsa-project.org>; Mon, 12 May 2025 10:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99B29F897FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=j9gV666c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747039717; x=1778575717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WAOvh/4GnvFhcgh061nbP20b/JnhXfig2pIhpA4U20k=;
  b=j9gV666cI861/WKkJ4+rGP5e/b1prpohM912OrpQHnnDYp1HKtcyhd6J
   Bm5CvO3zruZirWqlB5uYnwtZ8BaMmqhOGD8/oxMS0vEA/zt40EHYe0yLi
   VWwXjbkB74gQRGdElv6CAnBlpdpfTj3D2/DXm8/CA91YdaZyc/InLsUJs
   mg+6IGbnyv8M01Ew/cmQAHId/LC7ByHjpTWOynfgyxvk3qUI26prxuD17
   yveqb/yfnCyFOBctpR8wHXuRObfi83VOQYb/oSotHjSmjKHhAv7cx58YJ
   rKkLfXOtRf8l9T739qYoTtFqwVpJIpss4qTTWjjBB7AsynhChhqRGxZxD
   w==;
X-CSE-ConnectionGUID: k+i5UCjSS8y6J/l49llpoA==
X-CSE-MsgGUID: +O8GwkdISrKm5lHYw6oMgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48691077"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600";
   d="scan'208";a="48691077"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 01:48:31 -0700
X-CSE-ConnectionGUID: 8NVwgn5NQtK1eChsNsNmzg==
X-CSE-MsgGUID: dZvUWkknRcOtJJ8GGXb0/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600";
   d="scan'208";a="137709382"
Received: from smile.fi.intel.com ([10.237.72.52])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 01:48:28 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uEOpl-00000000rm0-2NyE;
	Mon, 12 May 2025 11:48:25 +0300
Date: Mon, 12 May 2025 11:48:25 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, broonie@kernel.org, 13564923607@139.com,
	13916275206@139.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, baojun.xu@ti.com, Baojun.Xu@fpt.com,
	jesse-ji@ti.com
Subject: Re: [PATCH v2] ALSA: hda/tas2781: Fix the ld issue reported by
 kernel test robot
Message-ID: <aCG12YmBS-9Vmc7N@smile.fi.intel.com>
References: <20250512081822.1513-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512081822.1513-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: TJUDOUZ4EFPLVG3NPJH2CFCN46DNFPDD
X-Message-ID-Hash: TJUDOUZ4EFPLVG3NPJH2CFCN46DNFPDD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TJUDOUZ4EFPLVG3NPJH2CFCN46DNFPDD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, May 12, 2025 at 04:18:22PM +0800, Shenghao Ding wrote:
> After commit 9fa6a693ad8d ("ALSA: hda/tas2781: Remove tas2781_spi_fwlib.c
> and leverage SND_SOC_TAS2781_FMWLIB")created a separated lib for i2c,
> tasdevice_remove used for not only for I2C but for SPI being still in
> that lib caused ld issue.

> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://urldefense.com/v3/__https://lore.kernel.org/
> |  oe-kbuild-all/202505111855.FP2fScKA-lkp@intel.com/
> |  __;!!G3vK!U-wdsvrOG1iezggZ55RYi8ikBxMaJDVs7u17Z9-7Xa-
> |  0lnyE4S3m2qmLCcHVK4qH1bD1JuBdzg$

This should be in a tag area below, each tag is exactly one line (the same way
as Fixes:, for example)

> All errors (new ones prefixed by >>):
> >> ld.lld: error: undefined symbol: tasdevice_remove
>    >>> referenced by tas2781_hda.c:33 (sound/pci/hda/tas2781_hda.c:33)
>    >>>               vmlinux.o:(tas2781_hda_remove)
> To fix this issue, the implementation of tasdevice_remove was moved from
> tas2781-comlib-i2c.c to tas2781-comlib.c.

-- 
With Best Regards,
Andy Shevchenko


