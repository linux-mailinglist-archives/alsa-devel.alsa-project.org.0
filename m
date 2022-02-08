Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 308BD4AD831
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 13:15:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3F6F16FE;
	Tue,  8 Feb 2022 13:15:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3F6F16FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644322555;
	bh=jIk/BE1mxNOFD8lbIJ5kHJ3c9C57V8qajNoNjPU1lRg=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JL5r2LIpEIPqXX63ZLi/5W2c79lI7w8ToPN2q4vZC/9xyogBr+x3IAgD9EQPSsJhO
	 bHyctWup6x31Yz19d8BsF+ouQp9u6twK5GDCqIDIUexDSik3oLxi35WGTXXv20kC7r
	 K9o1j9zBACLvaxdhKFk7ZMxZBOXqGoWNE3cdoPTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10E01F8012B;
	Tue,  8 Feb 2022 13:14:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5643AF8013C; Tue,  8 Feb 2022 13:14:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=NICE_REPLY_A,PRX_BODY_135,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA209F800F0
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 13:14:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA209F800F0
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1nHPON-00026R-MF; Tue, 08 Feb 2022 13:14:43 +0100
Message-ID: <e4d45921-ebe2-a06a-5f86-eac981d75e8d@leemhuis.info>
Date: Tue, 8 Feb 2022 13:14:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Bug 215561 - snd-usb-audio:reset_resume error -22 after suspend
 (fwd from bugzilla)
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <a8100c3d-007e-3207-7dc1-92849f638d71@leemhuis.info>
In-Reply-To: <a8100c3d-007e-3207-7dc1-92849f638d71@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1644322486;
 03dea8a9; 
X-HE-SMSGID: 1nHPON-00026R-MF
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
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

Hi, this is your Linux kernel regression tracker speaking.

Top-posting for once, to make this easy accessible to everyone.

Below issue is one of those those reports that seem to get stranded in
bugzilla.kernel.org

Greg, Jaroslav, Takashi, could one of you please take a look? The
reporter submitted it as USB bug, but maybe that wasn't a wise choice.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.

#regzbot poke

On 03.02.22 15:59, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> There is a regression in bugzilla.kernel.org I'd like to add to the
> tracking:
> 
> #regzbot introduced: v5.15..v5.16
> #regzbot from: antifermion@protonmail.com <antifermion@protonmail.com>
> #regzbot title: snd: usb: snd-usb-audio:reset_resume error -22 after suspen
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215561
> 
> Quote:
> 
>> If I use the microphone, then suspend and wake up again, I get the error
>>
>> ```
>> snd-usb-audio 1-5:1.0: reset_resume error -22
>> ```
>>
>> Aftewards, audio stops working completely. Both pipewire and pulseaudio (tried both; not at the same time) freeze.
>>
>> After running
>>
>> ```
>> rmmod -f snd_usb_audio
>> ```
>>
>> and replugging the microphone, audio works again.
>> Here is the relevant log:
>>
>> ```
>> [  157.791937] usbcore: deregistering interface driver snd-usb-audio
>> [  228.517855] usb 1-5: USB disconnect, device number 2
>> [  236.464334] usb 1-5: new high-speed USB device number 3 using xhci_hcd
>> [  236.798863] usb 1-5: New USB device found, idVendor=0d8c, idProduct=0171, bcdDevice= 1.04
>> [  236.798867] usb 1-5: New USB device strings: Mfr=3, Product=1, SerialNumber=0
>> [  236.798869] usb 1-5: Product: USB 2.0 HD Audio
>> [  236.798871] usb 1-5: Manufacturer: C-Media Electronics Inc.
>> [  236.826966] input: C-Media Electronics Inc. USB 2.0 HD Audio Consumer Control as /devices/pci0000:00/0000:00:01.3/0000:02:00.0/usb1/1-5/1-5:1.3/0003:0D8C:0171.000B/input/input40
>> [  236.878380] input: C-Media Electronics Inc. USB 2.0 HD Audio as /devices/pci0000:00/0000:00:01.3/0000:02:00.0/usb1/1-5/1-5:1.3/0003:0D8C:0171.000B/input/input41
>> [  236.878447] hid-generic 0003:0D8C:0171.000B: input,hiddev96,hidraw2: USB HID v1.11 Device [C-Media Electronics Inc. USB 2.0 HD Audio] on usb-0000:02:00.0-5/input3
>> [  242.306593] usbcore: registered new interface driver snd-usb-audio
>>
>> ```
>>
>> I'm running Arch Linux (5.16.4.arch1-1). The linux-lts kernel (5.15.18-1) works fine.
>>
>> Other uses report the same error: https://bbs.archlinux.org/viewtopic.php?id=273469
> 
> Ciao, Thorsten (wearing his 'Linux kernel regression tracker' hat)
> 
> P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
> on my table. I can only look briefly into most of them. Unfortunately
> therefore I sometimes will get things wrong or miss something important.
> I hope that's not the case here; if you think it is, don't hesitate to
> tell me about it in a public reply, that's in everyone's interest.
> 
> BTW, I have no personal interest in this issue, which is tracked using
> regzbot, my Linux kernel regression tracking bot
> (https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
> this mail to get things rolling again and hence don't need to be CC on
> all further activities wrt to this regression.
> 
> ---
> Additional information about regzbot:
> 
> If you want to know more about regzbot, check out its web-interface, the
> getting start guide, and/or the references documentation:
> 
> https://linux-regtracking.leemhuis.info/regzbot/
> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md
> 
> The last two documents will explain how you can interact with regzbot
> yourself if your want to.
> 
> Hint for reporters: when reporting a regression it's in your interest to
> tell #regzbot about it in the report, as that will ensure the regression
> gets on the radar of regzbot and the regression tracker. That's in your
> interest, as they will make sure the report won't fall through the
> cracks unnoticed.
> 
> Hint for developers: you normally don't need to care about regzbot once
> it's involved. Fix the issue as you normally would, just remember to
> include a 'Link:' tag to the report in the commit message, as explained
> in Documentation/process/submitting-patches.rst
> That aspect was recently was made more explicit in commit 1f57bd42b77c:
> https://git.kernel.org/linus/1f57bd42b77c
