Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA782EEBDB
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 04:31:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A072167C;
	Fri,  8 Jan 2021 04:31:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A072167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610076718;
	bh=tOE2OyC0pMXjvjdGhTH42pEsZ01sMS1A4D6+cG0uIF0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U0In8yxI5vF1iSl3EyfBILTN6m9UBlWGtlCWF8kj+KGhdgEnIIKCf6Qdd2hnxHGUb
	 Gfj0UpFKT9F3ucWh60di01t97CPBjzsXkxo+EEvBvv5eV6a+KN3lteZCf9W8qNfqgT
	 JxA1WGMv0gyGSnd8qTJlX7SsEqS46q50LXt5TL4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25F31F80167;
	Fri,  8 Jan 2021 04:30:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88B77F80166; Fri,  8 Jan 2021 04:30:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F442F800EE
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 04:30:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F442F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=endlessos.org header.i=@endlessos.org
 header.b="KLJgXlwf"
Received: by mail-pl1-x635.google.com with SMTP id y8so4955878plp.8
 for <alsa-devel@alsa-project.org>; Thu, 07 Jan 2021 19:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessos.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OMhXAV38uws0Ksy5eFTBEtLZPPxlU+gVbo6AAxo9H64=;
 b=KLJgXlwfMJjBfzdSjGYTPhHPsAqpuShISXI+md2pS24yEXts3Xsoyt7jDloPiy2ToY
 L+In4ZjdKq0MzoUB+FHuzWNH3JOzmDAyda2LsOA1plUBqKswktdEKZsmOj2OCMavBsuU
 QFxc5kyCJzqLGG4nwZKgnq2Foi9eyv3mynfWMBd1kf4/vDoqenrDe0LBKEHLY0nw/Oyd
 xT7CjPx+jb6LL0q9Tp9uV4WN/HggllSPSNNUolnn6WEpkCrhyRuD584cwU9pX2ol/nkx
 oodvLacjwvr5y2Z6nr8hUd/Que/FOMbeNl3RGpjzF5MS9o6FCYYDU8GTVT9y+ZsKhwMk
 fljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OMhXAV38uws0Ksy5eFTBEtLZPPxlU+gVbo6AAxo9H64=;
 b=RYpn3CKk7vVf0V+vrPQNAT6dtugL0/+IbWtI2l/Zvk2es05hLmVnPzTT6JHFJMeetL
 C10cBIG4H/XtBWlLf2f+zgQ/Yb/o8n5FRzzVGl3SJ1JZPxvC97HBsrL3dkjwEHWZQLtg
 cdsH689T2oLyrEFTq+Jucd44IGJSI1l4K+cudaSfDT89cyHiHQuE4zhoamEl1OhbbEDQ
 VoT0noMTv99giaczsVdN7skQgWCQ37WVRrqxc93svx8QqgheGWRB3GoVcWH+w7y4axzm
 1ELM3d9R2a+7j+tk5T0kafSZYac4kFEdTxgVktdt31pWIkHBPC27SJ77/lkycZv67Bbn
 lStA==
X-Gm-Message-State: AOAM5303/ZWB3XLUZ0h/uQlylj9y/oSrIOZW/kCG6XXTtELTHg39HHyP
 xMBss4/nF9Yq0x/Q1aKokm6qh/MuWXrdmxNo8LtckA==
X-Google-Smtp-Source: ABdhPJx61kmnqYZNLacqSbd8guWpR5oS2tLYpoagBmZ9x0mVfpQqFrbKtiaI9DNbP+oxyiVvhMWfuWpcdUHWyUoSUHY=
X-Received: by 2002:a17:90a:fa8e:: with SMTP id
 cu14mr1647501pjb.140.1610076611419; 
 Thu, 07 Jan 2021 19:30:11 -0800 (PST)
MIME-Version: 1.0
References: <20210107090625.107078-1-chiu@endlessos.org>
 <20210107090625.107078-2-chiu@endlessos.org>
 <20210107142746.GC4726@sirena.org.uk>
In-Reply-To: <20210107142746.GC4726@sirena.org.uk>
From: Chris Chiu <chiu@endlessos.org>
Date: Fri, 8 Jan 2021 11:30:00 +0800
Message-ID: <CAB4CAwfyE_tXHENi5bbekFGFutU3Cxgr2SgKyUQbRnS4RtwuYQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] ASoC: rt5645: Introduce mapping for ACPI-defined GPIO
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 Linux Kernel <linux-kernel@vger.kernel.org>, linux@endlessos.org,
 tiwai@suse.com
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

On Thu, Jan 7, 2021 at 10:28 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jan 07, 2021 at 05:06:22PM +0800, Chris Chiu wrote:
>
> > +static const struct acpi_gpio_mapping *cht_rt5645_gpios;
> > +
>
> You're adding a read only static variable with no way to set it.  This
> doesn't actually do anything?
>
This is a pointer to a 'const 'struct acpi_gpio_mapping', and I will
need it to point to
the 'static const struct acpi_gpio_mapping cht_rt5645_ef20_gpios[]' in
my consequent
patch '[PATCH 2/4] ASoC: rt5645: Add ACPI-defined GPIO for ECS EF20 series'.

I take the same idea from 'sound/soc/intel/boards/bytcr_rt5651.c' line 90.
And it did work as expected on my ECS EF20EA

> > @@ -3780,7 +3782,6 @@ static const struct dmi_system_id dmi_platform_data[] = {
> >               },
> >               .driver_data = (void *)&intel_braswell_platform_data,
> >       },
> > -     { }
> >  };
> >
>
> This is an unrelated change which removes the terminator on the array
> which will cause issues.

Thanks for pointing that out. It's not my intention. I accidentally
removed it. I'll fix this in v3.

Chris
