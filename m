Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C362466DC75
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 12:32:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C03CB66B2;
	Tue, 17 Jan 2023 12:31:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C03CB66B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673955128;
	bh=7z6N1RxldVpU1IzeewCkg6jDgLa61focV39FF+/CWbk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EEmA8zryp0rOVsvXiVmumLkTvsS2qtvuSRznE2C4wOy8mdtWbv7+HD6y0BWjtlNcs
	 zlNHQZ6CIRvunQWoe/XTxPkfpP/wewlVi9OTvFqg7Bj/jsrWPdRTqXpfFLF1JnQJCp
	 jWmIJXGsdCiudiaQplLE4FrdJdPuAr4TRQ/EY5EI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 744ABF80083;
	Tue, 17 Jan 2023 12:31:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20A77F8047B; Tue, 17 Jan 2023 12:31:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C101F8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 12:31:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C101F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QhBqq2uk
Received: by mail-wm1-x32b.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso4285906wms.3
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 03:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D3EkrOrIsoGEjlXNQEPTeW63ljQubkNcPYNJb7gZfuY=;
 b=QhBqq2ukGol8Dny+uxp1UtX3xOQ996K9vcPiDP5m3o5/CaC696MrNiK1LegSjSkp+n
 eYNR0oKhzdmtvHN21+skBAsHgJ9LmiHUG4xtsMBsuKcSHAM1taKiPK+O8in4qkYbnXQ0
 jstWKCtRvJ4/8t2Z0LkfWY+yvqYahCXfCA1ZdaUAWnQO0GASOeBKkOdi6XXAxVB2HgZG
 //MZfaHKboeCfCP+V1YvO1mYNJPc39sNyv25GAWIbsuxj/3/R8JKvn38xKtbbzV4wj4d
 V16ijyQbZDpaKcFaPitLH3Ucoms/ssVKe9XzhJjsagdPW9tK5YsJ604wVDf88Nkorwwq
 uFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D3EkrOrIsoGEjlXNQEPTeW63ljQubkNcPYNJb7gZfuY=;
 b=zIwYi97KD8AobmLluVCVWLSLos0nzGQ3U62PtUkXH1/MWktzKFSieR7DaMU0OtkvvH
 1uUzzs1f4m6FucwiySYhouNrZhV8u+LSGB6gjk/MfrTo7vL2UC79vQ9L2S1p6Wh8g69l
 btlpt1Jh6PdJolkUSvrNFkJdxapDMu7047kuLwVWlEnBUarRLgbyeaZPJFTfk/Kblv+V
 mnxX2on6SUREIKncb7fvIBfKGI9NhfomPdCQgSmwy0xM0RMGvsDXRCoe5kizPoS9N3Oo
 gZgAiORXDFfacJd4xVNBpR1My/LDjVHygiWlZ3/2mNWI863tpxtvVC1a48i1Yn73f5qL
 5zZA==
X-Gm-Message-State: AFqh2krL20PTEhyVud690yA5LjdA2qbY28ySSxrsnFhnToU73fUKABSA
 +bYLr7kk0WyQk/cCa5IdHJGp/Q==
X-Google-Smtp-Source: AMrXdXsAZl1MLOjQo2d3qzzRlNy+HJn/RhgvDPfSZDlkj/nJewQUkMhVEVuNshej/DJMn5pYVRGtGg==
X-Received: by 2002:a05:600c:3088:b0:3da:1bb0:4d8a with SMTP id
 g8-20020a05600c308800b003da1bb04d8amr2902593wmn.16.1673955071493; 
 Tue, 17 Jan 2023 03:31:11 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 k7-20020adfd227000000b002bdf3809f59sm8052618wrh.38.2023.01.17.03.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 03:31:10 -0800 (PST)
Message-ID: <316ddb81-8d13-71dd-3396-412e31cfb880@linaro.org>
Date: Tue, 17 Jan 2023 12:31:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 05/10] dt-bindings: soc: fsl: cpm_qe: Add QMC controller
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
References: <20230113103759.327698-1-herve.codina@bootlin.com>
 <20230113103759.327698-6-herve.codina@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113103759.327698-6-herve.codina@bootlin.com>
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

On 13/01/2023 11:37, Herve Codina wrote:
> Add support for the QMC (QUICC Multichannel Controller)
> available in some PowerQUICC SoC such as MPC885 or MPC866.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/soc/fsl/cpm_qe/fsl,qmc.yaml      | 164 ++++++++++++++++++
>  1 file changed, 164 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml
> new file mode 100644
> index 000000000000..3ec52f1635c8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml
> @@ -0,0 +1,164 @@
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
> +    maxItems: 1
> +    description: SCC interrupt line in the CPM interrupt controller
> +
> +  fsl,tsa:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle to the TSA
> +
> +  fsl,tsa-cell-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 3]
> +    description: |
> +      TSA cell ID (dt-bindings/soc/fsl,tsa.h defines these values)
> +       - 1: SCC2
> +       - 2: SCC3
> +       - 3: SCC4

Is this used as argument to tsa? If so, this should be part of fsl,tsa
property, just like we do for all syscon-like phandles.

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
> +  '^channel@([0-9]|[1-5][0-9]|6[0-3])$':
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

You still need to explain what do transparent and hdlc mean.

> +


Best regards,
Krzysztof

