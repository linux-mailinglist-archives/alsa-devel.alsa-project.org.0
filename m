Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E887F2B196
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2019 11:50:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 556431708;
	Mon, 27 May 2019 11:49:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 556431708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558950639;
	bh=oTqRrA7iDuHklGjXR4t3F8h3z/Ec0r9DYNH1Cb6flCI=;
	h=References:In-Reply-To:From:Date:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z2cjWloaKHvz9lArEsJj3PJrr1kTFF5/U27hoJ5BkjqIjtmvrlM+UxlkzZG5HWjUA
	 RlIVUkGsnArvOxwbCytWJkPgJEvNJnkf/+zaaUQE0+vWlKqc7MOU33604nmznz8sEa
	 b2PHsRzH2xy3LODri1i0lXQqtS1gfzV+wIaGCGTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADC27F896E4;
	Mon, 27 May 2019 11:48:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A976F896E4; Mon, 27 May 2019 11:48:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68AA8F8065A
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 11:48:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68AA8F8065A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Xkuk2dGQ"
Received: by mail-qk1-x744.google.com with SMTP id j1so16905177qkk.12
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 02:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=oFhCv6WaabYtm7bkz1LfNS+VhprnKqzR1O/xEf6BE1M=;
 b=Xkuk2dGQu1Qt/ERANtthiOZ7y1FbTzGhHTChDEG39FdvrrQfnNEgf0BJ9FJNtpMe/Z
 6HlTGSGBrTNiiE+4sU6n/dkP6BNnYxVxtQKKl6owDJyZji69lDe/EY+M6JxC5CgpaR3M
 8QFalPpvmE8Ya3DXwM7tDBTppRIumUPSiNYDq6EgTXwQ9ZqEcEak5/BlpZGiID06iyaV
 whvLDd9sSi3wVHrVBuu7uAnpFLI4yHsVT455K1tcQ5vk25dczpV6mAw84yrxl/DKn7sN
 Jt44jdi/+yCVU9PBQVJYKNVs08wncdjLTBkEzSl7nmBS6E+imETRvoAGIXnVNrmutl8h
 C30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=oFhCv6WaabYtm7bkz1LfNS+VhprnKqzR1O/xEf6BE1M=;
 b=b3ePes9wwemkRTfacOiylDLaCObXun1+n0EZ2lr/SSAHKFmhgowAEVQWnK5Y0yQFWv
 gdo/2I+2x/jlwj8wcOQgzThNOBS7i5eTSFK3211IvuOl0XXGr3WfFX4X0HlMCU7QC4fH
 FFZGKmvzN/ZwXp02VckOe3gdE5lhxOCTnPW1/WuxlQ3OeeLeF2DdcBBJnFrUjpV93s2I
 A+3BIt1zS+adUvasH7CaFnhYfFUI0Qp4w46/vNhcCy+iks97aNA4LMsHJsh+Kragou1p
 LPwUP/G1E1wcLYWRxnIvR0mobSJ+AjnAbBloSrTbjBMhB+VXIxK+hdswWzlEhLrf4Ukl
 KpCg==
X-Gm-Message-State: APjAAAXUBZQKDPjOk23UfT5UcrNfEIbl4ifecIplYuI90eINSeI3Rzx0
 cxOTj3AQgRmKvtCeYnstdJlRZES4zIKPqiivCuI=
X-Google-Smtp-Source: APXvYqyy0BSbZA3UZsLlOH6FPwmV3q33PnbC0ywCgf7SeCKxmHlIa6fQrUfP1jOt+IKWnN3bkIgUnzgueVl0G8KvQv0=
X-Received: by 2002:a37:4d41:: with SMTP id a62mr36596753qkb.99.1558950527527; 
 Mon, 27 May 2019 02:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAKbjie7OEVyB4vq4L01p2ov3Vo3Mw+3edLQxwT2eVhzaj-Cu0g@mail.gmail.com>
 <s5hftreapj1.wl-tiwai@suse.de>
 <CAKbjie63rA-gj+m2ZvtMJY4_FZSopt=ef2nVm6NSqS2wm8kw0A@mail.gmail.com>
 <s5hmulmq279.wl-tiwai@suse.de>
 <CAKbjie7oiqbT=6Y2RT06fZjwAX42oumTSSjcHY=Vs4o-q+r7-g@mail.gmail.com>
In-Reply-To: <CAKbjie7oiqbT=6Y2RT06fZjwAX42oumTSSjcHY=Vs4o-q+r7-g@mail.gmail.com>
From: Paulo Fidalgo <paulo.fidalgo.pt@gmail.com>
Date: Mon, 27 May 2019 10:48:36 +0100
Message-ID: <CAKbjie7MAJPTOF0QYzikjEu7eNovqtYQoDEjEMFsP3VvCfgMEQ@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

Since I don't know if you are waiting for the command output or not I
will provide it:

After a reboot with the headset unplugged:

amixer -c0 cget numid=10
numid=10,iface=MIXER,name='Headphone Mic Boost Volume'
  ; type=INTEGER,access=rw---R--,values=2,min=0,max=3,step=0
  : values=0,0
  | dBscale-min=0.00dB,step=10.00dB,mute=0

After a reboot with the headset plugged I have the same value:

amixer -c0 cget numid=10
numid=10,iface=MIXER,name='Headphone Mic Boost Volume'
  ; type=INTEGER,access=rw---R--,values=2,min=0,max=3,step=0
  : values=0,0
  | dBscale-min=0.00dB,step=10.00dB,mute=0


Also when the headset is plugged the mic, seems to not be detected, as
it keeps with the internal mic of the laptop, but I will create
another thread for that.

Kind regards,

Paulo Fidalgo

On Thu, 16 May 2019 at 15:45, Paulo Fidalgo <paulo.fidalgo.pt@gmail.com> wrote:
>
> Since I don't know if you are waiting for the command output or not I
> will provide it:
>
> After a reboot with the headset unplugged:
>
> amixer -c0 cget numid=10
> numid=10,iface=MIXER,name='Headphone Mic Boost Volume'
>   ; type=INTEGER,access=rw---R--,values=2,min=0,max=3,step=0
>   : values=0,0
>   | dBscale-min=0.00dB,step=10.00dB,mute=0
>
> After a reboot with the headset plugged I have the same value:
>
> amixer -c0 cget numid=10
> numid=10,iface=MIXER,name='Headphone Mic Boost Volume'
>   ; type=INTEGER,access=rw---R--,values=2,min=0,max=3,step=0
>   : values=0,0
>   | dBscale-min=0.00dB,step=10.00dB,mute=0
>
>
> Also when the headset is plugged the mic, seems to not be detected, as
> it keeps with the internal mic of the laptop, but I will create
> another thread for that.
>
> Kind regards,
>
> Paulo Fidalgo
>
>
> On Fri, 22 Mar 2019 at 16:54, Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Fri, 22 Mar 2019 17:07:15 +0100,
> > Paulo Fidalgo wrote:
> > >
> > > Strangely the command returns amixer: Unable to find simple control 'numid=10',0
> > > So I've runned "amixer -c0" and you can find the output in before.txt
> >
> > Ah sorry, it was a typo: use "cget" instead of "get".
> >
> >
> > > Then I've runned amixer -c 0 cset 'numid=10' 1
> > > and again the "amixer -c0" and you can find the output in after.txt
> > >
> > > Also I've notice that the sound appears after I playing a music on
> > > computer and goes a few (like 10 ) seconds after the music stopped.
> >
> > It sounds like a state after runtime PM.
> >
> >
> > Takashi
> >
> > >
> > > On Fri, 22 Mar 2019 at 15:37, Takashi Iwai <tiwai@suse.de> wrote:
> > > >
> > > > On Fri, 22 Mar 2019 12:40:22 +0100,
> > > > Paulo Fidalgo wrote:
> > > > >
> > > > > Hi!
> > > > >
> > > > > After a bug report on Fedora
> > > > > (https://bugzilla.redhat.com/show_bug.cgi?id=1677353)
> > > > >
> > > > > ----
> > > > > When I start t he computer I hears a continuous background noise. The
> > > > > problem is also described here:
> > > > > https://wiki.archlinux.org/index.php/Dell_XPS_13_(9360)#Continuous_hissing_sound_with_headphones
> > > > >
> > > > > I need to issue the command `amixer -c 0 cset 'numid=10' 1` to solve
> > > > > the problem, but every time I reboot the computer I need to run it
> > > > > again.
> > > > > This has been happening for quite some time, but I've been post-poning
> > > > > the bug report.
> > > >
> > > > What is the original value before setting this amixer command above?
> > > > You can get via "amixer -c0 get numid=10'.
> > > >
> > > > Does the noise again when you restore the value after setting to 1 in
> > > > the above?
> > > >
> > > >
> > > > Takashi
> > > >
> > > > >
> > > > > Current kernel: 4.20.7-200.fc29.x86_64
> > > > >
> > > > > Alsa information:
> > > > > http://www.alsa-project.org/db/?f=df4834c53335709abb521c767e7b1da2f4371744
> > > > > ----
> > > > > They advise me to contact you, to see if we can get a solution on this.
> > > > >
> > > > > Note: The computer also does not recognise (switch to) when I plug an headset.
> > > > >
> > > > > If you need more information, I'm eager to help diagnose and help to
> > > > > solve this, but I have no Kernel programming skills, other than that
> > > > > count on me.
> > > > >
> > > > > Kind regards,
> > > > >
> > > > > Paulo Fidalgo
> > > > >
> > > Simple mixer control 'Master',0
> > >   Capabilities: pvolume pvolume-joined pswitch pswitch-joined
> > >   Playback channels: Mono
> > >   Limits: Playback 0 - 87
> > >   Mono: Playback 87 [100%] [0.00dB] [on]
> > > Simple mixer control 'Headphone',0
> > >   Capabilities: pvolume pswitch
> > >   Playback channels: Front Left - Front Right
> > >   Limits: Playback 0 - 87
> > >   Mono:
> > >   Front Left: Playback 87 [100%] [0.00dB] [on]
> > >   Front Right: Playback 87 [100%] [0.00dB] [on]
> > > Simple mixer control 'Headphone Mic',0
> > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > >   Capture exclusive group: 0
> > >   Capture channels: Mono
> > >   Mono: Capture [off]
> > > Simple mixer control 'Headphone Mic Boost',0
> > >   Capabilities: volume
> > >   Playback channels: Front Left - Front Right
> > >   Capture channels: Front Left - Front Right
> > >   Limits: 0 - 3
> > >   Front Left: 1 [33%] [10.00dB]
> > >   Front Right: 1 [33%] [10.00dB]
> > > Simple mixer control 'Speaker',0
> > >   Capabilities: pvolume pswitch
> > >   Playback channels: Front Left - Front Right
> > >   Limits: Playback 0 - 87
> > >   Mono:
> > >   Front Left: Playback 0 [0%] [-65.25dB] [off]
> > >   Front Right: Playback 0 [0%] [-65.25dB] [off]
> > > Simple mixer control 'PCM',0
> > >   Capabilities: pvolume
> > >   Playback channels: Front Left - Front Right
> > >   Limits: Playback 0 - 255
> > >   Mono:
> > >   Front Left: Playback 255 [100%] [0.00dB]
> > >   Front Right: Playback 255 [100%] [0.00dB]
> > > Simple mixer control 'IEC958',0
> > >   Capabilities: pswitch pswitch-joined
> > >   Playback channels: Mono
> > >   Mono: Playback [off]
> > > Simple mixer control 'IEC958',1
> > >   Capabilities: pswitch pswitch-joined
> > >   Playback channels: Mono
> > >   Mono: Playback [on]
> > > Simple mixer control 'IEC958',2
> > >   Capabilities: pswitch pswitch-joined
> > >   Playback channels: Mono
> > >   Mono: Playback [on]
> > > Simple mixer control 'IEC958',3
> > >   Capabilities: pswitch pswitch-joined
> > >   Playback channels: Mono
> > >   Mono: Playback [on]
> > > Simple mixer control 'IEC958',4
> > >   Capabilities: pswitch pswitch-joined
> > >   Playback channels: Mono
> > >   Mono: Playback [on]
> > > Simple mixer control 'Capture',0
> > >   Capabilities: cvolume cswitch
> > >   Capture channels: Front Left - Front Right
> > >   Limits: Capture 0 - 63
> > >   Front Left: Capture 63 [100%] [30.00dB] [on]
> > >   Front Right: Capture 63 [100%] [30.00dB] [on]
> > > Simple mixer control 'Auto-Mute Mode',0
> > >   Capabilities: enum
> > >   Items: 'Disabled' 'Enabled'
> > >   Item0: 'Disabled'
> > > Simple mixer control 'Headset Mic',0
> > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > >   Capture exclusive group: 0
> > >   Capture channels: Mono
> > >   Mono: Capture [on]
> > > Simple mixer control 'Headset Mic Boost',0
> > >   Capabilities: volume
> > >   Playback channels: Front Left - Front Right
> > >   Capture channels: Front Left - Front Right
> > >   Limits: 0 - 3
> > >   Front Left: 1 [33%] [10.00dB]
> > >   Front Right: 1 [33%] [10.00dB]
> > > Simple mixer control 'Internal Mic',0
> > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > >   Capture exclusive group: 0
> > >   Capture channels: Mono
> > >   Mono: Capture [off]
> > > Simple mixer control 'Internal Mic Boost',0
> > >   Capabilities: volume
> > >   Playback channels: Front Left - Front Right
> > >   Capture channels: Front Left - Front Right
> > >   Limits: 0 - 3
> > >   Front Left: 0 [0%] [0.00dB]
> > >   Front Right: 0 [0%] [0.00dB]
> > > Simple mixer control 'Master',0
> > >   Capabilities: pvolume pvolume-joined pswitch pswitch-joined
> > >   Playback channels: Mono
> > >   Limits: Playback 0 - 87
> > >   Mono: Playback 83 [95%] [-3.00dB] [on]
> > > Simple mixer control 'Headphone',0
> > >   Capabilities: pvolume pswitch
> > >   Playback channels: Front Left - Front Right
> > >   Limits: Playback 0 - 87
> > >   Mono:
> > >   Front Left: Playback 87 [100%] [0.00dB] [on]
> > >   Front Right: Playback 87 [100%] [0.00dB] [on]
> > > Simple mixer control 'Headphone Mic',0
> > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > >   Capture exclusive group: 0
> > >   Capture channels: Mono
> > >   Mono: Capture [off]
> > > Simple mixer control 'Headphone Mic Boost',0
> > >   Capabilities: volume
> > >   Playback channels: Front Left - Front Right
> > >   Capture channels: Front Left - Front Right
> > >   Limits: 0 - 3
> > >   Front Left: 0 [0%] [0.00dB]
> > >   Front Right: 0 [0%] [0.00dB]
> > > Simple mixer control 'Speaker',0
> > >   Capabilities: pvolume pswitch
> > >   Playback channels: Front Left - Front Right
> > >   Limits: Playback 0 - 87
> > >   Mono:
> > >   Front Left: Playback 0 [0%] [-65.25dB] [off]
> > >   Front Right: Playback 0 [0%] [-65.25dB] [off]
> > > Simple mixer control 'PCM',0
> > >   Capabilities: pvolume
> > >   Playback channels: Front Left - Front Right
> > >   Limits: Playback 0 - 255
> > >   Mono:
> > >   Front Left: Playback 255 [100%] [0.00dB]
> > >   Front Right: Playback 255 [100%] [0.00dB]
> > > Simple mixer control 'IEC958',0
> > >   Capabilities: pswitch pswitch-joined
> > >   Playback channels: Mono
> > >   Mono: Playback [off]
> > > Simple mixer control 'IEC958',1
> > >   Capabilities: pswitch pswitch-joined
> > >   Playback channels: Mono
> > >   Mono: Playback [on]
> > > Simple mixer control 'IEC958',2
> > >   Capabilities: pswitch pswitch-joined
> > >   Playback channels: Mono
> > >   Mono: Playback [on]
> > > Simple mixer control 'IEC958',3
> > >   Capabilities: pswitch pswitch-joined
> > >   Playback channels: Mono
> > >   Mono: Playback [on]
> > > Simple mixer control 'IEC958',4
> > >   Capabilities: pswitch pswitch-joined
> > >   Playback channels: Mono
> > >   Mono: Playback [on]
> > > Simple mixer control 'Capture',0
> > >   Capabilities: cvolume cswitch
> > >   Capture channels: Front Left - Front Right
> > >   Limits: Capture 0 - 63
> > >   Front Left: Capture 63 [100%] [30.00dB] [on]
> > >   Front Right: Capture 63 [100%] [30.00dB] [on]
> > > Simple mixer control 'Auto-Mute Mode',0
> > >   Capabilities: enum
> > >   Items: 'Disabled' 'Enabled'
> > >   Item0: 'Disabled'
> > > Simple mixer control 'Headset Mic',0
> > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > >   Capture exclusive group: 0
> > >   Capture channels: Mono
> > >   Mono: Capture [on]
> > > Simple mixer control 'Headset Mic Boost',0
> > >   Capabilities: volume
> > >   Playback channels: Front Left - Front Right
> > >   Capture channels: Front Left - Front Right
> > >   Limits: 0 - 3
> > >   Front Left: 1 [33%] [10.00dB]
> > >   Front Right: 1 [33%] [10.00dB]
> > > Simple mixer control 'Internal Mic',0
> > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > >   Capture exclusive group: 0
> > >   Capture channels: Mono
> > >   Mono: Capture [off]
> > > Simple mixer control 'Internal Mic Boost',0
> > >   Capabilities: volume
> > >   Playback channels: Front Left - Front Right
> > >   Capture channels: Front Left - Front Right
> > >   Limits: 0 - 3
> > >   Front Left: 0 [0%] [0.00dB]
> > >   Front Right: 0 [0%] [0.00dB]
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
