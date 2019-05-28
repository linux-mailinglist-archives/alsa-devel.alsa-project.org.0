Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 387C52C2C6
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 11:09:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B275117DF;
	Tue, 28 May 2019 11:08:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B275117DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559034580;
	bh=gxbKxFOQxa04WJIr50KDLolxRw/WFjJNT8QBz3KzAi8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KRKkn9EgdPSOL93uy4Hv/BFAFiDt/ooUl1SPweBt78MWYpUogIBUfgViogxM4iU/D
	 Iux5sju30ct/5Q7swNqEJRijdmMcJLnMz+G34KgBAUwHQuDbbjchC1nBs6DtLmoRGv
	 Y6wg4sr/xyBVf44yBMDUHQs+yFXuwCqpdKYN7+50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F5D2F89706;
	Tue, 28 May 2019 11:07:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1236BF89706; Tue, 28 May 2019 11:07:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71889F8072E
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 11:07:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71889F8072E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QR4UjEXo"
Received: by mail-qk1-x743.google.com with SMTP id w187so11135203qkb.11
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 02:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ean0rrV1jjJxtisoVsazFYxl3CXfF4XDS2/Mrc9nKGY=;
 b=QR4UjEXo9k/IyrG0eYiQq5tLoPzEZQ47fC+zxkmV1VGJBqzN/PaYHCngSYlX24rWIy
 HyTp8rXmrpV30dQ+LndJgfNdcWQKjaxa0yaI7xcNJ9GCHsi466umglC6KprI+574VIHh
 mKCeS1Wcr4rn7b3u32SLpQ1R/lXSyYeCRNEptZa2p87ZmbR5iJQChFu4aFTG++r5Ko8+
 kZxKQChQ6LQraL+MJuGkKaOfQAgfDRqgsIdBIXAg267YP8jDnikb2y0z+m3FleQI7+Cv
 J+E462rzAWUWDL0Lfom/BjOHpZwP1zexaKBsOGclB8gCWJz8c0eY3DsSwv9nQnU50iDy
 JU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ean0rrV1jjJxtisoVsazFYxl3CXfF4XDS2/Mrc9nKGY=;
 b=b3FmhdAvoe4mzODJKsJy6vzra9eloJnpt6cza7aqCrhblVg0kKshCzawi55uXzFMOX
 DL6idM/TNs3i10JsGKL60xpqWHspvjuC91+YLR93h0X5bX6n3D1gO3R2MUIQcxU6SoNj
 lLqh1iNRICO+lSKvwVMpYP/T3NrTHKkOdGEAwbz/B+Uv+KxpodhGY0PyQslTnq/sNpvC
 IO+foNqWguSw1xyOf+dTN2DIt8zjlt8/21lcaMGak62YDLzebeTzCP+/u3ndFMgPsUII
 3byJLSIW+3Lk2JkuuxmNnwx+ZHKamwO6+rvAKSmo66UZwM6PsXSKn/YT78an3onEABHj
 LroA==
X-Gm-Message-State: APjAAAXcnbSUSvLh00oSVB+S4dVOAoIJNQAiSJGE/X4ernZW/5Fd9zEB
 iUkwRRavZgHuJ73g5q6e/XUm1E8pUt5gKp2LUuc=
X-Google-Smtp-Source: APXvYqxRN3J7+qpNPgiGjUKDDnWZviR7x1PzzAr+vvBpryj8iFbaTfYnKS+n6uqtxJRgcazwOIQGHamfkdv4u5/slTw=
X-Received: by 2002:a0c:ba09:: with SMTP id w9mr22580830qvf.67.1559034450861; 
 Tue, 28 May 2019 02:07:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAKbjie7OEVyB4vq4L01p2ov3Vo3Mw+3edLQxwT2eVhzaj-Cu0g@mail.gmail.com>
 <s5hftreapj1.wl-tiwai@suse.de>
 <CAKbjie63rA-gj+m2ZvtMJY4_FZSopt=ef2nVm6NSqS2wm8kw0A@mail.gmail.com>
 <s5hmulmq279.wl-tiwai@suse.de>
 <CAKbjie7oiqbT=6Y2RT06fZjwAX42oumTSSjcHY=Vs4o-q+r7-g@mail.gmail.com>
 <CAKbjie7MAJPTOF0QYzikjEu7eNovqtYQoDEjEMFsP3VvCfgMEQ@mail.gmail.com>
 <s5hwoicxluk.wl-tiwai@suse.de>
 <CAKbjie6kJy31FK+Pjgvj+OJSBngbygzCDd5dwXkmpQ+dKwwFXQ@mail.gmail.com>
 <s5hv9xwxkrw.wl-tiwai@suse.de> <s5hsgt0xk9k.wl-tiwai@suse.de>
In-Reply-To: <s5hsgt0xk9k.wl-tiwai@suse.de>
From: Paulo Fidalgo <paulo.fidalgo.pt@gmail.com>
Date: Tue, 28 May 2019 10:07:19 +0100
Message-ID: <CAKbjie7MD9oNWUqZQpGAUmVZUuRMYkcKeMoq43c7ouDFFqo2dw@mail.gmail.com>
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

Hi!

I've tested and there's only one situation when I can ear that sound,
after pausing a music, I can ear it from a few seconds (~6 seconds).
I guess this is OK now, at least now I can live with it.

As a side note, the headset detection still only detects the
heaphones, not the mic.

Thanks!

On Mon, 27 May 2019 at 11:30, Takashi Iwai <tiwai@suse.de> wrote:
>
> On Mon, 27 May 2019 12:18:59 +0200,
> Takashi Iwai wrote:
> >
> > On Mon, 27 May 2019 12:11:24 +0200,
> > Paulo Fidalgo wrote:
> > >
> > > Sure,
> > >
> > > Can you point me to an updated doc? I'm using fedora, if there's
> > > anything specific.
> >
> > I have no idea about Fedora, but what I'm asking is to test the
> > upstream kernel, so it should be independent from the distro.
>
> FWIW, the git tree is found at
>   git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
>
> and you need to checkout for-linus branch.
>
>
> Takashi
>
>
> >
> >
> > Takashi
> >
> > >
> > > Kind regards,
> > >
> > > Paulo Fidalgo
> > >
> > > On Mon, 27 May 2019 at 10:55, Takashi Iwai <tiwai@suse.de> wrote:
> > > >
> > > > On Mon, 27 May 2019 11:48:36 +0200,
> > > > Paulo Fidalgo wrote:
> > > > >
> > > > > Since I don't know if you are waiting for the command output or not I
> > > > > will provide it:
> > > > >
> > > > > After a reboot with the headset unplugged:
> > > > >
> > > > > amixer -c0 cget numid=10
> > > > > numid=10,iface=MIXER,name='Headphone Mic Boost Volume'
> > > > >   ; type=INTEGER,access=rw---R--,values=2,min=0,max=3,step=0
> > > > >   : values=0,0
> > > > >   | dBscale-min=0.00dB,step=10.00dB,mute=0
> > > > >
> > > > > After a reboot with the headset plugged I have the same value:
> > > > >
> > > > > amixer -c0 cget numid=10
> > > > > numid=10,iface=MIXER,name='Headphone Mic Boost Volume'
> > > > >   ; type=INTEGER,access=rw---R--,values=2,min=0,max=3,step=0
> > > > >   : values=0,0
> > > > >   | dBscale-min=0.00dB,step=10.00dB,mute=0
> > > > >
> > > > >
> > > > > Also when the headset is plugged the mic, seems to not be detected, as
> > > > > it keeps with the internal mic of the laptop, but I will create
> > > > > another thread for that.
> > > >
> > > > Could you try the latest for-linus branch of sound.git tree?
> > > > Now we disable the poewr_save_node flag as default for some Realtek
> > > > codecs, and this might influence on such behavior.
> > > >
> > > >
> > > > thanks,
> > > >
> > > > Takashi
> > > >
> > > > >
> > > > > Kind regards,
> > > > >
> > > > > Paulo Fidalgo
> > > > >
> > > > > On Thu, 16 May 2019 at 15:45, Paulo Fidalgo <paulo.fidalgo.pt@gmail.com> wrote:
> > > > > >
> > > > > > Since I don't know if you are waiting for the command output or not I
> > > > > > will provide it:
> > > > > >
> > > > > > After a reboot with the headset unplugged:
> > > > > >
> > > > > > amixer -c0 cget numid=10
> > > > > > numid=10,iface=MIXER,name='Headphone Mic Boost Volume'
> > > > > >   ; type=INTEGER,access=rw---R--,values=2,min=0,max=3,step=0
> > > > > >   : values=0,0
> > > > > >   | dBscale-min=0.00dB,step=10.00dB,mute=0
> > > > > >
> > > > > > After a reboot with the headset plugged I have the same value:
> > > > > >
> > > > > > amixer -c0 cget numid=10
> > > > > > numid=10,iface=MIXER,name='Headphone Mic Boost Volume'
> > > > > >   ; type=INTEGER,access=rw---R--,values=2,min=0,max=3,step=0
> > > > > >   : values=0,0
> > > > > >   | dBscale-min=0.00dB,step=10.00dB,mute=0
> > > > > >
> > > > > >
> > > > > > Also when the headset is plugged the mic, seems to not be detected, as
> > > > > > it keeps with the internal mic of the laptop, but I will create
> > > > > > another thread for that.
> > > > > >
> > > > > > Kind regards,
> > > > > >
> > > > > > Paulo Fidalgo
> > > > > >
> > > > > >
> > > > > > On Fri, 22 Mar 2019 at 16:54, Takashi Iwai <tiwai@suse.de> wrote:
> > > > > > >
> > > > > > > On Fri, 22 Mar 2019 17:07:15 +0100,
> > > > > > > Paulo Fidalgo wrote:
> > > > > > > >
> > > > > > > > Strangely the command returns amixer: Unable to find simple control 'numid=10',0
> > > > > > > > So I've runned "amixer -c0" and you can find the output in before.txt
> > > > > > >
> > > > > > > Ah sorry, it was a typo: use "cget" instead of "get".
> > > > > > >
> > > > > > >
> > > > > > > > Then I've runned amixer -c 0 cset 'numid=10' 1
> > > > > > > > and again the "amixer -c0" and you can find the output in after.txt
> > > > > > > >
> > > > > > > > Also I've notice that the sound appears after I playing a music on
> > > > > > > > computer and goes a few (like 10 ) seconds after the music stopped.
> > > > > > >
> > > > > > > It sounds like a state after runtime PM.
> > > > > > >
> > > > > > >
> > > > > > > Takashi
> > > > > > >
> > > > > > > >
> > > > > > > > On Fri, 22 Mar 2019 at 15:37, Takashi Iwai <tiwai@suse.de> wrote:
> > > > > > > > >
> > > > > > > > > On Fri, 22 Mar 2019 12:40:22 +0100,
> > > > > > > > > Paulo Fidalgo wrote:
> > > > > > > > > >
> > > > > > > > > > Hi!
> > > > > > > > > >
> > > > > > > > > > After a bug report on Fedora
> > > > > > > > > > (https://bugzilla.redhat.com/show_bug.cgi?id=1677353)
> > > > > > > > > >
> > > > > > > > > > ----
> > > > > > > > > > When I start t he computer I hears a continuous background noise. The
> > > > > > > > > > problem is also described here:
> > > > > > > > > > https://wiki.archlinux.org/index.php/Dell_XPS_13_(9360)#Continuous_hissing_sound_with_headphones
> > > > > > > > > >
> > > > > > > > > > I need to issue the command `amixer -c 0 cset 'numid=10' 1` to solve
> > > > > > > > > > the problem, but every time I reboot the computer I need to run it
> > > > > > > > > > again.
> > > > > > > > > > This has been happening for quite some time, but I've been post-poning
> > > > > > > > > > the bug report.
> > > > > > > > >
> > > > > > > > > What is the original value before setting this amixer command above?
> > > > > > > > > You can get via "amixer -c0 get numid=10'.
> > > > > > > > >
> > > > > > > > > Does the noise again when you restore the value after setting to 1 in
> > > > > > > > > the above?
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > Takashi
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Current kernel: 4.20.7-200.fc29.x86_64
> > > > > > > > > >
> > > > > > > > > > Alsa information:
> > > > > > > > > > http://www.alsa-project.org/db/?f=df4834c53335709abb521c767e7b1da2f4371744
> > > > > > > > > > ----
> > > > > > > > > > They advise me to contact you, to see if we can get a solution on this.
> > > > > > > > > >
> > > > > > > > > > Note: The computer also does not recognise (switch to) when I plug an headset.
> > > > > > > > > >
> > > > > > > > > > If you need more information, I'm eager to help diagnose and help to
> > > > > > > > > > solve this, but I have no Kernel programming skills, other than that
> > > > > > > > > > count on me.
> > > > > > > > > >
> > > > > > > > > > Kind regards,
> > > > > > > > > >
> > > > > > > > > > Paulo Fidalgo
> > > > > > > > > >
> > > > > > > > Simple mixer control 'Master',0
> > > > > > > >   Capabilities: pvolume pvolume-joined pswitch pswitch-joined
> > > > > > > >   Playback channels: Mono
> > > > > > > >   Limits: Playback 0 - 87
> > > > > > > >   Mono: Playback 87 [100%] [0.00dB] [on]
> > > > > > > > Simple mixer control 'Headphone',0
> > > > > > > >   Capabilities: pvolume pswitch
> > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > >   Limits: Playback 0 - 87
> > > > > > > >   Mono:
> > > > > > > >   Front Left: Playback 87 [100%] [0.00dB] [on]
> > > > > > > >   Front Right: Playback 87 [100%] [0.00dB] [on]
> > > > > > > > Simple mixer control 'Headphone Mic',0
> > > > > > > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > > > > > > >   Capture exclusive group: 0
> > > > > > > >   Capture channels: Mono
> > > > > > > >   Mono: Capture [off]
> > > > > > > > Simple mixer control 'Headphone Mic Boost',0
> > > > > > > >   Capabilities: volume
> > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > >   Capture channels: Front Left - Front Right
> > > > > > > >   Limits: 0 - 3
> > > > > > > >   Front Left: 1 [33%] [10.00dB]
> > > > > > > >   Front Right: 1 [33%] [10.00dB]
> > > > > > > > Simple mixer control 'Speaker',0
> > > > > > > >   Capabilities: pvolume pswitch
> > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > >   Limits: Playback 0 - 87
> > > > > > > >   Mono:
> > > > > > > >   Front Left: Playback 0 [0%] [-65.25dB] [off]
> > > > > > > >   Front Right: Playback 0 [0%] [-65.25dB] [off]
> > > > > > > > Simple mixer control 'PCM',0
> > > > > > > >   Capabilities: pvolume
> > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > >   Limits: Playback 0 - 255
> > > > > > > >   Mono:
> > > > > > > >   Front Left: Playback 255 [100%] [0.00dB]
> > > > > > > >   Front Right: Playback 255 [100%] [0.00dB]
> > > > > > > > Simple mixer control 'IEC958',0
> > > > > > > >   Capabilities: pswitch pswitch-joined
> > > > > > > >   Playback channels: Mono
> > > > > > > >   Mono: Playback [off]
> > > > > > > > Simple mixer control 'IEC958',1
> > > > > > > >   Capabilities: pswitch pswitch-joined
> > > > > > > >   Playback channels: Mono
> > > > > > > >   Mono: Playback [on]
> > > > > > > > Simple mixer control 'IEC958',2
> > > > > > > >   Capabilities: pswitch pswitch-joined
> > > > > > > >   Playback channels: Mono
> > > > > > > >   Mono: Playback [on]
> > > > > > > > Simple mixer control 'IEC958',3
> > > > > > > >   Capabilities: pswitch pswitch-joined
> > > > > > > >   Playback channels: Mono
> > > > > > > >   Mono: Playback [on]
> > > > > > > > Simple mixer control 'IEC958',4
> > > > > > > >   Capabilities: pswitch pswitch-joined
> > > > > > > >   Playback channels: Mono
> > > > > > > >   Mono: Playback [on]
> > > > > > > > Simple mixer control 'Capture',0
> > > > > > > >   Capabilities: cvolume cswitch
> > > > > > > >   Capture channels: Front Left - Front Right
> > > > > > > >   Limits: Capture 0 - 63
> > > > > > > >   Front Left: Capture 63 [100%] [30.00dB] [on]
> > > > > > > >   Front Right: Capture 63 [100%] [30.00dB] [on]
> > > > > > > > Simple mixer control 'Auto-Mute Mode',0
> > > > > > > >   Capabilities: enum
> > > > > > > >   Items: 'Disabled' 'Enabled'
> > > > > > > >   Item0: 'Disabled'
> > > > > > > > Simple mixer control 'Headset Mic',0
> > > > > > > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > > > > > > >   Capture exclusive group: 0
> > > > > > > >   Capture channels: Mono
> > > > > > > >   Mono: Capture [on]
> > > > > > > > Simple mixer control 'Headset Mic Boost',0
> > > > > > > >   Capabilities: volume
> > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > >   Capture channels: Front Left - Front Right
> > > > > > > >   Limits: 0 - 3
> > > > > > > >   Front Left: 1 [33%] [10.00dB]
> > > > > > > >   Front Right: 1 [33%] [10.00dB]
> > > > > > > > Simple mixer control 'Internal Mic',0
> > > > > > > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > > > > > > >   Capture exclusive group: 0
> > > > > > > >   Capture channels: Mono
> > > > > > > >   Mono: Capture [off]
> > > > > > > > Simple mixer control 'Internal Mic Boost',0
> > > > > > > >   Capabilities: volume
> > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > >   Capture channels: Front Left - Front Right
> > > > > > > >   Limits: 0 - 3
> > > > > > > >   Front Left: 0 [0%] [0.00dB]
> > > > > > > >   Front Right: 0 [0%] [0.00dB]
> > > > > > > > Simple mixer control 'Master',0
> > > > > > > >   Capabilities: pvolume pvolume-joined pswitch pswitch-joined
> > > > > > > >   Playback channels: Mono
> > > > > > > >   Limits: Playback 0 - 87
> > > > > > > >   Mono: Playback 83 [95%] [-3.00dB] [on]
> > > > > > > > Simple mixer control 'Headphone',0
> > > > > > > >   Capabilities: pvolume pswitch
> > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > >   Limits: Playback 0 - 87
> > > > > > > >   Mono:
> > > > > > > >   Front Left: Playback 87 [100%] [0.00dB] [on]
> > > > > > > >   Front Right: Playback 87 [100%] [0.00dB] [on]
> > > > > > > > Simple mixer control 'Headphone Mic',0
> > > > > > > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > > > > > > >   Capture exclusive group: 0
> > > > > > > >   Capture channels: Mono
> > > > > > > >   Mono: Capture [off]
> > > > > > > > Simple mixer control 'Headphone Mic Boost',0
> > > > > > > >   Capabilities: volume
> > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > >   Capture channels: Front Left - Front Right
> > > > > > > >   Limits: 0 - 3
> > > > > > > >   Front Left: 0 [0%] [0.00dB]
> > > > > > > >   Front Right: 0 [0%] [0.00dB]
> > > > > > > > Simple mixer control 'Speaker',0
> > > > > > > >   Capabilities: pvolume pswitch
> > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > >   Limits: Playback 0 - 87
> > > > > > > >   Mono:
> > > > > > > >   Front Left: Playback 0 [0%] [-65.25dB] [off]
> > > > > > > >   Front Right: Playback 0 [0%] [-65.25dB] [off]
> > > > > > > > Simple mixer control 'PCM',0
> > > > > > > >   Capabilities: pvolume
> > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > >   Limits: Playback 0 - 255
> > > > > > > >   Mono:
> > > > > > > >   Front Left: Playback 255 [100%] [0.00dB]
> > > > > > > >   Front Right: Playback 255 [100%] [0.00dB]
> > > > > > > > Simple mixer control 'IEC958',0
> > > > > > > >   Capabilities: pswitch pswitch-joined
> > > > > > > >   Playback channels: Mono
> > > > > > > >   Mono: Playback [off]
> > > > > > > > Simple mixer control 'IEC958',1
> > > > > > > >   Capabilities: pswitch pswitch-joined
> > > > > > > >   Playback channels: Mono
> > > > > > > >   Mono: Playback [on]
> > > > > > > > Simple mixer control 'IEC958',2
> > > > > > > >   Capabilities: pswitch pswitch-joined
> > > > > > > >   Playback channels: Mono
> > > > > > > >   Mono: Playback [on]
> > > > > > > > Simple mixer control 'IEC958',3
> > > > > > > >   Capabilities: pswitch pswitch-joined
> > > > > > > >   Playback channels: Mono
> > > > > > > >   Mono: Playback [on]
> > > > > > > > Simple mixer control 'IEC958',4
> > > > > > > >   Capabilities: pswitch pswitch-joined
> > > > > > > >   Playback channels: Mono
> > > > > > > >   Mono: Playback [on]
> > > > > > > > Simple mixer control 'Capture',0
> > > > > > > >   Capabilities: cvolume cswitch
> > > > > > > >   Capture channels: Front Left - Front Right
> > > > > > > >   Limits: Capture 0 - 63
> > > > > > > >   Front Left: Capture 63 [100%] [30.00dB] [on]
> > > > > > > >   Front Right: Capture 63 [100%] [30.00dB] [on]
> > > > > > > > Simple mixer control 'Auto-Mute Mode',0
> > > > > > > >   Capabilities: enum
> > > > > > > >   Items: 'Disabled' 'Enabled'
> > > > > > > >   Item0: 'Disabled'
> > > > > > > > Simple mixer control 'Headset Mic',0
> > > > > > > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > > > > > > >   Capture exclusive group: 0
> > > > > > > >   Capture channels: Mono
> > > > > > > >   Mono: Capture [on]
> > > > > > > > Simple mixer control 'Headset Mic Boost',0
> > > > > > > >   Capabilities: volume
> > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > >   Capture channels: Front Left - Front Right
> > > > > > > >   Limits: 0 - 3
> > > > > > > >   Front Left: 1 [33%] [10.00dB]
> > > > > > > >   Front Right: 1 [33%] [10.00dB]
> > > > > > > > Simple mixer control 'Internal Mic',0
> > > > > > > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > > > > > > >   Capture exclusive group: 0
> > > > > > > >   Capture channels: Mono
> > > > > > > >   Mono: Capture [off]
> > > > > > > > Simple mixer control 'Internal Mic Boost',0
> > > > > > > >   Capabilities: volume
> > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > >   Capture channels: Front Left - Front Right
> > > > > > > >   Limits: 0 - 3
> > > > > > > >   Front Left: 0 [0%] [0.00dB]
> > > > > > > >   Front Right: 0 [0%] [0.00dB]
> > > > >
> > >
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
