Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0FF460F04
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 07:54:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E00117BF;
	Mon, 29 Nov 2021 07:53:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E00117BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638168887;
	bh=W9a0Wo1naF5XDPZMlMsHuutKC3qLX30pNO+SDEXTKN0=;
	h=Date:To:References:From:Subject:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O0SNx4VTuBimBpQkvrMlq5KgQt4KkMN1JsWW3attS4q1sEtn5lY6JDKSqjr3RPrU5
	 RcscU0z6VVJ5VNiJ05tYSlhWJuIAxaHQKP0ufjFFUJLbvQVlfW+uu7EbwLtjPPqZG6
	 BRJp+24yK5LbUDBDor28qd8Jr/3lHe/cPATkinOY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F927F80246;
	Mon, 29 Nov 2021 07:53:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93001F80240; Mon, 29 Nov 2021 07:53:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0243F8020D
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 07:53:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0243F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="b1mGbslp"
Received: by mail-lj1-x22d.google.com with SMTP id k23so32562625lje.1
 for <alsa-devel@alsa-project.org>; Sun, 28 Nov 2021 22:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=sYialmhs/rV7yRCPTKBL2MKiLeWKn0rtCFh7tpB6Nwg=;
 b=b1mGbslpM5HFkzpAxZzdKRPZnKjAtc/JL27Uf4lSUrd7td53YWziaGb7mUAOPL+uU3
 2tSjpEaRpLWrq+IIuHPSGshW0VBvW5LggxvS9zOYCAXchbg9mszUxi2X5yg5uJKbbeZT
 FX9PY1n+7dgIjAsSw3AtWv/ymsrWK8c6kl0tMUxUhDmXjWSqKpn71GwNaFpz4pTX3B+d
 Dc+Y8HKc+sQvh51VFWiBwEWZ5kbqw0iZbVHGLODn8vrwQzOrQR+Eg1srMJqXdKEbthWL
 UHUjzi5Mmx2ghHxlyful1KIHTvsXIhZV0i+jRkJVlvoEq8GkwsXzloO9qTO3H3uJwUMv
 eZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=sYialmhs/rV7yRCPTKBL2MKiLeWKn0rtCFh7tpB6Nwg=;
 b=uU2aKZNPbAx0o6qrEseHjqBgtvefZMC77pXS/7AfcneymU/+vtQNDighl89yw0ESLp
 j2J5hOTe/KzRr0PHayAng5U0umPtCJVZnP3RLtwxcXEysBd+bxE29lqpXAtsBRYQUiwa
 HJHulD+3tjyYFzMmTN5Fsv5k67lupZ1YhN4IFt0dajjxE8xV9BzhWAawOVAeiru4ix91
 DAogPxt8jgmJ6T5CI8hVIqMX2SLqJx5tlq2Wvl1jv98DfD4j7YkO6jir3Hq6VBzHjDfu
 cnnmwojP5geheA4CSqGm3hn5m5AoNAQnzTw5Nh6cWNlUo+jSxia0vOHvqBT2GHf0IRye
 F2zA==
X-Gm-Message-State: AOAM532l44YzXFVRJGljJAYQKmZDUAL4hBGBqs+APF8OZ3tS8AERE4Iy
 TVt9NexkCvb1DKKdd1AUeh8=
X-Google-Smtp-Source: ABdhPJyqTVQGXMu0J2rlD2XJeXkA9hhB5c/GwC6e6NeL8kftJ4khNTinVQHqy7W5GATGbqZaUhw5zg==
X-Received: by 2002:a05:651c:1b0:: with SMTP id
 c16mr46248776ljn.339.1638168799511; 
 Sun, 28 Nov 2021 22:53:19 -0800 (PST)
Received: from [10.0.0.115] (91-153-170-164.elisa-laajakaista.fi.
 [91.153.170.164])
 by smtp.gmail.com with ESMTPSA id i10sm1241091lfv.22.2021.11.28.22.53.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Nov 2021 22:53:18 -0800 (PST)
Message-ID: <64426bc9-1160-97c6-4714-4201b8f7a81c@gmail.com>
Date: Mon, 29 Nov 2021 08:53:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Jayesh Choudhary <j-choudhary@ti.com>, robh+dt@kernel.org
References: <20211126050228.6257-1-j-choudhary@ti.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: davinci-mcasp: convert McASP
 bindings to yaml schema
In-Reply-To: <20211126050228.6257-1-j-choudhary@ti.com>
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



On 26/11/2021 07:02, Jayesh Choudhary wrote:
> Convert the bindings for McASP controllers for TI SOCs
> from txt to YAML schema.

Can you CC the sound/soc/ti/ maintainer next time, I have found this
patch in my Spam folder...

> Adds additional properties 'clocks', 'clock-names', 'power-domains',
> '#sound-dai-cells',

> 'num-serializer'

Which use was removed by 1427e660b49e87cd842dba94158b0fc73030c17e

> and 'port'

And what this "port" is?

> which were not there in the txt file.

Most likely for a reason?

> Adds 'dmas' and 'dma-names' in the example which were not there in
> the txt file.
> Changes 'interrupts' and 'interrupt-names' from optional to
> required properties.

My biggest problem with the davinci-mcasp-audio.txt is that it was done
in a wrong way and it just documented the pdata parameters as DT binding.
If we convert it to yaml, this is going to be 'written in stone'.

> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
> Changelog:
> v3:
> - removes maxItems from 'clock-names'
> 
> v2:
> - changes the commit message
> - modifies the properties 'clocks', 'clock-names', 'dma-names',
>   'dmas', 'interrupts' and 'interrupt-names' according to the
>   arm SOCs
> - adds 'port' and 'num-serializer' as node properties
>  
>  .../bindings/sound/davinci-mcasp-audio.txt    |  86 ---------
>  .../bindings/sound/davinci-mcasp-audio.yaml   | 178 ++++++++++++++++++
>  2 files changed, 178 insertions(+), 86 deletions(-)
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
> index 000000000000..c4d3f56470bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> @@ -0,0 +1,178 @@
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
> +    description: I2S - 0 or DIT - 1 mode
> +    enum:
> +      - 0
> +      - 1
> +
> +  tdm-slots:

description?

> +    maxItems: 1
> +
> +  serial-dir:
> +    description:
> +      A list of serializer configuration
> +      Entry is indication for serializer pin direction
> +      0 - Inactive, 1 - TX, 2 - RX

You should mention that _all_ AXR pins should be present in the array,
even if they are no in use.

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 16

a McASP could have up to 25 AXR pins...

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

description?

> +    maxItems: 1
> +
> +  rx-num-evt:

description?

> +    maxItems: 1
> +
> +  dismod:

description?

> +    enum:
> +      - 0
> +      - 2
> +      - 3
> +    default: 2
> +
> +  sram-size-playback:
> +    maxItems: 1

should be dropped, not used

> +
> +  sram-size-capture:
> +    maxItems: 1

not used, please drop

> +
> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: TX FIFO interrupt
> +      - description: RX FIFO interrupt

The 'common' does not deserve a description?

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
> +    description: parent clock for McASP fck
> +    maxItems: 1
> +
> +  auxclk-fs-ratio:
> +    description: ratio of AUCLK and FS if applicable
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  function-gpios:
> +    maxItems: 1

This is not McASP property, it was an example on how to use a pin as
GPIO from the outside...

> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: fck
> +      - const: ahclkx
> +      - const: ahclkr

I can not find any use in the code for ahclkx/r?

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  num-serializer:
> +    maxItems: 1

Not used, the number of serializers is derived from the serial-dir array

> +  port:
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
> +  - serial-dir
> +  - op-mode
> +  - tdm-slots

The last three is not needed if the McASP is used only as GPIO.
The dmas and interrupts should not be needed in this case, but I think
it is not taken care of atm.

The tdm-slots is ignored for DIT mode

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
> 

-- 
Péter
