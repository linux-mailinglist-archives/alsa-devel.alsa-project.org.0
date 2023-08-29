Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 561F578C8AF
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 17:38:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87344208;
	Tue, 29 Aug 2023 17:37:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87344208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693323480;
	bh=ooPvhwAJdyd0IoXFo24JeGWpBTU0RjFk7t2sspJRDOc=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cAL1LsooxJPk6MKmRH2DenhacZOcIcd+IcN0IJHUXuIfcsBtLLdwC4aEwQIhT8GBP
	 icINIYk21DwjxAjMUWPD6yY8KFA19bVofT3pxsDQ+z3z1XXSA/+aFMD/qXaEGcMOkI
	 q2CY86DZa1mzOaMNBPAeMYuoDKBvbauFSTUz89AI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA6FFF80158; Tue, 29 Aug 2023 17:37:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75D19F80155;
	Tue, 29 Aug 2023 17:37:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B110BF80158; Tue, 29 Aug 2023 17:37:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C86EF800F5
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 17:36:59 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id CCD1011DD;
	Tue, 29 Aug 2023 17:36:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz CCD1011DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1693323418; bh=11qlhv9egoq0sKoXRXS9PLThHO3XYbJhEE92qoNtr6o=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=dK+sjQLsGL9Z04BpALzzOrf2BiWQ1FUmID/VCiI8YsmvDgRacOUVGsZ3QKIFTu5Ta
	 hzdOm0FRGB0AZV5O5vlhElyjIlCR1mCrhO6q4HZxYqpoSxP2h0PkGfKvKPtQ3NPtn/
	 eHFliAp78VXR7rGlq5UFP21F8ptIyE2+IPl1jBVk=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 29 Aug 2023 17:36:52 +0200 (CEST)
Message-ID: <6fc8a33a-52f2-0cd1-6259-b2b974548602@perex.cz>
Date: Tue, 29 Aug 2023 17:36:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>
Cc: cujomalainey@chromium.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 ethan.geller@gmail.com
References: <20230824213312.1258499-1-cujomalainey@chromium.org>
 <ce20d02b-56ed-acd1-411b-8c68d8cabea8@perex.cz>
 <CAOReqxiDZOAEYYb5c73AHu+Nd2vZinLR5qdMAVJnEcV8TS6=Nw@mail.gmail.com>
 <6d498d35-841d-4ea4-2fd9-990f9b02563e@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 1/2] ucm: docs: Add EchoReferenceDev
In-Reply-To: <6d498d35-841d-4ea4-2fd9-990f9b02563e@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: S4T766NIDZ36IFKDCV43IXH2VG3XVGJU
X-Message-ID-Hash: S4T766NIDZ36IFKDCV43IXH2VG3XVGJU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S4T766NIDZ36IFKDCV43IXH2VG3XVGJU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28. 08. 23 20:35, Pierre-Louis Bossart wrote:
> 
> 
> On 8/28/23 12:59, Curtis Malainey wrote:
>> On Sat, Aug 26, 2023 at 4:28 AM Jaroslav Kysela <perex@perex.cz> wrote:
>>>
>>> On 24. 08. 23 23:33, cujomalainey@chromium.org wrote:
>>>> From: Curtis Malainey <cujomalainey@chromium.org>
>>>>
>>>> Sometimes userspace may want to use a reference channel to cancel echos
>>>> when using video chat, this value identifies the device which carries
>>>> that channel.
>>>
>>> The UCM modifier should be used for this - see "Echo Reference" comments in
>>> use-case.h.
>>>
>>> Note that this allows additional setup (in Sequences) for this stream.
>>>
>>>                                                  Jaroslav
>>
>> I was under the impression modifiers were state manipulators that
>> acted upon existing devices/pcms and did not designate their own PCM.
>> That is at least how we use them in CRAS.
>>
>> Are there any examples of how to designate a PCM? I don't see any
>> modifiers at all in ucm-conf repo.
> 
> I will second Curtis' request for clarifications.
> 
> I naively thought that modifiers would be used to e.g. select a 'Deep
> Buffer' output for low-power playback, or different capture streams
> based on the needs of the applications. It's not uncommon for capture
> applications to request different PCM streams for raw, AEC processed,
> AEC+NS processed data.
> 
> Echo reference is not really something that varies based on any
> qualifiers. And specifically in the Chrome case we want userspace to
> open the PCM echo reference device whenever the playback is used. So
> it's not really a use-case dependent thing but more a way to express a
> dependency between PCM devices.

It seems that there are some assumptions. I will try to address some things:

You can enable/use multiple modifiers per device.

The modifiers may define extra PCM streams in the standard Value section - you 
can use CapturePCM value for the modifier like "Echo Reference". Modifiers may 
alter the characteristics of the original UCM device stream (using command 
sequences), too.

Modifiers are an extra layer on top of devices. I don't think that we have any 
default relation between the modifier PCM device and the original PCM device 
(from the UCM device definition). A new value to describe this (like 
"ReplacePlaybackPCM 1") may be introduced. Another issue is when multiple 
modifiers with this description are active - they conflict, so it should be 
described somewhere, too. Perhaps, "ConflictingModifier" array may be added to 
API. But those extensions are not required for the "Echo Reference" modifier.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

