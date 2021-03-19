Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 007AC3416EB
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 08:56:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 887B01693;
	Fri, 19 Mar 2021 08:55:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 887B01693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616140594;
	bh=HCaui7YkXqBcwrgz/fnqXdYLsJlEoxG6j/Pd80JgHAk=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mCNrYjOiWUlBB787JKmrSjbShkVGoOQ63HgU2Be/5hF19ri2C9x1RjClw7kvLz0Cu
	 KNqWXYWD3NC+YghDZsRxFwGszG8/gNM1jnOKK/V9abwZlUeDPp8LAl2kj8UkomAksl
	 iDSVhXxEFv+blahhW2ROq4fatle1mEGNAb1sQjv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A6D1F8023C;
	Fri, 19 Mar 2021 08:55:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B9F7F8021C; Fri, 19 Mar 2021 08:55:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FE7FF800BB
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 08:54:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FE7FF800BB
Received: from [103.229.218.199] (helo=[10.1.1.110])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1lN9y6-0005FA-Qv; Fri, 19 Mar 2021 07:54:51 +0000
Subject: Re: [PATCH] ALSA: hda/realtek: add more delay time before
 determine_headset_type
From: Hui Wang <hui.wang@canonical.com>
To: Takashi Iwai <tiwai@suse.de>
References: <20210316115549.240014-1-hui.wang@canonical.com>
 <s5hmtv3mbc8.wl-tiwai@suse.de>
 <df5c8fff-2bc6-4b69-79c4-fd803f662dc0@canonical.com>
Message-ID: <07168773-3fb4-386d-7b04-941a039e6151@canonical.com>
Date: Fri, 19 Mar 2021 15:54:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <df5c8fff-2bc6-4b69-79c4-fd803f662dc0@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, kailang@realtek.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Will send the v2 patch, in the v2, only extend the delay time for a 
specific codec series instead of all codec series, and the delay time is 
not two seconds, it is only 850ms.

And we found another issue about update_headset_mode() today, will send 
the fix in the v2 too.

Thanks.

Hui.

On 3/17/21 10:15 AM, Hui Wang wrote:
>
> On 3/16/21 10:17 PM, Takashi Iwai wrote:
>> On Tue, 16 Mar 2021 12:55:49 +0100,
>> Hui Wang wrote:
>>> We found a recording issue on the headset-mic recently, sometimes
>>> users plug a headset and select headset-mic from UI, but can't record
>>> any sound from headset-mic. The root cause is the
>>> determine_headset_type() returns a wrong type, e.g. users plug a ctia
>>> type headset, but that function returns omtp type.
>>>
>>> In the past, determine_headset_type() worked well because the internal
>>> mic is connected to the codec, so the "Input Source" or
>>> "Capture Source" is internal mic by default when users plug a headset,
>>> the determine_headset_type() will not be called unless users select
>>> headset-mic from UI, when users select headset-mic, the plugging
>>> action already finished and the headset is completely plugged into the
>>> jack, so determine_headset_type() could return a correct type.
>>>
>>> But more and more machines connect the internal mic to the PCH now,
>>> and the "Input Source" is headset mic by default, when users plug a
>>> headset, the determine_headset_type() will be called immediately, if
>>> the headset is not completely plugged in, it will return a wrong type.
>>>
>>> Here add 2s delay before calling determine_headset_type(), and since
>>> there is a pop-up dialogue when users do plugging action, to avoid
>>> freezing the UI, use the deleyed_work to call that function.
>> Hm, two seconds are quite long, IMHO.  How is this delay determined?
>>
>>
>> Takashi
>
> Two seconds delay is for a latest Dell AIO machine, and this issue is 
> exposed on that machine. The audio jack is designed to the left side 
> of that AIO machine, users need to use left hand to plug a headset, 
> and since it is an AIO, it is similar to plug sth to the left side on 
> a monitor, users usually don't use the great force to plug otherwise 
> they could introduce the movement of monitor; sometimes they use left 
> hand to plug a headset, the headset is not 100% plugged in, meanwhile 
> they need to put the right hand to the right side of the monitor to 
> fix the monitor. All these actions make the plugging not finished as 
> fast as on laptops or normal desktops. Our QA tested different delays, 
> it has a pretty good chance to return the correct type after adding 
> two seconds delay on that AIO machine. And I guess all Dell AIO 
> machines will face the same issue since they all have multi-function 
> audio jack.
>
>
> And I did a test on some Dell laptops, on which the internal mic 
> connects to the PCH, if I plug the headset a bit slower than normal 
> speed on purpose, the determine_headset_type() has some chance to 
> return the wrong type and make the headset-mic can't record sound. 
> Adding two seconds delay could make them work more stable.
>
>
> Thanks,
>
> Hui.
>
>
