Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4843F905830
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:09:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD6F5A4D;
	Wed, 12 Jun 2024 18:09:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD6F5A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718208565;
	bh=a0+JRhui/mzRBvsXaE6goUUceXxYT5/pPcxYVCj0tFM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h4rcEF7DklZyx8b7w3HfAUmlV+K7RG9gogdtxJ15JR2gaKQgm7i340PXNNflG0Sx0
	 U0LbYDRb+DcvLDNP4xaJQEs02sSYLfU41NYTJN3R0FjT5rW1OLrV3VGKTxwhC2bq/0
	 F5dFW8AEOLgv7zOsoPzxdVag9uEfRtjWqaq12muc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68FE5F805B1; Wed, 12 Jun 2024 18:08:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A762AF805B3;
	Wed, 12 Jun 2024 18:08:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C54EF8057A; Wed, 12 Jun 2024 18:08:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DEF8F80578
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:08:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DEF8F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fduz68V9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718208528; x=1749744528;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=a0+JRhui/mzRBvsXaE6goUUceXxYT5/pPcxYVCj0tFM=;
  b=fduz68V9BDt57ynPSES4xXp04NuTnYoOXfLxEXB1swRpedLd1NMIpwcZ
   dkyxyRb570uebyb5QIbHa9PbJk3mMHylNg9F7cyEytJptLI6OEhbB8TVv
   pZp2R/VquOyNDnqTYUV4GcNcqoIifwLTH/YsPdkJbc2kgCPdBFTSi6t/W
   EZHz1RjBY7JedRQ71R4W2n2Rir5qhJKT1ahwNYinu33weu2uqaL9PKHQX
   CeO0Zm6qakrIpFHV/ISgtnaagfrMmOwMFfsm0aGVz+cLp1hG4U/zVXFB1
   ss0yRXcy5lobN0kHqpzo+RNmnyyOzEFFc/GmghWO1oTP6lm9FI8/usK2D
   w==;
X-CSE-ConnectionGUID: Lfv1DfevSUOo1YZz+C5D/g==
X-CSE-MsgGUID: Dr4Ho6Q2S+KcHyPlySr6Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="32468043"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000";
   d="scan'208";a="32468043"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 09:08:40 -0700
X-CSE-ConnectionGUID: 1kIeo6NkSp6h2KVIDqBwxA==
X-CSE-MsgGUID: ffJj8BVXTMOhmswojMoMNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000";
   d="scan'208";a="44745063"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.94])
 ([10.245.246.94])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 09:08:37 -0700
Message-ID: <c835bf25-39b8-4f7a-9c77-33367085670e@linux.intel.com>
Date: Wed, 12 Jun 2024 18:08:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] ASoC: SOF: Intel: add initial support for PTL
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20240612065858.53041-1-pierre-louis.bossart@linux.intel.com>
 <20240612065858.53041-3-pierre-louis.bossart@linux.intel.com>
 <ZmnGWdZ0GrE9lnk2@finisterre.sirena.org.uk>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ZmnGWdZ0GrE9lnk2@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZUU4GEQNJMXAGCIPGPFX2LBEUN25K5GO
X-Message-ID-Hash: ZUU4GEQNJMXAGCIPGPFX2LBEUN25K5GO
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZUU4GEQNJMXAGCIPGPFX2LBEUN25K5GO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/12/24 18:01, Mark Brown wrote:
> On Wed, Jun 12, 2024 at 08:58:55AM +0200, Pierre-Louis Bossart wrote:
>> Clone LNL for now.
> 
> There's a dependency somewhere I think:
> 
> In file included from /build/stage/linux/sound/soc/sof/intel/pci-ptl.c:10:
> /build/stage/linux/include/linux/pci.h:1063:51: error: ‘PCI_DEVICE_ID_INTEL_HDA_
> PTL’ undeclared here (not in a function); did you mean ‘PCI_DEVICE_ID_INTEL_HDA_
> MTL’?
>  1063 |         .vendor = PCI_VENDOR_ID_##vend, .device = PCI_DEVICE_ID_##vend##
> _##dev, \
>       |                                                   ^~~~~~~~~~~~~~
> /build/stage/linux/sound/soc/sof/intel/pci-ptl.c:52:11: note: in expansion of ma
> cro ‘PCI_DEVICE_DATA’
>    52 |         { PCI_DEVICE_DATA(INTEL, HDA_PTL, &ptl_desc) }, /* PTL */>       |           ^~~~~~~~~~~~~~~

Yes indeed there is a dependency, I mentioned it in the cover letter


"
This patchset depends on the first patch of "[PATCH 0/3] ALSA/PCI: add
PantherLake audio support"
"

We don't add PCI IDs every week but when we do we'll need an update of
pci_ids.h prior to ALSA- and ASoC-specific patches.
