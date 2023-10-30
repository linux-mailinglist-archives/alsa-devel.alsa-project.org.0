Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B542E7DB9B1
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Oct 2023 13:16:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AF62DED;
	Mon, 30 Oct 2023 13:15:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AF62DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698668200;
	bh=A1MRYlb5eiyY5x1I+6oe/5jLsE4NugEzWN3sEtgDzOQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PFQ9xaTntV72hjD6VC6/4P9lAibXzFO5nfwEoA9iOBCYVPRmKLiCYOyzf70XtxQk4
	 1hQ6DBbTz20m0DVsxC0tlEXSQ9rboGJGX5eloAR3WPt17U+XjOgHLPkhTyZJCLRm0P
	 C1iaovMyimzNabPQd7ZEfm1PaZz7inflCCRMdEMc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1853F80425; Mon, 30 Oct 2023 13:15:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CD91F80152;
	Mon, 30 Oct 2023 13:15:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D48F5F80166; Mon, 30 Oct 2023 13:15:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09D43F80152
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 13:15:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09D43F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=l1VaBRds
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698668144; x=1730204144;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=A1MRYlb5eiyY5x1I+6oe/5jLsE4NugEzWN3sEtgDzOQ=;
  b=l1VaBRdsPhh9WN3FbmUBXTcwIerzc+L/DcFS54aICdcCWHnFb7IzwKVt
   AZTjz7414vrCu0aKfNho4rNiZuVivcXG7JsqQ7TOalAQ0FZstXRV0CFmq
   05iA3c3R9hNuhdLtdOXxXkva/FrCvF5blvDkTT6uYUgBWIEjvncmij/Qp
   JIf/MANCLpwHbUjv4JUhU8/puUeNS/i3o5MHrqypCl5w3MAR150aHDNRF
   Ho8yHDvMA7uqqUnhvKdgduTta/+DdRT7FB4x49OlH/SwhgLRJ+NNYO1zw
   I9GMUrvgTo08dENRhV0fWfQUT2dxzhduv5p+Kp7ol8VHsy0UKf+4m9hW8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="6692507"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200";
   d="scan'208";a="6692507"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 05:15:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="850897696"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200";
   d="scan'208";a="850897696"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.91])
 ([10.94.0.91])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 05:15:34 -0700
Message-ID: <087525de-588e-45f0-9d84-8d5bd83834ff@linux.intel.com>
Date: Mon, 30 Oct 2023 13:15:31 +0100
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
 <f431a348-6e32-4e19-be56-1373f9e65aee@linux.intel.com>
 <4b6af85b-3d22-4f78-9db9-11cb463c0b2a@kernel.org>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <4b6af85b-3d22-4f78-9db9-11cb463c0b2a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EGSQH5R3YB5Y6VYC4MOE66OPWN3JL6T5
X-Message-ID-Hash: EGSQH5R3YB5Y6VYC4MOE66OPWN3JL6T5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EGSQH5R3YB5Y6VYC4MOE66OPWN3JL6T5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/30/2023 12:59 PM, Krzysztof Kozlowski wrote:
> On 30/10/2023 12:50, Amadeusz Sławiński wrote:
>> On 10/28/2023 10:46 AM, Krzysztof Kozlowski wrote:
>>> On 27/10/2023 13:05, Amadeusz Sławiński wrote:
>>>> To support AVS-rt5514 configuration add machine board connecting AVS
>>>> platform component driver with rt5514 codec one.
>>>>
>>>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>>>> ---
>>>>    sound/soc/intel/avs/boards/Kconfig  |  10 ++
>>>>    sound/soc/intel/avs/boards/Makefile |   2 +
>>>>    sound/soc/intel/avs/boards/rt5514.c | 187 ++++++++++++++++++++++++++++
>>>>    3 files changed, 199 insertions(+)
>>>>    create mode 100644 sound/soc/intel/avs/boards/rt5514.c
>>>
>>> ...
>>>
>>>> +
>>>> +static struct platform_driver avs_rt5514_driver = {
>>>> +	.probe = avs_rt5514_probe,
>>>> +	.driver = {
>>>> +		.name = "avs_rt5514",
>>>> +		.pm = &snd_soc_pm_ops,
>>>> +	},
>>>> +};
>>>> +
>>>> +module_platform_driver(avs_rt5514_driver);
>>>> +
>>>> +MODULE_LICENSE("GPL");
>>>> +MODULE_ALIAS("platform:avs_rt5514");
>>>
>>> You should not need MODULE_ALIAS() in normal cases. If you need it,
>>> usually it means your device ID table is wrong.
>>>
>>
>> In theory yes, in practice it is a bit more complicated, as we use the
>> driver alias in sound/soc/intel/avs/board_selection.c in
>> snd_soc_acpi_mach and they should match.
>>
>> For example for rt286, there is:
>> # modinfo
>> /lib/modules/6.4.0-rc3+/kernel/sound/soc/intel/avs/boards/snd-soc-avs-rt286.ko
>> | grep 286
>> filename:
>> /lib/modules/6.4.0-rc3+/kernel/sound/soc/intel/avs/boards/snd-soc-avs-rt286.ko
>> alias:          platform:avs_rt286
>> name:           snd_soc_avs_rt286
>> as you can see platform_driver::driver::name is not matching the driver
>> name.
>>
>> I've did quick test with removing alias and changing snd_soc_acpi_mach
>> definition for one board and it didn't load.
> 
> Sorry, but why do you talk about platform name? We talk about ID table!
> 
>>
>> Now that you pointed it out I also lean towards trying to remove
>> MODULE_ALIAS() from board drivers, but it will probably require some
>> more investigation if we really want to do it and implementing it properly.
> 
> Ehm? We have been there. I've been dropping these useless aliases as
> well. You miss DEVICE_TABLE and proper ID entries, not adding aliases.
> 

Ah, DEVICE_TABLE, that's what I was missing, so I just to confirm, 
something like:

diff --git a/sound/soc/intel/avs/boards/rt274.c 
b/sound/soc/intel/avs/boards/rt274.c
index dd613aa15e80..659e10b1dcad 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -257,6 +257,14 @@ static int avs_rt274_probe(struct platform_device 
*pdev)
         return devm_snd_soc_register_card(dev, card);
  }

+static const struct platform_device_id avs_rt274_driver_ids[] = {
+        {
+                .name           = "avs_rt274",
+        },
+        {},
+};
+MODULE_DEVICE_TABLE(platform, avs_rt274_driver_ids);
+
  static struct platform_driver avs_rt274_driver = {
         .probe = avs_rt274_probe,
         .driver = {
@@ -268,4 +276,3 @@ static struct platform_driver avs_rt274_driver = {
  module_platform_driver(avs_rt274_driver);

  MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:avs_rt274");

for all the boards?

