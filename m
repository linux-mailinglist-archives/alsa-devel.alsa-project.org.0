Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF0879A4A1
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 09:37:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1CB77F8;
	Mon, 11 Sep 2023 09:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1CB77F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694417826;
	bh=J+ytuqAcGrT1PxixGYKBEIBeB/9P84Y6ziYflqP7Hjw=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q1Vu0BWZfpE6U104LKG3gzepXJS3/jExKbdW8H4YQRwTTqENxdttpWTOdkZxlF2+R
	 AWjZD1lCsPyLUV3d1iOKhJJ6CVrNhwIGJ+bN9LhJlOaf9+tGE/ikBWscOYxxB0djUW
	 s3ECGQ25y+bymjTjZC2fkyjLBQFkpSgmfWtpKblw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 069CFF8007C; Mon, 11 Sep 2023 09:36:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8E07F80246;
	Mon, 11 Sep 2023 09:36:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62F73F80425; Mon, 11 Sep 2023 09:36:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F158F8007C
	for <alsa-devel@alsa-project.org>; Mon, 11 Sep 2023 09:36:06 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A711D11CB;
	Mon, 11 Sep 2023 09:36:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A711D11CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1694417765; bh=TKCPGDb5E2P6Z7O2lKs2A9km1UzLZozkHSZR8v92+8s=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=25xzpI1NqX+ucUo37R9Zbshf0U4wE97tIkS5al6VG57Mprwqd78PlSFncT6dU1XNV
	 TPMTVJ9Z5TgJispIHeIS6LGqx6sZw8E6dGDjxZ1oYCVdaSOVmEZlKxd/TJ0VziMRKP
	 khxC8GFWxP8WN6b+0+VYa0SAYo3xoqVy3fpuxwoo=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 11 Sep 2023 09:35:57 +0200 (CEST)
Message-ID: <337fe790-fdbc-1208-080d-5bcf9264fc65@perex.cz>
Date: Mon, 11 Sep 2023 09:35:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Takashi Iwai <tiwai@suse.de>
Cc: broonie@kernel.org, tiwai@suse.com, alsa-devel@alsa-project.org,
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
 <6ee5dad3-c46a-4598-3b5a-cac59979ff6f@linux.intel.com>
 <7d2d56a5-698e-7ee3-e6ab-95757012537c@perex.cz>
 <36fb8f83-9b39-966b-c105-7ef1bcc17afa@intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [RFC PATCH 01/17] ALSA: pcm: Introduce MSBITS subformat interface
In-Reply-To: <36fb8f83-9b39-966b-c105-7ef1bcc17afa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VHW4MMU4REN2KWQ34PMNRP764PQ43FPX
X-Message-ID-Hash: VHW4MMU4REN2KWQ34PMNRP764PQ43FPX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VHW4MMU4REN2KWQ34PMNRP764PQ43FPX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08. 09. 23 16:36, Cezary Rojewski wrote:
> On 2023-08-24 9:31 AM, Jaroslav Kysela wrote:
>> On 23. 08. 23 18:29, Amadeusz Sławiński wrote:
> 
> ...
> 
>>> Problem with MSBITS_MAX is that if kernel reports something like this:
>>>
>>> FORMAT: S16_LE S32_LE
>>> SUBFORMAT: STD MSBITS_20 MSBITS_MAX
>>>
>>> to userspace, is that userspace can't really tell if you should only
>>> apply it to S16_LE or to S32_LE, or both. On the other hand if at some
>>> point someone adds S64_LE format, something like:
>>
>> Unfortunately, you've not got the point that the subformat contents
>> depends on the selected format. So the subformat mask is for ALL formats
>> selected in the configuration space. The only valid contents for one
>> format is when application or kernel reduces the format to single one.
>> And applications can do:
>>
>> 1) set format to S32_LE
>> 2) call refine
>> 3) get subformat bits for single S32_LE format from the refined cfg space
>>
>> In this case, queries and specific msbits selection will work. It's the
>> standard refine mechanism which works also for all other fields from the
>> parameter configuration space etc. If you look to all other fields from
>> the parameter configuration space, you cannot predict the exact
>> parameters (buffer size, period size, channels) until you do more
>> refining to set all parameters to exact values (single value).
>>
>> In other words, the above example:
>>
>> FORMAT: S16_LE S32_LE
>> SUBFORMAT: STD MSBITS_20 MSBITS_MAX
>>
>> .. means - at least one format supports maximal msbits for the given
>> format.
> 
> After reading all of this again, I'm fine with rewording MSBITS_32 to
> MSBITS_MAX.
> 
> As I do not see any other points to address here and review of v1 has no
> points to address either, I'll send v2 with this single change. If I'd
> missed anything, let me know.

The subformat bitmask should be also refined/updated depending on the selected 
format.

https://lore.kernel.org/alsa-devel/f97bbbd5-1397-f5d3-5ccf-420ec813deac@perex.cz/

It requires new code in pcm_lib.c and ASoC PCM core code.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

