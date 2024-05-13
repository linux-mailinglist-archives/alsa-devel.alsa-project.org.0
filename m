Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 894418C3E7C
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2024 11:59:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7879DF8;
	Mon, 13 May 2024 11:59:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7879DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715594388;
	bh=ankU08gSvLs7z5PjJH2l/JvZZTP/EIbvoooq0j5B/0s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z4v0NpLop2BU2c8S5NF1k2DCAwed/2Im86QLCTXjgWbqw9T1WSbZuTqUIWfuYtMIH
	 aAv9B0lQEXswSp1r8C3V9HJy3YFe3Qsrj0BmNNaUZVVTXiGK/AWaTqV1CLA7UTjAwY
	 t19lC/Gl+xOvM9MG1f/u2AxWo8kBVxV1RleMRRks=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C0A8F805AA; Mon, 13 May 2024 11:59:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86B40F805A0;
	Mon, 13 May 2024 11:59:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7A5BF80224; Mon, 13 May 2024 11:59:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66C57F800E2
	for <alsa-devel@alsa-project.org>; Mon, 13 May 2024 11:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66C57F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Tp4qpTXM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715594347; x=1747130347;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ankU08gSvLs7z5PjJH2l/JvZZTP/EIbvoooq0j5B/0s=;
  b=Tp4qpTXMHRlfrjYJsDobnKRUH8K9UgALSyn550Kzn9FPKE9kMvZPXaaE
   GgPaf6jXgctfWlca813RyzPuxZun4luYa+13P3EqVuvUbGtnnjnChLOJ8
   eiXrMfpYe+MaHvmCypmmGdlZFSCBYPi9mP/LomtQLa0i9OqHoWbCqLFHi
   MTt9pENZHa0I9muPt6tbcfRfsKPeB+PrXbpuxiV/5iEF2UG9jZIAuq0+E
   ufI2mLIDVaphxEK1n+aFR4ync1g+0nSDO2+7Ba+2cgfjADvtb0drbBRfV
   79EahXR/KhCQFuI6wGl3kMYTg/Ro8FLuvFuCvWKBsBeBCzE0kPftuh/MC
   A==;
X-CSE-ConnectionGUID: qAjaX7jKQm+6ohUIzPR3nQ==
X-CSE-MsgGUID: GjtBCx0wTWCsx2gFryvU5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="15355328"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000";
   d="scan'208";a="15355328"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 02:59:02 -0700
X-CSE-ConnectionGUID: nNf+vrqtRyyToNxv2M9oWA==
X-CSE-MsgGUID: EahDSCLJRKS0nA4a6GTXQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000";
   d="scan'208";a="30702672"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 02:58:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s6SSM-000000074o7-14V8;
	Mon, 13 May 2024 12:58:54 +0300
Date: Mon, 13 May 2024 12:58:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com, bard.liao@intel.com,
	yung-chuan.liao@linux.intel.com, kevin-lu@ti.com,
	cameron.berkenpas@gmail.com, tiwai@suse.de, baojun.xu@ti.com,
	soyer@irl.hu, Baojun.Xu@fpt.com
Subject: Re: [PATCH v5 1/3] ASoC: tas2781: Fix wrong loading calibrated data
 sequence
Message-ID: <ZkHkXYCpkuWzgZgR@smile.fi.intel.com>
References: <20240512025040.1276-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240512025040.1276-1-shenghao-ding@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: UMQP6IJQNWH2VP6F2ADJLRRLCXJBKOVO
X-Message-ID-Hash: UMQP6IJQNWH2VP6F2ADJLRRLCXJBKOVO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UMQP6IJQNWH2VP6F2ADJLRRLCXJBKOVO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, May 12, 2024 at 10:50:37AM +0800, Shenghao Ding wrote:
> Remove declaration of unused API which load calibrated data in wrong
> sequence, changed the copyright year and correct file name in license
> header.

> -int tasdevice_prmg_calibdata_load(void *context, int prm_no);

This is still being used in two files. How won't this break the build?

-- 
With Best Regards,
Andy Shevchenko


