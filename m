Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 242E7708637
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 18:48:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AABC7F1;
	Thu, 18 May 2023 18:48:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AABC7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684428534;
	bh=eZIiTyret7MDus74XojVEWyZ/KiqME39bi31YIWnNnw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WYodaZi8/u4fp0jDWGawyCx8UKw+fkE9wMBsaEim/kMYSIbsd+NoRpz4sU/vXn198
	 9NypnQreN+mmlerjNiQhmQXQI8JBGbmLWVPAcHd7VAXZ1xU4Cs3L13hjqlkbyAwUDz
	 oM0IEYEqew4wTAWsbIvpxLWc2scpGe6n3JLydt50=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C01C5F80549; Thu, 18 May 2023 18:47:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04896F8025A;
	Thu, 18 May 2023 18:47:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68590F80272; Thu, 18 May 2023 18:47:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A19C5F8016D
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 18:47:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A19C5F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=llEC5Vcr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684428441; x=1715964441;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eZIiTyret7MDus74XojVEWyZ/KiqME39bi31YIWnNnw=;
  b=llEC5VcrGIDsrQvXED0e6q03dkAaQg/x5uDDcSfteEG1BZraWFsK+mAF
   vokI9BaHpnGuD+8NJ3pSUnVlTp4nT1MEirwpN/BBuTWP9s4O/Ajd52nIx
   w4bngkNqUyekKDgNXtbdi2TanzqBrW+TRzTKl+9l4zWe897GAVvECo30X
   lKCv+6zvVveWeseXlu2zxxdgvhUAln9zSsL4FqjaEG2LYC+MdG6IxLNT9
   AzS6YR9Uz1pJV/BtmZmBCjBkoOA75BSKRwEoet8OcfprtW04AvPnvXWH9
   oPNX1ca2QnBvVxUxrCB1iSTVBqbsKUzdCldsgWj3cbrVAGM9lwZiAOZN6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="354457517"
X-IronPort-AV: E=Sophos;i="6.00,285,1681196400";
   d="scan'208";a="354457517"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 09:47:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="735164963"
X-IronPort-AV: E=Sophos;i="6.00,285,1681196400";
   d="scan'208";a="735164963"
Received: from nithinks-mobl1.amr.corp.intel.com (HELO [10.209.80.104])
 ([10.209.80.104])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 09:47:13 -0700
Message-ID: <3fd73def-4765-d43c-4c2c-e0fb0e2e0516@linux.intel.com>
Date: Thu, 18 May 2023 11:47:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 06/10] mfd: cs42l43: Add support for cs42l43 core driver
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: broonie@kernel.org, lee@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, tglx@linutronix.de,
 maz@kernel.org, linus.walleij@linaro.org, vkoul@kernel.org,
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-7-ckeepax@opensource.cirrus.com>
 <73438e58-bd96-818d-1f43-5681b0d1a1de@linaro.org>
 <20230518102442.GZ68926@ediswmail.ad.cirrus.com>
 <650012a3-b455-8be5-fd6d-d0775e718e6a@linux.intel.com>
 <049c2470-536a-1b1c-9828-7acb4d483309@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <049c2470-536a-1b1c-9828-7acb4d483309@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: C5OCPGTTF5CEJ6WGFVECYKHWSKF2PARK
X-Message-ID-Hash: C5OCPGTTF5CEJ6WGFVECYKHWSKF2PARK
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C5OCPGTTF5CEJ6WGFVECYKHWSKF2PARK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/18/23 11:15, Richard Fitzgerald wrote:
> 
> 
> On 18/05/2023 16:16, Pierre-Louis Bossart wrote:
>>
>>>>> +    ret = regmap_register_patch(cs42l43->regmap, cs42l43_reva_patch,
>>>>> +                    ARRAY_SIZE(cs42l43_reva_patch));
>>>>> +    if (ret) {
>>>>> +        dev_err(cs42l43->dev, "Failed to apply register patch:
>>>>> %d\n", ret);
>>>>> +        goto err;
>>>>> +    }
>>>>> +
>>>>> +    pm_runtime_mark_last_busy(cs42l43->dev);
>>>>> +    pm_runtime_put_autosuspend(cs42l43->dev);
>>>>> +
>>>>> +    ret = devm_mfd_add_devices(cs42l43->dev, PLATFORM_DEVID_NONE,
>>>>> +                   cs42l43_devs, ARRAY_SIZE(cs42l43_devs),
>>>>
>>>> I don't why adding devices is not in probe. They use the same regmap
>>>> right? So there will be no problem in probing them from MFD probe.
>>>
>>> Well except SoundWire is a bit of a special boy, the hardware is
>>> not necessarily available in probe, the hardware is only available
>>> at some point later when the device attaches. Doing it this way all
>>> of the attaching (and various detach/attach cycles the device needs
>>> during configuration) are over by the time the child drivers bind, so
>>> they don't all need special code to handle that.
>>
>> if the devices are added in the probe, then the regmap needs to be moved
>> to cache-only and another special API would be needed to tell the MFD
>> framework to turn the regmap cache-only off.
>>
>> But if it's the same regmap, the regmap cache is handled in the
>> SoundWire update_status callback so maybe  Krzysztof's proposal does
>> work?
> 
> But you still can't access the hardware in probe(). So you'd have all
> the child drivers probing but not able to talk to the hardware. The
> child drivers would have to hook into the update_status() somehow so
> they know when the peripheral has enumerated.
> It's simpler to add them after the hardware has enumerated - they will
> be able to access the hardware in their probe().

It depends on what you mean by 'access the hardware'. If the only
interface is regmap and regmap is in cache-only, then the child drivers
could "access the hardware" without anything happening until after
regmap is no longer cache-only.

But yeah, I realize it's a long shot.
