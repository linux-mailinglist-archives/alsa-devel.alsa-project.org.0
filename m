Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF21753976
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 13:24:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEB91A4D;
	Fri, 14 Jul 2023 13:23:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEB91A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689333851;
	bh=R+OgewhlbgSo5E0OBrtwt2RMUqV7BjX8qJS7OtNH8Nc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vtFjSpOd5SQsMaiLk/iyCo5ua9ZhkTXF08nhuqJU/bgOzh1IhI61N23azVjBp2cjd
	 uuBKvoSUuMPmtz73WgGXlSynGldxf41KR8tk+IG0OryJ8km+IM7kGG8YdaGU7pLHU3
	 4YgJX/ydHpbO2mRlHJZ5QNYD124vqoOdimbZ+jS8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1658F80236; Fri, 14 Jul 2023 13:23:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A65DF80236;
	Fri, 14 Jul 2023 13:23:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0086F80249; Fri, 14 Jul 2023 13:23:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C0CAF800E4
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 13:23:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C0CAF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Jq3eL0GD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689333794; x=1720869794;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=R+OgewhlbgSo5E0OBrtwt2RMUqV7BjX8qJS7OtNH8Nc=;
  b=Jq3eL0GD9vVjtggEh18T5a2SIp+eHmBL0UOd1WhNUyO/S70xZjEMB6Zv
   K2ZHnDZaD+1IqHhHYlhvqvjSuPB5dWRgLjPWu02DRDlonVogkop4Dqu6g
   ZfTcyVkUHaRgcY98Gb+dhf6u0XwWKIrYyAokSEdVVY2AzOjZiLNgoXxZN
   o0BakM5bMRHCRo17hn46Zo5+09RRrCVHRYPq28BnAndvzsobraiSpm88D
   9gLyoIP9nNEO1wvRguUB6MsbXzQ0KhY7P1jf2qpVPlO2Rs3OSBlmCbUXk
   JF2921kUychKFee8P/kJC9mLFf8Kl+tIauZr9GtPhJNly37hlrgInQEc5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="355386524"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="355386524"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 04:23:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="752011334"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="752011334"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 04:23:07 -0700
Message-ID: <71f8c48d-8e28-9292-ae31-a1a11498ec1b@linux.intel.com>
Date: Fri, 14 Jul 2023 13:23:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 07/15] ALSA: hda/i915: Use global PCI match macro
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
References: <20230714185615.370597-1-amadeuszx.slawinski@linux.intel.com>
 <20230714185615.370597-8-amadeuszx.slawinski@linux.intel.com>
 <ZLEvZ3Ss05A+x1ty@smile.fi.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <ZLEvZ3Ss05A+x1ty@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OGFWHG2D4WUNL3VFASHP6SFIXFCJAE4Y
X-Message-ID-Hash: OGFWHG2D4WUNL3VFASHP6SFIXFCJAE4Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OGFWHG2D4WUNL3VFASHP6SFIXFCJAE4Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/14/2023 1:20 PM, Andy Shevchenko wrote:
> On Fri, Jul 14, 2023 at 08:56:07PM +0200, Amadeusz Sławiński wrote:
>> Instead of using local macro to match PCI device, use global one.
> 
> ...
> 
>> @@ -2718,7 +2718,6 @@
>>   #define PCI_DEVICE_ID_INTEL_82840_HB	0x1a21
>>   #define PCI_DEVICE_ID_INTEL_82845_HB	0x1a30
>>   #define PCI_DEVICE_ID_INTEL_IOAT	0x1a38
>> -#define PCI_DEVICE_ID_INTEL_HDA_APL_T	0x1a98
>>   #define PCI_DEVICE_ID_INTEL_HDA_CPT	0x1c20
>>   #define PCI_DEVICE_ID_INTEL_COUGARPOINT_LPC_MIN	0x1c41
>>   #define PCI_DEVICE_ID_INTEL_COUGARPOINT_LPC_MAX	0x1c5f
> 
> Looks like it should be a separate change.
> 

Oops... must have fixed up wrong patch, and I even looked at all patches 
before sending them, to check for something like that :|
