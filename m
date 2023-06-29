Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A75C7421EF
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 10:20:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05A2C11C;
	Thu, 29 Jun 2023 10:19:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05A2C11C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688026803;
	bh=nZeawW1oMN2HuGCf+TgAnAiNf1H7F95ZCg0NNjoviRI=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qoAkMdZmfFe1+FAKjwAkZ9bvZUFsfFT/b5Xk4Inu4sQPkXcS3K4fTJkn/3dgUN5L3
	 TriDT9VOpp6FDsBvlBIzPMfPXNCWFqoxfp443poYF0802tkht/0x4QCkUubgFz89Gy
	 rJq1w8oab9eLfTqixYMFFZaxANNTxXgCSwVV3EHA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4D16F8027B; Thu, 29 Jun 2023 10:19:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12F7DF80169;
	Thu, 29 Jun 2023 10:19:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BFD3F80246; Thu, 29 Jun 2023 10:19:07 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 37191F80093
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 10:19:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37191F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ONDmelxV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688026743; x=1719562743;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=nZeawW1oMN2HuGCf+TgAnAiNf1H7F95ZCg0NNjoviRI=;
  b=ONDmelxVzvTjwK5lsJCoxwRmZyfbix2UtMXvaebEsHdjj662sWkC8y/9
   04trU9vkj/+4eEcix6rTYsxS6Af13muZXkVCkzP5tgXxk/jrDt1hxsyyp
   xuZ7jJPwayfduSwq1zYrksZ/CqfFMnigwS39TaSxlUecRughXnZq91ig7
   5tl8HAReL8zwcg7PyIkqnCeP9z7H1x3Gv0Cjj0KWHPuNvkiFfERviEUmN
   3lISy1f5rn437yolSR2Kk1QxFFIzSIbISB9OAqtSmO+1P6T5iGI5U20HU
   jz1iTCbqq7QGT0QWGH/Au7hncso8i2KutSMx56UxvdQnH4BizAQQDIlLh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="351854302"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="351854302"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 01:18:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="891331178"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="891331178"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 01:18:53 -0700
Message-ID: <a7bf3aaa-581d-0625-5f18-6b9b062ea48d@linux.intel.com>
Date: Thu, 29 Jun 2023 10:18:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [RFC PATCH 1/8] PCI: Add Intel Audio DSP devices to pci_ids.h
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20230628205135.517241-1-amadeuszx.slawinski@linux.intel.com>
 <20230628205135.517241-2-amadeuszx.slawinski@linux.intel.com>
 <ZJxHTHCq0T/y+dG0@smile.fi.intel.com>
Content-Language: en-US
In-Reply-To: <ZJxHTHCq0T/y+dG0@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B36JYHYSX6RAD4B5MGEDXQZ5HCTJYDIR
X-Message-ID-Hash: B36JYHYSX6RAD4B5MGEDXQZ5HCTJYDIR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B36JYHYSX6RAD4B5MGEDXQZ5HCTJYDIR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 6/28/2023 4:44 PM, Andy Shevchenko wrote:
> On Wed, Jun 28, 2023 at 10:51:28PM +0200, Amadeusz Sławiński wrote:
>> Those IDs are mostly sprinkled between HDA, Skylake, SOF and avs drivers.
>> Almost every use contains additional comments to identify to which
>> platform those IDs refer to. Add those IDs to pci_ids.h header, so that
>> there is one place which defines those names.
> 
> ...
> 
>>   #define PCI_DEVICE_ID_INTEL_5400_FBD0	0x4035
>>   #define PCI_DEVICE_ID_INTEL_5400_FBD1	0x4036
>> +#define PCI_DEVICE_ID_INTEL_HDA_JSL_N	0x4dc8
>> +#define PCI_DEVICE_ID_INTEL_HDA_TGL_H	0x43c8
>> +#define PCI_DEVICE_ID_INTEL_HDA_EHL_0	0x4b55
>> +#define PCI_DEVICE_ID_INTEL_HDA_EHL_3	0x4b58
> 
> Can it be kept sorted by a value?
> 
> Didn't check the full list, though.
> 

My mistake, I've tried to add them in order, but must have missed this 
one, will review whole list again.
