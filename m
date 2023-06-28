Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11327741610
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 18:09:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB2DE7F1;
	Wed, 28 Jun 2023 18:08:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB2DE7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687968556;
	bh=5vCRBYpY7jo1Ni88rEwRhjkpOvVkhHCe9+LLsHYVXK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lk3hzpX3Jz6u0eUsSXRBrcIaXQBLwu7w1LjazzU6uEdU3KD0ZiOfgK5LVpN9nmI7/
	 VMKyB1fjCUrMusKCacaV4PYNvUKbaIeehWzR9nytO3hN/7ccNcZ24Cps9ZEzpkodBy
	 cRuiPq/lxRJtGVHCJQ0g5i0dN8yghaW+UNfQGaAM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADE6EF80246; Wed, 28 Jun 2023 18:08:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30F21F80246;
	Wed, 28 Jun 2023 18:08:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D61BF80246; Wed, 28 Jun 2023 18:08:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BBDB2F80124
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 18:08:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBDB2F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kKYAs2Hw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687968498; x=1719504498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=5vCRBYpY7jo1Ni88rEwRhjkpOvVkhHCe9+LLsHYVXK4=;
  b=kKYAs2HwXZQtZKQ2bv3+oFrvUPZH49sh7skwNu3Ogaaxo8W5vgqWNqJc
   s5tzqw4uOurJP7LmyZW0j3G5jC9pkvmOxVuOoY0HUP6do5/6WBoxevT3j
   JNlOfkcRz3rwBOP3abEyWcBp/NkwMSjL/dERjg//m7xsu70NTQYBcfmrz
   94JBlv6ctwllpFggg+rdWTWOwy5D6VsvnIUjhRZVsqXaAluR11Q0mWtlz
   xptt9enQloGFXM4OlULyuiQvRG3CiD2eBSzwZjLPg+BdMX/5/As19v03Q
   MeB5a3uxGe9UnnVCR9W49TXQehmgg7omFVDi45WQA+yllogC0yUEKyhxm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="351651671"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="351651671"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 07:45:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="752276046"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="752276046"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 28 Jun 2023 07:45:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qEWPj-000cqM-2r;
	Wed, 28 Jun 2023 17:44:59 +0300
Date: Wed, 28 Jun 2023 17:44:59 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [RFC PATCH 4/8] ALSA: hda/i915: Update PCI IDs
Message-ID: <ZJxHa36/xN3kClw0@smile.fi.intel.com>
References: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
 <20230628205135.517241-5-amadeuszx.slawinski@linux.intel.com>
 <ZJxG7YRroqi6kiyz@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZJxG7YRroqi6kiyz@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: V5ZKT4TJOYQFCVOXLSQL6NSHYU675322
X-Message-ID-Hash: V5ZKT4TJOYQFCVOXLSQL6NSHYU675322
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V5ZKT4TJOYQFCVOXLSQL6NSHYU675322/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 28, 2023 at 05:42:54PM +0300, Andy Shevchenko wrote:
> On Wed, Jun 28, 2023 at 10:51:31PM +0200, Amadeusz Sławiński wrote:

...

> > -#define IS_HSW_CONTROLLER(pci) (((pci)->device == 0x0a0c) || \
> > -				((pci)->device == 0x0c0c) || \
> > -				((pci)->device == 0x0d0c) || \
> > -				((pci)->device == 0x160c))
> > +#define IS_HSW_CONTROLLER(pci) (((pci)->device == PCI_DEVICE_ID_INTEL_HDA_HSW_0) || \
> > +				((pci)->device == PCI_DEVICE_ID_INTEL_HDA_HSW_2) || \
> > +				((pci)->device == PCI_DEVICE_ID_INTEL_HDA_HSW_3) || \
> > +				((pci)->device == PCI_DEVICE_ID_INTEL_HDA_BDW))
> 
> The very same macro under different name appeared in the previous patch.
> Am I correct? Perhaps go further and first move it somewhere to be available
> for both?

Ah, this one is a subset of that one, nevertheless the proposal stays.

-- 
With Best Regards,
Andy Shevchenko


