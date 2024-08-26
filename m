Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1E795F141
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2024 14:24:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48E311FF;
	Mon, 26 Aug 2024 14:24:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48E311FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724675052;
	bh=AN+mymZ47oG8J5IJN3KGXxRvCppT8b+ieKfaZMUYbSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QsIVxfLm+5gGP1kllQpaFIjRnQJqT0AZZcg69sqw3aAZobmhlqeLaVYeNOONJueyV
	 WEkCV5PDb9+MuUDE3yySNDyld/eDItNmDpI5cVjGcQzkMsPFCNlAHb9o0IJwMv+Gte
	 YGn/jWBGyB+xrEuuGxYxBpNKtjmJNQqZRkN78lgo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D341F8025E; Mon, 26 Aug 2024 14:23:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 637CBF80494;
	Mon, 26 Aug 2024 14:23:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D905F80423; Mon, 26 Aug 2024 14:23:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF6ADF8025E
	for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2024 14:23:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF6ADF8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VRRkH6Ww
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724675010; x=1756211010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AN+mymZ47oG8J5IJN3KGXxRvCppT8b+ieKfaZMUYbSk=;
  b=VRRkH6WwwJX2o/uHZhhR6X0GqqiV6dJHBwLXnNENN3gjnC/dvHrTwAc3
   Q2oIwuylBQmRoo28z6pro5hAZrdvSt2h823Dgw+n69vYCDMwXkB9ioteL
   svP3Mi7/JNRgwfu9sKzg3ChlPmqW8JjyQ9TDpqsVGcsZxC8m53MGzijvr
   Fwaz2mRm99BwUNl5ie5KFcInyoaNbJGpr8Nos2ulfzCaERNedjHPEY7St
   /JmmYaxLZEmQ0TGgQCtfSx2F2PUQFJ63WwDESxsgS9FQUKfcUV3OTOmIX
   gHvvj5fuhr5OrvhV9dEAiuixnpacSYbKPSEJG+m6vxkJf+y0zgG8y02Mc
   A==;
X-CSE-ConnectionGUID: Lr5eoy9fQXupOdPHz2RJ1Q==
X-CSE-MsgGUID: LVI1xfdJT/OXpRjmtW1YAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="22969897"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600";
   d="scan'208";a="22969897"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 03:04:13 -0700
X-CSE-ConnectionGUID: 7qGzaO1DTUSbWs2hkpuzhQ==
X-CSE-MsgGUID: 3/S1xphaSM+NxZ9rnVru/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600";
   d="scan'208";a="62158026"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 03:04:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1siWZv-00000001pEw-0Cr9;
	Mon, 26 Aug 2024 13:04:03 +0300
Date: Mon, 26 Aug 2024 13:04:02 +0300
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
Subject: Re: [PATCH v2] ASoC: tas2781: replace devm_kzalloc and scnprintf
 with devm_kstrdup
Message-ID: <ZsxTEnz7G0_ufEYw@smile.fi.intel.com>
References: <20240824060503.1259-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240824060503.1259-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: H3BCJA7UGNB4VN6TTGI5M2RVEKJE2NFH
X-Message-ID-Hash: H3BCJA7UGNB4VN6TTGI5M2RVEKJE2NFH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H3BCJA7UGNB4VN6TTGI5M2RVEKJE2NFH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Aug 24, 2024 at 02:05:00PM +0800, Shenghao Ding wrote:
> Replace devm_kzalloc and scnprintf with devm_kstrdup.


We refer to the functions as func().
Please, fix this in the Subject and commit message.

...

> +	conf_name = devm_kstrdup(tas_priv->dev, "Speaker Config Id",
> +		GFP_KERNEL);

Can be squeezed to a single line.

...

Other than above, LGTM.

-- 
With Best Regards,
Andy Shevchenko


