Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93947468356
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 09:21:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B4C92380;
	Sat,  4 Dec 2021 09:20:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B4C92380
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638606106;
	bh=rXEEhQQf7pkz1Lk7475cs0h5QCr6cYbhT1aTu5lkhWQ=;
	h=Date:To:References:From:Subject:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e+qodEhkvUNQ7n39zX6KiN7z4wemv+EX3FucuCI8idm747L53kYW0QFhah2tU2g8w
	 1SvrfFxKSD9jodyU9tEbsQUVmRLIe+3/mcmOOJLfvXPMXyP/VTsJrsWV41/qmYvwBA
	 rv3UjzWbj52niHptROv1dVGyH9YoadDDicu3B/wU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 965C7F8023A;
	Sat,  4 Dec 2021 09:20:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F93DF8023B; Sat,  4 Dec 2021 09:20:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0FCAF800D3
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 09:20:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0FCAF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nsqm6AMu"
Received: by mail-lf1-x136.google.com with SMTP id l22so12224533lfg.7
 for <alsa-devel@alsa-project.org>; Sat, 04 Dec 2021 00:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=RXLXHKA+v2ok7NithcByh2Cx9133L/bRH8x2U3vwlxI=;
 b=nsqm6AMuWsUtBoNgkCQSP30sm0IS79Pb1XH5ucjUei5rbtJR6bmuk0FOUgpe9T7Iab
 /hTEVBdBbbULDvVoesvzhCO0k3QxwYSX1UkCbjGVeIZW00QUWzoGD7Dvn/4WjKKrvUzS
 Mq1RUSBkKAR2a7knLtQM2yQoAyxeSZEXds68FIPYBVrDwWCgVeS+aUb316Ut3b5wSKFq
 CElu8FbnWYDAWYYxiTQ1vBdjO+JbLIZG44kRtVZkO0wpvj6cUsaDrJoQTdlj2Lvr5IVj
 N2gMro1syxSGj57tjYIjbCfN0rf03C/ZoboQGYASXUvAiksdA8+HvhLKnxqvFMn17VL1
 WyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=RXLXHKA+v2ok7NithcByh2Cx9133L/bRH8x2U3vwlxI=;
 b=bu7/J2vOyLrTwWUu+hr2niJrwk/LqtjQjFOD/T11/jQBqiTC+bbWt7n4otflzJSXwq
 k5n6m7typmK3e9kVub+SIRAldLKfivdkF3Mv6A8vcwFSXzEx3XJmeGGuALFgyr53Pxid
 aIwYhMfqEPEwGlzhWUCtWeO4ZIktjJ4paQ9uYXKHUDzKqnKuDl/WdMIZ1F+rR4yJV1qR
 s7EqJhEqFBT/jqJihZJ+3PJqx/i6GR9o6BfxNByl3q8ma44VK4xZ3dDORXOHYDlVZxc3
 /ECzFafUxg6gbWyVbDrzziNtv/H68DNL0ZBZNPiHWFLP2Ipj6mrsvSLnqLjzXP+HFzLd
 W0zQ==
X-Gm-Message-State: AOAM53281LtE+lGieZ3/dfPSaRUHlmv4JZqsLFIXdH62A4zjZ6Oj9rkS
 0+KZ0wWIX212uctuxB4VHSw=
X-Google-Smtp-Source: ABdhPJxMwWL4b2Oltm/Ye8JzsbPdyUfE0e0zsgrysoo6iO6gj/o+d+ZaJWFlESjDpTne/fG4DJlDxg==
X-Received: by 2002:a05:6512:1289:: with SMTP id
 u9mr22792162lfs.273.1638606017775; 
 Sat, 04 Dec 2021 00:20:17 -0800 (PST)
Received: from [10.0.0.115] (91-153-170-164.elisa-laajakaista.fi.
 [91.153.170.164])
 by smtp.gmail.com with ESMTPSA id y11sm783792ljh.54.2021.12.04.00.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Dec 2021 00:20:17 -0800 (PST)
Message-ID: <ed6c9be9-32d3-719a-ee0d-608b228f36b3@gmail.com>
Date: Sat, 4 Dec 2021 10:20:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Jayesh Choudhary <j-choudhary@ti.com>, robh+dt@kernel.org
References: <20211203120243.24173-1-j-choudhary@ti.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH v4] ASoC: dt-bindings: davinci-mcasp: convert McASP
 bindings to yaml schema
In-Reply-To: <20211203120243.24173-1-j-choudhary@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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

Hi,

On 03/12/2021 14:02, Jayesh Choudhary wrote:
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

...

> diff --git a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> new file mode 100644
> index 000000000000..5b553c90771a
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

The TRM refers to this area as CFG registers

> +      - description: data port register

Data registers

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

0 - I2S, or 1 - DIT operation mode

> +    enum:
> +      - 0
> +      - 1
> +
> +  tdm-slots:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: number of channels over one serializer
> +    maxItems: 1

and it has to be between 2 and 32, ignored in DIT mode (384 slots)

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

There is no default as all pins must be accounted for.

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

0 disables the FIFO use
If the property is missing, it also disables the FIFO use.

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

These has nothing to do with FIFO, they are just transmit, receive and
common or combined

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

I understand that it can be present under the mcasp node as it is part
of the graph card binding (or a card binding using graph).
I mean if a new card binding comes around then we need to document it
here as well?

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
> 

-- 
Péter
