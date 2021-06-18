Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 764923AD379
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 22:18:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0943172D;
	Fri, 18 Jun 2021 22:17:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0943172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624047483;
	bh=Zj+ye5PMyu6RWVaxMw4mQZp5tDjiq98KiSHTjkas3NM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iiJggM5fsywitqjFzFZCpgdso3Jm1Jd35pk/ld4V1osPgBA4meIwTKJYqxQASeH0C
	 EoSYuZp90fiSm35kv3de6bAQDQF3rXgOzzHvbo1MwfEtX/ylqJ/JwV7983r0AF2iYa
	 0khFlaeCK+cqbCUbVsks0NTh3Gx04PlZJN7a2hv4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DBC6F80148;
	Fri, 18 Jun 2021 22:16:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B023F8032D; Fri, 18 Jun 2021 22:16:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83C83F80084
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 22:16:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83C83F80084
Received: by mail-ot1-f51.google.com with SMTP id
 q5-20020a9d4b050000b029044ecc922d44so639080otf.7
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 13:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lBtHIzlhVk8sJY83HR9VHHtDV8zU8qEhN6lMMc8ccAQ=;
 b=mJp48jhq5cYmS4+Sv7CMVJ9Cbva3QW9hOK95R7KdRj13X4zd2nhrG+zDAim1vqZQP8
 TYrGhZCQxn8XQ/6rbO3ql04P3MAY2HczQ/Mqz2MVPwezEdpg0aYiKnI7i49iO0hrHX5l
 x37PtnGCtE6zWybx1NtbAxn9cx4I8Z1fSlCxw2h2xpAG8XhTChCZlHes5ArelClSnsSU
 hPCalFZ2lp9xGC33JpkKQ4+5eiOJVMiAniLVJhyjXSPKWLrUjJPFglpWlYlBSpwwMNFT
 3rhWTxKjt4D0F+oDtxz0awkrYGvTYfo7rwbzUkFqHFJ8eQw0jJJm8DH81VOxjTO++Y1N
 hohA==
X-Gm-Message-State: AOAM5331hqjLOtByNI1D2EW5GnK4r3YRpDQTkuQFIwNNVZtwyMjTMznL
 HoRfJ23wPPWGkUdMUazSXA==
X-Google-Smtp-Source: ABdhPJyxP4UQValuX9uYfay5qm8ASFvM1GL7mD27tgWSBBiyyj2DP4FOmSEom/6h9O3OOXV6G3LOZw==
X-Received: by 2002:a9d:4b02:: with SMTP id q2mr11111358otf.370.1624047386315; 
 Fri, 18 Jun 2021 13:16:26 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id j3sm1981852oii.46.2021.06.18.13.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 13:16:25 -0700 (PDT)
Received: (nullmailer pid 2807200 invoked by uid 1000);
 Fri, 18 Jun 2021 20:16:21 -0000
Date: Fri, 18 Jun 2021 14:16:21 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [RFC PATCH 03/13] ASoC: qcom: dt-bindings: add bindings Audio
 Processing manager
Message-ID: <20210618201621.GA2801502@robh.at.kernel.org>
References: <20210607152836.17154-1-srinivas.kandagatla@linaro.org>
 <20210607152836.17154-4-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607152836.17154-4-srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, tiwai@suse.de,
 plai@codeaurora.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 bjorn.andersson@linaro.org
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

On Mon, Jun 07, 2021 at 04:28:26PM +0100, Srinivas Kandagatla wrote:
> This patch adds bindings support for Qualcomm Audio Processing Manager
> service in Audio DSP.
> 
> Audio Process Manager is one of the static service in DSP which is
> responsible for Command/response handling, graph Management
> and Control/Event management between modules.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../devicetree/bindings/sound/qcom,q6apm.yaml | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
> new file mode 100644
> index 000000000000..9906ef935206
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/sound/qcom,q6apm.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Audio Process Manager binding
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description: |
> +  This binding describes the Qualcomm Audio Process Manager service in DSP
> +
> +properties:
> +  compatible:
> +    const: qcom,q6apm
> +
> +  reg:
> +    maxItems: 1
> +
> +#APM Services
> +patternProperties:
> +  "^.*@[0-9a-f]+$":

You can drop '^.*'.

> +    type: object
> +    description:
> +      APM devices use subnodes for services.
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,q6apm-dai
> +          - qcom,q6apm-bedai
> +
> +      iommus:
> +        maxItems: 1
> +
> +      "#sound-dai-cels":

cells?

How is this optional?

> +        const: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: true

This needs to be false and fix whatever is missing.

> +
> +examples:
> +  - |
> +    gpr {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        gprservice@1 {
> +          compatible = "qcom,q6apm";
> +          reg = <1>;
> +
> +          q6apm-dai {

This doesn't match what you have in the schema at all.

> +            compatible = "qcom,q6apm-dai";
> +            #sound-dai-cels = <1>;
> +          };
> +
> +          q6apm-bedai {
> +            compatible = "qcom,q6apm-bedai";
> +            #sound-dai-cels = <1>;
> +          };
> +        };
> +    };
> -- 
> 2.21.0
> 
> 
