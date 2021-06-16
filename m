Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAC03AB62A
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 16:39:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DACD173D;
	Thu, 17 Jun 2021 16:38:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DACD173D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623940784;
	bh=uJEv3OvJMqswalWvG2rx1DCmioR+VtUOrO7CZGR2Ajw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rRH7FoCINE085/zGrFQDG/dUu9BgHpzQdN29xSoP2XFHhH0rNJ9VoVmy8IkZm/oAh
	 DwMRbPJjgyIW8dSrIdN3X62Fn7t3yN7XYlQ7/yCIH0gCZqA1QFWZX4UVgHvlwDmRjr
	 /PUCyRy8pq/xRv29cKwL8pZiLxeJscWU+94oVb0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6E92F80515;
	Thu, 17 Jun 2021 16:34:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A416F80423; Wed, 16 Jun 2021 12:34:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4D2BF80165
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 12:34:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4D2BF80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A6wsFevR"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 998E661107;
 Wed, 16 Jun 2021 10:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623839691;
 bh=uJEv3OvJMqswalWvG2rx1DCmioR+VtUOrO7CZGR2Ajw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A6wsFevRhS9CeafwlT529v2rV3Gm9GGwn4GGkmYDghQBgvSltNdLhA2d1VwUgm9YV
 V+BZ/Z7dkVuRC9jA+aF8uUIN4oppwPSoc0YE3UC/NPxsGiCugwhXT7XZEbbeh2pmB/
 M4rdDOJ4s0X9LmiRn4axjJlxF+T4B+Wd1HYLAz0MgEG64RvZ+ZZaXxAxnqcCDwPJej
 pW3zx7fe6lsVprl/vQScwg/OlH7/cEN61iAlussljsV2mRmi/pOkb0n3FbRiUdCHAK
 H6X3SZGPBKP1nePHfXCLHq/6yaW3vQZyt5NRvZBipljaN3xhgyRVkvGP83STRQZ1Xh
 jhhQBOeaewbeQ==
Date: Wed, 16 Jun 2021 16:04:47 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop redundant minItems/maxItems
Message-ID: <YMnTx4GqTWu75o2n@vkoul-mobl>
References: <20210615191543.1043414-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615191543.1043414-1-robh@kernel.org>
X-Mailman-Approved-At: Thu, 17 Jun 2021 16:34:46 +0200
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-remoteproc@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-ide@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, linux-clk@vger.kernel.org,
 linux-rtc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Marc Zyngier <maz@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, David Airlie <airlied@linux.ie>,
 linux-serial@vger.kernel.org,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Wolfgang Grandegger <wg@grandegger.com>, linux-media@vger.kernel.org,
 Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 Alessandro Zummo <a.zummo@towertech.it>, Guenter Roeck <linux@roeck-us.net>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-crypto@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dmaengine@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
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

On 15-06-21, 13:15, Rob Herring wrote:
> If a property has an 'items' list, then a 'minItems' or 'maxItems' with the
> same size as the list is redundant and can be dropped. Note that is DT
> schema specific behavior and not standard json-schema behavior. The tooling
> will fixup the final schema adding any unspecified minItems/maxItems.
> 
> This condition is partially checked with the meta-schema already, but
> only if both 'minItems' and 'maxItems' are equal to the 'items' length.
> An improved meta-schema is pending.

>  .../devicetree/bindings/dma/renesas,rcar-dmac.yaml          | 1 -

>  Documentation/devicetree/bindings/phy/brcm,sata-phy.yaml    | 1 -
>  Documentation/devicetree/bindings/phy/mediatek,tphy.yaml    | 2 --
>  .../devicetree/bindings/phy/phy-cadence-sierra.yaml         | 2 --
>  .../devicetree/bindings/phy/phy-cadence-torrent.yaml        | 4 ----
>  .../devicetree/bindings/phy/qcom,ipq806x-usb-phy-hs.yaml    | 1 -
>  .../devicetree/bindings/phy/qcom,ipq806x-usb-phy-ss.yaml    | 1 -
>  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml     | 1 -
>  Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml   | 2 --
>  Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 2 --
>  Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml | 1 -

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
