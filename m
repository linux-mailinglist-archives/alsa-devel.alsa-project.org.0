Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8043D9468
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jul 2021 19:38:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B9A01A9B;
	Wed, 28 Jul 2021 19:37:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B9A01A9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627493917;
	bh=9oWFm+mhHm8WNY5WyerFmKoG/VKOEnzdhTwu5wbq4Mo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O2EdE7MyNMqSe/NV9wKpKVlImGsiKbDhaYNChC4ijhuL11MEgn/EJMprTdgRGXs1q
	 iR7neqNbtuV3sN0GAqtFfb+4uyzZcYOcZm0+6jZnLsQlrn+hEXp8rCJdHO0SpxicMF
	 xla2U79pJiMPuss2BPKWXqGXfz4x6ycqOEPA1Mg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FDB1F8025E;
	Wed, 28 Jul 2021 19:37:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D863F8025A; Wed, 28 Jul 2021 19:37:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C647F80212
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 19:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C647F80212
Received: by mail-io1-f43.google.com with SMTP id h1so3821147iol.9
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 10:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=+ZuWCSGhI9p946I5meiTY9tIujdg9WTVzTMSIiS4wvA=;
 b=f/ZcZaGgYTiee91bIlpTnIFWVXmix7cxhwHa0BUgD7Xcj74JnzYcKPTnVR6ZbdD/mw
 1SGwIF9rlCm5Sefm1yua2Rjv4KgdQvXA19sOTHEMT5QHKzIN8iMs4YiaKXhZDygy3tui
 02fpL58gwits8GZEGfUbjIghqnCiy/1P+wc+UQ0HoLlrrIbpxcD7AkmeGWZnURLPBRx6
 k70MXpFE5Axvg3letxAbd8luJRjxz7M52U4QJDm4tF6SP/qfgqY1cFCv8VJgvSHu2jFS
 SjFEi3cKdWKnn/FBPNZ3sxh/C7bhIIaAqkAs/lMriwNim4N1vwlpJYY01Q7m5Ye7jSBd
 44gA==
X-Gm-Message-State: AOAM533HI36Fp1llnHcMXRKZJ0nc2xhkQmqNpVPD4q70/0VZkhUmLeF5
 o90NFXzxloXOoYhHQRXfYw==
X-Google-Smtp-Source: ABdhPJxCmh3UPQcqE4Y7EaPT/8ZYwkH97oksdw+d/L95duJC5Jdb6zChMU6kTNaWH9jRrV8yythhsw==
X-Received: by 2002:a05:6638:289:: with SMTP id c9mr876595jaq.14.1627493814569; 
 Wed, 28 Jul 2021 10:36:54 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id g4sm335630ilc.11.2021.07.28.10.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 10:36:53 -0700 (PDT)
Received: (nullmailer pid 1298058 invoked by uid 1000);
 Wed, 28 Jul 2021 17:36:49 -0000
Date: Wed, 28 Jul 2021 11:36:49 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 04/16] ASoC: qcom: dt-bindings: add bindings Audio
 Processing manager
Message-ID: <20210728173649.GA1290628@robh.at.kernel.org>
References: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
 <20210714153039.28373-5-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714153039.28373-5-srinivas.kandagatla@linaro.org>
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

On Wed, Jul 14, 2021 at 04:30:27PM +0100, Srinivas Kandagatla wrote:
> This patch adds bindings support for Qualcomm Audio Processing Manager
> service in Audio DSP.
> 
> Audio Process Manager is one of the static service in DSP which is
> responsible for Command/response handling, graph Management
> and Control/Event management between modules.

This all looks fairly similar to the prior Qcom audio binding(s). It 
would be nice to not see this all re-invented.

> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../devicetree/bindings/sound/qcom,q6apm.yaml | 87 +++++++++++++++++++
>  include/dt-bindings/sound/qcom,q6apm.h        |  8 ++
>  2 files changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
>  create mode 100644 include/dt-bindings/sound/qcom,q6apm.h
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
> new file mode 100644
> index 000000000000..6f27567523a9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
> @@ -0,0 +1,87 @@
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
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +#APM Services
> +patternProperties:
> +  'apm@[0-9]+$':

This means '.*apm' for the node name. Did you need a '^'?

> +    type: object
> +    description:
> +      APM devices use subnodes for services.
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - qcom,q6apm-dais
> +          - qcom,q6apm-bedais
> +
> +      iommus:
> +        maxItems: 1
> +
> +      "#sound-dai-cells":
> +        const: 1
> +
> +      reg:
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - '#sound-dai-cells'
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
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
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          apm@1 {
> +            compatible = "qcom,q6apm-dais";
> +            #sound-dai-cells = <1>;
> +            reg = <1>;
> +          };
> +
> +          apm@2 {
> +            compatible = "qcom,q6apm-bedais";
> +            #sound-dai-cells = <1>;
> +            reg = <2>;
> +          };
> +        };
> +    };
> diff --git a/include/dt-bindings/sound/qcom,q6apm.h b/include/dt-bindings/sound/qcom,q6apm.h
> new file mode 100644
> index 000000000000..3c3987eb6e95
> --- /dev/null
> +++ b/include/dt-bindings/sound/qcom,q6apm.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __DT_BINDINGS_Q6_APM_H__
> +#define __DT_BINDINGS_Q6_APM_H__
> +
> +/* Audio Process Manager (APM) virtual ports IDs */
> +#include <dt-bindings/sound/qcom,q6afe.h>

Why add this indirection? Rename the file if you need something to cover 
both.

> +
> +#endif /* __DT_BINDINGS_Q6_APM_H__ */
> -- 
> 2.21.0
> 
> 
