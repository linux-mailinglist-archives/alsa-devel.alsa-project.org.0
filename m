Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D274E65E8
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Mar 2022 16:18:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5975A170C;
	Thu, 24 Mar 2022 16:17:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5975A170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648135088;
	bh=n068n4BhxJK+dmQWyU+9J4ghD1PWcNAHzuPww37ZW+o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EHlL/b3ULumbxPZtV7gLOzA64hL09xxoh/6XUY55JjFCp143+fBo29RPETiYi2Q5Z
	 NxMpDN+bSGKAsiyJPOYf+JN0uwJDGsTkbdVg7nXEKpZYssNlt29qGzSdh7tastN9vX
	 y7UQYwD5D5/OoM290Evxa2uaZSRev7uNbvb9O/Ho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB37EF801EC;
	Thu, 24 Mar 2022 16:17:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92893F80165; Thu, 24 Mar 2022 16:17:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24EB4F80139
 for <alsa-devel@alsa-project.org>; Thu, 24 Mar 2022 16:16:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24EB4F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="i3q4b3Fd"
Received: by mail-lj1-x234.google.com with SMTP id q14so6587871ljc.12
 for <alsa-devel@alsa-project.org>; Thu, 24 Mar 2022 08:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2YP1TqgKI8pqB0UISM6zMYnIvpORKyzNc9JWqeYwASQ=;
 b=i3q4b3Fdhe7B+gTAAqboIDXsU8NQnN8w8v0ethEv+0q7rqhsJ7A+BlTgj+krkWM5Uw
 mhxP28E61/vdVeRHxfSX0wpOo0TVmeg3TzQv3SKSDzNQk4hYeF4A6sEuMeDezWwK3bu9
 lT/vA+DBYRhuQZNM08a/WsvWoN9WjIvGzG7HH29oKX/+2W7BABfFTWPjjWQC/PVfpzOm
 qXIMT9CXonGawR7IIMt/sL0EHrGvWFCh1e3vBDVtRGGrzFHn+4da1qQAVi13UukEgwdN
 3Wd70EdhnjRobmshb5MQcZFdqY+31BQ3/OzD56zXBZBIOIAooUB0llrHSli7N0Himhi/
 npgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2YP1TqgKI8pqB0UISM6zMYnIvpORKyzNc9JWqeYwASQ=;
 b=gI2Wm/RnPGxsgqhSAQ8xKAwKHx9DWKKefVxP3YRBWM5uWkQx+TUUKRZDJr2AV6OzID
 ynHIkhC6KLtABVHVkAE6UQj4YIm6lr9tbY/6Gd/veNyJr5VPtfFCHaDCnSzlI372f44t
 soBQQ8NHA81b4YuENLwbJh37c5rx3VNfkkVIjXoASfefEL1GeXkTxImhMDzRZ07Jn45n
 Q3xP/STwxn0s2k8ZOBvMLzQu4hKfy9CqmhlM5k533xmu8WkO8YkaTN+VKE8PBlejLu9c
 s3p2DAhFe0z2+LLqU/VVE7Oc/8sU7AG2ehC2X2vf3r8FFRxM1X6VVidUzMK3KhGC1Ues
 N4JA==
X-Gm-Message-State: AOAM532o6unxdEXUHQv/Xci4PZH/at5DG+NO1FkeiXUXRqcnaWCoMths
 mzarKJYH7VzyjmhZ0o1lVes4HYiGmoyDtawQFcCN/c5lx+M=
X-Google-Smtp-Source: ABdhPJx1oPpJtoO/s/9bdJZF1j3G5xUOrpLue+0+w+sFK84sDY99hIgwlhAKH0NWpL0OEi1lYkr1eHX1x9pLV8lMdyA=
X-Received: by 2002:a2e:bc22:0:b0:249:80b6:55fd with SMTP id
 b34-20020a2ebc22000000b0024980b655fdmr4589294ljf.135.1648135010320; Thu, 24
 Mar 2022 08:16:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAKf6xpuRJ84RVfqPRJu3RL4xGF-FLkvO84SHTWEmXJFUWTgBGQ@mail.gmail.com>
 <s5hh77puhtk.wl-tiwai@suse.de>
 <CAKf6xpuhT_S_TKjSv6gpL4ezCT6Qg_Tc9V-XXwKKEMZUO6G0-g@mail.gmail.com>
 <s5hbkxwtroq.wl-tiwai@suse.de>
In-Reply-To: <s5hbkxwtroq.wl-tiwai@suse.de>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 24 Mar 2022 11:16:38 -0400
Message-ID: <CAKf6xpug6wP8-dSFhmJjz3JXaUuc3DwkfpEotS_6zKsH9P+X1Q@mail.gmail.com>
Subject: Re: snd_hda_intel initialization failure with Xen PCI passthrough
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org
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

On Wed, Mar 23, 2022 at 3:05 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 23 Mar 2022 19:52:21 +0100,
> Jason Andryuk wrote:
> >
> > On Wed, Mar 23, 2022 at 5:41 AM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Tue, 22 Mar 2022 19:57:27 +0100,
> > > Jason Andryuk wrote:
> > > >
> > > > Hi,
> > > >
> > > > I'm running Xen hypervisor and using PCI passthrough to assign an
> > > > Intel HDA audio device (00:1f.3 Audio device: Intel Corporation Cannon
> > > > Point-LP High Definition Audio Controller (rev 30)) to a Xen HVM
> > > > virtual machine.  I do this for both Linux 5.4.185 and a different
> > > > Windows 10 VM (only one at a time).  The Windows VM seems to work
> > > > every time.  The Linux VM has issues after the first VM boot.  This is
> > > > one boot of the physical hardware and multiple boots of the virtual
> > > > machines.
> > > >
> > > > For Linux, on first boot, the sound card is detected and works
> > > > properly.  After that, things usually don't work.  I just ran a reboot
> > > > loop and it was:
> > > > 1st boot - audio detected and working
> > > > 2 & 3 - no audio
> > > > 4th - audio detected and working
> > > > 5 - 20 - no audio
> > > >
> > > > For boots 2, 3, 5-7, dmesg shows:
> > > > [    0.760401] hdaudio hdaudioC0D0: no AFG or MFG node found
> > > > [    0.760415] snd_hda_intel 0000:00:06.0: no codecs initialized
> > > >
> > > > For boots 8+, the errors changed to:
> > > > [    0.783397] hdaudio hdaudioC0D0: cannot read sub nodes for FG 0x10
> > > > [    0.783413] snd_hda_intel 0000:00:06.0: no codecs initialized
> > > >
> > > > At this point, I booted a Windows 10 VM and audio works
> > > >
> > > > Trying to boot Linux again gives a new error message
> > > > [    0.789041] snd_hda_intel 0000:00:06.0: Unknown capability 0
> > > > [    1.811205] snd_hda_intel 0000:00:06.0: No response from codec,
> > > > resetting bus: last cmd=0x0eef0004
> > > > [    1.811246] hdaudio hdaudioC0D0: cannot read sub nodes for FG 0x10ee
> > > > [    1.811263] snd_hda_intel 0000:00:06.0: no codecs initialized
> > > >
> > > > Reboot VM and it's back to:
> > > > [    0.775917] hdaudio hdaudioC0D0: no AFG or MFG node found
> > > > [    0.775932] snd_hda_intel 0000:00:06.0: no codecs initialized
> > > >
> > > > Reboot VM and again:
> > > > [    0.789069] hdaudio hdaudioC0D0: cannot read sub nodes for FG 0x10
> > > > [    0.789084] snd_hda_intel 0000:00:06.0: no codecs initialized
> > > >
> > > > Reboot physical laptop:
> > > > 1. boot Windows 10 - audio works
> > > > 2. boot Linux - audio works
> > > > 3. reboot Linux - no audio
> > > > [    0.773111] hdaudio hdaudioC0D0: no AFG or MFG node found
> > > > [    0.773151] snd_hda_intel 0000:00:06.0: no codecs initialized
> > > >
> > > > This seems to me like Windows does a better job resetting the card to
> > > > get the audio hardware working.  Any suggestions on what to
> > > > investigate?
> >
> > Thanks for taking a look, Takashi.
> >
> > > First off, 5.4.x is way too old to debug, please confirm the issue
> > > with the latest kernel.
> > >
> > > And, one test I'd try is to unload snd-hda-intel module before
> > > rebooting.  Does the problem persist?
> >
> > For my 5.4.186 VM, the module is built-in.  I tried `echo 0000:00:03.0
> > > /sys/bus/pci/driver/snd_hda_intel/unbind` before rebooting, but that
> > did not work.
> >
> > I switched to Fedora 35 in the VM with kernel 5.16.16.  That worked
> > the first time and failed the second.
> >
> > First working:
> > [    3.094907] snd_hda_intel 0000:00:06.0: DSP detected with PCI
> > class/subclass/prog-if info 0x040380
> > [    3.094912] snd_hda_intel 0000:00:06.0: NHLT table not found
> > [    3.197480] snd_hda_codec_realtek hdaudioC0D0: autoconfig for
> > ALC3204: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
> > [    3.197484] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0
> > (0x0/0x0/0x0/0x0/0x0)
> > [    3.197485] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1
> > (0x21/0x0/0x0/0x0/0x0)
> > [    3.197486] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
> > [    3.197487] snd_hda_codec_realtek hdaudioC0D0:    inputs:
> > [    3.197488] snd_hda_codec_realtek hdaudioC0D0:      Headset Mic=0x19
> > [    3.197489] snd_hda_codec_realtek hdaudioC0D0:      Headphone Mic=0x1a
> > [    3.197489] snd_hda_codec_realtek hdaudioC0D0:      Internal Mic=0x12
> > [   66.801958] snd_hda_intel 0000:00:06.0: azx_get_response timeout,
> > switching to polling mode: last cmd=0x00170500
> >
> > Second boot audio still failed after doing `echo 0000:00:06.0 >
> > /sys/bus/pci/driver/snd_hda_intel/unbind` and rmmod-ing lots of snd_*
> > modules.  I rmmod-ed the snd_*intel ones, but other snd* modules
> > including snd_hrtimer were in use and could not be removed.
>
> That's weird.  If you logout the desktop and go to VT, you can unload
> snd-hda-intel.  Then the other modules should be unloadable.
>
> And do you see the problem without VM?  That is, the host shows the
> same symptom?

Good idea.  Yes, it does work back in Dom0 (the host).  By default,
the sound card remains bound to the pciback driver after
de-assignment.  If I do `xl pci-assignable-remove -r 0000:00:1f.3`,
the audio driver is re-bound and it works.

The xen-pciback driver has a permissive configuration knob.  The
default is 0, and in that mode it limits access to PCI configuration
space to try to allow only known good items.  When set to 1, there is
no restriction on the config space.  This doesn't apply to dom0 - it
doesn't have restrictions.

With permissive=1, the linux snd_hda_intel driver seems to work fine.
It's when permissive=0 that we have the "only first boot works" issue.
Here is a message when it inhibits operation:
Linux (19): [    0.718092] pci 0000:00:06.0: reg 0x20: [mem
0xf2000000-0xf20fffff 64bit]
Linux-dm (20): [00:06.0] Write-back to unknown field 0x44 (partially)
inhibited (0x00)
Linux-dm (20): [00:06.0] If the device doesn't work, try enabling
permissive mode
Linux-dm (20): [00:06.0] (unsafe) and if it helps report the problem
to xen-devel
Linux (19): [    0.762790] snd_hda_intel 0000:00:06.0: no codecs initialized

Windows also has this, but it still works.
Windows10-dm (24): [00:06.0] Write-back to unknown field 0x79
(partially) inhibited (0x00)
Windows10-dm (24): [00:06.0] If the device doesn't work, try enabling
permissive mode
Windows10-dm (24): [00:06.0] (unsafe) and if it helps report the
problem to xen-devel

Those messages are from QEMU and it only prints on the first one, so
there could be more.

Sorry I didn't notice those earlier.

Preferably it would work with permissive=0.  While looking at this,
I've noticed some other issues with the Xen PCI passthrough code not
resetting the device.  I'm going to look into that more.

Thanks,
Jason
