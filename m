Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C83DA4E58C4
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Mar 2022 19:53:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F2E216E6;
	Wed, 23 Mar 2022 19:53:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F2E216E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648061633;
	bh=PqQmKaMhr0g5MSSQJgk9KuHSGnke3ffQKjDLYs50toM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GWZ/CRzazcAij4H73oikidy0GXOJuqeCl2JInMnlcZa/rR+e9DLW9S8uNqjW9mleG
	 s+TsNpF+P4MzsOJimkFjKO7f92w9ZFnLIRivSPtOPC+W2O9ckhTmxlIPpcZQSY52VN
	 /L3mLJB5QIHt0XSUStmNmpP98ajToA0dTqXxy1Uc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD28CF80165;
	Wed, 23 Mar 2022 19:52:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1DACF802DB; Wed, 23 Mar 2022 19:52:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C986F800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 19:52:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C986F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WhUEzxC+"
Received: by mail-lj1-x231.google.com with SMTP id u3so3206516ljd.0
 for <alsa-devel@alsa-project.org>; Wed, 23 Mar 2022 11:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QzG9Tn1RVt7t2G4wmgAnXT9EAB9gvZmhh3g6kHTpx0A=;
 b=WhUEzxC+MJwEXy6CZUaoEWT6Ja+3wCWig6RnFUpclDUcLHe2j4h98p9fhSvyYlR9HS
 9gCXbmE9nE9gxxR9BfTfp92UMatF79pbNUXN5rRqd90VonUgKAtJ8IVTduC4Uy9SRh1g
 fhcR/n86AXqYvgWZ7BtZ49Ono+NTxDb7b9NDTMd98o7E8QJGpBKG8Z2P4LNFO6Zzs25E
 to7kbR7qcNt9+B0lz/Jl2vMCA0LQIA6LVU3rTCO10+qU2slvEpShO7hexF9pnZX11WCK
 MBuDlQb4mJW054/8xCEWbe3rSu8F7m4bU/Mc4PXYd8s15FkBnToFnILkRhaZKpa8o2Vl
 03ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QzG9Tn1RVt7t2G4wmgAnXT9EAB9gvZmhh3g6kHTpx0A=;
 b=O1UF8aMEYwRs4V6fZxZnLZrfKhNh32YYIYTwgKeCwaW38RrVYeNJw1Gps1BlzWEV1L
 5UDLPa6/9D71uOqnJ/5pO3HiEKIhOgN0uyyMOvtuW01PHyvaVXzF4DXWg7IhQLfMQPba
 JG8tKkyUzqdGLZjwoMl9r7Tf+qeGzbcVYuR1ZTwmIRgQLujMf2QR/LkxmrVT/h+kWiKJ
 WmECY5T0YKrmYMHmoqKgQcPkJ8nw6km1kexGF5/51mVuUZ9MvGzyR3p8NgGFztbBrnUj
 ccNWTltUIwL+VkPpIg4O5morJcjXga5jAyBR+6zKwVTwqtgYyIU6lIU1pcWSV77EiHOJ
 W0jw==
X-Gm-Message-State: AOAM533ekPHwtB2PKMcs2O6o4gIA3o5CGDRVm26ZB/eng6GOsUffmv39
 HSsjsdk8UF/u6ZtRONVSqrQYjoQ5zFHujhKvF5w=
X-Google-Smtp-Source: ABdhPJwIZK59ixSxFv+Zkfl7ohIkaOPJzGufNtImQHhbQMda9RQydrgyCdTCpkG3eQxFwiiYLCDq2K+LFxroW8DmtGc=
X-Received: by 2002:a2e:9c8:0:b0:248:f8:67c5 with SMTP id
 191-20020a2e09c8000000b0024800f867c5mr1177573ljj.19.1648061552920; 
 Wed, 23 Mar 2022 11:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAKf6xpuRJ84RVfqPRJu3RL4xGF-FLkvO84SHTWEmXJFUWTgBGQ@mail.gmail.com>
 <s5hh77puhtk.wl-tiwai@suse.de>
In-Reply-To: <s5hh77puhtk.wl-tiwai@suse.de>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 23 Mar 2022 14:52:21 -0400
Message-ID: <CAKf6xpuhT_S_TKjSv6gpL4ezCT6Qg_Tc9V-XXwKKEMZUO6G0-g@mail.gmail.com>
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

On Wed, Mar 23, 2022 at 5:41 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 22 Mar 2022 19:57:27 +0100,
> Jason Andryuk wrote:
> >
> > Hi,
> >
> > I'm running Xen hypervisor and using PCI passthrough to assign an
> > Intel HDA audio device (00:1f.3 Audio device: Intel Corporation Cannon
> > Point-LP High Definition Audio Controller (rev 30)) to a Xen HVM
> > virtual machine.  I do this for both Linux 5.4.185 and a different
> > Windows 10 VM (only one at a time).  The Windows VM seems to work
> > every time.  The Linux VM has issues after the first VM boot.  This is
> > one boot of the physical hardware and multiple boots of the virtual
> > machines.
> >
> > For Linux, on first boot, the sound card is detected and works
> > properly.  After that, things usually don't work.  I just ran a reboot
> > loop and it was:
> > 1st boot - audio detected and working
> > 2 & 3 - no audio
> > 4th - audio detected and working
> > 5 - 20 - no audio
> >
> > For boots 2, 3, 5-7, dmesg shows:
> > [    0.760401] hdaudio hdaudioC0D0: no AFG or MFG node found
> > [    0.760415] snd_hda_intel 0000:00:06.0: no codecs initialized
> >
> > For boots 8+, the errors changed to:
> > [    0.783397] hdaudio hdaudioC0D0: cannot read sub nodes for FG 0x10
> > [    0.783413] snd_hda_intel 0000:00:06.0: no codecs initialized
> >
> > At this point, I booted a Windows 10 VM and audio works
> >
> > Trying to boot Linux again gives a new error message
> > [    0.789041] snd_hda_intel 0000:00:06.0: Unknown capability 0
> > [    1.811205] snd_hda_intel 0000:00:06.0: No response from codec,
> > resetting bus: last cmd=0x0eef0004
> > [    1.811246] hdaudio hdaudioC0D0: cannot read sub nodes for FG 0x10ee
> > [    1.811263] snd_hda_intel 0000:00:06.0: no codecs initialized
> >
> > Reboot VM and it's back to:
> > [    0.775917] hdaudio hdaudioC0D0: no AFG or MFG node found
> > [    0.775932] snd_hda_intel 0000:00:06.0: no codecs initialized
> >
> > Reboot VM and again:
> > [    0.789069] hdaudio hdaudioC0D0: cannot read sub nodes for FG 0x10
> > [    0.789084] snd_hda_intel 0000:00:06.0: no codecs initialized
> >
> > Reboot physical laptop:
> > 1. boot Windows 10 - audio works
> > 2. boot Linux - audio works
> > 3. reboot Linux - no audio
> > [    0.773111] hdaudio hdaudioC0D0: no AFG or MFG node found
> > [    0.773151] snd_hda_intel 0000:00:06.0: no codecs initialized
> >
> > This seems to me like Windows does a better job resetting the card to
> > get the audio hardware working.  Any suggestions on what to
> > investigate?

Thanks for taking a look, Takashi.

> First off, 5.4.x is way too old to debug, please confirm the issue
> with the latest kernel.
>
> And, one test I'd try is to unload snd-hda-intel module before
> rebooting.  Does the problem persist?

For my 5.4.186 VM, the module is built-in.  I tried `echo 0000:00:03.0
> /sys/bus/pci/driver/snd_hda_intel/unbind` before rebooting, but that
did not work.

I switched to Fedora 35 in the VM with kernel 5.16.16.  That worked
the first time and failed the second.

First working:
[    3.094907] snd_hda_intel 0000:00:06.0: DSP detected with PCI
class/subclass/prog-if info 0x040380
[    3.094912] snd_hda_intel 0000:00:06.0: NHLT table not found
[    3.197480] snd_hda_codec_realtek hdaudioC0D0: autoconfig for
ALC3204: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
[    3.197484] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0
(0x0/0x0/0x0/0x0/0x0)
[    3.197485] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1
(0x21/0x0/0x0/0x0/0x0)
[    3.197486] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
[    3.197487] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[    3.197488] snd_hda_codec_realtek hdaudioC0D0:      Headset Mic=0x19
[    3.197489] snd_hda_codec_realtek hdaudioC0D0:      Headphone Mic=0x1a
[    3.197489] snd_hda_codec_realtek hdaudioC0D0:      Internal Mic=0x12
[   66.801958] snd_hda_intel 0000:00:06.0: azx_get_response timeout,
switching to polling mode: last cmd=0x00170500

Second boot audio still failed after doing `echo 0000:00:06.0 >
/sys/bus/pci/driver/snd_hda_intel/unbind` and rmmod-ing lots of snd_*
modules.  I rmmod-ed the snd_*intel ones, but other snd* modules
including snd_hrtimer were in use and could not be removed.
[    2.850918] snd_hda_intel 0000:00:06.0: DSP detected with PCI
class/subclass/prog-if info 0x040380
[    2.850923] snd_hda_intel 0000:00:06.0: NHLT table not found
[    2.873157] hdaudio hdaudioC0D0: no AFG or MFG node found
[    2.873161] snd_hda_intel 0000:00:06.0: no codecs initialized

A different second boot where audio failed:
[    2.892183] snd_hda_intel 0000:00:06.0: DSP detected with PCI
class/subclass/prog-if info 0x040380
[    2.892189] snd_hda_intel 0000:00:06.0: NHLT table not found
[    2.961762] hdaudio hdaudioC0D0: cannot read sub nodes for FG 0x0e
[    2.961768] snd_hda_intel 0000:00:06.0: no codecs initialized

Thanks,
Jason
