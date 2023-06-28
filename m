Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBE074143E
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 16:51:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A513843;
	Wed, 28 Jun 2023 16:50:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A513843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687963884;
	bh=bFRkg/A1N0s6zxPjY9fVqj3qwmWFac2EO4cGoT+BOGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mgRNLt54YaSXtWEBKGu7/2VMjDOra533vxTLN0Wz+ikejh2wtF/VyYUH9zVohEaul
	 mM+NXkclla927udF5oeStLUttiHEcUgOlSwysmyHQxOnNmiMFAmM8lUnloJ8ZjcP6Q
	 g8xK1LiPr1pLBx0kx/ybhe6fXh4GbhDFWhVhmCRM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7827EF80548; Wed, 28 Jun 2023 16:49:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25F04F80548;
	Wed, 28 Jun 2023 16:49:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AB86F80549; Wed, 28 Jun 2023 16:49:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE897F80544
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 16:49:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE897F80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cwe89Mko
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687963787; x=1719499787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bFRkg/A1N0s6zxPjY9fVqj3qwmWFac2EO4cGoT+BOGg=;
  b=cwe89MkoQHP+0a03wf7ddDH283oas896Q6Mp9bWQ+eeTa0YUdLEDe6vq
   kpizUWygb+j9R5AUqqUmTkfWdxj30JOT3OKhNSY31sY0xSbMpXIoHM025
   ef1SAqOsGecxGb/76WRqJP2HeqJ+3cwnLHHwTxvVoRhic2OfKkDEwuCyI
   rLgw5u3fF9CfBduMZHVlKl6JZifRZUxTIBoxgMkGJoSUm/77xKmICHncL
   iRUcIyx2txgL+WSS5h91LMNHi+WL3wVqCa1WVvQre3UOR+8++mp9skzJo
   b/jNvOo+WqBZ1EJkzZuGV8WEmYHsqwYdmw1reVRDXTpb3ujFSjXq2pU4j
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="365326305"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="365326305"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 07:49:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="711064282"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200";
   d="scan'208";a="711064282"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 28 Jun 2023 07:49:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qEWTk-000ctw-1s;
	Wed, 28 Jun 2023 17:49:08 +0300
Date: Wed, 28 Jun 2023 17:49:08 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [RFC PATCH 0/8] PCI: Define Intel PCI IDs and use them in drivers
Message-ID: <ZJxIZGV4+5Al0CpW@smile.fi.intel.com>
References: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 2IJRNTOSNWUFJRJULZCPNUM7PH5X45DN
X-Message-ID-Hash: 2IJRNTOSNWUFJRJULZCPNUM7PH5X45DN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2IJRNTOSNWUFJRJULZCPNUM7PH5X45DN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jun 28, 2023 at 10:51:27PM +0200, Amadeusz Sławiński wrote:
> PCI IDs for Intel HDA are duplicated across quite a few drivers, due to
> various configurations and historical reasons. Currently almost all uses
> of HDA PCI IDs have corresponding comment telling which platform it is.
> Additionally there are some inconsistencies between drivers about which
> ID corresponds to which device.
> 
> Simplify things, by adding PCI IDs to global header and make use of them
> in drivers. This allows for removal of comments by having IDs themselves
> being self explanatory. Additionally it allows for removal of existing
> inconsistencies by having one source of truth.

I'm in favour of this series. It allows to use PCI_DEVICE_DATA() in many places.
With that said, I think you can also add some more definitions to PCI IDs header
for the sake of being able to use that macro.

-- 
With Best Regards,
Andy Shevchenko


