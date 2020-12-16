Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D97242DC3C1
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Dec 2020 17:09:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E1971835;
	Wed, 16 Dec 2020 17:08:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E1971835
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608134982;
	bh=s+FRtw3klsRp4Owj9+WTgTFmKKbGDAAX7ZA7nOrbt8Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r9SmRoUgmVkKavjD1K7RuOD4W9IioPuf95xKerJr9uGVji6BpBrbWAaQRSHIM3xi/
	 xwsqgMdj3s+mZD16hYROn4s5Uwvurln3/h+pOjjbK9QOG4IZhiyQHoENH0Y91/nysZ
	 igfKnvklCQsC5mBEFZAdCgSsBjFIDHykeRvWIYKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCE8BF801F7;
	Wed, 16 Dec 2020 17:08:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2813CF8011B; Wed, 16 Dec 2020 17:08:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91538F8011B
 for <alsa-devel@alsa-project.org>; Wed, 16 Dec 2020 17:07:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91538F8011B
Received: from mail-ot1-f69.google.com ([209.85.210.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kpZLJ-00060c-R8
 for alsa-devel@alsa-project.org; Wed, 16 Dec 2020 16:07:58 +0000
Received: by mail-ot1-f69.google.com with SMTP id q8so11200384otk.6
 for <alsa-devel@alsa-project.org>; Wed, 16 Dec 2020 08:07:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YPCF3dLDbYf8y5UYGzvfCqBCOHtihFhp16cOFRHaP1U=;
 b=tO8quzFT7pbYiQigZEJg+A9TWw9r6AIsWoILvJdHEg5COTRUJEaYoU5nyaKYszemdT
 o6GwIxIjQDAknOxdsn/1y0VggCJmwyQ0kMpQas03hzxwGfGvotFjfP8vLcgJbbxY0IbY
 V9F1zwzpt5n7pUQPqr7DXotNpX7HaGoVK13bDGgW8tYKsSseHoRDvrX7G4xl7w2YiwHK
 NA9pJh3+d32rKYAWK3DYVjRJPPlmMsBbQW/tcM7aKgbF2kDN5uchcBm8NI8uZuoYgE5y
 A8N+BWB932pP54e8WsZe09cVlV5PxVjZE3eQbH9DUF5BtdrWySXRuy1PBZPFNxOc0Civ
 kbfg==
X-Gm-Message-State: AOAM532gdapn3g8pB4W/jBAQh9o4GjcY0xNMwvx1DUSwQ1e3Y6K+mV5/
 /S9vLSG7Br4tqnoPyJmD9hg61sp9nApAJwgCSbxPoRa3Ph9QcbqKnFwtBYJVZ8Son4YsLnvLsvj
 JjKF1I/oPQZ+xSpFuzd/p5XEdH2DRVu212FsYYV+vzpXq+5/BiyI9AW/t
X-Received: by 2002:a9d:ece:: with SMTP id 72mr25708123otj.358.1608134876786; 
 Wed, 16 Dec 2020 08:07:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYhP6aMERTUDkaq4ZYfDI4l+IvAEAErYrDxrvbT0KAwGUMhBXxRbvR0BswTkrl1eIUAwbPsxwaUO5wiS9tmYs=
X-Received: by 2002:a9d:ece:: with SMTP id 72mr25708095otj.358.1608134876354; 
 Wed, 16 Dec 2020 08:07:56 -0800 (PST)
MIME-Version: 1.0
References: <20201214060621.1102931-1-kai.heng.feng@canonical.com>
 <20201216124726.2842197-1-kai.heng.feng@canonical.com>
 <s5h5z51oj12.wl-tiwai@suse.de>
 <CAAd53p6kORC1GsW5zt+=0=J5ki43iriO-OqtFvf5W67LWhyyhA@mail.gmail.com>
 <s5hzh2dn3oa.wl-tiwai@suse.de>
In-Reply-To: <s5hzh2dn3oa.wl-tiwai@suse.de>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 17 Dec 2020 00:07:45 +0800
Message-ID: <CAAd53p6Ef2zFX_t3y1c6O7BmHnxYGtGSfgzXAMQSom1ainWXzg@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda: Continue to probe when codec probe fails
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
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

On Wed, Dec 16, 2020 at 11:58 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 16 Dec 2020 16:50:20 +0100,
> Kai-Heng Feng wrote:
> >
> > On Wed, Dec 16, 2020 at 11:41 PM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Wed, 16 Dec 2020 13:47:24 +0100,
> > > Kai-Heng Feng wrote:
> > > >
> > > > Similar to commit 9479e75fca37 ("ALSA: hda: Keep the controller
> > > > initialization even if no codecs found"), when codec probe fails, it
> > > > doesn't enable runtime suspend, and can prevent graphics card from
> > > > getting powered down:
> > > > [    4.280991] snd_hda_intel 0000:01:00.1: no codecs initialized
> > > >
> > > > $ cat /sys/bus/pci/devices/0000:01:00.1/power/runtime_status
> > > > active
> > > >
> > > > So mark there's no codec and continue probing to let runtime PM to work.
> > > >
> > > > BugLink: https://bugs.launchpad.net/bugs/1907212
> > > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > >
> > > Hm, but if the probe fails, doesn't it mean something really wrong?
> > > IOW, how does this situation happen?
> >
> > The HDA controller is forcely created by quirk_nvidia_hda(). So
> > probably there's really not an HDA controller.
>
> I still don't understand how non-zero codec_mask is passed.
> The non-zero codec_mask means that BIOS or whatever believes that
> HD-audio codecs are present and let HD-audio controller reporting the
> presence.  What error did you get at probing?

[    4.280991] snd_hda_intel 0000:01:00.1: no codecs initialized
Full dmesg here:
https://launchpadlibrarian.net/510351476/dmesg.log

>
>
> > > The usual no-codec state is for the devices that have a bogus HD-audio
> > > bus remaining while codecs aren't hooked or disabled by BIOS.  For
> > > that, it makes to leave the controller driver and let it idle.  But if
> > > you get really an error, it's something to fix there, not to just
> > > ignore in general.
> >
> > The best approach I can think of is to make current two steps probe
> > into one. So when probe fails, the driver won't bind to the device.
> > What's the reason behind the two steps approach?
>
> It's a sort of must, as the module loading is involved with binding
> with the codecs, as well as (optionally) request_firmware()
> invocation.

Ok. I also tried to use device_release_driver(), but azx_remove()
calls "cancel_work_sync(&hda->probe_work)" so there will be a
deadlock.

Kai-Heng

>
>
> Takashi



-- 
Kai-Heng
