Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E16FE2E2022
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 18:49:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B24117BF;
	Wed, 23 Dec 2020 18:48:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B24117BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608745748;
	bh=MTmv8gzoszlWkMeBQ/OzWNq2dhw8AhsB6l8Td3Dqmmw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jjGKY9yKwc+di7Nm69QfWvmWrSUhzGrE8OFjcHSEgA9weDgKjkxcEkZrsS1x2v9F1
	 ytXj/DZcblYqyCxCwAUWZ2fc2tEHkI4Us7IgvGnRPqWr5o/qv5GMx1bhtLtpKav0I3
	 a+7KWZAKbr8BSIcInkVg2WlKJ1VOWkpA0JNCv1IA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31017F804C1;
	Wed, 23 Dec 2020 18:45:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C0EEF801D5; Mon, 21 Dec 2020 18:56:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E214F800EC
 for <alsa-devel@alsa-project.org>; Mon, 21 Dec 2020 18:56:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E214F800EC
Received: by mail-ua1-f41.google.com with SMTP id y21so3567691uag.2
 for <alsa-devel@alsa-project.org>; Mon, 21 Dec 2020 09:56:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MrAF3XcfgmbCY17OqyOzfLrhkI98KCYJDR2DMtLfdY8=;
 b=s6KyXOSHT2yKby/8KUNdpBN8kzJcqPWdLTLgofPi97ngM/92uRirPe18RdtCp8ejh2
 eU4M07+8l6P0hTLEvtvULDjCXvxInxYs43U24oaFQlfBnA/s84tHKdu4GaiubB5/77yF
 fLFqi1QL4pBBpf8pYM4fgkuHEGWC8R/tubEr3Uo7BPQn7rKRILR95EzDbL3/TMORISfM
 mLKJ2WMTljZpouC90+WQEKWaIl5Ol8p46MMzq/7s13bRjIX28tMPQovoKAFg+arz4ZKk
 3jNQVa8dh1oInoAUXB1fy6GoOX3FlqPYfs/0qh/MBhZX+fxopG5bTQRRQqRhjU0U8RSb
 sElQ==
X-Gm-Message-State: AOAM532CukWbE7LXjfv/aVtAdCmKFnSyack1LkLQ4slBKgwJm9/ixIBA
 pnwc3g+AsonU+BFmOyKWJ7vg5gtgShepxVeYOcY=
X-Google-Smtp-Source: ABdhPJzVdL7B8bTZxy+rQMk6er8L4T5ie68H4w9L1UEygB7FM35lOkrdx7hEzcfKNr2eDQb6J0Pb9eQgDYeA07DY5rA=
X-Received: by 2002:ab0:1e4a:: with SMTP id n10mr13442742uak.98.1608573409390; 
 Mon, 21 Dec 2020 09:56:49 -0800 (PST)
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
In-Reply-To: <CAAd53p53w0H6tsb4JgQtFTkYinniicTYBs2uk7tc=heP2dM_Cw@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 21 Dec 2020 12:56:38 -0500
Message-ID: <CAKb7UvjWX7xbwMKtnad5EVy16nY1M-A13YJeRWyUwHzemcVswA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v2] ALSA: hda: Continue to probe when codec
 probe fails
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 23 Dec 2020 18:45:49 +0100
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

On Mon, Dec 21, 2020 at 11:33 AM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> [+Cc nouveau]
>
> On Fri, Dec 18, 2020 at 4:06 PM Takashi Iwai <tiwai@suse.de> wrote:
> [snip]
> > > Quite possibly the system doesn't power up HDA controller when there's
> > > no external monitor.
> > > So when it's connected to external monitor, it's still needed for HDMI audio.
> > > Let me ask the user to confirm this.
> >
> > Yeah, it's the basic question whether the HD-audio is supposed to work
> > on this machine at all.  If yes, the current approach we take makes
> > less sense - instead we should rather make the HD-audio controller
> > working.
>
> Yea, confirmed that the Nvidia HDA works when HDMI is connected prior boot.
>
> > > > - The second problem is that pci_enable_device() ignores the error
> > > >   returned from pci_set_power_state() if it's -EIO.  And the
> > > >   inaccessible access error returns -EIO, although it's rather a fatal
> > > >   problem.  So the driver believes as the PCI device gets enabled
> > > >   properly.
> > >
> > > This was introduced in 2005, by Alan's 11f3859b1e85 ("[PATCH] PCI: Fix
> > > regression in pci_enable_device_bars") to fix UHCI controller.
> > >
> > > >
> > > > - The third problem is that HD-audio driver blindly believes the
> > > >   codec_mask read from the register even if it's a read failure as I
> > > >   already showed.
> > >
> > > This approach has least regression risk.
> >
> > Yes, but it assumes that HD-audio is really non-existent.
>
> I really don't know any good approach to address this.
> On Windows, HDA PCI is "hidden" until HDMI cable is plugged, then the
> driver will flag the magic bit to make HDA audio appear on the PCI
> bus.
> IIRC the current approach is to make nouveau and device link work.

I don't have the full context of this discussion, but the kernel
force-enables the HDA subfunction nowadays, irrespective of nouveau or
nvidia or whatever:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/quirks.c?h=v5.10#n5267

Cheers,

  -ilia
