Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EF87854CB
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 12:01:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9A8E832;
	Wed, 23 Aug 2023 12:00:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9A8E832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692784905;
	bh=TzTe7H6wH+CKB0I8FUO+VzrUMzuf9ka/Yi6/XNuVAxs=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g68OQ4WB64adf6KXnALKkJsuFpMxnUuyo3BrDTeWJICKRqy97LTX7H10EH2vjazET
	 pYnBrSBVlYmIdWeJizbKzWmrJXS7dF4nwMajVAbefwVmhPf1lwGzahyuG1Jgzdahe1
	 LYjPiApnfAA3sY3NuagZioGBGpyrlYXIjfYmHNz0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A166F80158; Wed, 23 Aug 2023 12:00:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0B07F800F5;
	Wed, 23 Aug 2023 12:00:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22E2BF80158; Wed, 23 Aug 2023 12:00:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11A46F800BF
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 12:00:46 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A873E1615;
	Wed, 23 Aug 2023 12:00:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A873E1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1692784845; bh=bp1BXWaCxz5/EkzuD3PkvMeIoAyN1o4WLJpGpckNNIE=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=tM4grYUzLkHIXhDkviIdmIU83NmWCuqbEcDUvKlUa+KwlyhbugYnlOkvyZeDH6eAA
	 /E6ZC/s6bri9uUGzVwMVcf/lH52GmXeWgU3OETZj0feShfCA88bg1TDtaBKHQrn9ab
	 pbZIUkbteALWLgK+a1UekT6qFL7lh2qKXHz25Jjs=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 23 Aug 2023 12:00:37 +0200 (CEST)
Message-ID: <85eec185-b024-573e-3fc0-31d179c832a3@perex.cz>
Date: Wed, 23 Aug 2023 12:00:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 tiwai@suse.com, alsa-devel@alsa-project.org,
 amadeuszx.slawinski@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 hdegoede@redhat.com
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
 <20230811164853.1797547-2-cezary.rojewski@intel.com>
 <43b25b8b-3e28-bd91-a29a-846a5aa7579e@perex.cz> <87bkezdsjh.wl-tiwai@suse.de>
 <67fc99db-baf8-17b0-e7c4-f420676e5c8a@perex.cz> <874jkrdr49.wl-tiwai@suse.de>
 <5d77217b-1083-a4d0-1b69-7511d24b6aec@perex.cz>
 <acfcc8a3-8ceb-1671-1dad-35a083354170@intel.com>
 <9d0f0555-411a-96aa-c8a5-382f595a2bbd@perex.cz> <871qfuhyog.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [RFC PATCH 01/17] ALSA: pcm: Introduce MSBITS subformat interface
In-Reply-To: <871qfuhyog.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HAWRORV7L4M4BDXFEBUAGTBLLOP566Z7
X-Message-ID-Hash: HAWRORV7L4M4BDXFEBUAGTBLLOP566Z7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HAWRORV7L4M4BDXFEBUAGTBLLOP566Z7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23. 08. 23 11:53, Takashi Iwai wrote:
> On Wed, 23 Aug 2023 11:10:38 +0200,
> Jaroslav Kysela wrote:
>>
>> On 23. 08. 23 10:11, Cezary Rojewski wrote:
>>> On 2023-08-22 9:03 PM, Jaroslav Kysela wrote:
>>>> On 22. 08. 23 17:38, Takashi Iwai wrote:
>>>>> On Tue, 22 Aug 2023 17:29:47 +0200,
>>>>> Jaroslav Kysela wrote:
>>>>>>
>>>>>> On 22. 08. 23 17:07, Takashi Iwai wrote:
>>>>>>> On Tue, 22 Aug 2023 17:03:02 +0200,
>>>>>>> Jaroslav Kysela wrote:
>>>>>>>>
>>>>>>>> On 11. 08. 23 18:48, Cezary Rojewski wrote:
>>>>>>>>
>>>>>>>>> +#define SNDRV_PCM_SUBFMTBIT_MSBITS_32
>>>>>>>>> _SNDRV_PCM_SUBFMTBIT(MSBITS_32)
>>>>>>>>
>>>>>>>> What was reason to add 32/32 format ? Subformat STD + msbits == 32
>>>>>>>> should already handle the maximal resolution. Until we do not have 64
>>>>>>>> bit formats, it seems like an useless extension.
>>>>>>>
>>>>>>> My understanding is to distinguish the cases "we do fully support
>>>>>>> 32bit" and "we don't care".  But, the end effect is same for both,
>>>>>>> user-space would handle 32bit in both cases, so this difference won't
>>>>>>> help much, indeed.
>>>>>>
>>>>>> I don't think that we have a "do not care" situation. The applications
>>>>>> currently expects to use the maximal msbits for STD subformat. The
>>>>>> subformat should be used only to refine (downgrade) the resolution on
>>>>>> the driver / hw side on demand. I would just add only necessary API
>>>>>> extensions and save one bit for now.
>>>>>
>>>>> Well, the current behavior (with STD) is to choose whatever 32bit
>>>>> format the driver supports, and the driver may set a different value
>>>>> of hw_params.msbits at hw_params.  The explicit MSBITS_32 would
>>>>> enforce the hw_params.msbits to be 32, otherwise hw_refine would
>>>>> fail.  So I see a potential difference.
>>>>
>>>> I see. But if our target is to create a complete query/set msbits API,
>>>> we should cover all cases also for other formats.
>>>>
>>>> I vote to replace SUBFMTBIT_MSBITS_32 to SUBFMTBIT_MSBITS_MAX as the
>>>> second bit (right after STD). The format hw parameter already defines
>>>> the maximal width. We can add SUBFMTBIT_MSBITS_32 when it's really
>>>> required. Note that MAX should be handled for all cases (not only for
>>>> S32_LE or so).
>>>
>>> In my opinion STD already states "max". The word is not explicit either
>>> - max in the eyes of whom? The driver'? Then the driver may reply: max
>>> allowed e.g.: 24/32. And that translates to: fallback to STD.
>>
>> Max in the contents of the physical sample format (S32 = 32 bits, S24
>> = 24 bits, S8 = 8 bits etc). It would mean, if the driver supports S32
>> but only with 24-bit resolution, this bit should not be
>> set/allowed. We can also use word full or something other. If we like
>> to extend the API in this way (force the specific msbits with the
>> error handling), all formats should be covered. For STD - see
>> Takashi's reply.
> 
> I think MAX can be problematic when the device supports multiple
> formats, say, 16bit and 32bit.  Then it's not clear which MAX points
> to: is 16bit max or 32bit max.

I don't take this point. The subformat depends on the format, thus if one 
format support max, it should be set for queries.

Theoretically, this problem is in this API extension proposal too. Imagine 
that driver/hw support S24 and S32 formats and 20-bit msbits for one of them. 
How do you handle this? The subformat depends on format and should be refined 
when the format is known (single choice).

> I find the subformat extension OK, as this doesn't need much change in
> API.  OTOH, if we want to be more consistent way, we may extend
> hw_params for a new interval, e.g. SNDRV_PCM_HW_PARAM_MSBITS, and let
> the driver choosing it.  This will need more hw_params rules and
> become more complex, but it allows drivers really exotic setups (like
> 19bit PCM :)  But my gut feeling is that the subformat extension
> should suffice.

I'm not ok with 32 == 32. We should handle this case universally or discard.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

