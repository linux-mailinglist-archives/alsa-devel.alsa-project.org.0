Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C255505B0
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Jun 2022 17:21:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C53941F29;
	Sat, 18 Jun 2022 17:20:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C53941F29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655565682;
	bh=NI6tf6V7pWVgXWgzvmf9DQLAS7b9ag0muF0Ck5yGFHg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JL4QjJuBEFbmICN+nGlnz8f6yUrB8hxp7FZpm5Oi7GsHB+an7Pv4zhzplp/YSPtu+
	 xvT6cmmLSB1V328E4GZ1mJQbnmVVl3K3fQsoyhfhHhtBxUSZ8MP+th9t9oJ0QmTRC5
	 /WhgkqeuXiuFWVDhNeIEttXyCf6KxFOTuYm14EFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30B41F804A9;
	Sat, 18 Jun 2022 17:20:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93AEBF8026D; Sat, 18 Jun 2022 17:20:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABB1FF80245
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 17:20:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABB1FF80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="rNQ3QeJE"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="EpE4Bwdx"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id B4E55A1A3D405
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 17:20:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1655565615; bh=NI6tf6V7pWVgXWgzvmf9DQLAS7b9ag0muF0Ck5yGFHg=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=rNQ3QeJEDSmTql72NVxYKq2eYnzJOVRqJuCawNOUCOcA1KsSjWdJAgI4zCebq95wM
 QRmPRN3oMC9Ixm34/mg9kxPubnRMuZzAJjuDZ1+7sgc7E5ejW7VsnB7xBeXuWa4f2h
 xhq4Egs1ieIodlzwoItNLaSXW2PFMizYGbW6klDw=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 98QefTCDOsa8 for <alsa-devel@alsa-project.org>;
 Sat, 18 Jun 2022 17:20:10 +0200 (CEST)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id F3C42A1A3D403
 for <alsa-devel@alsa-project.org>; Sat, 18 Jun 2022 17:20:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1655565610; bh=NI6tf6V7pWVgXWgzvmf9DQLAS7b9ag0muF0Ck5yGFHg=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=EpE4BwdxYjSk6WBuGwEpirzCGJ1TP/+d61oZ7vGKMWxU6BmG3WPaeT0AHHUHsO0m3
 9mppBe4uRqaCErdVdH1GjRJg8ex4q4FAK0XonDBi/WkNGRu6pENue8Q+18I0SunIal
 Fs9LX2+Te16cMmvU3VNDy946jqbQNIH5FwuS2WGI=
Message-ID: <52baec20-2ce3-75b6-98d5-faf49707ecf5@ivitera.com>
Date: Sat, 18 Jun 2022 17:20:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] aplay: Support setting timestamp
Content-Language: en-US
To: alsa-devel@alsa-project.org
References: <20220616065426.27915-1-pavel.hofman@ivitera.com>
 <YqrmNfnn2qCZV9Kf@workstation>
 <900e96c0-6251-fa3d-42b4-847ece6e1a44@ivitera.com>
 <Yq2Lfn+RJx96Qqvh@workstation>
From: Pavel Hofman <pavel.hofman@ivitera.com>
In-Reply-To: <Yq2Lfn+RJx96Qqvh@workstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



Dne 18. 06. 22 v 10:23 Takashi Sakamoto napsal(a):
> Hi,
> 
> On Thu, Jun 16, 2022 at 12:00:22PM +0200, Pavel Hofman wrote:
>> Dne 16. 06. 22 v 10:13 Takashi Sakamoto napsal(a):
>>>
>>> On Thu, Jun 16, 2022 at 08:54:26AM +0200, Pavel Hofman wrote:
>>>> To allow enabling timestamp and specify its type, a new option
>>>> --tstamp-type=TYPE is added. Recognized values are none (default),
>>>> gettimeofday, monotonic, monotonic-raw.
>>>>
>>>> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
>>>> ---
>>>>    aplay/aplay.1 |  4 ++++
>>>>    aplay/aplay.c | 32 ++++++++++++++++++++++++++++++++
>>>>    2 files changed, 36 insertions(+)
>>> I prefer the idea to work for timestamp feature defined in ALSA PCM
>>> interface, while I have a mixed feeling to integrate `aplay` tool, since
>>> I have an intension to obsolete the tool with `axfer` tool with more
>>> robust design with command argument compatibility (as much as possible).
>>>
>>> This is not so strong request but would I ask you to work for `axfer` tool
>>> instead of `aplay`? Then, it's preferable that the name of command
>>> argument is decided with enough care of all of timestamp feature in ALSA
>>> PCM interface, since we have two categories of timestamps at least; e.g.
>>> system timestamp and audio timestamp. As long as I know, they possibly use
>>> different clock sources, thus these two timestamps have different levels
>>> of clock id, I think.
>>>
>>> Of course, it's a loose accord in the community to obsolete `aplay`, and
>>> it's easy to decide to continue aplay integration. (I'm not in leading
>>> place of the project.) I'll be a bit happy if people take care of axfer
>>> tool as well.
>>
>> Thanks for your input. I use aplay in my project and needed to have tstamps
>> enabled in proc status files for my simple code which calculates relative
>> samplerate between capture and playback soundcards (one of them having rate
>> adjustable - audio gadget, snd-aloop)
>> https://mailman.alsa-project.org/pipermail/alsa-devel/2022-June/201647.html
> 
> I had read your message, then replied to the patch.
> 
> I'm not at so strong objection to your patch, however if I'm allowed to
> note my opinion honestly, it surely brings an issue in a point of
> application design. In short, the purpose of the patch is just for the
> case to retrieve the history of PCM buffer pointer position and system
> time stamp via procfs node for PCM substream of aplay for analysis,
> therefore it's not for aplay itself.
> 
> As you know, aplay program has no code to process time stamp except for
> the case of XRUN detection. I can easily imagine the future that the new
> command line option is rarely used, except at your laboratory or office.
> 
> 
> In my opinion, the better practice for your case is to add the way to
> configure parameters of PCM substream for time stamp operation; e.g. add
> kobject parameter to ALSA PCM device for PCM substream (please avoid to
> hack procfs node since it's ancient way in unregulated world).
> 
> Although it's probably and technically possible, it has side effect to
> user processes of existent ALSA PCM applications such as PipeWire plugins
> and PulseAudio modules when the applications voluntarily process time
> stamp for any purpose.
> 
>> . The existing aplay did not have this feature, so I added it and submitted
>> the patch. I did not know aplay was planned to be obsoleted, it seems to
>> receive a healthy stream of patches.
>   
>> As of the tstamp terminology - what command option would be more appropriate
>> instead? Thanks a lot,
> 
> It's a kind of sophisticated work, I think.
> 
> For your information, the design of several kinds of time stamp in ALSA
> PCM interface (from my memo written 2020) is below:
> 
>   - system time stamp
>      - Available for several purposes
>          - trigger (struct snd_pcm_status.trigger_tstamp)
>             - the record of time stamp at start/stop/suspend/resume/pause
>               of PCM substream.
>          - current (struct snd_pcm_status.tstamp)
>             - the record of the latest time stamp at updating hwptr, at
>               xrun and reset of PCM substream.
>          - driver (struct snd_pcm_status.driver_tstamp)
>             - the record of the latest time stamp when the driver operates
>               PCM substream at both hardIRQ/softIRQ and process contexts
>      - Multiple levels of clock_id
>         - monotinic time
>         - monotonic raw time
>         - real time (default, gettimeofday)
>      - The sampling timing at hardIRQ context is invocation of hardIRQ
>        handler instead of the time of actual interrupt request, thus
>        includes time jitter due to CPU-level IRQ-mask.
> 
>   - audio time stamp (struct snd_pcm_status.audio_tstamp,
>                       struct snd_pcm_mmap_status.audio_tstamp)
>      - timespec compensated for audio frame granularity
>      - Available when audio-related hardware supports specific function
>        to record time of DMA transmission or audio link.
>      - Currently, implemented for Intel HDA driver in Intel CPU (Skylate
>        generation or later) with Global Time Stamp (GTS) register.
>      - Multiple levels
>         - default
>             - computed just from hwptr
>         - link audio time
>         - link absolute audio time
>         - link estimated audio time
>         - link synchronized autio time
>      - For detail, please refer to
>        `Documentation/sound/designs/timestamping.rst`.
> 
> 

Takashi, I really do appreciate your comprehensive and very useful 
explanation. It should become part of core alsa documentation somehow, 
please.

But I cannot implement such extensive solution to either aplay or axfer, 
that's way above my skills and especially needs.

As I said in my previous message, I have axfer patch implementing the 
same feature as in my aplay patch. Should you find it usefull, I can 
submit it. You are the axfer maintainer, you call the shots :-)

Thanks a lot,

Pavel.
