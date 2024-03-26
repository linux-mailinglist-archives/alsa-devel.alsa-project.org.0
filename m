Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F6E88C65E
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 16:09:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B48A27AA;
	Tue, 26 Mar 2024 16:08:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B48A27AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711465737;
	bh=salEnXficVUZmNY6rXQXrXxSmht6F3pTk6zHx4Io0ZE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SWUUTdWhuAekbuBUlnydeusGskkghtwlVNVMGJw8VJq3nIgU2DnJan5m8NR4eeL7Y
	 C1G7204bL94v1HMKsJYxKtL1okkrnKqNmTnfpyWBUesB0c80FgKzhVR9Me9fi5BmJi
	 bppWe6eNvWzQ3l5QVHe0dsAh6gCeTxtbAaY/lBcA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39A06F805AE; Tue, 26 Mar 2024 16:08:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9994FF8025F;
	Tue, 26 Mar 2024 16:08:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C039EF8025F; Tue, 26 Mar 2024 16:03:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E265F801EB
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 16:03:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E265F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=E77ULRmD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711465431; x=1743001431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=salEnXficVUZmNY6rXQXrXxSmht6F3pTk6zHx4Io0ZE=;
  b=E77ULRmDMBSxvD3+BU1UZgBpjzY/ATROrvRiggsve8sauBMEiGMmjLeB
   j8HyTUZoos4ZGojXps22/1EOe+AbocsDoiWkSfX2tQAUyW2HZ+FOZihsH
   m7KUCW6q09TThPcg6XYuL+Qkh0QpvfBYCLaxp55n8dCJ/M6SpQnFAlNzX
   5p2Oqic4Los6hlQRYUrqLuyIh6vD2jz15um35T3IcFBdQCipM3WPvCRDu
   1Sk5me3a+e+WZUyCKDBmQ2hpubxOZ4Voxm2cnEuD0G6LVQXAr093NdPdX
   O0oqLAIP7yt54Jq44ihjEr/BgtQm8fzC3m2aZY7Kr9kdvVHOb28hJtoYL
   w==;
X-CSE-ConnectionGUID: AgSnn2uOTyerrRObD88mYQ==
X-CSE-MsgGUID: WpIlT2DBRs2bsS2eX5R9uQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6416822"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="6416822"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 08:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="914882723"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="914882723"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 08:03:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rp8Kz-0000000GKlS-114A;
	Tue, 26 Mar 2024 17:03:41 +0200
Date: Tue, 26 Mar 2024 17:03:41 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, kevin-lu@ti.com,
	13916275206@139.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
	yung-chuan.liao@linux.intel.com, broonie@kernel.org, soyer@irl.hu
Subject: Re: [PATCH v1 4/8] ALSA: hda/tas2781: Add tas2781 SPI-based driver
Message-ID: <ZgLjzci1MpHOYsI_@smile.fi.intel.com>
References: <20240326010905.2147-1-baojun.xu@ti.com>
 <20240326010905.2147-4-baojun.xu@ti.com>
 <ZgLjZElcF-2uBbtz@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgLjZElcF-2uBbtz@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: FOKH5UIWG73XJHCCL42BJSWQTMVLFULO
X-Message-ID-Hash: FOKH5UIWG73XJHCCL42BJSWQTMVLFULO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FOKH5UIWG73XJHCCL42BJSWQTMVLFULO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Mar 26, 2024 at 05:01:56PM +0200, Andy Shevchenko wrote:
> On Tue, Mar 26, 2024 at 09:09:01AM +0800, Baojun Xu wrote:

...

> > +obj-$(CONFIG_SND_HDA_SCODEC_TAS2781_SPI) += snd-hda-scodec-tas2781-spi.o
> 
> File not found.
> 
> I believe you should fold patches 3&4&5

Instead of '5' I meant "all after 5th".

-- 
With Best Regards,
Andy Shevchenko


