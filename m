Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A65675398A
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 13:34:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87945A4C;
	Fri, 14 Jul 2023 13:33:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87945A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689334441;
	bh=vMiLtLLmLYbROtrWsVDVcXNKwbyBp9NtziuSigdu7S4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lfw8f6KsXfEBSBBcKz6onusHkS4GJnL7bDhwQevWLEbXSjne3DgVOQ21iPQfIw/Vv
	 5GHaEUaUSVHrPsM3/tcapu9hS0HwJKrXmJuL+G0fybcLtFRtb+NzX0P3YwGhYqiHh8
	 1OSXblBf+z/e2r3ToyT1824uiNcB1QNp8uL2RQiU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD2BBF800D2; Fri, 14 Jul 2023 13:32:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F736F80153;
	Fri, 14 Jul 2023 13:32:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86E0CF80236; Fri, 14 Jul 2023 13:32:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B851F800D2
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 13:32:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B851F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EBPnEQqA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689334363; x=1720870363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=vMiLtLLmLYbROtrWsVDVcXNKwbyBp9NtziuSigdu7S4=;
  b=EBPnEQqAWbAASAjiyHdieXHDTQlmtaS7WN4kJsA+dvrePrtdR1EfEDWX
   QmVT3n1J7sAWIaiuu4P+m4MBMERbRETUnwdNADIkd9dvVcg9zFuDAFrBP
   ZJwpTDU5aE9/Qqex2tu2UgHubRp0MTS6UwKDog0nZq3hwrOohsgUltp0k
   PL0CTF9y/5dutbO7NKc18lwm8Ctp0Qvt2OHAk7kDhG6N0Wf6Le8czI9pu
   By84AdiIk6Dcy5ceFOeLXrVsJ3oubtEYBW6xD2yeJUCcj+0r7C5MDZWJ4
   6WciKPTzhUORSCd9MRIR3bHPTulRe0b2wDLedPaVG5/wKuryf4BY4IkxN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="362920113"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="362920113"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 04:32:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="722372918"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="722372918"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 14 Jul 2023 04:32:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qKH2B-002e87-1W;
	Fri, 14 Jul 2023 14:32:27 +0300
Date: Fri, 14 Jul 2023 14:32:27 +0300
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
Message-ID: <ZLEyS7gZqbuXmkUL@smile.fi.intel.com>
References: <20230714185615.370597-1-amadeuszx.slawinski@linux.intel.com>
 <20230714185615.370597-16-amadeuszx.slawinski@linux.intel.com>
 <ZLEw9S8hmkcdk7K2@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZLEw9S8hmkcdk7K2@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: SA2NKL3KDNLGWSCM2OGVIAEIJVZUKOR3
X-Message-ID-Hash: SA2NKL3KDNLGWSCM2OGVIAEIJVZUKOR3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SA2NKL3KDNLGWSCM2OGVIAEIJVZUKOR3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jul 14, 2023 at 02:26:45PM +0300, Andy Shevchenko wrote:
> On Fri, Jul 14, 2023 at 08:56:15PM +0200, Amadeusz Sławiński wrote:
> > Use PCI device IDs from pci_ids.h header.
> 
> Perhaps one more sentence to explain why this is okay change, like:
> "The ACPI IDs are used only internally and lower 16 bits uniquely define
>  the device as vendor ID for Intel is 8086 for all of them."
> 
> Suggested-by: ?
> 
> ...
> 
> > -	{ PCI_VDEVICE(INTEL, SST_MRFLD_PCI_ID), 0},
> > +	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_SST_TNG), 0},
> 
> That 0 is not needed, OTOH you may use PCI_DEVICE_DATA(..., 0).

And you missed the patch I sent to you, i.e. replacing field and function
parameter type to be insigned short. Otherwise it won't work with ACPI.

-- 
With Best Regards,
Andy Shevchenko


