Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 672FD2D9F1
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2019 12:04:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBC2216AE;
	Wed, 29 May 2019 12:03:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBC2216AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559124270;
	bh=d8LbfT47XNQKwg9xBDEpAU5bVAO+jo3I+fjInnAVXYc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mxZnSGs1sOCk2g22jwrJFSlss1ME4qvIIgFLDGmQENh7xuNmsYv6liRMNIF2tkZpB
	 EOZ3X4WpbAyvYVd2s/QpITh+SLiSfCPRtPAr2+1IqQ+gTYg8JGS158LMdLrfJDDoZ7
	 upVxhX7oF6pokasBeO1HpAs3Av4PELqacgLINzT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0457F896E8;
	Wed, 29 May 2019 12:02:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5A2EF896E4; Wed, 29 May 2019 12:02:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47EC1F8065A
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 12:02:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47EC1F8065A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="i6QNWCyQ"
Received: by mail-qt1-x82a.google.com with SMTP id z19so1732726qtz.13
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 03:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lDHpzBMaweSEQjeR9zraYxtjvIWuKJl1EP8i+Yimbvc=;
 b=i6QNWCyQ6faa3EDhPMHi1tq9GHGmPxtBncPa8sFUFkdGlD/MykQhXKsH/1dwzZbRHe
 rNZDyEfV2/TnVB0gx4hn7ovHS8EMafjVkXFLw7pKzbr6y/rAeez+mVstRxBjR9b52Pu3
 9jyftxShtve0Owvy6EIXGxgP1nTaObWGZ27n0HNyINCMOprW4hmGCBBgIFm2YNW++Jft
 Oi9gswk3WelhnlZI/Hmm6H1qtTOZjiv8pRlkmvl4nnb5b9Z3+NrX14naL2whu31jF0QM
 JNjLedM+gG3QpQoXRD1DRwpVwBr9ZT+8laYbULZwe4pohrhKp4qSY4HdXLY1d9Q03dbM
 /+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lDHpzBMaweSEQjeR9zraYxtjvIWuKJl1EP8i+Yimbvc=;
 b=pjdjYu9yXwr5htDHTwmO/1pnArk5ziLcQjG21MD9QSnkwIF0Ep7dRJbeUxbQQN8vzj
 DkYMOJZCyS8f5Xhzk97xRtvGJOZQR//4P3d/LBDFPp8G4FRictp0QYwEkge9j/pAeNeo
 TWcBVo38J2SPssSicD6kDwd1x8gou0tXGE03FlFEDhqeNL6mHuVijeZ/o9I9oa8vdP05
 07AV4MPSPlNo2DqFmE3PeGmPSSdLO2MivG9JCs2L+gqkz9DzbHGAhM+EPJ6pf4VIRabT
 AFIE9+JAyrcqssLfjqEVZbPmUtPg7EqValxGf0hjtKcfEySnqrIdFTUuffGdwwS/JD1r
 CJVg==
X-Gm-Message-State: APjAAAUvAZ5sS1p5ZYb80/73w0/om/RA4L7vrQsHMbi3QJLYGyXd/II3
 9LfCvq4s3XzWDu3Pc2z6UJBQ6ZYsuT6mOAOWgWA=
X-Google-Smtp-Source: APXvYqzuX40XxOixsFjywQ+Pwf7tHg29kjyLdF5JRhF0iFVF7WBWN+m03H2Q0AwLjMzR/BQimq0ftd1ouLq88OMaz3I=
X-Received: by 2002:aed:3b66:: with SMTP id q35mr17423937qte.118.1559124155446; 
 Wed, 29 May 2019 03:02:35 -0700 (PDT)
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
 <CAKbjie7MD9oNWUqZQpGAUmVZUuRMYkcKeMoq43c7ouDFFqo2dw@mail.gmail.com>
In-Reply-To: <CAKbjie7MD9oNWUqZQpGAUmVZUuRMYkcKeMoq43c7ouDFFqo2dw@mail.gmail.com>
From: Paulo Fidalgo <paulo.fidalgo.pt@gmail.com>
Date: Wed, 29 May 2019 11:02:23 +0100
Message-ID: <CAKbjie6m55b9LjZ+6VpPO_9T4Foa=4mP_W2Umam2z-Mt4uqUcQ@mail.gmail.com>
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

There's still a issue that I've found riht now, if I'm in call and
it's silent I still have the hissing sound.

On Tue, 28 May 2019 at 10:07, Paulo Fidalgo <paulo.fidalgo.pt@gmail.com> wrote:
>
> Hi!
>
> I've tested and there's only one situation when I can ear that sound,
> after pausing a music, I can ear it from a few seconds (~6 seconds).
> I guess this is OK now, at least now I can live with it.
>
> As a side note, the headset detection still only detects the
> heaphones, not the mic.
>
> Thanks!
>
> On Mon, 27 May 2019 at 11:30, Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Mon, 27 May 2019 12:18:59 +0200,
> > Takashi Iwai wrote:
> > >
> > > On Mon, 27 May 2019 12:11:24 +0200,
> > > Paulo Fidalgo wrote:
> > > >
> > > > Sure,
> > > >
> > > > Can you point me to an updated doc? I'm using fedora, if there's
> > > > anything specific.
> > >
> > > I have no idea about Fedora, but what I'm asking is to test the
> > > upstream kernel, so it should be independent from the distro.
> >
> > FWIW, the git tree is found at
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
> >
> > and you need to checkout for-linus branch.
> >
> >
> > Takashi
> >
> >
> > >
> > >
> > > Takashi
> > >
> > > >
> > > > Kind regards,
> > > >
> > > > Paulo Fidalgo
> > > >
> > > > On Mon, 27 May 2019 at 10:55, Takashi Iwai <tiwai@suse.de> wrote:
> > > > >
> > > > > On Mon, 27 May 2019 11:48:36 +0200,
> > > > > Paulo Fidalgo wrote:
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
> > > > >
> > > > > Could you try the latest for-linus branch of sound.git tree?
> > > > > Now we disable the poewr_save_node flag as default for some Realtek
> > > > > codecs, and this might influence on such behavior.
> > > > >
> > > > >
> > > > > thanks,
> > > > >
> > > > > Takashi
> > > > >
> > > > > >
> > > > > > Kind regards,
> > > > > >
> > > > > > Paulo Fidalgo
> > > > > >
> > > > > > On Thu, 16 May 2019 at 15:45, Paulo Fidalgo <paulo.fidalgo.pt@gmail.com> wrote:
> > > > > > >
> > > > > > > Since I don't know if you are waiting for the command output or not I
> > > > > > > will provide it:
> > > > > > >
> > > > > > > After a reboot with the headset unplugged:
> > > > > > >
> > > > > > > amixer -c0 cget numid=10
> > > > > > > numid=10,iface=MIXER,name='Headphone Mic Boost Volume'
> > > > > > >   ; type=INTEGER,access=rw---R--,values=2,min=0,max=3,step=0
> > > > > > >   : values=0,0
> > > > > > >   | dBscale-min=0.00dB,step=10.00dB,mute=0
> > > > > > >
> > > > > > > After a reboot with the headset plugged I have the same value:
> > > > > > >
> > > > > > > amixer -c0 cget numid=10
> > > > > > > numid=10,iface=MIXER,name='Headphone Mic Boost Volume'
> > > > > > >   ; type=INTEGER,access=rw---R--,values=2,min=0,max=3,step=0
> > > > > > >   : values=0,0
> > > > > > >   | dBscale-min=0.00dB,step=10.00dB,mute=0
> > > > > > >
> > > > > > >
> > > > > > > Also when the headset is plugged the mic, seems to not be detected, as
> > > > > > > it keeps with the internal mic of the laptop, but I will create
> > > > > > > another thread for that.
> > > > > > >
> > > > > > > Kind regards,
> > > > > > >
> > > > > > > Paulo Fidalgo
> > > > > > >
> > > > > > >
> > > > > > > On Fri, 22 Mar 2019 at 16:54, Takashi Iwai <tiwai@suse.de> wrote:
> > > > > > > >
> > > > > > > > On Fri, 22 Mar 2019 17:07:15 +0100,
> > > > > > > > Paulo Fidalgo wrote:
> > > > > > > > >
> > > > > > > > > Strangely the command returns amixer: Unable to find simple control 'numid=10',0
> > > > > > > > > So I've runned "amixer -c0" and you can find the output in before.txt
> > > > > > > >
> > > > > > > > Ah sorry, it was a typo: use "cget" instead of "get".
> > > > > > > >
> > > > > > > >
> > > > > > > > > Then I've runned amixer -c 0 cset 'numid=10' 1
> > > > > > > > > and again the "amixer -c0" and you can find the output in after.txt
> > > > > > > > >
> > > > > > > > > Also I've notice that the sound appears after I playing a music on
> > > > > > > > > computer and goes a few (like 10 ) seconds after the music stopped.
> > > > > > > >
> > > > > > > > It sounds like a state after runtime PM.
> > > > > > > >
> > > > > > > >
> > > > > > > > Takashi
> > > > > > > >
> > > > > > > > >
> > > > > > > > > On Fri, 22 Mar 2019 at 15:37, Takashi Iwai <tiwai@suse.de> wrote:
> > > > > > > > > >
> > > > > > > > > > On Fri, 22 Mar 2019 12:40:22 +0100,
> > > > > > > > > > Paulo Fidalgo wrote:
> > > > > > > > > > >
> > > > > > > > > > > Hi!
> > > > > > > > > > >
> > > > > > > > > > > After a bug report on Fedora
> > > > > > > > > > > (https://bugzilla.redhat.com/show_bug.cgi?id=1677353)
> > > > > > > > > > >
> > > > > > > > > > > ----
> > > > > > > > > > > When I start t he computer I hears a continuous background noise. The
> > > > > > > > > > > problem is also described here:
> > > > > > > > > > > https://wiki.archlinux.org/index.php/Dell_XPS_13_(9360)#Continuous_hissing_sound_with_headphones
> > > > > > > > > > >
> > > > > > > > > > > I need to issue the command `amixer -c 0 cset 'numid=10' 1` to solve
> > > > > > > > > > > the problem, but every time I reboot the computer I need to run it
> > > > > > > > > > > again.
> > > > > > > > > > > This has been happening for quite some time, but I've been post-poning
> > > > > > > > > > > the bug report.
> > > > > > > > > >
> > > > > > > > > > What is the original value before setting this amixer command above?
> > > > > > > > > > You can get via "amixer -c0 get numid=10'.
> > > > > > > > > >
> > > > > > > > > > Does the noise again when you restore the value after setting to 1 in
> > > > > > > > > > the above?
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Takashi
> > > > > > > > > >
> > > > > > > > > > >
> > > > > > > > > > > Current kernel: 4.20.7-200.fc29.x86_64
> > > > > > > > > > >
> > > > > > > > > > > Alsa information:
> > > > > > > > > > > http://www.alsa-project.org/db/?f=df4834c53335709abb521c767e7b1da2f4371744
> > > > > > > > > > > ----
> > > > > > > > > > > They advise me to contact you, to see if we can get a solution on this.
> > > > > > > > > > >
> > > > > > > > > > > Note: The computer also does not recognise (switch to) when I plug an headset.
> > > > > > > > > > >
> > > > > > > > > > > If you need more information, I'm eager to help diagnose and help to
> > > > > > > > > > > solve this, but I have no Kernel programming skills, other than that
> > > > > > > > > > > count on me.
> > > > > > > > > > >
> > > > > > > > > > > Kind regards,
> > > > > > > > > > >
> > > > > > > > > > > Paulo Fidalgo
> > > > > > > > > > >
> > > > > > > > > Simple mixer control 'Master',0
> > > > > > > > >   Capabilities: pvolume pvolume-joined pswitch pswitch-joined
> > > > > > > > >   Playback channels: Mono
> > > > > > > > >   Limits: Playback 0 - 87
> > > > > > > > >   Mono: Playback 87 [100%] [0.00dB] [on]
> > > > > > > > > Simple mixer control 'Headphone',0
> > > > > > > > >   Capabilities: pvolume pswitch
> > > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > > >   Limits: Playback 0 - 87
> > > > > > > > >   Mono:
> > > > > > > > >   Front Left: Playback 87 [100%] [0.00dB] [on]
> > > > > > > > >   Front Right: Playback 87 [100%] [0.00dB] [on]
> > > > > > > > > Simple mixer control 'Headphone Mic',0
> > > > > > > > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > > > > > > > >   Capture exclusive group: 0
> > > > > > > > >   Capture channels: Mono
> > > > > > > > >   Mono: Capture [off]
> > > > > > > > > Simple mixer control 'Headphone Mic Boost',0
> > > > > > > > >   Capabilities: volume
> > > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > > >   Capture channels: Front Left - Front Right
> > > > > > > > >   Limits: 0 - 3
> > > > > > > > >   Front Left: 1 [33%] [10.00dB]
> > > > > > > > >   Front Right: 1 [33%] [10.00dB]
> > > > > > > > > Simple mixer control 'Speaker',0
> > > > > > > > >   Capabilities: pvolume pswitch
> > > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > > >   Limits: Playback 0 - 87
> > > > > > > > >   Mono:
> > > > > > > > >   Front Left: Playback 0 [0%] [-65.25dB] [off]
> > > > > > > > >   Front Right: Playback 0 [0%] [-65.25dB] [off]
> > > > > > > > > Simple mixer control 'PCM',0
> > > > > > > > >   Capabilities: pvolume
> > > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > > >   Limits: Playback 0 - 255
> > > > > > > > >   Mono:
> > > > > > > > >   Front Left: Playback 255 [100%] [0.00dB]
> > > > > > > > >   Front Right: Playback 255 [100%] [0.00dB]
> > > > > > > > > Simple mixer control 'IEC958',0
> > > > > > > > >   Capabilities: pswitch pswitch-joined
> > > > > > > > >   Playback channels: Mono
> > > > > > > > >   Mono: Playback [off]
> > > > > > > > > Simple mixer control 'IEC958',1
> > > > > > > > >   Capabilities: pswitch pswitch-joined
> > > > > > > > >   Playback channels: Mono
> > > > > > > > >   Mono: Playback [on]
> > > > > > > > > Simple mixer control 'IEC958',2
> > > > > > > > >   Capabilities: pswitch pswitch-joined
> > > > > > > > >   Playback channels: Mono
> > > > > > > > >   Mono: Playback [on]
> > > > > > > > > Simple mixer control 'IEC958',3
> > > > > > > > >   Capabilities: pswitch pswitch-joined
> > > > > > > > >   Playback channels: Mono
> > > > > > > > >   Mono: Playback [on]
> > > > > > > > > Simple mixer control 'IEC958',4
> > > > > > > > >   Capabilities: pswitch pswitch-joined
> > > > > > > > >   Playback channels: Mono
> > > > > > > > >   Mono: Playback [on]
> > > > > > > > > Simple mixer control 'Capture',0
> > > > > > > > >   Capabilities: cvolume cswitch
> > > > > > > > >   Capture channels: Front Left - Front Right
> > > > > > > > >   Limits: Capture 0 - 63
> > > > > > > > >   Front Left: Capture 63 [100%] [30.00dB] [on]
> > > > > > > > >   Front Right: Capture 63 [100%] [30.00dB] [on]
> > > > > > > > > Simple mixer control 'Auto-Mute Mode',0
> > > > > > > > >   Capabilities: enum
> > > > > > > > >   Items: 'Disabled' 'Enabled'
> > > > > > > > >   Item0: 'Disabled'
> > > > > > > > > Simple mixer control 'Headset Mic',0
> > > > > > > > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > > > > > > > >   Capture exclusive group: 0
> > > > > > > > >   Capture channels: Mono
> > > > > > > > >   Mono: Capture [on]
> > > > > > > > > Simple mixer control 'Headset Mic Boost',0
> > > > > > > > >   Capabilities: volume
> > > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > > >   Capture channels: Front Left - Front Right
> > > > > > > > >   Limits: 0 - 3
> > > > > > > > >   Front Left: 1 [33%] [10.00dB]
> > > > > > > > >   Front Right: 1 [33%] [10.00dB]
> > > > > > > > > Simple mixer control 'Internal Mic',0
> > > > > > > > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > > > > > > > >   Capture exclusive group: 0
> > > > > > > > >   Capture channels: Mono
> > > > > > > > >   Mono: Capture [off]
> > > > > > > > > Simple mixer control 'Internal Mic Boost',0
> > > > > > > > >   Capabilities: volume
> > > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > > >   Capture channels: Front Left - Front Right
> > > > > > > > >   Limits: 0 - 3
> > > > > > > > >   Front Left: 0 [0%] [0.00dB]
> > > > > > > > >   Front Right: 0 [0%] [0.00dB]
> > > > > > > > > Simple mixer control 'Master',0
> > > > > > > > >   Capabilities: pvolume pvolume-joined pswitch pswitch-joined
> > > > > > > > >   Playback channels: Mono
> > > > > > > > >   Limits: Playback 0 - 87
> > > > > > > > >   Mono: Playback 83 [95%] [-3.00dB] [on]
> > > > > > > > > Simple mixer control 'Headphone',0
> > > > > > > > >   Capabilities: pvolume pswitch
> > > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > > >   Limits: Playback 0 - 87
> > > > > > > > >   Mono:
> > > > > > > > >   Front Left: Playback 87 [100%] [0.00dB] [on]
> > > > > > > > >   Front Right: Playback 87 [100%] [0.00dB] [on]
> > > > > > > > > Simple mixer control 'Headphone Mic',0
> > > > > > > > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > > > > > > > >   Capture exclusive group: 0
> > > > > > > > >   Capture channels: Mono
> > > > > > > > >   Mono: Capture [off]
> > > > > > > > > Simple mixer control 'Headphone Mic Boost',0
> > > > > > > > >   Capabilities: volume
> > > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > > >   Capture channels: Front Left - Front Right
> > > > > > > > >   Limits: 0 - 3
> > > > > > > > >   Front Left: 0 [0%] [0.00dB]
> > > > > > > > >   Front Right: 0 [0%] [0.00dB]
> > > > > > > > > Simple mixer control 'Speaker',0
> > > > > > > > >   Capabilities: pvolume pswitch
> > > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > > >   Limits: Playback 0 - 87
> > > > > > > > >   Mono:
> > > > > > > > >   Front Left: Playback 0 [0%] [-65.25dB] [off]
> > > > > > > > >   Front Right: Playback 0 [0%] [-65.25dB] [off]
> > > > > > > > > Simple mixer control 'PCM',0
> > > > > > > > >   Capabilities: pvolume
> > > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > > >   Limits: Playback 0 - 255
> > > > > > > > >   Mono:
> > > > > > > > >   Front Left: Playback 255 [100%] [0.00dB]
> > > > > > > > >   Front Right: Playback 255 [100%] [0.00dB]
> > > > > > > > > Simple mixer control 'IEC958',0
> > > > > > > > >   Capabilities: pswitch pswitch-joined
> > > > > > > > >   Playback channels: Mono
> > > > > > > > >   Mono: Playback [off]
> > > > > > > > > Simple mixer control 'IEC958',1
> > > > > > > > >   Capabilities: pswitch pswitch-joined
> > > > > > > > >   Playback channels: Mono
> > > > > > > > >   Mono: Playback [on]
> > > > > > > > > Simple mixer control 'IEC958',2
> > > > > > > > >   Capabilities: pswitch pswitch-joined
> > > > > > > > >   Playback channels: Mono
> > > > > > > > >   Mono: Playback [on]
> > > > > > > > > Simple mixer control 'IEC958',3
> > > > > > > > >   Capabilities: pswitch pswitch-joined
> > > > > > > > >   Playback channels: Mono
> > > > > > > > >   Mono: Playback [on]
> > > > > > > > > Simple mixer control 'IEC958',4
> > > > > > > > >   Capabilities: pswitch pswitch-joined
> > > > > > > > >   Playback channels: Mono
> > > > > > > > >   Mono: Playback [on]
> > > > > > > > > Simple mixer control 'Capture',0
> > > > > > > > >   Capabilities: cvolume cswitch
> > > > > > > > >   Capture channels: Front Left - Front Right
> > > > > > > > >   Limits: Capture 0 - 63
> > > > > > > > >   Front Left: Capture 63 [100%] [30.00dB] [on]
> > > > > > > > >   Front Right: Capture 63 [100%] [30.00dB] [on]
> > > > > > > > > Simple mixer control 'Auto-Mute Mode',0
> > > > > > > > >   Capabilities: enum
> > > > > > > > >   Items: 'Disabled' 'Enabled'
> > > > > > > > >   Item0: 'Disabled'
> > > > > > > > > Simple mixer control 'Headset Mic',0
> > > > > > > > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > > > > > > > >   Capture exclusive group: 0
> > > > > > > > >   Capture channels: Mono
> > > > > > > > >   Mono: Capture [on]
> > > > > > > > > Simple mixer control 'Headset Mic Boost',0
> > > > > > > > >   Capabilities: volume
> > > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > > >   Capture channels: Front Left - Front Right
> > > > > > > > >   Limits: 0 - 3
> > > > > > > > >   Front Left: 1 [33%] [10.00dB]
> > > > > > > > >   Front Right: 1 [33%] [10.00dB]
> > > > > > > > > Simple mixer control 'Internal Mic',0
> > > > > > > > >   Capabilities: cswitch cswitch-joined cswitch-exclusive
> > > > > > > > >   Capture exclusive group: 0
> > > > > > > > >   Capture channels: Mono
> > > > > > > > >   Mono: Capture [off]
> > > > > > > > > Simple mixer control 'Internal Mic Boost',0
> > > > > > > > >   Capabilities: volume
> > > > > > > > >   Playback channels: Front Left - Front Right
> > > > > > > > >   Capture channels: Front Left - Front Right
> > > > > > > > >   Limits: 0 - 3
> > > > > > > > >   Front Left: 0 [0%] [0.00dB]
> > > > > > > > >   Front Right: 0 [0%] [0.00dB]
> > > > > >
> > > >
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
