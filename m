Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE2F3B16B3
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 11:19:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3DB484C;
	Wed, 23 Jun 2021 11:18:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3DB484C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624439977;
	bh=i9DoHH3x32/k5xhsfB7BIN2ZgpoFfLC4fgPISuyR9Mo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ff0mNk02wJakmtIQUT2eGWOWHH1aIWgLLZPq0dcwYD2glT+ATvmAWGfd6PL3FGhzL
	 DVBoHs4l9qMwbAyScDCKBVXbFaNSULF+sLXpyxlw7QkE0Vt+3FaBZ6OMDpIBxDfRnt
	 dxrNvro9eaKl3z6YNSgSVDWiVMbCl/D/sxI5eqcU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFE35F80290;
	Wed, 23 Jun 2021 11:17:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7522F80268; Tue, 22 Jun 2021 10:17:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B5C8F800E1
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 10:17:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B5C8F800E1
Received: by mail-vs1-f49.google.com with SMTP id j8so10788977vsd.0
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 01:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s0hVMlLFV5eIwzuXXBEJWEV7FxMfuDBGtQwv1PuAfDc=;
 b=RlUve1WNpyp4KxptPDqTK7vJ9068bE9DSCtuTXCZAfrwG38GdVtMz7rgHmhebRqR16
 BX2tcNoOrvzMoYfOwAMCXKbZLGoM7REPKtrwLDmjuD+OwFFMM/jAoXDihJvSfpnz4NGD
 RaY+KnAiJXwmKDRR2rL2xjPgY3qTZ1J9uMOhZUbCAsopzJ7NUXYDJrBM+IunNHu985KE
 wHoRVNAaJDk7AfgPfrbRFrqkFBXnL35baEW86Sqb6SSKTgSnWDeUOjIFVLzsDERX5lXh
 Yk+BpkZxr82oMSzhi0kIwswEKKRk92UauzPWff08aycKwDrTC2yDayfUVkJvWBw0pY5+
 gXZQ==
X-Gm-Message-State: AOAM532BfoZ3xljXcgUBoYAnBxIQM+gUxkFVIvEtlM+q5tikVPLwFrwK
 XJWP9J8QsJCJkpmmxBDtSIzDd+jaoOJiU1jA/mg=
X-Google-Smtp-Source: ABdhPJz3clw2O8tsVFk5F4OGcaBfo9Z8eHqvoF8LwYXAPGollSTCOREHx1S0f08A9nsiznMjaM5G5srL4UVXlJSotsU=
X-Received: by 2002:a05:6102:2011:: with SMTP id
 p17mr21421376vsr.40.1624349860512; 
 Tue, 22 Jun 2021 01:17:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210615191543.1043414-1-robh@kernel.org>
In-Reply-To: <20210615191543.1043414-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Jun 2021 10:17:28 +0200
Message-ID: <CAMuHMdUGXu8yj3JWKwM8mt7axkrzGMiowC1t0PHrbpxRCBME3w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop redundant minItems/maxItems
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 23 Jun 2021 11:17:52 +0200
Cc: Andrew Lunn <andrew@lunn.ch>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux PWM List <linux-pwm@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci <linux-pci@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-ide@vger.kernel.org,
 Linux I2C <linux-i2c@vger.kernel.org>, linux-phy@lists.infradead.org,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Lee Jones <lee.jones@linaro.org>, linux-clk <linux-clk@vger.kernel.org>,
 linux-rtc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Marc Zyngier <maz@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 David Airlie <airlied@linux.ie>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>, linux-can@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>,
 Alessandro Zummo <a.zummo@towertech.it>, Guenter Roeck <linux@roeck-us.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 netdev <netdev@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 USB list <linux-usb@vger.kernel.org>,
 Linux MMC List <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dmaengine <dmaengine@vger.kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
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

Hi Rob,

On Tue, Jun 15, 2021 at 9:16 PM Rob Herring <robh@kernel.org> wrote:
> If a property has an 'items' list, then a 'minItems' or 'maxItems' with the
> same size as the list is redundant and can be dropped. Note that is DT
> schema specific behavior and not standard json-schema behavior. The tooling
> will fixup the final schema adding any unspecified minItems/maxItems.
>
> This condition is partially checked with the meta-schema already, but
> only if both 'minItems' and 'maxItems' are equal to the 'items' length.
> An improved meta-schema is pending.

> Signed-off-by: Rob Herring <robh@kernel.org>

> --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> @@ -46,7 +46,6 @@ properties:
>
>    clocks:
>      minItems: 3
> -    maxItems: 5
>      items:
>        - description: GMAC main clock
>        - description: MAC TX clock

While resolving the conflict with commit fea99822914039c6
("dt-bindings: net: document ptp_ref clk in dwmac") in soc/for-next,
I noticed the following construct for clock-names:

  clock-names:
    minItems: 3
    maxItems: 6
    contains:
      enum:
        - stmmaceth
        - mac-clk-tx
        - mac-clk-rx
        - ethstp
        - eth-ck
        - ptp_ref

Should this use items instead of enum, and drop maxItems, or is this
a valid construct to support specifying the clocks in random order?
If the latter, it does mean that the order of clock-names may not
match the order of the clock descriptions.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
