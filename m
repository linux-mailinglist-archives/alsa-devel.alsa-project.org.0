Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A82785D4E
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 18:31:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6194D84B;
	Wed, 23 Aug 2023 18:30:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6194D84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692808270;
	bh=7XSmfZ1GVN4YIQQbgcCNp4jgQCrGT0qnGJ657Gn+Hc0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Je+/EP5hj1+8AmfQtwzizvYyRiSZtSI4bC/m/V2bH850p1EVOl/Xip0IzR6LAvnj4
	 yRtEVWHPouVGNLEfgFiala/nS/6CxH96yrccys0Sqazxp01TTMl5OMxwiM6O3PAdy0
	 cfqx5kfywqFLKlL3U7T9Zp/kM0dUHqHQtXtWBClg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E18EF80551; Wed, 23 Aug 2023 18:30:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CA85F8023B;
	Wed, 23 Aug 2023 18:30:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC524F8025F; Wed, 23 Aug 2023 18:30:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD3C5F804DA
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 18:29:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD3C5F804DA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UDKgKcZA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692808175; x=1724344175;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7XSmfZ1GVN4YIQQbgcCNp4jgQCrGT0qnGJ657Gn+Hc0=;
  b=UDKgKcZAQJzQxBFQteVuO4DdmyW0q+wY01CAO9X8xUKooxQdH6lbgzpx
   myYi/YmyAOrd8BqRQiMm45rIFuvatw5FYJPUGY1VOsoHnVbGQfLr/HfpT
   zQxhdMJSxZQX0adihTCJhPcTUnLJiEYeqSF5ftfny84Qs0LT4y/69pRqn
   ey0TsuB0bVxDzAKlqgMLf0JX181a9Xdp6xaiKRCyc9rJl2Bod5zn/RPqR
   Su1ix8b9HsKy5ahvfwwIjhIaSzaUNhdB/vPPOxwLFN4zn5F8+Vrhb+Rbs
   7eEE/mn4gvixFvq6L8YzNC36+IZrhey/8jxBN5uisfre+NdmXwMtMYMBL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="440563612"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="440563612"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 09:29:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="736723105"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="736723105"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.91])
 ([10.94.0.91])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 09:29:25 -0700
Message-ID: <6ee5dad3-c46a-4598-3b5a-cac59979ff6f@linux.intel.com>
Date: Wed, 23 Aug 2023 18:29:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RFC PATCH 01/17] ALSA: pcm: Introduce MSBITS subformat interface
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 tiwai@suse.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
 <20230811164853.1797547-2-cezary.rojewski@intel.com>
 <43b25b8b-3e28-bd91-a29a-846a5aa7579e@perex.cz> <87bkezdsjh.wl-tiwai@suse.de>
 <67fc99db-baf8-17b0-e7c4-f420676e5c8a@perex.cz> <874jkrdr49.wl-tiwai@suse.de>
 <5d77217b-1083-a4d0-1b69-7511d24b6aec@perex.cz>
 <acfcc8a3-8ceb-1671-1dad-35a083354170@intel.com>
 <9d0f0555-411a-96aa-c8a5-382f595a2bbd@perex.cz> <871qfuhyog.wl-tiwai@suse.de>
 <85eec185-b024-573e-3fc0-31d179c832a3@perex.cz>
 <dfac60f7-e043-ca57-8005-3a744b0f920e@linux.intel.com>
 <52b50220-aab0-6df4-6bab-e43d39006c45@perex.cz> <87zg2iggn5.wl-tiwai@suse.de>
 <f97bbbd5-1397-f5d3-5ccf-420ec813deac@perex.cz>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <f97bbbd5-1397-f5d3-5ccf-420ec813deac@perex.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OY2IPADSCRJ4JHKDVSVFQVRJVEOCM2F4
X-Message-ID-Hash: OY2IPADSCRJ4JHKDVSVFQVRJVEOCM2F4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OY2IPADSCRJ4JHKDVSVFQVRJVEOCM2F4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 8/23/2023 3:42 PM, Jaroslav Kysela wrote:
> On 23. 08. 23 13:08, Takashi Iwai wrote:
>> On Wed, 23 Aug 2023 12:47:33 +0200,
>> Jaroslav Kysela wrote:
>>>
>>> On 23. 08. 23 12:20, Amadeusz Sławiński wrote:
>>>> On 8/23/2023 12:00 PM, Jaroslav Kysela wrote:
>>>>> On 23. 08. 23 11:53, Takashi Iwai wrote:
>>>>>> On Wed, 23 Aug 2023 11:10:38 +0200,
>>>>>> Jaroslav Kysela wrote:
>>>>>>>
>>>>>>> On 23. 08. 23 10:11, Cezary Rojewski wrote:
>>>>>>>> On 2023-08-22 9:03 PM, Jaroslav Kysela wrote:
>>>>>>>>> On 22. 08. 23 17:38, Takashi Iwai wrote:
>>>>>>>>>> On Tue, 22 Aug 2023 17:29:47 +0200,
>>>>>>>>>> Jaroslav Kysela wrote:
>>>>>>>>>>>
>>>>>>>>>>> On 22. 08. 23 17:07, Takashi Iwai wrote:
>>>>>>>>>>>> On Tue, 22 Aug 2023 17:03:02 +0200,
>>>>>>>>>>>> Jaroslav Kysela wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>> On 11. 08. 23 18:48, Cezary Rojewski wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>>> +#define SNDRV_PCM_SUBFMTBIT_MSBITS_32
>>>>>>>>>>>>>> _SNDRV_PCM_SUBFMTBIT(MSBITS_32)
>>>>>>>>>>>>>
>>>>>>>>>>>>> What was reason to add 32/32 format ? Subformat STD + 
>>>>>>>>>>>>> msbits == 32
>>>>>>>>>>>>> should already handle the maximal resolution. Until we do not
>>>>>>>>>>>>> have 64
>>>>>>>>>>>>> bit formats, it seems like an useless extension.
>>>>>>>>>>>>
>>>>>>>>>>>> My understanding is to distinguish the cases "we do fully 
>>>>>>>>>>>> support
>>>>>>>>>>>> 32bit" and "we don't care".  But, the end effect is same for 
>>>>>>>>>>>> both,
>>>>>>>>>>>> user-space would handle 32bit in both cases, so this difference
>>>>>>>>>>>> won't
>>>>>>>>>>>> help much, indeed.
>>>>>>>>>>>
>>>>>>>>>>> I don't think that we have a "do not care" situation. The
>>>>>>>>>>> applications
>>>>>>>>>>> currently expects to use the maximal msbits for STD 
>>>>>>>>>>> subformat. The
>>>>>>>>>>> subformat should be used only to refine (downgrade) the
>>>>>>>>>>> resolution on
>>>>>>>>>>> the driver / hw side on demand. I would just add only 
>>>>>>>>>>> necessary API
>>>>>>>>>>> extensions and save one bit for now.
>>>>>>>>>>
>>>>>>>>>> Well, the current behavior (with STD) is to choose whatever 32bit
>>>>>>>>>> format the driver supports, and the driver may set a different 
>>>>>>>>>> value
>>>>>>>>>> of hw_params.msbits at hw_params.  The explicit MSBITS_32 would
>>>>>>>>>> enforce the hw_params.msbits to be 32, otherwise hw_refine would
>>>>>>>>>> fail.  So I see a potential difference.
>>>>>>>>>
>>>>>>>>> I see. But if our target is to create a complete query/set 
>>>>>>>>> msbits API,
>>>>>>>>> we should cover all cases also for other formats.
>>>>>>>>>
>>>>>>>>> I vote to replace SUBFMTBIT_MSBITS_32 to SUBFMTBIT_MSBITS_MAX 
>>>>>>>>> as the
>>>>>>>>> second bit (right after STD). The format hw parameter already 
>>>>>>>>> defines
>>>>>>>>> the maximal width. We can add SUBFMTBIT_MSBITS_32 when it's really
>>>>>>>>> required. Note that MAX should be handled for all cases (not 
>>>>>>>>> only for
>>>>>>>>> S32_LE or so).
>>>>>>>>
>>>>>>>> In my opinion STD already states "max". The word is not explicit 
>>>>>>>> either
>>>>>>>> - max in the eyes of whom? The driver'? Then the driver may 
>>>>>>>> reply: max
>>>>>>>> allowed e.g.: 24/32. And that translates to: fallback to STD.
>>>>>>>
>>>>>>> Max in the contents of the physical sample format (S32 = 32 bits, 
>>>>>>> S24
>>>>>>> = 24 bits, S8 = 8 bits etc). It would mean, if the driver 
>>>>>>> supports S32
>>>>>>> but only with 24-bit resolution, this bit should not be
>>>>>>> set/allowed. We can also use word full or something other. If we 
>>>>>>> like
>>>>>>> to extend the API in this way (force the specific msbits with the
>>>>>>> error handling), all formats should be covered. For STD - see
>>>>>>> Takashi's reply.
>>>>>>
>>>>>> I think MAX can be problematic when the device supports multiple
>>>>>> formats, say, 16bit and 32bit.  Then it's not clear which MAX points
>>>>>> to: is 16bit max or 32bit max.
>>>>>
>>>>> I don't take this point. The subformat depends on the format, thus if
>>>>> one format support max, it should be set for queries.
>>>>>
>>>>> Theoretically, this problem is in this API extension proposal too.
>>>>> Imagine that driver/hw support S24 and S32 formats and 20-bit 
>>>>> msbits for
>>>>> one of them. How do you handle this? The subformat depends on 
>>>>> format and
>>>>> should be refined when the format is known (single choice).
>>>>>
>>>>>> I find the subformat extension OK, as this doesn't need much 
>>>>>> change in
>>>>>> API.  OTOH, if we want to be more consistent way, we may extend
>>>>>> hw_params for a new interval, e.g. SNDRV_PCM_HW_PARAM_MSBITS, and let
>>>>>> the driver choosing it.  This will need more hw_params rules and
>>>>>> become more complex, but it allows drivers really exotic setups (like
>>>>>> 19bit PCM :)  But my gut feeling is that the subformat extension
>>>>>> should suffice.
>>>>>
>>>>> I'm not ok with 32 == 32. We should handle this case universally or
>>>>> discard.
>>>>>
>>>>>                        Jaroslav
>>>>>
>>>>
>>>> The reason for MSBITS32 is that, when only MSBITS_20 and MSBITS_24 are
>>>> defined, when userspace (in this case aplay) asks for usable formats 
>>>> and
>>>> subformat it gets something like:
>>>>
>>>> --------------------
>>>> ACCESS: MMAP_INTERLEAVED RW_INTERLEAVED
>>>> FORMAT: S16_LE S32_LE
>>>> SUBFORMAT: STD MSBITS_20 MSBITS_24
>>>> SAMPLE_BITS: [16 32]
>>>> FRAME_BITS: [32 64]
>>>> CHANNELS: 2
>>>> RATE: 48000
>>>>
>>>> when MSBITS_32 is not defined it is not clear if HW supports 24 or 32
>>>> bits as maximum possible value of msbits. However when MSBITS_32 is
>>>> defined it is clear - in the above case maximum possible bps then is 
>>>> 24,
>>>> because MSBITS_32 is missing in output.
>>>>
>>>> STD behaves as before and takes maximum possible value - in above case
>>>> it is 24.
>>>
>>> This example is nice for S32_LE but not S16_LE. With the max/full bit,
>>> we can already cover also S16_LE (so that the application can ask for
>>> the maximal msbits which fits to the physical format for S16_LE). It
>>> would be also a preparation for future, when we need to deal with more
>>> msbits combos (like 14bit or 15bit samples stored in the bigger
>>> physical words) etc.
>>>
>>> So application can set those parameters for in your case:
>>>
>>> S16_LE + STD         (maximum bits handled by driver - 16 in this case)
>>> S16_LE + MSBITS_MAX  (maximum physical bits for the format - 16)
>>> S32_LE + STD         (maximum bits handled by driver - 24 in this case)
>>> S32_LE + MSBITS_MAX  (maximum physical bits for the format - 32)
>>> S32_LE + MSBITS_24
>>> S32_LE + MSBITS_20
>>>
>>> Dtto for other format like S8, S24 etc. Another way is to define
>>> MSBITS_8, MSBITS_16 etc. But I'd prefer to save subformat bits. The
>>> MSBITS_MAX would cover almost all cases for now.
>>
>> It becomes a bit tricky if we have a device that has 24bit bps on
>> 32bit format and 16bit bps / 16bit format.  Both formats and
>> subformats are bitmaps in hw_params, and initially formats bitmap is
>> 16|24 and subformats bitmap is MAX|24.
>>
>> Now, suppose that app determines to use 16bit.  Then we need to we
>> need to update subformats bitmap to MAX by dropping 24.  OTOH, if app
>> chooses 32bit format, subformats will be 24 by dropping MAX, as we
>> don't support 32 bps.  And, it's not so trivial to achieve this
>> commonly only with the single subformats bitmap of snd_pcm_hardware,
>> as the meaning of MAX depends on the chosen format.
> 
> It's easy to implement using a code which will go through all set format 
> bits and do bitwise OR for all corresponding subformat bits. We can use 
> a callback which the driver may override.
> 
> Something like (for the above HDA example): - SUBFMTBIT_STD is required 
> so it would be handled at the upper level):
> 
> snd_pcm_subformat_t (*get_subformat)(struct snd_pcm_substream 
> *substream, snd_pcm_format_t format)
> {
>          switch (format) {
>      case SNDRV_PCM_FMTBIT_S16_LE:
>          return SNDRV_PCM_SUBFMTBIT_MSBITS_MAX;
>          case SNDRV_PCM_FMTBIT_S32_LE:
>                  return SNDRV_PCM_SUBFMTBIT_MSBITS_24 |
>                         SNDRV_PCM_SUBFMTBIT_MSBITS_20;
>      default:
>          return 0;
>      }
> }
> 
> SUBFMTBIT_STD is required so it would be handled at the upper level.
> 
>> Meanwhile, if the subformats bitmap is with explicit bit flags,
>> i.e. 24|16, we can reduce the bitmap easily depending on the format.
> 
> I don't think that the current proposed code does any reduction. It will 
> return MSBITS_24 when only S16_LE format is selected, too. The refining 
> mechanism is ignored. We need to handle subformat bits differently than 
> format bits because the dependency.
> 
>                      Jaroslav
> 

Problem with MSBITS_MAX is that if kernel reports something like this:

FORMAT: S16_LE S32_LE
SUBFORMAT: STD MSBITS_20 MSBITS_MAX

to userspace, is that userspace can't really tell if you should only 
apply it to S16_LE or to S32_LE, or both. On the other hand if at some 
point someone adds S64_LE format, something like:

FORMAT: S16_LE S32_LE S64_LE
SUBFORMAT: STD MSBITS_20 MSBITS_32

will be also problematic as, you can't be sure is MSBITS subformats are 
meant for S32_LE or S64_LE format.

The easiest way would of course be to add specific formats like:
S20_MSB_LE
U20_MSB_LE
S20_MSB_BE
U20_MSB_BE
S24_MSB_LE
U24_MSB_LE
S24_MSB_BE
U24_MSB_BE
and one would know used formats exactly..., although I'm sure it is 
problematic in some ways, considering HDA currently exposes S32_LE and 
just sets msbits quietly and reports it after the fact to userspace.

Alternatively maybe, SUBFORMAT_STD could just mean LSB aligned where 
container is bigger than actual amount of bits and we can add 
SUBFORMAT_MSB, which can be then used with formats like S20_LE and 
S24_LE, to change bit justification, as it is unlikely to differ between 
formats?

Amadeusz

