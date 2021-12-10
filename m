Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A11DC46FFF4
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Dec 2021 12:33:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FD2A20DB;
	Fri, 10 Dec 2021 12:32:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FD2A20DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639135980;
	bh=WC3yHWSmgEqvitDRxqDxx3dms+8Jbme1gjcws6lqa1c=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bjSuTUJZgS+L1M0LTsHkyMjbJhDFVq8puDIgLcrDDwLUYN6jj52YyHoHnSghenI1d
	 dHic/9ljNESEDhWnKjGH5O0OdSP8emcXj9YClHWxMez2iSlmmjfwzvkVvdOt6axHjF
	 k+kSeDM5UWvhPzuJf4J4TJY5/cJ2nFYem+NpDNTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E90AF804E6;
	Fri, 10 Dec 2021 12:31:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 486D1F804EC; Fri, 10 Dec 2021 12:31:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=NICE_REPLY_A,PRX_BODY_135,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F6EDF804CC
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 12:31:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F6EDF804CC
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1mve7k-0007kh-OC; Fri, 10 Dec 2021 12:31:36 +0100
Message-ID: <977e3179-89a8-6abf-8a8f-7afe13c44dee@leemhuis.info>
Date: Fri, 10 Dec 2021 12:31:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Is it a regression? 5.15.5: No sound with speaker-test. 5.12.13:
 it works.
Content-Language: en-BZ
To: u34@net9.ga, Takashi Iwai <tiwai@suse.de>
References: <E1mrgJF-000RWu-7d@mx1.net9.ga> <s5hlf0wojv8.wl-tiwai@suse.de>
 <E1muw55-000WNp-Ui@mx1.net9.ga>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <E1muw55-000WNp-Ui@mx1.net9.ga>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1639135903;
 8f5a8c9b; 
X-HE-SMSGID: 1mve7k-0007kh-OC
Cc: alsa-devel@alsa-project.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
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


On 08.12.21 13:29, u34@net9.ga wrote:
> Takashi Iwai <tiwai@suse.de> wrote:
>> On Mon, 29 Nov 2021 14:03:05 +0100,
>> u34@net9.ga wrote:
>>>
>>> The following looks to me a regression in the linux sound driver.
>>> alsa-info.sh output is included at the bottom of this message. There are 2 
>>> outputs. An output with a 5.12.13 kernel. The other output is with a 
>>> 5.15.5. They were obtained with the same PC. With 5.12.13, the 
>>> speaker-test program works as expected. There is no sound when the 
>>> speaker-test program is ran with 5.15.5.
>>> 5.15.5 has 
>>>     options snd-hda-intel id=PCH index=0
>>>     options snd-hda-intel id=HDMI index=1
>>> , which 5.12.13 does not have.
>>
>> Both those lines conflict with each other, so they make no sense and
>> are already incorrect.
>>
>> If you want to swap the card indices inevitably needed, just pass a
>> single option line below instead.
>>
>>   options snd-hda-intel index=1,0
> 
> I have modified my setting as you suggested.
> 
> speaker-test is now producing sound with both 5.12.13, and 5.15.5. Which is 
> actualy 5.15.6, not 5.15.5, by now. It got upgraded a few days ago. I don't 
> know what is the exact change that made it working. I have done several 
> other chnages in the last couple of days.
> [...]

Sounds to me like "there might still be a small problem lurking there,
but things are working now for the reporter and maybe the problem was
caused by something else anyway", so I guess I'll remove in from the
regression tracking.

#regzbot invalid: things are working again, what exactly helped remains
unkown
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'Linux kernel regression tracker' hat).

P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
on my table. I can only look briefly into most of them. Unfortunately
therefore I sometimes will get things wrong or miss something important.
I hope that's not the case here; if you think it is, don't hesitate to
tell me about it in a public reply. That's in everyone's interest, as
what I wrote above might be misleading to everyone reading this; any
suggestion I gave thus might sent someone reading this down the wrong
rabbit hole, which none of us wants.

BTW, I have no personal interest in this issue, which is tracked using
regzbot, my Linux kernel regression tracking bot
(https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
this mail to get things rolling again and hence don't need to be CC on
all further activities wrt to this regression.
