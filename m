Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D474420688
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 09:19:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F10F1690;
	Mon,  4 Oct 2021 09:18:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F10F1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633331940;
	bh=nyMh/CD6BaPxvp+dvxBXaGMKYHouD2jSxQ3s7Qqv67Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ci+rWYJGOueg7zOBhcn/vLG82bb+tJWZfN55PH64PDKxvgY/XJlWcq+JRgudjYNF7
	 bP+5bYRTPs0x/8BGefrJZytQtm5TQ/YKxrCW5Sno6+Q6AmMufLrV1KJnQYKBJGssLc
	 bGgbjIM4el4WXoTVIOYa8MX8WWbm/IN7HdrDi5UU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B477F8010B;
	Mon,  4 Oct 2021 09:17:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D3B4F80240; Mon,  4 Oct 2021 09:17:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23EADF800BA
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 09:17:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23EADF800BA
Received: by mail-vs1-f49.google.com with SMTP id y141so2728416vsy.5
 for <alsa-devel@alsa-project.org>; Mon, 04 Oct 2021 00:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tq3r3SqIuxf7MSAP423+T3z19O8+N54Ab2Em8HAL104=;
 b=mxweQZ2fpsPIjodIwoqv5gfIxvf/MKFGzd0UoXnNy9QCDskEOannZZgNlk62EkC7Ff
 1AuZb4TSzH+9vW90s7Z2dOgxou1r1tjfGe4XZljcKApMZSdWfHHbuqRS0N/YdgGoLgCu
 R45UbOS7qGVOHC1tFglnR46adn9bhKpgDEA4OoxK99GSAVWtUJw6nxMlFu7NTjypdl8q
 W/0qjFtJWZPEAteBR9mGP4KAeCuA75sTNuruVxaW1GbF4CR5+D5tkj77QK+9mxeknwuE
 qoatqb5AIlEA9TaxWO1iks0MOpO0tuj3L9v+zgGshy/JgsipuNvlfl4o8eewqYTWxI8g
 EamQ==
X-Gm-Message-State: AOAM533DhjggLGDwhlrqxFR2fCtg0SkelX6MfkEFAwN9s8XKD/QpN3/r
 GPut9byb7VIwqyBGGWvSgezTAEVqPct4aupCe+w=
X-Google-Smtp-Source: ABdhPJxlU5DOPg9j9M8lzJDp/gf8nfLm5tU4dSRqNvnBVD3Ar4MoASkpYleFMBnm+HvISxcTtu38S+NO9ww7xL7VdnI=
X-Received: by 2002:a67:2c58:: with SMTP id s85mr11305419vss.35.1633331852971; 
 Mon, 04 Oct 2021 00:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211003030404.32707-1-rdunlap@infradead.org>
In-Reply-To: <20211003030404.32707-1-rdunlap@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Oct 2021 09:17:22 +0200
Message-ID: <CAMuHMdVRJ4kY1vncgm3jn=p1gYzYQC7C9E3dv+KoYauJgjL=fw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: add COMPILE_TEST for SND_SOC_FSL_ASRC
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>,
 Fabio Estevam <festevam@gmail.com>
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

On Sun, Oct 3, 2021 at 5:04 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> Geert pointed out that since sound/soc has the soc_dummy_driver for
> NO_DMA platforms, it is possible (desirable) to have drivers that
> depend on HAS_DMA to alternately depend on COMPILE_TEST.

Actually I had never heard about the soc_dummy_driver before ;-)
I did know about the dummies in include/linux/dma-mapping.h.

> This means that SND_ATMEL_FSL_ASRC can depend on HAS_DMA || COMPIE_TEST.

COMPILE_TEST

> Fixes: 121a01521b1e ("ASoC: fsl: fix build failure")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- linux-next-20211001.orig/sound/soc/fsl/Kconfig
> +++ linux-next-20211001/sound/soc/fsl/Kconfig
> @@ -5,7 +5,7 @@ comment "Common SoC Audio options for Fr
>
>  config SND_SOC_FSL_ASRC
>         tristate "Asynchronous Sample Rate Converter (ASRC) module support"
> -       depends on HAS_DMA
> +       depends on HAS_DMA || COMPILE_TEST
>         select REGMAP_MMIO
>         select SND_SOC_GENERIC_DMAENGINE_PCM
>         help

The actual change LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
