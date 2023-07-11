Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C952D74F149
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 16:11:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D2E1EB4;
	Tue, 11 Jul 2023 16:10:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D2E1EB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689084707;
	bh=ZJckkFcdQ46lGeHOGwt24YBZGL/HoGzzm/IkMebPc/U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NBpH0dlrsmUcEVW5rZiAtQTKxt5ZnX0Vuyj72o/JyyXbKz6AnjXtF7O7SBxyzBOUA
	 2RSWfqgD6HWcAul/2ivQNOhi8xnqgpD1vEiUIQ534LQxkuaTxqCEZ6BQPaBMnJOzdK
	 r9rvK0inHwKnoCKu/xvL4su0WgBiWIRhnEHOp1ms=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6818AF80535; Tue, 11 Jul 2023 16:10:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 264B9F80236;
	Tue, 11 Jul 2023 16:10:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19171F80249; Tue, 11 Jul 2023 16:10:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68907F80153
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 16:10:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68907F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=irunyGqG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689084631; x=1720620631;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZJckkFcdQ46lGeHOGwt24YBZGL/HoGzzm/IkMebPc/U=;
  b=irunyGqGEZlwGQNxjRJUB0GJIZ+q7gEJAzXGZVYW4l+0ePOzw5HvnOb0
   spVfBBAcMccDm2Ukq07OgHX7sU+hETnE+WhlNpKSwDDcHk8Q41ReIdo7Q
   y4fXU6cLAgucTtRIhjtWZYr7sFaI8Uk+eGye31bO+POTpB3ycPx/pVVma
   KAU7Esk9cIY+BxKB/B4yTZp36KJ7mcYShv4d9mFNTvvLObVu3YNX2+QxD
   Unw0v+XsEXVWAxwe2Iin0DOWtb5duS6/PDTVRdkFWEYJ69qhxoiNmGW+J
   hqHsjoUD0lLusZwbEdxCfRrDl9yjFOrsZRJvRlF4DSvIoYvk9ujonGsxM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="367206849"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="367206849"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 07:09:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="811209493"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="811209493"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 07:09:46 -0700
Message-ID: <86dbdeeb-cc2b-59f7-eabb-6282799a3d32@linux.intel.com>
Date: Tue, 11 Jul 2023 16:09:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 07/13] ALSA: intel-dsp-config: Convert to PCI device IDs
 defines
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
 <20230711125726.3509391-8-amadeuszx.slawinski@linux.intel.com>
 <ZK1gaER7n4JUjIeW@smile.fi.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <ZK1gaER7n4JUjIeW@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EP5GBC6V4ZOVR7VPQ3HIE2ST7KH6SXIU
X-Message-ID-Hash: EP5GBC6V4ZOVR7VPQ3HIE2ST7KH6SXIU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EP5GBC6V4ZOVR7VPQ3HIE2ST7KH6SXIU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/11/2023 4:00 PM, Andy Shevchenko wrote:
> On Tue, Jul 11, 2023 at 02:57:20PM +0200, Amadeusz Sławiński wrote:
>> Use PCI device IDs from pci_ids.h header. Also simplify comments for
>> Alder Lake and Raptor Lake platforms, as new IDs make it clear what
>> revision is in use.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> # for Intel Tangier ID
> 
> One remark below.
> 
>> Acked-by: Mark Brown <broonie@kernel.org>
>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> ---
>>   sound/hda/intel-dsp-config.c | 119 ++++++++++++++++-------------------
>>   1 file changed, 55 insertions(+), 64 deletions(-)
>>
>> diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
>> index 317bdf6dcbef..2a71fa5ffec1 100644
>> --- a/sound/hda/intel-dsp-config.c
>> +++ b/sound/hda/intel-dsp-config.c
>> @@ -50,14 +50,14 @@ static const struct config_entry config_table[] = {
>>   #if IS_ENABLED(CONFIG_SND_SOC_SOF_MERRIFIELD)
>>   	{
>>   		.flags = FLAG_SOF,
>> -		.device = 0x119a,
>> +		.device = PCI_DEVICE_ID_INTEL_ADSP_TNG,
> 
> Yeah, somebody familiar with Intel history of SST/HDA/wtf should really
> tell why HDA code is using this ID. Does it mean that SST implies HDA
> always? Only for this (or this family of) platform?
> 
> It might affect the ID naming, but otherwise it's orthogonal to the series.
> 

There were few early devices where DSP was separate unit:
Haswell, Broadwell - where we use ACPI to load (SND_SOC_INTEL_CATPT) 
audio driver, Tangier/Merrifield - where ACPI or PCI is used to load 
(SND_SST_ATOM_HIFI2_PLATFORM_PCI) audio driver.
All further generations are HDA devices with integrated DSP. This causes 
all the weirdness ;)

