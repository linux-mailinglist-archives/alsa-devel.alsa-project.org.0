Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 197893F3C3D
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Aug 2021 21:15:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BA391661;
	Sat, 21 Aug 2021 21:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BA391661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629573345;
	bh=NUTr8mdCjCpkd+gMrXbs5Q6OGoTuPgQU3DL7LnOF8Ro=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FxNBnirMV5DatW/lnvMTMVED4bpfX6dKqWb7En2bVf0uz/dnVxCALZ8cIf2oJYn0Y
	 gOnG66Fj3lr9QCa1dXUwXUdkoF3Bs4C/jeuPB1Rqd5zW6Y/TGqTe/9rSyaOqbQ+B9e
	 3+Km+PLUe66PLARjsleYsHuryjlpuucd62cuCAOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4B20F80272;
	Sat, 21 Aug 2021 21:14:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F77AF8026D; Sat, 21 Aug 2021 21:14:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B11E9F800EC
 for <alsa-devel@alsa-project.org>; Sat, 21 Aug 2021 21:14:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B11E9F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="Q7Wn6+cO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=N4q9WgqQeFeuuMy24N7bgAYr2tshBXp+VeO7mSioem8=; b=Q7Wn6+cOW//TIL0h720KsxS0GB
 XWiUYvIbFKh0vNX7P/TPBmZGChqt7IP9GU3Gr6TNGWUvjGumLAzR009RacPfQOCaKNEoL2o5hS06H
 n0CDBN1Xnbdk1OUZyAsiFbXRJG+JituvFWeZPV2VfZe7jVBkQUDrYdKRJUrfmHg90Z6gmNrSTUzGx
 mmppdohV/zSYq3dedO706P1KivVQ+MutyY1FAqopC4NabmmkvumfXDFFd2I7uLtdCUnTimKstj9Ch
 bayrdTo8uF9p6qKJ7X1nfUIlXUtckp2CZ/JJ7FufSn2WXBOrvI93xV95GytZOsD66sKk/7xDk5vW/
 rmeOycDg==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHWRV-00D7ME-Gn; Sat, 21 Aug 2021 19:14:09 +0000
Subject: Re: HDA codec problem
From: Randy Dunlap <rdunlap@infradead.org>
To: Takashi Iwai <tiwai@suse.de>
References: <12bbf54b-3ef6-8fa8-37fc-5f1e8d134bba@infradead.org>
 <s5hfsv48vk8.wl-tiwai@suse.de>
 <12443ca6-99dd-aea3-c35b-4c68ad0e0b31@infradead.org>
 <s5hczq86wac.wl-tiwai@suse.de>
 <775793c5-979a-169b-3634-e08e62284b36@infradead.org>
Message-ID: <9bd68132-7a91-6a4e-79c2-8adacf016bb9@infradead.org>
Date: Sat, 21 Aug 2021 12:14:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <775793c5-979a-169b-3634-e08e62284b36@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>
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

On 8/20/21 7:43 AM, Randy Dunlap wrote:
> On 8/20/21 7:11 AM, Takashi Iwai wrote:
>> On Fri, 20 Aug 2021 15:54:51 +0200,
>> Randy Dunlap wrote:
>>>
>>> On 8/19/21 11:44 PM, Takashi Iwai wrote:
>>>> On Fri, 20 Aug 2021 07:08:34 +0200,
>>>> Randy Dunlap wrote:
>>>>>
>>>>> Hi,
>>>>>
>>>>> I am having problems getting audio working on my computer:
>>>>>
>>>>> 00:1f.3 Audio device: Intel Corporation Device f1c8
>>>>>
>>>>> I did an internet search that said that I would need 5.13 or later to
>>>>> have support for this device.
>>>>
>>>> The above is Cometlake-H, and it pretty much depends on the machine
>>>> configuration.
>>>>
>>>>> openSUSE 15.3 kernel 5.3.18-59.19-default says:
>>>>>
>>>>> snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC233: line_outs=1 (0x1b/0x0/0x0/0x0/0x0) type:line
>>>>> snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
>>>>> snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
>>>>> snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
>>>>> snd_hda_codec_realtek hdaudioC0D0:    inputs:
>>>>> snd_hda_codec_realtek hdaudioC0D0:      Mic=0x1a
>>>>> snd_hda_codec_realtek hdaudioC0D0:      Mic=0x19
>>>>>
>>>>> but produces no sound output.
>>>>
>>>> FWIW, openSUSE Leap 15.3 kernel is based on 5.3 but got tons of
>>>> backports, hence its HD-audio part is almost equivalent with 5.13 or
>>>> later kernel (except for the recently changed mute-LED handling --
>>>> which must be irrelevant with your problem).
>>>>
>>>> The above indicates that the codec is detected and set up.  The rest
>>>> part is often some vendor-specific quirks.  For that, details are
>>>> missing completely.  At best please give alsa-info.sh output (run the
>>>> script with --no-upload and attach the output).
>>>>
>>>
>>> Oh, of course. Now attached.
>>
>> I see that the Headphone mixer switch is off by some reason.
>> But it should have been toggled by PulseAudio.
>>
>> You can test like:
>>    amixer -c0 set "Headphone" unmute
> 
> Simple mixer control 'Headphone',0
>    Capabilities: pvolume pswitch
>    Playback channels: Front Left - Front Right
>    Limits: Playback 0 - 87
>    Mono:
>    Front Left: Playback 87 [100%] [0.00dB] [on]
>    Front Right: Playback 87 [100%] [0.00dB] [on]
> 
> 
>> Also, just to be sure: did you install both pulseaudio and pipewire?
>> They may conflict.
> 
> Yes. pipewire is now gone.
> 
> Still no sound but I might need to restart...

Rebooting didn't help any. I didn't know what to try next,
so I did the easy thing: use Yast Sound to delete the device
configuration and then reconfigure it.
Fortunately that fixed it and the sound device is now working.

I had not use Yast Sound to configure the device. Maybe
pipewire did that automatically?  although I never ran
pipewire.

Anyway, it is all good now.  Thanks for your help.

-- 
~Randy

