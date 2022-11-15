Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF291629BEB
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 15:22:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F8E81636;
	Tue, 15 Nov 2022 15:21:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F8E81636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668522133;
	bh=rMd9fx8zZHOlLUH5NjAuHekL+pk38HqlW2iJRACwnRQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cUW7kYMoBk2JkVCROdXn3UhwH8Tv1kDd/OagOfK/kK58wk3RBor5QUpblf5DU/ALa
	 dvZY7ac8Ytz5jwmgdxfOw8nrmz+NI+2amlx9BJM4hjj4hCtZfyoZ4FbKpkvQOpZbHe
	 OoBMVASpDjZ9IxCyjOmL6huNSr/9VkqATdRvTlIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4C2FF800B8;
	Tue, 15 Nov 2022 15:21:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CCF0F800B8; Tue, 15 Nov 2022 15:21:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 040E0F800B8
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 15:21:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 040E0F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="HShR3wKO"
Received: by mail-lf1-x12b.google.com with SMTP id d6so24617308lfs.10
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 06:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ACgHMFuGKzy3RGwW6XHrQYZNS+YLjUOXJZAsXWrWtGs=;
 b=HShR3wKOJcnBxWiCo3jeWX+nqBmY7jdqQxaDhFfMLBjHDv36J+RsIx27T1YWbYLSuI
 yJuV9RXMTuEFfa1vTJSZ2AkdCmq27eLcBDIla5OWTvnCNQpZPWiPVYMXP89CLL0i5dEp
 jNtwWCN/2k04uQShe5hSnv4VEecopp7F/GbsLYezvFV43PkSGTxLC0ft0nw8SYgtiewi
 HNo9RT9JxiYQKJ2j1f7/xCNs8Q/3eP81P5EbIEgCAEEcUhNJZIKcwltLzlSz4fPau3Sz
 XVBoEsK19cu2OgBxmLCWKmRN0a4DbiUmRFZCPNV4MQ9DGKR06bbSi4jKVjIkqBVhLLQd
 Z9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ACgHMFuGKzy3RGwW6XHrQYZNS+YLjUOXJZAsXWrWtGs=;
 b=VhRTkDjbfFPhONLdoHXkJrRPYTO2NG/e2Kau2kyfbWc5P0sxJE2r32EImkrpKrXIW3
 kuk42cZ97nPpIsitHYIh8zLBX9cilz7PZOR9/6P3tAVYCsk486IKP82TPq0kZghxNpGp
 yW5wFzQNyyvxig5n7fVxXCgTnRLlHwxP2B4Y1BiAMlA0R1tup7PTNPs2OCBnqSaFM4mm
 J1WZ61zYD+q2SgsTQwCG2+1IR+T0/A2qvkTTO282AOP2r5PHFaR9xAaV/U7BiA7OT44y
 2Mb6MJ1CVQZxs7zThJURz4d2vpJqk8V3nNyvH/QGpL8ZmkNquCNghTXwvRmk9/pSePIw
 QeXA==
X-Gm-Message-State: ANoB5pmgDhomGgWWCtOoSA06H0G+B4fXTURXTCn6ZbwycTUMh7KuzTnD
 vwEZKFiXw8sPK2dnqIXJkey1sQ==
X-Google-Smtp-Source: AA0mqf5KID519SFnnfTcLoNNny5R3BJ970yABv3j0l6ETKypPDYbUDkY+VVoHy6vD3ScOULPBNLKHw==
X-Received: by 2002:a19:5016:0:b0:4ad:5fbb:a5b0 with SMTP id
 e22-20020a195016000000b004ad5fbba5b0mr5417040lfb.466.1668522067299; 
 Tue, 15 Nov 2022 06:21:07 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056512324800b004afc1607130sm2226467lfr.8.2022.11.15.06.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 06:21:06 -0800 (PST)
Message-ID: <f3a6a7b1-b196-0abb-0c18-8a13908c6891@linaro.org>
Date: Tue, 15 Nov 2022 15:21:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: lpass-va: add npl clock for new VA
 macro
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20221115105541.16322-1-srinivas.kandagatla@linaro.org>
 <20221115105541.16322-2-srinivas.kandagatla@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115105541.16322-2-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
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

On 15/11/2022 11:55, Srinivas Kandagatla wrote:
> LPASS VA Macro now has soundwire master to deal with access to
> analog mic in low power island use cases. This also means that VA macro
> now needs to get hold of the npl clock too. Add clock bindings required
> for this.
> 
> As part of adding this bindings, also update bindings to be able to
> specific and associate the clock names specific to the SoC.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/sound/qcom,lpass-va-macro.yaml   | 72 ++++++++++++++++---
>  1 file changed, 64 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> index c36caf90b837..848e34111df1 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> @@ -27,16 +27,13 @@ properties:
>      const: 0
>  
>    clocks:
> -    maxItems: 3
> +    minItems: 1
> +    maxItems: 4
> +
>  
>    clock-names:
> -    oneOf:
> -      - items:   #for ADSP based platforms
> -          - const: mclk
> -          - const: core
> -          - const: dcodec
> -      - items:   #for ADSP bypass based platforms
> -          - const: mclk
> +    minItems: 1
> +    maxItems: 4
>  
>    clock-output-names:
>      maxItems: 1
> @@ -61,6 +58,65 @@ required:
>    - reg
>    - "#sound-dai-cells"
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sc7280-lpass-va-macro
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 1

You can skip minItems here.

> +          maxItems: 1
> +        clock-names:
> +          items:
> +            - const: mclk
> +      required:
> +        - clock-names
> +        - clocks

IIUC, all variants require now clocks, so these two lines should be part
of top level "required:".

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,sm8250-lpass-va-macro
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          maxItems: 3
> +        clock-names:
> +          items:
> +            - const: mclk
> +            - const: core
> +            - const: dcodec
> +      required:
> +        - clock-names
> +        - clocks
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc8280xp-lpass-va-macro
> +              - qcom,sm8450-lpass-va-macro
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +          maxItems: 4
> +        clock-names:
> +          items:
> +            - const: mclk
> +            - const: npl

How about making it the last clock so the order matches with sm8250?


Best regards,
Krzysztof

