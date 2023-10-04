Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 015617B8366
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 17:18:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AF33DE5;
	Wed,  4 Oct 2023 17:17:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AF33DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696432689;
	bh=vH2FpBp/Jh+emhQL+yQf5eMDW7Ker5BK1A4xOIPfb8c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lBkeR3BU1YUmnd4iAaMG91iVnLs3R89H7L2q7fevD98+zyTo0pzyXMnKPDvlujwL+
	 4bpD0eRe6sqpr0FecYstnECuP5zHrALdGY6LLU0Eo7eyAGX7su2i5VQhX5LU9TwDW7
	 N0qirxOTcmtenSfoZAF4KHq08m5kg0o6xQT6iipI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 907CFF80570; Wed,  4 Oct 2023 17:16:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C266F8055A;
	Wed,  4 Oct 2023 17:16:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4FE2F8055C; Wed,  4 Oct 2023 17:16:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 54CA9F80130
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 17:16:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54CA9F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CdxGigyY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696432603; x=1727968603;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vH2FpBp/Jh+emhQL+yQf5eMDW7Ker5BK1A4xOIPfb8c=;
  b=CdxGigyYtbWL1+5nRf05YgLQCnnkg6EROJqlXueTiZipOtTqx51owbt0
   8GNrg1yPxzcU5RJPNyRr+Om57Qi2Bzj7pjdF6+1XsVh9lCt8zbKcQkG8V
   l2yrY6BLCombmoJjm2vjw3u4uyPv38UbOFCP2yh2LRgceZCTz/+0mS1qD
   8a3jq7K5ejMQ5Nwh1z0p/5SFm45q/6MQNHdliaM4DQSu4do1G5AUw5+Ue
   1mnqc3aiQ54IoOjhkFAVyAvIaVVIjbvOZiUT8jzuYpJStypi8ngLyltLH
   hG9WXAjsdhjVRv/tRmpjVNl67a8jQH3YHaR/ORDsRejA6A8v5ozfcb0Wg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="383101090"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200";
   d="scan'208";a="383101090"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 08:16:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="751336493"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200";
   d="scan'208";a="751336493"
Received: from mfmousa-mobl1.amr.corp.intel.com (HELO [10.212.98.56])
 ([10.212.98.56])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 08:16:11 -0700
Message-ID: <04c5911a-a894-44b3-9f0e-fe9e6de203f2@linux.intel.com>
Date: Wed, 4 Oct 2023 11:16:09 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: fix initializing sysfs for same devices on
 different buses
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Philippe Ombredanne <pombredanne@nexb.com>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Mark Brown <broonie@kernel.org>
References: <20231004130243.493617-1-krzysztof.kozlowski@linaro.org>
 <6628a5f6-ed22-4039-b5c2-2301c05c7e3e@linux.intel.com>
 <2023100453-perfected-palm-3503@gregkh>
 <624b044a-1f0f-4961-8b57-cb5346e7b0d3@linux.intel.com>
 <2023100452-craziness-unpopular-7d97@gregkh>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <2023100452-craziness-unpopular-7d97@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 76JCWEWZKILKKKJROKFN275I3XQ243GP
X-Message-ID-Hash: 76JCWEWZKILKKKJROKFN275I3XQ243GP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/76JCWEWZKILKKKJROKFN275I3XQ243GP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>>>> If same devices with same device IDs are present on different soundwire
>>>>> buses, the probe fails due to conflicting device names and sysfs
>>>>> entries:
>>>>>
>>>>>   sysfs: cannot create duplicate filename '/bus/soundwire/devices/sdw:0:0217:0204:00:0'
>>>>>
>>>>> The link ID is 0 for both devices, so they should be differentiated by
>>>>> bus ID.  Add the bus ID so, the device names and sysfs entries look
>>>>> like:
>>>>
>>>> I am pretty sure this will break Intel platforms by changing the device
>>>> names.
>>>>
>>>> sof_sdw.c:      else if (is_unique_device(adr_link, sdw_version, mfg_id,
>>>> part_id,
>>>> sof_sdw.c:
>>>> "sdw:%01x:%04x:%04x:%02x", link_id,
>>>> sof_sdw.c:
>>>> "sdw:%01x:%04x:%04x:%02x:%01x", link_id,
>>>
>>> device id name changes shouldn't break things, what is requring them to
>>> look a specific way?
>>
>> it's the ASoC dailink creation that relies on strings, we have similar
>> cases for I2C.
>>
>> There's no requirement that the name follows any specific convention,
>> just that when you want to rely on a specific device for an ASoC card
>> you need to use the string that matches its device name.
> 
> matching the name is fine (if you are matching it against an existing
> name) but expecting the name to be anything specific is not going to
> work as the name is dynamic and can/will change each boot.

Not following, sorry.

In the SoundWire context, the device name directly follows the ACPI or
Device Tree information, I don't really see how its name could change on
each boot (assuming no DSDT override or overlays of course). The
platform descriptors are pretty much fixed, aren't they?

Intel and AMD make such assumptions on names for pretty much all machine
drivers, it's not really something new - probably 15+ years? Adding Mark
Brown in CC: to make sure he's aware of this thread.
