Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B8B783403
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 22:50:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 675BC836;
	Mon, 21 Aug 2023 22:50:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 675BC836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692651055;
	bh=2iXNBomS3QYsEVGDuduwyjCgZP0m9FgMapy3rlwBHEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DlTSiHavhacryipUtcPS1UP5YK7Ty+sF4nIdktVD6A2PHP6PfwZiRMZGwIUAmudmN
	 x86PyQyEIuzIm5lvZUW78dX1IrqGsMzI2ZFtdZ4FRnl6C9p/aV+IWu4Y1iZhjGj1oD
	 3dKNrFmExRB+KeSjzLR2Rlt5btKA8/M/DzkXD9fU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9004F80199; Mon, 21 Aug 2023 22:49:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78DFDF8016C;
	Mon, 21 Aug 2023 22:49:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2B32F80199; Mon, 21 Aug 2023 22:49:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02C00F800F8
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 22:49:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02C00F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fv+EmOOC
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 31C8864B7B;
	Mon, 21 Aug 2023 20:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706CAC433C8;
	Mon, 21 Aug 2023 20:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692650973;
	bh=2iXNBomS3QYsEVGDuduwyjCgZP0m9FgMapy3rlwBHEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fv+EmOOCUeVPXhIEOPEN0gZANSmnsZESKoOCf0KcELIFfSCoCVIhcM+OWdzQyYY9i
	 U5CGawHWdzHz0OeDYcygg9fHP+jcv0z6wrE9eVJfXfNYZ6vvTfZyuEGleV4t7ExcWJ
	 kRYw4DCxnDiUJZxmUwYZ9dlvlHtRTdaWF+gkzlF22bzi10fEZD7M7W3CZZ3Q+ypmh/
	 bQUcCEBK+RnPaywn/CD/IkztUICRJolXHQvvnNXoQVypDFM1Bv10ZT5aOJ84jqFvZU
	 9jcWrkOrw6JVUTAuafxBiTKSA04xrvLLPGn0ncXDNdUu+y75yrWIJkB4wCMYxmffyX
	 X0bmQr4hW9uwg==
Received: (nullmailer pid 2268748 invoked by uid 1000);
	Mon, 21 Aug 2023 20:49:29 -0000
Date: Mon, 21 Aug 2023 15:49:29 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Herve Codina <herve.codina@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni <thomas
 .petazzoni@bootlin.com>
Subject: Re: [PATCH v4 22/28] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
Message-ID: <20230821204929.GA2261144-robh@kernel.org>
References: <cover.1692376360.git.christophe.leroy@csgroup.eu>
 <7c67d590b13a889466f53edf94192bca3bf6ceec.1692376361.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <7c67d590b13a889466f53edf94192bca3bf6ceec.1692376361.git.christophe.leroy@csgroup.eu>
Message-ID-Hash: OQK6KNMKK7VPCZ3S43JJGT7OXPXBGWTT
X-Message-ID-Hash: OQK6KNMKK7VPCZ3S43JJGT7OXPXBGWTT
X-MailFrom: SRS0=A38r=EG=robh_at_kernel.org=rob@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OQK6KNMKK7VPCZ3S43JJGT7OXPXBGWTT/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Aug 18, 2023 at 06:39:16PM +0200, Christophe Leroy wrote:
> From: Herve Codina <herve.codina@bootlin.com>
> 
> The Lantiq PEF2256 is a framer and line interface component designed to
> fulfill all required interfacing between an analog E1/T1/J1 line and the
> digital PCM system highway/H.100 bus.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  .../bindings/net/lantiq,pef2256.yaml          | 219 ++++++++++++++++++
>  1 file changed, 219 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/lantiq,pef2256.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/lantiq,pef2256.yaml b/Documentation/devicetree/bindings/net/lantiq,pef2256.yaml
> new file mode 100644
> index 000000000000..72f6777afa3a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/lantiq,pef2256.yaml
> @@ -0,0 +1,219 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/lantiq,pef2256.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lantiq PEF2256
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description:
> +  The Lantiq PEF2256, also known as Infineon PEF2256 or FALC56, is a framer and
> +  line interface component designed to fulfill all required interfacing between
> +  an analog E1/T1/J1 line and the digital PCM system highway/H.100 bus.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: lantiq,pef2256
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Master clock
> +      - description: System Clock Receive
> +      - description: System Clock Transmit
> +
> +  clock-names:
> +    items:
> +      - const: mclk
> +      - const: sclkr
> +      - const: sclkx
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description:
> +      GPIO used to reset the device.
> +    maxItems: 1
> +
> +  '#framer-cells':

Not a standard binding. Do you need provider specific variable number of 
cells?

> +    const: 0
> +
> +  pinctrl:
> +    $ref: /schemas/pinctrl/pinctrl.yaml#
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        $ref: /schemas/pinctrl/pincfg-node.yaml#
> +        additionalProperties: false
> +
> +        properties:
> +          pins:
> +            enum: [ RPA, RPB, RPC, RPD, XPA, XPB, XPC, XPD ]
> +
> +          function:
> +            enum: [ SYPR, RFM, RFMB, RSIGM, RSIG, DLR, FREEZE, RFSP, LOS,
> +                    SYPX, XFMS, XSIG, TCLK, XMFB, XSIGM, DLX, XCLK, XLT,
> +                    GPI, GPOH, GPOL ]
> +
> +        required:
> +          - pins
> +          - function
> +
> +  lantiq,data-rate-bps:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [2048000, 4096000, 8192000, 16384000]
> +    default: 2048000
> +    description:
> +      Data rate (bit per seconds) on the system highway.
> +
> +  lantiq,clock-falling-edge:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Data is sent on falling edge of the clock (and received on the rising
> +      edge). If 'clock-falling-edge' is not present, data is sent on the
> +      rising edge (and received on the falling edge).
> +
> +  lantiq,channel-phase:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3, 4, 5, 6, 7]
> +    default: 0
> +    description:

Need '|' to preserve formatting

> +      The pef2256 delivers a full frame (32 8bit time-slots in E1 and 24 8bit
> +      time-slots 8 8bit signaling in E1/J1) every 125us. This lead to a data
> +      rate of 2048000 bit/s. When lantiq,data-rate-bps is more than 2048000
> +      bit/s, the data (all 32 8bit) present in the frame are interleave with
> +      unused time-slots. The lantiq,channel-phase property allows to set the
> +      correct alignment of the interleave mechanism.
> +      For instance, suppose lantiq,data-rate-bps = 8192000 (ie 4*2048000), and
> +      lantiq,channel-phase = 2, the interleave schema with unused time-slots
> +      (nu) and used time-slots (XX) for TSi is
> +        nu nu XX nu nu nu XX nu nu nu XX nu
> +        <-- TSi --> <- TSi+1 -> <- TSi+2 ->
> +      With lantiq,data-rate-bps = 8192000, and lantiq,channel-phase = 1, the
> +      interleave schema is
> +        nu XX nu nu nu XX nu nu nu XX nu nu
> +        <-- TSi --> <- TSi+1 -> <- TSi+2 ->
> +      With lantiq,data-rate-bps = 4096000 (ie 2*2048000), and
> +      lantiq,channel-phase = 1, the interleave schema is
> +        nu    XX    nu    XX    nu    XX
> +        <-- TSi --> <- TSi+1 -> <- TSi+2 ->
> +
> +patternProperties:
> +  '^codec(-([0-9]|[1-2][0-9]|3[0-1]))?$':
> +    type: object
> +    $ref: /schemas/sound/dai-common.yaml
> +    unevaluatedProperties: false
> +    description:
> +      Codec provided by the pef2256. This codec allows to use some of the PCM
> +      system highway time-slots as audio channels to transport audio data over
> +      the E1/T1/J1 lines.
> +      The time-slots used by the codec must be set and so, the properties
> +      'dai-tdm-slot-num', 'dai-tdm-slot-width', 'dai-tdm-slot-tx-mask' and
> +      'dai-tdm-slot-rx-mask' must be present in the sound card node for
> +      sub-nodes that involve the codec. The codec uses 8bit time-slots.
> +      'dai-tdm-tdm-slot-with' must be set to 8.
> +      The tx and rx masks define the pef2256 time-slots assigned to the codec.
> +
> +    properties:
> +      compatible:
> +        const: lantiq,pef2256-codec
> +
> +      '#sound-dai-cells':
> +        const: 0
> +
> +    required:
> +      - compatible
> +      - '#sound-dai-cells'
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - '#framer-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    pef2256: framer@2000000 {
> +      compatible = "lantiq,pef2256";
> +      reg = <0x2000000 0x100>;
> +      interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
> +      interrupt-parent = <&intc>;
> +      clocks = <&clk_mclk>, <&clk_sclkr>, <&clk_sclkx>;
> +      clock-names = "mclk", "sclkr", "sclkx";
> +      reset-gpios = <&gpio 11 GPIO_ACTIVE_LOW>;
> +      lantiq,data-rate-bps = <4096000>;
> +      #framer-cells = <0>;
> +
> +      pinctrl {
> +        pef2256_rpa_sypr: rpa-pins {
> +          pins = "RPA";
> +          function = "SYPR";
> +        };
> +        pef2256_xpa_sypx: xpa-pins {
> +          pins = "XPA";
> +          function = "SYPX";
> +        };
> +      };
> +
> +      pef2256_codec0: codec-0 {
> +        compatible = "lantiq,pef2256-codec";
> +        #sound-dai-cells = <0>;
> +        sound-name-prefix = "PEF2256_0";
> +      };
> +
> +      pef2256_codec1: codec-1 {
> +        compatible = "lantiq,pef2256-codec";
> +        #sound-dai-cells = <0>;
> +        sound-name-prefix = "PEF2256_1";
> +      };
> +    };
> +
> +    sound {
> +      compatible = "simple-audio-card";
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      simple-audio-card,dai-link@0 { /* CPU DAI1 - pef2256 codec 1 */
> +        reg = <0>;
> +        cpu {
> +          sound-dai = <&cpu_dai1>;
> +        };
> +        codec {
> +          sound-dai = <&pef2256_codec0>;
> +          dai-tdm-slot-num = <4>;
> +          dai-tdm-slot-width = <8>;
> +          /* TS 1, 2, 3, 4 */
> +          dai-tdm-slot-tx-mask = <0 1 1 1 1>;
> +          dai-tdm-slot-rx-mask = <0 1 1 1 1>;
> +        };
> +      };
> +      simple-audio-card,dai-link@1 { /* CPU DAI2 - pef2256 codec 2 */
> +        reg = <1>;
> +        cpu {
> +          sound-dai = <&cpu_dai2>;
> +        };
> +        codec {
> +          sound-dai = <&pef2256_codec1>;
> +          dai-tdm-slot-num = <4>;
> +          dai-tdm-slot-width = <8>;
> +          /* TS 5, 6, 7, 8 */
> +          dai-tdm-slot-tx-mask = <0 0 0 0 0 1 1 1 1>;
> +          dai-tdm-slot-rx-mask = <0 0 0 0 0 1 1 1 1>;
> +        };
> +      };
> +    };
> -- 
> 2.41.0
> 
