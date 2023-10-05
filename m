Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F74C7B9FF3
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 16:32:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A505EDF0;
	Thu,  5 Oct 2023 16:31:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A505EDF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696516334;
	bh=DoFeQ6eBTcgaK/XpIiIY5JInXpjcMVs2sQEJX4E1LaY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BiF3mMTpYDZ1IUBpaA04a5F9+Z8wIfYOAy63AqoejvGlVNTJVyspyJhieSh+cLb47
	 qwOteonTwzfvWO+ZZj3rEQBoVTljVkDsC84fZXyvqZIsBAIRK83G7l/cr5K8xR0z+y
	 8r9spinPmlsN/sCgVvdR9YHWEb3HgFUSyIN4/hKs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA148F80558; Thu,  5 Oct 2023 16:31:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 540FDF80310;
	Thu,  5 Oct 2023 16:31:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB706F8047D; Thu,  5 Oct 2023 16:30:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.insite.cz (smtp.ivitera.com [88.101.85.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6358CF80166
	for <alsa-devel@alsa-project.org>; Thu,  5 Oct 2023 16:30:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6358CF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ivitera.com header.i=@ivitera.com header.a=rsa-sha256
 header.s=mail header.b=RM728GTz;
	dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.a=rsa-sha256 header.s=mail header.b=RM728GTz
Received: from localhost (localhost [127.0.0.1])
	by mail.insite.cz (Postfix) with ESMTP id A27798234;
	Thu,  5 Oct 2023 16:30:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1696516246; bh=DoFeQ6eBTcgaK/XpIiIY5JInXpjcMVs2sQEJX4E1LaY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RM728GTzVC/Fbdg8QrsjqKsZLv1y7Sp4bFfSjeFPuFvA1fLqNTjQX3z1BgOz90WST
	 Uz1+YwMkzMpCw/SPkwdasSUQoHBlGvL9/9ga1HyiXkhH55Vl2QKsizcNmcWVAYPdPc
	 WQhudcdhHpiYETF7AWMF0gwLm+LQuQqHVxAPCxrw=
Received: from mail.insite.cz ([127.0.0.1])
	by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ha4U18s2QCdN; Thu,  5 Oct 2023 16:30:46 +0200 (CEST)
Received: from [192.168.40.6] (unknown [192.168.100.40])
	(Authenticated sender: pavel)
	by mail.insite.cz (Postfix) with ESMTPSA id 3A7048334;
	Thu,  5 Oct 2023 16:30:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
	t=1696516246; bh=DoFeQ6eBTcgaK/XpIiIY5JInXpjcMVs2sQEJX4E1LaY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RM728GTzVC/Fbdg8QrsjqKsZLv1y7Sp4bFfSjeFPuFvA1fLqNTjQX3z1BgOz90WST
	 Uz1+YwMkzMpCw/SPkwdasSUQoHBlGvL9/9ga1HyiXkhH55Vl2QKsizcNmcWVAYPdPc
	 WQhudcdhHpiYETF7AWMF0gwLm+LQuQqHVxAPCxrw=
Message-ID: <004494f2-bd2b-9bdb-8f45-61b6aed6432b@ivitera.com>
Date: Thu, 5 Oct 2023 16:30:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: RFC: usb: gadget: u_audio: Notifying gadget that host started
 playback/capture?
Content-Language: en-US
To: Arun Raghavan <arun@arunraghavan.net>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Cc: Julian Scheel <julian@jusst.de>, Takashi Iwai <tiwai@suse.de>,
 Ruslan Bilovol <ruslan.bilovol@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
References: <6ebc2456-a46b-bc47-da76-7a341414c1fb@ivitera.com>
 <35766f0f-784d-d37a-6d07-665f9ee88331@ivitera.com>
 <27b4b607-5d71-4e5d-a0ff-530c25752213@app.fastmail.com>
 <4154b125-35c8-b15a-8706-54b9eb3cb5e0@ivitera.com>
 <2504b014-08b2-4f39-83f6-5072b5ec4ea8@app.fastmail.com>
From: Pavel Hofman <pavel.hofman@ivitera.com>
In-Reply-To: <2504b014-08b2-4f39-83f6-5072b5ec4ea8@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CMSDTZ2E37DELDFBNBGOX7KVUBXWRIG3
X-Message-ID-Hash: CMSDTZ2E37DELDFBNBGOX7KVUBXWRIG3
X-MailFrom: pavel.hofman@ivitera.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CMSDTZ2E37DELDFBNBGOX7KVUBXWRIG3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Dne 05. 10. 23 v 1:15 Arun Raghavan napsal(a):
> On Fri, 22 Sep 2023, at 3:09 AM, Pavel Hofman wrote:
>> Dne 21. 09. 23 v 3:30 Arun Raghavan napsal(a):
>>> Hi folks,
>>>
>>> On Fri, 1 Oct 2021, at 8:38 AM, Pavel Hofman wrote:
>>>> Hi,
>>>>
>>>
>>> Resurrecting this one -- is there any input on how we want to deal wit letting UAC gadgets know when the host is sending/receiving data?
>>
>> The current version uses the Playback/Capture Rate alsa ctls with
>> notifications
>> https://lore.kernel.org/all/20220121155308.48794-8-pavel.hofman@ivitera.com/
>>
>> Example of handling is e.g. https://github.com/pavhofman/gaudio_ctl ,
>> the controller is being used in a number of projects, mostly DIY.
>>
>> Recently Qualcomm devs have submitted patches for alternative approach
>> using uevents
>> https://lore.kernel.org/lkml/2023050801-handshake-refusing-0367@gregkh/T/#mcd6b346f3ddab6ab34792be0141633bb362d168f
>> and later versions. The detection is identical, monitoring change in
>> altsetting from 0 to non zero and back (methods
>> u_audio_[start/stop]_[capture/playback]), just a different means of
>> communicating the events to userspace.
>>
>> Both methods (using the same principle) suffer from not knowing what's
>> going on the host side and cannot differentiate between player really
>> starting playback vs. UAC2 host driver or Pulseaudio shortly checking
>> device availability. That's why the gaudio_ctl controller can debounce
>> the playback/capture start
>> https://github.com/pavhofman/gaudio_ctl#debouncing . But that is just an
>> ugly workaround...
> 
> Thank you for the links, Pavel! This all makes sense.
> 
> I guess the uevent mechanism is more "general" than the ALSA ctl for clients that want to plug in, listen and do $something. Not sure if there are other pros/cons of either approach.

If the gadget defines multiple samplerates, the client must look at the 
RATE alsa ctls for learn the actual rate requested by the host. The ctls 
provide both the rate and notification of playback/capture start/stop at 
the same time.

For gadgets with a single fixed samplerate, the alsa ctl vs. uevents 
methods are equivalent. Both may find their users and can be in the 
gadget code, IMO.

> 
> I wonder if it might not be good to have some debouncing in the kernel rather than having every client have to implement this.

I am afraid this would be a large feature (debouncing requires extra 
threads), I have not even tried to push it through. Much better would be 
having some nice solution instead of a workaround :-)

With regards,

Pavel.


