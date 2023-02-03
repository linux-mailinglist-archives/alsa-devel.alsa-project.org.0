Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB39168A517
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 22:58:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0BB471DA;
	Fri,  3 Feb 2023 22:57:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0BB471DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675461520;
	bh=Gthv3th2HC6/Abys8ip0oIUVpZguDpRyMtRq4+/leY0=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YPfrrdfiLSI2roDfCq+qmy+qR4HvJayWb6IQzSfyW00P5b4PSfhdEKOjnP644ljWc
	 2wskwfloaZGHinqFzeJAj/5u3VMSfvzNcUkSVuGddwhFZUk2SHirxG5Sivy/5ehNvU
	 ZyEuXLfRJXrJipEpAhkgWFQ0ym4oXsK9OuN1Ee2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B9E1F802E8;
	Fri,  3 Feb 2023 22:57:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCB18F80254; Fri,  3 Feb 2023 22:57:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95ED1F800E3
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 22:57:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95ED1F800E3
Received: by mail-oi1-f174.google.com with SMTP id bx13so5333694oib.13
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 13:57:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T2vc3qMIstkTWFHwtw+c6I2ctj9RY4rHLBiXXNGhXcw=;
 b=PiFmBTAmTNqgSeqxIEjQ8gCreHlJDG88Sy12iFizGdx0cbQI/m4CwpOzZibmFh9jTj
 VuceHGMqT/CpTt2aTAR9i1kAG58hJsjQUyR72sjPXv4T48wRcuKCJWfkbW206zZpf5oy
 Ha+ErUwss6z/tPhTi53NRNvlEZNopo7knXXkFC2kL4LOfHxQDtWqlI9zf8CfLXIRwWiw
 naU/8msdUrW70MgcLPZTb3wb7hiiEujDQkBTADYgcUskot69l0LLsCmAKTjT+2UJQBgn
 IwzgtMqr0HvY+WuZ1m0am6urhSxYhebP7nlQt5L8ohfDMP/n9Y9bLkQQ7wN3YyQW7wCW
 SZrA==
X-Gm-Message-State: AO0yUKUoiTDhXfOnpDqOvvmbxF09eKOdZcDh94BQSuRKH76HV1qCtnMM
 1vN90MiWL8HzuLGK1KXPTw==
X-Google-Smtp-Source: AK7set+wElBYaFN6oCAW8rVJ/iackvGmOusAIRbPlBnuY5f0Rhx+PfVdKYwxURSkvIKDntW3pUrA3w==
X-Received: by 2002:aca:3e57:0:b0:36b:fbdb:eb61 with SMTP id
 l84-20020aca3e57000000b0036bfbdbeb61mr4792106oia.23.1675461445527; 
 Fri, 03 Feb 2023 13:57:25 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 a26-20020a056808099a00b00378ce4197casm1276811oic.8.2023.02.03.13.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 13:57:25 -0800 (PST)
Received: (nullmailer pid 947483 invoked by uid 1000);
 Fri, 03 Feb 2023 21:57:24 -0000
Date: Fri, 3 Feb 2023 15:57:24 -0600
From: Rob Herring <robh@kernel.org>
To: Shenghao Ding <13916275206@139.com>
Subject: Re: [PATCH v5] ASoC: dt-bindings: Add tas2781 amplifier
Message-ID: <20230203215724.GA938713-robh@kernel.org>
References: <20230203040115.27321-1-13916275206@139.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203040115.27321-1-13916275206@139.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, shenghao-ding@ti.com, linux-kernel@vger.kernel.org,
 kevin-lu@ti.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Feb 03, 2023 at 12:01:15PM +0800, Shenghao Ding wrote:
> Create tas2781.yaml for tas2781 driver.
> 
> Signed-off-by: Shenghao Ding <13916275206@139.com>
> 
> ---
> Changes in v5:
>  - Drop the full stop in the Subject.
>  - Drop the reset-gpios reference to gpio.txt.
>  - Add Changelog.
>  Changes to be committed:
> 	new file:   Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> ---
>  .../devicetree/bindings/sound/ti,tas2781.yaml | 87 +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> new file mode 100644
> index 000000000000..8af44792a904
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2022 - 2023 Texas Instruments Incorporated
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments TAS2781 SmartAMP
> +
> +maintainers:
> +  - Shenghao Ding <shenghao-ding@ti.com>
> +  - Kevin Lu <kevin-lu@ti.com>
> +
> +description: |

Don't need '|' unless you need line endings preserved. Wrap lines at 80 
chars.

> +  The TAS2781 is a mono, digital input Class-D audio amplifier
> +  optimized for efficiently driving high peak power into small
> +  loudspeakers. Integrated an on-chip DSP supports Texas Instruments
> +  Smart Amp speaker protection algorithm. The integrated speaker
> +  voltage and current sense provides for real time
> +  monitoring of loudspeaker behavior.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tas2781
> +
> +  reg:
> +    maxItems: 1
> +    description: |
> +      I2C address of the device can be in range from 0x38 to 0x40.

Express as constraints instead:

items:
  minimum: 0x38
  maximum: 0x40

Or was this the range of the slot addresses?

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: |
> +      A GPIO line handling reset of the chip. As the line is active high,
> +      it should be marked GPIO_ACTIVE_HIGH.

The description doesn't add anything. Drop.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ti,audio-slots:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 4
> +    description: |
> +      I2c address of the device for different audio slots,

I2C

> +      useless in mono case.
> +
> +  ti,broadcast-addr:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Generic i2c address for all the tas2781 devices in

I2C

Be consistent.

> +      purpose of I2C broadcast during the multi-device
> +      writes, useless in mono case.
> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +   #include <dt-bindings/gpio/gpio.h>
> +   i2c {
> +     /* example with quad support, such as tablet or pad device */
> +     #address-cells = <1>;
> +     #size-cells = <0>;
> +     quad: codec@38 {
> +       compatible = "ti,tas2781";
> +       reg = <0x38>;
> +       #sound-dai-cells = <1>;
> +       reset-gpios = < &gpio1 10 GPIO_ACTIVE_HIGH >;
> +       interrupt-parent = <&gpio1>;
> +       interrupts = <15>;
> +       ti,audio-slots = < 0x38 /* topleft-channel */
> +                          0x39 /* topright-channel */
> +                          0x3a /* bottomleft-channel */
> +                          0x3b /* bottomright-channel */

Do these vary? Or the slot addresses are fixed and which slots are used 
varies? 

> +                        >;
> +       ti,broadcast-addr = <0x40>;

I tend to think the I2C addresses should all be in 'reg'.

> +     };
> +   };
> +...
> -- 
> 2.34.1
> 
> 
