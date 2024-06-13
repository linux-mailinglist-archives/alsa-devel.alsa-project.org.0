Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F27590633C
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 07:03:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBCB0E65;
	Thu, 13 Jun 2024 07:02:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBCB0E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718254980;
	bh=V8dLypkcp5xQxsStqf+DKspRtOxwD1f4T+BQAhzBgr8=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SOMjhVaXksIXvdTy8iqtPgNnI1HjQ9dcT6X4EG/qAduvkdVS7zVq24qTi1V6IECP+
	 tOVWTd+8BZA0vXHe0rjdYPOx3iZuvAdQd21GITRK/zagz3aB5l/Yd3TVeNalG7Hv75
	 fd/9mz9gxB0iBfGb6bkk41Ojz3oWJXUwKMFonoK8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86BBCF805B5; Thu, 13 Jun 2024 07:02:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A342F805B2;
	Thu, 13 Jun 2024 07:02:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D6EBF8057A; Thu, 13 Jun 2024 07:00:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54819F800D0
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 06:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54819F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XPRii03P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718254795; x=1749790795;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=V8dLypkcp5xQxsStqf+DKspRtOxwD1f4T+BQAhzBgr8=;
  b=XPRii03PH/x3eBWgJDUDQvzyec5nIzEwtCNa86zHbE5X09F3vWeixyrr
   yo0IPrWyIacjM2ZMRvkXL6SXY2LpN3sy+6tVRJrpfF637Fukl3zQ+Mr+8
   EncMUvp7Yz1tTRkC9b4ScesPH/saGiqHfeDub1vSu/mBEJpL3IBp6rH3a
   1vAOHzwmj0VVjog+g9t3jLGPf9LE6BPk5QEV795kQdVUhSdd9ogLEQTDJ
   nnH+WiX9qqDQiEHXNy9QEmbBhjNpCCKyrt/YrDsciW52nUMT+toCUpc4E
   uzzDYUB/2YehugApvwpEPfkr0QVwFqb3eTE0TyF4m8DbzQNsm1IRuBe8Y
   A==;
X-CSE-ConnectionGUID: 6bKFeEm9QBy6jOkvrWgZcg==
X-CSE-MsgGUID: 9EEqqwyWTH6V+7vIQXphkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="12047619"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000";
   d="scan'208";a="12047619"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:59:49 -0700
X-CSE-ConnectionGUID: OlBiDGCZRui7Jm1Ng2skjw==
X-CSE-MsgGUID: M4o1H2zJQVGnLeBJCEcdmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000";
   d="scan'208";a="63191562"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.108])
 ([10.245.246.108])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 21:59:47 -0700
Message-ID: <d1baeec6-87f5-4784-8cbf-b26a9de441e9@linux.intel.com>
Date: Thu, 13 Jun 2024 06:59:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] ASoC: SOF: Intel: add initial support for PTL
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20240612065858.53041-1-pierre-louis.bossart@linux.intel.com>
 <20240612065858.53041-3-pierre-louis.bossart@linux.intel.com>
 <ZmnGWdZ0GrE9lnk2@finisterre.sirena.org.uk>
 <c835bf25-39b8-4f7a-9c77-33367085670e@linux.intel.com>
Content-Language: en-US
In-Reply-To: <c835bf25-39b8-4f7a-9c77-33367085670e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WP4ABOKQ5D4CXXGESAYQ4IKTCWRDIDW7
X-Message-ID-Hash: WP4ABOKQ5D4CXXGESAYQ4IKTCWRDIDW7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WP4ABOKQ5D4CXXGESAYQ4IKTCWRDIDW7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/12/24 18:08, Pierre-Louis Bossart wrote:
> 
> 
> On 6/12/24 18:01, Mark Brown wrote:
>> On Wed, Jun 12, 2024 at 08:58:55AM +0200, Pierre-Louis Bossart wrote:
>>> Clone LNL for now.
>>
>> There's a dependency somewhere I think:
>>
>> In file included from /build/stage/linux/sound/soc/sof/intel/pci-ptl.c:10:
>> /build/stage/linux/include/linux/pci.h:1063:51: error: ‘PCI_DEVICE_ID_INTEL_HDA_
>> PTL’ undeclared here (not in a function); did you mean ‘PCI_DEVICE_ID_INTEL_HDA_
>> MTL’?
>>  1063 |         .vendor = PCI_VENDOR_ID_##vend, .device = PCI_DEVICE_ID_##vend##
>> _##dev, \
>>       |                                                   ^~~~~~~~~~~~~~
>> /build/stage/linux/sound/soc/sof/intel/pci-ptl.c:52:11: note: in expansion of ma
>> cro ‘PCI_DEVICE_DATA’
>>    52 |         { PCI_DEVICE_DATA(INTEL, HDA_PTL, &ptl_desc) }, /* PTL */>       |           ^~~~~~~~~~~~~~~
> 
> Yes indeed there is a dependency, I mentioned it in the cover letter
> 
> 
> "
> This patchset depends on the first patch of "[PATCH 0/3] ALSA/PCI: add
> PantherLake audio support"
> "
> 
> We don't add PCI IDs every week but when we do we'll need an update of
> pci_ids.h prior to ALSA- and ASoC-specific patches.

There's another problem reported by the Intel build bot

https://lore.kernel.org/oe-kbuild-all/202406131144.L6gW0I47-lkp@intel.com/

When I modified the order of patches I broke the intermediate
compilation. The ACPI machine definition needs to come first.
I'll send a v2, sorry about that.
