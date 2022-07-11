Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB32A57095A
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 19:45:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 821AC15E0;
	Mon, 11 Jul 2022 19:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 821AC15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657561528;
	bh=p13HHm/lmaUJJ10kxNMnI2GOdNoznhMEp3F1k9XvHnI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pigoWQya4edvBU2hddrCZ0avfO341LxvH0UCfzVw9fd4NLpgW7JP094lp90QikZS7
	 THUAZnrVGZHrUTTIQqQgcyoveBNxNJ7Jdebv3oYyqgosKIAXuSfHdggYlJPtIj3lro
	 W0Pxbko3QNb93MS6btoU9g7FbitM+3OYvgh4Lw6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D217CF80256;
	Mon, 11 Jul 2022 19:44:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A10B0F80155; Mon, 11 Jul 2022 19:44:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC4E9F80152
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 19:44:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC4E9F80152
Received: by mail-il1-f177.google.com with SMTP id b12so3434146ilh.4
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 10:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KNctDcnzExLcYE9i6DAX6xgLoueFKgS1n8j2sVBGvhU=;
 b=JzAIj67t9+WfBLqG72HEc262a7w/NeI97YqwszSmznryau1Gscl2CzkXPKPtaB0iYD
 7StdEM41OosjBbmTEVEBVJfPNlA42E34l0S9geY0vkgoZ2i5oEBVcaAzokyJQZf1lbpI
 iX/TtQyMJKFHd9UzumRXFoCv19ZAXw8lCxDW9cFjWKGBnDVpU/6kKuJMP3RAgXrL4iWO
 W5mQ/PUt4/CDU9T20iC8bG46aw2kdOdLQgzo+Rih9F1hMEY2DdhVsuYRj6Ge5SOfd4ar
 zXwEmbMrrnFYgK6whh9dT3fm//ditRcOmEqqNgSMxxE7nQWJ/eWZ2xSX7ZP44DMpf3G1
 KvRw==
X-Gm-Message-State: AJIora+aw7MjJb+oJPoyptXIGI862Vk/zsNjeiqyzm41NTq+Tsu+Mauj
 43lzVUhi+TJaH0zw5hT8xA==
X-Google-Smtp-Source: AGRyM1thITf5/Q1fa6zvWTGNF0eMq/EkzA30Tpy+ofmJJY+0gVEqWyRNSnt48qmlVYwkjv/ozR17Hw==
X-Received: by 2002:a05:6e02:216c:b0:2dc:6a5b:7023 with SMTP id
 s12-20020a056e02216c00b002dc6a5b7023mr7081324ilv.0.1657561453662; 
 Mon, 11 Jul 2022 10:44:13 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a056638388800b0033f4a1114a6sm2384175jav.178.2022.07.11.10.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 10:44:13 -0700 (PDT)
Received: (nullmailer pid 4150525 invoked by uid 1000);
 Mon, 11 Jul 2022 17:44:12 -0000
Date: Mon, 11 Jul 2022 11:44:12 -0600
From: Rob Herring <robh@kernel.org>
To: Raphael-Xu <13691752556@139.com>
Subject: Re: [PATCH v4 2/2] add tas2780
Message-ID: <20220711174412.GA4135019-robh@kernel.org>
References: <20220707123343.2403-1-13691752556@139.com>
 <20220707123343.2403-2-13691752556@139.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707123343.2403-2-13691752556@139.com>
Cc: alsa-devel@alsa-project.org, navada@ti.com, shenghao-ding@ti.com,
 broonie@kernel.org, asyrus@ti.com, raphael-xu@ti.com
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

On Thu, Jul 07, 2022 at 08:33:43PM +0800, Raphael-Xu wrote:
> add tas2780.yaml

I see this is already in linux-next, and it has a warning:

Documentation/devicetree/bindings/sound/tas2780.example.dtb: codec@38: 'shutdown-gpios' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/sound/tas2780.yaml

Please send a fix for this and the comments below.

No checks ran and no review happened because the DT list was not Cc'ed. 
Please use get_maintainers.pl for where to send patches.

Also the subjects need some work. Use 'git log --oneline <path>' for a 
idea of what the subject should start with. I imagine Mark fixed it for 
you.

> 
> Signed-off-by: Raphael-Xu <13691752556@139.com>
> ---
>  .../devicetree/bindings/sound/tas2780.yaml    | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/tas2780.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/tas2780.yaml b/Documentation/devicetree/bindings/sound/tas2780.yaml
> new file mode 100644
> index 000000000000..5a0de0995066
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/tas2780.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2020-2022 Texas Instruments Incorporated
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/sound/tas2780.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Texas Instruments TAS2780 Smart PA
> +
> +maintainers:
> +  - Raphael Xu <raphael-xu@ti.com>
> +
> +description: |
> +  The TAS2780 is a mono, digital input Class-D audio amplifier optimized for
> +  efficiently driving high peak power into small loudspeakers.
> +  Integrated speaker voltage and current sense provides for
> +  real time monitoring of loudspeaker behavior.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tas2780
> +
> +  reg:
> +    maxItems: 1
> +    description: |
> +       I2C address of the device can be between 0x38 to 0x45.

Can be constraints instead:

items:
  - items:
      - minimum: 0x38
        maximum: 0x45

> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO used to reset the device.
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ti,imon-slot-no:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: TDM TX current sense time slot.

constraints? 0 - 2^32 is valid?

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
> +       compatible = "ti,tas2780";
> +       reg = <0x38>;
> +       #sound-dai-cells = <1>;
> +       interrupt-parent = <&gpio1>;
> +       interrupts = <14>;
> +       reset-gpios = <&gpio1 15 0>;
> +       shutdown-gpios = <&gpio1 15 0>;
> +       ti,imon-slot-no = <0>;
> +       ti,vmon-slot-no = <2>;
> +     };
> +   };
> +
> +...
> -- 
> 2.35.1
> 
> 
> 
