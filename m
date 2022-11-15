Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF366295B4
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 11:23:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD5F0168A;
	Tue, 15 Nov 2022 11:22:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD5F0168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668507822;
	bh=ucRdTTYbLWQYq56mmOaS9jekkaftU9L8G4/qRxay4qk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NxXkIgLpD60j4U2N8zzZ26RF+QqyBxjCvfnoDzASMZ1GHYBkQ4ei3ZIX7waQomKEo
	 SUXUaBAF2UhT9THBJdq615yG35Di6OhO1BunZYBraWkqn9761B/NZb4LFge81MIC2G
	 U/H/lyb7O4tKZFFyf4pnz5PieKITm6b8WeGF/bjs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A19FF800AA;
	Tue, 15 Nov 2022 11:22:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A84AF80171; Tue, 15 Nov 2022 11:22:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10C11F800B5
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 11:22:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10C11F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="URWmS52K"
Received: by mail-lf1-x12b.google.com with SMTP id g7so23733693lfv.5
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 02:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3ZbREAzKGWsIEWUQJpy4XElK+ime7W53jXwcpw2dqzo=;
 b=URWmS52KU77TWjmjG6UB4lH6yXLsHtFdFoDjqDZDTqW8s8fgbpukZVncpNKzxXkXiK
 Ig37LGNmjMnu1U2f/1pomq95OJLikyGVyB+4ABQ0POWetHCFlHhL94EXdNn5+7UpOX4Q
 ZhKHee8n+38c/rLKiVvjJQ8SSexQrhnSFzsNoRNLejRYqPK/7mdYwYG5stAufYWtyK+O
 7jp0YZoE+rK/1zIWDtCV4jMq6ttRkqDgjFxIo/+bG5zNIpxmTe73E5QIux/rYqHA+M0n
 +w4RiGEYZ599h0aPvRTuCJ4evleTgjqQ/pZsMEpOn1E4kCr2nM6UkMljIEeQgqCv7ecL
 Mx8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3ZbREAzKGWsIEWUQJpy4XElK+ime7W53jXwcpw2dqzo=;
 b=V/uC5CuWWdgqnqaG+8RjaDsDNGQy2AnpyS0bkrPGx4QfRbOaNoWQQhK8rOABxoIeax
 dDjLAX7zkw3N/xTzP+q8Gg9rEbXI5EG4as+3OndTwyw4Tgz0TdwlpPF0yi5SF8UNbyRr
 PQRD4lne+2iEicmK2OeGLrZxw+0idmP+h/b509Djl5I+ZnRDfhdHmVtucFDtLDzQ1K6z
 pTqv/oMULuKKolfAXfNucrhUdmsF1ehxwAIDHvB+0gA2x1XJ0+XBc1FP2IVhR/yQgMEI
 +6diCw9n9G2HkUY61pnG0o5WcvYj7TQuqiUK3j9uvf4/r4FnX2IaA1Ub7AElawx0hRT0
 Za8Q==
X-Gm-Message-State: ANoB5pnvpWmGNsUw0KUYqF6nnHf2lxnnAtfL9f0CD/BJJ+MX5b34R2Xg
 Qi7/sj/RgaQGS4JAMXCoLymaPA==
X-Google-Smtp-Source: AA0mqf7Eoob8tu5VvSML0bCXRs+5OlrwB4RhRTonYV8TvWwQfLAeC7eqY+781izx5/9lW5imSf++mA==
X-Received: by 2002:a05:6512:258f:b0:4af:ad16:8a08 with SMTP id
 bf15-20020a056512258f00b004afad168a08mr5231106lfb.664.1668507761001; 
 Tue, 15 Nov 2022 02:22:41 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 c18-20020ac25f72000000b00492dc29be7bsm2148197lfc.227.2022.11.15.02.22.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 02:22:40 -0800 (PST)
Message-ID: <5dae76ba-bd48-233d-4d4a-14111ff1b2ec@linaro.org>
Date: Tue, 15 Nov 2022 11:22:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 02/10] ASoC: dt-bindings: qcom,apr: Split services to
 shared schema
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
 <20221111113547.100442-3-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221111113547.100442-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Patrick Lai <plai@qti.qualcomm.com>,
 Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>
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

On 11/11/2022 12:35, Krzysztof Kozlowski wrote:
> The APR/GPR nodes are organized like:
> 
>   apr-or-gpr-device-node <- qcom,apr.yaml
>     apr-gpr-service@[0-9] <- qcom,apr.yaml
>       service-specific-components <- /schemas/sound/qcom,q6*.yaml
> 

(...)

> +additionalProperties: true
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
> index 0a7a34cb2497..9302ffe567d6 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
> @@ -80,115 +80,13 @@ properties:
>    '#size-cells':
>      const: 0
>  
> -#APR/GPR Services
>  patternProperties:
>    "^service@[1-9a-d]$":
>      type: object
> +    $ref: /schemas/soc/qcom/qcom,apr-services.yaml
> +    additionalProperties: true
>      description:
> -      APR/GPR node's client devices use subnodes for desired static port services.
> -
> -    properties:
> -      compatible:
> -        enum:
> -          - qcom,q6core
> -          - qcom,q6asm
> -          - qcom,q6afe
> -          - qcom,q6adm
> -          - qcom,q6apm
> -          - qcom,q6prm

I think that this piece could stay here. Otherwise we allow any
compatible which matches the qcom,apr-services.yaml binding, but that's
easy to achieve.

Best regards,
Krzysztof

