Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA2A7FA927
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 19:42:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 357E6820;
	Mon, 27 Nov 2023 19:42:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 357E6820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701110546;
	bh=t/U4i/4g24Q1NaSjgGg1AJ5lREjmE/Glz7Quo6T5yL0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L8mvLC0v6tuBf3psGDINw6bwVzlxgJsN/MtEbL4Y1+yuVvRVKh3EXokeHbE7tbo8C
	 A5LJ0OzyyzPV75j50PnUYtofMJ9zlzHDyeUI8NeURgsQEyRUQaUdzXswtXPxbF2RF8
	 3QD/r56GWf3XdKNoQbSVTBhksQX/nIwnVL4zMeKU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0CB5F80579; Mon, 27 Nov 2023 19:41:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DADBF8057A;
	Mon, 27 Nov 2023 19:41:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 688C6F80236; Mon, 27 Nov 2023 19:41:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F3CCF8007E
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 19:41:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F3CCF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MonTVkoh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701110506; x=1732646506;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=t/U4i/4g24Q1NaSjgGg1AJ5lREjmE/Glz7Quo6T5yL0=;
  b=MonTVkoh7Gzvyfpy96pjRy/cDq0xcJ54K3hcs9UMMt3+mh3RxzfNKI9y
   ugHYcvrppIMhOhkpH91x4t8DKi2bVIpi+zB8yty7eXFTj1hTPb7PJ0cNl
   b1kt9EA0E7IS+yFYxltV1cK6Kc0cZFugIhzrARlSaRDgFuWRMn3uP5R5A
   D7gS/ZBYSxZgGVez7OtTIbSxTbj2P8P2Pnoyh5alc3ETCFTC7e4XLLo4J
   M0RDEydx0oSYmrYDlVEtZdKdEWdaQrtvX+eAntC/VMZ7ze/+4SAwsEoaK
   BWTcFX/jxSE/hzGKVgIev2JQSqs6y19ohjHgqY8+5IJMdlEJfO9Elf1yW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="392517684"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="392517684"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 10:41:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="891820922"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="891820922"
Received: from alanpai-mobl.amr.corp.intel.com (HELO [10.209.65.171])
 ([10.209.65.171])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 10:41:40 -0800
Message-ID: <cb768f03-9d46-432e-ad67-8ff1ef075385@linux.intel.com>
Date: Mon, 27 Nov 2023 11:36:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] ASoC: Intel: soc-acpi-intel-tgl-match: add cs42l43
 and cs56l56 support
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 cezary.rojewski@intel.com, yung-chuan.liao@linux.intel.com,
 ckeepax@opensource.cirrus.com, yong.zhi@intel.com, chao.song@linux.intel.com
References: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
 <20231127133448.18449-7-peter.ujfalusi@linux.intel.com>
 <9660e9df-2061-4b2c-ba59-5e6f8a61f07d@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <9660e9df-2061-4b2c-ba59-5e6f8a61f07d@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XQCCDLRO5W4RUKA6PIJBEM66KMAIP3SF
X-Message-ID-Hash: XQCCDLRO5W4RUKA6PIJBEM66KMAIP3SF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XQCCDLRO5W4RUKA6PIJBEM66KMAIP3SF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>> +static const struct snd_soc_acpi_adr_device cs35l56_0_adr[] = {
>> +    {
>> +        .adr = 0x00003301FA355601ull,
>> +        .num_endpoints = 1,
>> +        .endpoints = &spk_r_endpoint,
> 
> Assigning CS35L56 to "left" or "right" endpoints might be confusing.
> All CS35L56 in a system receive both left and right channels and by
> default they output a mono-mix of left+right.
> 
> The left/right of an amp is determined by the firmware file (.bin) that
> is loaded and the current settings of the "Posture" ALSA control. So
> this amp might be the left channel after a .bin is loaded.

That's a problem if the kernel does not know which amplifier is on which
side, no? How would one change the balance if this information is known
only within a binary/opaque firmware?

> It would be better to have generic names for the endpoint that don't
> imply position, for example:
> 
> group1_spk1_endpoint
> group1_spk2_endpoint
> group1_spk3_endpoint
> group1_spk4_endpoint.

The notion of endpoint is completely half-baked today and the settings
used have no bearing on the behavior and user-experience. I am inches
away from sending a patch that removes all of the endpoint definitions,
we can re-add them if/when we can get the information from platform
firmware.

>> +        .name_prefix = "cs35l56-8"
> 
> Can these prefixes be "AMPn" to match the CS35L41, CS35L51 and
> CS35L56-hda driver? This prefix is used to find the matching firmware
> files and our naming convention for these has been cs35lxx-xxxx-ampn
> 
> Is there anything that depends on the prefixes being "cs35l56-n" ?

IIRC this name_prefix is just used for the codec_conf and hence for
control names/UCM. At some point userspace/driver need to know if amp5
is left or right.

We can certainly align on conventions but the values set in this ACPI
match table will not be used for firmware download - different scope.

>> +    },
>> +    {
>> +        .adr = 0x00003201FA355601ull,
>> +        .num_endpoints = 1,
>> +        .endpoints = &spk_3_endpoint,
>> +        .name_prefix = "cs35l56-7"
>> +    }
>> +};
>> +
>> +static const struct snd_soc_acpi_adr_device cs35l56_1_adr[] = {
>> +    {
>> +        .adr = 0x00013701FA355601ull,
>> +        .num_endpoints = 1,
>> +        .endpoints = &spk_l_endpoint,
>> +        .name_prefix = "cs35l56-1"
>> +    },
>> +    {
>> +        .adr = 0x00013601FA355601ull,
>> +        .num_endpoints = 1,
>> +        .endpoints = &spk_2_endpoint,
>> +        .name_prefix = "cs35l56-2"
>> +    }
>> +};
>> +
>> +static const struct snd_soc_acpi_link_adr tgl_cs42l43_cs35l56[] = {
>> +    {
>> +        .mask = BIT(3),
>> +        .num_adr = ARRAY_SIZE(cs42l43_3_adr),
>> +        .adr_d = cs42l43_3_adr,
>> +    },
>> +    {
>> +        .mask = BIT(0),
>> +        .num_adr = ARRAY_SIZE(cs35l56_0_adr),
>> +        .adr_d = cs35l56_0_adr,
>> +    },
>> +    {
>> +        .mask = BIT(1),
>> +        .num_adr = ARRAY_SIZE(cs35l56_1_adr),
>> +        .adr_d = cs35l56_1_adr,
>> +    },
>> +    {}
>> +};
>> +
