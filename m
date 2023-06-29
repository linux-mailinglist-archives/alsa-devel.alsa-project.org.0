Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDA37421F5
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 10:20:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F5F683A;
	Thu, 29 Jun 2023 10:20:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F5F683A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688026853;
	bh=bwl4CrAT36OPSAV+5Pw0nBFpLFCNkMjbBXcbb8Asm+c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bR5Ep8kfbaO+0w8m03cDI4ZteJp7uEynNe/WFIiOELR3DNvxbhGDhBBI4xukc91Tq
	 uXOXNTzXQeXopUlMX8hRtAPh8lG3THd6Z1DQlndu9VFh4AubTkSVtidqcqv+R7nIIr
	 +kxISpRqA2vI0tihOdyzRlcaAN8N/+jZlDQhS7D0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 556E7F80549; Thu, 29 Jun 2023 10:19:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1E55F80549;
	Thu, 29 Jun 2023 10:19:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FE25F80169; Thu, 29 Jun 2023 10:19:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2EF3BF800E3
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 10:19:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EF3BF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KDR+Ol+A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688026745; x=1719562745;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bwl4CrAT36OPSAV+5Pw0nBFpLFCNkMjbBXcbb8Asm+c=;
  b=KDR+Ol+AGgWdLl+w0gehOfXPAq9M0OiebCuo8XmxPsc94aaNe2GcIGR1
   pi5Ymcz50Ryj/EfZjPHxpSnena/0eNUqrs666BZzpEFh5lmeIgP0Y2Q0v
   rY2JPjMgD6wtefsX7d04RaHL4Sb98KA6T2hjuFAdzqqo8zinQ0eGUJRpT
   1WRnMlAx8/YJMafkxqnjSOZXH14xdt3HaoDJqV0GYm8Z+mfw6VXjmiosR
   PfXQ4GsZssXxq6/pVSPk80Li0K8w6bYtnegEkacZx/S5eqJDfyqdxjqzX
   poFbbp61IXTaDmWG5SebakX55Q129pjUdp1DSGep7BqHFXW8JiPEM9V/V
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="351854314"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="351854314"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 01:19:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="891331233"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="891331233"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 01:18:59 -0700
Message-ID: <fce465f5-4d3d-aed1-e2f9-c7b31d72ce08@linux.intel.com>
Date: Thu, 29 Jun 2023 10:18:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH 3/8] ALSA: hda: Update PCI ID list
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
 <20230628205135.517241-4-amadeuszx.slawinski@linux.intel.com>
 <ZJxH7lcU4tSzCjb1@smile.fi.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <ZJxH7lcU4tSzCjb1@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JCISY7VHZJHK35TNFGZ5PONHGC2JU2KJ
X-Message-ID-Hash: JCISY7VHZJHK35TNFGZ5PONHGC2JU2KJ
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JCISY7VHZJHK35TNFGZ5PONHGC2JU2KJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 6/28/2023 4:47 PM, Andy Shevchenko wrote:
> On Wed, Jun 28, 2023 at 10:51:30PM +0200, Amadeusz Sławiński wrote:
>> Use PCI device IDs from pci_ids.h header and while at it change to using
>> PCI_VDEVICE macro, to simplify declarations. This allows to change magic
>> number PCI vendor IDs to macro ones for all vendors. For Intel devices
>> use device IDs macros where defined.
> 
> ...
> 
>>   					((pci)->device == 0x490d) || \
>>   					((pci)->device == 0x4f90) || \
>>   					((pci)->device == 0x4f91) || \
>>   					((pci)->device == 0x4f92)))
> 
> Why are not these be added in the header as well for the sake of consistency?

Will do.

> 
> ...
> 
>>   	/* CPT */
>> -	{ PCI_DEVICE(0x8086, 0x1c20),
>> +	{ PCI_VDEVICE(INTEL, 0x1c20),
>>   	  .driver_data = AZX_DRIVER_PCH | AZX_DCAPS_INTEL_PCH_NOPM },
> 
> With the first patch seems all of these (x86) can be converted
> to use PCI_DEVICE_DATA().
> 

Main reason is that some of device ids are missing and PCI_DEVICE_DATA() 
requires them to be defined. I didn't want to mix both PCI_VDEVICE() and 
PCI_DEVICE_DATA().
