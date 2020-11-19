Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F042B9929
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 18:22:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFCAA1711;
	Thu, 19 Nov 2020 18:21:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFCAA1711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605806525;
	bh=f04UombGE57VRYVkBw9X5l3MMlWFHOVqXaXNduJ5bs0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C4DO3WqSFYmj9kM46YmB3AzQaGECmf+teplxUF22Aj9WhgvogPdYLrshDo5qJt+fH
	 x/NcBstUwSJImT/IypT5F30JljQ2OPsglnHjhSAF/+FV9my+paF50W0jdlynWdlsXQ
	 omXMK5tT6hSBM+YUyWGHyehRFx6fTTIvhoDrIfs8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FA2EF80169;
	Thu, 19 Nov 2020 18:20:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A37F2F80169; Thu, 19 Nov 2020 18:20:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB53BF800C5
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 18:20:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB53BF800C5
Received: by mail-oi1-f195.google.com with SMTP id v202so3990733oia.9
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 09:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sk4MoO+LBfDTKu6OgdJdAY5YUGXwENPvznRsktaXdo4=;
 b=hrX529pujZ5QyecNdUZSZsrv06MOwhWz8fi6dwYHfODCeUIYG0jXwM4QUy/f6AxTmS
 HmCQZBJh/t9dV3QhDco+fsEuZqYXRvB9tZEAPkWLQfe1605hNSr3Pc1/mUNlPYdujZX0
 qYn/tjVEkxgZCL5vW9mien2fVbK0mjwHPjQ0iQGQT3f7jJYqtyLh153oY+bh1oWzX8t4
 ofXje+9ZoYeiT7/p+g2weRKJSMgYbH0WWAX/U5qXYV0ItIGyA6FIMlZMY40A3Hmbk7Z+
 xVkPJ4qXhFbxVsb/L9A/HRn3PH2sjNEMjMyFOucjJULYQ3NAdLkCopndyqGrzpgfsJKq
 dgUg==
X-Gm-Message-State: AOAM532QwHiCTqt102FXLroEG8ncDbiWz+bhBe+aTYIFlO4lBKBUDGrT
 3nm2QYXk9BXxcUCSm55x0R++BZ204mEBydkXo0U=
X-Google-Smtp-Source: ABdhPJzgZrXSuxmDdjWZrHUmxsm+jfFVAzUz5sBfRUlrwoFQZyrcDI5kwCuyl1wH1xbwx4NkdOaD2shf4anOir8QBnc=
X-Received: by 2002:aca:52c9:: with SMTP id g192mr3713049oib.54.1605806422678; 
 Thu, 19 Nov 2020 09:20:22 -0800 (PST)
MIME-Version: 1.0
References: <20201119125318.4066097-1-geert+renesas@glider.be>
 <CAK8P3a0mHYgOYLBO1MHw1CUVgdnOQk4aRf5XTBj+jR-yEtzcoA@mail.gmail.com>
 <CAMuHMdXmHOo+6TgYOsAuSC7-iHEyBnLvqX=MCN3qYybUi5M-hw@mail.gmail.com>
 <CAK8P3a17rA4N7TyiwrTdS_=4AAyDXrAi7W8k45BPuTLL1xU4Gg@mail.gmail.com>
In-Reply-To: <CAK8P3a17rA4N7TyiwrTdS_=4AAyDXrAi7W8k45BPuTLL1xU4Gg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Nov 2020 18:20:11 +0100
Message-ID: <CAMuHMdW=gi2hpMts5KdxhLSm4XUD1e4Q9ubjrDZbe85yGuT=Zw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsi: Stop using __raw_*() I/O accessors
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>
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

Hi Arnd,

On Thu, Nov 19, 2020 at 5:22 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Thu, Nov 19, 2020 at 5:13 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Thu, Nov 19, 2020 at 4:54 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > On Thu, Nov 19, 2020 at 1:53 PM Geert Uytterhoeven
> > > <geert+renesas@glider.be> wrote:
> > >
> > > I'm also not sure whether changing this breaks big-endian SuperH,
> > > which defines the accessors differently from Arm and most other
> > > architectures.
> >
> > On SH, this driver is only used on SH7724 systems.
> > Compiling an ecovec24_defconfig kernel with CONFIG_CPU_BIG_ENDIAN=y
> > shows that the same code (native 32-bit access) is generated for
> > big-endian as for little-endian, which means that it indeed must be
> > broken for one of them. But this is not changed by my patch.
>
> Not necessarily: I think superh is more like the old 'BE32' variant of Arm
> big-endian, in that on-chip registers are accessed in CPU-endian byte order,
> while access to external RAM is byte-swapped.

That's indeed quite likely: according to the SH7724 docs, the endianness
of "the system" is configured by an external pin at power-on reset time,
and cannot be changed dynamically.  Hence testing this would require a
big-endian boot loader, too.

> > > Maybe better just mark the driver as 'depends on SH || !CPU_BIG_ENDIAN'
> > > as it is clearly broken on big-endian Arm.
> >
> > "depends on !CPU_BIG_ENDIAN"?
>
> I think I'd just leave it as it is. Unless someone wants to try out this

OK.

> board in both big-endian and little-endian configurations and also
> listen to the audio output, it's impossible to know whether it is actually
> broken. sound/soc/sh/dma-sh7760.c does have a comment from 2007
> saying "// FIXME: little-endian only for now".

SH7760 does not use the FSI driver.
A few SH defconfig files have CONFIG_CPU_BIG_ENDIAN=y, but
the later SH4A parts all seem to be used in little-endian mode.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
