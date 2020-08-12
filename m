Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE23D24310A
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Aug 2020 00:43:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39F341664;
	Thu, 13 Aug 2020 00:42:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39F341664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597272204;
	bh=+TgKkV6KqLhfjYAFIPeYwktp69RC4Ly6UgDwT/dBhDE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QUJXbznmWfH4N+Md4nHbhGu0AODSJVl8aNnOaMCsABRhPA5CxhjGTKybD0AJ+C7c6
	 cIfoFOi3AG1HYZWFnTEy+gi5s5Nkkw3l5RsN28gvhgsEzabaV5Or7Jb3xvXZEKL0Hu
	 o8TDjt46bF5POhQkpGEDWPxR8kPBWdPZPLID0GCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 705EFF801DB;
	Thu, 13 Aug 2020 00:41:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C28ECF8022B; Thu, 13 Aug 2020 00:41:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBFB6F800F4
 for <alsa-devel@alsa-project.org>; Thu, 13 Aug 2020 00:41:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBFB6F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BbGfi0lG"
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7477B20774
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 22:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597272092;
 bh=+TgKkV6KqLhfjYAFIPeYwktp69RC4Ly6UgDwT/dBhDE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BbGfi0lG5QCcZTN884K1SsY5f22mZrWcKc6andleE2eVn9J4s1FjOglMSu0+SqG3v
 +frY1T2SqpMd3XD/fVjzgYIYdMyKcSZNyNrFpW2gjYxwvnGx0Lx/+i6VDImXTzJebw
 DftdpKvxqxEh1Aq0dLD/uTX0EFfHI5KFKPGlsQmU=
Received: by mail-ot1-f54.google.com with SMTP id v6so3263882ota.13
 for <alsa-devel@alsa-project.org>; Wed, 12 Aug 2020 15:41:32 -0700 (PDT)
X-Gm-Message-State: AOAM532yLYdrxqPwoTobk3TEa4QOxHbYrAzjowOY5hnwlZ6YJZnDJrq5
 A6zIDXb+/3GLz2eIZCR94zE2H31OcNzLG2M3Tg==
X-Google-Smtp-Source: ABdhPJzHpRcjvIrip5SaXz0gOR2Dk5E1eheEnWizjmaZ+srfkuyaKcplDT6pTJKb9I9sGnPFKTkG9V8xTaEbGjKVycM=
X-Received: by 2002:a05:6830:1b79:: with SMTP id
 d25mr1655834ote.107.1597272091695; 
 Wed, 12 Aug 2020 15:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200812203618.2656699-1-robh@kernel.org>
 <20200812213453.GA690477@ravnborg.org>
In-Reply-To: <20200812213453.GA690477@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 12 Aug 2020 16:41:20 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJLoTojYv5gLB-iWACc-rkUU9t3v1XBZtdRz6A715Z3Uw@mail.gmail.com>
Message-ID: <CAL_JsqJLoTojYv5gLB-iWACc-rkUU9t3v1XBZtdRz6A715Z3Uw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Whitespace clean-ups in schema files
To: Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:REAL TIME CLOCK \(RTC\) SUBSYSTEM" <linux-rtc@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Linux Input <linux-input@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, "open list:THERMAL" <linux-pm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux HWMON List <linux-hwmon@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, Linux USB List <linux-usb@vger.kernel.org>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>
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

On Wed, Aug 12, 2020 at 3:34 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rob.
>
> On Wed, Aug 12, 2020 at 02:36:18PM -0600, Rob Herring wrote:
> > Clean-up incorrect indentation, extra spaces, long lines, and missing
> > EOF newline in schema files. Most of the clean-ups are for list
> > indentation which should always be 2 spaces more than the preceding
> > keyword.
> >
> > Found with yamllint (which I plan to integrate into the checks).
>
> I have browsed through the patch - and there was only a few things
> that jumped at me.
>
> With these points considered:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>
> I expect only some (few) of my points to actually results in any updates.
>
> I look forward to have the lint functionality as part of the built-in
> tools so we catch these things early.
>
>         Sam
>
> > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> > index f63895c8ce2d..88814a2a14a5 100644
> > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > @@ -273,8 +273,8 @@ properties:
> >                - fsl,imx6ull-14x14-evk     # i.MX6 UltraLiteLite 14x14 EVK Board
> >                - kontron,imx6ull-n6411-som # Kontron N6411 SOM
> >                - myir,imx6ull-mys-6ulx-eval # MYiR Tech iMX6ULL Evaluation Board
> > -              - toradex,colibri-imx6ull-eval            # Colibri iMX6ULL Module on Colibri Evaluation Board
> > -              - toradex,colibri-imx6ull-wifi-eval       # Colibri iMX6ULL Wi-Fi / Bluetooth Module on Colibri Evaluation Board
> > +              - toradex,colibri-imx6ull-eval      # Colibri iMX6ULL Module on Colibri Eval Board
> > +              - toradex,colibri-imx6ull-wifi-eval # Colibri iMX6ULL Wi-Fi / BT Module on Colibri Eval Board
> >            - const: fsl,imx6ull
>
> This change looks bad as it drops the alignment with the comments below.
> See following patch chunck:

Yes, but as a whole there's no alignment in this file. Even the rest
of the entries for the hunk below aren't aligned.

Perhaps this form would be better:

    # Colibri iMX6ULL Wi-Fi / BT Module on Colibri Eval Board
  - toradex,colibri-imx6ull-wifi-eval

But I really don't want to go fix this in the whole file...

> >        - description: Kontron N6411 S Board
> > @@ -312,9 +312,12 @@ properties:
> >                - toradex,colibri-imx7d                   # Colibri iMX7 Dual Module
> >                - toradex,colibri-imx7d-aster             # Colibri iMX7 Dual Module on Aster Carrier Board
> >                - toradex,colibri-imx7d-emmc              # Colibri iMX7 Dual 1GB (eMMC) Module
> > -              - toradex,colibri-imx7d-emmc-aster        # Colibri iMX7 Dual 1GB (eMMC) Module on Aster Carrier Board
> > -              - toradex,colibri-imx7d-emmc-eval-v3      # Colibri iMX7 Dual 1GB (eMMC) Module on Colibri Evaluation Board V3
> > -              - toradex,colibri-imx7d-eval-v3           # Colibri iMX7 Dual Module on Colibri Evaluation Board V3
> > +              - toradex,colibri-imx7d-emmc-aster        # Colibri iMX7 Dual 1GB (eMMC) Module on
> > +                                                        #  Aster Carrier Board
>
>
>
> > diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
> > index 177d48c5bd97..e89c1ea62ffa 100644
> > --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9322.yaml
> > @@ -25,8 +25,7 @@ properties:
> >    compatible:
> >      items:
> >        - enum:
> > -        - dlink,dir-685-panel
> > -
> > +          - dlink,dir-685-panel
> >        - const: ilitek,ili9322
> >
> >    reset-gpios: true
> > diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> > index a39332276bab..76a9068a85dd 100644
> > --- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> > @@ -13,8 +13,7 @@ properties:
> >    compatible:
> >      items:
> >        - enum:
> > -        - bananapi,lhr050h41
> > -
> > +          - bananapi,lhr050h41
> >        - const: ilitek,ili9881c
> >
>
> The extra lines is a simple way to indicate that here shall be added
> more in the future. So I like the empty line.

News to me. I thought 'enum' indicates that. My preference here is a
blank line just between DT properties.

> > diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> > index 32e0896c6bc1..47938e372987 100644
> > --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> > +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> > @@ -79,7 +79,8 @@ properties:
> >      description: |
> >        kHz; switching frequency.
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > -    enum: [ 600, 640, 685, 738, 800, 872, 960, 1066, 1200, 1371, 1600, 1920, 2400, 3200, 4800, 9600 ]
> > +    enum: [ 600, 640, 685, 738, 800, 872, 960, 1066, 1200, 1371, 1600, 1920,
> > +            2400, 3200, 4800, 9600 ]
> >
> >    qcom,ovp:
> >      description: |
>
> In the modern world we are living in now line length of 100 chars are
> OK. checkpatch and coding_style is updated to reflected this.

Yes, and it was 102. For yamllint I actually put it at 110 just to get
to a reasonable number that I wanted to fix and warning free. I think
I fixed all non comment cases to be less than 100 and comments to be
up to 110.

> > diff --git a/Documentation/devicetree/bindings/spi/mikrotik,rb4xx-spi.yaml b/Documentation/devicetree/bindings/spi/mikrotik,rb4xx-spi.yaml
> > index 4ddb42a4ae05..9102feae90a2 100644
> > --- a/Documentation/devicetree/bindings/spi/mikrotik,rb4xx-spi.yaml
> > +++ b/Documentation/devicetree/bindings/spi/mikrotik,rb4xx-spi.yaml
> > @@ -33,4 +33,5 @@ examples:
> >          reg = <0x1f000000 0x10>;
> >      };
> >
> > -...
> > \ No newline at end of file
> > +...
> > +
>
> Added one line too much?

Indeed.

>  diff --git a/Documentation/devicetree/bindings/spi/spi-mux.yaml b/Documentation/devicetree/bindings/spi/spi-mux.yaml
> > index 0ae692dc28b5..3d3fed63409b 100644
> > --- a/Documentation/devicetree/bindings/spi/spi-mux.yaml
> > +++ b/Documentation/devicetree/bindings/spi/spi-mux.yaml
> > @@ -43,47 +43,47 @@ properties:
> >      maxItems: 1
> >
> >  required:
> > -   - compatible
> > -   - reg
> > -   - spi-max-frequency
> > -   - mux-controls
> > +  - compatible
> > +  - reg
> > +  - spi-max-frequency
> > +  - mux-controls
> >
> >  examples:
> > -   - |
> > -     #include <dt-bindings/gpio/gpio.h>
> > -     mux: mux-controller {
> > -       compatible = "gpio-mux";
> > -       #mux-control-cells = <0>;
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    mux: mux-controller {
> > +        compatible = "gpio-mux";
> > +        #mux-control-cells = <0>;
> >
> > -       mux-gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;
> > -     };
> > +        mux-gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;
> > +    };
>
> Example is updated to use 4-space indent. I like.
>
> But many other examples are left untouched.

That was not the purpose here. The '- |' line was indented 1 too many.
IIRC, the parser is not happy if you only change that line, so at
least the 1st line of the example had to be updated anyways.

> So I wonder if updating all examples to the same indent should
> be left for another mega-patch?

I've said this before, but until example indentation is automatically
checked I'm not going to care.

> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index f3d847832fdc..2baee2c817c1 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -993,7 +993,8 @@ patternProperties:
> >    "^sst,.*":
> >      description: Silicon Storage Technology, Inc.
> >    "^sstar,.*":
> > -    description: Xiamen Xingchen(SigmaStar) Technology Co., Ltd. (formerly part of MStar Semiconductor, Inc.)
> > +    description: Xiamen Xingchen(SigmaStar) Technology Co., Ltd.
> > +      (formerly part of MStar Semiconductor, Inc.)
> >    "^st,.*":
> >      description: STMicroelectronics
> >    "^starry,.*":
>
> Did you check that they are all in alphabetical order?
> I would be suprised if this is the only issue in this file.

Nope, as that's not a WS or linter thing. Alphabetical order is about
the only thing I look at reviewing additions to this, but I'm sure
some errors have slipped in.

Thanks for taking a look.


Rob
