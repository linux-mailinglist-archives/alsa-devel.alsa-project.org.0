Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB032661614
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Jan 2023 16:15:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37EDBCD68;
	Sun,  8 Jan 2023 16:15:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37EDBCD68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673190954;
	bh=lmo/Iq0Alj4E3Hb3igt1rFd2QZ8gWKMYMndUxQL8IEM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HJpOWuPbzQsBa3gK41sFCkcSzt0iNw9xI1rhGQTqPl3JTsLTGrOXGWbUzlrhDTXe/
	 g+XbcPBH/u1BS7Ka6t/dCvn3vCKTAiaVLHqMj1I91RGiaLxfBG2d2adMUNSxpfUdtB
	 6oDorwwVp6Ftvgi2BaYbhtMjkdQlV9aUAa0zSiAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2841F80245;
	Sun,  8 Jan 2023 16:14:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7528F804C1; Sun,  8 Jan 2023 16:14:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8895EF80245
 for <alsa-devel@alsa-project.org>; Sun,  8 Jan 2023 16:14:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8895EF80245
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=B17dgkv1
Received: by mail-wm1-x32a.google.com with SMTP id g10so4522118wmo.1
 for <alsa-devel@alsa-project.org>; Sun, 08 Jan 2023 07:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Kum/h3WoydN+pm7yzyrAbYktEmQZxXZIgzMlKqIfzRs=;
 b=B17dgkv12M5xpcm41prkaN1pTZSj1sIvPdyYkNeyGu+fVlfcN/UNBd5Vfr+PCgtrrR
 uUyGKa5hIjxm6nWEFQflNI8Z/T0BePImhtKOOfq0ha7YhJVOacTw7oCFowQx3vvsBCC8
 Jo09Ga6boCwekrTRdjCBRLlPPmVUa0epePP9gvYMzROlxMU+gUA4d+xJGRzCVE4ndqDL
 dSpwiyEnbx9uwnCHMIiOBrJI1YuNqedHnVuzroaYBVPuvGhAMh26mXwwgcC1yaxghFqu
 B4V9ZbTaoq2T1ov47NvIJB9QQDKVH8rJCoBQwxFxCjOqBsdav6y1Bnr7APW0nkjfg99T
 vIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kum/h3WoydN+pm7yzyrAbYktEmQZxXZIgzMlKqIfzRs=;
 b=zkVal4noxkyXRpRAhoKyjOLHrRxpE3g3RLwO/N0QCw2nXbFc/roAUuSEKO5ajsNYLu
 ymmUOFZ4izVGWuebk1SpAsEe78BVuAuxGJjdEuOPrlKQStPrD9AtNoKlxO5lRfi+EEcd
 8DZCEOu+lZID8DESHqYEwr4v95JfccQsZwXakPSgZkfJLbRytZGYG/HrH2yAyZPLGMHs
 f6bCpFLJCfS2A39Mj6ag29ZJIkyikdliZnCMbwBfgbRQltor3ohoIn5tObGE7wchQx8a
 /a/xaaKAIU87gd/gXRm4nrENHxONmTqeoP+D9SB0x9gi9ROd7EO4qWYiytVMn39z81Ny
 tUGQ==
X-Gm-Message-State: AFqh2kojtHDyEUb5j83iV/46KOf+QOZPNHVwlQChFXz+mmeGI0FMhLUS
 oYCmJORT+1LA+AdQW6Hby2/r4g==
X-Google-Smtp-Source: AMrXdXsEQW0bDV9OZcom7tmbUrlLwDsgiDLU21uXmHqGTahcowbhAAYwsT+7Wijlz/86kxWzzUwtZg==
X-Received: by 2002:a05:600c:22c4:b0:3cf:8ed7:712d with SMTP id
 4-20020a05600c22c400b003cf8ed7712dmr48239469wmg.14.1673190889730; 
 Sun, 08 Jan 2023 07:14:49 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a5d55c5000000b002a6f329203esm6356517wrw.61.2023.01.08.07.14.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 07:14:49 -0800 (PST)
Message-ID: <76077f5f-fbda-800b-b8d8-6a3f6600f4d1@linaro.org>
Date: Sun, 8 Jan 2023 16:14:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 05/10] dt-bindings: soc: fsl: cpm_qe: Add QMC controller
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>, Li Yang <leoyang.li@nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>
References: <20230106163746.439717-1-herve.codina@bootlin.com>
 <20230106163746.439717-6-herve.codina@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230106163746.439717-6-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 06/01/2023 17:37, Herve Codina wrote:
> Add support for the QMC (QUICC Multichannel Controller)
> available in some PowerQUICC SoC such as MPC885 or MPC866.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/soc/fsl/cpm_qe/fsl,qmc.yaml      | 167 ++++++++++++++++++
>  1 file changed, 167 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml
> new file mode 100644
> index 000000000000..caf71f3a3f3f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml
> @@ -0,0 +1,167 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qmc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PowerQUICC CPM QUICC Multichannel Controller (QMC)
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description: |
> +  The QMC (QUICC Multichannel Controller) emulates up to 64 channels within
> +  one serial controller using the same TDM physical interface routed from
> +  TSA.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,mpc885-scc-qmc
> +          - fsl,mpc866-scc-qmc
> +      - const: fsl,cpm1-scc-qmc
> +
> +  reg:
> +    items:
> +      - description: SCC (Serial communication controller) register base
> +      - description: SCC parameter ram base
> +      - description: Dual port ram base
> +
> +  reg-names:
> +    items:
> +      - const: scc_regs
> +      - const: scc_pram
> +      - const: dpram
> +
> +  interrupts:
> +    description: SCC interrupt line in the CPM interrupt controller

Missing constraints.

> +
> +  fsl,cpm-command:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Cf. soc/fsl/cpm_qe/cpm.txt

Missing description.

> +
> +  tsa:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the TSA

Missing vendor prefix. Does not look like a generic property.

> +
> +  tsa-cell-id:
> +    enum: [1, 2, 3]
> +    description: |
> +      TSA cell ID (dt-bindings/soc/fsl-tsa.h defines these values)
> +       - 1: SCC2
> +       - 2: SCC3
> +       - 3: SCC4
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  '#chan-cells':
> +    const: 1
> +
> +patternProperties:
> +  "^channel@([0-9]|[1-5][0-9]|6[0-3])$":
> +    description:
> +      A channel managed by this controller
> +    type: object
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 63
> +        description:
> +          The channel number
> +
> +      fsl,mode:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        enum: [transparent, hdlc]
> +        default: transparent
> +        description: Operational mode

And what do they mean?

> +
> +      fsl,reverse-data:
> +        $ref: /schemas/types.yaml#/definitions/flag
> +        description:
> +          The bit order as seen on the channels is reversed,
> +          transmitting/receiving the MSB of each octet first.
> +          This flag is used only in 'transparent' mode.
> +
> +      tx-ts-mask:

Missing vendor prefix.

> +        $ref: /schemas/types.yaml#/definitions/uint64
> +        description:
> +          Channel assigned Tx time-slots within the Tx time-slots routed
> +          by the TSA to this cell.
> +
> +      rx-ts-mask:
> +        $ref: /schemas/types.yaml#/definitions/uint64
> +        description:
> +          Channel assigned Rx time-slots within the Rx time-slots routed
> +          by the TSA to this cell.
> +
> +    required:
> +      - reg
> +      - tx-ts-mask
> +      - rx-ts-mask
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - tsa
> +  - tsa-cell-id
> +  - '#address-cells'
> +  - '#size-cells'
> +  - '#chan-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/soc/fsl-tsa.h>
> +
> +    scc_qmc@a60 {

No underscores in node names.

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +        compatible = "fsl,mpc885-scc-qmc", "fsl,cpm1-scc-qmc";
> +        reg = <0xa60 0x20>,
> +              <0x3f00 0xc0>,
> +              <0x2000 0x1000>;
> +        reg-names = "scc_regs", "scc_pram", "dpram";
> +        interrupts = <27>;
> +        interrupt-parent = <&CPM_PIC>;
> +        fsl,cpm-command = <0xc0>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        #chan-cells = <1>;
> +
> +        tsa = <&tsa>;
> +        tsa-cell-id = <FSL_CPM_TSA_SCC4>;
> +
> +        channel@16 {
> +            /* Ch16 : First 4 even TS from all routed from TSA */
> +            reg = <16>;
> +            fsl,mode = "transparent";
> +            fsl,reverse-data;
> +            tx-ts-mask = <0x00000000 0x000000AA>;
> +            rx-ts-mask = <0x00000000 0x000000AA>;

Keep case consistent. lower-case hex.

Best regards,
Krzysztof

