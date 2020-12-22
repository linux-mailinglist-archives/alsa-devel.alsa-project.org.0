Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF2A2E0485
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Dec 2020 03:52:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDAE01768;
	Tue, 22 Dec 2020 03:51:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDAE01768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608605523;
	bh=ALF99WUKAwW2sbY13eFVrIB3h5j1qqJRhhy33/Ig5DM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kdXBsYLyazFJWh0yi3gxQJtMTlI18BvfrbEQiSOcLhxSWONHh39vL6k0JzZFSbU3t
	 w0AimfykuE45CSVsbCgzSeQ1u2NZ0LkzHUYsUwZLWp2ceGZWEmjDqLk6TP4hrWrc1N
	 VGkRd8j4PYDseoU4oPRCL3OYfkaezGMh1w7f7id8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6409EF80232;
	Tue, 22 Dec 2020 03:50:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8F7AF80224; Tue, 22 Dec 2020 03:50:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F872F800BC
 for <alsa-devel@alsa-project.org>; Tue, 22 Dec 2020 03:50:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F872F800BC
Received: from mail-lf1-f70.google.com ([209.85.167.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1krXkT-0003Az-Fh
 for alsa-devel@alsa-project.org; Tue, 22 Dec 2020 02:50:05 +0000
Received: by mail-lf1-f70.google.com with SMTP id o16so14560927lfo.0
 for <alsa-devel@alsa-project.org>; Mon, 21 Dec 2020 18:50:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N2WMaOhgXeDwILxq6jfp+AN/tR6hFKnoPSJxCRZJRSk=;
 b=OwMd1c9xBVpFpZvDANqjmwmWAcS2O7Ggd06anErAhThjF4ZpPAo/4BX6d22fxsjnuC
 D0Nq+xWULoIRAt8Bd3snfK2VgraX+ck1turXEXmLlbp+6z2PlFwqHAJPA9ehCImfcpEK
 Y19nGmSg29d0JVvFzDdEQt61w+oJHtFFz96d0UBanClWFv4iBFLWweTlxz8lrnxxhKPK
 4UflrksCWBR5W8e/775KF/icOOAkX7Fn38tPBTXlKKpI5t/EvFLnmHrPcLBZWs/g15pb
 pbOgR/Am+fvCBOPz6mQbMpKb6oI3jzebhUELqLlrF4few6eJCyBzWv23ktDoAoYl3clt
 T5OA==
X-Gm-Message-State: AOAM5339sKbZLYBNNJtn64e4bdHQjXXJolWJAGgV80l3PN/aTNrbRqyy
 1mbX0GIvcTA4rYc0ueVHMPBom4mc55MwELswZNB7Y9F/ojDFG8pmMkcLmOim2U81koK+Fh9FQgq
 0DLZG9uLgF64w7hiWl6pN1mVd9VAfqZKfm1yB2PEvVfJ9Rba+kQtHJjpR
X-Received: by 2002:a19:dc5:: with SMTP id 188mr8244383lfn.513.1608605404812; 
 Mon, 21 Dec 2020 18:50:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2RV37UUec/PcA87XKutLKbjDR6qoXQSMlpRpU1eKlPPw5UWb60W7kMgtYOQIg5DFid2leHa/hfFsclEh336A=
X-Received: by 2002:a19:dc5:: with SMTP id 188mr8244369lfn.513.1608605404522; 
 Mon, 21 Dec 2020 18:50:04 -0800 (PST)
MIME-Version: 1.0
References: <20201214060621.1102931-1-kai.heng.feng@canonical.com>
 <20201216124726.2842197-1-kai.heng.feng@canonical.com>
 <s5h5z51oj12.wl-tiwai@suse.de>
 <CAAd53p6kORC1GsW5zt+=0=J5ki43iriO-OqtFvf5W67LWhyyhA@mail.gmail.com>
 <s5hzh2dn3oa.wl-tiwai@suse.de>
 <CAAd53p6Ef2zFX_t3y1c6O7BmHnxYGtGSfgzXAMQSom1ainWXzg@mail.gmail.com>
 <s5hsg85n2km.wl-tiwai@suse.de> <s5hmtydn0yg.wl-tiwai@suse.de>
 <CAAd53p6MMFh=HCNF9pyrJc9hVMZWFe7_8MvBcBHVWARqHU_TTA@mail.gmail.com>
 <s5h7dpfk06y.wl-tiwai@suse.de>
 <CAAd53p53w0H6tsb4JgQtFTkYinniicTYBs2uk7tc=heP2dM_Cw@mail.gmail.com>
 <CAKb7UvjWX7xbwMKtnad5EVy16nY1M-A13YJeRWyUwHzemcVswA@mail.gmail.com>
In-Reply-To: <CAKb7UvjWX7xbwMKtnad5EVy16nY1M-A13YJeRWyUwHzemcVswA@mail.gmail.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Tue, 22 Dec 2020 10:49:53 +0800
Message-ID: <CAAd53p4=bSX26QzsPyV1sxADiuVn2sowWyb5JFDoPZQ+ZYoCzA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v2] ALSA: hda: Continue to probe when codec
 probe fails
To: Ilia Mirkin <imirkin@alum.mit.edu>
Content-Type: text/plain; charset="UTF-8"
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 nouveau <nouveau@lists.freedesktop.org>, tiwai@suse.com,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Alan Stern <stern@rowland.harvard.edu>, Linux PCI <linux-pci@vger.kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Mike Rapoport <rppt@kernel.org>
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

On Tue, Dec 22, 2020 at 1:56 AM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>
> On Mon, Dec 21, 2020 at 11:33 AM Kai-Heng Feng
> <kai.heng.feng@canonical.com> wrote:
> >
> > [+Cc nouveau]
> >
> > On Fri, Dec 18, 2020 at 4:06 PM Takashi Iwai <tiwai@suse.de> wrote:
> > [snip]
> > > > Quite possibly the system doesn't power up HDA controller when there's
> > > > no external monitor.
> > > > So when it's connected to external monitor, it's still needed for HDMI audio.
> > > > Let me ask the user to confirm this.
> > >
> > > Yeah, it's the basic question whether the HD-audio is supposed to work
> > > on this machine at all.  If yes, the current approach we take makes
> > > less sense - instead we should rather make the HD-audio controller
> > > working.
> >
> > Yea, confirmed that the Nvidia HDA works when HDMI is connected prior boot.
> >
> > > > > - The second problem is that pci_enable_device() ignores the error
> > > > >   returned from pci_set_power_state() if it's -EIO.  And the
> > > > >   inaccessible access error returns -EIO, although it's rather a fatal
> > > > >   problem.  So the driver believes as the PCI device gets enabled
> > > > >   properly.
> > > >
> > > > This was introduced in 2005, by Alan's 11f3859b1e85 ("[PATCH] PCI: Fix
> > > > regression in pci_enable_device_bars") to fix UHCI controller.
> > > >
> > > > >
> > > > > - The third problem is that HD-audio driver blindly believes the
> > > > >   codec_mask read from the register even if it's a read failure as I
> > > > >   already showed.
> > > >
> > > > This approach has least regression risk.
> > >
> > > Yes, but it assumes that HD-audio is really non-existent.
> >
> > I really don't know any good approach to address this.
> > On Windows, HDA PCI is "hidden" until HDMI cable is plugged, then the
> > driver will flag the magic bit to make HDA audio appear on the PCI
> > bus.
> > IIRC the current approach is to make nouveau and device link work.
>
> I don't have the full context of this discussion, but the kernel
> force-enables the HDA subfunction nowadays, irrespective of nouveau or
> nvidia or whatever:

That's the problem.

The nvidia HDA controller on the affected system only gets its power
after HDMI cable plugged, so the probe on boot fails.

Kai-Heng

>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/quirks.c?h=v5.10#n5267
>
> Cheers,
>
>   -ilia
