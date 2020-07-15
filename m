Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 915352215E9
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 22:17:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39E621661;
	Wed, 15 Jul 2020 22:16:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39E621661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594844238;
	bh=dGYf/tHQBWn4bdbRSiuDfLlvttK4hCaHiP3yARv6KX8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sDXe/CRfFxhrYd/zCFJGpqvcKQ6Xqy+0+xQbE12MY94MLXgdoYSrBKwZpR4YDmXr8
	 y4dBfVNUU3E4AryijzxT8hNcPaOdS58UgcL0kTluYG+wa8oHqH8IkSUHTFOXSMEdrL
	 G+vbcPv4l0otwGUsF/WZUJcrJZphPZJM5Z4L7Xgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70847F80227;
	Wed, 15 Jul 2020 22:15:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1745F8021D; Wed, 15 Jul 2020 22:15:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B484F800E8
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 22:15:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B484F800E8
Received: by mail-io1-f65.google.com with SMTP id k23so3616804iom.10
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 13:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jwmed9W8YV4otf8sjLnvkq/YvcQL2YKBO/oE4ZEh/lU=;
 b=RZLkbgua2Y0U6ZSKNd9EcdIeaM3PPpQi6WG4Y/O3TFaqf7MCvtyTgAxh0wcbNqDdar
 VaUFSpuNrHZy/N4mp1SBpi1D2VROP6Iph5H8aLmMmr2VRanobQ6nEuc+oPtjkYKvnSR2
 tpZrUN0ZXpQz7ZWLkPp0QWAsALhRMYFqf09i2F+N2+ZqXIkCVSPHQJUo3aHVQ6diGXhs
 t5kPuzTP9VcmasY07xL7CDI0HMvBbGVW08uIMxk7cZqijUDW0EuJJwCwGUMe9dNvhhAG
 aoONRf3ggwRCyD/PuR5cH1hbMVT45Ta+SZZ6u3pdc5HjTqsEu2ZlxNaDd/n5YmKYwDUa
 BEnQ==
X-Gm-Message-State: AOAM531foCGuFyIaGWeGwuFGpGprbWRi6KlQdnxk0a422YXT8wYJX6iT
 Ys+cqUTCIDEDJBpGCoL2Aw==
X-Google-Smtp-Source: ABdhPJwWGqj/kbCRlCfbWr0duC0h62VBfCvd92AK2M1tAhhTkctI7eNuwUUYbPaW8MF3aZEMlexccg==
X-Received: by 2002:a6b:1885:: with SMTP id 127mr1052907ioy.17.1594844124494; 
 Wed, 15 Jul 2020 13:15:24 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id a1sm1531119ilq.50.2020.07.15.13.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 13:15:23 -0700 (PDT)
Received: (nullmailer pid 746665 invoked by uid 1000);
 Wed, 15 Jul 2020 20:15:22 -0000
Date: Wed, 15 Jul 2020 14:15:22 -0600
From: Rob Herring <robh@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 4/4] dt-bindings: tas2562: Convert the tas2562 binding to
 yaml
Message-ID: <20200715201522.GA740682@bogus>
References: <20200626154143.20351-1-dmurphy@ti.com>
 <20200626154143.20351-4-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626154143.20351-4-dmurphy@ti.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 broonie@kernel.org
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

On Fri, Jun 26, 2020 at 10:41:43AM -0500, Dan Murphy wrote:
> Convert the TAS2562 text file to yaml format.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../devicetree/bindings/sound/tas2562.txt     | 37 ---------
>  .../devicetree/bindings/sound/tas2562.yaml    | 77 +++++++++++++++++++
>  2 files changed, 77 insertions(+), 37 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/tas2562.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/tas2562.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/tas2562.txt b/Documentation/devicetree/bindings/sound/tas2562.txt
> deleted file mode 100644
> index dc6d7362ded7..000000000000
> --- a/Documentation/devicetree/bindings/sound/tas2562.txt
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -Texas Instruments TAS2562 Smart PA
> -
> -The TAS2562 is a mono, digital input Class-D audio amplifier optimized for
> -efficiently driving high peak power into small loudspeakers.
> -Integrated speaker voltage and current sense provides for
> -real time monitoring of loudspeaker behavior.
> -
> -Required properties:
> - - #address-cells  - Should be <1>.
> - - #size-cells     - Should be <0>.
> - - compatible:	   - Should contain "ti,tas2562", "ti,tas2563".
> - - reg:		   - The i2c address. Should be 0x4c, 0x4d, 0x4e or 0x4f.
> - - ti,imon-slot-no:- TDM TX current sense time slot.
> - - ti,vmon-slot-no:- TDM TX voltage sense time slot. This slot must always be
> -		     greater then ti,imon-slot-no.
> -
> -Optional properties:
> -- interrupt-parent: phandle to the interrupt controller which provides
> -                    the interrupt.
> -- interrupts: (GPIO) interrupt to which the chip is connected.
> -- shut-down-gpio: GPIO used to control the state of the device.
> -
> -Examples:
> -tas2562@4c {
> -        #address-cells = <1>;
> -        #size-cells = <0>;
> -        compatible = "ti,tas2562";
> -        reg = <0x4c>;
> -
> -        interrupt-parent = <&gpio1>;
> -        interrupts = <14>;
> -
> -	shut-down-gpio = <&gpio1 15 0>;
> -        ti,imon-slot-no = <0>;
> -        ti,vmon-slot-no = <1>;
> -};
> -
> diff --git a/Documentation/devicetree/bindings/sound/tas2562.yaml b/Documentation/devicetree/bindings/sound/tas2562.yaml
> new file mode 100644
> index 000000000000..1fb467e14d4c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/tas2562.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)

Same licensing comment here as tas2770

> +# Copyright (C) 2019 Texas Instruments Incorporated
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/sound/tas2562.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Texas Instruments TAS2562 Smart PA
> +
> +maintainers:
> +  - Dan Murphy <dmurphy@ti.com>
> +
> +description: |
> +  The TAS2562 is a mono, digital input Class-D audio amplifier optimized for
> +  efficiently driving high peak power into small loudspeakers.
> +  Integrated speaker voltage and current sense provides for
> +  real time monitoring of loudspeaker behavior.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tas2562
> +      - ti,tas2563
> +
> +  reg:
> +    maxItems: 1
> +    description: |
> +       I2C address of the device can be one of these 0x4c, 0x4d, 0x4e or 0x4f
> +
> +  shut-down-gpio:
> +    description: GPIO used to control the state of the device.
> +    deprecated: true

Why do we need this as the driver never worked?

> +
> +  shutdown-gpio:
> +    description: GPIO used to control the state of the device.

-gpios is the preferred form: shutdown-gpios

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ti,imon-slot-no:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: TDM TX current sense time slot.
> +
> +  ti,vmon-slot-no:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      TDM TX voltage sense time slot.  This slot must always be greater then
> +      ti,imon-slot-no.
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
> +   i2c0 {
> +     #address-cells = <1>;
> +     #size-cells = <0>;
> +     codec: codec@4c {
> +       compatible = "ti,tas2562";
> +       reg = <0x4c>;
> +       #sound-dai-cells = <1>;
> +       interrupt-parent = <&gpio1>;
> +       interrupts = <14>;
> +       shutdown-gpio = <&gpio1 15 0>;
> +       ti,imon-slot-no = <0>;
> +       ti,vmon-slot-no = <2>;
> +     };
> +   };
> +
> +...
> -- 
> 2.26.2
> 
