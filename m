Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0852AB4190D
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Sep 2025 10:48:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EC17601F3;
	Wed,  3 Sep 2025 10:48:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EC17601F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1756889317;
	bh=kw6ynky9E+snQqDJLwXSz4OfqalV5+BAUdquoobmS0M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YsQ4KrLvUUE3FFiZ1FuqTGmi8y1rpI2q1GwmgdnckwZfZgrYQiFbrg0w47JsD0qpx
	 LMUec5N2KXBGQlbJpzYI4ScNxC8ZYzJn7Y7xSvZRsvxQBFpwM09FuJZDt7/0MohNx4
	 kbkhOaBPw2jSb0t9KBIbo7ZhV8l70O5kaKg/F8d0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4CB6F805D2; Wed,  3 Sep 2025 10:48:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 023FAF805BE;
	Wed,  3 Sep 2025 10:48:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 859BAF804D6; Wed,  3 Sep 2025 10:47:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 568C3F8011B
	for <alsa-devel@alsa-project.org>; Wed,  3 Sep 2025 10:47:38 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A80B1B86;
	Wed,  3 Sep 2025 10:47:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A80B1B86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1756889257; bh=/IGsJistRj7LHwfhf9wQkyJKJTAaWQf8yWDiE+urrZM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=1EFcBVlT6UnELmPpR8wqagSwW+yT8aOaB3YaspKY+GsXNnMFBAX5PK1vMgo90QGuq
	 tRHT/eqiTfXKvUp51K5A3NvkFxeUZFaR8Sx6/89hmpsMFQaRUVMwnpuZPhzrak9Pnu
	 z5LLvhd7bPISuqaho9yt+WGsoFNWdasVzgy+fACA=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Wed,  3 Sep 2025 10:47:33 +0200 (CEST)
Message-ID: <d21fb84e-d72e-4747-a9ff-92722b93f835@perex.cz>
Date: Wed, 3 Sep 2025 10:47:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ALSAfirewire broken / Pipewire 90ms delay
To: "M. Armsby" <m.armsby@gmx.de>, alsa-devel@alsa-project.org
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 Takashi Sakamoto <takaswie@kernel.org>
References: <224C5A41-DCED-4FA2-BE82-898F257DA2E9@gmx.de>
 <20250724143813.GA23616@workstation.local>
 <FD6FDA7B-D958-47BB-B90C-1A82349F94E4@gmx.de>
 <48A27ABA-5EF6-400D-A47A-103C1A4ABC6D@gmx.de>
 <1B53DD0F-1D85-49EC-BA7F-970BE9AEF457@gmx.de>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <1B53DD0F-1D85-49EC-BA7F-970BE9AEF457@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QUQMAOWBLWYRFLLLGW7CXCDFRDEFFISM
X-Message-ID-Hash: QUQMAOWBLWYRFLLLGW7CXCDFRDEFFISM
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QUQMAOWBLWYRFLLLGW7CXCDFRDEFFISM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 03. 09. 25 3:11, M. Armsby wrote:
> On 2 September 2025 09:59:58 CEST, "M. Armsby" <m.armsby@gmx.de> wrote:
>> On 30 July 2025 21:36:00 CEST, "M. Armsby" <m.armsby@gmx.de> wrote:
>>> The new ALSAfirewire drivers are very good. Well done to everyone who worked on them!
>>>
>>> Today I tested brand new CachyOS with xfce desktop kernel 6.15
>>> Initial Pipewire test showed RTT 98ms at 64/44100 so I uninstalled all traces of Pipewire and installed PulseAudio and Jack2 instead.
>>> I first tested ALSA direct from Reaper with Echo Audiofire4, Pianoteq and the RTT was as expected around 8ms (no 90ms)
>>> Then Jack2 with ALSAfirewire.
>>> The result was very similar and around 2% less rtCPU usage but a few X-runs on page refresh.
>>> I then set CPU to balanced and Jack failed with hundreds of X-runs whereas your wonderful ALSAfirewire alone continued with no X-runs  :)
>>>
>>>
>>> So you don't need to re-invent anything and there is nothing reasonable about 90ms delay.
>>> ALSAfirewire is working fine as long Pipewire isn't involved.
>>>
>>> Please fix the Pipewire problem as now nearly all distros are issued with it and everyone is blaming ALSAfirewire stack!
>>> This madness should be stopped don't you agree?
>>>
>>> Please.
>>>
>>> Thanks Martin Armsby
>>>
>>>
>>> -------- Original Message --------
>>> From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
>>> Sent: 24 July 2025 16:38:13 CEST
>>> To: m.armsby@gmx.de
>>> Cc: alsa-devel@alsa-project.org
>>> Subject: Re: ALSAfirewire broken
>>>
>>>
>>>
>>> The 90ms delay is reasonable..., depending on the PCM buffer
>>> configuration.
>>>
>>> At present, all of drivers in ALSA firewire stack works with such delay
>>> due to queued initial packet. Therefore PipeWire computes the delay
>>> as expected. We would need to reeinvent the packet streaming engine if
>>> reducing the delay.
>>>
>>
>> @wtaymans
>> Wim Taymans and some guest programmers found a simple workaround to bypass the 90ms delay:
>>
>> monitor.alsa.rules = [
>>   {
>>     matches = [ { node.name = "alsa_output.firewire-0x000a35003926b6db.pro-output-0" } ]
>>     actions = { update-props = {
>>        api.alsa.period-num = 3
>>     } }
>>   }
>> ]
>>
>> The communication from DAW to pure ALSAfirewire is not burdened with 90ms so please change the pins or whatever pipewire is using, so that it can avoid the 90ms like a DAW does when communicating directly to ALSAfirewire driver.
>> It must be obvious and easy to see in comparison and thus fix.
>>
>> ALSAfirewire RTT = 10ms
>> Pipewire-Firewire RTT = 10 + 90ms
>>
>> Please, many professionals are waiting for this fix which will boost Linux up to professional level.
>>
>> Thanks
>>
>>
>>
>>
>>
>> -- Martin Armsby
> 
> 
> 
> It's a great shame - that such issues are just ignored.
> 
> Lucky for us, Wim Taymans ist creating a workaround for Pipewire to bypass the  ALSAfirewire 90ms buffer problemcwith help from some great reaper users and programmers.
> Soon to be released.

For Takashi Sakamoto:

The hw_params constraints in the firewire driver should be improved based on 
[1]. The drivers may also require the SNDRV_PCM_INFO_BATCH info flag.

For reporter:

Please, show the procfs files (hw_params/status) for both playback and capture 
streams (pcm0p/pcm0c) for working 3 periods and 90ms setup - the reports in 
[1] are really messed up. But if pipewire uses the whole requested playback 
buffer, then the latency depends on the size of this buffer.

			Jaroslav

[1] https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/4785

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

