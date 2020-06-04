Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 474011EE87B
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jun 2020 18:22:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B652D166E;
	Thu,  4 Jun 2020 18:21:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B652D166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591287750;
	bh=sBNgvGDIGRW/XMD0TGzCoeN/QO9PTLeoXj++YJiaeHE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DaKUjLuuWxFxh0M6lCxKa7Abrxsx9tE2/y76quA4BQ0K7WoIPzXZmEccnp/yGf55G
	 dYECgICYTm+P3bsGn+TukGZqmR8iHFLwiWqkVw9CoX/NGDw3OwCo7RNepWX38u3/ge
	 CJjgOSElTgSrDwQjqbvjIRAyQVjIJb4YzURSgGRk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0BB2F80254;
	Thu,  4 Jun 2020 18:20:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABB21F80260; Thu,  4 Jun 2020 18:20:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CED7F8023F
 for <alsa-devel@alsa-project.org>; Thu,  4 Jun 2020 18:20:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CED7F8023F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YUwQlS7R"
Received: by mail-wm1-x344.google.com with SMTP id u13so5841186wml.1
 for <alsa-devel@alsa-project.org>; Thu, 04 Jun 2020 09:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cleEe6yd+TVmdt0AUvyCB9p/COM97K5P+jt86cwkd70=;
 b=YUwQlS7R3R/hHrhxOSuG/9n+mz/FYRf/h5NSx9i6PN7Fum23wrUGdl6pJGjqKq9JgI
 E7Uw7DPivbOzlsa0ah1u9Rw0hE6I659m0yCTkh2ZA3x2MiKvqn2mpcZAmfHq+P/c2i6Q
 wLJEKfL80vogtRGnAq4lzFArcKu1sd0+yaLMUoQRZtLjN7hgiuF/dl9U7/nCtSLxfZP/
 cLlARC+OpWne/P+qZMZLILKQdXM26cHaTXgTwO7qPrR7wKfUWzaITnQ9PUczColkyBDz
 JTa/dtTKINBdDLo5wT6XqESyFhuQUHVTQ0Li+oVGwo+KrdORYwjJL/d7iYg1CwuBLD/k
 gMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cleEe6yd+TVmdt0AUvyCB9p/COM97K5P+jt86cwkd70=;
 b=ErChstcHwYLkVYOi4qMR4mpmWVT4qxVwSqd7djTU9muNHWJe+5VaTUzYvXZyBeZn44
 rTAQlKhwWtSMDHn5mWRfqVWEGBbX6SNp1W+klXb7IUDi/0yzx+FXuG4WPl3smw8mevOw
 mV85GLST8SuqESYFJom9e9BMV2DVb2FkssSw4M1ffVAi7c34oaTpfPwqBxmDdLEx+rko
 RV/BKtAVPF5fFDN5R9aIXwJXvkosMCPibTOU2ASGW9XlXOjjoUHCiL8bzkHPk7kRH3j6
 EvwRX9ymZK36M1au1DazzsdLw+b8hCCDyTDbHC5zW/gQaXtXQqdDbHmmLuOoJOOvwQUL
 8iaQ==
X-Gm-Message-State: AOAM533ZX63ie2UTXeUNE8IBCTyQ4K4xVULGSx4j1u7+IMluZSLppKmu
 rQgC0SKBoRNx5xOMCeFP376BnVfN1rLpHNHWeXA=
X-Google-Smtp-Source: ABdhPJz0JkOXz+K2nfD8XDFOFZiZEgL48NyyTC0Qv1S9gNUMSy5SIkuVB1Om9kkT1H/D+IFyHZUxKmhze/fBJqzGl5Y=
X-Received: by 2002:a1c:29c4:: with SMTP id p187mr4725338wmp.73.1591287640973; 
 Thu, 04 Jun 2020 09:20:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200603013137.1849404-1-alexander.deucher@amd.com>
 <s5hsgfcebe7.wl-tiwai@suse.de>
In-Reply-To: <s5hsgfcebe7.wl-tiwai@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 4 Jun 2020 12:20:29 -0400
Message-ID: <CADnq5_MKbOq5ka0x4uBC7epO7HnwXCgph2ewEYyXWumiW5YfLw@mail.gmail.com>
Subject: Re: [PATCH] sound/pci/hda: add sienna_cichlid audio asic id for
 sienna_cichlid up
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: Alex Deucher <alexander.deucher@amd.com>, alsa-devel@alsa-project.org,
 Hersen Wu <hersenxs.wu@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>
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

On Wed, Jun 3, 2020 at 5:39 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 03 Jun 2020 03:31:37 +0200,
> Alex Deucher wrote:
> >
> > From: Hersen Wu <hersenxs.wu@amd.com>
> >
> > dp/hdmi ati hda is not shown in audio settings
> >
> > Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
> > Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> > Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
>
> Applied now with a slight rearrangement with the sorted order and Cc
> to stable.
>
> But also wondering whether do we have a device with 1002:ab30?
> It's missing between this one and the next one.

Thanks!  I'll check with the audio teams, I'm not sure off hand what
DIDs will be used in upcoming parts.

Alex

>
>
> thanks,
>
> Takashi
>
> > ---
> >  sound/pci/hda/hda_intel.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> > index 92a042e34d3e..4188bc4bd4e2 100644
> > --- a/sound/pci/hda/hda_intel.c
> > +++ b/sound/pci/hda/hda_intel.c
> > @@ -2643,6 +2643,9 @@ static const struct pci_device_id azx_ids[] = {
> >       { PCI_DEVICE(0x1002, 0xab38),
> >         .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
> >         AZX_DCAPS_PM_RUNTIME },
> > +     { PCI_DEVICE(0x1002, 0xab28),
> > +       .driver_data = AZX_DRIVER_ATIHDMI_NS | AZX_DCAPS_PRESET_ATI_HDMI_NS |
> > +       AZX_DCAPS_PM_RUNTIME },
> >       /* VIA VT8251/VT8237A */
> >       { PCI_DEVICE(0x1106, 0x3288), .driver_data = AZX_DRIVER_VIA },
> >       /* VIA GFX VT7122/VX900 */
> > --
> > 2.25.4
> >
