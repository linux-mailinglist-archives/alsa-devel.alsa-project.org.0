Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F30575397C
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 13:28:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 323F61E9;
	Fri, 14 Jul 2023 13:27:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 323F61E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689334095;
	bh=ybJ/zTQMZflW+QDzy7QdMvE5i6zccg/T78xnlv907o0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Vtw0//AwP3kAheisNyuVfKcJgbW2zXmm2ySlIWZ4zjaxYglGKqGrgWGVKsSycwqe/
	 tXt/twa92EYAmtLJvrzBOihxDlOPQ/clObthT4qdh+weGQVRaSnydmG+9whJZGFKOQ
	 b59obpz505dsgTDXLuRuylsjk9EE3ysFV71/cen8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3349F8024E; Fri, 14 Jul 2023 13:27:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE331F80153;
	Fri, 14 Jul 2023 13:27:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46297F80236; Fri, 14 Jul 2023 13:26:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46C0BF800D2
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 13:26:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46C0BF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kQHHv1/q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689334014; x=1720870014;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ybJ/zTQMZflW+QDzy7QdMvE5i6zccg/T78xnlv907o0=;
  b=kQHHv1/qtbLn+IzZCKfoms7JvGdnKE4J36uB9zc2Xc6hFLcYrwlbC6fi
   f/pENovuzQa/mRpPxU4w3mApXbabsR6HcVgCrXmMPAmr16LTkrYyR+Vue
   1f+gCX4CpCFbLgx9SERJj1IrfWFyco2Lw6n1pukRc6W2hhQMjCH/7CrAQ
   SxsH4rzojoOqojjP38hk+F4vxr6UsxaiVkE2Q+w5lhxT5DLQWR+CnPqEO
   U/rsaKXCVZylFv1KSS7OBov1vqP4cv+7auH4JBRGycAxVZXf7esVIgw3u
   ZGOIjj4lNTULq9p4wk2I7BTYb54vHRAUgS2FIOSsAkjEsBOvFwJECkp+w
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="365489657"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="365489657"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 04:26:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="812392903"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="812392903"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Jul 2023 04:26:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qKGwf-002e2d-2K;
	Fri, 14 Jul 2023 14:26:45 +0300
Date: Fri, 14 Jul 2023 14:26:45 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 15/15] ASoC: Intel: sst: Convert to PCI device IDs
 defines
Message-ID: <ZLEw9S8hmkcdk7K2@smile.fi.intel.com>
References: <20230714185615.370597-1-amadeuszx.slawinski@linux.intel.com>
 <20230714185615.370597-16-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230714185615.370597-16-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 3CEOUCUU7MJEHCJT4ILTQKOBO2GPXCOV
X-Message-ID-Hash: 3CEOUCUU7MJEHCJT4ILTQKOBO2GPXCOV
X-MailFrom: andriy.shevchenko@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3CEOUCUU7MJEHCJT4ILTQKOBO2GPXCOV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jul 14, 2023 at 08:56:15PM +0200, Amadeusz Sławiński wrote:
> Use PCI device IDs from pci_ids.h header.

Perhaps one more sentence to explain why this is okay change, like:
"The ACPI IDs are used only internally and lower 16 bits uniquely define
 the device as vendor ID for Intel is 8086 for all of them."

Suggested-by: ?

...

> -	{ PCI_VDEVICE(INTEL, SST_MRFLD_PCI_ID), 0},
> +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_SST_TNG), 0},

That 0 is not needed, OTOH you may use PCI_DEVICE_DATA(..., 0).

-- 
With Best Regards,
Andy Shevchenko


