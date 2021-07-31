Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3133DD149
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 09:36:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 577821843;
	Mon,  2 Aug 2021 09:35:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 577821843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627889767;
	bh=6TOszkUOMxKqMHQ6uy/Jdp6GEM++nCk3ST/dtYxR0sQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZUihN4bdp5t7hctGLC9GvdGV9O/l7dXKeE8peNmOEx2I6HWvoZGoESQPLDb70Y42M
	 Qv1HP3StsSs1DQZCgVorjCdzO22qTgmZFxL2Hxa/7PzwPNStjMUSsv28Ya6ogbaOqZ
	 sRczKPwNSKS4Y61rMYDmv5XiFRK1JqsoEHVNK5rM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC28AF80571;
	Mon,  2 Aug 2021 09:29:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06239F80276; Sun,  1 Aug 2021 00:05:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E94A3F8014D
 for <alsa-devel@alsa-project.org>; Sun,  1 Aug 2021 00:05:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E94A3F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="oxTawDKt"
Received: by mail-lj1-x22a.google.com with SMTP id n6so18296711ljp.9
 for <alsa-devel@alsa-project.org>; Sat, 31 Jul 2021 15:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eavS7+nVlKa3pE/nMERuVdSNOcLN0CSyw0CYPXJs2RE=;
 b=oxTawDKtE7gUMCEZTGVhmlVv2Y3WYDP+FS3lOaHPAgoD7WcgQjYd0RzzaaCmE3977P
 y2AZlp+prHKgerutQ7jx1R/cVL6lbK+WzauqEJucT+Izj+ziz0I0tc0O+XwvtPwksIj1
 ukvPhZPy1rocK17IvtjWMFHZ1JmoIIqK4FLNFIt716WQ3Pie0UvlUCbiTbUjKG2RTcHV
 7aLptfufBWxUeUNmjY6/SgCFLiwOzAyRIGpCOm9JFIGiWEdzkbX1t7kvgcWoJlruvGQV
 TNKC7K+DYoXaKkZDcceTWufkpcffdIMAe8eG+6751qHasEPk6w4m+/EI6Gd9NCUzZuvT
 oxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eavS7+nVlKa3pE/nMERuVdSNOcLN0CSyw0CYPXJs2RE=;
 b=S69Y8Vbd3qbtVTyMcDFUjShJ1gCn05roAHWAjoJ7aTjcSI9zj0n31W8B7309nume1m
 1hJaZcT4xhAQXuqK19AjbeJ0rgowaMiyxDS43IBcrrzvsNCdddaKZeX9OjEtocF9OKxF
 /mnvv7Tg6W2DYKJYazR/GTeEdNiI6OSFyK3zFVdvah+MNrYXxF+c2EzMwzpOaT8GFoAh
 X5jhrrJY9FNTx1Pw32SsPQrAPIo8jelD5hz95l28liY78I32brdnA6NVjeAsZvvc5Rqm
 YS5fAlWrZSYeyDe6ra49V4jQ+mu9bQGijxuruJHXnRiS0jjbPyXN5dLJcuLZClP53ijF
 d3pw==
X-Gm-Message-State: AOAM530FHpiNrwVfp3ND7iO+ALuXR7Tl6PkunR+BECCF1K34BuW3EKZE
 fN9Ow3dMEKo1I8yH3yOFN0ssPa3cVp+B3ewGEdOUGQ==
X-Google-Smtp-Source: ABdhPJwTjpbUeZT+xrHLeSR/vD0UodSpw43lXDmx8pJiyALETra8HqJRQTMUGT7mTfcqIT7xDGsd2Eo06KRRqoQp1Bw=
X-Received: by 2002:a2e:bc14:: with SMTP id b20mr6401323ljf.200.1627769110442; 
 Sat, 31 Jul 2021 15:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210726115058.23729-1-nikita.shubin@maquefel.me>
In-Reply-To: <20210726115058.23729-1-nikita.shubin@maquefel.me>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 1 Aug 2021 00:04:59 +0200
Message-ID: <CACRpkdYeqJFFwkc6pfSrz3-gaN_PjjV52jstqzR2sMa+bxbMuQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] arm: ep93xx: CCF conversion
To: Nikita Shubin <nikita.shubin@maquefel.me>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 02 Aug 2021 09:29:29 +0200
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 YiFei Zhu <yifeifz2@illinois.edu>, Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, "open list:INPUT \(KEYBOARD, MOUSE,
 JOYSTICK, TOUCHSCREEN\)..." <linux-input@vger.kernel.org>,
 "open list:PWM SUBSYSTEM" <linux-pwm@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 "open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
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

On Mon, Jul 26, 2021 at 1:51 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:

> This series series of patches converts ep93xx to Common Clock Framework.
>
> It consists of preparation patches to use clk_prepare_enable where it is
> needed, instead of clk_enable used in ep93xx drivers prior to CCF and
> a patch converting mach-ep93xx/clock.c to CCF.
>
> Link: https://lore.kernel.org/patchwork/cover/1445563/
> Link: https://lore.kernel.org/patchwork/patch/1435884/
>
> Alexander Sverdlin (7):
>   iio: ep93xx: Prepare clock before using it
>   spi: spi-ep93xx: Prepare clock before using it
>   Input: ep93xx_keypad: Prepare clock before using it
>   video: ep93xx: Prepare clock before using it
>   dmaengine: ep93xx: Prepare clock before using it
>   ASoC: cirrus: i2s: Prepare clock before using it
>   pwm: ep93xx: Prepare clock before using it
>
> Nikita Shubin (1):
>   ep93xx: clock: convert in-place to COMMON_CLK

This series is looking very good.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I suppose the per-subsystem patches can be picked up by
each subsystem maintainer and then you can send the "big patch"
to the SoC tree.

Yours,
Linus Walleij
