Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD03B66161A
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Jan 2023 16:17:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24885CD79;
	Sun,  8 Jan 2023 16:16:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24885CD79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673191044;
	bh=mIZKQPtkDWNS1BYRl2uKCmZxhJC3VGiDbu4Xwp5zFOE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FMUpLnTLE/2nGwvfzSrPmQDui7ItNx8AD24J4+yEgzW9JeGn6mUyV80bCIftpknb3
	 rm5aCOFo0KWeAV+p6uIqIdt0RRdpsAtXPMn7BdggicraSVjIB9MJyczbWrlVKxzKpI
	 +i2UIk1eVE/UQBqCwPgPZkJqhQmOch37/KjYETuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2EEFF804D9;
	Sun,  8 Jan 2023 16:16:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0362AF804D9; Sun,  8 Jan 2023 16:16:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19902F80245
 for <alsa-devel@alsa-project.org>; Sun,  8 Jan 2023 16:16:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19902F80245
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tpTCz4ws
Received: by mail-wr1-x434.google.com with SMTP id t5so1386203wrq.1
 for <alsa-devel@alsa-project.org>; Sun, 08 Jan 2023 07:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BXw9KAygztT5jDGimnXGtcc/RXt5y1LZ6kVLW6bynMM=;
 b=tpTCz4ws4jY+X1l3CQZUYaPGZa/EpzKs+yq2hYz6I47CqYW66cl+bAfI4BbsrWfmGs
 wtQgtBjyGmpB2lgMW0B1jgg3XLN9/ToR1pRqizZcEcj14V864ktX4fOpZODMiqs4QVlE
 89UDXaMWkCdVIeWxrbTMXsbvD5Hi55UcJXWyAUya0Ad5cGzzO9UkgL3JPCRYHinRUwoJ
 MuLaN18LU1Pm+aAZQDXbiTxX4s7eb9ALHtsSAS30swbfEvafY2NlTrmy/rpV5N+6dMDq
 pRGu/DUepZ8mhJShTxyIljbBeZfAscuPDkR3GYSyzWUEZdDqbobrRMhAg6jYvjyFBa/M
 98kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BXw9KAygztT5jDGimnXGtcc/RXt5y1LZ6kVLW6bynMM=;
 b=71cxFZLJVbh+6EVmq/Nww7XF40wEjTcySgAFf/dx5Yjabv5xn2HvvUpwf75LQy8HA4
 2dU0Vu2ex4Eb+sk98FIVFK355FrHTLfRHdysHCpoA8ZTfv/Bo3SM4TvZfF2pYDUUuikY
 NvHD8K9NV5EWi7/HwVAJg+fPTMT8SMyh39S/VwdIhPYTZRtgunAPTRCRm0ZyZqBSny8/
 EpdXA6OedF8FGhqTphXWarAL4ILYGT6y3FALe17/rgUfwJrJjmxbfrPuaxZdOJFFdHtA
 7op1zCfzFEcFUjBnivap/3zigtD0EGnfkbz6lA6Pj2+eLsGJCYlic0cmtAje7ri1QaHe
 fXHg==
X-Gm-Message-State: AFqh2kq7hMf9FPcH+nOpwzILHMO+fj/Wf3WnIubtdfIFmas9wn1AwNPJ
 HQcVdmTKcR5IZ3vJjRoPy/Dg1g==
X-Google-Smtp-Source: AMrXdXviZdBmClnb6Toply9D3tNh+sz2JLSNoU9T04Iga71AMgdwS3TaY1guKipjbFqDnRnrIwrRUA==
X-Received: by 2002:a5d:5e81:0:b0:244:e704:df2c with SMTP id
 ck1-20020a5d5e81000000b00244e704df2cmr44150318wrb.57.1673190986931; 
 Sun, 08 Jan 2023 07:16:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a5d4b44000000b002366dd0e030sm6261986wrs.68.2023.01.08.07.16.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 07:16:26 -0800 (PST)
Message-ID: <c393e532-d466-366b-a390-65de47c58b6a@linaro.org>
Date: Sun, 8 Jan 2023 16:16:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 08/10] dt-bindings: sound: Add support for QMC audio
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
 <20230106163746.439717-9-herve.codina@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230106163746.439717-9-herve.codina@bootlin.com>
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
> The QMC (QUICC mutichannel controller) is a controller
> present in some PowerQUICC SoC such as MPC885.
> The QMC audio is an ASoC component that uses the QMC
> controller to transfer the audio data.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/sound/fsl,qmc-audio.yaml         | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml b/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
> new file mode 100644
> index 000000000000..b3774be36c19
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/fsl,qmc-audio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: QMC audio
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description: |
> +  The QMC audio is an ASoC component which uses QMC (QUICC Multichannel
> +  Controller) channels to transfer the audio data.
> +  It provides as many DAI as the number of QMC channel used.
> +
> +properties:
> +  compatible:
> +    items:

Drop items.

> +      - const: fsl,qmc-audio
> +
> +  '#address-cells':
> +    const: 1
> +  '#size-cells':
> +    const: 0
> +  '#sound-dai-cells':
> +    const: 1
> +
> +patternProperties:
> +  "^dai@([0-9]|[1-5][0-9]|6[0-3])$":
> +    description:
> +      A DAI managed by this controller
> +    type: object
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 63
> +        description:
> +          The DAI number
> +
> +      qmc-chan:

Missing vendor prefix.

> +        $ref: /schemas/types.yaml#/definitions/phandle-array

Why this is not a phandle?

> +        description: phandle to the QMC channel> +        maxItems: 1
> +
> +    required:
> +      - reg
> +      - qmc-chan
> +
> +required:
> +  - compatible
> +  - '#address-cells'
> +  - '#size-cells'
> +  - '#sound-dai-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    qmc_audio: qmc_audio {

Same problem as in previous patch.

> +        compatible = "fsl,qmc-audio";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        #sound-dai-cells = <1>;
> +        dai@16 {
> +            reg = <16>;
> +            qmc-chan = <&scc_qmc 16>;
> +        };
> +        dai@17 {
> +            reg = <17>;
> +            qmc-chan = <&scc_qmc 17>;
> +        };
> +    };

Best regards,
Krzysztof

