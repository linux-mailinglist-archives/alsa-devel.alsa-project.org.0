Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6027855D1
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 12:48:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 760F13E8;
	Wed, 23 Aug 2023 12:47:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 760F13E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692787727;
	bh=LRpMPRiE7TEeU4745srYcTSBQXBq7kV7QUNjwzKxo8U=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ohoiDazyDmf6BpWCYo/eJtVhevp9ZFxKeASOqASqTzIqVaALPkx6Q8m8FFhuCl341
	 TD67MPXVvfY/rPYP8xue6+0cKV4za4aZgLPOQHRiuKDrY9HUzZjtHBRfc6vl0N+0zz
	 pW/0StcmmCehxzcUsPhZDYKS0PZPj5qjpBf0Fr+Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E943BF80022; Wed, 23 Aug 2023 12:47:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A558F800F5;
	Wed, 23 Aug 2023 12:47:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14DBCF80158; Wed, 23 Aug 2023 12:47:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 111E9F80022
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 12:47:42 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 8481511F1;
	Wed, 23 Aug 2023 12:47:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 8481511F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1692787661; bh=6otZIE4lvyvl9P70TKGlKE22ycj4wFztbaGpqNdNBrs=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=kDOdwidpN9eTWY6IMxSNS/J+bOKBR7bEOogvSe92uNgno0A9PxGmsYe57etnHWl9+
	 FzXBMaGKvj1cfwnw52gAA8NnHZaX/qNctG4FVK181BroB5QcSTj+EsCSJElocnynmx
	 jIiqeXnnq0KPHRoESl42GSqNCkxzx9vJenEIxSzE=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 23 Aug 2023 12:47:33 +0200 (CEST)
Message-ID: <52b50220-aab0-6df4-6bab-e43d39006c45@perex.cz>
Date: Wed, 23 Aug 2023 12:47:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Takashi Iwai <tiwai@suse.de>
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
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [RFC PATCH 01/17] ALSA: pcm: Introduce MSBITS subformat interface
In-Reply-To: <dfac60f7-e043-ca57-8005-3a744b0f920e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P6HLVBKTE4OGTF74QXEXC3DPMVS45EQH
X-Message-ID-Hash: P6HLVBKTE4OGTF74QXEXC3DPMVS45EQH
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P6HLVBKTE4OGTF74QXEXC3DPMVS45EQH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23. 08. 23 12:20, Amadeusz Sławiński wrote:
> On 8/23/2023 12:00 PM, Jaroslav Kysela wrote:
>> On 23. 08. 23 11:53, Takashi Iwai wrote:
>>> On Wed, 23 Aug 2023 11:10:38 +0200,
>>> Jaroslav Kysela wrote:
>>>>
>>>> On 23. 08. 23 10:11, Cezary Rojewski wrote:
>>>>> On 2023-08-22 9:03 PM, Jaroslav Kysela wrote:
>>>>>> On 22. 08. 23 17:38, Takashi Iwai wrote:
>>>>>>> On Tue, 22 Aug 2023 17:29:47 +0200,
>>>>>>> Jaroslav Kysela wrote:
>>>>>>>>
>>>>>>>> On 22. 08. 23 17:07, Takashi Iwai wrote:
>>>>>>>>> On Tue, 22 Aug 2023 17:03:02 +0200,
>>>>>>>>> Jaroslav Kysela wrote:
>>>>>>>>>>
>>>>>>>>>> On 11. 08. 23 18:48, Cezary Rojewski wrote:
>>>>>>>>>>
>>>>>>>>>>> +#define SNDRV_PCM_SUBFMTBIT_MSBITS_32
>>>>>>>>>>> _SNDRV_PCM_SUBFMTBIT(MSBITS_32)
>>>>>>>>>>
>>>>>>>>>> What was reason to add 32/32 format ? Subformat STD + msbits == 32
>>>>>>>>>> should already handle the maximal resolution. Until we do not
>>>>>>>>>> have 64
>>>>>>>>>> bit formats, it seems like an useless extension.
>>>>>>>>>
>>>>>>>>> My understanding is to distinguish the cases "we do fully support
>>>>>>>>> 32bit" and "we don't care".  But, the end effect is same for both,
>>>>>>>>> user-space would handle 32bit in both cases, so this difference
>>>>>>>>> won't
>>>>>>>>> help much, indeed.
>>>>>>>>
>>>>>>>> I don't think that we have a "do not care" situation. The
>>>>>>>> applications
>>>>>>>> currently expects to use the maximal msbits for STD subformat. The
>>>>>>>> subformat should be used only to refine (downgrade) the
>>>>>>>> resolution on
>>>>>>>> the driver / hw side on demand. I would just add only necessary API
>>>>>>>> extensions and save one bit for now.
>>>>>>>
>>>>>>> Well, the current behavior (with STD) is to choose whatever 32bit
>>>>>>> format the driver supports, and the driver may set a different value
>>>>>>> of hw_params.msbits at hw_params.  The explicit MSBITS_32 would
>>>>>>> enforce the hw_params.msbits to be 32, otherwise hw_refine would
>>>>>>> fail.  So I see a potential difference.
>>>>>>
>>>>>> I see. But if our target is to create a complete query/set msbits API,
>>>>>> we should cover all cases also for other formats.
>>>>>>
>>>>>> I vote to replace SUBFMTBIT_MSBITS_32 to SUBFMTBIT_MSBITS_MAX as the
>>>>>> second bit (right after STD). The format hw parameter already defines
>>>>>> the maximal width. We can add SUBFMTBIT_MSBITS_32 when it's really
>>>>>> required. Note that MAX should be handled for all cases (not only for
>>>>>> S32_LE or so).
>>>>>
>>>>> In my opinion STD already states "max". The word is not explicit either
>>>>> - max in the eyes of whom? The driver'? Then the driver may reply: max
>>>>> allowed e.g.: 24/32. And that translates to: fallback to STD.
>>>>
>>>> Max in the contents of the physical sample format (S32 = 32 bits, S24
>>>> = 24 bits, S8 = 8 bits etc). It would mean, if the driver supports S32
>>>> but only with 24-bit resolution, this bit should not be
>>>> set/allowed. We can also use word full or something other. If we like
>>>> to extend the API in this way (force the specific msbits with the
>>>> error handling), all formats should be covered. For STD - see
>>>> Takashi's reply.
>>>
>>> I think MAX can be problematic when the device supports multiple
>>> formats, say, 16bit and 32bit.  Then it's not clear which MAX points
>>> to: is 16bit max or 32bit max.
>>
>> I don't take this point. The subformat depends on the format, thus if
>> one format support max, it should be set for queries.
>>
>> Theoretically, this problem is in this API extension proposal too.
>> Imagine that driver/hw support S24 and S32 formats and 20-bit msbits for
>> one of them. How do you handle this? The subformat depends on format and
>> should be refined when the format is known (single choice).
>>
>>> I find the subformat extension OK, as this doesn't need much change in
>>> API.  OTOH, if we want to be more consistent way, we may extend
>>> hw_params for a new interval, e.g. SNDRV_PCM_HW_PARAM_MSBITS, and let
>>> the driver choosing it.  This will need more hw_params rules and
>>> become more complex, but it allows drivers really exotic setups (like
>>> 19bit PCM :)  But my gut feeling is that the subformat extension
>>> should suffice.
>>
>> I'm not ok with 32 == 32. We should handle this case universally or
>> discard.
>>
>>                       Jaroslav
>>
> 
> The reason for MSBITS32 is that, when only MSBITS_20 and MSBITS_24 are
> defined, when userspace (in this case aplay) asks for usable formats and
> subformat it gets something like:
> 
> --------------------
> ACCESS: MMAP_INTERLEAVED RW_INTERLEAVED
> FORMAT: S16_LE S32_LE
> SUBFORMAT: STD MSBITS_20 MSBITS_24
> SAMPLE_BITS: [16 32]
> FRAME_BITS: [32 64]
> CHANNELS: 2
> RATE: 48000
> 
> when MSBITS_32 is not defined it is not clear if HW supports 24 or 32
> bits as maximum possible value of msbits. However when MSBITS_32 is
> defined it is clear - in the above case maximum possible bps then is 24,
> because MSBITS_32 is missing in output.
> 
> STD behaves as before and takes maximum possible value - in above case
> it is 24.

This example is nice for S32_LE but not S16_LE. With the max/full bit, we can 
already cover also S16_LE (so that the application can ask for the maximal 
msbits which fits to the physical format for S16_LE). It would be also a 
preparation for future, when we need to deal with more msbits combos (like 
14bit or 15bit samples stored in the bigger physical words) etc.

So application can set those parameters for in your case:

S16_LE + STD         (maximum bits handled by driver - 16 in this case)
S16_LE + MSBITS_MAX  (maximum physical bits for the format - 16)
S32_LE + STD         (maximum bits handled by driver - 24 in this case)
S32_LE + MSBITS_MAX  (maximum physical bits for the format - 32)
S32_LE + MSBITS_24
S32_LE + MSBITS_20

Dtto for other format like S8, S24 etc. Another way is to define MSBITS_8, 
MSBITS_16 etc. But I'd prefer to save subformat bits. The MSBITS_MAX would 
cover almost all cases for now.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

