Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C2248B74B
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jan 2022 20:22:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15AFA1ACE;
	Tue, 11 Jan 2022 20:21:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15AFA1ACE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641928938;
	bh=aLZatTWgDL6OJ9ufdznfPzzhRe6AfZ8KDvKMqO6W/0M=;
	h=Date:To:References:From:Subject:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PovpRia6xU932hg4MyuNPuJIosexd8KXqdCy9iH8mlBQfEL1VFWhuxAjOeR4bOBJO
	 WsuY8vVl5l9+Vhesw1LPuYVtUZtfEuXN5PJRr0doq0KOzsHFHNb2g8f2TZdnaiaV0f
	 lRKWSeODXWgJiEfvpZ0iqn0ppIa9bt5QXbVPl+tg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E0CFF80430;
	Tue, 11 Jan 2022 20:21:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3543F80302; Tue, 11 Jan 2022 20:21:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2728F80054
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 20:21:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2728F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="e7Xd6QNk"
Received: by mail-lf1-x12a.google.com with SMTP id o12so262592lfk.1
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 11:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=IQ6W3xgHKrnp7B53kCwKHa1Eymilqv9lMUUBbELaZnc=;
 b=e7Xd6QNkL4v5HEOrpZmDuieyCU+P9nyhmuzZfpopDOp3xg/jJ1dbrUIlFwCfEkp+Zj
 l1YG1Y7owiHqkH/cDYE7sQiRfu1gqU0Ui4GO4tCts3qD7d+cq/34BTbsZ/pg1RzOBaDU
 EjYtVcAYu10JzA30noScbFx2uFRNIpQiOhb5KgkI8ia1gaZCxEZX6gd9glV1irxKwKxF
 uVC0/swr7A4jh5/HqbVWsS0ELHdi1+bh8gjoZ4ht/YYe9T02GdBZHcoD6nneoCZJPsbu
 CQejz2gQI74BNf7c8vr4x8wbosUGE4ORtu7SJV87ghRvqGj9ip9Z3gH9CPRcRiq762BQ
 tHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=IQ6W3xgHKrnp7B53kCwKHa1Eymilqv9lMUUBbELaZnc=;
 b=cbBT4fEbZ8myfegmAdxoKEU0ZlhrBj9bbL9GoAxDW0DoKtnji8vVVC8nGw+tuB3ahI
 lfwGJ77JZw7swtLbJ0BKnL9lPcabZYfjdlqAjYrZzaETT1pzFK7kkLN0BUBEvTMB6Z8H
 PRYFIO647HBNS9nv04rU8SbEPZyNgRvaCGDhQ6dkMF4GVK4cnx32unjt9+kzAut/dCKI
 QAgKh8Ur5D/Lm5tmkv13NoQmBkS67NB/lrmXt0PG5Yy98ZG+Kng2e8vzjvrlBH2Il8JT
 hh3o1D4EtwspcliKdTvXmqokDqLmi1DuKu5Vq1oTwQbGYwa2MyS6F8u8dBpJFCDo/8YS
 GgEw==
X-Gm-Message-State: AOAM532GCvANK8wP3rc/pHxkc+kLp64nFrZgMrrOumO+iPnhiuIEarDd
 DyQDDqAMrsvMd42DZ8vqI+M=
X-Google-Smtp-Source: ABdhPJwhP1qOAal4smwZicSGgFooZoJu1Zk1idiu3+zjYj3mFhks15LGWqRwWu56W+jBNgXvCtAz9Q==
X-Received: by 2002:a05:651c:113:: with SMTP id
 a19mr1513270ljb.505.1641928860908; 
 Tue, 11 Jan 2022 11:21:00 -0800 (PST)
Received: from [10.0.0.127] (91-153-170-164.elisa-laajakaista.fi.
 [91.153.170.164])
 by smtp.gmail.com with ESMTPSA id u12sm1384251ljj.134.2022.01.11.11.21.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jan 2022 11:21:00 -0800 (PST)
Message-ID: <2cf3c89c-169f-3421-25d4-c80a6c9737ae@gmail.com>
Date: Tue, 11 Jan 2022 21:21:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Jayesh Choudhary <j-choudhary@ti.com>, robh+dt@kernel.org
References: <20220103074427.4233-1-j-choudhary@ti.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH v5] ASoC: dt-bindings: davinci-mcasp: convert McASP
 bindings to yaml schema
In-Reply-To: <20220103074427.4233-1-j-choudhary@ti.com>
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

Hi Javesh,

On 03/01/2022 09:44, Jayesh Choudhary wrote:
> Convert the bindings for McASP controllers for TI SOCs from txt
> to YAML schema.
> 
> Adds additional properties 'clocks', 'clock-names', 'power-domains',
> '#sound-dai-cells' and 'port' which were missing from the txt file.
> Removes properties 'sram-size-playback' and 'sram-size-capture'
> since they are not used.
> Adds 'dmas' and 'dma-names' in the example which were missing from
> the txt file.
> Changes 'interrupts' and 'interrupt-names' from optional to
> required properties.
> Changes 'op-modes', 'serial-dir' to optional properties as they are
> not needed if the McASP is used only as GPIO.
> Changes 'tdm-slots' to required property only for I2S operation mode.
> 
> Adds the yaml file in the 'MAINTAINERS' under the heading 'TEXAS
> INSTRUMENTS ASoC DRIVERS'

I would have added description for the GPIO support as it is not obvious
that 2 is going to be for AXR2 or 29 is for ACLKR pin.
But I don't think this functionality is going to be used apart from the
one dra7 evm.

Thank you for the updates and the nice work!

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
> Changelog:
> v5:
> - changes the commit message
> - changes description for 'reg', 'op-mode', 'tx-num-evt',
>   'rx-num-evt' and 'interrupts'
> - adds minimum and maximum for 'tdm-slots'
> - removes default from 'serial-dir'
> - removes maxItems from 'tdm-slots', 'tx-num-evt', 'rx-num-evt' and
>   'auxclk-fs-ratio' as they are of type uint32
> - adds 'tdm-slots' as conditionally required property for I2S mode
>   of operation
> 
> v4:
> - changes the commit message
> - adds type and description to relevant properties
> - changes maxItems for 'serial-dir'
> - removes properties 'sram-size-playback' and 'sram-size-capture'
>   as they are not used
> - removes 'function-gpios'
> - removes 'num-serializer'
> - marks 'tdm-slots', 'op-mode' and 'serial-dir' as optional properties
> - adds the yaml file in MAINTAINERS
> 
> v3:
> - remove maxItems from 'clock-names'
> 
> v2:
> - changes the commit message
> - modifies the properties 'clocks', 'clock-names', 'dma-names',
>   'dmas', 'interrupts' and 'interrupt-names' according to the 
>   arm SOCs
> - adds 'ports' and 'num-serializer' as node properties
> 
>  .../bindings/sound/davinci-mcasp-audio.txt    |  86 --------
>  .../bindings/sound/davinci-mcasp-audio.yaml   | 201 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  3 files changed, 202 insertions(+), 86 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt
> deleted file mode 100644
> index bd863bd69501..000000000000
> --- a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt
> +++ /dev/null
> @@ -1,86 +0,0 @@
> -Texas Instruments McASP controller
> -
> -Required properties:
> -- compatible :
> -	"ti,dm646x-mcasp-audio"	: for DM646x platforms
> -	"ti,da830-mcasp-audio"	: for both DA830 & DA850 platforms
> -	"ti,am33xx-mcasp-audio"	: for AM33xx platforms (AM33xx, AM43xx, TI81xx)
> -	"ti,dra7-mcasp-audio"	: for DRA7xx platforms
> -	"ti,omap4-mcasp-audio"	: for OMAP4
> -
> -- reg : Should contain reg specifiers for the entries in the reg-names property.
> -- reg-names : Should contain:
> -         * "mpu" for the main registers (required). For compatibility with
> -           existing software, it is recommended this is the first entry.
> -         * "dat" for separate data port register access (optional).
> -- op-mode : I2S/DIT ops mode. 0 for I2S mode. 1 for DIT mode used for S/PDIF,
> -  	    IEC60958-1, and AES-3 formats.
> -- tdm-slots : Slots for TDM operation. Indicates number of channels transmitted
> -  	      or received over one serializer.
> -- serial-dir : A list of serializer configuration. Each entry is a number
> -               indication for serializer pin direction.
> -               (0 - INACTIVE, 1 - TX, 2 - RX)
> -- dmas: two element list of DMA controller phandles and DMA request line
> -        ordered pairs.
> -- dma-names: identifier string for each DMA request line in the dmas property.
> -	     These strings correspond 1:1 with the ordered pairs in dmas. The dma
> -	     identifiers must be "rx" and "tx".
> -
> -Optional properties:
> -
> -- ti,hwmods : Must be "mcasp<n>", n is controller instance starting 0
> -- tx-num-evt : FIFO levels.
> -- rx-num-evt : FIFO levels.
> -- dismod : Specify the drive on TX pin during inactive slots
> -	0 : 3-state
> -	2 : logic low
> -	3 : logic high
> -	Defaults to 'logic low' when the property is not present
> -- sram-size-playback : size of sram to be allocated during playback
> -- sram-size-capture  : size of sram to be allocated during capture
> -- interrupts : Interrupt numbers for McASP
> -- interrupt-names : Known interrupt names are "tx" and "rx"
> -- pinctrl-0: Should specify pin control group used for this controller.
> -- pinctrl-names: Should contain only one value - "default", for more details
> -  		 please refer to pinctrl-bindings.txt
> -- fck_parent : Should contain a valid clock name which will be used as parent
> -	       for the McASP fck
> -- auxclk-fs-ratio: When McASP is bus master indicates the ratio between AUCLK
> -		   and FS rate if applicable:
> -		   AUCLK rate = auxclk-fs-ratio * FS rate
> -
> -Optional GPIO support:
> -If any McASP pin need to be used as GPIO then the McASP node must have:
> -...
> -  gpio-controller
> -  #gpio-cells = <2>;
> -...
> -
> -When requesting a GPIO, the first parameter is the PIN index in McASP_P*
> -registers.
> -For example to request the AXR2 pin of mcasp8:
> -function-gpios = <&mcasp8 2 0>;
> -
> -Or to request the ACLKR pin of mcasp8:
> -function-gpios = <&mcasp8 29 0>;
> -
> -For generic gpio information, please refer to bindings/gpio/gpio.txt
> -
> -Example:
> -
> -mcasp0: mcasp0@1d00000 {
> -	compatible = "ti,da830-mcasp-audio";
> -	reg = <0x100000 0x3000>;
> -	reg-names "mpu";
> -	interrupts = <82>, <83>;
> -	interrupt-names = "tx", "rx";
> -	op-mode = <0>;		/* MCASP_IIS_MODE */
> -	tdm-slots = <2>;
> -	serial-dir = <
> -			0 0 0 0	/* 0: INACTIVE, 1: TX, 2: RX */
> -			0 0 0 0
> -			0 0 0 1
> -			2 0 0 0 >;
> -	tx-num-evt = <1>;
> -	rx-num-evt = <1>;
> -};
> diff --git a/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> new file mode 100644
> index 000000000000..f46c66bc6b2d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> @@ -0,0 +1,201 @@
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
> +      - description: CFG registers
> +      - description: data registers
> +
> +  reg-names:
> +    minItems: 1
> +    items:
> +      - const: mpu
> +      - const: dat
> +
> +  op-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: 0 - I2S or 1 - DIT operation mode
> +    enum:
> +      - 0
> +      - 1
> +
> +  tdm-slots:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      number of channels over one serializer
> +      the property is ignored in DIT mode
> +    minimum: 2
> +    maximum: 32
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
> +    description:
> +      configures WFIFO threshold
> +      0 disables the FIFO use
> +      if property is missing, then also FIFO use is disabled
> +
> +  rx-num-evt:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      configures RFIFO threshold
> +      0 disables the FIFO use
> +      if property is missing, then also FIFO use is disabled
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
> +          - description: TX interrupt
> +          - description: RX interrupt
> +      - items:
> +          - description: common/combined interrupt
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
> +allOf:
> +  - if:
> +      properties:
> +        opmode:
> +          enum:
> +            - 0
> +
> +    then:
> +      required:
> +        - tdm-slots
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
> index 5ea5655a29c3..ec6bde4efcae 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18995,6 +18995,7 @@ TEXAS INSTRUMENTS ASoC DRIVERS
>  M:	Peter Ujfalusi <peter.ujfalusi@gmail.com>
>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
>  F:	sound/soc/ti/
>  
>  TEXAS INSTRUMENTS' DAC7612 DAC DRIVER

-- 
Péter
