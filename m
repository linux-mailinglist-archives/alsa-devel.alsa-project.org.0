Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C63B1625CDE
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 15:22:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 674E71FC;
	Fri, 11 Nov 2022 15:22:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 674E71FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668176576;
	bh=LuC81ZysTTKBL4j1yCXfabyMrzQDPOGqcRsNsKYRMdw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j7HcZPqfVemkj3wZKx++5bzgc3Y7qobBj9leOKuBoQ5Z8iWKdyjVDOcPat1BKevyi
	 JSU3iZ0ab0rZxMep31rDpyX5AzyL/Y7BkX+9gVX2Fl1dK7PgXSwf1UMVKqtz9aIV0G
	 2qUVX/00R4iJ+kxWSbUMsFcGh8LFeW3nahdvivF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC80DF804AB;
	Fri, 11 Nov 2022 15:22:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FB4FF8028D; Fri, 11 Nov 2022 15:21:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 238B8F800CC
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 15:21:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 238B8F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="qir1itbo"
Received: by mail-lj1-x235.google.com with SMTP id t10so4712911ljj.0
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 06:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lizn4t8CzEeOAb2NOrW1eGO8GRE54jSk5eHBfoX7CCY=;
 b=qir1itbo7SLIojVnuniP/lKKgJq9TuBceKLm30rtveqOll+AEFS4SYwDX4QIuW3shO
 x4jQasyhXZxNK8ihBC5IaSbf1Ljx3yzyW5V162Usc7AqfrOVidzgLPtuuHT02iGN3JkO
 vvkE6cs+a0r7VD5AT09LEk61y6Up0KR2+zspM0mhnP086VsRZyE3XDwbUvD4ia/CFMmA
 fV5iRUzLSUPA2brZROmg3t+gbc2j1NQ1IgzLyAac+9ZqqHiib1IkNQYRWoUvfOq8Ge/G
 fTDiT39cOrORSMM2/4utHqkBzg1eAAalO/kxDP/rXWYe3+htkHUkE0rXs7201C+LoVdb
 ATdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lizn4t8CzEeOAb2NOrW1eGO8GRE54jSk5eHBfoX7CCY=;
 b=nq3oiueQQUGzuD5pnSbV0zAYteNL2zMxiOjolYpgrZ5iBfOkAay0qaUvQnoSBXGDZd
 RJr4VIt6r3YdfYzK8lbwz1PimMcLj04Imlp1a2QaGCZYZo9k1v/2F9oKzPCOWejbjryM
 y/kJ8PuweQCuhCV9GNqd9p0VmEWDcvn/SnrGkMXoOq/isSD/Vb0UzigyVidpaZEvUAb1
 NvUFOXFrIbqimRvcHi3ShoCOcrYjMXabn2fTzvjnfHvKRzxxxxxYFYg3Rt3LH58wIFf8
 I9dN8EsIcp/lAXF1Brfk8ThOhSxm1lrGBYQ2joTR/Bzh7eLxNwXO3oAynbcpUqoFX3L3
 6Q+g==
X-Gm-Message-State: ANoB5pngAgwXSIzLtWKHOapoy28uMLwJPXktu7QQvsfN2MkmcWTAc42s
 tF58OVVwMY1wu/5ll5I8/smW4g==
X-Google-Smtp-Source: AA0mqf4u3FCA6Q7ZvIrElwMeHaK0OuMQqzCJGs2cKMdDsSQw3WGaxaJ6fIuzSGrVM7neb1mCUweWPw==
X-Received: by 2002:a2e:9d51:0:b0:277:1e3e:fa60 with SMTP id
 y17-20020a2e9d51000000b002771e3efa60mr675393ljj.496.1668176510760; 
 Fri, 11 Nov 2022 06:21:50 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05651205c600b0048a8c907fe9sm347374lfo.167.2022.11.11.06.21.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 06:21:50 -0800 (PST)
Message-ID: <f7be60a6-ea1d-838a-ef50-d324d918db86@linaro.org>
Date: Fri, 11 Nov 2022 15:21:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 02/10] ASoC: dt-bindings: qcom,apr: Split services to
 shared schema
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
 <20221111113547.100442-3-krzysztof.kozlowski@linaro.org>
 <166817308876.3060199.17933327732327950670.robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <166817308876.3060199.17933327732327950670.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, Banajit Goswami <bgoswami@quicinc.com>,
 Patrick Lai <plai@qti.qualcomm.com>,
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

On 11/11/2022 14:30, Rob Herring wrote:
> 
> On Fri, 11 Nov 2022 12:35:39 +0100, Krzysztof Kozlowski wrote:
>> The APR/GPR nodes are organized like:
>>
>>   apr-or-gpr-device-node <- qcom,apr.yaml
>>     apr-gpr-service@[0-9] <- qcom,apr.yaml
>>       service-specific-components <- /schemas/sound/qcom,q6*.yaml
>>
>> The schema for services (apr-gpr-service@[0-9]) already grows
>> considerably and is still quite not specific.  It allows several
>> incorrect combinations, like adding a clock-controller to a APM device.
>> Restricting it would complicate the schema even more.  Bringing new
>> support for sound on Qualcomm SM8450 and SC8280XP SoC would grow it as
>> well.
>>
>> Simplify the qcom,apr.yaml by splitting the services to a shared file
>> which will be:
>> 1. Referenced by qcom,apr.yaml with additionalProperties:true,
>> 2. Referenced by specific bindings for services with
>>    additionalProperties:false (not yet in this commit).
>>
>> While moving the code, add also required 'reg' and
>> 'qcom,protection-domain' to further constrain the bindings.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/soc/qcom/qcom,apr-services.yaml  |  54 +++++++++
>>  .../bindings/soc/qcom/qcom,apr.yaml           | 108 +-----------------
>>  MAINTAINERS                                   |   2 +-
>>  3 files changed, 58 insertions(+), 106 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/soc/qcom/qcom,apr.example.dtb:0:0: /example-0/apr/service@3: failed to match any schema with compatible: ['qcom,q6core']
> Documentation/devicetree/bindings/soc/qcom/qcom,apr.example.dtb:0:0: /example-0/apr/service@4: failed to match any schema with compatible: ['qcom,q6afe']
> Documentation/devicetree/bindings/soc/qcom/qcom,apr.example.dtb:0:0: /example-0/apr/service@7: failed to match any schema with compatible: ['qcom,q6asm']
> Documentation/devicetree/bindings/soc/qcom/qcom,apr.example.dtb:0:0: /example-0/apr/service@8: failed to match any schema with compatible: ['qcom,q6adm']

This is expected. I should have mention maybe in commit msg that these
compatibles are being removed in this commit and re-added in further
commits. Change is therefore not entirely bisectable, but should be
easier for review.

If desired, I can squash these commits.

Best regards,
Krzysztof

