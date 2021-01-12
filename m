Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDE22F338E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 16:05:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7643E1701;
	Tue, 12 Jan 2021 16:04:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7643E1701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610463936;
	bh=6Y2esY3NqDvERvO98sQZb5xNbL7v7NkTSqCrTCfZqno=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kGSFLFobHRd/QxbPPjiv10eY5dXwQZ8Nsl07fgQZSflzNZzkXSTUSq8svqaIPzrnf
	 GjIlkH1GvG0DSsd81R8ocVeqULNa+xJMqFKj/xk93n+ykFasGUdkt3zGyVUAWQhdQ9
	 DgIlmiRpKj0HjxNgOEn3vXmgkHMv0sm4/nK2CFB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED6C1F800EB;
	Tue, 12 Jan 2021 16:04:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3AFAF800EB; Tue, 12 Jan 2021 16:04:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69C05F800EB
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 16:03:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69C05F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CaVy6HZ3"
Received: by mail-ot1-x32f.google.com with SMTP id j20so2520784otq.5
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 07:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mkhl+VfNjs6HNl4wutbq9XSPu6PuR5coxiekuLwc0+I=;
 b=CaVy6HZ3pYY85t8D7tJjVfBJUBDcWsGh09KsSFJbLMbOXfr+Kjlmx2JmpohJcVOMcA
 SfE4SVJov0s9w/S183jQddbFQEHrYwFXFv40ZQSKvzyv+3NXY/cLLJDLo9LX1buPMVZA
 3ja4UczUQpch4tvGlOvqY9fNxTLUNyKmKyWiDVsrU1vA2ap7EODEHYVUaaROxbbmtrF3
 2MqbLw2HATKgaeLoyOPtPM+yzOVLpby0djzJpGvnzhgHOkyCw0FjlgdM/C7VUYEG5nu6
 PuV/V484hmUPsuJBBlX7evpT7CmIoj2YxjFq1rarSTrAtwxOqgiMIPvhiVwf44HORjAj
 5RIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mkhl+VfNjs6HNl4wutbq9XSPu6PuR5coxiekuLwc0+I=;
 b=SnNdk14M7tLmvuvopWyxOXdMoOUNkAcB2OV7J3lr82VqoCU6+P2f9HxpPoqjr+eitu
 1FyRHV6qt6qnEwH5qB0z2oBng0Wr2RmyS2rXfEUzTVqUWjAfOOFcPZSUMaF8QYJiy3sO
 Viko/pfTrvRWpedwGSo1TL+b2gDL686gewLbJHS3J4+/0qnC2H1Iz8fpqGq0SiivCcMQ
 CFN8GdTWfxoKw2U5PpLNIURapRQXxxdtxtUtvTHhNN+7tara9AW69G7mvllpHAZcEe5l
 DQ9Cooz1aaPjj3eN3u4BcdaGarkj/1tBC+WWjooEN/X5TQdo5+l20ymiGmDQXxzLXJ+Q
 ph7Q==
X-Gm-Message-State: AOAM533bb4Jd5SXIp1XE9bPEhWXWIwBqxsvsAVr8F5fXf7dHe/4EupmW
 cf3Q9/gwAboDnCqtTv0Bxn/E0Brwm6+Fj6axCN4=
X-Google-Smtp-Source: ABdhPJzMm6xvVyR8GOH+2DHzaSdtq/2Gm2WJEvFL7lcaBdTsy6Iev7ecO3nc5HYycrYb3Sqnd8W8VQMn3hBZ9VNwy/c=
X-Received: by 2002:a05:6830:1b7b:: with SMTP id
 d27mr3169216ote.132.1610463831842; 
 Tue, 12 Jan 2021 07:03:51 -0800 (PST)
MIME-Version: 1.0
References: <20210105175245.963451-1-alexander.deucher@amd.com>
 <s5him82qjxz.wl-tiwai@suse.de>
In-Reply-To: <s5him82qjxz.wl-tiwai@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Jan 2021 10:03:41 -0500
Message-ID: <CADnq5_PYxjGazN-4ULer5CC_fD_DEQbPHepkdbATjZaq0MimzQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/hdmi - enable runtime pm for CI AMD display
 audio
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: Alex Deucher <alexander.deucher@amd.com>, alsa-devel@alsa-project.org,
 Evan Quan <evan.quan@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>
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

On Tue, Jan 12, 2021 at 10:00 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 05 Jan 2021 18:52:45 +0100,
> Alex Deucher wrote:
> >
> > We are able to power down the GPU and audio via the GPU driver
> > so flag these asics as supporting runtime pm.
> >
> > Reviewed-by: Evan Quan <evan.quan@amd.com>
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>
> I wanted to apply this one now, but noticed that the author address
> (gmail) is different from your S-o-b address (amd.com).
> Alex, is this intentional and keep it, or should I correct the author
> address?

The s-o-b address is the correct one.  Thanks!

Alex

>
>
> thanks,
>
> Takashi
>
> > ---
> >  sound/pci/hda/hda_intel.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> > index d539f52009a1..2ea46b5a9a23 100644
> > --- a/sound/pci/hda/hda_intel.c
> > +++ b/sound/pci/hda/hda_intel.c
> > @@ -2597,7 +2597,8 @@ static const struct pci_device_id azx_ids[] = {
> >         .driver_data = AZX_DRIVER_GENERIC | AZX_DCAPS_PRESET_AMD_SB },
> >       /* ATI HDMI */
> >       { PCI_DEVICE(0x1002, 0x0002),
> > -       .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
> > +       .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
> > +       AZX_DCAPS_PM_RUNTIME },
> >       { PCI_DEVICE(0x1002, 0x1308),
> >         .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
> >       { PCI_DEVICE(0x1002, 0x157a),
> > @@ -2659,9 +2660,11 @@ static const struct pci_device_id azx_ids[] = {
> >       { PCI_DEVICE(0x1002, 0xaab0),
> >         .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
> >       { PCI_DEVICE(0x1002, 0xaac0),
> > -       .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
> > +       .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
> > +       AZX_DCAPS_PM_RUNTIME },
> >       { PCI_DEVICE(0x1002, 0xaac8),
> > -       .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS },
> > +       .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
> > +       AZX_DCAPS_PM_RUNTIME },
> >       { PCI_DEVICE(0x1002, 0xaad8),
> >         .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
> >         AZX_DCAPS_PM_RUNTIME },
> > --
> > 2.29.2
> >
