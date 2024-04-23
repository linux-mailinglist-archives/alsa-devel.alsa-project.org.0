Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D28C88AE967
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 16:25:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F4B2EC7;
	Tue, 23 Apr 2024 16:25:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F4B2EC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713882312;
	bh=lsKqiX8Zjk3SA4TnopgENDvHBDl4W5onZMLdYgcKjKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PQvi0h3SSLKoBe5gKc88M9ltl2oLowZ/O0z4oU5Py9soIyXewXnDWLUvJbBaumbFD
	 6cs7v2rDTkAfe4YHhPMCo7UIn71/zvNME0luPtxqijeiXU7HRa/AmF3m4rGhsW/n+t
	 ojfiQHaL2N0to6cN8xsRVnXybhZIQJ5uEAN2rn9w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0889DF8045D; Tue, 23 Apr 2024 16:24:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4ACFF805A8;
	Tue, 23 Apr 2024 16:24:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82BB8F802E8; Tue, 23 Apr 2024 16:24:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DDFAF8003C
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 16:24:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DDFAF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mwIMeQrL
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 48126614D7;
	Tue, 23 Apr 2024 14:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C72C116B1;
	Tue, 23 Apr 2024 14:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713882255;
	bh=lsKqiX8Zjk3SA4TnopgENDvHBDl4W5onZMLdYgcKjKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mwIMeQrLGCpcC1dwjfuqkkqaaG6CWCweJpkoWeAxh9LAnnifhlfOwNmykhTQYeeQP
	 XKxMpkAgcQrl+/wICk2WiIXzPThk8iC+HnjOE1qbhMzWAF6m+lyb6e8ahLC1mKPnYB
	 ioUVaJF+Aq0KNpfPv8YLTjhyXLuB+YOV6AtpYVDnJM3Qa0p2yIZT8BYzTQvSfKydXT
	 p0Y7027aD9i75V+JgsusBmZao/WFVZuaiEFvGcPBBi1rC7iQmpmQynQm4y7LAvpOLM
	 Yz48TDtPJGIk6TWbU38wh6Qd+sRgD9cnL+25Ff/br6/ZoJNhsKYtd2s6mbN6RK1Puy
	 3N+GsfFo3YGPQ==
Date: Tue, 23 Apr 2024 09:24:12 -0500
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shengjiu.wang@gmail.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: fsl,ssi: Convert to YAML
Message-ID: <20240423142412.GA138232-robh@kernel.org>
References: <1713764894-11870-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1713764894-11870-1-git-send-email-shengjiu.wang@nxp.com>
Message-ID-Hash: GQ3EAZVK3P5UVHS3UQ3HZLQZBIC3BUHX
X-Message-ID-Hash: GQ3EAZVK3P5UVHS3UQ3HZLQZBIC3BUHX
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GQ3EAZVK3P5UVHS3UQ3HZLQZBIC3BUHX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Apr 22, 2024 at 01:48:14PM +0800, Shengjiu Wang wrote:
> Convert the fsl,ssi binding to YAML.
> 
> Add below compatible strings which were not listed
> in document:
> 
> fsl,imx50-ssi
> fsl,imx53-ssi
> fsl,imx25-ssi
> fsl,imx27-ssi
> fsl,imx6q-ssi
> fsl,imx6sl-ssi
> fsl,imx6sx-ssi
> 
> Add below fsl,mode strings which were not listed.
> 
> i2s-slave
> i2s-master
> lj-slave
> lj-master
> rj-slave
> rj-master
> 
> Add 'ac97-gpios' property which were not listed.
> Then dtbs_check can pass.
> 
> And remove the 'codec' description which should be
> in the 'codec' binding doc.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v2:
> - change fallback string to const.
> - add dai-common.yaml
> - add ac97-gpios property
> 
>  .../devicetree/bindings/sound/fsl,ssi.txt     |  87 --------
>  .../devicetree/bindings/sound/fsl,ssi.yaml    | 192 ++++++++++++++++++
>  2 files changed, 192 insertions(+), 87 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/fsl,ssi.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,ssi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,ssi.txt b/Documentation/devicetree/bindings/sound/fsl,ssi.txt
> deleted file mode 100644
> index 7e15a85cecd2..000000000000
> --- a/Documentation/devicetree/bindings/sound/fsl,ssi.txt
> +++ /dev/null
> @@ -1,87 +0,0 @@
> -Freescale Synchronous Serial Interface
> -
> -The SSI is a serial device that communicates with audio codecs.  It can
> -be programmed in AC97, I2S, left-justified, or right-justified modes.
> -
> -Required properties:
> -- compatible:       Compatible list, should contain one of the following
> -                    compatibles:
> -                      fsl,mpc8610-ssi
> -                      fsl,imx51-ssi
> -                      fsl,imx35-ssi
> -                      fsl,imx21-ssi
> -- cell-index:       The SSI, <0> = SSI1, <1> = SSI2, and so on.
> -- reg:              Offset and length of the register set for the device.
> -- interrupts:       <a b> where a is the interrupt number and b is a
> -                    field that represents an encoding of the sense and
> -                    level information for the interrupt.  This should be
> -                    encoded based on the information in section 2)
> -                    depending on the type of interrupt controller you
> -                    have.
> -- fsl,fifo-depth:   The number of elements in the transmit and receive FIFOs.
> -                    This number is the maximum allowed value for SFCSR[TFWM0].
> - - clocks:          "ipg" - Required clock for the SSI unit
> -                    "baud" - Required clock for SSI master mode. Otherwise this
> -		      clock is not used
> -
> -Required are also ac97 link bindings if ac97 is used. See
> -Documentation/devicetree/bindings/sound/soc-ac97link.txt for the necessary
> -bindings.
> -
> -Optional properties:
> -- codec-handle:     Phandle to a 'codec' node that defines an audio
> -                    codec connected to this SSI.  This node is typically
> -                    a child of an I2C or other control node.
> -- fsl,fiq-stream-filter: Bool property. Disabled DMA and use FIQ instead to
> -		    filter the codec stream. This is necessary for some boards
> -		    where an incompatible codec is connected to this SSI, e.g.
> -		    on pca100 and pcm043.
> -- dmas:		    Generic dma devicetree binding as described in
> -		    Documentation/devicetree/bindings/dma/dma.txt.
> -- dma-names:	    Two dmas have to be defined, "tx" and "rx", if fsl,imx-fiq
> -		    is not defined.
> -- fsl,mode:         The operating mode for the AC97 interface only.
> -                    "ac97-slave" - AC97 mode, SSI is clock slave
> -                    "ac97-master" - AC97 mode, SSI is clock master
> -- fsl,ssi-asynchronous:
> -                    If specified, the SSI is to be programmed in asynchronous
> -                    mode.  In this mode, pins SRCK, STCK, SRFS, and STFS must
> -                    all be connected to valid signals.  In synchronous mode,
> -                    SRCK and SRFS are ignored.  Asynchronous mode allows
> -                    playback and capture to use different sample sizes and
> -                    sample rates.  Some drivers may require that SRCK and STCK
> -                    be connected together, and SRFS and STFS be connected
> -                    together.  This would still allow different sample sizes,
> -                    but not different sample rates.
> -- fsl,playback-dma: Phandle to a node for the DMA channel to use for
> -                    playback of audio.  This is typically dictated by SOC
> -                    design.  See the notes below.
> -                    Only used on Power Architecture.
> -- fsl,capture-dma:  Phandle to a node for the DMA channel to use for
> -                    capture (recording) of audio.  This is typically dictated
> -                    by SOC design.  See the notes below.
> -                    Only used on Power Architecture.
> -
> -Child 'codec' node required properties:
> -- compatible:       Compatible list, contains the name of the codec
> -
> -Child 'codec' node optional properties:
> -- clock-frequency:  The frequency of the input clock, which typically comes
> -                    from an on-board dedicated oscillator.
> -
> -Notes on fsl,playback-dma and fsl,capture-dma:
> -
> -On SOCs that have an SSI, specific DMA channels are hard-wired for playback
> -and capture.  On the MPC8610, for example, SSI1 must use DMA channel 0 for
> -playback and DMA channel 1 for capture.  SSI2 must use DMA channel 2 for
> -playback and DMA channel 3 for capture.  The developer can choose which
> -DMA controller to use, but the channels themselves are hard-wired.  The
> -purpose of these two properties is to represent this hardware design.
> -
> -The device tree nodes for the DMA channels that are referenced by
> -"fsl,playback-dma" and "fsl,capture-dma" must be marked as compatible with
> -"fsl,ssi-dma-channel".  The SOC-specific compatible string (e.g.
> -"fsl,mpc8610-dma-channel") can remain.  If these nodes are left as
> -"fsl,elo-dma-channel" or "fsl,eloplus-dma-channel", then the generic Elo DMA
> -drivers (fsldma) will attempt to use them, and it will conflict with the
> -sound drivers.
> diff --git a/Documentation/devicetree/bindings/sound/fsl,ssi.yaml b/Documentation/devicetree/bindings/sound/fsl,ssi.yaml
> new file mode 100644
> index 000000000000..d22911b0e9ef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,ssi.yaml
> @@ -0,0 +1,192 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/fsl,ssi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale Synchronous Serial Interface
> +
> +maintainers:
> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> +
> +description:
> +  Notes on fsl,playback-dma and fsl,capture-dma
> +  On SOCs that have an SSI, specific DMA channels are hard-wired for playback
> +  and capture.  On the MPC8610, for example, SSI1 must use DMA channel 0 for
> +  playback and DMA channel 1 for capture.  SSI2 must use DMA channel 2 for
> +  playback and DMA channel 3 for capture.  The developer can choose which
> +  DMA controller to use, but the channels themselves are hard-wired.  The
> +  purpose of these two properties is to represent this hardware design.
> +
> +  The device tree nodes for the DMA channels that are referenced by
> +  "fsl,playback-dma" and "fsl,capture-dma" must be marked as compatible with
> +  "fsl,ssi-dma-channel".  The SOC-specific compatible string (e.g.
> +  "fsl,mpc8610-dma-channel") can remain.  If these nodes are left as
> +  "fsl,elo-dma-channel" or "fsl,eloplus-dma-channel", then the generic Elo DMA
> +  drivers (fsldma) will attempt to use them, and it will conflict with the
> +  sound drivers.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,imx50-ssi
> +              - fsl,imx53-ssi
> +          - enum:
> +              - fsl,imx51-ssi

const

> +          - const: fsl,imx21-ssi
> +      - items:
> +          - enum:
> +              - fsl,imx25-ssi
> +              - fsl,imx27-ssi
> +              - fsl,imx35-ssi
> +              - fsl,imx51-ssi
> +              - fsl,imx6q-ssi
> +              - fsl,imx6sl-ssi
> +              - fsl,imx6sx-ssi
> +          - enum:
> +              - fsl,imx21-ssi
> +              - fsl,imx51-ssi

Fallbacks cannot be enum's. You need to split this into 2. Also, there's 
no valid entry for "fsl,imx21-ssi".

It also doesn't make sense that sometimes mx21 is a fallback of mx51, 
but then sometimes the last fallback is mx51.

> +      - items:
> +          - const: fsl,mpc8610-ssi
> +
> +  cell-index:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2]
> +    description: The SSI index
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  fsl,fifo-depth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The number of elements in the transmit and receive FIFOs.
> +      This number is the maximum allowed value for SFCSR[TFWM0].

Ordering is standard properties first (like 'clocks') and then vendor 
specific properties last.

You need some constraints on the fsl,fifo-depth values.

> +
> +  clocks:
> +    items:
> +      - description: The ipg clock for register access
> +      - description: clock for SSI master mode
> +    minItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: ipg
> +      - const: baud
> +    minItems: 1
> +
> +  dmas:
> +    oneOf:
> +      - items:
> +          - description: DMA controller phandle and request line for RX
> +          - description: DMA controller phandle and request line for TX
> +      - items:
> +          - description: DMA controller phandle and request line for RX0
> +          - description: DMA controller phandle and request line for TX0
> +          - description: DMA controller phandle and request line for RX1
> +          - description: DMA controller phandle and request line for TX1
> +
> +  dma-names:
> +    oneOf:
> +      - items:
> +          - const: rx
> +          - const: tx
> +      - items:
> +          - const: rx0
> +          - const: tx0
> +          - const: rx1
> +          - const: tx1
> +
> +  codec-handle:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to a 'codec' node that defines an audio
> +      codec connected to this SSI.  This node is typically
> +      a child of an I2C or other control node.
> +
> +  fsl,fiq-stream-filter:
> +    type: boolean
> +    description:
> +      Disabled DMA and use FIQ instead to filter the codec stream.
> +      This is necessary for some boards where an incompatible codec
> +      is connected to this SSI, e.g. on pca100 and pcm043.
> +
> +  fsl,mode:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: [ ac97-slave, ac97-master, i2s-slave, i2s-master,
> +            lj-slave, lj-master, rj-slave, rj-master ]
> +    description: |
> +      "ac97-slave" - AC97 mode, SSI is clock slave
> +      "ac97-master" - AC97 mode, SSI is clock master
> +      "i2s-slave" - I2S mode, SSI is clock slave
> +      "i2s-master" - I2S mode, SSI is clock master
> +      "lj-slave" - Left justified mode, SSI is clock slave
> +      "lj-master" - Left justified mode, SSI is clock master
> +      "rj-slave" - Right justified mode, SSI is clock slave
> +      "rj-master" - Right justified mode, SSI is clock master
> +
> +  fsl,ssi-asynchronous:
> +    type: boolean
> +    description: If specified, the SSI is to be programmed in asynchronous
> +      mode.  In this mode, pins SRCK, STCK, SRFS, and STFS must
> +      all be connected to valid signals.  In synchronous mode,
> +      SRCK and SRFS are ignored.  Asynchronous mode allows
> +      playback and capture to use different sample sizes and
> +      sample rates.  Some drivers may require that SRCK and STCK
> +      be connected together, and SRFS and STFS be connected
> +      together.  This would still allow different sample sizes,
> +      but not different sample rates.
> +
> +  fsl,playback-dma:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to a node for the DMA channel to use for
> +      playback of audio.  This is typically dictated by SOC
> +      design. Only used on Power Architecture.
> +
> +  fsl,capture-dma:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to a node for the DMA channel to use for
> +      capture (recording) of audio.  This is typically dictated
> +      by SOC design. Only used on Power Architecture.
> +
> +  ac97-gpios:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: Please refer to soc-ac97link.txt
> +
> +  "#sound-dai-cells":
> +    const: 0
> +    description: optional, some dts node didn't add it.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - fsl,fifo-depth
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/imx6qdl-clock.h>
> +    ssi1: ssi@2028000 {

Drop unused labels.
> +        compatible = "fsl,imx6q-ssi",
> +                     "fsl,imx51-ssi";

This fits on 1 line.

> +        reg = <0x02028000 0x4000>;
> +        interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clks IMX6QDL_CLK_SSI1_IPG>,
> +                 <&clks IMX6QDL_CLK_SSI1>;
> +        clock-names = "ipg", "baud";
> +        dmas = <&sdma 37 1 0>, <&sdma 38 1 0>;
> +        dma-names = "rx", "tx";
> +        #sound-dai-cells = <0>;
> +        fsl,fifo-depth = <15>;
> +    };
> -- 
> 2.34.1
> 
