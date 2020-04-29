Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 249461BE317
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 17:49:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD0D7168A;
	Wed, 29 Apr 2020 17:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD0D7168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588175386;
	bh=dJQQb/Q+Jj/WNKo369ImgSb5JR4+wE2exMCZhvi4tlU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hnm7HMEFTgCQs6HeWi3OlVEPl5qIyRqRXqlsWmaKFkUEGDfivXjb4ZujQOOG9+dsW
	 H2/UDctcfJZuSGtYuaRRq9W8xkK4A3hM1GH2DKOOPMZHeHG7cpqnieL0auuQP+w9Xp
	 Zs+VJpnTcKG5iDZs0MfQI68eXhsc6zH+v6bir1vw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91D1EF80217;
	Wed, 29 Apr 2020 17:48:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3506F8022B; Wed, 29 Apr 2020 17:48:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55471F80109
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 17:47:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55471F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Y/22yGEw"
Received: by mail-wr1-x444.google.com with SMTP id g13so3114194wrb.8
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 08:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nl5AzzUzfTdhg1mHlIElmuD4Tx4QKCT7uS5quGgMP68=;
 b=Y/22yGEwCTktzDgBxYn4qiD69fwdOl1JK2oztbwNpwouFrM2Yd8JVCy1CfcMHvA94L
 SxElDT2In37M2PgIe/7oZU7CP0zHUQtFrUSHfwm0Kw9j0XMWzy6tsGQOPvQSAPJGXkqs
 /GdeNrMHVOOQIMYR2bLsUKz14hVdvwOlIscuJEoT0cwjrXAcf7uCV408YbBjLSOuu7QP
 EKM3ifJTCwcltb5OXm/KaZeVXBAV65MppVSAXgT6o06qtPURLq8UD84S/ngH9EKRwMug
 wrxROl/OW+68Bf1lFEKSQVj0EbLdExYjAMlJCmw3HhEEht6EoI3tKz2+4nSjuXRf1mqI
 Nk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nl5AzzUzfTdhg1mHlIElmuD4Tx4QKCT7uS5quGgMP68=;
 b=gY1xpjA4+dh/w5ZkrgehMI6+SuLNZOgTYlkUxdKusPMrOgTJI/ascwQzEyZ8PxNNkc
 lqLoWB6IaVeg01vqbaLsJLkyWo2d3BNJYr32/kVFtvISZEHTMw/lpgYc+7QU/GRqcRu2
 Q17iKfxd7/UJxQaQpDJYksS2D9hv/H4BA0zS6kOncLPXfwUWAswo9rd70VeEAkipmDkw
 UpXKLn+YOPc/Q0AreyTltEkbquUtrmsbO5dJtktsv7Uz5Q0RYQoeh9m2t5hoiTKdzflO
 z/a8Rj0D5/3z0WT8jmlC4eQ04fLqaWdAEAVaD/CaA+TFmKuzhNipQzTQgFgqDpQlclhy
 nuyA==
X-Gm-Message-State: AGi0PuZPtRoFWDosLDxblOkB4Qisb54Oxb11Pd1wMQPnergnVr1ylmir
 pK6+FQWFpl6PwINO51jpihAwhEK+ILjY7rj5KaI=
X-Google-Smtp-Source: APiQypKlZkfeVyprlnMk0JpJ4qRsS9JSbcJqDw8Hnr5PxEkZ9H2RD17LHTSdj/LatXAHPM2UQ0XKqDLxCcxDuAh90sE=
X-Received: by 2002:adf:f844:: with SMTP id d4mr39213645wrq.362.1588175278191; 
 Wed, 29 Apr 2020 08:47:58 -0700 (PDT)
MIME-Version: 1.0
References: <PSXP216MB0438D2AF96CE0D4F83F48C4D80AE0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
 <MN2PR12MB4488E4909C1488FB507E0BF5F7AF0@MN2PR12MB4488.namprd12.prod.outlook.com>
 <s5ho8rdnems.wl-tiwai@suse.de>
 <PSXP216MB04387BF6B5F8DA84749E5D6F80AF0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
 <CADnq5_M=QEqxuCKjb_qZvFSvwM5eLEFfsepxYYXoouFoe5bn7A@mail.gmail.com>
 <s5h4kt4ojrf.wl-tiwai@suse.de>
 <CADnq5_MMQ5_MjEg=bkJJGMJP53RjB3yxvOW0nUDeWxzg3Q0pVQ@mail.gmail.com>
 <s5hv9lkm49n.wl-tiwai@suse.de>
 <PSXP216MB043899DC52E6C6BF728D77CD80AC0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
 <s5ha72ulp2y.wl-tiwai@suse.de>
 <PSXP216MB043822350CDE9E7EEA37730880AD0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
In-Reply-To: <PSXP216MB043822350CDE9E7EEA37730880AD0@PSXP216MB0438.KORP216.PROD.OUTLOOK.COM>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 Apr 2020 11:47:47 -0400
Message-ID: <CADnq5_MCQ7xHY=yhNtRW=ze0LRPzxuu-Mm7pD4kFa5R52UrGSw@mail.gmail.com>
Subject: Re: [PATCH 0/1] Fiji GPU audio register timeout when in BACO state
To: Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>
Content-Type: text/plain; charset="UTF-8"
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Takashi Iwai <tiwai@suse.com>, Lukas Wunner <lukas@wunner.de>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
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

On Wed, Apr 29, 2020 at 11:27 AM Nicholas Johnson
<nicholas.johnson-opensource@outlook.com.au> wrote:
>
> On Wed, Apr 29, 2020 at 09:37:41AM +0200, Takashi Iwai wrote:
> > On Tue, 28 Apr 2020 16:48:45 +0200,
> > Nicholas Johnson wrote:
> > >
> > > > > > >
> > > > > > > FWIW, I have a fiji board in a desktop system and it worked fine when
> > > > > > > this code was enabled.
> > > > > >
> > > > > > Is the new DC code used for Fiji boards?  IIRC, the audio component
> > > > > > binding from amdgpu is enabled only for DC, and without the audio
> > > > > > component binding the runtime PM won't be linked up, hence you can't
> > > > > > power up GPU from the audio side access automatically.
> > > > > >
> > > > >
> > > > > Yes, DC is enabled by default for all cards with runtime pm enabled.
> > > >
> > > > OK, thanks, I found that amdgpu got bound via component in the dmesg
> > > > output, too:
> > > >
> > > > [   21.294927] snd_hda_intel 0000:08:00.1: bound 0000:08:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
> > > >
> > > > This is the place soon after amdgpu driver gets initialized.
> > > > Then we see later another initialization phase:
> > > >
> > > > [   26.904127] rfkill: input handler enabled
> > > > [   37.264152] [drm] PCIE GART of 1024M enabled (table at 0x000000F400000000).
> > > >
> > > > here shows 10 seconds between them.  Then, it complained something:
> > > >
> > > >
> > > > [   37.363287] [drm] UVD initialized successfully.
> > > > [   37.473340] [drm] VCE initialized successfully.
> > > > [   37.477942] amdgpu 0000:08:00.0: [drm] Cannot find any crtc or sizes
> > >
> > > The above would be me hitting WindowsKey+P to change screens, but with
> > > no DisplayPort attached to Fiji, hence it unable to find crtc.
> > >
> > > >
> > > > ... and go further, and hitting HD-audio error:
> > > >
> > > That would be me having attached the DisplayPort and done WindowsKey+P
> > > again.
> > >
> > > > [   38.936624] [drm] fb mappable at 0x4B0696000
> > > > [   38.936626] [drm] vram apper at 0x4B0000000
> > > > [   38.936626] [drm] size 33177600
> > > > [   38.936627] [drm] fb depth is 24
> > > > [   38.936627] [drm]    pitch is 15360
> > > > [   38.936673] amdgpu 0000:08:00.0: fb1: amdgpudrmfb frame buffer device
> > > > [   40.092223] snd_hda_intel 0000:08:00.1: azx_get_response timeout, switching to polling mode: last cmd=0x00170500
> > > >
> > > > After this point, HD-audio communication was screwed up.
> > > >
> > > > This lastcmd in the above message is AC_SET_POWER_STATE verb for the
> > > > root node to D0, so the very first command to power up the codec.
> > > > The rest commands are also about the power up of each node, so the
> > > > whole error indicate that the power up at runtime resume failed.
> > > >
> > > > So, this looks to me as if the device gets runtime-resumed at the bad
> > > > moment?
> > > It does. However, this is not going to be easy to pin down.
> > >
> > > I moved from Arch to Ubuntu, and it behaves differently. I cannot
> > > trigger the bug in Ubuntu. Plus, it puts the GPUs asleep, even if
> > > attached at boot, unlike Arch. I will continue to try to trigger it. But
> > > even if this is a problem with the Linux distribution, it should not be
> > > able to trigger a kernel mode bug, so we should persist with finding it.
> >
> > Sure, that's a bug to be fixed.
> >
> > This made me thinking what happens if we load the HD-audio driver very
> > late.  Could you try to blacklist snd-hda-intel module, then load it
> > manually after plugging the DP monitor and activating it?
> Attached dmesg-blacklist-*
>
> It is interesting. If I enable the monitor with the module unloaded, and
> then load the module, I cannot trigger the bug, even if disabling the
> monitor, waiting for GPU to sleep, and then waking again.
>
> Even if I wake monitor up, put to sleep again, and then insmod when
> sleeping, it does not cause bug when waking again.
>
> Is there anything special about the first time the monitor is used?
>

What do you mean by used?  Do you mean plugged in to the GPU or used
in the GUI?  It might be easier to debug this without a GUI involved.
Can you try this at runlevel 3 or something equivalent for your
distro?

When the GPU is powered up, the driver gets an interrupt when a
display is hotplugged and generates an event and userspace
applications can listen for these events.  When the GPU is powered
down, there's no interrupt.  I think most GUIs poll GPUs periodically
to handle this case so they can detect a new display even when the GPU
is off.  Maybe we are getting some sort of race here.  GUI queries GPU
driver, causes GPU to wake up, checks attached displays, GPU driver
resets runtime pm timer.  GPU goes back to sleep.  The detection
updates the ELD data which causes the HDA driver to wake up.  It
assumes the hw is on and tries to query it.  In the meantime, the GPU
has already powered everything down again.

Alex

> >
> > Also, could you track who called the problematic power-up sequence,
> > e.g. by adding WARN_ON_ONCE()?
> Attached dmesg-warning
>
> >
> > Last but not least, please check /proc/asound/card1/eld#* files (there
> > are both card0 and card1 or such that contain eld#* files, and one is
> > for i915 and another for amdgpu) before and after plugging.  This
> > shows whether the audio connection was recognized or not.
> Before plugging: card not yet attached, so the sysfs for that card not
> yet created
>
> After plugging (and insmod snd-hda-intel.ko):
> codec#0  codec#2  eld#2.0  eld#2.1  eld#2.2  eld#2.3  eld#2.4  eld#2.5  eld#2.6  eld#2.7  eld#2.8  id  pcm0c  pcm0p  pcm10p  pcm3p  pcm7p  pcm8p  pcm9p
>
> Regards,
> Nicholas
>
> >
> >
> > thanks,
> >
> > Takashi
> >
> > --- a/sound/hda/hdac_controller.c
> > +++ b/sound/hda/hdac_controller.c
> > @@ -224,6 +224,7 @@ void snd_hdac_bus_update_rirb(struct hdac_bus *bus)
> >                       dev_err_ratelimited(bus->dev,
> >                               "spurious response %#x:%#x, last cmd=%#08x\n",
> >                               res, res_ex, bus->last_cmd[addr]);
> > +                     WARN_ON_ONCE(1);
> >               }
> >       }
> >  }
