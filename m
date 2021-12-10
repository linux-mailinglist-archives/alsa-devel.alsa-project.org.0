Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AC4470C83
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Dec 2021 22:25:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFC3D2160;
	Fri, 10 Dec 2021 22:25:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFC3D2160
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639171557;
	bh=TslYx+/MBS8nrn7jxd9L3CWlU6f67qqmX96xEJnIiGQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UYayO+fd7paxxxQkiChUmiOiq83HLnHKgkY0ewSLFIqoSiB4T7Zr9L5H1wN9Nrncl
	 O1hhhfGuBMUOeetoD0oPgyTysnP6+ppr+ey4rWZHlaL8EhvKFGMQCopVvHoUibiIe3
	 VOXRqFH+DGy2XDcoS/p1OsNGDhcsyPDDoM1rzvBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19EDBF804E6;
	Fri, 10 Dec 2021 22:24:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6088F804EC; Fri, 10 Dec 2021 22:24:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01079F8028D
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 22:24:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01079F8028D
Received: by mail-ot1-f48.google.com with SMTP id
 u18-20020a9d7212000000b00560cb1dc10bso10887595otj.11
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 13:24:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4ShH1E6Z2JK4xPJTdqZzslqHBgFJuNalRHDivGh6RDc=;
 b=1UFuuSXUHyUJ5u4v7Ic7ESUKOIzTyXq2K/bjZv1t3uHjZke+APNs4cTCpNIJpF1PKa
 Qhn6HwVMrxep1rboHrlP8EHxkUG0/2iH3E4bhViU3Iewb/bb/5yorI2j8jmPvtZNbV4Z
 SHYhGdkfHQWOWe8DAcy6OWjPV/SmZsWZW4svQR9+IKnULkY8bfrSlGWQkX5v6VskkPFj
 lBvgZWdl883ZNPHi4ARUOoHpshwguFBYX1nAZrHvz3ODUYX3hQDQ0pNhF6rBj7mqwLeN
 dLdVl8jrSwL9q6Zx3XwSSUBu4Vx0pgQrqck34JqHmouRorYWHkYWw8zu/qADf54qEtt3
 C/fA==
X-Gm-Message-State: AOAM5326gj6xRzRFWOUH5OGODMuHwfSjY8TJC/NXdXFPlbAFbX1HYUic
 ZDS4Sk0sbBv/DiBxEnfRarne0w4ySw==
X-Google-Smtp-Source: ABdhPJyhUS0viL9BdOphzRZz9dlpObr3OmI5m++i5XYvmz8q1ZQuIXHQeSElrrbIjZgsG39SC+5GKQ==
X-Received: by 2002:a05:6830:2453:: with SMTP id
 x19mr13042138otr.32.1639171471327; 
 Fri, 10 Dec 2021 13:24:31 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id u40sm972728oiw.56.2021.12.10.13.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 13:24:30 -0800 (PST)
Received: (nullmailer pid 1925119 invoked by uid 1000);
 Fri, 10 Dec 2021 21:24:29 -0000
Date: Fri, 10 Dec 2021 15:24:29 -0600
From: Rob Herring <robh@kernel.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
Subject: Re: [PATCH v4] ASoC: dt-bindings: davinci-mcasp: convert McASP
 bindings to yaml schema
Message-ID: <YbPFjUpDl29f7SQa@robh.at.kernel.org>
References: <20211203120243.24173-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203120243.24173-1-j-choudhary@ti.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 peter.ujfalusi@gmail.com
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

On Fri, Dec 03, 2021 at 05:32:43PM +0530, Jayesh Choudhary wrote:
> Convert the bindings for McASP controllers for TI SOCs from txt
> to YAML schema.
> 
> Adds additional properties 'clocks', 'clock-names', 'power-domains',
> '#sound-dai-cells' and 'port' which were missing from txt file.
> Removes properties 'sram-size-playback' and 'sram-size-capture'
> since they are not used.
> Adds 'dmas' and 'dma-names' in the example which were missing from
> the txt file.
> Changes 'interrupts' and 'interrupt-names' from optional to
> required properties.
> Changes 'op-mode', 'serial-dir' and 'tdm-slots' to optional properties
> as they are not needed if the McASP is used only as GPIO.
> 
> Adds the yaml file in the 'MAINTAINERS' under the heading 'TEXAS
> INSTRUMENTS ASoC DRIVERS'
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
> Changelog:
> v4:
> - changes the commit message
> - adds type and description to relevant properties
> - changes maxItems for 'serial-dir'
> - removes properties 'sram-size-playback' and 'sram-size-capture'
>   as they are not used
> - removes 'function-gpios'
> - removes 'num-serializer'
> - marks 'tdm-slots', 'serial-dir' and 'op-mode' as optional properties
> - adds the yaml file in MAINTAINERS
> 
> v3:
> - removes maxItems from 'clock-names'
> 
> v2:
> - changes the commit message
> - modifies the properties 'clocks', 'clock-names', 'dma-names',
>   'dmas', 'interrupts' and 'interrupt-names' according to the
>   arm SOCs
> - adds 'ports' and 'num-serializer' as node properties
> 
>  .../bindings/sound/davinci-mcasp-audio.txt    |  86 --------
>  .../bindings/sound/davinci-mcasp-audio.yaml   | 185 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  3 files changed, 186 insertions(+), 86 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml


> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> @@ -0,0 +1,185 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/davinci-mcasp-audio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: McASP Controller for TI SoCs
> +
> +maintainers:
> +  - Jayesh Choudhary <j-choudhary@ti.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,dm646x-mcasp-audio
> +      - ti,da830-mcasp-audio
> +      - ti,am33xx-mcasp-audio
> +      - ti,dra7-mcasp-audio
> +      - ti,omap4-mcasp-audio
> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: main registers
> +      - description: data port register
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: mpu
> +      - const: dat
> +
> +  op-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: I2S - 0 or DIT - 1 operation mode
> +    enum:
> +      - 0
> +      - 1
> +
> +  tdm-slots:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: number of channels over one serializer
> +    maxItems: 1

It's a uint32, so there's always 1 item. Drop.

No constraints? 0-2^32 is valid?

> +
> +  serial-dir:
> +    description:
> +      A list of serializer configuration
> +      Entry is indication for serializer pin direction
> +      0 - Inactive, 1 - TX, 2 - RX
> +      All AXR pins should be present in the array even if inactive
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 25
> +    items:
> +      minimum: 0
> +      maximum: 2
> +      default: 0
> +
> +  dmas:
> +    minItems: 1
> +    items:
> +      - description: transmission DMA channel
> +      - description: reception DMA channel
> +
> +  dma-names:
> +    minItems: 1
> +    items:
> +      - const: tx
> +      - const: rx
> +
> +  ti,hwmods:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: Name of hwmod associated with McASP
> +    maxItems: 1
> +    deprecated: true
> +
> +  tx-num-evt:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: configures WFIFO threshold
> +    maxItems: 1
> +
> +  rx-num-evt:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: configures RFIFO threshold
> +    maxItems: 1
> +
> +  dismod:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      specify the drive on TX pin during inactive time slots
> +      0 - 3-state, 2 - logic low, 3 - logic high
> +    enum:
> +      - 0
> +      - 2
> +      - 3
> +    default: 2
> +
> +  interrupts:
> +    anyOf:
> +      - minItems: 1
> +        items:
> +          - description: TX FIFO interrupt
> +          - description: RX FIFO interrupt
> +      - items:
> +          - description: common FIFO interrupt
> +
> +  interrupt-names:
> +    oneOf:
> +      - minItems: 1
> +        items:
> +          - const: tx
> +          - const: rx
> +      - const: common
> +
> +  fck_parent:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: parent clock name for McASP fck
> +    maxItems: 1
> +
> +  auxclk-fs-ratio:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: ratio of AUCLK and FS rate if applicable
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  clocks:
> +    minItems: 1
> +    items:
> +      - description: functional clock
> +      - description: module specific optional ahclkx clock
> +      - description: module specific optional ahclkr clock
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: fck
> +      - const: ahclkx
> +      - const: ahclkr
> +
> +  power-domains:
> +    description: phandle to the corresponding power-domain
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  port:
> +    description: connection for when McASP is used via graph card
> +    type: object
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - dmas
> +  - dma-names
> +  - interrupts
> +  - interrupt-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mcasp0: mcasp0@1d00000 {

Drop unused labels.

> +      compatible = "ti,da830-mcasp-audio";
> +      reg = <0x100000 0x3000>;
> +      reg-names = "mpu";
> +      interrupts = <82>, <83>;
> +      interrupt-names = "tx", "rx";
> +      op-mode = <0>;		/* MCASP_IIS_MODE */
> +      tdm-slots = <2>;
> +      dmas = <&main_udmap 0xc400>, <&main_udmap 0x4400>;
> +      dma-names = "tx", "rx";
> +      serial-dir = <
> +          0 0 0 0	/* 0: INACTIVE, 1: TX, 2: RX */
> +          0 0 0 0
> +          0 0 0 1
> +          2 0 0 0 >;
> +      tx-num-evt = <1>;
> +      rx-num-evt = <1>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 00ad0cb5cb05..3fdf1e23f7d7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18855,6 +18855,7 @@ TEXAS INSTRUMENTS ASoC DRIVERS
>  M:	Peter Ujfalusi <peter.ujfalusi@gmail.com>
>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
>  F:	sound/soc/ti/
>  
>  TEXAS INSTRUMENTS' DAC7612 DAC DRIVER
> -- 
> 2.17.1
> 
> 
