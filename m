Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BE02854B2
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 00:42:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E37816E9;
	Wed,  7 Oct 2020 00:41:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E37816E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602024136;
	bh=k2MVIAxXZPezIdeWpDEOsQB07+uVbEakUyuQVsWPsCg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M8cWGHJ+MnXNyhPIEOHePC/pZYZpKCU3CChfh/yANWaOq0XzM1yVwc/HeSxvb3kWR
	 WoFOGGSDneW4ffMjTO+etW0XkMpWYFzryK4QTXBqER6l2T7duyAtvQeykrzYDupdAZ
	 WoQJW7xMrwjeSVSKUo/J+hiYcDoQPGdL1QBfCUNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48665F8012A;
	Wed,  7 Oct 2020 00:40:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8ABB8F8012A; Wed,  7 Oct 2020 00:40:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 481F8F80127
 for <alsa-devel@alsa-project.org>; Wed,  7 Oct 2020 00:40:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 481F8F80127
Received: by mail-ot1-f66.google.com with SMTP id s66so454613otb.2
 for <alsa-devel@alsa-project.org>; Tue, 06 Oct 2020 15:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OadiA/el+2vt6yJfwpShon4bZ4FHD8Ssx0XuXvhq3A0=;
 b=UC7e8tnTIhiaFFGMnRWVbytLD/TMoFl7JeLCE9ApJcRgcOYPFht5vqbTj+KbFbpcay
 V9SqrfMl0ncuaYfeAebl+0tzq3SxQsA6LrdcRTRyE9THxFZ/vfgjbPPEEnOb0ZQ4nWMH
 whBh8AFmIGlp594O4h+vOi3HF/z741oCk9eeJvK216QVoY583BliMvPkktUvXSFB70ox
 b+5BxH5LevZ03xgFJtvKjAFkPG8h11NCpDCKlgwHn4cwCEr1TenzUaeJn8PaoH37dQRN
 XfcOF7uf7JRee3VhAEr8z2xyg8foUtsiscvhIJbuiraNSevWnuuX5e7LP8u/XzFE+F/N
 /Umw==
X-Gm-Message-State: AOAM533bGqDFWVHFt16ej42xlZbuK76CdrGX5+NCTbDMzovSlwkf7h1c
 UICw+/4LKFmZpFTszk/QtA==
X-Google-Smtp-Source: ABdhPJwtnpeb6V8bOjRNwhtZ1T0muIYWEbwVo54wVwTVpTcW/JpgqRRvbRZ3Lrx5XSrZFpAaM8JrdQ==
X-Received: by 2002:a9d:27a1:: with SMTP id c30mr115324otb.214.1602024023600; 
 Tue, 06 Oct 2020 15:40:23 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e7sm199652oia.9.2020.10.06.15.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 15:40:23 -0700 (PDT)
Received: (nullmailer pid 2989602 invoked by uid 1000);
 Tue, 06 Oct 2020 22:40:22 -0000
Date: Tue, 6 Oct 2020 17:40:22 -0500
From: Rob Herring <robh@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: tas2764: Add the TAS2764 binding doc
Message-ID: <20201006224022.GA2986208@bogus>
References: <20201006172341.16423-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201006172341.16423-1-dmurphy@ti.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org
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

On Tue, Oct 06, 2020 at 12:23:40PM -0500, Dan Murphy wrote:
> Add the binding for the TAS2764 Smart Amplifier.
> 
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
>  .../devicetree/bindings/sound/tas2764.yaml    | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/tas2764.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/tas2764.yaml b/Documentation/devicetree/bindings/sound/tas2764.yaml
> new file mode 100644
> index 000000000000..d2c90c82b13f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/tas2764.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2020 Texas Instruments Incorporated
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/sound/tas2764.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Texas Instruments TAS2764 Smart PA
> +
> +maintainers:
> +  - Dan Murphy <dmurphy@ti.com>
> +
> +description: |
> +  The TAS2764 is a mono, digital input Class-D audio amplifier optimized for
> +  efficiently driving high peak power into small loudspeakers.
> +  Integrated speaker voltage and current sense provides for
> +  real time monitoring of loudspeaker behavior.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tas2764
> +
> +  reg:
> +    maxItems: 1
> +    description: |
> +       I2C address of the device can be between 0x38 to 0x45.
> +
> +  reset-gpios:
> +    description: GPIO used to reset the device.

maxItems: 1

> +
> +  shutdown-gpios:
> +    description: GPIO used to control the state of the device.

maxItems: 1

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
> +    description: TDM TX voltage sense time slot.
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
> +     codec: codec@38 {
> +       compatible = "ti,tas2764";
> +       reg = <0x38>;
> +       #sound-dai-cells = <1>;
> +       interrupt-parent = <&gpio1>;
> +       interrupts = <14>;
> +       reset-gpio = <&gpio1 15 0>;

This fails checks...

> +       shutdown-gpios = <&gpio1 15 0>;
> +       ti,imon-slot-no = <0>;
> +       ti,vmon-slot-no = <2>;
> +     };
> +   };
> +
> +...
> -- 
> 2.28.0.585.ge1cfff676549
> 
