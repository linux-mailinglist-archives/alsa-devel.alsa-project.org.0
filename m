Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CD894D3F7
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2024 17:49:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFD5114E8;
	Fri,  9 Aug 2024 17:49:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFD5114E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723218561;
	bh=6AqbC+HU4YQ2LAJOxXnEAW/+2QcWo16Jjv40Zr+G2ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bPLYDQYfxqmRAHZi01+nH6NM+LGa/bhiNff64K3spbcS/TSdQand8IjhQhbAH5Z8v
	 n6F6/6B2yje13k9YSDVCey37J9CA4eknq3qE+klvGoWgsV6MLUqi9opVftOVjUt5UP
	 H6wF+MpjwE9XAmqR36p+zV7m2Usi391y1axoZeNI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA3D5F805B4; Fri,  9 Aug 2024 17:48:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 105D4F8057A;
	Fri,  9 Aug 2024 17:48:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0263EF802DB; Fri,  9 Aug 2024 17:20:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1148F8023A
	for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2024 17:18:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1148F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=J6jiLE/T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723216684; x=1754752684;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6AqbC+HU4YQ2LAJOxXnEAW/+2QcWo16Jjv40Zr+G2ic=;
  b=J6jiLE/T2KlXnz5/12Y/VK3gIJAwCO8gBRhcAJlCj4UapCNdPOLzkqtB
   9KZMNGFLGrGgLnz0QfFbdlqNbgiptOVA4KH13S1envvmhlhpbsR11QW+3
   MUr9+brP+jvvayvQqfBIsx2uyY5JpZrUItAVONeQdKhyRULWXIx/WAd64
   LTLgHKutYIZmgB0fcL23RGibq9IJYfrgsPpPdXdKzZoSqKBGM+qnIcNFY
   UM0QfVjDKkUX+NGc8BJsvQvNMWVcYOzIVt4Ru2A7ligkEoPuaiwlE1n/i
   HcAMDrICn3W7l1lg+VOt7VlftCgL/acJJQRgJ6qLGe3MIaIXJ3XzIVHMq
   w==;
X-CSE-ConnectionGUID: ekJQyQWeQbGvD0yBkUtbmg==
X-CSE-MsgGUID: iSNaMJLyRD+NxR2ZrggzDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="38899786"
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800";
   d="scan'208";a="38899786"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 08:17:58 -0700
X-CSE-ConnectionGUID: 1ZdI463DT5yFGavFpXhXCg==
X-CSE-MsgGUID: VbYX1t7MTqGnHCVcT/gqjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,276,1716274800";
   d="scan'208";a="88233745"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 08:17:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1scRNB-0000000DSBD-3BY5;
	Fri, 09 Aug 2024 18:17:45 +0300
Date: Fri, 9 Aug 2024 18:17:45 +0300
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
	jesse-ji@ti.com, darren.ye@mediatek.com
Subject: Re: [PATCH v1] ASoc: tas2781: Add new Kontrol to set tas2563 digital
 gain
Message-ID: <ZrYzGWQRdsTlYxQg@smile.fi.intel.com>
References: <20240628041844.1776-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628041844.1776-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: WXZ3ZPE73OWMAVEXF3EHGNWZT7I2MUWF
X-Message-ID-Hash: WXZ3ZPE73OWMAVEXF3EHGNWZT7I2MUWF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WXZ3ZPE73OWMAVEXF3EHGNWZT7I2MUWF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jun 28, 2024 at 12:18:43PM +0800, Shenghao Ding wrote:
> Requriment from customer to add new kcontrol to set tas2563 digital gain
> and set "Speaker Force Firmware Load" as the common kcontrol for both
> tas27871 and tas2563.

...

>  #include <sound/tas2781.h>
>  #include <sound/tlv.h>
>  #include <sound/tas2781-tlv.h>

> +#include <asm/unaligned.h>

Before sound would be better, but I'm not insisting.

...

> +	ret =  tasdevice_dev_bulk_read(tas_dev, 0, reg, data, 4);

Too many spaces.

...

> +	/* find out the member same as or closer to the current volume */
> +	ucontrol->value.integer.value[0] =
> +		abs(target - ar_l) <= abs(target - ar_r) ? l : r;

Why do you need to have target to be applied here? IIUC arithmetics correctly
it makes no value to use target in this equation.

...

> +out:
> +	mutex_unlock(&tas_dev->codec_lock);

Why not using cleanup.h?

> +	return 0;

...

This all reminds me that I already gave same/similar comments in the past...


-- 
With Best Regards,
Andy Shevchenko


