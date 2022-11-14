Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAB9627C8C
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 12:41:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0BA81666;
	Mon, 14 Nov 2022 12:41:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0BA81666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668426117;
	bh=YMJmBE04ZE7YLPRIf2XTriTsb2zchuPm2CBn0hA1XNY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CeiF8GBIuLyAtB6uCBTrL0WBUD/GJ4AjBdayzG4ftVfMFhHLcLwZT2PuCKJpStM44
	 kdZN99X2xyT7g683L+iHABaIfC3ATYIhwVV6zwAOWgPEB7LuDgdwvPau9DH6EOAQY5
	 GBIDrcF+fO8Kc+qsXU0SSMJXmZ4Z1Udh1iIyX7i4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77873F800AA;
	Mon, 14 Nov 2022 12:41:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AE2CF80431; Mon, 14 Nov 2022 12:41:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B272FF800AA
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 12:40:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B272FF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QmW79Pi/"
Received: by mail-wr1-x435.google.com with SMTP id w14so17666086wru.8
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 03:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HD1FJFbm4qiZjnfWZv0nv02BdZLPwZIxvvXLBcQxcA0=;
 b=QmW79Pi/kv1ijN/1fegsnzJHDHy3kLhMK5xERnfBLW2M0pZRGeAj1t27J/Oitxj/7g
 SG4XgfHWHcYusKaWxzs8mbsyMyfKVyFe0rim95+XX5d9lj4SBjwRUG4vspeAn/Vw96bY
 /5oy1I22lKS0ag4QNAyM6CfxxyYrOAG2JgyF4f1uepWaW5gL1lw1V/46Zziglr4Iv4LT
 gn4UPpVWv5WeJXmDfwWgOJ8KQTBmhnOBjwc88b8/YvtKuy4cnImwecsto9d9Haovdvrq
 1WCMRLaGdNwVNcWxjeSGjndiK2bcshHuqv+WzxrzMLB4j6c1/1a3oqB4eiSDGjpJ050x
 IPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HD1FJFbm4qiZjnfWZv0nv02BdZLPwZIxvvXLBcQxcA0=;
 b=FbicaA4i70o62yd+Y5dyjwghleei9yGeeYLvQEldCGfueDLQOOMssyYfbhGEmrEi4i
 LfgXXJywC+hyRMfSydVM09ubIP9THVbMUVfOWLq/IB4/aNNT7p9vZ9+bL0TVR2Xm/lHQ
 harKwe6OboOw5qWjzTnt28UjUWlVAv7vbLPSOqkMwwRx66s0/sokPqg8svwfDfS47G1l
 MSl8YCTAXmxhPKXUaU450xKPkSH++DRMMbpeGGLo9JJjpQyUYH0m7QrUGewWlS8Wt3Ya
 JF55cVYdEY9DXJmji3OFt7Sf3np0/cJEUQQJeA1DeW3lXN1ADvGF2jwDYa0qGbpq/QqL
 I9sw==
X-Gm-Message-State: ANoB5pki/NXgDnNhms0cO3d6qMlkC0T+NUzwkOKdBWzV0s49YLOajXwB
 8KbuKu+xFYBga3YNqwwuqUOqTQ==
X-Google-Smtp-Source: AA0mqf7w6FsqMHPLvaGe1VAW4QNqBhCJzebNX55AWaprvEM0JnmljxZjn1eeQRgPy1WX1yhoGrB/fQ==
X-Received: by 2002:adf:cd91:0:b0:241:695c:4eec with SMTP id
 q17-20020adfcd91000000b00241695c4eecmr7437995wrj.174.1668426052149; 
 Mon, 14 Nov 2022 03:40:52 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 z15-20020a056000110f00b0022a3a887ceasm9327509wrw.49.2022.11.14.03.40.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 03:40:51 -0800 (PST)
Message-ID: <cf66aa8f-4bf7-d9c0-e2ae-b6fced7e4948@linaro.org>
Date: Mon, 14 Nov 2022 11:40:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 10/10] ASoC: dt-bindings: qcom,q6apm: Add SM8450 bedais
 node
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
 <20221111113547.100442-11-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20221111113547.100442-11-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 11/11/2022 11:35, Krzysztof Kozlowski wrote:
> On SM8450 and SC8280XP, the Q6APM is a bit different:

This is not specific to SM8450 or SC8280XP its part of AudioReach apm 
which deals with both backends and pcm.

In old Elite architecture we had a dedicated service AFE to deal with 
Backend dais, now APM does all.

Thanks,
Srini

> 1. It is used as a platform DAI link, so it needs #sound-dai-cells.
> 2. It has two DAI children, so add new "bedais" node.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../devicetree/bindings/sound/qcom,q6apm.yaml    | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
> index 7acb832aa557..cd434e8268ce 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
> @@ -18,14 +18,24 @@ properties:
>       enum:
>         - qcom,q6apm
>   
> +  bedais:
> +    type: object
> +    $ref: /schemas/sound/qcom,q6apm-lpass-dais.yaml#
> +    unevaluatedProperties: false
> +    description: Qualcomm DSP audio ports
> +
>     dais:
>       type: object
>       $ref: /schemas/sound/qcom,q6apm-dai.yaml#
>       unevaluatedProperties: false
>       description: Qualcomm DSP audio ports
>   
> +  '#sound-dai-cells':
> +    const: 0
> +
>   required:
>     - compatible
> +  - bedais
>     - dais
>   
>   unevaluatedProperties: false
> @@ -41,11 +51,17 @@ examples:
>           service@1 {
>               reg = <GPR_APM_MODULE_IID>;
>               compatible = "qcom,q6apm";
> +            #sound-dai-cells = <0>;
>               qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>   
>               dais {
>                   compatible = "qcom,q6apm-dais";
>                   iommus = <&apps_smmu 0x1801 0x0>;
>               };
> +
> +            bedais {
> +                compatible = "qcom,q6apm-lpass-dais";
> +                #sound-dai-cells = <1>;
> +            };
>           };
>       };
