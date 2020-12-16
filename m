Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5862DC373
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Dec 2020 16:52:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 271FC1802;
	Wed, 16 Dec 2020 16:51:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 271FC1802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608133946;
	bh=qH5US5HrJRro4953M46CBG9tTfVpW3P4MoLMFe2tcLI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AxTE7tud0gBHoPKARFAh/84FhPX3hoT/CUY4B9FGBlh2kGtzSdsrTwq1a+laRH4j0
	 M1aG7MrFrf9ed4ZeHPRSuTblO4wVywxp8rG192CVWjFx2Io2e1imTmpFmss0ECchNG
	 Y8wImHgmI6z/ocXM/GWcPghZtfEnX6t8IPv6QzBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2848BF801F7;
	Wed, 16 Dec 2020 16:50:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE6A2F801F7; Wed, 16 Dec 2020 16:50:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B616F80168
 for <alsa-devel@alsa-project.org>; Wed, 16 Dec 2020 16:50:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B616F80168
Received: from mail-oo1-f69.google.com ([209.85.161.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kpZ4U-0004vF-Dx
 for alsa-devel@alsa-project.org; Wed, 16 Dec 2020 15:50:34 +0000
Received: by mail-oo1-f69.google.com with SMTP id a5so11131644oob.4
 for <alsa-devel@alsa-project.org>; Wed, 16 Dec 2020 07:50:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UDu4fCku1n4Yn+GSCPwGXPBk9ghy9F+fH/bPZYikwFM=;
 b=iUdgCv2m771Q9AgJPEoxzH2eVDalaRPtNTIQiPjKfFYIa4bpiCAQ6XV2hTPC09tJ1i
 Vwj/EWQ+XXIceJ8yghXw6WSEQOJSiyMv7zAOL59+uvVpSxnxKhKxV6YvEphvdlbzcwhw
 lFhzxzrHjbC229fzig4osF2GbcGchuZnOzva8LbxEkQRldM0Q/kDeEAjVsyeNkRoS4pn
 BoKUfn8/zyfLwaY7K5OUCmzy0KmENiObOrNSgyFR1K1exZSozVOzvZ3stUC2EbNiokn6
 /DxrwNUhU9yg5+QzEbBJinVNvc7TH6OAhz5U4821O8lTbdP0eBAsCzl5y+0fDEQ3KCo+
 gOjw==
X-Gm-Message-State: AOAM5319wlVUINHayl8P1CR1zRxO8O49KBGMCEvWSvNuUkgN/M3/9DIJ
 cf/K+x2JHCinlFlpD18cbcsgZ+RHWmeWUSlctZ4BCa3vR5dEUDK9rR+seXymdvzpezaag7Vzf5/
 aOyMsYkRW/B+4u6lzWHHLmGDNHaFRupOvYS5CnQO7Bpiw91QjmQqGU4BT
X-Received: by 2002:aca:ccc1:: with SMTP id c184mr2370080oig.121.1608133833353; 
 Wed, 16 Dec 2020 07:50:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx9u6/rdkGACUL71kk8r218k44q33lvl1DdzcqZEhpTlQ6LOkUUe5DktifQtuIFFfmCGbSthMgBQPLRJPHBP3k=
X-Received: by 2002:aca:ccc1:: with SMTP id c184mr2370051oig.121.1608133832928; 
 Wed, 16 Dec 2020 07:50:32 -0800 (PST)
MIME-Version: 1.0
References: <20201214060621.1102931-1-kai.heng.feng@canonical.com>
 <20201216124726.2842197-1-kai.heng.feng@canonical.com>
 <s5h5z51oj12.wl-tiwai@suse.de>
In-Reply-To: <s5h5z51oj12.wl-tiwai@suse.de>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 16 Dec 2020 23:50:20 +0800
Message-ID: <CAAd53p6kORC1GsW5zt+=0=J5ki43iriO-OqtFvf5W67LWhyyhA@mail.gmail.com>
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

On Wed, Dec 16, 2020 at 11:41 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 16 Dec 2020 13:47:24 +0100,
> Kai-Heng Feng wrote:
> >
> > Similar to commit 9479e75fca37 ("ALSA: hda: Keep the controller
> > initialization even if no codecs found"), when codec probe fails, it
> > doesn't enable runtime suspend, and can prevent graphics card from
> > getting powered down:
> > [    4.280991] snd_hda_intel 0000:01:00.1: no codecs initialized
> >
> > $ cat /sys/bus/pci/devices/0000:01:00.1/power/runtime_status
> > active
> >
> > So mark there's no codec and continue probing to let runtime PM to work.
> >
> > BugLink: https://bugs.launchpad.net/bugs/1907212
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>
> Hm, but if the probe fails, doesn't it mean something really wrong?
> IOW, how does this situation happen?

The HDA controller is forcely created by quirk_nvidia_hda(). So
probably there's really not an HDA controller.

>
> The usual no-codec state is for the devices that have a bogus HD-audio
> bus remaining while codecs aren't hooked or disabled by BIOS.  For
> that, it makes to leave the controller driver and let it idle.  But if
> you get really an error, it's something to fix there, not to just
> ignore in general.

The best approach I can think of is to make current two steps probe
into one. So when probe fails, the driver won't bind to the device.
What's the reason behind the two steps approach?

Kai-Heng

>
>
> thanks,
>
> Takashi
>
> > ---
> >  sound/pci/hda/hda_intel.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> > index 6852668f1bcb..872a703dee43 100644
> > --- a/sound/pci/hda/hda_intel.c
> > +++ b/sound/pci/hda/hda_intel.c
> > @@ -2328,7 +2328,7 @@ static int azx_probe_continue(struct azx *chip)
> >       if (bus->codec_mask) {
> >               err = azx_probe_codecs(chip, azx_max_codecs[chip->driver_type]);
> >               if (err < 0)
> > -                     goto out_free;
> > +                     bus->codec_mask = 0;
> >       }
> >
> >  #ifdef CONFIG_SND_HDA_PATCH_LOADER
> > --
> > 2.29.2
> >
