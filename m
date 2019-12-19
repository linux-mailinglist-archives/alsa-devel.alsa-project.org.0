Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23431126E02
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 20:31:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DB3F1654;
	Thu, 19 Dec 2019 20:31:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DB3F1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576783914;
	bh=I7scDzmNTjfDRXkno6pxDJjaOGffpdBUlHj3isElx+I=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sSbGMGnrg1XO3v5A0FtzDz09BZdR2qO69ejCYHEl0PmQKKEQXLl++P54e+aHAxjMn
	 KWeGMO6x2rpnZfWm8kvsQpKU6Ekkmg+vzLehakSOtAvj5z9E7mVqIZszTJeWAMnAV1
	 tIzj8+wPaKOTeAbns9SmMF6gZwkSpQ/WN4a1wm/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E81CAF80234;
	Thu, 19 Dec 2019 20:30:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB5F4F80234; Thu, 19 Dec 2019 20:30:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F456F8014F
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 20:29:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F456F8014F
Received: by mail-oi1-f195.google.com with SMTP id p67so3525150oib.13
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 11:29:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=vnzka5eyFy5ceQuyg54/QRnQ90UxN2zZIMq8E1pcJo0=;
 b=ZVmxHcxIXR2X4V3QhTh8e318oLpxGbMYFamZuveiAGjZmoHD7oT4tPHNCsY09MVHAM
 LNoAXMBI+Cd5Xynj90vCFS2D+R3mnXJ9MERmJaxcZsnD/ZGF0OR7A6bJjAaVaHULaTjd
 +WxsizYNBbCnpxbm9NjSvXOAS3I36JWQtx7o2yz0jzLErY0OHX6kZt6OpxMDDF2AcRCK
 sElxaORoWqv0JUAy0w4r5kHG3QrV6Yi65eyKSS4k+4z0aquiP3c+LydIr9McTbrDvIhn
 yqE132qPPDzDopmcH1gdjShdlY7urFlJZYItnAwG/vn19DvU1a7JLPqWZ2BkCSK/NtpS
 H2jw==
X-Gm-Message-State: APjAAAWKeolywbvkHDlZA4bcuBqqIraFhJMaBz4OFoTu+PXKjKdp2uA6
 IRdHvWgT2yylehU/0RpW/g==
X-Google-Smtp-Source: APXvYqzGB1dq3QFQQuopJr0nkGg3fQuhs75mFQX+UmuYGN/xO10MkUzd9zWMp9VAR4XkUl156D1UCw==
X-Received: by 2002:a05:6808:3c5:: with SMTP id
 o5mr3132907oie.142.1576783795658; 
 Thu, 19 Dec 2019 11:29:55 -0800 (PST)
Received: from localhost ([2607:fb90:20de:fb54:3549:d84c:9720:edb4])
 by smtp.gmail.com with ESMTPSA id m2sm2285209oim.13.2019.12.19.11.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 11:29:55 -0800 (PST)
Date: Thu, 19 Dec 2019 13:29:51 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Mack <daniel@zonque.org>
Message-ID: <20191219192908.GA22461@bogus>
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-2-daniel@zonque.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209183511.3576038-2-daniel@zonque.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, lars@metafoo.de,
 sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, broonie@kernel.org, linux-i2c@vger.kernel.org,
 pascal.huerst@gmail.com, lee.jones@linaro.org, linux-clk@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 01/10] dt-bindings: mfd: Add documentation
	for ad242x
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Dec 09, 2019 at 07:35:01PM +0100, Daniel Mack wrote:
> This patch adds documentation on the top-level MFD support for AD242x
> devices. The bindings implemented by drivers for sub-devices of the
> MFD are documented in other files in their respective subsystems.
> =

> The example in this file is referred to by other documents.
> =

> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  .../bindings/mfd/adi,ad242x-bus.yaml          |  29 +++
>  .../bindings/mfd/adi,ad242x-master.yaml       | 235 ++++++++++++++++++
>  .../bindings/mfd/adi,ad242x-slave.yaml        | 108 ++++++++
>  3 files changed, 372 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/adi,ad242x-bus.=
yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/adi,ad242x-mast=
er.yaml
>  create mode 100644 Documentation/devicetree/bindings/mfd/adi,ad242x-slav=
e.yaml
> =

> diff --git a/Documentation/devicetree/bindings/mfd/adi,ad242x-bus.yaml b/=
Documentation/devicetree/bindings/mfd/adi,ad242x-bus.yaml
> new file mode 100644
> index 000000000000..89ca8d009bb9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/adi,ad242x-bus.yaml
> @@ -0,0 +1,29 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/mfd/adi,ad242x-bus.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Analog Devices AD242x A=B2B bus node
> +
> +maintainers:
> +  - Daniel Mack <daniel@zonque.org>
> +
> +description: |
> +  AD242x slave nodes represent the secondary I=B2C address a master node
> +  transceiver exposes on the bus.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ad2428w-bus

Where is this in the example?

Is A2B a standard thing? If so, then shouldn't some of this be split =

into a A2B binding and then AD242x specific binding?

> +
> +  reg:
> +    maxItems: 1
> +    description: |
> +      The secondary I=B2C address of the master node
> +      (called 'BUS' in the datasheet)
> +
> +required:
> +  - compatible
> +  - reg
> diff --git a/Documentation/devicetree/bindings/mfd/adi,ad242x-master.yaml=
 b/Documentation/devicetree/bindings/mfd/adi,ad242x-master.yaml
> new file mode 100644
> index 000000000000..649510575a79
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/adi,ad242x-master.yaml
> @@ -0,0 +1,235 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/mfd/adi,ad242x-master.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Analog Devices AD242x A=B2B master node transceiver
> +
> +maintainers:
> +  - Daniel Mack <daniel@zonque.org>
> +
> +description: |
> +  AD242x devices are A=B2B (Automotive Audio Bus) transceivers that are =
connected
> +  to each other in a daisy-chain. The payload transported on that bus in=
cludes
> +  multi-channel audio, I=B2C, GPIOs and others.
> +
> +  The datasheet is located here:
> +
> +    https://www.analog.com/media/en/technical-documentation/user-guides/=
AD242x_TRM_Rev1.1.pdf
> +
> +  The primary node in the chain is called the master node, and the nodes=
 in the
> +  chain are called slave nodes. A master can address up to 15 slave node=
s. The
> +  master node exposes two I=B2C addresses, one for accessing the registe=
rs on the
> +  node itself, and one for registers on one of the slave nodes.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ad2428w-master
> +
> +  reg:
> +    maxItems: 1
> +    description: |
> +      The primary I=B2C address of the master node
> +      (called 'BASE' in the datasheet)
> +
> +  clocks:
> +    minItems: 1
> +
> +  clock-names:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    const: sync
> +
> +  clock-frequency:
> +    $ref: '/schemas/types.yaml#/definitions/uint32'
> +    enum: [44100, 48000]
> +    description: |
> +      Specifies the clock frequency in Hz to configure on the given sync=
 clock.
> +      If not specified, the clock is expected to already be configured t=
o either
> +      44100 or 48000 Hz.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  adi,a2b-bus:
> +    $ref: '/schemas/types.yaml#/definitions/phandle'
> +    description: Specifies the bus handle node
> +
> +  adi,upstream-slot-size:
> +    description: The size for upstream slots
> +    allOf:
> +      - $ref: '/schemas/types.yaml#/definitions/uint32'
> +      - enum: [8, 12, 16, 20, 24, 28, 32]
> +
> +  adi,downstream-slot-size:
> +    description: The size for downstream slots
> +    allOf:
> +      - $ref: '/schemas/types.yaml#/definitions/uint32'
> +      - enum: [8, 12, 16, 20, 24, 28, 32]
> +
> +  adi,tdm-mode:
> +    description: The TDM mode to use
> +    allOf:
> +      - $ref: '/schemas/types.yaml#/definitions/uint32'
> +      - enum: [2, 4, 8, 12, 16, 20, 24, 32]
> +
> +  adi,tdm-slot-size:
> +    description: The TDM slot size to use
> +    allOf:
> +      - $ref: '/schemas/types.yaml#/definitions/uint32'
> +      - enum: [16, 32]
> +
> +  adi,alternate-upstream-slot-format:
> +    description: Selects the alternate format for upstream slots
> +    type: boolean
> +
> +  adi,alternate-downstream-slot-format:
> +    description: Selects the alternate format for downstream slots
> +    type: boolean
> +
> +  adi,invert-xcvr-b:
> +    description: Inverts the LVDS XCVR B data line
> +    type: boolean
> +
> +  adi,alternating-sync:
> +    description: Drives the SYNC pin for I=B2S operation
> +    type: boolean
> +
> +  adi,invert-sync:
> +    description: Invert the SYNC pin
> +    type: boolean
> +
> +  adi,early-sync:
> +    description: |
> +      Make the SYNC pin change one cycle before the first slot is transm=
itted
> +    type: boolean
> +
> +  adi,spread-a2b-clock:
> +    description: Enables spread spectrum mode for A=B2B bus clocks
> +    type: boolean
> +
> +  adi,spread-a2b-i2s-clock:
> +    description: Enables spread spectrum mode for both A=B2B and I=B2S c=
locks
> +    type: boolean
> +
> +  adi,spread-spectrum-high:
> +    description: Selects high spectrum spreading mode
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - adi,a2b-bus
> +  - adi,upstream-slot-size
> +  - adi,downstream-slot-size
> +  - adi,tdm-mode
> +  - adi,tdm-slot-size
> +
> +examples:
> +  - |
> +    sync_clock: clock {
> +      compatible =3D "fixed-clock";
> +      #clock-cells =3D <0>;
> +      clock-frequency  =3D <48000>;
> +    };
> +
> +    i2c-bus {
> +      ad2428w-master@68 {
> +        reg =3D <0x68>;
> +        compatible =3D "adi,ad2428w-master";
> +        adi,a2b-bus =3D <&a2b_bus>;
> +        clocks =3D <&sync_clock>;
> +        clock-names =3D "sync";
> +
> +        adi,upstream-slot-size =3D <24>;
> +        adi,downstream-slot-size =3D <24>;
> +        adi,tdm-mode =3D <2>;
> +        adi,tdm-slot-size =3D <32>;
> +        adi,alternating-sync;
> +        adi,early-sync;
> +
> +        codec {
> +          compatible =3D "adi,ad2428w-codec";
> +          #sound-dai-cells =3D <1>;
> +        };
> +
> +        clock {
> +          compatible =3D "adi,ad2428w-clk";
> +          #clock-cells =3D <1>;
> +          clock-output-names =3D "master-clk1", "master-clk2";
> +        };
> +
> +        nodes {
> +          #address-cells =3D <1>;
> +          #size-cells =3D <0>;
> +
> +          node@0 {
> +            compatible =3D "adi,ad2428w-slave";
> +            reg =3D <0>;
> +
> +            adi,alternating-sync;
> +            adi,early-sync;
> +            adi,invert-sync;
> +            adi,tdm-mode =3D <8>;
> +            adi,tdm-slot-size =3D <32>;
> +
> +            downstream {
> +              rx-slots =3D <2 3 6 7 8 9>;
> +              #tx-slots =3D <4>;
> +              #forward-slots =3D <6>;
> +            };
> +
> +            upstream {
> +              rx-slots =3D <0 1 6 7 8 9>;
> +              #tx-slots =3D <4>;
> +              #forward-slots =3D <6>;
> +            };
> +
> +            a2bgpio: gpio {
> +              compatible =3D "adi,ad2428w-gpio";
> +              gpio-controller;
> +              #gpio-cells =3D <2>;
> +
> +              gpio-over-distance {
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +                pin@0 {
> +                  reg =3D <0>;
> +                  adi,virtual-port-mask =3D <0x01>;
> +                };
> +              };
> +            };
> +
> +            i2c {
> +              compatible =3D "adi,ad2428w-i2c";
> +              clock-frequency =3D <400000>;
> +              #address-cells =3D <1>;
> +              #size-cells =3D <0>;
> +
> +              // I=B2C client devices located on the remote side
> +              eeprom-top@52 {
> +                reg =3D <0x52>;
> +                compatible =3D "atmel,24c02";
> +                read-only;
> +              };
> +            };
> +
> +            a2bclk: clock {
> +              compatible =3D "adi,ad2428w-clk";
> +              #clock-cells =3D <1>;
> +              clock-output-names =3D "node0-clk1", "node0-clk2";
> +            };
> +
> +            codec {
> +              compatible =3D "adi,ad2428w-codec";
> +              #sound-dai-cells =3D <1>;
> +              adi,pdm-highpass-filter;
> +            };
> +          };
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/mfd/adi,ad242x-slave.yaml =
b/Documentation/devicetree/bindings/mfd/adi,ad242x-slave.yaml
> new file mode 100644
> index 000000000000..3bea04dff267
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/adi,ad242x-slave.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/mfd/adi,ad242x-slave.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Analog Devices AD242x A=B2B slave node transceiver
> +
> +maintainers:
> +  - Daniel Mack <daniel@zonque.org>
> +
> +description: |
> +  AD242x slave nodes are connected to the master node through a daisy-ch=
ain.
> +  Modules of this type must be listed under the 'nodes' property of the =
master
> +  DT schema.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ad2428w-slave
> +
> +  adi,tdm-mode:
> +    description: The TDM mode to use
> +    allOf:
> +      - $ref: '/schemas/types.yaml#/definitions/uint32'
> +      - enum: [2, 4, 8, 12, 16, 20, 24, 32]
> +
> +  adi,tdm-slot-size:
> +    description: The TDM slot size to use
> +    allOf:
> +      - $ref: '/schemas/types.yaml#/definitions/uint32'
> +      - enum: [16, 32]
> +
> +  adi,alternating-sync:
> +    description: Drives the SYNC pin for I=B2S operation
> +    type: boolean
> +
> +  adi,invert-sync:
> +    description: Invert the SYNC pin
> +    type: boolean
> +
> +  adi,early-sync:
> +    description: |
> +      Make the SYNC pin change one cycle before the first slot is transm=
itted
> +    type: boolean
> +
> +  adi,spread-a2b-clock:
> +    description: Enables spread spectrum mode for A=B2B bus clocks
> +    type: boolean
> +
> +  adi,spread-a2b-i2s-clock:
> +    description: Enables spread spectrum mode for both A=B2B and I=B2S c=
locks
> +    type: boolean
> +
> +  adi,spread-spectrum-high:
> +    description: Selects high spectrum spreading mode
> +    type: boolean
> +
> +  upstream:
> +    type: object
> +    properties:
> +      rx-slots:
> +        $ref: '/schemas/types.yaml#/definitions/uint32'
> +        description: |
> +          A bitmask that describes the slots that are received by the
> +          transceiver from the upstream (A) side and put into its TX out=
put
> +          framebuffers. If not specified, an empty bitmask is assumed.
> +
> +      '#tx-slots':
> +        $ref: '/schemas/types.yaml#/definitions/uint32'
> +        description: |
> +          The number of slots this transceiver contributes to the upstre=
am
> +          traffic from its RX input frame buffer
> +
> +      '#forward-slots':
> +        $ref: '/schemas/types.yaml#/definitions/uint32'
> +        description: |
> +          The number of slots this transceiver forwards from the upstrea=
m side
> +          to the downstream side.
> +
> +  downstream:
> +    type: object
> +    properties:
> +      rx-slots:
> +        $ref: '/schemas/types.yaml#/definitions/uint32'
> +        description: |
> +          A bitmask that describes the slots that are received by the
> +          transceiver from the downstream (B) side and put into its TX o=
utput
> +          framebuffers. If not specified, an empty bitmask is assumed.
> +
> +      '#tx-slots':
> +        $ref: '/schemas/types.yaml#/definitions/uint32'
> +        description: |
> +          The number of slots this transceiver contributes to the downst=
ream
> +          traffic from its RX input frame buffer
> +
> +      '#forward-slots':
> +        $ref: '/schemas/types.yaml#/definitions/uint32'
> +        description: |
> +          The number of slots this transceiver forwards from the downstr=
eam side
> +          to the upstream side.
> +
> +required:
> +  - compatible
> +  - adi,tdm-mode
> +  - adi,tdm-slot-size
> +  - upstream
> +  - downstream
> -- =

> 2.23.0
> =

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
