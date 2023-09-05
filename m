Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 288A9792356
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Sep 2023 16:11:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAB87832;
	Tue,  5 Sep 2023 16:11:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAB87832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693923115;
	bh=itVjsCfj8Da4YGKM9vJqG5Ni9bnh4rOqRe7cgODZJ1I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qoX9FzVt9nbZcWwgoQySPUmepUSUnV/BReS1gdgyp/Vs6edkTm5rpC6HuYgTMTlkK
	 6eMKI5eMbw4Z9bYLRWIpumTLmhTyleIlhF2wNvc3ERwvTs83dNEgcs8ThsXMxhWW+C
	 fGa6P8P62wf19unQV+R8FVM9enQ5nTq/U+EZCeAs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DA31F8047D; Tue,  5 Sep 2023 16:11:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA318F8047D;
	Tue,  5 Sep 2023 16:11:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DC17F80494; Tue,  5 Sep 2023 16:11:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F501F80431
	for <alsa-devel@alsa-project.org>; Tue,  5 Sep 2023 16:10:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F501F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PTOsTJ+v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693923059; x=1725459059;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=itVjsCfj8Da4YGKM9vJqG5Ni9bnh4rOqRe7cgODZJ1I=;
  b=PTOsTJ+vjbUOULlldvuFxL3YTu4FjYrFp7XbAPw9iMemKqo/Ej9DxF4T
   FIzIPaLmFUpWrkECHdCGEL23+9rxDQrVIq4JeRECogsG4hGjgGsb7Bovx
   1BNi1dC2LB293W0Gjonfp8HDPRUO3vgQ8/YdSOeDOwBsxDIEZCOR84xpi
   OAbm5sWN/T5KW3YmyGaRRs4MMAKU77pIfn5Au2u8JHlJJ23CGpIKy3hW+
   ruwtAT6VBiCgPLkW4b/ef06z98sMyecH4ukF8T/fngVV4pHL1TkwEZKWY
   Tk4izIAvqqliujh8Ciq7zGTcYstmzHMZttIGef43xV7+iYFtUlITEYuWb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="440774866"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000";
   d="scan'208";a="440774866"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 07:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="831263381"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000";
   d="scan'208";a="831263381"
Received: from qatran-mobl2.amr.corp.intel.com (HELO [10.212.36.84])
 ([10.212.36.84])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 07:10:54 -0700
Message-ID: <c597816f-558a-e28a-0511-020d35a25b46@linux.intel.com>
Date: Tue, 5 Sep 2023 10:10:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: Intel: avs: Provide support for fallback topology
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai
 <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 alsa-devel@alsa-project.org
References: <20230905093147.1960675-1-amadeuszx.slawinski@linux.intel.com>
 <41c370c9-9be7-ae50-c183-63d7024aa389@linux.intel.com>
 <5a3073a6-4d82-df2a-11fb-fd9027e6f3fa@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <5a3073a6-4d82-df2a-11fb-fd9027e6f3fa@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ETFVITUHLERGFWK7ZFV4OUKZOOHOJR4Z
X-Message-ID-Hash: ETFVITUHLERGFWK7ZFV4OUKZOOHOJR4Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ETFVITUHLERGFWK7ZFV4OUKZOOHOJR4Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 9/5/23 09:58, Amadeusz Sławiński wrote:
> On 9/5/2023 2:42 PM, Pierre-Louis Bossart wrote:
>>
>>
>> On 9/5/23 05:31, Amadeusz Sławiński wrote:
>>> HDA and HDMI devices are simple enough that in case of user not having
>>> topology tailored to their device, they can use fallback topology.
>>>
>>> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>>> ---
>>>   sound/soc/intel/avs/pcm.c | 22 ++++++++++++++++++++++
>>>   1 file changed, 22 insertions(+)
>>>
>>> diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
>>> index 1fbb2c2fadb5..8565a530706d 100644
>>> --- a/sound/soc/intel/avs/pcm.c
>>> +++ b/sound/soc/intel/avs/pcm.c
>>> @@ -796,6 +796,28 @@ static int avs_component_probe(struct
>>> snd_soc_component *component)
>>>         ret = avs_load_topology(component, filename);
>>>       kfree(filename);
>>> +    if (ret == -ENOENT && !strncmp(mach->tplg_filename, "hda-", 4)) {
>>> +        unsigned int vendor_id;
>>> +
>>> +        if (sscanf(mach->tplg_filename, "hda-%08x-tplg.bin",
>>> &vendor_id) != 1)
>>> +            return ret;
>>> +
>>> +        if (((vendor_id >> 16) & 0xFFFF) == 0x8086)
>>> +            mach->tplg_filename = devm_kasprintf(adev->dev, GFP_KERNEL,
>>> +                                 "hda-8086-generic-tplg.bin");
>>
>> it's very odd to test for 0x8086 in a driver that only supports Intel
>> devices, isn't it?
>>
>> One of these two branches is always-true or there's a missing
>> explanation on what this 0x8086 is used for?
>>
> 
> Differentiating between generic codecs
> (https://github.com/thesofproject/avs-topology-xml/tree/main/hda) and
> hdmi ones
> (https://github.com/thesofproject/avs-topology-xml/tree/main/hdmi), as
> topology targets codec.


Ah yes, 0x8086 for the codec vendor. I must admit I didn't click after a
4-day week-end...

BTW your list of topologies helps with my assertion that we are missing
a 'hardware layer' in the topology framework, it makes no sense to have
a proliferation of topology files that all look the same. We really need
the ability to tell which endpoints are active or not, and which
hardware interface to use on a given platform. copy-pasting and using
macros is going to lead us into a maintenance nightmare.
