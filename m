Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6DD2B1E1
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 12:13:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4080F17A0;
	Mon, 27 May 2019 12:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4080F17A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558952008;
	bh=OZyQdUFiata9EpKp2qqxC5n9bANf8wEfsRvMoee9dhM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vsUOITYLeeqvGPx37f0JrUmzXsFSy1xzwd5iCVq6H/nSV/CQs10Vtytdvd6/KmBZI
	 U7cS6Yy5lNPrllELWr7q7u6B7jcd0XLWHMYm7l5t6Z9TuAPfuSOww8UJ5BVUPyEdIJ
	 b/dwuF6XkS7g/NEwPoafkWetgnlAMW7hkWvxFXgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A82A5F896E4;
	Mon, 27 May 2019 12:11:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18A01F896E4; Mon, 27 May 2019 12:11:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0AB9F8065A
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 12:11:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0AB9F8065A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="irQ8fXsg"
Received: by mail-qk1-x743.google.com with SMTP id m18so17013116qki.8
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 03:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+Mrn9xH3qUhlvfW6bbidVzNrbKvDYjpV1uJMFUADS1c=;
 b=irQ8fXsgXpycBo1/06H14wptYuGF7PJZP/OllVkUuLf0C6msv4SOuLWZMTHdjYKc1h
 H5A/07JRx4UFS713XPrehfZVi8K9bLTIXWqQa1Qmxo4kfXbP1EEQknjo2aS0e7XaSyFK
 zrslsTPHTMY6shCRz5hYrz67HcdFpqUZlihjf2oPfnYNiT6Ms2xQlg4n1SUHxSiiWiOf
 +LDMYXp1GUs/H1/S9doEjgReJDsvlX6PU6b0QS6FshDjwO8QcnjhZ9LmX8BdLb8zQzvR
 sjQ9vzZ8yKm5rd/qDxQONRXmjcIEJ7/Cs5jGdvN3dMRXl/Bo9oU9I3KmyZInwbFq7GtE
 avrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Mrn9xH3qUhlvfW6bbidVzNrbKvDYjpV1uJMFUADS1c=;
 b=AHG6uo8JjSOohdKs0eUFEqZ+zkoM7SzrgGkuLGbdt9ZD/VkTGsC+Bk9yJESBRbpjGF
 mCCdmZgBcTAfq2LExBx0gHOfaelgazpqitWH5jqBRVfv1zNYHGk03TpxWq1W2s6Ahzf2
 tc+bXdyuzg613MGunRrO9I6Hx7BYFdpieb7lmyljhd9AEwzvj6pNt6QnABXcjcchxUcW
 UOA2r8tIiSoqR1U5mOZZUoW3Ml+GrNunE9uZHAY2lQDgvMxPPena6Q7GlfUKjUei5P7g
 OI0QwJsJ7uTfq/TAMhTRa+COOy8C88iFnXbguETeH9ZzswkubLTZ2Y2kZEEpoBPRh+C9
 +iOQ==
X-Gm-Message-State: APjAAAU/sONw98FoNiNw02e/iPqqv+nTfYrNskctD5JDEo3N5s/lsaeg
 GA+MAvxiqU/IsLxRLuNHovaJPIv5VcXR1HGOnIW35oer
X-Google-Smtp-Source: APXvYqztGim4XJJKBRmhWWOr7TC9blx80os+PzwhHaO+/55aBi+G8bGLt6bg6cIrqEf2x0PNcje5YHC/nVx9ydNhMf0=
X-Received: by 2002:a0c:92c2:: with SMTP id c2mr77866468qvc.145.1558951895593; 
 Mon, 27 May 2019 03:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAKbjie7OEVyB4vq4L01p2ov3Vo3Mw+3edLQxwT2eVhzaj-Cu0g@mail.gmail.com>
 <s5hftreapj1.wl-tiwai@suse.de>
 <CAKbjie63rA-gj+m2ZvtMJY4_FZSopt=ef2nVm6NSqS2wm8kw0A@mail.gmail.com>
 <s5hmulmq279.wl-tiwai@suse.de>
 <CAKbjie7oiqbT=6Y2RT06fZjwAX42oumTSSjcHY=Vs4o-q+r7-g@mail.gmail.com>
 <CAKbjie7MAJPTOF0QYzikjEu7eNovqtYQoDEjEMFsP3VvCfgMEQ@mail.gmail.com>
 <s5hwoicxluk.wl-tiwai@suse.de>
In-Reply-To: <s5hwoicxluk.wl-tiwai@suse.de>
From: Paulo Fidalgo <paulo.fidalgo.pt@gmail.com>
Date: Mon, 27 May 2019 11:11:24 +0100
Message-ID: <CAKbjie6kJy31FK+Pjgvj+OJSBngbygzCDd5dwXkmpQ+dKwwFXQ@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Dell XPS 9360 continuous hissing sound
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Sure,

Can you point me to an updated doc? I'm using fedora, if there's
anything specific.

Kind regards,

Paulo Fidalgo

On Mon, 27 May 2019 at 10:55, Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 27 May 2019 11:48:36 +0200,
> Paulo Fidalgo wrote:
> >
> > Since I don't know if you are waiting for the command output or not I
> > will provide it:
> >
> > After a reboot with the headset unplugged:
> >
> > amixer -c0 cget numid=10
> > numid=10,iface=MIXER,name='Headphone Mic Boost Volume'
> >   ; type=INTEGER,access=rw---R--,values=2,min=0,max=3,step=0
> >   : values=0,0
> >   | dBscale-min=0.00dB,step=10.00dB,mute=0
> >
> > After a reboot with the headset plugged I have the same value:
> >
> > amixer -c0 cget numid=10
> > numid=10,iface=MIXER,name='Headphone Mic Boost Volume'
> >   ; type=INTEGER,access=rw---R--,values=2,min=0,max=3,step=0
> >   : values=0,0
> >   | dBscale-min=0.00dB,step=10.00dB,mute=0
> >
> >
> > Also when the headset is plugged the mic, seems to not be detected, as
> > it keeps with the internal mic of the laptop, but I will create
> > another thread for that.
>
> Could you try the latest for-linus branch of sound.git tree?
> Now we disable the poewr_save_node flag as default for some Realtek
> codecs, and this might influence on such behavior.
>
>
> thanks,
>
> Takashi
>
> >
> > Kind regards,
> >
> > Paulo Fidalgo
> >
> > On Thu, 16 May 2019 at 15:45, Paulo Fidalgo <paulo.fidalgo.pt@gmail.com> wrote:
> > >
> > > Since I don't know if you are waiting for the command output or not I
> > > will provide it:
> > >
> > > After a reboot with the headset unplugged:
> > >
> > > amixer -c0 cget numid=10
> > > numid=10,iface=MIXER,name='Headphone Mic Boost Volume'
> > >   ; type=INTEGER,access=rw---R--,values=2,min=0,max=3,step=0
> > >   : values=0,0
> > >   | dBscale-min=0.00dB,step=10.00dB,mute=0
> > >
> > > After a reboot with the headset plugged I have the same value:
> > >
> > > amixer -c0 cget numid=10
> > > numid=10,iface=MIXER,name='Headphone Mic Boost Volume'
> > >   ; type=INTEGER,access=rw---R--,values=2,min=0,max=3,step=0
> > >   : values=0,0
> > >   | dBscale-min=0.00dB,step=10.00dB,mute=0
> > >
> > >
> > > Also when the headset is plugged the mic, seems to not be detected, as
> > > it keeps with the internal mic of the laptop, but I will create
> > > another thread for that.
> > >
> > > Kind regards,
> > >
> > > Paulo Fidalgo
> > >
> > >
> > > On Fri, 22 Mar 2019 at 16:54, Takashi Iwai <tiwai@suse.de> wrote:
> > > >
> > > > On Fri, 22 Mar 2019 17:07:15 +0100,
> > > > Paulo Fidalgo wrote:
> > > > >
> > > > > Strangely the command returns amixer: Unable to find simple control 'numid=10',0
> > > > > So I've runned "amixer -c0" and you can find the output in before.txt
> > > >
> > > > Ah sorry, it was a typo: use "cget" instead of "get".
> > > >
> > > >
> > > > > Then I've runned amixer -c 0 cset 'numid=10' 1
> > > > > and again the "amixer -c0" and you can find the output in after.txt
> > > > >
> > > > > Also I've notice that the sound appears after I playing a music on
> > > > > computer and goes a few (like 10 ) seconds after the music stopped.
> > > >
> > > > It sounds like a state after runtime PM.
> > > >
> > > >
> > > > Takashi
> > > >
> > > > >
> > > > > On Fri, 22 Mar 2019 at 15:37, Takashi Iwai <tiwai@suse.de> wrote:
> > > > > >
> > > > > > On Fri, 22 Mar 2019 12:40:22 +0100,
> > > > > > Paulo Fidalgo wrote:
> > > > > > >
> > > > > > > Hi!
> > > > > > >
> > > > > > > After a bug report on Fedora
> > > > > > > (https://bugzilla.redhat.com/show_bug.cgi?id=1677353)
> > > > > > >
> > > > > > > ----
> > > > > > > When I start t he computer I hears a continuous background noise. The
> > > > > > > problem is also described here:
> > > > > > > https://wiki.archlinux.org/index.php/Dell_XPS_13_(9360)#Continuous_hissing_sound_with_headphones
> > > > > > >
> > > > > > > I need to issue the command `amixer -c 0 cset 'numid=10' 1` to solve
> > > > > > > the problem, but every time I reboot the computer I need to run it
> > > > > > > again.
> > > > > > > This has been happening for quite some time, but I've been post-poning
> > > > > > > the bug report.
> > > > > >
> > > > > > What is the original value before setting this amixer command above?
> > > > > > You can get via "amixer -c0 get numid=10'.
> > > > > >
> > > > > > Does the noise again when you restore the value after setting to 1 in
> > > > > > the above?
> > > > > >
> > > > > >
> > > > > > Takashi
> > > > > >
> > > > > > >
> > > > > > > Current kernel: 4.20.7-200.fc29.x86_64
> > > > > > >
> > > > > > > Alsa information:
> > > > > > > http://www.alsa-project.org/db/?f=df4834c53335709abb521c767e7b1da2f4371744
> > > > > > > ----
> > > > > > > They advise me to contact you, to see if we can get a solution on this.
> > > > > > >
> > > > > > > Note: The computer also does not recognise (switch to) when I plug an headset.
> > > > > > >
> > > > > > > If you need more information, I'm eager to help diagnose and help to
> > > > > > > solve this, but I have no Kernel programming skills, other than that
> > > > > > > count on me.
> > > > > > >
> > > > > > > Kind regards,
> > > > > > >
> > > > > > > Paulo Fidalgo
> > > > > > >
> > > > > Simple mixer control 'Master',0
> > > > >   Capabilities: pvolume pvolume-joined pswitch pswitch-joined
> > > > >   Playback channels: Mono
> > > > >   Limits: Playback 0 - 87
> > > > >   Mono: Playback 87 [100%] [0.00dB] [on]
> > > > > Simple mixer control 'Headphone',0
> > > > >   Capabilities: pvolume pswitch
> > > > >   Playback channels: Front Left - Front Right
> > > > >   Limits: Playback 0 - 87
> > > > >   Mono:
> > > > >   Front Left: Playback 87 [100%] [0.00dB] [on]
> > > > >   Front Right: Playback 87 [100%] [0.00dB] [on]
> > > > > Simple mixer control 'Headphone Mic',0
> > > > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > > > >   Capture exclusive group: 0
> > > > >   Capture channels: Mono
> > > > >   Mono: Capture [off]
> > > > > Simple mixer control 'Headphone Mic Boost',0
> > > > >   Capabilities: volume
> > > > >   Playback channels: Front Left - Front Right
> > > > >   Capture channels: Front Left - Front Right
> > > > >   Limits: 0 - 3
> > > > >   Front Left: 1 [33%] [10.00dB]
> > > > >   Front Right: 1 [33%] [10.00dB]
> > > > > Simple mixer control 'Speaker',0
> > > > >   Capabilities: pvolume pswitch
> > > > >   Playback channels: Front Left - Front Right
> > > > >   Limits: Playback 0 - 87
> > > > >   Mono:
> > > > >   Front Left: Playback 0 [0%] [-65.25dB] [off]
> > > > >   Front Right: Playback 0 [0%] [-65.25dB] [off]
> > > > > Simple mixer control 'PCM',0
> > > > >   Capabilities: pvolume
> > > > >   Playback channels: Front Left - Front Right
> > > > >   Limits: Playback 0 - 255
> > > > >   Mono:
> > > > >   Front Left: Playback 255 [100%] [0.00dB]
> > > > >   Front Right: Playback 255 [100%] [0.00dB]
> > > > > Simple mixer control 'IEC958',0
> > > > >   Capabilities: pswitch pswitch-joined
> > > > >   Playback channels: Mono
> > > > >   Mono: Playback [off]
> > > > > Simple mixer control 'IEC958',1
> > > > >   Capabilities: pswitch pswitch-joined
> > > > >   Playback channels: Mono
> > > > >   Mono: Playback [on]
> > > > > Simple mixer control 'IEC958',2
> > > > >   Capabilities: pswitch pswitch-joined
> > > > >   Playback channels: Mono
> > > > >   Mono: Playback [on]
> > > > > Simple mixer control 'IEC958',3
> > > > >   Capabilities: pswitch pswitch-joined
> > > > >   Playback channels: Mono
> > > > >   Mono: Playback [on]
> > > > > Simple mixer control 'IEC958',4
> > > > >   Capabilities: pswitch pswitch-joined
> > > > >   Playback channels: Mono
> > > > >   Mono: Playback [on]
> > > > > Simple mixer control 'Capture',0
> > > > >   Capabilities: cvolume cswitch
> > > > >   Capture channels: Front Left - Front Right
> > > > >   Limits: Capture 0 - 63
> > > > >   Front Left: Capture 63 [100%] [30.00dB] [on]
> > > > >   Front Right: Capture 63 [100%] [30.00dB] [on]
> > > > > Simple mixer control 'Auto-Mute Mode',0
> > > > >   Capabilities: enum
> > > > >   Items: 'Disabled' 'Enabled'
> > > > >   Item0: 'Disabled'
> > > > > Simple mixer control 'Headset Mic',0
> > > > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > > > >   Capture exclusive group: 0
> > > > >   Capture channels: Mono
> > > > >   Mono: Capture [on]
> > > > > Simple mixer control 'Headset Mic Boost',0
> > > > >   Capabilities: volume
> > > > >   Playback channels: Front Left - Front Right
> > > > >   Capture channels: Front Left - Front Right
> > > > >   Limits: 0 - 3
> > > > >   Front Left: 1 [33%] [10.00dB]
> > > > >   Front Right: 1 [33%] [10.00dB]
> > > > > Simple mixer control 'Internal Mic',0
> > > > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > > > >   Capture exclusive group: 0
> > > > >   Capture channels: Mono
> > > > >   Mono: Capture [off]
> > > > > Simple mixer control 'Internal Mic Boost',0
> > > > >   Capabilities: volume
> > > > >   Playback channels: Front Left - Front Right
> > > > >   Capture channels: Front Left - Front Right
> > > > >   Limits: 0 - 3
> > > > >   Front Left: 0 [0%] [0.00dB]
> > > > >   Front Right: 0 [0%] [0.00dB]
> > > > > Simple mixer control 'Master',0
> > > > >   Capabilities: pvolume pvolume-joined pswitch pswitch-joined
> > > > >   Playback channels: Mono
> > > > >   Limits: Playback 0 - 87
> > > > >   Mono: Playback 83 [95%] [-3.00dB] [on]
> > > > > Simple mixer control 'Headphone',0
> > > > >   Capabilities: pvolume pswitch
> > > > >   Playback channels: Front Left - Front Right
> > > > >   Limits: Playback 0 - 87
> > > > >   Mono:
> > > > >   Front Left: Playback 87 [100%] [0.00dB] [on]
> > > > >   Front Right: Playback 87 [100%] [0.00dB] [on]
> > > > > Simple mixer control 'Headphone Mic',0
> > > > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > > > >   Capture exclusive group: 0
> > > > >   Capture channels: Mono
> > > > >   Mono: Capture [off]
> > > > > Simple mixer control 'Headphone Mic Boost',0
> > > > >   Capabilities: volume
> > > > >   Playback channels: Front Left - Front Right
> > > > >   Capture channels: Front Left - Front Right
> > > > >   Limits: 0 - 3
> > > > >   Front Left: 0 [0%] [0.00dB]
> > > > >   Front Right: 0 [0%] [0.00dB]
> > > > > Simple mixer control 'Speaker',0
> > > > >   Capabilities: pvolume pswitch
> > > > >   Playback channels: Front Left - Front Right
> > > > >   Limits: Playback 0 - 87
> > > > >   Mono:
> > > > >   Front Left: Playback 0 [0%] [-65.25dB] [off]
> > > > >   Front Right: Playback 0 [0%] [-65.25dB] [off]
> > > > > Simple mixer control 'PCM',0
> > > > >   Capabilities: pvolume
> > > > >   Playback channels: Front Left - Front Right
> > > > >   Limits: Playback 0 - 255
> > > > >   Mono:
> > > > >   Front Left: Playback 255 [100%] [0.00dB]
> > > > >   Front Right: Playback 255 [100%] [0.00dB]
> > > > > Simple mixer control 'IEC958',0
> > > > >   Capabilities: pswitch pswitch-joined
> > > > >   Playback channels: Mono
> > > > >   Mono: Playback [off]
> > > > > Simple mixer control 'IEC958',1
> > > > >   Capabilities: pswitch pswitch-joined
> > > > >   Playback channels: Mono
> > > > >   Mono: Playback [on]
> > > > > Simple mixer control 'IEC958',2
> > > > >   Capabilities: pswitch pswitch-joined
> > > > >   Playback channels: Mono
> > > > >   Mono: Playback [on]
> > > > > Simple mixer control 'IEC958',3
> > > > >   Capabilities: pswitch pswitch-joined
> > > > >   Playback channels: Mono
> > > > >   Mono: Playback [on]
> > > > > Simple mixer control 'IEC958',4
> > > > >   Capabilities: pswitch pswitch-joined
> > > > >   Playback channels: Mono
> > > > >   Mono: Playback [on]
> > > > > Simple mixer control 'Capture',0
> > > > >   Capabilities: cvolume cswitch
> > > > >   Capture channels: Front Left - Front Right
> > > > >   Limits: Capture 0 - 63
> > > > >   Front Left: Capture 63 [100%] [30.00dB] [on]
> > > > >   Front Right: Capture 63 [100%] [30.00dB] [on]
> > > > > Simple mixer control 'Auto-Mute Mode',0
> > > > >   Capabilities: enum
> > > > >   Items: 'Disabled' 'Enabled'
> > > > >   Item0: 'Disabled'
> > > > > Simple mixer control 'Headset Mic',0
> > > > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > > > >   Capture exclusive group: 0
> > > > >   Capture channels: Mono
> > > > >   Mono: Capture [on]
> > > > > Simple mixer control 'Headset Mic Boost',0
> > > > >   Capabilities: volume
> > > > >   Playback channels: Front Left - Front Right
> > > > >   Capture channels: Front Left - Front Right
> > > > >   Limits: 0 - 3
> > > > >   Front Left: 1 [33%] [10.00dB]
> > > > >   Front Right: 1 [33%] [10.00dB]
> > > > > Simple mixer control 'Internal Mic',0
> > > > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > > > >   Capture exclusive group: 0
> > > > >   Capture channels: Mono
> > > > >   Mono: Capture [off]
> > > > > Simple mixer control 'Internal Mic Boost',0
> > > > >   Capabilities: volume
> > > > >   Playback channels: Front Left - Front Right
> > > > >   Capture channels: Front Left - Front Right
> > > > >   Limits: 0 - 3
> > > > >   Front Left: 0 [0%] [0.00dB]
> > > > >   Front Right: 0 [0%] [0.00dB]
> >
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
