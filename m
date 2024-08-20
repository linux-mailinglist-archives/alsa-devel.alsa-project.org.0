Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B7E95851E
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 12:48:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9059209;
	Tue, 20 Aug 2024 12:48:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9059209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724150890;
	bh=BKg+Y0/zXMM9brGMwytVaAoi+ulkRH00v3CbF3AhM04=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CZdCQk8OHMAotCeE5rMTHx3f0YDvKUQC2sOYqC3qpZy11SqBCDm0P20F0KBSjDQgm
	 dYz35nw2xIXJ8vkgjL4DtLNsnOM4BkYd6Y5jqbpr0siwkGZRuFqbkJ4eLmUaNkSSwh
	 ngDE+52z4c03uXzS8HwtGVPmAiHyScGMRChdQlNk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74E9DF805B3; Tue, 20 Aug 2024 12:47:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DDB4F805AE;
	Tue, 20 Aug 2024 12:47:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 113A9F80494; Tue, 20 Aug 2024 12:46:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41797F80107
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 12:46:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41797F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WPdobiGL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724150783; x=1755686783;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BKg+Y0/zXMM9brGMwytVaAoi+ulkRH00v3CbF3AhM04=;
  b=WPdobiGLV23vNoP9CZU/hed4UDnrT2k5Jl3ukYGCu2OaWwLrxo6LXHSL
   nnqU6l8gxQeZrKLRhG3ewtdkxeGYhOVBTkOW5JJ6RXWRjnm49cVPvfIuK
   LkRqs1EWNsA/WxdB0lcTHK8ggp4oFOnNJogJGnsBlyDw52fjnRFrtWZvH
   A/4WjgEwdZa63736lhG2nZ51wVMTMZ89Um0hPD4lG/WV+XJCzuAuDvuSQ
   RVMMvv0KEOkjNaRkp6a+DPZ7oyh2ZZVuqzD1GE8oa3dCBg2Fw2kdgzZ7o
   P3UnuHt2VNTdk2hKd81H81NnylpW03+Xu54+7VXbQF3y64wh75Tp6FKIO
   g==;
X-CSE-ConnectionGUID: t3Ijo1ytTNGNQ1aTcw+wdg==
X-CSE-MsgGUID: y/oxOraaTUuN5zrKiFgpHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22586892"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600";
   d="scan'208";a="22586892"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 03:46:17 -0700
X-CSE-ConnectionGUID: vARPClTRTZet0r3W4RJybg==
X-CSE-MsgGUID: uRauBkOfSIeU7VqvlvvJhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600";
   d="scan'208";a="60528202"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 03:46:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sgMNK-0000000HGhD-0DTV;
	Tue, 20 Aug 2024 13:46:06 +0300
Date: Tue, 20 Aug 2024 13:46:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
	liam.r.girdwood@intel.com, jaden-yue@ti.com,
	yung-chuan.liao@linux.intel.com, dipa@ti.com, yuhsuan@google.com,
	henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com, Baojun.Xu@fpt.com,
	judyhsiao@google.com, navada@ti.com, cujomalainey@google.com,
	aanya@ti.com, nayeem.mahmud@ti.com,
	savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com,
	jesse-ji@ti.com, darren.ye@mediatek.com, antheas.dk@gmail.com,
	Jerry2.Huang@lcfuturecenter.com, jim.shil@goertek.com
Subject: Re: [PATCH] ASoc: tas2781: replace devm_kzalloc and scnprintf with
 devm_kasprintf
Message-ID: <ZsRz7VOczPa8vQCW@smile.fi.intel.com>
References: <20240820050926.101-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820050926.101-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: VCODCQZRJMYD2DIKLDPTBBDYILCKAUXL
X-Message-ID-Hash: VCODCQZRJMYD2DIKLDPTBBDYILCKAUXL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VCODCQZRJMYD2DIKLDPTBBDYILCKAUXL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 20, 2024 at 01:09:24PM +0800, Shenghao Ding wrote:
> Replace devm_kzalloc and scnprintf with devm_kasprintf.

We refer to functions as func() [mind the parentheses].

...

> +	name = devm_kasprintf(tas_priv->dev, GFP_KERNEL, "Speaker Profile Id");

These three do not use any formatting strings. Effectively it simply
devm_kstrdup() in all cases. But see the Q below.

>  	if (!name) {
>  		ret = -ENOMEM;
>  		goto out;
>  	}

> +	/* Create mixer items for selecting the active Program and Config */
> +	prog_name = devm_kasprintf(tas_priv->dev, GFP_KERNEL,
> +		"Speaker Program Id");
> +	if (!prog_name) {
>  		ret = -ENOMEM;
>  		goto out;
>  	}

> +	conf_name = devm_kasprintf(tas_priv->dev, GFP_KERNEL,
>  		"Speaker Config Id");
> +	if (!conf_name) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}

So, why all these may not be constant literals assigned directly
to the respective data structures?

-- 
With Best Regards,
Andy Shevchenko


