Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7898E7A4B6A
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 17:05:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C03B826;
	Mon, 18 Sep 2023 17:04:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C03B826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695049542;
	bh=agU3qYvg6mPCgG5JjffWKUetHHFOzh4F6gT11VpjEL4=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gC/JQrg/Zm+hDZhA7mFFu4gBcSRD758A4+A54qjrOZt54F1XWfsxW4nt+QhzlPtNg
	 ySHFiHZLYSWmHpnezEDTelL5+s3drkZhqYmhqe/AtPJK0Pq5n7dqKHRO/GT1hBtqF8
	 GQz2hkJhryHFWUAy5VTsPLlI63lnr78husJUoxiY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7BC7F80552; Mon, 18 Sep 2023 17:04:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92972F801F5;
	Mon, 18 Sep 2023 17:04:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38FBAF8025A; Mon, 18 Sep 2023 17:04:47 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 86D9DF80125
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 17:04:40 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 871DC11E6;
	Mon, 18 Sep 2023 17:04:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 871DC11E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1695049479; bh=zEZxjE2kINEQyBDav8OAMGxjER9X6AOchRF6s3TzLDg=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=gOfVm2ytr8N9VyPVLOtZb31NBtSwx/em5l5eA7oSboquuvFwUmSgulhjQ/fxqVH4B
	 84NuZNNoPNoqptSVKsxcVyDXKbOF199PYDoXLuFIY8LzQ3M2KKyFkiw1VwIwghaOXV
	 iC+lCiWtqXynG2G44zuFKuxteSzAijXirBau3ggs=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 18 Sep 2023 17:04:36 +0200 (CEST)
Message-ID: <de412997-627d-9ad2-b9c2-cbdb78b70f5d@perex.cz>
Date: Mon, 18 Sep 2023 17:04:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 ALSA development <alsa-devel@alsa-project.org>
Cc: Takashi Iwai <tiwai@suse.de>
References: <20230912162526.7138-1-perex@perex.cz>
 <fd153436-d128-c1b9-dee0-ba03224fa013@intel.com>
 <f7dfdbd9-b8c0-fd65-1280-256e9a82fca2@perex.cz>
 <63b3eb26-3a76-5993-bd65-c3461a264b95@intel.com>
Content-Language: en-US
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [RFC PATCH] ALSA: pcm: Introduce MSBITS subformat API extension
In-Reply-To: <63b3eb26-3a76-5993-bd65-c3461a264b95@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UIPTUL3PTNCGZYJDHO3VWIEGBGRQDAS4
X-Message-ID-Hash: UIPTUL3PTNCGZYJDHO3VWIEGBGRQDAS4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UIPTUL3PTNCGZYJDHO3VWIEGBGRQDAS4/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18. 09. 23 15:55, Cezary Rojewski wrote:

>>>> +    if (!runtime->subformat_constraint) {
>>>
>>> I'd try to avoid another special-bit in the runtime space. But I might
>>> be wrong here and it's unavoidable. Let me ask though, why cannot we do
>>> the constraint unconditionally?
>>
>> This is for a special case when the drivers do not set
>> snd_pcm_hw_constraint_subformats (all current drivers). In this case,
>> the default is to handle STD and MAX subformat bits.
>>
>> This constraint should be applied only one time. So this prevents to
>> install it twice.
> 
> I believe we could avoid special-case approach. Have a copy/intersection
> helpers in place and utilize iterations-with-sentinel-entry. Provided
> such in v2 of my series.

I don't think that it's required to carry the format->subformat map in struct 
snd_pcm_hardware. Only few drivers will use it, so the separate constraint is 
fine. Also, you can remove a lot of your added code to the pcm_misc and ASoC 
core (copy, masking, allocating) when the affected drivers install the map 
using the constraint call.

Few points:

1) PCM API interface changes should be separate, you mixing unused helpers and 
separating vital functionality for drivers

2) if you copy 90% of my code, I don't think that Suggested-by: tag is fine

Could you do your work on top of my patch?

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

