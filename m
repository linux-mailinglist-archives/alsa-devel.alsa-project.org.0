Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5FB958111
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 10:33:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98D1BE76;
	Tue, 20 Aug 2024 10:33:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98D1BE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724142833;
	bh=SxmH7pCBUCC/+QtkYdWoPaRpX3/WrQ/u9Dt4Kgg2sL8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pbX0sANEkNBTVwkB/tOelUILO4cAQhxRFlCBt6QmWJZq6kpHgG0f704N6uph78dD4
	 /oN/xiS7gDn1K1yoSz2X/Cb4Ri4LEaUO+czBm+c4mFxIpgnrD4iw+c3VAhbjpXpQFm
	 j/SEmuM6pS8LQhtvCjo/JdzPFyU6Ta+x/D4l1rok=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D17F6F80580; Tue, 20 Aug 2024 10:33:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F1C3F80580;
	Tue, 20 Aug 2024 10:33:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8384F80494; Tue, 20 Aug 2024 10:31:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D333F8014C
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 10:31:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D333F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HWr/IR53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724142675; x=1755678675;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SxmH7pCBUCC/+QtkYdWoPaRpX3/WrQ/u9Dt4Kgg2sL8=;
  b=HWr/IR537JbIhHzdJ/5+nH/ZnwvYpb6Gnw5TKFXT5hT1jCrKnbpaWdeF
   fLnB3SNDnGVpdMozYdN+e8bWUaVLnz+LUwTqF0bqJbthESs5B0oWmjkgh
   YcnuutVSElpQ4ymJO3rQbmC58aRE8gl7q0z/INbh3yV9HsEKnLf722ahh
   6tHYg4+fBKKJFP8B6uliWDbJgQ3ao35qktfpX/xJHPoJfSjdIVCD8ezuB
   0UhUyNRVWCMgBvK5ntPazHoLGVnZ+2XBUqbvsUDnolcLHt7lKXhrnj8bm
   2/J/9N+KcO6rkd6s8L1N/oIPDuK+f8UWAZnBDXl5SfD2iW3kcMixpgo4W
   w==;
X-CSE-ConnectionGUID: ecU/1ACIQRmDsxp7vZ/yBA==
X-CSE-MsgGUID: Epgihc7ISVOYpKFVaiVd2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26293741"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600";
   d="scan'208";a="26293741"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 01:30:31 -0700
X-CSE-ConnectionGUID: 6z9L+SnLRMOV5s7hbb1iIg==
X-CSE-MsgGUID: MjGIrylhS/StVmcl8sSHaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600";
   d="scan'208";a="64838542"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO [10.245.246.176])
 ([10.245.246.176])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 01:30:27 -0700
Message-ID: <0cd6ed17-0bbd-4a72-884a-632c7de3977f@linux.intel.com>
Date: Tue, 20 Aug 2024 10:30:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 4/6] ASoC: fsl_asrc_m2m: Add memory to memory
 function
To: Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <1723804959-31921-1-git-send-email-shengjiu.wang@nxp.com>
 <1723804959-31921-5-git-send-email-shengjiu.wang@nxp.com>
 <6d83cd58-5f02-414b-b627-a0022e071052@linux.intel.com>
 <CAA+D8ANDAxS42=9zOLQY_h_ihvJCmaXzE+_iZyxbSuikqt1CBw@mail.gmail.com>
 <ceb54a27-144b-40ed-8de5-482f2b0664a0@linux.intel.com>
 <CAA+D8ANqb89UavAXTiHvcHyv9uMt8_MYR9hfBaxEJDPNy5C=-g@mail.gmail.com>
 <eceafeef-2dba-48aa-b8b3-198b9bb39fb6@perex.cz>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <eceafeef-2dba-48aa-b8b3-198b9bb39fb6@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2VNFGY4EYXZRUHFXNYK6CYSCSZBMF4JT
X-Message-ID-Hash: 2VNFGY4EYXZRUHFXNYK6CYSCSZBMF4JT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2VNFGY4EYXZRUHFXNYK6CYSCSZBMF4JT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/20/24 09:42, Jaroslav Kysela wrote:
> On 20. 08. 24 9:37, Shengjiu Wang wrote:
>> On Tue, Aug 20, 2024 at 2:59 PM Pierre-Louis Bossart
>> <pierre-louis.bossart@linux.intel.com> wrote:
>>>
>>>
>>>
>>> On 8/20/24 04:53, Shengjiu Wang wrote:
>>>> On Mon, Aug 19, 2024 at 3:42 PM Pierre-Louis Bossart
>>>> <pierre-louis.bossart@linux.intel.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 8/16/24 12:42, Shengjiu Wang wrote:
>>>>>> Implement the ASRC memory to memory function using
>>>>>> the compress framework, user can use this function with
>>>>>> compress ioctl interface.
>>>>>>
>>>>>> Define below private metadata key value for output
>>>>>> format, output rate and ratio modifier configuration.
>>>>>> ASRC_OUTPUT_FORMAT 0x80000001
>>>>>> ASRC_OUTPUT_RATE   0x80000002
>>>>>> ASRC_RATIO_MOD     0x80000003
>>>>>
>>>>> Can the output format/rate change at run-time?
>>>>
>>>> Seldom I think.
>>>>
>>>>>
>>>>> If no, then these parameters should be moved somewhere else - e.g.
>>>>> hw_params or something.
>>>>
>>>> This means I will do some changes in compress_params.h, add
>>>> output format and output rate definition, follow Jaroslav's example
>>>> right?
>>>
>>> yes, having parameters for the PCM case would make sense.
>>>
>>>>> I am still not very clear on the expanding the SET_METADATA ioctl to
>>>>> deal with the ratio changes. This isn't linked to the control layer as
>>>>> suggested before, and there's no precedent of calling it multiple
>>>>> times
>>>>> during streaming.
>>>>
>>>> Which control layer? if you means the snd_kcontrol_new?  it is bound
>>>> with sound card,  but in my case,  I need to the control bind with
>>>> the snd_compr_stream to support multi streams/instances.
>>>
>>> I can only quote Jaroslav's previous answer:
>>>
>>> "
>>> This argument is not valid. The controls are bound to the card, but the
>>> element identifiers have already iface (interface), device and subdevice
>>> numbers. We are using controls for PCM devices for example. The binding
>>> is straight.
>>>
>>> Just add SNDRV_CTL_ELEM_IFACE_COMPRESS define and specify the compress
>>> device number in the 'struct snd_ctl_elem_id'.
>>> "
>>
>> I don't think it is doable,  or at least I don't know how to do it.
>>
>> My case is just one card/one device/one subdevice.  can't use it to
>> distinguish multi streams.
> 
> I already wrote that the compress core code should be extended to
> support subdevices like other ALSA APIs. I'll work on it. For now, just
> add support for one converter.

I am not sure I get the benefits of subdevices in this context.

Can we not use different devices already, one per hardware ASRC instance?

Put differently, what would be the difference between a card with N
compressed devices or a card with 1 compressed device and N subdevices?

