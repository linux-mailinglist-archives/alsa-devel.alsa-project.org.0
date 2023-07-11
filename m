Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F08E74F16D
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 16:14:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57A3D83A;
	Tue, 11 Jul 2023 16:13:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57A3D83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689084885;
	bh=RiocU3lLiq+39RFXSqs6p/cZudPc+izr4AUqqHXXmmI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nCn67+eXD+cCMIVh8QVsDHb5Nqhzb/V6ZvNoFzDeOKuFNT8gb5qaYmmzKTfknLpQD
	 H4Vc7O+wbOg2gFrNKgw7Lzau/yxqJJGRBNIczmFX9d6k1DjWQ4Qnwg5XXe6cijN2gh
	 wi6aHvk8k1hh1uWwgtFS3/t2W6irS6tHVlg89inY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02681F80551; Tue, 11 Jul 2023 16:13:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD9FAF80548;
	Tue, 11 Jul 2023 16:13:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FD52F80549; Tue, 11 Jul 2023 16:13:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3718AF80290
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 16:13:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3718AF80290
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Dl3oLXmP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689084806; x=1720620806;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=RiocU3lLiq+39RFXSqs6p/cZudPc+izr4AUqqHXXmmI=;
  b=Dl3oLXmPCqr8dNID+eKesTqapuA5FNrO62rbWzhg3nWO70S3wrqJD68A
   oDfS74F2qZcwhNGEYZoo9LytWlBYL3Fy6jTEvnUvV6pIakHE5HfpxJU1a
   4ng2dih7Uvk/7YwnPVXag2maLjhHSLI2QaA4Mpa0GCzb4gs/+ZXNLzIZi
   t0IkuquOBobBo6qLLBNdiz8b4ktIZzMfRkB4IctBIx4LIT9XePGaIZns1
   cK4WNC1eOJxFzmnPlibJD460quOo2/5kEey+wj6v66qUL4FowtjM2CoQY
   Emogj5WH/xivZkHdzWJ/EXac7yLqYV7IfU7Mddqm3e8Y8Xgm8YDWty0fO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="395414835"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="395414835"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 07:13:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="834716022"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="834716022"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 07:13:19 -0700
Message-ID: <1840b0c5-81aa-488c-1fbe-ac6681e3df35@linux.intel.com>
Date: Tue, 11 Jul 2023 16:13:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 10/13] ASoC: Intel: avs: Convert to PCI device IDs defines
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
 <20230711125726.3509391-11-amadeuszx.slawinski@linux.intel.com>
 <ZK1iiMgmjpCA02x+@smile.fi.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <ZK1iiMgmjpCA02x+@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WZUZFIARHQQN72UZBRC2OQ7H3ZV6ENBX
X-Message-ID-Hash: WZUZFIARHQQN72UZBRC2OQ7H3ZV6ENBX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WZUZFIARHQQN72UZBRC2OQ7H3ZV6ENBX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/11/2023 4:09 PM, Andy Shevchenko wrote:
> On Tue, Jul 11, 2023 at 02:57:23PM +0200, Amadeusz Sławiński wrote:
>> Use PCI device IDs from pci_ids.h header. Adjust AVS_MACH_ENTRY() macro,
>> so device ID can be provided in short form.
> 
> FWIW,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
>> Acked-by: Mark Brown <broonie@kernel.org>
>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> ---
>>   sound/soc/intel/avs/board_selection.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
>> index 60f8fb0bff95..b32e02940e30 100644
>> --- a/sound/soc/intel/avs/board_selection.c
>> +++ b/sound/soc/intel/avs/board_selection.c
>> @@ -263,14 +263,14 @@ struct avs_acpi_boards {
>>   };
>>   
>>   #define AVS_MACH_ENTRY(_id, _mach) \
>> -	{ .id = (_id), .machs = (_mach), }
>> +	{ .id = PCI_DEVICE_ID_INTEL_##_id, .machs = (_mach), }
>>   
>>   /* supported I2S boards per platform */
>>   static const struct avs_acpi_boards i2s_boards[] = {
>> -	AVS_MACH_ENTRY(0x9d70, avs_skl_i2s_machines), /* SKL */
>> -	AVS_MACH_ENTRY(0x9d71, avs_kbl_i2s_machines), /* KBL */
>> -	AVS_MACH_ENTRY(0x5a98, avs_apl_i2s_machines), /* APL */
>> -	AVS_MACH_ENTRY(0x3198, avs_gml_i2s_machines), /* GML */
>> +	AVS_MACH_ENTRY(HDA_SKL_LP, avs_skl_i2s_machines),
>> +	AVS_MACH_ENTRY(HDA_KBL_LP, avs_kbl_i2s_machines),
>> +	AVS_MACH_ENTRY(HDA_APL, avs_apl_i2s_machines),
>> +	AVS_MACH_ENTRY(HDA_GML, avs_gml_i2s_machines),
> 
> Maybe sort them by name?

They are sorted by generation.

