Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 221D87DB94A
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Oct 2023 12:51:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83FC6DE5;
	Mon, 30 Oct 2023 12:50:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83FC6DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698666699;
	bh=Wf36bxPgVsxUy5j/UtNTilNJi30VLZXPAL0pSlxW5cM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UEfNvB4gSIhlsL9Hl0NAtDqbhet/9D5Gn73Bw+1lrFEvF3zHV/0RJQEFFPsKmnrNX
	 mmriMZmjHoERuctkbKqS4ZIvPaWpiZClnFd6UDZWE8zEsdX73Fp16WDkV+zfRw23ZM
	 bvKASTFpqUpCDBVl4LulutnQAzI1j4JUjZDDvH9I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17629F800FA; Mon, 30 Oct 2023 12:50:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82AFBF80166;
	Mon, 30 Oct 2023 12:50:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9B78F8016D; Mon, 30 Oct 2023 12:50:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4ED29F800FA
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 12:50:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4ED29F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=c88Ex2cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698666639; x=1730202639;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Wf36bxPgVsxUy5j/UtNTilNJi30VLZXPAL0pSlxW5cM=;
  b=c88Ex2czwpl0leIkUE8bZHSyOE2uKMEElr/ncT/Bf/Gs9toqO1wJQpC7
   Eiul3K1sCazIiuRwzSUjySY0oV/a8fB6Lpi3Qu4hbLpM5Q2Wxa5l/2pyf
   s5E87X9AMHPXzfPTP7EbujcaQhT0GMZ7z47SAdu6ZwNfuYUW+O/Qloy/a
   vI18QUIPLyYsde5RRvoA7gfRAkZVKMrsc8BT2+vlZhpMU9BB0lHtLXR7e
   Ob+hZerJycntL3UrnvNBsZkFyPicqpWIBcfyYgmIinVPHt1Bml5Cys8J7
   GN7so2+bmrl5YqCngsOjkB2oAQEDHTvmSNf99/BLbou5EYd7cbBv8njgn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="385256800"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200";
   d="scan'208";a="385256800"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 04:50:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="1007395006"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200";
   d="scan'208";a="1007395006"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.91])
 ([10.94.0.91])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 04:50:32 -0700
Message-ID: <f431a348-6e32-4e19-be56-1373f9e65aee@linux.intel.com>
Date: Mon, 30 Oct 2023 12:50:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: Intel: avs: Add rt5514 machine board
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai
 <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@chromium.org>
References: <20231027110537.2103712-1-amadeuszx.slawinski@linux.intel.com>
 <20231027110537.2103712-2-amadeuszx.slawinski@linux.intel.com>
 <db8fb570-0532-45d2-b0dd-adfb8727f258@kernel.org>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <db8fb570-0532-45d2-b0dd-adfb8727f258@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7FCNGEJMOJGH5PZXCLB2WGMO4MD5EZFS
X-Message-ID-Hash: 7FCNGEJMOJGH5PZXCLB2WGMO4MD5EZFS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7FCNGEJMOJGH5PZXCLB2WGMO4MD5EZFS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/28/2023 10:46 AM, Krzysztof Kozlowski wrote:
> On 27/10/2023 13:05, Amadeusz Sławiński wrote:
>> To support AVS-rt5514 configuration add machine board connecting AVS
>> platform component driver with rt5514 codec one.
>>
>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> ---
>>   sound/soc/intel/avs/boards/Kconfig  |  10 ++
>>   sound/soc/intel/avs/boards/Makefile |   2 +
>>   sound/soc/intel/avs/boards/rt5514.c | 187 ++++++++++++++++++++++++++++
>>   3 files changed, 199 insertions(+)
>>   create mode 100644 sound/soc/intel/avs/boards/rt5514.c
> 
> ...
> 
>> +
>> +static struct platform_driver avs_rt5514_driver = {
>> +	.probe = avs_rt5514_probe,
>> +	.driver = {
>> +		.name = "avs_rt5514",
>> +		.pm = &snd_soc_pm_ops,
>> +	},
>> +};
>> +
>> +module_platform_driver(avs_rt5514_driver);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_ALIAS("platform:avs_rt5514");
> 
> You should not need MODULE_ALIAS() in normal cases. If you need it,
> usually it means your device ID table is wrong.
> 

In theory yes, in practice it is a bit more complicated, as we use the 
driver alias in sound/soc/intel/avs/board_selection.c in 
snd_soc_acpi_mach and they should match.

For example for rt286, there is:
# modinfo 
/lib/modules/6.4.0-rc3+/kernel/sound/soc/intel/avs/boards/snd-soc-avs-rt286.ko 
| grep 286
filename: 
/lib/modules/6.4.0-rc3+/kernel/sound/soc/intel/avs/boards/snd-soc-avs-rt286.ko
alias:          platform:avs_rt286
name:           snd_soc_avs_rt286
as you can see platform_driver::driver::name is not matching the driver 
name.

I've did quick test with removing alias and changing snd_soc_acpi_mach 
definition for one board and it didn't load.

Now that you pointed it out I also lean towards trying to remove 
MODULE_ALIAS() from board drivers, but it will probably require some 
more investigation if we really want to do it and implementing it properly.

