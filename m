Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C102DFE1B
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Dec 2020 17:35:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F61116FD;
	Mon, 21 Dec 2020 17:34:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F61116FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608568532;
	bh=dN/2QMVhLUiKlcrLKvwP+JZwotaepXPAFRBAX74xG24=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LRxhICsNOYobiPVqYE6jRFcdnoZlO7g1L01eEQijwKthf8MjbpC+n8jiBrZfdkYZN
	 PbNOmj8GRp0xuc3aBhPKoPdTU6H6i+T0kMyO/JsGUqiulMiSkjxF6Fhc16ybmaNm51
	 dKrgIu7HSoWW3le+/w49UVI5gWpWu3LoqKIrrdfw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A48E6F801EB;
	Mon, 21 Dec 2020 17:33:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C632F801D5; Mon, 21 Dec 2020 17:33:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3743DF800E4
 for <alsa-devel@alsa-project.org>; Mon, 21 Dec 2020 17:33:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3743DF800E4
Received: from mail-lf1-f71.google.com ([209.85.167.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1krO7o-0008SG-KK
 for alsa-devel@alsa-project.org; Mon, 21 Dec 2020 16:33:32 +0000
Received: by mail-lf1-f71.google.com with SMTP id 1so11254626lfb.17
 for <alsa-devel@alsa-project.org>; Mon, 21 Dec 2020 08:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1DJCzPnkhqRPedetC6f30gfeqZjj9GSnRoXOKXqtenM=;
 b=FV3ka+qJvQHRvykIb3/GRqVTU47hLZBljdoVLsdS1yEgSTckZTdTIkvxZ5aXQCT0SN
 y6HgPAnyA19kXN4gxxa+HDZHdEjEojfOvJqB02ml03KOEYUN208NXsD6FhTr/ERIStpL
 TBcDTc6EdlclrKggUKYZTopNcq3ibT9ptFehy2wGRa8OrUvRNl4DpoCmfIPpNaLyr2JX
 FhBs316xgLCzToqeg5Nbvhb2kNiUiOz3MMYRRBZ5OcHTl45efh8R6wwLWC4xGTKZky4R
 6FV/vVJ+HXYcEuGi1e94vdJRWdDRIPq4CUwYTly3QpJBqL6BSVJR4dechcsDk2YjLloM
 EbbQ==
X-Gm-Message-State: AOAM5301LKHgGFTE8c0fuc20IAt+JvSuamQIwnHR2gyLUZucnF2iROFj
 H5B4UcqIUnCMUwNYgMwQGsmeoOE1wNKcqYQzzt1HQ+4ByTnX38Wufl1m/q+emvzcPJw5lF+yFmH
 U8i/FAvlWnx4SeuTL9VaNXL6ijowbhlx3mcSykdwg1ESquT+MdhBZgiBL
X-Received: by 2002:a2e:9b8a:: with SMTP id z10mr7354282lji.126.1608568411904; 
 Mon, 21 Dec 2020 08:33:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxtnLVxc3tdNQMXpGXmxOqiYwSpbFnGFhsFaqolhzWgqF0GoirNF1t7rUczUrKsKTQYUeDw3QVY7adO187jKOU=
X-Received: by 2002:a2e:9b8a:: with SMTP id z10mr7354267lji.126.1608568411594; 
 Mon, 21 Dec 2020 08:33:31 -0800 (PST)
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
In-Reply-To: <s5h7dpfk06y.wl-tiwai@suse.de>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Tue, 22 Dec 2020 00:33:20 +0800
Message-ID: <CAAd53p53w0H6tsb4JgQtFTkYinniicTYBs2uk7tc=heP2dM_Cw@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda: Continue to probe when codec probe fails
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, nouveau@lists.freedesktop.org,
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

[+Cc nouveau]

On Fri, Dec 18, 2020 at 4:06 PM Takashi Iwai <tiwai@suse.de> wrote:
[snip]
> > Quite possibly the system doesn't power up HDA controller when there's
> > no external monitor.
> > So when it's connected to external monitor, it's still needed for HDMI audio.
> > Let me ask the user to confirm this.
>
> Yeah, it's the basic question whether the HD-audio is supposed to work
> on this machine at all.  If yes, the current approach we take makes
> less sense - instead we should rather make the HD-audio controller
> working.

Yea, confirmed that the Nvidia HDA works when HDMI is connected prior boot.

> > > - The second problem is that pci_enable_device() ignores the error
> > >   returned from pci_set_power_state() if it's -EIO.  And the
> > >   inaccessible access error returns -EIO, although it's rather a fatal
> > >   problem.  So the driver believes as the PCI device gets enabled
> > >   properly.
> >
> > This was introduced in 2005, by Alan's 11f3859b1e85 ("[PATCH] PCI: Fix
> > regression in pci_enable_device_bars") to fix UHCI controller.
> >
> > >
> > > - The third problem is that HD-audio driver blindly believes the
> > >   codec_mask read from the register even if it's a read failure as I
> > >   already showed.
> >
> > This approach has least regression risk.
>
> Yes, but it assumes that HD-audio is really non-existent.

I really don't know any good approach to address this.
On Windows, HDA PCI is "hidden" until HDMI cable is plugged, then the
driver will flag the magic bit to make HDA audio appear on the PCI
bus.
IIRC the current approach is to make nouveau and device link work.

Kai-Heng

>
>
> thanks,
>
> Takashi
