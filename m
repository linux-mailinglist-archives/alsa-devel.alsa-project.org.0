Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 357C074145F
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 16:56:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A2AB1E0;
	Wed, 28 Jun 2023 16:55:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A2AB1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687964163;
	bh=950ad4Q8R9S74I5gc8AWjL24I3KI0SJhn8K91bX+Hs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yqnn+a90zwL+ItazIxA35cOgdxBiAS3txdyZtjlWHb7LOtyDC9Ov6SPWT/m2U51YU
	 bo+2ftNiRF8ZdxsjvBnMR1gCphLkQODlkCAYci8osR8jN6qbm0ry1LbxGCGZFd5NJW
	 ZBvyC266S8JOLkq8DzzNmHz+pUSVMMuVPatmzbVM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44269F80535; Wed, 28 Jun 2023 16:55:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DDE6F80212;
	Wed, 28 Jun 2023 16:55:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69F80F80246; Wed, 28 Jun 2023 16:55:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 45ACEF80124
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 16:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45ACEF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=D61oyiHR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687964108; x=1719500108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=950ad4Q8R9S74I5gc8AWjL24I3KI0SJhn8K91bX+Hs4=;
  b=D61oyiHRIWNGZxAhBWFDEgK66hC1P7yzmzBaO4o22zrJepbU1emLZ13v
   B6JDqCJoAWAmirYZuK7Nx3r739fnVdd1YKr3iCtK+ACBiMae1qT9KBFZj
   29eVJQegshZAFRCKsvgyPXRubproNrsicCNbZ6twtSmnV9O1zPQgekFNX
   z9+FmSJVtS6VQbGFAF6FFBVa/e9cZS2g4wpBb75Y6gUCePdvN61q4Wgm1
   6uyR+Op4yMnNg/ac9Pa8dK1VKi3x9mL/J2YOusvH5XEgv8yXaIaHCvmLp
   i2tuHxi0k4bo4ZAtBhTAAGDT3llF7rLAbFiQWNAALNJec/qMbpBWggnRG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="392587907"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="392587907"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 07:55:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="667154564"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="667154564"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 28 Jun 2023 07:55:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qEWZP-000cyz-0d;
	Wed, 28 Jun 2023 17:54:59 +0300
Date: Wed, 28 Jun 2023 17:54:58 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [RFC PATCH 8/8] ASoC: SOF: Intel: Update PCI ID list
Message-ID: <ZJxJwliMOj/RYLsH@smile.fi.intel.com>
References: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
 <20230628205135.517241-9-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230628205135.517241-9-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: KIM7MULBYAU3TH7R2DPDQYBFV2E4DXXP
X-Message-ID-Hash: KIM7MULBYAU3TH7R2DPDQYBFV2E4DXXP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KIM7MULBYAU3TH7R2DPDQYBFV2E4DXXP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 28, 2023 at 10:51:35PM +0200, Amadeusz Sławiński wrote:
> Use PCI device IDs from pci_ids.h header and while at it change to using
> PCI_DEVICE_DATA macro, to simplify declarations.

PCI_DEVICE_DATA()

...

> +	{ PCI_DEVICE_DATA(INTEL, HDA_APL,	&bxt_desc) },

TAB(s) vs single space?

...

>  static const struct pci_device_id sof_pci_ids[] = {
> -	{ PCI_DEVICE(0x8086, 0x119a),
> -		.driver_data = (unsigned long)&tng_desc},
> +	{ PCI_DEVICE_DATA(INTEL, HDA_MRFLD,	&tng_desc) },

Is it HDA? IIRC it was called Intel SST or so.

>  	{ 0, }
>  };

Also with the file name, I think the ID itself should use TNG suffix.

-- 
With Best Regards,
Andy Shevchenko


