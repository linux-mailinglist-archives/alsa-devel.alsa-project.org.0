Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A38D753B4A
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 14:47:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28C2ADE5;
	Fri, 14 Jul 2023 14:46:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28C2ADE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689338868;
	bh=Wgu458RtWJFWnO7skXaA0azj0Qi3toRihxTlRUl23kM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SohqmJ6rehxLMRezAwhp82n5PcagTdT8d8owV8x+o4psjd4/qTYrUjqcGFbLHRfC2
	 g3cUrCx6i6+bFLSjmHqqZ14KdoynZn4NEy/f2NfwATZn7ks6J2IfqRllNYUI9J/13p
	 HkEpMrukCgqpWekvArjP4TMjQYRzHvSkP+Qzc8EM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6840BF8047D; Fri, 14 Jul 2023 14:46:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9AADF80153;
	Fri, 14 Jul 2023 14:46:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B984F80236; Fri, 14 Jul 2023 14:46:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 914EEF800D2
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 14:46:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 914EEF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mjI6ZpzS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689338808; x=1720874808;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Wgu458RtWJFWnO7skXaA0azj0Qi3toRihxTlRUl23kM=;
  b=mjI6ZpzSKvffVfZ2VTkc+9qijNSoBlE2gFGsIePfgbfw2AEYZR3uHhTN
   iC3EiQGW8qIKN51o6LHZ2wnjcR8Ail9Vlo1AIF0PfTp45hNoC5M4kNUyN
   iRgEQoJOLh90wF/DmDwegxitnHTdRWP2AkCRCPGI8zFlAUABgzL7aETWN
   +RUXoYOrKPiqqhqsp5gUDgWgDAge+s+1iUUC6Mlu8u32N3hFZoEaBkRZk
   +G11ISmuvZuT1d0Dln3xPYbLu/rYueS8v40ydVbz+5+h9m+T8A/l7557/
   9th7Hdyq85gKjcjKMk+KEC2PDHmo7f+4rHNUkPDVnLQuag4M5/hSIKLie
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="431638401"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="431638401"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 05:46:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="716326313"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="716326313"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 14 Jul 2023 05:46:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qKIBo-002f6O-2G;
	Fri, 14 Jul 2023 15:46:28 +0300
Date: Fri, 14 Jul 2023 15:46:28 +0300
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
Subject: Re: [PATCH v3 03/15] ASoC: SOF: Remove unused Broxton PCI ID
Message-ID: <ZLFDpIfWG5YiWZvO@smile.fi.intel.com>
References: <20230714202457.423866-1-amadeuszx.slawinski@linux.intel.com>
 <20230714202457.423866-4-amadeuszx.slawinski@linux.intel.com>
 <ZLFBBzmJXgXeWZ0y@smile.fi.intel.com>
 <a23f2c59-34a7-f5d0-f2a2-44364fc1e37c@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a23f2c59-34a7-f5d0-f2a2-44364fc1e37c@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: JS2VOUVODFHL6Z2MEL3FQWDV36XMRISL
X-Message-ID-Hash: JS2VOUVODFHL6Z2MEL3FQWDV36XMRISL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JS2VOUVODFHL6Z2MEL3FQWDV36XMRISL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jul 14, 2023 at 02:44:06PM +0200, Amadeusz Sławiński wrote:
> On 7/14/2023 2:35 PM, Andy Shevchenko wrote:
> > On Fri, Jul 14, 2023 at 10:24:45PM +0200, Amadeusz Sławiński wrote:

...

> > >   sound/hda/intel-dsp-config.c  | 7 -------
> > >   sound/soc/sof/intel/pci-apl.c | 2 --
> > 
> > I dunno how SOF and HDA are related to each other, but in the next patch you
> > also do something about HDA, either group all of them, or split HDA, or split
> > on per file basis. I'm not familiar with the relationship between them up to
> > you which way you choose.
> > 
> 
> Well SOF is a DSP driver, so that's why I split it from HDA -
> intel-dsp-config.c file is used to perform checks to know if it should load
> DSP driver (and which one), hence the "weird" split.

Ah, okay that explains!

-- 
With Best Regards,
Andy Shevchenko


