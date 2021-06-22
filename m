Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BFC3B16B7
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Jun 2021 11:20:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6980E166D;
	Wed, 23 Jun 2021 11:20:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6980E166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624440054;
	bh=NqFXh1RzaIB7T3yUivBhV+3jLDLAyj/zzCtWY0JA0SQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aWg1QB5xlgPMVgpb+zKw2hm5aKBIIDheqmSQ89syyeage/VKVh0y4G3PxrtAhc9HT
	 vFiaGOuZMXhsPy614bGNs384qYBpsGskvZxzV/DF/sLGHuTjHgi/6wH2WGgtGihRZd
	 w7DvVLM5jZ2uIOFk0+Ye4BETpJAPHa52pVQVThs4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02BC1F804E3;
	Wed, 23 Jun 2021 11:17:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BD9DF8026A; Tue, 22 Jun 2021 15:44:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67122F800E1
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 15:44:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67122F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pwpg3U6V"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C1B6613C7
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 13:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624369433;
 bh=NqFXh1RzaIB7T3yUivBhV+3jLDLAyj/zzCtWY0JA0SQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pwpg3U6V31p8pQ5cihd9K184k/F/Mi0oHppu5MkBdzdwhDdakPHeoFqOSid4OVyCU
 U0q3NEAdd0gpakUJ0m2eS0ldbEliviNkFG/s1PPjW5P+JPCrWOjx33BE1WkAudGmcP
 5jf8z05XLPJwSxmm8kPcrYfBtKIJ8LS4Gk1kjxWNWpeeFYxFaotFMBX8xCD0ddr4iB
 DMksKQpxCWn8CbFiEBCwAOsxXNAhHRVSAZorb1iw4jIV3qVtrJXV6zA8tMvT/9lHwE
 4CfHw1r2iRL66cKomekh6aeUD2VZCuKbyGMJH6lZJQ/AM9WMqhUYqhHqZClpZgGYsj
 AYj31ywBBv4yA==
Received: by mail-ed1-f41.google.com with SMTP id df12so21265506edb.2
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 06:43:52 -0700 (PDT)
X-Gm-Message-State: AOAM5317kDOr0ovq2DGIP9Mcr0JWtytl94+BjO4RIlPsy77KVmqnv2dT
 4Q8e76+G6dZIdKN3JTWdvP5Rwn3XdQj1nxBM9Q==
X-Google-Smtp-Source: ABdhPJzR0Ub3ZgSNkr3MEhjSHq6x9DynzmvMX7quMzOS1boijoDJs7nsAsYPAJuJ3rupM/aSXMVZuLXS4ayPZR+vCGA=
X-Received: by 2002:a05:6402:ca2:: with SMTP id
 cn2mr2897976edb.62.1624369431373; 
 Tue, 22 Jun 2021 06:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210615191543.1043414-1-robh@kernel.org>
 <CAMuHMdUGXu8yj3JWKwM8mt7axkrzGMiowC1t0PHrbpxRCBME3w@mail.gmail.com>
In-Reply-To: <CAMuHMdUGXu8yj3JWKwM8mt7axkrzGMiowC1t0PHrbpxRCBME3w@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 22 Jun 2021 07:43:37 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ8jjkufTAmoFHuqpWB0bMUfCCkUR-pFFa2MoyeGzgBvA@mail.gmail.com>
Message-ID: <CAL_JsqJ8jjkufTAmoFHuqpWB0bMUfCCkUR-pFFa2MoyeGzgBvA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop redundant minItems/maxItems
To: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 23 Jun 2021 11:17:51 +0200
Cc: Andrew Lunn <andrew@lunn.ch>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)"
 <linux-ide@vger.kernel.org>, Linux I2C <linux-i2c@vger.kernel.org>,
 linux-phy@lists.infradead.org, linux-riscv <linux-riscv@lists.infradead.org>,
 Lee Jones <lee.jones@linaro.org>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Herbert Xu <herbert@gondor.apana.org.au>,
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

On Tue, Jun 22, 2021 at 2:17 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Rob,
>
> On Tue, Jun 15, 2021 at 9:16 PM Rob Herring <robh@kernel.org> wrote:
> > If a property has an 'items' list, then a 'minItems' or 'maxItems' with the
> > same size as the list is redundant and can be dropped. Note that is DT
> > schema specific behavior and not standard json-schema behavior. The tooling
> > will fixup the final schema adding any unspecified minItems/maxItems.
> >
> > This condition is partially checked with the meta-schema already, but
> > only if both 'minItems' and 'maxItems' are equal to the 'items' length.
> > An improved meta-schema is pending.
>
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> > --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> > @@ -46,7 +46,6 @@ properties:
> >
> >    clocks:
> >      minItems: 3
> > -    maxItems: 5
> >      items:
> >        - description: GMAC main clock
> >        - description: MAC TX clock
>
> While resolving the conflict with commit fea99822914039c6
> ("dt-bindings: net: document ptp_ref clk in dwmac") in soc/for-next,
> I noticed the following construct for clock-names:
>
>   clock-names:
>     minItems: 3
>     maxItems: 6
>     contains:
>       enum:
>         - stmmaceth
>         - mac-clk-tx
>         - mac-clk-rx
>         - ethstp
>         - eth-ck
>         - ptp_ref
>
> Should this use items instead of enum, and drop maxItems, or is this
> a valid construct to support specifying the clocks in random order?
> If the latter, it does mean that the order of clock-names may not
> match the order of the clock descriptions.

'contains' is true if one or more entries match the strings. So it is
really saying one of these is required. That's not really much of a
constraint. There's 'minContains' and 'maxContains' in newer
json-schema versions (not yet supported) that could add some
constraints if there has to be at least N entries from contains. An
'items' schema (as opposed to a list) would say all items have to
match one of the strings. I'm sure that's too strict.

TLDR: clocks for this binding are a mess and the above is probably all
we can do here.

Rob
