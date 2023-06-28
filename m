Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89094741407
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 16:46:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98ECE7F1;
	Wed, 28 Jun 2023 16:45:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98ECE7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687963579;
	bh=HSXxSC6s+LRdKk2lVMZTM3gnl3zRI7sk0WOuhp1qimg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fGf8k8CBwvLHTNjlt9rgSLRuPedg8JD/pvhsOTzkkVkKuIctCuGWgdhYp5vlxypch
	 5EvpjKbu0KmyJ2pJKGipaNnKmHqoqsDmvzDFyu5jdTF1QfIqGmgKl0bt4Kr2GoXGg8
	 awJ+oaSY1BKz/JU2mJa8gEyDBjJtd/OH27bCDFj0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2802AF80431; Wed, 28 Jun 2023 16:45:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52C31F80212;
	Wed, 28 Jun 2023 16:45:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D541DF80246; Wed, 28 Jun 2023 16:45:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E53E1F80124
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 16:44:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E53E1F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Zq48uGqB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687963496; x=1719499496;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=HSXxSC6s+LRdKk2lVMZTM3gnl3zRI7sk0WOuhp1qimg=;
  b=Zq48uGqBYTIj9WU9JA8LMAnDsSeDRydgpLHclflykIoaTqCC98weXs/P
   rkFLdVFGD38OSMNoHwiSzBgDdCorirrSW5oSFPMRwOk2ZlXHUmGeUZUe2
   IpnA8/V2pS2F3kwrD0CRDmnk6Kxw/fgq3h4hYnfVEJa0JWCuTZwqBaGjK
   k5m/E1ZrfYG5CypXtOJAzi5WNAC57CyGXTjOMJzzD6EicHA0T9uU9APKn
   BOXF+l76HaLbsUkEflODgdDbiSkCCTJBhyenckfq0URPVDFWkxTP9G5/9
   Jp9xbsw1kHbFGlEd/ntjbdxye0zTl0hJ/SFzs+jO9K9+7iu8mx/ZJSV1M
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="360717827"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="360717827"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 07:44:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="746674482"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="746674482"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 28 Jun 2023 07:44:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qEWPE-000cpY-32;
	Wed, 28 Jun 2023 17:44:28 +0300
Date: Wed, 28 Jun 2023 17:44:28 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [RFC PATCH 1/8] PCI: Add Intel Audio DSP devices to pci_ids.h
Message-ID: <ZJxHTHCq0T/y+dG0@smile.fi.intel.com>
References: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
 <20230628205135.517241-2-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230628205135.517241-2-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: CHN3TN543K6HYNENG7X3RN7MYYK6DHQH
X-Message-ID-Hash: CHN3TN543K6HYNENG7X3RN7MYYK6DHQH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CHN3TN543K6HYNENG7X3RN7MYYK6DHQH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 28, 2023 at 10:51:28PM +0200, Amadeusz Sławiński wrote:
> Those IDs are mostly sprinkled between HDA, Skylake, SOF and avs drivers.
> Almost every use contains additional comments to identify to which
> platform those IDs refer to. Add those IDs to pci_ids.h header, so that
> there is one place which defines those names.

...

>  #define PCI_DEVICE_ID_INTEL_5400_FBD0	0x4035
>  #define PCI_DEVICE_ID_INTEL_5400_FBD1	0x4036
> +#define PCI_DEVICE_ID_INTEL_HDA_JSL_N	0x4dc8
> +#define PCI_DEVICE_ID_INTEL_HDA_TGL_H	0x43c8
> +#define PCI_DEVICE_ID_INTEL_HDA_EHL_0	0x4b55
> +#define PCI_DEVICE_ID_INTEL_HDA_EHL_3	0x4b58

Can it be kept sorted by a value?

Didn't check the full list, though.

-- 
With Best Regards,
Andy Shevchenko


