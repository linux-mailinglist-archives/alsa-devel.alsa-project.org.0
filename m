Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF064016DE
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Sep 2021 09:16:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87B361774;
	Mon,  6 Sep 2021 09:15:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87B361774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630912590;
	bh=w6bFzmbQ3gi7Kcf4h11MOD4Q+1PzA4zTRIwDkZ2NkGA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dyj/+tTOr+qYfmwBqQsCgq2XCeGPC/U5Rzy4uNAarLacH1fu1CEoehZgscN4ioMBG
	 m7X5kgN8SRPooWNTvWxD58mZLGNp+RqzjNKTm/XA0Kxdrcjz2brt26VFJ4tYEMvraK
	 m6R8VSAgF01pFMstr0IrNC9QExoDzk0jIXI+856M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1961F804A9;
	Mon,  6 Sep 2021 09:15:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50ECDF800C7; Mon,  6 Sep 2021 09:15:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 425F0F800C7
 for <alsa-devel@alsa-project.org>; Mon,  6 Sep 2021 09:15:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 425F0F800C7
Received: by mail-vs1-f53.google.com with SMTP id l9so4773183vsb.8
 for <alsa-devel@alsa-project.org>; Mon, 06 Sep 2021 00:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/+lyTeHgpCDp3c3yF7GwweZe7fgOgOOdi97EH6LIddw=;
 b=OU6yeNgcvJvexN6SGcxlXqtcWmeqeoHhQcPk0ZZWcVAV0zLOu2kRL0MYlqy+fgZ1fa
 wQYRa2ZcALIlM9WemfYdtOflVYokcuSwIJoRuuj7SucwOS876ZfpbJLq+QcR8Qr1GcHT
 Ho/L73UGdddL7+yjnHm2FRyw8g0XqcVlzsGiZ2bi3IfIosHOY9thMnAGxBlu6n0auUS6
 Ybi2PHp314Sd6Rv882zF3ZTzDq3smctp+Lugo7q54bISAUyD+do/Z8wtjfPHrTIIQ2xF
 jWwqgBJzv++qG3sKlU+7P9yLn9yHO4H9xkhPsEHYFliNOyPg2X/Zw2s2X0fLStMbSnz/
 tZWA==
X-Gm-Message-State: AOAM532SCECzt3nD5U+K4nO4sqKa9HHMXvwytb5suIoGLtXik6Bl6Nkn
 pr44qjyuN5c31bBZ16wsbI3mevqVoQKkTHP3jgA=
X-Google-Smtp-Source: ABdhPJwDpp3xUZ2EsTWxY2yM2j8OGQRBQBLh7qYKrpDBshgnN16v17gxVhZqfEOQtWVH48ARuasK7mk5BVbe27a+EU0=
X-Received: by 2002:a67:efd6:: with SMTP id s22mr5165647vsp.50.1630912502493; 
 Mon, 06 Sep 2021 00:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210707214752.3831-1-rdunlap@infradead.org>
 <fca8f952-2be0-5c57-d60d-5c4f025abc4d@microchip.com>
 <49495ab9-5039-f332-2895-1a79c034f58d@infradead.org>
 <CAMuHMdU=ODKZJ0OOsuCeJnTWuM3fP5DE7coSzB=fvAbxPQWDcg@mail.gmail.com>
 <a94c9788-0415-ffe3-9dd4-e6ed8d7ee96a@infradead.org>
In-Reply-To: <a94c9788-0415-ffe3-9dd4-e6ed8d7ee96a@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Sep 2021 09:14:51 +0200
Message-ID: <CAMuHMdWUcaC-xiW0UiVdTpx-R=e_i8eHSNc8JF_wqbcO6FynWw@mail.gmail.com>
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

On Fri, Sep 3, 2021 at 9:53 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> On 9/2/21 9:44 AM, Geert Uytterhoeven wrote:
> > On Thu, Jul 8, 2021 at 6:51 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >> On 7/8/21 1:19 AM, Codrin.Ciubotariu@microchip.com wrote:
> >>> On 08.07.2021 00:47, Randy Dunlap wrote:
> >>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >>>>
> >>>> On a config (such as arch/sh/) which does not set HAS_DMA when MMU
> >>>> is not set, several ATMEL ASoC drivers select symbols that cause
> >>>> kconfig warnings. There is one "depends on HAS_DMA" which is no longer
> >>>> needed. Dropping it eliminates the kconfig warnings and still builds
> >>>> with no problems reported.
> >>>>
> >>>> Fix the following kconfig warnings:
> >>>>
> >>>> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_PDC
> >>>>     Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && HAS_DMA [=n]
> >>>>     Selected by [m]:
> >>>>     - SND_ATMEL_SOC_SSC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m]
> >>>>     - SND_ATMEL_SOC_SSC_PDC [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m]
> >>>>
> >>>> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC_PDC
> >>>>     Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m] && HAS_DMA [=n]
> >>>>     Selected by [m]:
> >>>>     - SND_AT91_SOC_SAM9G20_WM8731 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && SND_SOC_I2C_AND_SPI [=m]
> >>>>
> >>>> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC
> >>>>     Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && HAS_DMA [=n]
> >>>>     Selected by [m]:
> >>>>     - SND_ATMEL_SOC_SSC_DMA [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m]
> >>>>
> >>>> WARNING: unmet direct dependencies detected for SND_ATMEL_SOC_SSC_DMA
> >>>>     Depends on [n]: SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && ATMEL_SSC [=m] && HAS_DMA [=n]
> >>>>     Selected by [m]:
> >>>>     - SND_ATMEL_SOC_WM8904 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && I2C [=m]
> >>>>     - SND_AT91_SOC_SAM9X5_WM8731 [=m] && SOUND [=m] && !UML && SND [=m] && SND_SOC [=m] && SND_ATMEL_SOC [=m] && (ARCH_AT91 || COMPILE_TEST [=y]) && ATMEL_SSC [=m] && SND_SOC_I2C_AND_SPI [=m]
> >>>>
> >>>> Fixes: 3951e4aae2ce ("ASoC: atmel-pcm: dma support based on pcm dmaengine")
> >>>> Fixes: 18291410557f ("ASoC: atmel: enable SOC_SSC_PDC and SOC_SSC_DMA in Kconfig")
> >>>> Fixes: 061981ff8cc8 ("ASoC: atmel: properly select dma driver state")
> >>>
> >>> I am not sure about these fixes tags. As Alexandre mentioned, it looks
> >>> like the reason for HAS_DMA in the first place was the COMPILE_TEST with
> >>> m32r arch. I dig a bit, and, if any, I think we should use:
> >>> Fixes: eb17726b00b3 ("m32r: add simple dma")
> >>> since this commit adds dummy DMA support for m32r and seems to fix the
> >>> HAS_DMA dependency.
> >>
> >> Ah, I forgot to update the Fixes: tag(s).
> >>
> >> I won't disagree with your Fixes: suggestion (good digging) but
> >> I would probably have used 8d7d11005e930:
> >>    ASoC: atmel: fix build failure
> >> which is the commit that added "depends on HAS_DMA".
> >
> > M32r was not the only platform NO_DMA, so I guess the build would
> > have failed for the others, too (e.g. Sun-3).
> >
> > So the real fix was probably commit f29ab49b5388b2f8 ("dma-mapping:
> > Convert NO_DMA get_dma_ops() into a real dummy"), or one of the
> > related commits adding dummies to subsystems.
>
> Hi Geert,
> Does this mean that some other actions are needed here?
> E.g. revert + a different kind of fix?

While we can now compile drivers using DMA features on NO_DMA
platforms, thanks to the dummies, it does mean many of these drivers
cannot work on such platforms.  So I think it makes sense to replace
"depends on HAS_DMA" by "depends on HAS_DMA || COMPILE_TEST" if DMA
is not optional to the driver.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
