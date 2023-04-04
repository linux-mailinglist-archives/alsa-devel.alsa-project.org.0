Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D1F6D6B64
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 20:19:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 385711FB;
	Tue,  4 Apr 2023 20:18:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 385711FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680632351;
	bh=scBo9YtgZwWV5suQ3l92r4nDCPN9quY/NUjpy6AiJ8g=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y0CfseELhnm+LvMMhF2IkFelPrTdHOmgPMBc5+8RZjERmAOieeS/Rz/Yf4nQZtCqd
	 1i6IgN00LGobjeodqAGHgqFu5qMrtY0pwGvc5TfFEbMIRIP7yxf0n+9JjmfFvfQuJf
	 K/EjUTNT06z70XkrAbvTAoAg6JKiap+w5wBqUPJY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A119CF801C0;
	Tue,  4 Apr 2023 20:18:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22D94F8024C; Tue,  4 Apr 2023 20:18:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 221FBF8015B
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 20:18:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 221FBF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RQDpIhiU
Received: by mail-ed1-x536.google.com with SMTP id ew6so134116557edb.7
        for <alsa-devel@alsa-project.org>;
 Tue, 04 Apr 2023 11:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680632290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ir8YBxidmyDjL43kqs3HcIAsaJ4PKAEaZFGmGkOZQXg=;
        b=RQDpIhiUlw2Y9lmNTIPdcM7xe4l9Dps6+qTrp/9ViFNP8QnQo2FijSxlG1hENEX5Xs
         acL5CSJjeXPn67PV37G3MBVbxTIgf8Gs8cz1jlbMgNLLeGDfR5BoWHDcVMtsGXlL2ERx
         C71+sOz9RqE7YXUfDZ8VoHFQa5IcV8YsxlHbQ0Y+sdLCoDGKebETZl1gWiwllaF77z3J
         k05+fAr7959COxq5K20OpDlOI1/vR/cnxqxO3TQldUiAhSwwUQIAdXRTp3XgGgKaB8Bb
         hZejIAMAFjAXZ2ZtdYNMyjLxHG7xJoghF+50qfAvawxz5xvZ5Q1W+jKCyoGlav35iOjD
         bUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ir8YBxidmyDjL43kqs3HcIAsaJ4PKAEaZFGmGkOZQXg=;
        b=QWuAzqaEGpQpDqk5bVTXKja70XP1I1AhY2ZXzDIvUv90DosT1j3hVYa6Z3GGPmKhpn
         xYLVSJSwUFc9dNuk9i1W5szJzB1Q0DwPWVaDh1JopKuqn/JwcBwAMBCAk0kRvOorERWy
         UuR4lKRyPUL1VUy8VUK3x7BZztR3T6jjcZwONaA/ObSpdtobAnILAmzbxEyaqxOPhE7m
         MJ6HpXZOVIKpouVS6C9V1k2C+Kdli+EVGhdspaGr7oEwL586dr4nlwzHFn9xUO6imO92
         x1JLysemYfzeatXRr+vMlafW2UmCVmdjwsSqYJeDeYnCiJFexZ+DtzVskL4A7a/l8+JR
         vyRw==
X-Gm-Message-State: AAQBX9diXKX2GypPYr5fYm9GCYduj/4Jd/MzJ2Q7lBJ7eqcNshWa3qNO
	pxYcnRd5x8oKGyyljvQch9M/AQ==
X-Google-Smtp-Source: 
 AKy350bkUvS0cmR9W0/1DcwvNmjXy5ym8hk9TIiBhGi2hxcvCv/oMpUcbFc1uyOzsvXDN8o+6zOVQg==
X-Received: by 2002:aa7:cb47:0:b0:4fc:c7c8:e78d with SMTP id
 w7-20020aa7cb47000000b004fcc7c8e78dmr333454edt.31.1680632290425;
        Tue, 04 Apr 2023 11:18:10 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7467:56f4:40b7:cba8?
 ([2a02:810d:15c0:828:7467:56f4:40b7:cba8])
        by smtp.gmail.com with ESMTPSA id
 o1-20020a50c281000000b00502b0b0d75csm2190606edf.46.2023.04.04.11.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 11:18:10 -0700 (PDT)
Message-ID: <76a524a8-f87a-0147-32cd-5ef6cc55d2bc@linaro.org>
Date: Tue, 4 Apr 2023 20:18:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/7] dt-bindings: soundwire: qcom: add 16-bit sample
 interval
To: Rob Herring <robh@kernel.org>
References: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
 <20230403132503.62090-3-krzysztof.kozlowski@linaro.org>
 <20230404142159.GA3827653-robh@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230404142159.GA3827653-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NCG2RXKQKWUSGHBM7Z4EXWXAYV4YLQSM
X-Message-ID-Hash: NCG2RXKQKWUSGHBM7Z4EXWXAYV4YLQSM
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rao Mandadapu <quic_srivasam@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NCG2RXKQKWUSGHBM7Z4EXWXAYV4YLQSM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 04/04/2023 16:21, Rob Herring wrote:
>> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> index c283c594fb5c..883b8be9be1b 100644
>> --- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> +++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> @@ -86,7 +86,7 @@ properties:
>>    qcom,ports-sinterval-low:
>>      $ref: /schemas/types.yaml#/definitions/uint8-array
>>      description:
>> -      Sample interval low of each data port.
>> +      Sample interval (only lowest byte) of each data port.
>>        Out ports followed by In ports. Used for Sample Interval calculation.
>>        Value of 0xff indicates that this option is not implemented
>>        or applicable for the respective data port.
>> @@ -94,6 +94,19 @@ properties:
>>      minItems: 3
>>      maxItems: 16
>>  
>> +  qcom,ports-sinterval:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    description:
>> +      Sample interval of each data port.
>> +      Out ports followed by In ports. Used for Sample Interval calculation.
>> +      Value of 0xffff indicates that this option is not implemented
>> +      or applicable for the respective data port.
>> +      More info in MIPI Alliance SoundWire 1.0 Specifications.
>> +    minItems: 3
>> +    maxItems: 16
>> +    items:
>> +      maximum: 0xffff
> 
> Why not use uint16-array?

Because I am afraid it will grow in next version to 24 or 32 bits. I can
change easily maximum, but if I put here uint16-array, all DTS will have
/bytes 16/ annotation.


Best regards,
Krzysztof

