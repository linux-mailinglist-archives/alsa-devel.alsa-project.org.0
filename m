Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F01648A992A
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 13:57:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AC81E0F;
	Thu, 18 Apr 2024 13:57:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AC81E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713441446;
	bh=Geu961+SVr9aZ7BLK4Mm8AQ6E9OjYikibtvsd2knVAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oqxV3J6UVMU4Z2RK1TVjFXr+Ah79KKvmLjFHDnv9iNkq7DLK3EqHIf9jKeECVuVbi
	 +JWjBlZ5B65C/kpZu7Mqz3RVVp2p3cdwwr8ckmrDrNXxGUduhbnpCkUEHaOLVN683E
	 dFCjH0eO89gkgDRSZUTqacin9qw9jvMflcwZdGqU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 933EBF805A0; Thu, 18 Apr 2024 13:56:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0AB9F805A1;
	Thu, 18 Apr 2024 13:56:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA86CF8025A; Thu, 18 Apr 2024 13:56:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DA3BF8003A
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 13:56:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DA3BF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=k09+LH1G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713441407; x=1744977407;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Geu961+SVr9aZ7BLK4Mm8AQ6E9OjYikibtvsd2knVAs=;
  b=k09+LH1GYL47wmXOLG421jT6Ci9UOBQjq9lu2jiAw77z/3K7DY2tpHqW
   2jh5nULyxBiTM4AwWKQw1mNfKoTZ4e7CDf+pv6a9zE7s+erhnrlfu1shk
   lQE4gP9PJInV4ikJk9yGb5SbFtjlkeUt2J/NweqeqGyXrKS/TyEBRY3xM
   ZXtZ11uxKkKYqlcl1soI45DJlqXBzOWSAY9ClXiIB+/VdTzn3PU3r6grZ
   ng17wKnGY35Kvwc8k7Tanb3wps1Isk2lFxHPTSyOlsOfffmSPMZ08UMDl
   u+U5LOpEaTa4WNL1xB2mzOlZdeWHDAM8yKqN858C9m5zJoz+5IMUc4wtR
   Q==;
X-CSE-ConnectionGUID: shyF056uT9SajfF/ji0CZg==
X-CSE-MsgGUID: jAyJnC18RP6G3sSLqNQbTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20128129"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000";
   d="scan'208";a="20128129"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 04:56:43 -0700
X-CSE-ConnectionGUID: ybbDpHq6RhaPbzSEQhiOAw==
X-CSE-MsgGUID: ZgfGlSTURE2FhXwvBTtjgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000";
   d="scan'208";a="27732961"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 04:56:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rxQNX-00000000Jfk-2mVN;
	Thu, 18 Apr 2024 14:56:35 +0300
Date: Thu, 18 Apr 2024 14:56:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: tiwai@suse.de, robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, kevin-lu@ti.com,
	shenghao-ding@ti.com, navada@ti.com, 13916275206@139.com,
	v-po@ti.com, niranjan.hy@ti.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
	yung-chuan.liao@linux.intel.com, broonie@kernel.org, soyer@irl.hu
Subject: Re: [PATCH v3 1/3] ALSA: hda/tas2781: Modification for add tas2781
 driver for SPI
Message-ID: <ZiEKc4OTVlOt8llU@smile.fi.intel.com>
References: <20240418040240.2337-1-baojun.xu@ti.com>
 <20240418040240.2337-2-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240418040240.2337-2-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: RJ4SDB2VE7BLEBDGVATPDJ3FSTAOYSNZ
X-Message-ID-Hash: RJ4SDB2VE7BLEBDGVATPDJ3FSTAOYSNZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RJ4SDB2VE7BLEBDGVATPDJ3FSTAOYSNZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Apr 18, 2024 at 12:02:37PM +0800, Baojun Xu wrote:
> Integrate tas2781 configs for HP Laptops. Every tas2781 in the laptop
> will work as a single speaker on SPI bus. The code support realtek as

Realtek

> the primary codec.

...

>  sound/pci/hda/Kconfig                           | 15 +++++++++++++++
>  sound/pci/hda/Makefile                          |  2 ++

Is this correct? You are adding a dead "code", isn't it?

...

The rest LGTM.

-- 
With Best Regards,
Andy Shevchenko


