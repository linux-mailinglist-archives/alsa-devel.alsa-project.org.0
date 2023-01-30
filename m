Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B1E681920
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Jan 2023 19:29:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9032C868;
	Mon, 30 Jan 2023 19:28:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9032C868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675103339;
	bh=UfPxfvGrfjoStzgfgem/zx8nUtYDh3VxFz5w9fwlYuI=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FSG6hj9x48lB/j40NMgaukLcD8BLmP20I2Uz3D4WHi5j5RN7Mh4qWrXYhXdurDaDY
	 IaFHro9vJZxgYHMTCvsYE2uVXNaI0r5rbHIYKfYMiV7Ls8YKxRFfXMJm+3Ao7MpRBf
	 R5JxKWPg+xwcGwR0MBUyiG2Q4doTN0jpXGwDEVFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BF07F8007C;
	Mon, 30 Jan 2023 19:28:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FDB4F8032B; Mon, 30 Jan 2023 19:27:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52ECCF80155
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 19:27:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52ECCF80155
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-1636eae256cso11918997fac.0
 for <alsa-devel@alsa-project.org>; Mon, 30 Jan 2023 10:27:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tf+Hz6g06GpT8gLyBMyj5F7HvQrKehmWyVaiRCRAUi4=;
 b=B/MYqHZQ9HJ2UZza534t9sGnoc+gXOI1ofIRaM38o2/xfwfzF8yOtvMtoc6zx+hULd
 hjCiv4pw+Tfzy6TU6JnTFXk4hd/KSo+40b8wp7711WAIYIcZ7R8HZWXNr7KKB1FRgl/V
 mKx7bkikqOjEC/kdZVnwrN9qv4YqzfJ49Tmw6MAxPL0pM+aRXZ8WIfQ60Zza0m6XfS57
 uGANgvcwUw9uudSSjS6+qklWIvxRyzzldUa8KGtySiMbEXptjEmJ/6sa4X4iB7Je7qgC
 mwj8FT69BDqBx8D1kUF0IoqI67mFRBNajpzFdrH8F7xxhmCab4HsPXTWIT1Y3K+k1BF8
 51jg==
X-Gm-Message-State: AO0yUKVw2IAeW6+yHC+2L40wRRvi58BKlxTadLkbsQVGHW2iO7XprkRG
 hgxzVplESKvysU68DAczRA==
X-Google-Smtp-Source: AK7set+cdvCrFtKyqVh1ixnvV+fVhpPcYc+hOMnGWMZAHMri9p8xe2J2jkSe0NuNydCHzATlePQATA==
X-Received: by 2002:a05:6870:20e:b0:163:b5ec:928e with SMTP id
 j14-20020a056870020e00b00163b5ec928emr2805917oad.55.1675103266099; 
 Mon, 30 Jan 2023 10:27:46 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b36-20020a056870472400b001600797d1b5sm5507796oaq.41.2023.01.30.10.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:27:45 -0800 (PST)
Received: (nullmailer pid 3075619 invoked by uid 1000);
 Mon, 30 Jan 2023 18:27:44 -0000
Date: Mon, 30 Jan 2023 12:27:44 -0600
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 01/10] dt-bindings: soc: fsl: cpm_qe: Add TSA controller
Message-ID: <20230130182744.GA2974455-robh@kernel.org>
References: <20230126083222.374243-1-herve.codina@bootlin.com>
 <20230126083222.374243-2-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230126083222.374243-2-herve.codina@bootlin.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Li Yang <leoyang.li@nxp.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Mark Brown <broonie@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Jan 26, 2023 at 09:32:13AM +0100, Herve Codina wrote:
> Add support for the time slot assigner (TSA)
> available in some PowerQUICC SoC such as MPC885
> or MPC866.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/soc/fsl/cpm_qe/fsl,tsa.yaml      | 261 ++++++++++++++++++

fsl,cpm1-tsa.yaml

>  include/dt-bindings/soc/fsl,tsa.h             |  13 +
>  2 files changed, 274 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,tsa.yaml
>  create mode 100644 include/dt-bindings/soc/fsl,tsa.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,tsa.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,tsa.yaml
> new file mode 100644
> index 000000000000..d027d4c3cf10
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,tsa.yaml
> @@ -0,0 +1,261 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,tsa.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PowerQUICC CPM Time-slot assigner (TSA) controller
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description:
> +  The TSA is the time-slot assigner that can be found on some PowerQUICC SoC.
> +  Its purpose is to route some TDM time-slots to other internal serial
> +  controllers.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,mpc885-tsa
> +          - fsl,mpc866-tsa
> +      - const: fsl,cpm1-tsa
> +
> +  reg:
> +    items:
> +      - description: SI (Serial Interface) register base
> +      - description: SI RAM base
> +
> +  reg-names:
> +    items:
> +      - const: si_regs
> +      - const: si_ram
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  '#serial-cells':

Not a standard property. What's this for? #.*-cells applies to a 
specific pattern of properties.


> +    const: 1
> +
> +patternProperties:
> +  '^tdm@[0-1]$':
> +    description:
> +      The TDM managed by this controller
> +    type: object
> +
> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 1
> +        description:
> +          The TDM number for this TDM, 0 for TDMa and 1 for TDMb
> +
> +      fsl,common-rxtx-pins:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          The hardware can use four dedicated pins for Tx clock, Tx sync, Rx
> +          clock and Rx sync or use only two pins, Tx/Rx clock and Tx/Rx sync.
> +          Without the 'fsl,common-rxtx-pins' property, the four pins are used.
> +          With the 'fsl,common-rxtx-pins' property, two pins are used.
> +
> +      clocks:
> +        minItems: 2
> +        items:
> +          - description: External clock connected to L1RSYNC pin
> +          - description: External clock connected to L1RCLK pin
> +          - description: External clock connected to L1TSYNC pin
> +          - description: External clock connected to L1TCLK pin
> +      clock-names:
> +        minItems: 2
> +        items:
> +          - const: l1rsync
> +          - const: l1rclk
> +          - const: l1tsync
> +          - const: l1tclk
> +
> +      fsl,diagnostic-mode:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        enum: [disabled, echo, internal-loopback, control-loopback]

Seems like you would want userspace control of this, not have to make 
firmware changes and reboot to change.

> +        default: disabled
> +        description: |
> +          The diagnostic mode can be used to diagnose some communication issues.
> +          It should not be set (or set to 'disabled') when diagnostic is not
> +          needed.
> +          Diagnostic mode:
> +            - disabled:
> +                Diagnostic disabled (ie. normal operation)
> +            - echo:
> +                Automatic echo. Rx data is resent on Tx.
> +            - internal-loopback:
> +                The TDM transmitter is connected to the receiver. Data appears
> +                on Tx pin.
> +            - control-loopback:
> +                The TDM transmitter is connected to the receiver. The Tx pin is
> +                disconnected.
> +
> +      fsl,rx-frame-sync-delay-bits:
> +        enum: [0, 1, 2, 3]
> +        default: 0
> +        description: |
> +          Receive frame sync delay in number of bits.
> +          Indicates the delay between the Rx sync and the first bit of the Rx
> +          frame. 0 for no bit delay. 1, 2 or 3 for 1, 2 or 3 bits delay.
> +
> +      fsl,tx-frame-sync-delay-bits:
> +        enum: [0, 1, 2, 3]
> +        default: 0
> +        description: |
> +          Transmit frame sync delay in number of bits.
> +          Indicates the delay between the Tx sync and the first bit of the Tx
> +          frame. 0 for no bit delay. 1, 2 or 3 for 1, 2 or 3 bits delay.
> +
> +      fsl,clock-falling-edge:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          Data is sent on falling edge of the clock (and received on the rising
> +          edge). If 'clock-falling-edge' is not present, data is sent on the
> +          rising edge (and received on the falling edge).
> +
> +      fsl,fsync-rising-edge:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          Frame sync pulses are sampled with the rising edge of the channel
> +          clock. If 'fsync-rising-edge' is not present, pulses are sampled with
> +          the falling edge.
> +
> +      fsl,double-speed-clock:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          The channel clock is twice the data rate.
> +
> +      fsl,tx-ts-routes:
> +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +        description: |
> +          A list of tupple that indicates the Tx time-slots routes.

tuple

> +            tx_ts_routes =

Not the property name. Put an example in the example(s).

> +               < 2 0 >, /* The first 2 time slots are not used */
> +               < 3 1 >, /* The next 3 ones are route to SCC2 */
> +               < 4 0 >, /* The next 4 ones are not used */
> +               < 2 2 >; /* The nest 2 ones are route to SCC3 */
> +        items:
> +          items:
> +            - description:
> +                The number of time-slots
> +              minimum: 1
> +              maximum: 64
> +            - description: |
> +                The source serial interface (dt-bindings/soc/fsl,tsa.h defines
> +                these values)
> +                 - 0: No destination
> +                 - 1: SCC2
> +                 - 2: SCC3
> +                 - 3: SCC4
> +                 - 4: SMC1
> +                 - 5: SMC2
> +              enum: [0, 1, 2, 3, 4, 5]
> +        minItems: 1
> +        maxItems: 64
> +
> +      fsl,rx-ts-routes:

You could make these a pattern instead of duplicating the constraints: 

'^fsl,[rt]x-ts-routes$'

> +        $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +        description: |
> +          A list of tupple that indicates the Rx time-slots routes.
> +            tx_ts_routes =
> +               < 2 0 >, /* The first 2 time slots are not used */
> +               < 3 1 >, /* The next 3 ones are route from SCC2 */
> +               < 4 0 >, /* The next 4 ones are not used */
> +               < 2 2 >; /* The nest 2 ones are route from SCC3 */
> +        items:
> +          items:
> +            - description:
> +                The number of time-slots
> +              minimum: 1
> +              maximum: 64
> +            - description: |
> +                The destination serial interface (dt-bindings/soc/fsl,tsa.h
> +                defines these values)
> +                 - 0: No destination
> +                 - 1: SCC2
> +                 - 2: SCC3
> +                 - 3: SCC4
> +                 - 4: SMC1
> +                 - 5: SMC2
> +              enum: [0, 1, 2, 3, 4, 5]
> +        minItems: 1
> +        maxItems: 64
> +
> +    allOf:
> +      # If fsl,common-rxtx-pins is present, only 2 clocks are needed.
> +      # Else, the 4 clocks must be present.
> +      - if:
> +          required:
> +            - fsl,common-rxtx-pins
> +        then:
> +          properties:
> +            clocks:
> +              maxItems: 2
> +            clock-names:
> +              maxItems: 2
> +        else:
> +          properties:
> +            clocks:
> +              minItems: 4
> +            clock-names:
> +              minItems: 4
> +
> +    required:
> +      - reg
> +      - clocks
> +      - clock-names
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - '#address-cells'
> +  - '#size-cells'
> +  - '#serial-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/soc/fsl,tsa.h>
> +
> +    tsa@ae0 {
> +        compatible = "fsl,mpc885-tsa", "fsl,cpm1-tsa";
> +        reg = <0xae0 0x10>,
> +              <0xc00 0x200>;
> +        reg-names = "si_regs", "si_ram";
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        #serial-cells = <1>;
> +
> +        tdm@0 {
> +            /* TDMa */
> +            reg = <0>;
> +
> +            clocks = <&clk_l1rsynca>, <&clk_l1rclka>;
> +            clock-names = "l1rsync", "l1rclk";
> +
> +            fsl,common-rxtx-pins;
> +            fsl,fsync-rising-edge;
> +
> +            fsl,tx-ts-routes = < 2 0 >,             /* TS 0..1 */
> +                           < 24 FSL_CPM_TSA_SCC4 >, /* TS 2..25 */
> +                           < 1 0 >,                 /* TS 26 */
> +                           < 5 FSL_CPM_TSA_SCC3 >;  /* TS 27..31 */
> +
> +            fsl,rx-ts-routes = < 2 0 >,             /* TS 0..1 */
> +                           < 24 FSL_CPM_TSA_SCC4 >, /* 2..25 */
> +                           < 1 0 >,                 /* TS 26 */
> +                           < 5 FSL_CPM_TSA_SCC3 >;  /* TS 27..31 */
> +        };
> +    };
> diff --git a/include/dt-bindings/soc/fsl,tsa.h b/include/dt-bindings/soc/fsl,tsa.h
> new file mode 100644
> index 000000000000..2cc44e867dbe
> --- /dev/null
> +++ b/include/dt-bindings/soc/fsl,tsa.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +
> +#ifndef __DT_BINDINGS_SOC_FSL_TSA_H
> +#define __DT_BINDINGS_SOC_FSL_TSA_H
> +
> +#define FSL_CPM_TSA_NU		0	/* Pseuso Cell Id for not used item */
> +#define FSL_CPM_TSA_SCC2	1
> +#define FSL_CPM_TSA_SCC3	2
> +#define FSL_CPM_TSA_SCC4	3
> +#define FSL_CPM_TSA_SMC1	4
> +#define FSL_CPM_TSA_SMC2	5
> +
> +#endif
> -- 
> 2.39.0
> 
