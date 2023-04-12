Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C076DFEAF
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 21:24:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B40571011;
	Wed, 12 Apr 2023 21:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B40571011
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681327470;
	bh=CA0uNjqQ7UZKwD2eMHWqhw6WunyHnm6l1kgpv7ytslU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=BNBYP0ht8co5Lk1Yjj7DEWsHUv6o8gwgR2hIsbmPWkCokVMipOyLyNpTWbH6c4cB7
	 KhYLhtvyIW1keTgloDngnrgYPCQe16rkYTTFKSLIg+gm/XKLku0Ua8m2o4TunMAPut
	 +xAhNjPQgNF5yrII9kNiPHkruEczd+hUB8y9OWEk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7F4AF8025E;
	Wed, 12 Apr 2023 21:23:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9784AF8032B; Wed, 12 Apr 2023 21:23:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E12D1F80149
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 21:23:28 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 9DBF511D5;
	Wed, 12 Apr 2023 21:23:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 9DBF511D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1681327407; bh=nUtmWmp+tLkQy5mBF5U0Vs+HGW5rSKV6Sz39jScIzqg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ytM0cOKKElS+B4aVPI8KjEjLdoZw2h0FGW6gzIPbrBTjCywSRM7MR9LjyV+UCt4ly
	 y2peAhzMY0j/M2IiNSaXa3DgIZKLhAVAIDhW8GcmLEcZPtv6ki6N0lasqRSV6x4nvZ
	 PU3RhfcAt6efNYUtFzxnMhssDmhzZux3r7vMhfVE=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed, 12 Apr 2023 21:23:24 +0200 (CEST)
Message-ID: <1775ab67-1967-e496-58af-e2aaa034f105@perex.cz>
Date: Wed, 12 Apr 2023 21:23:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 1/2] ALSA: pcm: rewrite snd_pcm_playback_silence()
Content-Language: en-US
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
References: <20230405201219.2197789-1-oswald.buddenhagen@gmx.de>
 <8a3a2490-eb0f-7b76-3bc6-58ef5473d360@perex.cz> <ZDaJA4fCTFcsy9N1@ugly>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <ZDaJA4fCTFcsy9N1@ugly>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5TGPD6PQUKSVWHXIRKQ7HFLD6NRQ4TLR
X-Message-ID-Hash: 5TGPD6PQUKSVWHXIRKQ7HFLD6NRQ4TLR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5TGPD6PQUKSVWHXIRKQ7HFLD6NRQ4TLR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12. 04. 23 12:33, Oswald Buddenhagen wrote:
> On Tue, Apr 11, 2023 at 12:47:26PM +0200, Jaroslav Kysela wrote:
>> On 05. 04. 23 22:12, Oswald Buddenhagen wrote:
>>> This fixes a bug in thresholded mode, where we failed to use
>>> new_hw_ptr,
>>> resulting in under-fill.
>>
>> I don't follow what you refer here. The old code uses
>> snd_pcm_playback_hw_avail()
>>
> yes
> 
>> thus new hw_ptr for the threshold mode, too.
>>
> not before my patch. the silencer was called before the new pointer was
> stored. it had to be, as otherwise the delta for top-up mode could not
> be calculated.
> 
>>> +	// This will "legitimately" turn negative on underrun, and will be mangled
>>> +	// into a huge number by the boundary crossing handling. The initial state
>>> +	// might also be not quite sane. The code below MUST account for these cases.
>>> +	hw_avail = appl_ptr - runtime->status->hw_ptr;
>>> +	if (hw_avail < 0)
>>> +		hw_avail += runtime->boundary;
> 
>>> +	else if ((snd_pcm_uframes_t) hw_avail >= runtime->boundary)
>>> +		hw_avail -= runtime->boundary;
>>
>> If hw_avail is above runtime->boundary then the initial condition is totaly
>> bogus. I would use snd_BUG_ON() and direct return here.
>>
> this is only there as a result of inlining
> snd_pcm_playback_hw_avail()/snd_pcm_playback_avail() somewhat
> mindlessly. the check does indeed make no sense, so i'll just drop it.
> (the broader lesson of this is the attached patch. i can re-post it
> separately if you like it.)

I will correct that it will make sense where hw_ptr is nearby boundary 
(boundary - buffer_size ... boundary - 1) and appl_ptr is cropped using 
boundary (0 ... buffer_size). But because appl_ptr can be set by application 
without any kernel side correction, it may be possible to check if the 
appl_ptr is in 0 ... boundary range before any use. Sorry for the confusion.

>>>    		frames = runtime->silence_threshold - noise_dist;
>>> +		if ((snd_pcm_sframes_t) frames <= 0)
>>> +			return;
>>
>> The retyping does not look good here. Could we move the if before frames
>> assignment like:
>>
>>    if (runtime->silence_threshold <= noise_dist)
>>      return;
>>    frames = runtime->silence_threshold - noise_dist;
>>
> dunno, i don't like it - it's more noisy and imo it loses
> expressiveness, as the question we're asking is "how many frames do we
> need to fill?".
> note that due to use of unsigned types in the runtime struct, such
> retyping is rather common in comparisons.

It seems that you have answer to everything. My suggestion is perfectly 
readable (is the requested silence threshold fulfilled? or is the noise 
distance greater than the whole buffer / buffer_size?).

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

