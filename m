Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5885E74F16A
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 16:14:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FA3284B;
	Tue, 11 Jul 2023 16:13:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FA3284B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689084874;
	bh=s9hiWJGhbB7fHM+elndbClDFNGnHDKG9q2O/XYVM/wE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FM32iQw7l5A7Ouq8trkTLh76lgWYHP76DBs8SuBBiFSENXQLoOOsSJtPvou632WeA
	 4DhOWtGOjsURq1vdZhrIy6lQ40AHJVNBmMJ1By9MSd5GoxIR3OTBRCSvXNAxElVqeP
	 JJFv7RI5/7VPzaLqZ5B4E60E2+RvDqOAMu5amPrs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D3C6F80535; Tue, 11 Jul 2023 16:13:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FA04F80236;
	Tue, 11 Jul 2023 16:13:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D51AF80249; Tue, 11 Jul 2023 16:13:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 123EFF80093
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 16:13:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 123EFF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lRObfeju
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689084799; x=1720620799;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=s9hiWJGhbB7fHM+elndbClDFNGnHDKG9q2O/XYVM/wE=;
  b=lRObfejuKqp2c60wZjoJMNofmoMY5EnKoLF22MMvPLQ4OU4ibE54ChlR
   EmXtdk7TSCadwFiqzr7WWf1hYZQ6oCrkX+MrIohY30DVRh8nxEP3zw6nX
   Jqf3+Ke4KjqjXaG8/PtDY+Qa/MGhmpevJHzn6lXSwFZf/8L+2qsiGNQa/
   3Q3db4X+sGn9qDZn4znhunqPSxJM6t+b1j/s/bQ1xZUItqZLIS+jxuSYq
   3ulB95bCFJ7hiGOPCQcSaLPPxYFYuJxUGzUPGRyyN2EcfJGEG7KySu4Oc
   6A6HIh9B5FJLLKAJWYOhhUARb9HXdpPdW6ZCa9+J9DuPq18traYryW97V
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="344225913"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="344225913"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 07:12:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="1051800428"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="1051800428"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 11 Jul 2023 07:12:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJE6j-001s0S-37;
	Tue, 11 Jul 2023 17:12:49 +0300
Date: Tue, 11 Jul 2023 17:12:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 07/13] ALSA: intel-dsp-config: Convert to PCI device IDs
 defines
Message-ID: <ZK1jYdMxO4vUFmhw@smile.fi.intel.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
 <20230711125726.3509391-8-amadeuszx.slawinski@linux.intel.com>
 <ZK1gaER7n4JUjIeW@smile.fi.intel.com>
 <86dbdeeb-cc2b-59f7-eabb-6282799a3d32@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86dbdeeb-cc2b-59f7-eabb-6282799a3d32@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: E2WJCLNKS2WVVKX3PDOFEAYFOBE637ZQ
X-Message-ID-Hash: E2WJCLNKS2WVVKX3PDOFEAYFOBE637ZQ
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E2WJCLNKS2WVVKX3PDOFEAYFOBE637ZQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 11, 2023 at 04:09:42PM +0200, Amadeusz Sławiński wrote:
> On 7/11/2023 4:00 PM, Andy Shevchenko wrote:
> > On Tue, Jul 11, 2023 at 02:57:20PM +0200, Amadeusz Sławiński wrote:

...

> > > -		.device = 0x119a,
> > > +		.device = PCI_DEVICE_ID_INTEL_ADSP_TNG,
> > 
> > Yeah, somebody familiar with Intel history of SST/HDA/wtf should really
> > tell why HDA code is using this ID. Does it mean that SST implies HDA
> > always? Only for this (or this family of) platform?
> > 
> > It might affect the ID naming, but otherwise it's orthogonal to the series.
> > 
> 
> There were few early devices where DSP was separate unit:
> Haswell, Broadwell - where we use ACPI to load (SND_SOC_INTEL_CATPT) audio
> driver, Tangier/Merrifield - where ACPI or PCI is used to load
> (SND_SST_ATOM_HIFI2_PLATFORM_PCI) audio driver.
> All further generations are HDA devices with integrated DSP. This causes all
> the weirdness ;)

Maybe we should stick with SST in the name? At least that's how Tangier TRM
titles it.

-- 
With Best Regards,
Andy Shevchenko


