Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B64E8792334
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 15:59:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C99F083A;
	Tue,  5 Sep 2023 15:58:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C99F083A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693922373;
	bh=K0n16w11oT5gdSlrRmgkJPXQ637JBUyZOqJH9+YgB3Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E4STZz2WBPQEVZy3jXmVf2SAyvQdt2+39sshB0KfnG0QIQtE15htrqef/Nh7oEQ9S
	 LfsCpcr4bXwmggxafXRdDDzjshkswsZZ+7AeUKZkdOkmdu83T5PL9czeNFrXqsWboQ
	 PHhJX/VFvjQdAIzh0R//0roksw9agmMhZOtumomQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2F131F80431; Tue,  5 Sep 2023 15:58:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF37EF8047D;
	Tue,  5 Sep 2023 15:58:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31B43F80494; Tue,  5 Sep 2023 15:58:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3F24F80431
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 15:58:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3F24F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mh+SvRQU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693922317; x=1725458317;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=K0n16w11oT5gdSlrRmgkJPXQ637JBUyZOqJH9+YgB3Y=;
  b=mh+SvRQUalwN7M0JRHPCMgfTIbObGdKe0eBB8FVrmsMVL3S/PVzjSuZw
   jtM9T/NSB6qtE1FSBQJHqxN7oq8Jc7JcDWHevMVRMks1YKK/Yv05gcfvK
   Y8R5UYpPfle/APdYKaN2IdQ06R1ibnFp+MvYzoJy7Ua4KEMsaCGXg/aYf
   B/ZUSYbP0JXUrNB7NUoKjZ1Vx/mHk9YL200OdF4Lad6kATLpN01vcZycM
   FypFBufqXfQ7B/46Iz9JjVhbTMesttZY8eOar9/Eu608HT3iE2/tzOOPe
   X6AInBlOOExgCPGTRowqWxLOVEx06M0jl/57cTra38qX6DLihyCaZPx3w
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="440771311"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000";
   d="scan'208";a="440771311"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 06:58:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="831261907"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000";
   d="scan'208";a="831261907"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.91])
 ([10.94.0.91])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 06:58:20 -0700
Message-ID: <5a3073a6-4d82-df2a-11fb-fd9027e6f3fa@linux.intel.com>
Date: Tue, 5 Sep 2023 15:58:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] ASoC: Intel: avs: Provide support for fallback topology
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai
 <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org
References: <20230905093147.1960675-1-amadeuszx.slawinski@linux.intel.com>
 <41c370c9-9be7-ae50-c183-63d7024aa389@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <41c370c9-9be7-ae50-c183-63d7024aa389@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RZM2NGB7UDZZBZXO5NXFJVNRQGWZXW2I
X-Message-ID-Hash: RZM2NGB7UDZZBZXO5NXFJVNRQGWZXW2I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RZM2NGB7UDZZBZXO5NXFJVNRQGWZXW2I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 9/5/2023 2:42 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 9/5/23 05:31, Amadeusz Sławiński wrote:
>> HDA and HDMI devices are simple enough that in case of user not having
>> topology tailored to their device, they can use fallback topology.
>>
>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> ---
>>   sound/soc/intel/avs/pcm.c | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
>> index 1fbb2c2fadb5..8565a530706d 100644
>> --- a/sound/soc/intel/avs/pcm.c
>> +++ b/sound/soc/intel/avs/pcm.c
>> @@ -796,6 +796,28 @@ static int avs_component_probe(struct snd_soc_component *component)
>>   
>>   	ret = avs_load_topology(component, filename);
>>   	kfree(filename);
>> +	if (ret == -ENOENT && !strncmp(mach->tplg_filename, "hda-", 4)) {
>> +		unsigned int vendor_id;
>> +
>> +		if (sscanf(mach->tplg_filename, "hda-%08x-tplg.bin", &vendor_id) != 1)
>> +			return ret;
>> +
>> +		if (((vendor_id >> 16) & 0xFFFF) == 0x8086)
>> +			mach->tplg_filename = devm_kasprintf(adev->dev, GFP_KERNEL,
>> +							     "hda-8086-generic-tplg.bin");
> 
> it's very odd to test for 0x8086 in a driver that only supports Intel
> devices, isn't it?
> 
> One of these two branches is always-true or there's a missing
> explanation on what this 0x8086 is used for?
> 

Differentiating between generic codecs 
(https://github.com/thesofproject/avs-topology-xml/tree/main/hda) and 
hdmi ones 
(https://github.com/thesofproject/avs-topology-xml/tree/main/hdmi), as 
topology targets codec.

