Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6FD404614
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 09:23:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C39B71685;
	Thu,  9 Sep 2021 09:23:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C39B71685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631172237;
	bh=XKrCul/vaHJCITkRmEv74DWhcTY986q9e2pvYCdbmkY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nCjeJhkZ/jochMORwDekT2e+rEs6Y+75XeL9cbR3H7BgVMsBGtUMO446g1P2fGt7Y
	 PwbLlf1Jnhmjtmqz2T9FaNkZiYSPAqnku5U39YmhQgAiMT1O5WR1ogpk7RrjnWiQ9H
	 YWNLMGYxrdqG9NOqAoek1YP0Jz4O7VlKPD+/2Wlg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28E29F80253;
	Thu,  9 Sep 2021 09:22:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47AF3F80253; Thu,  9 Sep 2021 09:22:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D141BF80166
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 09:22:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D141BF80166
Received: by mail-vs1-f42.google.com with SMTP id a21so727987vsp.12
 for <alsa-devel@alsa-project.org>; Thu, 09 Sep 2021 00:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H+v9d+F4bPXyUIm8JGEVsogxeJe3xHOqeC0XMGmz7YE=;
 b=3K3bMquoxqlHPRVfTBwxpy7Aga+5Wwr9kuYY1Mtc5yaZY1iohPyGQxFKSRXYr0pjLa
 rnbUPd3ArxKaMYpIVJwsX87IM5JUg7H1nfbR1AVAPEbeyXb/LWwqO/rpdt76kr6N9773
 cJJc5hdP+F8osrb13hajQ+3Inx3n6X4beAYohzz2xh7v3MThHoseI2ssrL3+ya5vjYWT
 cauhYz5wbK4rUPlgy2T+DGdohXw8gkvf5mjObcK6p4d4qDXLDrTuJJYS1ncJFZcjvjKp
 1vICFj4J+DBuckOItIJ6pfdVlFOvcTV8SubzMbXJJ0e77EI3tQ9gWa542SWCKk5uFjPM
 Mclg==
X-Gm-Message-State: AOAM533vXlMZN9w0N+i4EGQzhDx1Zn0EujATQrUO5NExteUlu+SgaOKf
 gj9kjX0GqrIaDDR6WqxSXuQpYKc2pywxOmFOV9E=
X-Google-Smtp-Source: ABdhPJykTjIN3pE9TsAbMpbP3TTqT1MAxeOy9g6mTRjOzKkl8dmcBEB1NsgVKqbiG1dFvptnf51LnAoJDd9zdC/P1yI=
X-Received: by 2002:a67:3289:: with SMTP id y131mr621870vsy.37.1631172151478; 
 Thu, 09 Sep 2021 00:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210707214752.3831-1-rdunlap@infradead.org>
 <fca8f952-2be0-5c57-d60d-5c4f025abc4d@microchip.com>
 <49495ab9-5039-f332-2895-1a79c034f58d@infradead.org>
 <CAMuHMdU=ODKZJ0OOsuCeJnTWuM3fP5DE7coSzB=fvAbxPQWDcg@mail.gmail.com>
 <a94c9788-0415-ffe3-9dd4-e6ed8d7ee96a@infradead.org>
 <CAMuHMdWUcaC-xiW0UiVdTpx-R=e_i8eHSNc8JF_wqbcO6FynWw@mail.gmail.com>
 <f5cf4155-785f-9ec7-1f59-be5c92911b0a@infradead.org>
In-Reply-To: <f5cf4155-785f-9ec7-1f59-be5c92911b0a@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Sep 2021 09:22:19 +0200
Message-ID: <CAMuHMdXcmW27KhQEgxmVSDgR8GDnb_5mYNPYepa15F_tKqk9-A@mail.gmail.com>
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

On Wed, Sep 8, 2021 at 10:14 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 9/6/21 12:14 AM, Geert Uytterhoeven wrote:
> > On Fri, Sep 3, 2021 at 9:53 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >> On 9/2/21 9:44 AM, Geert Uytterhoeven wrote:
> >>> On Thu, Jul 8, 2021 at 6:51 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >>>> On 7/8/21 1:19 AM, Codrin.Ciubotariu@microchip.com wrote:
> >>>>> On 08.07.2021 00:47, Randy Dunlap wrote:
> >>>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>>>>
> >>>>>> On a config (such as arch/sh/) which does not set HAS_DMA when MMU
> >>>>>> is not set, several ATMEL ASoC drivers select symbols that cause
> >>>>>> kconfig warnings. There is one "depends on HAS_DMA" which is no longer
> >>>>>> needed. Dropping it eliminates the kconfig warnings and still builds
> >>>>>> with no problems reported.
> >>>>>>
> >>>>>> Fix the following kconfig warnings:
> >>>>>>
> >>>>>> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_PDC
> >>>>>>      Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && HAS_DMA [=n]
> >>>>>>      Selected by [m]:
> >>>>>>      - SND_ATMEL_SOC_SSC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m]
> >>>>>>      - SND_ATMEL_SOC_SSC_PDC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m]
> >>>>>>
> >>>>>> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC_PDC
> >>>>>>      Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m] && HAS_DMA [=n]
> >>>>>>      Selected by [m]:
> >>>>>>      - SND_AT91_SOC_SAM9G20_WM8731 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && SND_SOC_I2C_AND_SPI [=m]
> >>>>>>
> >>>>>> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC
> >>>>>>      Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && HAS_DMA [=n]
> >>>>>>      Selected by [m]:
> >>>>>>      - SND_ATMEL_SOC_SSC_DMA [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m]
> >>>>>>
> >>>>>> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC_DMA
> >>>>>>      Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m] && HAS_DMA [=n]
> >>>>>>      Selected by [m]:
> >>>>>>      - SND_ATMEL_SOC_WM8904 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && I2C [=m]
> >>>>>>      - SND_AT91_SOC_SAM9X5_WM8731 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && SND_SOC_I2C_AND_SPI [=m]
> >>>>>>
> >>>>>> Fixes: 3951e4aae2ce ("ASoC: atmel-pcm: dma support based on pcm dmaengine")
> >>>>>> Fixes: 18291410557f ("ASoC: atmel: enable SOC_SSC_PDC and SOC_SSC_DMA in Kconfig")
> >>>>>> Fixes: 061981ff8cc8 ("ASoC: atmel: properly select dma driver state")
> >>>>>
> >>>>> I am not sure about these fixes tags. As Alexandre mentioned, it looks
> >>>>> like the reason for HAS_DMA in the first place was the COMPILE_TEST with
> >>>>> m32r arch. I dig a bit, and, if any, I think we should use:
> >>>>> Fixes: eb17726b00b3 ("m32r: add simple dma")
> >>>>> since this commit adds dummy DMA support for m32r and seems to fix the
> >>>>> HAS_DMA dependency.
> >>>>
> >>>> Ah, I forgot to update the Fixes: tag(s).
> >>>>
> >>>> I won't disagree with your Fixes: suggestion (good digging) but
> >>>> I would probably have used 8d7d11005e930:
> >>>>     ASoC: atmel: fix build failure
> >>>> which is the commit that added "depends on HAS_DMA".
> >>>
> >>> M32r was not the only platform NO_DMA, so I guess the build would
> >>> have failed for the others, too (e.g. Sun-3).
> >>>
> >>> So the real fix was probably commit f29ab49b5388b2f8 ("dma-mapping:
> >>> Convert NO_DMA get_dma_ops() into a real dummy"), or one of the
> >>> related commits adding dummies to subsystems.
> >>
> >> Does this mean that some other actions are needed here?
> >> E.g. revert + a different kind of fix?
> >
> > While we can now compile drivers using DMA features on NO_DMA
> > platforms, thanks to the dummies, it does mean many of these drivers
> > cannot work on such platforms.  So I think it makes sense to replace
> > "depends on HAS_DMA" by "depends on HAS_DMA || COMPILE_TEST" if DMA
> > is not optional to the driver.
>
> Hi Geert,
>
> Is this what you had in mind?  It seems to work with my (limited)
> testing.

Yes. And also for other symbols for drivers that now compile fine
if !HAS_DMA, thanks to the dummies.

> --- linux-next-20210907.orig/sound/soc/atmel/Kconfig
> +++ linux-next-20210907/sound/soc/atmel/Kconfig
> @@ -11,6 +11,7 @@ if SND_ATMEL_SOC
>
>   config SND_ATMEL_SOC_PDC
>         bool
> +       depends on HAS_DMA || COMPILE_TEST
>
>   config SND_ATMEL_SOC_DMA
>         bool

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
