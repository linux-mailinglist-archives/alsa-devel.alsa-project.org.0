Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1A150B37D
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 11:02:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70CCD1722;
	Fri, 22 Apr 2022 11:01:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70CCD1722
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650618153;
	bh=/m9HtiXeSolu5qrg2Hq80k+3cr1LM6XYLdAbp3oTHTc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cx2SyTNV0Vd9ReTBpSP6kAsfMFNJXDDBiuO0AsuCEZrg1XrZrJxhHlavfyfjHnXsx
	 C1gu63B4zqLeGWUoV4jsIUWqmp1P6d8X7pfk0RKaGwDgMr741mT9KzUkAhnFm3kRu/
	 s1aHsLCL8sCgvjLWEaaI9lS/LgdFjyptxfPzKpz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAA59F80249;
	Fri, 22 Apr 2022 11:01:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D59C0F80125; Fri, 22 Apr 2022 11:01:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84F7DF80125
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 11:01:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84F7DF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jBBBgfxN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3761A6137B
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 09:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24672C385AC
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 09:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650618081;
 bh=/m9HtiXeSolu5qrg2Hq80k+3cr1LM6XYLdAbp3oTHTc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jBBBgfxNw8Qg5UPzBjmDTjT+E3APsjuWTMVt+hprqOwS6DIxRVDImGrZN7wMEx+rx
 86vdIpshLw/2xvYq9EXVD6U2UdmQg2jRX0+t8216G1sy5tFLNYTW6io3yJaCI0QPDi
 +fH/z8A5Z81qWD80aniD3CFr9+DcQ5t/+T4FsFJZDyW+Lf8LBXr2ZWf8iswYK9yKfa
 i6FRRqnzC3GECksp/PEHUWBaSiEgEAKgocxi6UKsOOgJj2oKl2WyGacfZfbT6muE++
 R+suLf2CeI5uMPJbWVzOPVsVKgB0U5HrVu/hHPwlJEySlo+e+tm5dGIoX+20rq6n6I
 1LbvJa+916YEg==
Received: by mail-wm1-f44.google.com with SMTP id
 n40-20020a05600c3ba800b0038ff1939b16so4997692wms.2
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 02:01:21 -0700 (PDT)
X-Gm-Message-State: AOAM533+iLIZUEsBbXReC/uq8dw7SRYo+AqaT72NP72VafPpxX6AN8ok
 tpIjnODxLebiU2Ar8ZlRS72TDVQaG4vbbrmfDxw=
X-Google-Smtp-Source: ABdhPJyXx4ILSyW4olBWclzAEyhWJERXMp826335O4ZspD2rq64GVKddYaqSWtWZief/QyASpmBJtJchA9yTbG1sWmU=
X-Received: by 2002:a7b:ce15:0:b0:38e:b7b0:79be with SMTP id
 m21-20020a7bce15000000b0038eb7b079bemr3134739wmc.71.1650618079284; Fri, 22
 Apr 2022 02:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220421082040.2866638-1-arnd@kernel.org>
 <2d2c0c14-461b-985b-ebf1-3c03fe97f332@gmail.com>
In-Reply-To: <2d2c0c14-461b-985b-ebf1-3c03fe97f332@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 22 Apr 2022 11:01:03 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1PvZUV9MDNqLWUZGT6Bb18SoPEv-j1V6RTEziKV74Z0A@mail.gmail.com>
Message-ID: <CAK8P3a1PvZUV9MDNqLWUZGT6Bb18SoPEv-j1V6RTEziKV74Z0A@mail.gmail.com>
Subject: Re: [PATCH] [v4] m68k: coldfire: drop ISA_DMA_API support
To: Michael Schmitz <schmitzmic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Greg Ungerer <gerg@linux-m68k.org>
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

On Fri, Apr 22, 2022 at 9:48 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 21.04.2022 um 20:20 schrieb Arnd Bergmann:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > After a build regression report, I took a look at possible users of
> > CONFIG_ISA_DMA_API on m68k and found none, which Greg confirmed. The
> > CONFIG_GENERIC_ISA_DMA option in turn is only needed to implement
> > ISA_DMA_API, and is clearly not used on the platforms with ISA support.
> >
> > The CONFIG_ISA support for AMIGA_PCMCIA is probably also unneeded,
> > but this is less clear. Unlike other PCMCIA implementations, this one
> > does not use the drivers/pcmcia subsystem at all and just supports
> > the "apne" network driver. When it was first added, one could use
> > ISA drivers on it as well, but this probably broke at some point.
>
> Hoping to clarify some of this:
>
> For the Amiga PCMCIA "apne" driver, both the definitions of
> isa_type/isa_sex and the definitions of the low-level accessor and
> address translation functions are protected by CONFIG_ISA (see
> arch/m68k/kernel/setup_mm.c and arch/m68k/include/asm/io_mm.h for details).
>
> This could conceivably be changed (only AMIGA_PCMCIA and Q40 do use
> these definitions, aside from ATARI_ROM_ISA), but as things are right
> now, neither Q40 ISA nor Amiga PCMCIA will work without CONFIG_ISA defined.

Ok, thanks for clarifying that, this makes a lot more sense now. I was wondering
what ISA devices one can actually use without DMA, but it turns out that a
lot of the older storage (pata_legacy, pata_isapnp, aha152x) and network
(3c509, 8390, cs89x0, smc9194) devices work in PIO mode, aside from
a couple of oddball special-purpose stuff (speech, busmouse, comedi,
appletalk, wan, ...).

> Regarding the Amiga PCMCIA driver's use of the drivers/pcmcia subsystem,
> I have a patch in limbo at netdev that makes use of the cftable parser
> code from drivers/pcmcia, but as far as I can recall, none of this
> depends on CONFIG_ISA.

Yes, Geert mentioned that on IRC already. Note that Dominik Brodowski
has said in the past that he would plan to eventually drop PCMCIA
support from the kernel, but I think if that happens, the cftable
parser can just be moved into the amiga_pcmcia code.

       Arnd
