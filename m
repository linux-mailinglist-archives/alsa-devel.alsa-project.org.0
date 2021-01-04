Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E73FE2E95C6
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jan 2021 14:22:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F8A91680;
	Mon,  4 Jan 2021 14:22:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F8A91680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609766574;
	bh=VBJx6d0XXtsqidybrhudWNcpFp1DlkerENqMPkzNI0M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gwn3ThsWysnfhIt4mhbpb0LZlFsnnw/BbADZ58BXvbpP+rn56YchkpBHwOnZikgqu
	 GWdcj9Uyy7VZhdpzEYKdVg7DdrqikptMMbgId3V352GfSQC513ht09rAYX/Bj3DnoK
	 h8Rj/8Z9a9FG10sEFyCpxf1yCDXyOZm4V0QJVG98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFFF2F80165;
	Mon,  4 Jan 2021 14:21:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EA15F80166; Mon,  4 Jan 2021 14:21:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEBF5F80158
 for <alsa-devel@alsa-project.org>; Mon,  4 Jan 2021 14:21:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEBF5F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="RR+t52c/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609766466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vPrbs+ygK2nW6UXpFCX2PTOIhaEcotjknLDYayf1rbg=;
 b=RR+t52c/ES0bgXN62OrfOtjjhLmMeMkufS98DPBRXA5g9l+rBb+QiyOfyxQisqKx0uxmtQ
 3VlvqXta2VBHyOSRCx6Isg5nMZsQ1u9/kJd3iXt6wmy+5nDWPVqfg4u9pib2EHkMPXVNGv
 mUDSiKXc81BwnOfOlZ57btbEyfCu4z0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-ypL9F6GfNSauXQWcfwY5Ww-1; Mon, 04 Jan 2021 08:21:04 -0500
X-MC-Unique: ypL9F6GfNSauXQWcfwY5Ww-1
Received: by mail-wr1-f70.google.com with SMTP id u29so13315296wru.6
 for <alsa-devel@alsa-project.org>; Mon, 04 Jan 2021 05:21:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vPrbs+ygK2nW6UXpFCX2PTOIhaEcotjknLDYayf1rbg=;
 b=rmAJ8x8WH3/SOnTzdWMVToq5aUvS/rF9aIT0CF0uUcPD5bhxUOlGaTxKM/3IU+lJZZ
 Ug+LFj7JO7LvwzKdiKRdHbxodVdi4K+bpy1amo8tHCjepdJ141VrUq2AlBR5dE1ynbEX
 yqWqf+cjj46Smph+GE93TnsvuKDkewfTFYCNTD2fIY56wmR5zRhTu9Pulicde6R/ycZa
 axReoYUXJJ4onRHQ2mdZOqQH8yzxYb2A7TG50WhK6je0Ul3Wwk7S26R2V7mETTGkhjP4
 68JKkkckeUYXBL4odKNB9ocCfj4F/f2OGho+SuS6HCKKTH3x2Ywdp/pqATbZwhbLj2Lu
 QWVQ==
X-Gm-Message-State: AOAM530BZGlZ/A08QsK6SXDJrq4z394vuUQGLTElWKTXTgM15gnWXtB5
 ujMBof8GKJRX90zF2I6LqK6B2OyqHh9kqfXAmJ4ttVQjLvb1QULID+DvXfo5bByj8Wk8E1IiMkF
 AkbBENNB5sBCBmGSv+obHWe3YwmlSO3xteDYl/as=
X-Received: by 2002:adf:e452:: with SMTP id t18mr76929210wrm.177.1609766463252; 
 Mon, 04 Jan 2021 05:21:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwyejyAsfaLxHqjg5lrewtBBFczMjR6pbLPXoTYYnr8a8cMlhhVl17ylXysIJXWiOsLQQV2XV28iok3dOsd31w=
X-Received: by 2002:adf:e452:: with SMTP id t18mr76929177wrm.177.1609766463058; 
 Mon, 04 Jan 2021 05:21:03 -0800 (PST)
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
 <CAAd53p4=bSX26QzsPyV1sxADiuVn2sowWyb5JFDoPZQ+ZYoCzA@mail.gmail.com>
In-Reply-To: <CAAd53p4=bSX26QzsPyV1sxADiuVn2sowWyb5JFDoPZQ+ZYoCzA@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 4 Jan 2021 14:20:52 +0100
Message-ID: <CACO55tsPx_UC3OPf9Hq9sGdnZg9jH1+B0zOi6EAxTZ13E1tf7A@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v2] ALSA: hda: Continue to probe when codec
 probe fails
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 nouveau <nouveau@lists.freedesktop.org>, tiwai@suse.com,
 open list <linux-kernel@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Alan Stern <stern@rowland.harvard.edu>, Mike Rapoport <rppt@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Ilia Mirkin <imirkin@alum.mit.edu>
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

On Tue, Dec 22, 2020 at 3:50 AM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> On Tue, Dec 22, 2020 at 1:56 AM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> >
> > On Mon, Dec 21, 2020 at 11:33 AM Kai-Heng Feng
> > <kai.heng.feng@canonical.com> wrote:
> > >
> > > [+Cc nouveau]
> > >
> > > On Fri, Dec 18, 2020 at 4:06 PM Takashi Iwai <tiwai@suse.de> wrote:
> > > [snip]
> > > > > Quite possibly the system doesn't power up HDA controller when there's
> > > > > no external monitor.
> > > > > So when it's connected to external monitor, it's still needed for HDMI audio.
> > > > > Let me ask the user to confirm this.
> > > >
> > > > Yeah, it's the basic question whether the HD-audio is supposed to work
> > > > on this machine at all.  If yes, the current approach we take makes
> > > > less sense - instead we should rather make the HD-audio controller
> > > > working.
> > >
> > > Yea, confirmed that the Nvidia HDA works when HDMI is connected prior boot.
> > >
> > > > > > - The second problem is that pci_enable_device() ignores the error
> > > > > >   returned from pci_set_power_state() if it's -EIO.  And the
> > > > > >   inaccessible access error returns -EIO, although it's rather a fatal
> > > > > >   problem.  So the driver believes as the PCI device gets enabled
> > > > > >   properly.
> > > > >
> > > > > This was introduced in 2005, by Alan's 11f3859b1e85 ("[PATCH] PCI: Fix
> > > > > regression in pci_enable_device_bars") to fix UHCI controller.
> > > > >
> > > > > >
> > > > > > - The third problem is that HD-audio driver blindly believes the
> > > > > >   codec_mask read from the register even if it's a read failure as I
> > > > > >   already showed.
> > > > >
> > > > > This approach has least regression risk.
> > > >
> > > > Yes, but it assumes that HD-audio is really non-existent.
> > >
> > > I really don't know any good approach to address this.
> > > On Windows, HDA PCI is "hidden" until HDMI cable is plugged, then the
> > > driver will flag the magic bit to make HDA audio appear on the PCI
> > > bus.
> > > IIRC the current approach is to make nouveau and device link work.
> >
> > I don't have the full context of this discussion, but the kernel
> > force-enables the HDA subfunction nowadays, irrespective of nouveau or
> > nvidia or whatever:
>
> That's the problem.
>
> The nvidia HDA controller on the affected system only gets its power
> after HDMI cable plugged, so the probe on boot fails.
>

it might be that the code to enable the sub function is a bit broken
:/ but it should work. Maybe the quirk_nvidia_hda function needs to be
called on more occasions? No idea.

> Kai-Heng
>
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/quirks.c?h=v5.10#n5267
> >
> > Cheers,
> >
> >   -ilia
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

