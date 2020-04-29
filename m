Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C811BE3A8
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 18:22:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 913311675;
	Wed, 29 Apr 2020 18:21:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 913311675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588177320;
	bh=al2owHatpljgIyNmq5enjoR8zBTgwTG5j/kvLKaRtoM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MbbuYzhdCwhBq8KCHAeZ2ZtgQGhIq9Z7YLDyInxvCAJ0LLEQdHcqRk4UW3uXG51cq
	 1za+iWZJUJDBB25QqWNMd8vfrrKH9Kob2nA9J8p3TE1OST/S50om1V1qPPXMwl2q23
	 YkIs49AZ8RpXg3Pfs2Caq/+yo6FC4QxFmjyIUwXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80887F80232;
	Wed, 29 Apr 2020 18:20:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF5B9F8022B; Wed, 29 Apr 2020 18:20:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36264F800D2
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 18:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36264F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RfJ4tEOq"
Received: by mail-wr1-x444.google.com with SMTP id t14so3242537wrw.12
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 09:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KLjnW7Dysz3kdSMdG14HgKt8xanjEW1w5wo++IQk2Ik=;
 b=RfJ4tEOqgeCUGmdBBjdoDwIv6ZcMQd8z0PQuBeNsQWK86kpCplVfsJ2vOOaX3v8hsC
 8bIhLwB07cNMSbMnqHoDeus1zeXXvz2JZpabpVhS1itbX0sy7XbFy/Eolr5Bnz9Ch599
 +5w8fOMeAxsrhEYQWNxqLktmyAKjKQUGmGhQeMB3YtUb5emV+Jd/Zka5OKX3tFhxqZm8
 /te4DCk3YZggeabKaofN8EkYv+rGu7zeooGgS+6t6NKvOrLNYG7FgAfJZI+sQrXsz5/I
 TyyYSSMTcqefhzOp19h2wub5x1T421cpjT/44hmIMmfP/HSkPxC1FtY9hBG8pjUqaWmu
 kAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KLjnW7Dysz3kdSMdG14HgKt8xanjEW1w5wo++IQk2Ik=;
 b=GWgeofe9TcnZ029+mUdyOhbKudqe+vaLoPK4WxcxMErFZ6WOJ2mEJBqVglLJWh76Dw
 FsrUVZa892zWxUG9VdAkAOEtvYhvYDHDhyIb/I1pcU6t6xmPyu5f/bc51ZQ/sF8dbIIL
 aDeM+C6MzXddk/889vcMpvLIqBAsyO9UdrG+KDcuNdz4LgqNc1h0LSAWo7KOpuQEhjEZ
 FfgVWq0JjVNspStOsbeA/pxKELrXfJRg8DYpska1myILGuKVXzJDC4IgBX/QettrSLoi
 HGKFfLTUMEk+w91tpx5xfGg5+rDN5alBSlr27RFI1iaVjY4mLBAQywT+qUicQy9OrHuK
 VBmQ==
X-Gm-Message-State: AGi0PubqQijIP4mmxoWjHvHFsGbnq+easJ4eroPu3WGJszkR041Yg3w9
 mhdTnf4wuamZ6jw0Z+dKDhKDhAoNITnNZIJzwXQ=
X-Google-Smtp-Source: APiQypIQ/dGJ4MTojSWWI2+ogBKbaCA53s9pAdQh0eMr4OEAO+IEk/6jOtIhk4tD+GdqLI5wveOJvvL9w4i+9DDcQc8=
X-Received: by 2002:adf:fe45:: with SMTP id m5mr42917180wrs.124.1588177208892; 
 Wed, 29 Apr 2020 09:20:08 -0700 (PDT)
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
 <CADnq5_MCQ7xHY=yhNtRW=ze0LRPzxuu-Mm7pD4kFa5R52UrGSw@mail.gmail.com>
 <s5h1ro6jn0v.wl-tiwai@suse.de>
In-Reply-To: <s5h1ro6jn0v.wl-tiwai@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 Apr 2020 12:19:57 -0400
Message-ID: <CADnq5_Mjb_FnNOzjUfJZ7GSDzi-+Cfc1ZTuqm7UWCWVvY6DU_w@mail.gmail.com>
Subject: Re: [PATCH 0/1] Fiji GPU audio register timeout when in BACO state
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: "Zhou, David\(ChunMing\)" <David1.Zhou@amd.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
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

On Wed, Apr 29, 2020 at 12:05 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 29 Apr 2020 17:47:47 +0200,
> Alex Deucher wrote:
> >
> > On Wed, Apr 29, 2020 at 11:27 AM Nicholas Johnson
> > <nicholas.johnson-opensource@outlook.com.au> wrote:
> > >
> > > On Wed, Apr 29, 2020 at 09:37:41AM +0200, Takashi Iwai wrote:
> > > > On Tue, 28 Apr 2020 16:48:45 +0200,
> > > > Nicholas Johnson wrote:
> > > > >
> > > > > > > > >
> > > > > > > > > FWIW, I have a fiji board in a desktop system and it worked fine when
> > > > > > > > > this code was enabled.
> > > > > > > >
> > > > > > > > Is the new DC code used for Fiji boards?  IIRC, the audio component
> > > > > > > > binding from amdgpu is enabled only for DC, and without the audio
> > > > > > > > component binding the runtime PM won't be linked up, hence you can't
> > > > > > > > power up GPU from the audio side access automatically.
> > > > > > > >
> > > > > > >
> > > > > > > Yes, DC is enabled by default for all cards with runtime pm enabled.
> > > > > >
> > > > > > OK, thanks, I found that amdgpu got bound via component in the dmesg
> > > > > > output, too:
> > > > > >
> > > > > > [   21.294927] snd_hda_intel 0000:08:00.1: bound 0000:08:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
> > > > > >
> > > > > > This is the place soon after amdgpu driver gets initialized.
> > > > > > Then we see later another initialization phase:
> > > > > >
> > > > > > [   26.904127] rfkill: input handler enabled
> > > > > > [   37.264152] [drm] PCIE GART of 1024M enabled (table at 0x000000F400000000).
> > > > > >
> > > > > > here shows 10 seconds between them.  Then, it complained something:
> > > > > >
> > > > > >
> > > > > > [   37.363287] [drm] UVD initialized successfully.
> > > > > > [   37.473340] [drm] VCE initialized successfully.
> > > > > > [   37.477942] amdgpu 0000:08:00.0: [drm] Cannot find any crtc or sizes
> > > > >
> > > > > The above would be me hitting WindowsKey+P to change screens, but with
> > > > > no DisplayPort attached to Fiji, hence it unable to find crtc.
> > > > >
> > > > > >
> > > > > > ... and go further, and hitting HD-audio error:
> > > > > >
> > > > > That would be me having attached the DisplayPort and done WindowsKey+P
> > > > > again.
> > > > >
> > > > > > [   38.936624] [drm] fb mappable at 0x4B0696000
> > > > > > [   38.936626] [drm] vram apper at 0x4B0000000
> > > > > > [   38.936626] [drm] size 33177600
> > > > > > [   38.936627] [drm] fb depth is 24
> > > > > > [   38.936627] [drm]    pitch is 15360
> > > > > > [   38.936673] amdgpu 0000:08:00.0: fb1: amdgpudrmfb frame buffer device
> > > > > > [   40.092223] snd_hda_intel 0000:08:00.1: azx_get_response timeout, switching to polling mode: last cmd=0x00170500
> > > > > >
> > > > > > After this point, HD-audio communication was screwed up.
> > > > > >
> > > > > > This lastcmd in the above message is AC_SET_POWER_STATE verb for the
> > > > > > root node to D0, so the very first command to power up the codec.
> > > > > > The rest commands are also about the power up of each node, so the
> > > > > > whole error indicate that the power up at runtime resume failed.
> > > > > >
> > > > > > So, this looks to me as if the device gets runtime-resumed at the bad
> > > > > > moment?
> > > > > It does. However, this is not going to be easy to pin down.
> > > > >
> > > > > I moved from Arch to Ubuntu, and it behaves differently. I cannot
> > > > > trigger the bug in Ubuntu. Plus, it puts the GPUs asleep, even if
> > > > > attached at boot, unlike Arch. I will continue to try to trigger it. But
> > > > > even if this is a problem with the Linux distribution, it should not be
> > > > > able to trigger a kernel mode bug, so we should persist with finding it.
> > > >
> > > > Sure, that's a bug to be fixed.
> > > >
> > > > This made me thinking what happens if we load the HD-audio driver very
> > > > late.  Could you try to blacklist snd-hda-intel module, then load it
> > > > manually after plugging the DP monitor and activating it?
> > > Attached dmesg-blacklist-*
> > >
> > > It is interesting. If I enable the monitor with the module unloaded, and
> > > then load the module, I cannot trigger the bug, even if disabling the
> > > monitor, waiting for GPU to sleep, and then waking again.
> > >
> > > Even if I wake monitor up, put to sleep again, and then insmod when
> > > sleeping, it does not cause bug when waking again.
> > >
> > > Is there anything special about the first time the monitor is used?
> > >
> >
> > What do you mean by used?  Do you mean plugged in to the GPU or used
> > in the GUI?  It might be easier to debug this without a GUI involved.
> > Can you try this at runlevel 3 or something equivalent for your
> > distro?
> >
> > When the GPU is powered up, the driver gets an interrupt when a
> > display is hotplugged and generates an event and userspace
> > applications can listen for these events.  When the GPU is powered
> > down, there's no interrupt.  I think most GUIs poll GPUs periodically
> > to handle this case so they can detect a new display even when the GPU
> > is off.  Maybe we are getting some sort of race here.  GUI queries GPU
> > driver, causes GPU to wake up, checks attached displays, GPU driver
> > resets runtime pm timer.  GPU goes back to sleep.  The detection
> > updates the ELD data which causes the HDA driver to wake up.  It
> > assumes the hw is on and tries to query it.  In the meantime, the GPU
> > has already powered everything down again.
>
> Well, but the code path there is the runtime PM resume of the audio
> device and it means that GPU must have been runtime-resumed again
> beforehand via the device link.  So, it should have worked from the
> beginning but in reality not -- that is, apparently some inconsistency
> is found in the initial attempt of the runtime resume...

Yeah, it should be covered, but I wonder if there is something in the
ELD update sequence that needs to call pm_runtime_get_sync()?  The ELD
sequence on AMD GPUs doesn't work the same as on other vendors.  The
GPU driver has a backdoor into the HDA device's verbs to set update
the audio state rather than doing it via an ELD buffer update.  We
still update the ELD buffer for consistency.  Maybe when the GPU
driver sets the audio state at monitor detection time that triggers an
interrupt or something on the HDA side which races with the CPU and
the power down of the GPU.  That still seems unlikely though since the
runtime pm on the GPU side defaults to a 5 second suspend timer.

Alex
