Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4433FF1C3
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Sep 2021 18:46:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8FFB17CA;
	Thu,  2 Sep 2021 18:45:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8FFB17CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630601164;
	bh=qjna8fkQ5GNF5GE8IeEq0kX00CXe3qtLbIY21PbAS44=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oa20IDTWql38aDWVYjDaqbx1UmQNhHJfQ1RbtI1RSldXRoDSYwCdipEQI8or8LNRa
	 49/cetZNRSguQdrVP+Lr9GJoApnteioc7fBhDzRFxrxgiqHW1cDYAucnscgeOGxE/b
	 hyc06TEKlreoO2UU1U1PMeyPhXv66oogQ2jlP124=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51C74F8028D;
	Thu,  2 Sep 2021 18:44:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4886F80269; Thu,  2 Sep 2021 18:44:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AAFCF8020D
 for <alsa-devel@alsa-project.org>; Thu,  2 Sep 2021 18:44:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AAFCF8020D
Received: by mail-vk1-f169.google.com with SMTP id g18so845660vkq.8
 for <alsa-devel@alsa-project.org>; Thu, 02 Sep 2021 09:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S8ciweqCSnmF0lrcF+dCm4bYbs7yF6R8RNgWL4GCGc4=;
 b=qqrI9gN7yZU2j6SANCyRAolGXIKmTlinIKS5Qjo5g2QqbKo1LXn1Ian9RyvSTpRa6R
 LZTm6M46Rl06ysPkZTtBHIkZ00BXxSDiW0cDYzV911+D5aCVrxikHiBHExZxllVjh76o
 8xspAHBaRA3ShW9TKeJoetLfPIqPcIccXnbDoPuCoHCq0n/E50kxcjMZCYDZwXJgueeW
 t4wLPP5at3jIbnl7yTokQnPpWQzCZa0z7IyRhfmy3vBp5KRSVPRCA1jCevkWkksjrX7r
 YcVJWshAKTrYitxcproNwxEOEE5U2w7vgBT/PIKMnkvVLQo6r4oyod8dNx1y5oG3F7NC
 kNkw==
X-Gm-Message-State: AOAM531gXGwNIxogahmdq+ImdJKPamP0UX3WTYtoxZskXOdElFfcYrT2
 LJbmKgjMff009tZPlIuM1BXU8CGojlWCnZjCAE4=
X-Google-Smtp-Source: ABdhPJxW6799mxeUzoB48DvT0FXTNwmWHONPl+cHVkxeRwWgBN0xlWUX+n978nIvNloFpd/wE8Q+PSrXa+QzmCwfVeQ=
X-Received: by 2002:a1f:fe04:: with SMTP id l4mr2579598vki.9.1630601075662;
 Thu, 02 Sep 2021 09:44:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210707214752.3831-1-rdunlap@infradead.org>
 <fca8f952-2be0-5c57-d60d-5c4f025abc4d@microchip.com>
 <49495ab9-5039-f332-2895-1a79c034f58d@infradead.org>
In-Reply-To: <49495ab9-5039-f332-2895-1a79c034f58d@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Sep 2021 18:44:23 +0200
Message-ID: <CAMuHMdU=ODKZJ0OOsuCeJnTWuM3fP5DE7coSzB=fvAbxPQWDcg@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: atmel: ATMEL drivers don't need HAS_DMA
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 mirq-linux@rere.qmqm.pl, Mark Brown <broonie@kernel.org>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Codrin.Ciubotariu@microchip.com
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

Hi Randy,

On Thu, Jul 8, 2021 at 6:51 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 7/8/21 1:19 AM, Codrin.Ciubotariu@microchip.com wrote:
> > On 08.07.2021 00:47, Randy Dunlap wrote:
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>
> >> On a config (such as arch/sh/) which does not set HAS_DMA when MMU
> >> is not set, several ATMEL ASoC drivers select symbols that cause
> >> kconfig warnings. There is one "depends on HAS_DMA" which is no longer
> >> needed. Dropping it eliminates the kconfig warnings and still builds
> >> with no problems reported.
> >>
> >> Fix the following kconfig warnings:
> >>
> >> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_PDC
> >>    Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && HAS_DMA [=n]
> >>    Selected by [m]:
> >>    - SND_ATMEL_SOC_SSC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m]
> >>    - SND_ATMEL_SOC_SSC_PDC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m]
> >>
> >> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC_PDC
> >>    Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m] && HAS_DMA [=n]
> >>    Selected by [m]:
> >>    - SND_AT91_SOC_SAM9G20_WM8731 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && SND_SOC_I2C_AND_SPI [=m]
> >>
> >> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC
> >>    Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && HAS_DMA [=n]
> >>    Selected by [m]:
> >>    - SND_ATMEL_SOC_SSC_DMA [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m]
> >>
> >> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC_DMA
> >>    Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m] && HAS_DMA [=n]
> >>    Selected by [m]:
> >>    - SND_ATMEL_SOC_WM8904 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && I2C [=m]
> >>    - SND_AT91_SOC_SAM9X5_WM8731 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && SND_SOC_I2C_AND_SPI [=m]
> >>
> >> Fixes: 3951e4aae2ce ("ASoC: atmel-pcm: dma support based on pcm dmaengine")
> >> Fixes: 18291410557f ("ASoC: atmel: enable SOC_SSC_PDC and SOC_SSC_DMA in Kconfig")
> >> Fixes: 061981ff8cc8 ("ASoC: atmel: properly select dma driver state")
> >
> > I am not sure about these fixes tags. As Alexandre mentioned, it looks
> > like the reason for HAS_DMA in the first place was the COMPILE_TEST with
> > m32r arch. I dig a bit, and, if any, I think we should use:
> > Fixes: eb17726b00b3 ("m32r: add simple dma")
> > since this commit adds dummy DMA support for m32r and seems to fix the
> > HAS_DMA dependency.
>
> Ah, I forgot to update the Fixes: tag(s).
>
> I won't disagree with your Fixes: suggestion (good digging) but
> I would probably have used 8d7d11005e930:
>   ASoC: atmel: fix build failure
> which is the commit that added "depends on HAS_DMA".

M32r was not the only platform NO_DMA, so I guess the build would
have failed for the others, too (e.g. Sun-3).

So the real fix was probably commit f29ab49b5388b2f8 ("dma-mapping:
Convert NO_DMA get_dma_ops() into a real dummy"), or one of the
related commits adding dummies to subsystems.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
