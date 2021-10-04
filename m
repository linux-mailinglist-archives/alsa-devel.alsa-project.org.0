Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E0642067F
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 09:16:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 989831690;
	Mon,  4 Oct 2021 09:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 989831690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633331768;
	bh=XGd9AcsBIpF/hzuOi8u69V35VLyreD/MQD9cGSIhAbE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H2xTlGsbOS17BbLHZmP5TfSzBTCPGdV4ONtQ7XW1WSY2WBxRObz2XxyVMj71OcMll
	 gOOPbudZOwUPgOC8JOXdmlmP0Pf21pxg/JV64E2Sb+GtcJnPQglCi6WGJOJLrD0XL9
	 p3KnGkdFbeHPq+5HaEdX001O1Yd8uAWqgmEoehhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 088E6F80229;
	Mon,  4 Oct 2021 09:14:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3ECDAF80240; Mon,  4 Oct 2021 09:14:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C02DFF800BA
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 09:14:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C02DFF800BA
Received: by mail-vs1-f46.google.com with SMTP id l19so18360992vst.7
 for <alsa-devel@alsa-project.org>; Mon, 04 Oct 2021 00:14:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A9EwFX43l/2r99tmwRun5vT5zyRd1lmM0divCgfmoFw=;
 b=JCBwN6k5BZ28bsrYkuyU6WXevulSYBKKyn826exz9C1IoTCx8W9fqQxra3J+HdJrbu
 GSaImrNaiHqK7Zz4dA3Tpf+a2VrbW4Pm2O3vc0r7PU+fwQWMKcWjUxK3fgbl2e3gK/D2
 HEriG4Bf0915ffNu2H454eoPI65fGUn49PwY6hACEgofI6jtEcmZ88qmgVyxAMX2lUmV
 DfGje0mfn5QzHcxei9AogiVI39J82kDcLW6yOjB7KwKAS9vVvVkjc40BOc1Xvq+lhVgm
 WMa28Fcs35B/qHaiZUn+hVUSfymzGgwQVgGQo8QffpGjtmIRXWbUqoEH/yxweNb3Vdxx
 misQ==
X-Gm-Message-State: AOAM533lzzoVC+21RReSWDHhDrHh2/0nSaJx+J9urGfW3JCJ6OB/KeRU
 Z/8Pl8BHtApf6IEfHyFT7nuw1jAO/jq1qSqbE8s=
X-Google-Smtp-Source: ABdhPJwPUrVlAy5tkRXrLHhIaBrswRZA2a5X0zmaS24RWUwiCQqZa669QAw1LVnhiyUQwtk7S3TTLkOlHsvMsWcFEsQ=
X-Received: by 2002:a67:f147:: with SMTP id t7mr11286284vsm.41.1633331683781; 
 Mon, 04 Oct 2021 00:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211003030357.32456-1-rdunlap@infradead.org>
In-Reply-To: <20211003030357.32456-1-rdunlap@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Oct 2021 09:14:32 +0200
Message-ID: <CAMuHMdVuObZvVCkQbXfmruB_RnprkghAv6b14Pz5nC+7M4YtzQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: atmel: add COMPILE_TEST for SND_ATMEL_SOC_PDC
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
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

> This means that SND_ATMEL_SOC_PDC can depend on HAS_DMA || COMPIE_TEST.

COMPILE_TEST

> Fixes: 6c5c659dfe3f ("ASoC: atmel: ATMEL drivers don't need HAS_DMA")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: alsa-devel@alsa-project.org
> Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> ---
>  sound/soc/atmel/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linux-next-20211001.orig/sound/soc/atmel/Kconfig
> +++ linux-next-20211001/sound/soc/atmel/Kconfig
> @@ -11,6 +11,7 @@ if SND_ATMEL_SOC
>
>  config SND_ATMEL_SOC_PDC
>         bool
> +       depends on HAS_DMA || COMPILE_TEST
>
>  config SND_ATMEL_SOC_DMA
>         bool

The actual change LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
