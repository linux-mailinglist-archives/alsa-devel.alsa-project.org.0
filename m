Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 456FE1F5C73
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jun 2020 22:09:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D57B1166C;
	Wed, 10 Jun 2020 22:08:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D57B1166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591819749;
	bh=AS09uQ5zG0psed2eOsF980Tp3NDWfM8ROSl6fOyce9M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DDaxNFc1vZONEp0zRLqdqV4wKSDMXryT3Uv2aSk+BZ6tx8QRjrcUyVPm5kvXUbThg
	 j1cYR5vyGiqlphCf0GjSzpTApjgMxCrF8iXWGoU1e9fz+/bEmiC1OUhCkebw6OYukt
	 /pilYKJEQjg3rax29oZy1pzl/yZipoGhjJwH/now=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9EDBF8021E;
	Wed, 10 Jun 2020 22:07:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B29BF8021C; Wed, 10 Jun 2020 22:07:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB30CF80058
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 22:07:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB30CF80058
Received: by mail-io1-f66.google.com with SMTP id q8so3753638iow.7
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 13:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mDjqIFf471IkbejX9X3mSLq57qUbwtdIynz5m3TbNPc=;
 b=NhkVTPZvWNS+LKBNtGFMzXuDEeSS3F24jwXmlEwvEGEkKktlO5aKkIUTG5LcGvgboT
 og2Bf9USQ0j1lv5iwFRtTl0GuSQWbgL9eyzEd83BAkCL4vNNu6VfFeOaKkk/qo3+dPmk
 eH4kL7sJqojx+QBxzPxtBJhM0osYw1/YX4bfdr+Re8zvOzSUYXH9B6cxbWUuIoCG6Xs+
 u0p4TmuNOmoDtmlKXLmBijL7BAlGJRSotOwV9QRWK9otbbevK9Zi3PXuYYdcoJEp8MER
 lqzndHudgscjIod0LZO9DXUnHI1Er9C7L8+B9Jh5eogE13xfM9Rnjz/7ogsCwG1jddjC
 5b8Q==
X-Gm-Message-State: AOAM531ZYe7hwgyXzParuVR1k1k8RWx8It7K6wcP1Vu7Wi9qwut1WLfl
 IGERIJc2ehK94LYhXZVvLw==
X-Google-Smtp-Source: ABdhPJx0DQIW00e65FugR8+MSaJ77U4Ds57FdAdVskpy7VWOQQOAAYy8VolmUsIiUifIEK8uD4BRrg==
X-Received: by 2002:a6b:7516:: with SMTP id l22mr5097843ioh.18.1591819636816; 
 Wed, 10 Jun 2020 13:07:16 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id y5sm491598iov.3.2020.06.10.13.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 13:07:16 -0700 (PDT)
Received: (nullmailer pid 3629265 invoked by uid 1000);
 Wed, 10 Jun 2020 20:07:15 -0000
Date: Wed, 10 Jun 2020 14:07:15 -0600
From: Rob Herring <robh@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH 2/2] dt-bindings: tas2562: Convert the tas2562 binding to
 yaml
Message-ID: <20200610200715.GA3612550@bogus>
References: <20200602193524.30309-1-dmurphy@ti.com>
 <20200602193524.30309-2-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602193524.30309-2-dmurphy@ti.com>
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

On Tue, Jun 02, 2020 at 02:35:24PM -0500, Dan Murphy wrote:
> Convert the TAS2562 text file to yaml format.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../devicetree/bindings/sound/tas2562.txt     | 34 ----------
>  .../devicetree/bindings/sound/tas2562.yaml    | 65 +++++++++++++++++++
>  2 files changed, 65 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/tas2562.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/tas2562.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/tas2562.txt b/Documentation/devicetree/bindings/sound/tas2562.txt
> deleted file mode 100644
> index 94796b547184..000000000000
> --- a/Documentation/devicetree/bindings/sound/tas2562.txt
> +++ /dev/null
> @@ -1,34 +0,0 @@
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
> -
> -Optional properties:
> -- interrupt-parent: phandle to the interrupt controller which provides
> -                    the interrupt.
> -- interrupts: (GPIO) interrupt to which the chip is connected.
> -- shut-down: GPIO used to control the state of the device.
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
> -	shut-down = <&gpio1 15 0>;
> -        ti,imon-slot-no = <0>;
> -};
> -
> diff --git a/Documentation/devicetree/bindings/sound/tas2562.yaml b/Documentation/devicetree/bindings/sound/tas2562.yaml
> new file mode 100644
> index 000000000000..11e0269d03b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/tas2562.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
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
> +       I2C addresss of the device can be one of these 0x4c, 0x4d, 0x4e or 0x4f
> +
> +  shut-down:

Hopefully, this is an error. It should be 'shut-down-gpios'.

Looking at the driver, it is also broken. It's passing 'shut-down-gpio' 
which means the GPIO core is looking for 'shut-down-gpio-gpio' or 
'shut-down-gpio-gpios'.

Also the standardish naming here is 'shutdown-gpios'. Given this 
probably never worked, we should use that.

> +    description: GPIO used to control the state of the device.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ti,imon-slot-no:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: TDM TX current sense time slot.
> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
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
> +
> +       shut-down = <&gpio1 15 0>;
> +       ti,imon-slot-no = <0>;
> +     };
> +   };
> +
> -- 
> 2.26.2
> 
