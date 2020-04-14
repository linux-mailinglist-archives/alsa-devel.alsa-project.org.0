Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1461A877E
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 19:28:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0486A16AC;
	Tue, 14 Apr 2020 19:27:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0486A16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586885327;
	bh=RZxE4FNIltq8E1s0p2aUPzfk788TQP8nxivhgBF82fU=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aHmg6iJ7wFkjSurWsz0HpLxg1dJ6CGugP/wGcHKrVXq2tZuxoHXzY0OwXf3V7lyuy
	 g5U8z947pEbvCWAsyJZGRLCcomhZOkJFIj9XWfwj83XJgVOyy6xMvURny1cNlH0bhx
	 CFtz8v6LqEr/9FRWa9pr26pbGX2LM7tXo1IVo7Go=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AE9FF8014E;
	Tue, 14 Apr 2020 19:27:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F193F8014E; Tue, 14 Apr 2020 19:27:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mupuf.org (mupuf.org [167.71.42.210])
 by alsa1.perex.cz (Postfix) with ESMTP id DBE03F800F5
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 19:26:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBE03F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=spliet.org header.i=@spliet.org
 header.b="V/8nLb7G"
Received: from [10.42.0.61] (unknown [131.111.247.158])
 by Neelix.spliet.org (Postfix) with ESMTPSA id 8AA3C6004C;
 Tue, 14 Apr 2020 18:26:37 +0100 (BST)
DKIM-Filter: OpenDKIM Filter v2.11.0 Neelix.spliet.org 8AA3C6004C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=spliet.org;
 s=default; t=1586885197;
 bh=WAGVbe9s+IQTyoHTZVjJ6NNWyY1ud+Al7F+tkHZdHZ4=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=V/8nLb7Gaxa1OPjEWG6smQS2Hfizlg3el2563HTYIc1QemVtecE6gCv2XbAUBLkS1
 9EiceP1CshfUEGyltKZ3ogGrJfrhX+mI6g/ywP5Qq4E8dfraQKUZtAhXu6IyqeVi2p
 8nUSiCoIYHOEMd6hT9R3DV1QYf2cVzrnex2oy/Tc=
Subject: Re: [FRUSTRATED] Missing Sound Codecs for Lenovo ThinkCentre M710e
To: Michael <michael@wizard.ca>, alsa-devel@alsa-project.org
References: <7046b5fa-af79-5221-f54f-3d4be22e879e@wizard.ca>
 <34cfffec-39f7-d0e5-bab6-c4b0eb47943b@spliet.org>
 <8ab4b52c-5397-0fed-97ff-c8be7d4ae168@wizard.ca>
From: Roy Spliet <nouveau@spliet.org>
Message-ID: <f6a49c86-5c99-6405-4717-a13c1c663d0c@spliet.org>
Date: Tue, 14 Apr 2020 18:26:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <8ab4b52c-5397-0fed-97ff-c8be7d4ae168@wizard.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.102.2 at Neelix
X-Virus-Status: Clean
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

Op 14-04-2020 om 18:13 schreef Michael:
> Appreciate the response, but running the 16.04 LTE with the hwe kernel, 
> which should have updated support.  I would expect that at least an 
> older codec should be supported on the board, highly doubt a completely 
> new sound card shipset would be used.
> 
> How do I try to resolve this WITHOUT going to a 5.6 kernel?

That's a question for the people over at Ubuntu. Upstream people like 
the ones on this mailing list generally don't do distribution support. 
Most of them have no idea what Ubuntu did to their kernel, and which 
updates they did and didn't pull into their tree. It's not their job to 
try and debug problems they could well have already solved a year ago; 
that's just a waste of developers' time. If Ubuntu decides to patch up 
and ship an outdated kernel, they get to take responsibility for it.
Meanwhile, my well-meant advice stands: try an up-to-date kernel. If the 
problem persists, you can file a bug and get a developers' attention. If 
the problem goes away but you really really want to keep running 
Ubuntu's 4.15.0 kernel branch, you can persuade Ubuntu to pull relevant 
fixes into their 4.15.0 branch and release an update.

Roy

> 
> On 2020-04-14 8:55 a.m., Roy Spliet wrote:
>> The 4.15.0 kernel was released in January 2018. Your computer was 
>> first sold around May 2018 (at least where I'm from). It's hardly 
>> surprising that some components in your computer aren't supported. 
>> First try upgrading to a newer kernel (ideally 5.6) before you try 
>> other steps to debug your issues.
>>
>> Roy
>>
>> Op 14-04-2020 om 15:16 schreef Michael:
>>> Hi All,
>>>
>>> Technically this probably should go to a support channnel, and not a 
>>> development list, but at my wits end.
>>>
>>> Kernel:  4.15.0-91-generic #92~16.04.1-Ubuntu SMP
>>>
>>> dmesg | grep snd
>>> [   12.656843] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops 
>>> i915_audio_component_bind_ops [i915])
>>> [   12.807521] snd_hda_intel 0000:00:1f.3: CORB reset timeout#1, 
>>> CORBRP = 0
>>> [   12.810429] snd_hda_intel 0000:00:1f.3: no codecs found!
>>>
>>> I have been playing with settings in the modprobe directory for Also 
>>> with no effect.. current settings are..
>>>
>>> options snd-hda-intel single_cmd=1
>>> options snd-hda-intel probe_mask=1
>>> options snd-hda-intel model=thinkpad
>>> options snd-hda-intel position_fix=3
>>>
>>> Have tried model=generic, and various other suggestions from online, 
>>> but at a loss.  Don't see anything in:
>>>
>>> https://github.com/torvalds/linux/blob/master/Documentation/sound/hd-audio/models.rst 
>>>
>>>
>>> Your ALSA information is located at 
>>> http://alsa-project.org/db/?f=7898b30139e9a91fecec22f3ee46049f33248b85
>>>
>>> Can anyone point me to how to debug this further, or any way to force 
>>> detection of a proper codec for this model?
>>>
>>> 00:1f.3 Audio device [0403]: Intel Corporation 200 Series PCH HD 
>>> Audio [8086:a2f0]
>>>      Subsystem: Lenovo Device [17aa:313c]
>>>      Kernel driver in use: snd_hda_intel
>>>
>>>
>>>         description: Motherboard
>>>         product: 313C
>>>         vendor: LENOVO
>>>         physical id: 0
>>>         version: SDK0J40697 WIN 3305181519567
>>>         slot: Default string
>>>
>>> Booting in legacy OS mode, not EUFI..
>>>
>>>
>>>
> 
> 
