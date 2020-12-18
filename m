Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC4C2DDDC5
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 06:11:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE101173F;
	Fri, 18 Dec 2020 06:10:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE101173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608268298;
	bh=enVYOVZjHnhWcaXFrWlC6qCXgOfN81We40AUFpVTcRc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fxC74BV1A/ABDMYhKYBq3/eCAt37fEcFzwE+tjuJfpyoivn6W5CC5AmCU9ZNxGgQd
	 XFY7bDyJwPlB7ny/R0YUJi+YjHtQ6jYstMJfW3U0gOUVPPLCCHkdBRJ7Xq5gbnW4v0
	 2xCkArzoqVQf2KcTcp+mIB97dlE4rUbH4C43J/KU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AC9EF801F7;
	Fri, 18 Dec 2020 06:10:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0FDBF801F7; Fri, 18 Dec 2020 06:09:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65227F80103
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 06:09:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65227F80103
Received: from mail-lf1-f70.google.com ([209.85.167.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kq81W-00062V-IV
 for alsa-devel@alsa-project.org; Fri, 18 Dec 2020 05:09:50 +0000
Received: by mail-lf1-f70.google.com with SMTP id x187so682363lfa.3
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 21:09:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pY1xZSc1oftgiAUqf+iKoHq/WX75Jh9PZIkO1oo2OtQ=;
 b=OTrdSadLa+IyyJXBF3qqFas3nIkpLFjUV2jU8UtM+Mp4P7Wmt7OaiSfEhLpf0ETE9t
 Jh33u4cdTXj78RxMRRQr0Z9IkGvFaCmvx4vN4Uc6K2RXaIzSkZCddSg5QTb9/7LFD7oQ
 BR/TsmjziT119Dac5wlq/tJcNgFn5YFAhdZN6TqtA1H6D1Tv4avYo3MYLLbcl9gZe9NG
 lApGbyabnOr2OAiJY3dGfiCLZlWSqVjGXmnXUzvHxBwOcfwveV6g5OUe099/nDLDYC6E
 3xlxJmWdRwIPmmm4yi/xec7b53UWstjIf+Hjaz7HVR4+5KYxFdGWYsNSs9TgROZCEKsH
 DeTQ==
X-Gm-Message-State: AOAM5321OdUs1lMJTc7ebQqbQlOtVCyyW0ywu7tDdlOFnI5JH3zYfL+z
 YiqpWLnj97iL02H5FxeuhURwKlk9z2pDzGzVrIjzO15sKh8CRBM+C04I6t+xe1r+NWKyQWE7sKS
 RXLY1v2EqZCundka5jGarHnezn4J1+eOrSJjdrQGN9wGr4nkpGGX+UQVH
X-Received: by 2002:a19:4084:: with SMTP id n126mr877934lfa.290.1608268189938; 
 Thu, 17 Dec 2020 21:09:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyP3dO0JnfLiAYXjB2txwEFjyq/84nQyU+fpWUn+fNYlCjFHBrR+Zr6WJO5yXO9fJSPn5lwEE1gLGICFRds1+M=
X-Received: by 2002:a19:4084:: with SMTP id n126mr877924lfa.290.1608268189671; 
 Thu, 17 Dec 2020 21:09:49 -0800 (PST)
MIME-Version: 1.0
References: <20201214060621.1102931-1-kai.heng.feng@canonical.com>
 <20201216124726.2842197-1-kai.heng.feng@canonical.com>
 <s5h5z51oj12.wl-tiwai@suse.de>
 <CAAd53p6kORC1GsW5zt+=0=J5ki43iriO-OqtFvf5W67LWhyyhA@mail.gmail.com>
 <s5hzh2dn3oa.wl-tiwai@suse.de>
 <CAAd53p6Ef2zFX_t3y1c6O7BmHnxYGtGSfgzXAMQSom1ainWXzg@mail.gmail.com>
 <s5hsg85n2km.wl-tiwai@suse.de> <s5hmtydn0yg.wl-tiwai@suse.de>
In-Reply-To: <s5hmtydn0yg.wl-tiwai@suse.de>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Fri, 18 Dec 2020 13:09:38 +0800
Message-ID: <CAAd53p6MMFh=HCNF9pyrJc9hVMZWFe7_8MvBcBHVWARqHU_TTA@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda: Continue to probe when codec probe fails
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 Bjorn Helgaas <bhelgaas@google.com>, Alan Stern <stern@rowland.harvard.edu>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Mike Rapoport <rppt@kernel.org>
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

[+Cc Bjorn, Alan and linux-pci]

On Thu, Dec 17, 2020 at 12:57 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 16 Dec 2020 17:22:17 +0100,
> Takashi Iwai wrote:
> >
> > On Wed, 16 Dec 2020 17:07:45 +0100,
> > Kai-Heng Feng wrote:
> > >
> > > On Wed, Dec 16, 2020 at 11:58 PM Takashi Iwai <tiwai@suse.de> wrote:
> > > >
> > > > On Wed, 16 Dec 2020 16:50:20 +0100,
> > > > Kai-Heng Feng wrote:
> > > > >
> > > > > On Wed, Dec 16, 2020 at 11:41 PM Takashi Iwai <tiwai@suse.de> wrote:
> > > > > >
> > > > > > On Wed, 16 Dec 2020 13:47:24 +0100,
> > > > > > Kai-Heng Feng wrote:
> > > > > > >
> > > > > > > Similar to commit 9479e75fca37 ("ALSA: hda: Keep the controller
> > > > > > > initialization even if no codecs found"), when codec probe fails, it
> > > > > > > doesn't enable runtime suspend, and can prevent graphics card from
> > > > > > > getting powered down:
> > > > > > > [    4.280991] snd_hda_intel 0000:01:00.1: no codecs initialized
> > > > > > >
> > > > > > > $ cat /sys/bus/pci/devices/0000:01:00.1/power/runtime_status
> > > > > > > active
> > > > > > >
> > > > > > > So mark there's no codec and continue probing to let runtime PM to work.
> > > > > > >
> > > > > > > BugLink: https://bugs.launchpad.net/bugs/1907212
> > > > > > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > > > > >
> > > > > > Hm, but if the probe fails, doesn't it mean something really wrong?
> > > > > > IOW, how does this situation happen?
> > > > >
> > > > > The HDA controller is forcely created by quirk_nvidia_hda(). So
> > > > > probably there's really not an HDA controller.
> > > >
> > > > I still don't understand how non-zero codec_mask is passed.
> > > > The non-zero codec_mask means that BIOS or whatever believes that
> > > > HD-audio codecs are present and let HD-audio controller reporting the
> > > > presence.  What error did you get at probing?
> > >
> > > [    4.280991] snd_hda_intel 0000:01:00.1: no codecs initialized
> > > Full dmesg here:
> > > https://launchpadlibrarian.net/510351476/dmesg.log
> >
> > The actual problems are shown before that line.
> >
> > [    4.178848] pci 0000:01:00.1: can't change power state from D3cold to D0 (config space inaccessible)
> > [    4.179502] snd_hda_intel 0000:01:00.1: can't change power state from D3cold to D0 (config space inaccessible)
> > [    4.179511] snd_hda_intel 0000:01:00.1: can't change power state from D3hot to D0 (config space inaccessible)
> > ....
> > [    4.280571] hdaudio hdaudioC1D0: no AFG or MFG node found
> > [    4.280633] hdaudio hdaudioC1D1: no AFG or MFG node found
> > [    4.280685] hdaudio hdaudioC1D2: no AFG or MFG node found
> > [    4.280736] hdaudio hdaudioC1D3: no AFG or MFG node found
> > [    4.280788] hdaudio hdaudioC1D4: no AFG or MFG node found
> > [    4.280839] hdaudio hdaudioC1D5: no AFG or MFG node found
> > [    4.280892] hdaudio hdaudioC1D6: no AFG or MFG node found
> > [    4.280943] hdaudio hdaudioC1D7: no AFG or MFG node found
> >
> > Could you check the codec_mask value read in
> > sound/hda/hdac_controller.c?  I guess it reads 0xff.
> >
> > If that's the case, it can be corrected by the patch below.
> > But, we should check the cause of the first error (inaccessible config
> > space) in anyway; this must be the primary reason of the whole chain
> > of errors.
>
> Now I took a deeper look at the code.  So we hit errors after errors:
> - The first problem is that quirk_nvidia_hda() enabled HD-audio even
>   if it's non-functional by some reason.  We may need additional
>   checks there.

Quite possibly the system doesn't power up HDA controller when there's
no external monitor.
So when it's connected to external monitor, it's still needed for HDMI audio.
Let me ask the user to confirm this.

>
> - The second problem is that pci_enable_device() ignores the error
>   returned from pci_set_power_state() if it's -EIO.  And the
>   inaccessible access error returns -EIO, although it's rather a fatal
>   problem.  So the driver believes as the PCI device gets enabled
>   properly.

This was introduced in 2005, by Alan's 11f3859b1e85 ("[PATCH] PCI: Fix
regression in pci_enable_device_bars") to fix UHCI controller.

>
> - The third problem is that HD-audio driver blindly believes the
>   codec_mask read from the register even if it's a read failure as I
>   already showed.

This approach has least regression risk.

Kai-Heng

> Ideally we should address in the first place.
>
>
> Takashi
