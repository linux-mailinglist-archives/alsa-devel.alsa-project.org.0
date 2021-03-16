Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B8F3401C4
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 10:18:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54E7316CE;
	Thu, 18 Mar 2021 10:17:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54E7316CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616059112;
	bh=N9m4/yEcpQ24l1JGHg3e1anGMncSHXuQh8Fr2qXPZ4Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k64qcs0WKzf0FNGU3WtpfYEYkk9Wx8bY4rUhBjvnlNc/3/BmonvSrf7w4+uqdcZe0
	 4lYn2ZC0NrT6OTtvywb9kOXEfGJdWjZPfgPU65cF+yOfguVNHD5JmrTKUxD8o+/yqG
	 7hafCfKq32pKuUYa+g8R0d1IGLqTVi1QQLiAEWIs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5EFDF802E3;
	Thu, 18 Mar 2021 10:16:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B662F80148; Tue, 16 Mar 2021 21:24:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D12E4F80148
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 21:23:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D12E4F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="BvH44Pf9"
Received: by mail-qk1-x72b.google.com with SMTP id n79so36693227qke.3
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 13:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=arCkDDywA9FeKUOpIhe6JHln/l1VSIQXxqyZA+nk/iU=;
 b=BvH44Pf9lCF5vFRkfQX5yGdlaI8YBDtfQtH+oik0jRpFp1Xvs74iTtbkQ+N3Cep4ve
 6bN6xad1emcYWV4Dq+v+O7AX45leAkC+MT1vDe3nyrKZN0LXe7Qn1Zd/OldHj6jf87oy
 zpojZhnhH/QuAPJdkHuSz00E/yJfrDaV472ld1n98PQxMsYTbXaZ86FRSkienG9bn46z
 mXkxiHDfsl2zmKORUXRCuCGb7t4vLQqrkAxUOdaJKFmWz1UpPsC4ybtvjDMfhAQWDE+n
 oR8jHzkU12cUl00vEnRwMwHgvuKf29j4TcJ4ylYLNvwrrH4Sgo08vH2Fd00jEFIBeOHd
 yEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=arCkDDywA9FeKUOpIhe6JHln/l1VSIQXxqyZA+nk/iU=;
 b=KRxOkVtCfO/6DraNisriJMcfl7wnQh+JEvGpyqaZGx3WG9KwuKaPal32Z02mNA61fW
 UUmYgJqtCLJLHb5fVFkd/6Gs8aieA8jZMsphkNkD44z4Vv/3f+fr2uqaJiIMbBNJs0zc
 RqBe3YNWOIUHgbj3tHcSr3ZZ+otjCK105hXoxS+tgm33Hc0oTcet9tG1Jli8c4eTTuIg
 d6ARcdsWYU0OHCrROiBtOCnLP7OoM1a+MDL6qz2kKP42PV321zrzSo99lxMItknwkZ4s
 xd7c/NIrQNENG306hohObNOf2dJFqWwSrbxDNKujO8ObJHnilVwW9olhDvJSygcoUqVw
 f4Ww==
X-Gm-Message-State: AOAM532IBnL+vNLMlBGDhFZyBzmB5D+S7cw6eVxLBRhDsSdLzr8MeKwQ
 obhcDxwdU9egh9oTVSI+0BqAOxC+PI1eT/KWn0gH7w==
X-Google-Smtp-Source: ABdhPJxbYTa2/crB/yJv7oUF3BXq7Oe2jWTalZ7eOLLNb1YtuOaiCo40UQaYbJDBSqumTDJo/llAhw8klxAYM84cOwY=
X-Received: by 2002:a37:b6c4:: with SMTP id g187mr946148qkf.162.1615926236634; 
 Tue, 16 Mar 2021 13:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210316194858.3527845-1-robh@kernel.org>
In-Reply-To: <20210316194858.3527845-1-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Mar 2021 23:23:45 +0300
Message-ID: <CAA8EJppX+o6pEYB4qVncWiz9sTDyQ7DyNqGLW--sgNb-WSP7iw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop type references on common properties
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 18 Mar 2021 10:16:09 +0100
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-remoteproc@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Suman Anna <s-anna@ti.com>, Cheng-Yi Chiang <cychiang@chromium.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Odelu Kukatla <okukatla@codeaurora.org>,
 linux-pm@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-can@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Benson Leung <bleung@chromium.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, Stefan Wahren <wahrenst@gmx.net>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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

On Tue, 16 Mar 2021 at 22:49, Rob Herring <robh@kernel.org> wrote:
>
> Users of common properties shouldn't have a type definition as the
> common schemas already have one. Drop all the unnecessary type
> references in the tree.
>
> A meta-schema update to catch these is pending.
>
> Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Ohad Ben-Cohen <ohad@wizery.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Cheng-Yi Chiang <cychiang@chromium.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Stefan Wahren <wahrenst@gmx.net>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Odelu Kukatla <okukatla@codeaurora.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Suman Anna <s-anna@ti.com>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-can@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml       | 5 +----
>  Documentation/devicetree/bindings/arm/cpus.yaml              | 2 --
>  .../bindings/display/allwinner,sun4i-a10-tcon.yaml           | 1 -
>  .../devicetree/bindings/gpio/socionext,uniphier-gpio.yaml    | 3 +--
>  .../devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml      | 1 -
>  .../devicetree/bindings/interconnect/qcom,rpmh.yaml          | 1 -
>  .../bindings/memory-controllers/nvidia,tegra210-emc.yaml     | 2 +-
>  Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml   | 1 -
>  Documentation/devicetree/bindings/net/qcom,ipa.yaml          | 1 -
>  Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml  | 2 --
>  .../devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml   | 2 +-
>  Documentation/devicetree/bindings/sound/ak4642.yaml          | 2 --
>  .../devicetree/bindings/sound/google,cros-ec-codec.yaml      | 2 +-
>  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml    | 1 -
>  .../devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml       | 1 -
>  Documentation/devicetree/bindings/usb/usb.yaml               | 1 -
>  16 files changed, 5 insertions(+), 23 deletions(-)

For the qcom-spmi-adc-tm5.yaml:
Acked-by: Dmity Baryshkov <dmitry.baryshkov@linaro.org>

>
> diff --git a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> index a2c63c8b1d10..c6144c8421fa 100644
> --- a/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> +++ b/Documentation/devicetree/bindings/arm/bcm/raspberrypi,bcm2835-firmware.yaml
> @@ -26,10 +26,7 @@ properties:
>        - const: simple-mfd
>
>    mboxes:
> -    $ref: '/schemas/types.yaml#/definitions/phandle'
> -    description: |
> -      Phandle to the firmware device's Mailbox.
> -      (See: ../mailbox/mailbox.txt for more information)
> +    maxItems: 1
>
>    clocks:
>      type: object
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index 26b886b20b27..6be4a8852ee5 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -256,13 +256,11 @@ properties:
>        where voltage is in V, frequency is in MHz.
>
>    power-domains:
> -    $ref: '/schemas/types.yaml#/definitions/phandle-array'
>      description:
>        List of phandles and PM domain specifiers, as defined by bindings of the
>        PM domain provider (see also ../power_domain.txt).
>
>    power-domain-names:
> -    $ref: '/schemas/types.yaml#/definitions/string-array'
>      description:
>        A list of power domain name strings sorted in the same order as the
>        power-domains property.
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> index c13faf3e6581..3a7d5d731712 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
> @@ -73,7 +73,6 @@ properties:
>    clock-output-names:
>      description:
>        Name of the LCD pixel clock created.
> -    $ref: /schemas/types.yaml#/definitions/string-array
>      maxItems: 1
>
>    dmas:
> diff --git a/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml b/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
> index 1a54db04f29d..bcafa494ed7a 100644
> --- a/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/socionext,uniphier-gpio.yaml
> @@ -43,8 +43,7 @@ properties:
>
>    gpio-ranges: true
>
> -  gpio-ranges-group-names:
> -    $ref: /schemas/types.yaml#/definitions/string-array
> +  gpio-ranges-group-names: true
>
>    socionext,interrupt-ranges:
>      description: |
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> index 6f2398cdc82d..1e7894e524f9 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> @@ -102,7 +102,6 @@ patternProperties:
>
>        st,adc-channel-names:
>          description: List of single-ended channel names.
> -        $ref: /schemas/types.yaml#/definitions/string-array
>
>        st,filter-order:
>          description: |
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
> index 799e73cdb90b..13da7b29c707 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,rpmh.yaml
> @@ -82,7 +82,6 @@ properties:
>        this interconnect to send RPMh commands.
>
>    qcom,bcm-voter-names:
> -    $ref: /schemas/types.yaml#/definitions/string-array
>      description: |
>        Names for each of the qcom,bcm-voters specified.
>
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
> index 49ab09252e52..bc8477e7ab19 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.yaml
> @@ -34,7 +34,7 @@ properties:
>        - description: EMC general interrupt
>
>    memory-region:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
>      description:
>        phandle to a reserved memory region describing the table of EMC
>        frequencies trained by the firmware
> diff --git a/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml b/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml
> index fe6a949a2eab..55bff1586b6f 100644
> --- a/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml
> +++ b/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml
> @@ -57,7 +57,6 @@ properties:
>        - const: per
>
>    clock-frequency:
> -    $ref: /schemas/types.yaml#/definitions/uint32
>      description: |
>        The oscillator frequency driving the flexcan device, filled in by the
>        boot loader. This property should only be used the used operating system
> diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> index 8f86084bf12e..4e8dee4aa90d 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
> @@ -100,7 +100,6 @@ properties:
>        - description: Whether the IPA clock is enabled (if valid)
>
>    qcom,smem-state-names:
> -    $ref: /schemas/types.yaml#/definitions/string-array
>      description: The names of the state bits used for SMP2P output
>      items:
>        - const: ipa-clock-enabled-valid
> diff --git a/Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml b/Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml
> index d5d7f113bade..828e4a1ece41 100644
> --- a/Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/nvmem-consumer.yaml
> @@ -23,12 +23,10 @@ properties:
>        List of phandle to the nvmem data cells.
>
>    nvmem-names:
> -    $ref: /schemas/types.yaml#/definitions/string-array
>      description:
>        Names for the each nvmem provider.
>
>    nvmem-cell-names:
> -    $ref: /schemas/types.yaml#/definitions/string-array
>      description:
>        Names for each nvmem-cells specified.
>
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml
> index 1a1159097a2a..73400bc6e91d 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,omap-remoteproc.yaml
> @@ -93,7 +93,7 @@ properties:
>  # The following are the optional properties:
>
>    memory-region:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
>      description: |
>        phandle to the reserved memory node to be associated
>        with the remoteproc device. The reserved memory node
> diff --git a/Documentation/devicetree/bindings/sound/ak4642.yaml b/Documentation/devicetree/bindings/sound/ak4642.yaml
> index 6cd213be2266..1e2caa29790e 100644
> --- a/Documentation/devicetree/bindings/sound/ak4642.yaml
> +++ b/Documentation/devicetree/bindings/sound/ak4642.yaml
> @@ -29,11 +29,9 @@ properties:
>
>    clock-frequency:
>      description: common clock binding; frequency of MCKO
> -    $ref: /schemas/types.yaml#/definitions/uint32
>
>    clock-output-names:
>      description: common clock name
> -    $ref: /schemas/types.yaml#/definitions/string
>
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
> index acfb9db021dc..77adbebed824 100644
> --- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
> +++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.yaml
> @@ -32,7 +32,7 @@ properties:
>            The last one integer is the length of the shared memory.
>
>    memory-region:
> -    $ref: '/schemas/types.yaml#/definitions/phandle'
> +    maxItems: 1
>      description: |
>        Shared memory region to EC.  A "shared-dma-pool".
>        See ../reserved-memory/reserved-memory.txt for details.
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> index 2e1046513603..e494a0416748 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -78,7 +78,6 @@ properties:
>
>    clock-frequency:
>      description: for audio_clkout0/1/2/3
> -    $ref: /schemas/types.yaml#/definitions/uint32-array
>
>    clkout-lr-asynchronous:
>      description: audio_clkoutn is asynchronizes with lr-clock.
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
> index 95a728f4d333..3ea8c0c1f45f 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-spmi-adc-tm5.yaml
> @@ -59,7 +59,6 @@ patternProperties:
>
>      properties:
>        reg:
> -        $ref: /schemas/types.yaml#/definitions/uint32
>          description: Specify the sensor channel. There are 8 channels in PMIC5's ADC TM
>          minimum: 0
>          maximum: 7
> diff --git a/Documentation/devicetree/bindings/usb/usb.yaml b/Documentation/devicetree/bindings/usb/usb.yaml
> index 78491e66ed24..939f217b8c7b 100644
> --- a/Documentation/devicetree/bindings/usb/usb.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb.yaml
> @@ -16,7 +16,6 @@ properties:
>      pattern: "^usb(@.*)?"
>
>    phys:
> -    $ref: /schemas/types.yaml#/definitions/phandle-array
>      description:
>        List of all the USB PHYs on this HCD
>
> --
> 2.27.0
>


-- 
With best wishes
Dmitry
