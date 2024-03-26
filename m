Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F36B988C636
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 16:02:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D38E3279D;
	Tue, 26 Mar 2024 16:02:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D38E3279D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711465375;
	bh=mt0ToVCugUi6oKxd1necFZMybb2ozw3PPcCpHtg8BkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pMhFjjGk5WILlA73RCigDRMwMuyIdFwXq56PSTYuhYREfamHetNS44JNO2wrUbJYi
	 giFHD2cijdGRIGMFn7iieY/6O6QenD9GXAsy9VkFHlB4H/aCl2n9pajWwWNxM4CdbR
	 QYwkvjF3wgqmcLF/mtCtFHkK7qpfT5giV2plbU/o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14AB7F8057A; Tue, 26 Mar 2024 16:02:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4B74F80236;
	Tue, 26 Mar 2024 16:02:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D580F80093; Tue, 26 Mar 2024 16:02:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6FA5F80093
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 16:02:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6FA5F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VwHp0Ty0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711465339; x=1743001339;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mt0ToVCugUi6oKxd1necFZMybb2ozw3PPcCpHtg8BkY=;
  b=VwHp0Ty0BqI2x1/9jEwCBLk2s6TBloZKDAzXgwscnFPWdnOSDxfYq5Z9
   5DkJVg5isNPoRkqnFV6PR9AhEeWqELip5pIwx0NswAb8S9ym8ppuqWlvs
   9qbO0H05OzJOmxxYlnXJqC2HeYD02V0qymDaLzAnS2mO7zekNEipqOU2A
   Y8YBF4Lcs0TI9D/T8jLUVcz+S+H3rdkvj0gT0T29ZLbkSBw91JCndfra7
   Atd5ixWOkz2dTE8Ev4uEiu0qNeIWXkHJwokDWAPt2WDESjIBXRsL7GzVf
   5rj+XtYL4J2t2V7qvbtd6TZdDnxs/U28o9at1yeTdmmIa6qogDyKoCgH7
   w==;
X-CSE-ConnectionGUID: 9okofQ4jS+qRA11s6PVrLA==
X-CSE-MsgGUID: oIADjIHITYKQCv8EbhgVHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6415933"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="6415933"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 08:02:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="914882688"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="914882688"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 08:01:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rp8JI-0000000GKjp-2BnH;
	Tue, 26 Mar 2024 17:01:56 +0200
Date: Tue, 26 Mar 2024 17:01:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, kevin-lu@ti.com,
	13916275206@139.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
	yung-chuan.liao@linux.intel.com, broonie@kernel.org, soyer@irl.hu
Subject: Re: [PATCH v1 4/8] ALSA: hda/tas2781: Add tas2781 SPI-based driver
Message-ID: <ZgLjZElcF-2uBbtz@smile.fi.intel.com>
References: <20240326010905.2147-1-baojun.xu@ti.com>
 <20240326010905.2147-4-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326010905.2147-4-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: PSDHW6ZVNLA2KCAKRJPIEONWQ33MWZOP
X-Message-ID-Hash: PSDHW6ZVNLA2KCAKRJPIEONWQ33MWZOP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PSDHW6ZVNLA2KCAKRJPIEONWQ33MWZOP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Mar 26, 2024 at 09:09:01AM +0800, Baojun Xu wrote:
> Add tas2781 spi driver files.

...

> +obj-$(CONFIG_SND_HDA_SCODEC_TAS2781_SPI) += snd-hda-scodec-tas2781-spi.o

File not found.

I believe you should fold patches 3&4&5

-- 
With Best Regards,
Andy Shevchenko


