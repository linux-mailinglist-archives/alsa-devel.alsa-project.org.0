Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 820D8896B84
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 12:05:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 732332CCD;
	Wed,  3 Apr 2024 12:05:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 732332CCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712138745;
	bh=Y7WN2tYAYpmCgOP1gQPKV9jeKqkz0Te+qM3j90UOY1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jWnEGM7zSBPCjt2g++A8R+DlV7+Inh431hwMtmJlLuDO0VFzcCY3/HPb99klVCtb/
	 dvrU17EaHbspYL3AoIMyPZmYB4RIBcT41N/ll4JbV6agHMbr7DzjBO46uQCZZxYN3Z
	 cvjHzU+l9ZWbsyaPg9vSLcVZ6tbAxzRUpDnSC6p0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FBD8F8056F; Wed,  3 Apr 2024 12:05:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C2FAF80578;
	Wed,  3 Apr 2024 12:05:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C399F8020D; Wed,  3 Apr 2024 12:05:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C473AF8015B
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 12:05:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C473AF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=b+C0f+A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712138703; x=1743674703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y7WN2tYAYpmCgOP1gQPKV9jeKqkz0Te+qM3j90UOY1g=;
  b=b+C0f+A1ZXQOh215Ooj8tDSO68dnO3MAvOEz068IPeF6JrsSayjAOcOD
   1E/wVCyp21e1VZPM3zTKClM/mWhwY63SnDzhl0oPEFG6QLdBYVPK4d+kE
   XPLgsZLBOur23Z1tq4j6sifxXitL9S51qJyXz7lqZkg+//8czIg9U8ob8
   SH+5NglPIv5MzBtvZe1VzeXaQiqksTNJiMpIJA2Ud0iksZSBltn/pgu0R
   Gp6e6ZK9Jsfl7VNRxwgj9763g523DiUFhH7qPFKrQfLHwDa/2DDps03uO
   c0TMCH56FOeG9jCEQ4a+VNPydfnvt463qxvTfVsgrjwsFklGKKHlXA3Xg
   g==;
X-CSE-ConnectionGUID: Y7Ot4MqTQsOaCz/lY4be2Q==
X-CSE-MsgGUID: CdYtZ/ZXRiW/Yj6XDd7iMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7485609"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="7485609"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 03:04:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="915177205"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="915177205"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 03:04:53 -0700
Received: from andy by smile with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rrxUA-000000015H8-1gdE;
	Wed, 03 Apr 2024 13:04:50 +0300
Date: Wed, 3 Apr 2024 13:04:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com, bard.liao@intel.com,
	yung-chuan.liao@linux.intel.com, kevin-lu@ti.com, tiwai@suse.de,
	baojun.xu@ti.com, soyer@irl.hu, Baojun.Xu@fpt.com, navada@ti.com,
	v-po@ti.com
Subject: Re: [PATCH v1] ALSA: hda/tas2781: correct the register for pow
 calibrated data
Message-ID: <Zg0pwtuQ9gfeXwxd@smile.fi.intel.com>
References: <20240402231300.362-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240402231300.362-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: N765PVMEYQMMK6XNHXFATFLH23V7BUN4
X-Message-ID-Hash: N765PVMEYQMMK6XNHXFATFLH23V7BUN4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N765PVMEYQMMK6XNHXFATFLH23V7BUN4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Apr 03, 2024 at 07:12:59AM +0800, Shenghao Ding wrote:
> fixed tas2781 calibrated data - pow was written into a wrong register.

fixed --> Fix

Fixes tag?

> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

...

> +		0x17, 0x18, 0x18, 0x13, 0x18
> +		0x74, 0x0c, 0x14, 0x70, 0x7c

While at it, can you add a trailing comma?
It will help in case of extending this in the future.

-- 
With Best Regards,
Andy Shevchenko


