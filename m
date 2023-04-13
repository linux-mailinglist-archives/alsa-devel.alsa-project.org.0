Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF1F6E0C31
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 13:13:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B281EC9;
	Thu, 13 Apr 2023 13:12:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B281EC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681384398;
	bh=vutm/Pd+3B2iARTK1kTMQThnUcKA3UjpxGy9wFwhCk4=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bBeGx6qKnerhuy8mkCrbhNkXZ6KJSNt3cSXHfXDGfq20dtCjlRZ7cBMxN3mlsyJ5T
	 hXdudbgDlSR8LkGffCFeehID952tDL660E0T5ZzLMacyZw6QKvN9lV4N9zZSEQj31O
	 BBjpK0tUeUXJRzg5PyLLefXS8c1/i9OpDRnpoUus=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 364F6F8023A;
	Thu, 13 Apr 2023 13:12:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C32C3F8032B; Thu, 13 Apr 2023 13:12:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5010DF800E5
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 13:12:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5010DF800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=k41bUmuu
Received: by mail-wr1-x432.google.com with SMTP id w24so4230329wra.10
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Apr 2023 04:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681384341; x=1683976341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QArK/FYVA8r4jHMgxjz+s5Hgq6dOuc63XEe7lmAWZVQ=;
        b=k41bUmuuwfM1btMOKkxoehhXgXxjhJcpDNZ+tOwc0USDBlyDnQSDMbiFA2w0O+mYTA
         Skeo4ykHdzNaFkiON1NBc6Q5UbdOQQ1B+eQh06KYoaRrqqXjhGqF143wNUBvyNW1rsQ1
         9PyNa6doco5cnifjr8dZENnaXSiCcU3cpADCd17X2e2R1mU3fDbkRLFvtP0RSsvhDUaM
         h8hMInV4tCjyHEhwsPGwn6Wwi88Jm4hKdt6AaG3RbNMN9HWd2W8brTFgzpveNzH8pYxF
         SeueAnnBjaorYeJiy02fAgYcPMM0JSZoK+u/O3AYSw6IkXEDONYJmBGrIpcZqrUk5h1X
         IP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681384341; x=1683976341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QArK/FYVA8r4jHMgxjz+s5Hgq6dOuc63XEe7lmAWZVQ=;
        b=LAsYdURwabG2AizXIQwPt47sjGy6QWs6vvuUwISZY9j5/bJ7M/s7NSPlxS5yr1dbVe
         i+in+uJzKRfOR7aLLBtjCtQKQHpRer/ED2JekLoptAFH0k8yeth+48sZjBKZsVevyI+8
         6pB1b7D3LjI44V890kQc2LyRcB2embL0iuGP8bO+jtTNGikslf97KuwRIn8K81noLTfW
         dweVrf2ZxvKPm70chDEdETTm2keUCrTbYc3U6EC55xh0Fs5zzATiqWjJz8QzL3TnfnRj
         3hUGMak2P0p4Xq4Nkq3RK++o06dmlPNVsULcXTDmf1CvN+EdDI/Xai9PTv41/ux5MBcd
         hW+w==
X-Gm-Message-State: AAQBX9ciVmax+UM4yMq0D76tvObYObxi/Ipozi/Zf11mWC/I+LcsXM32
	00WqNYeGXwic9KpYvoznMx8w2Q==
X-Google-Smtp-Source: 
 AKy350ao9yolIef91UMqjque+KErSt6pLHDXQB1aEkBr6cmmLqvMkHUHWz42eqTmRHczBtxsHIAyLA==
X-Received: by 2002:a05:6000:1b8c:b0:2f4:d4a3:c252 with SMTP id
 r12-20020a0560001b8c00b002f4d4a3c252mr1304177wru.3.1681384341423;
        Thu, 13 Apr 2023 04:12:21 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 c14-20020adfe74e000000b002cefcac0c62sm1093126wrn.9.2023.04.13.04.12.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 04:12:20 -0700 (PDT)
Message-ID: <9156affd-7f08-282b-ee65-ae82f4d94cbc@linaro.org>
Date: Thu, 13 Apr 2023 12:12:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/7] dt-bindings: soundwire: qcom: add 16-bit sample
 interval
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Rao Mandadapu <quic_srivasam@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20230403132503.62090-1-krzysztof.kozlowski@linaro.org>
 <20230403132503.62090-3-krzysztof.kozlowski@linaro.org>
 <94590a79-cae3-7b88-8f02-0c356adf06b7@linaro.org>
 <7c7afc80-713f-1949-4feb-f5f2d192569c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <7c7afc80-713f-1949-4feb-f5f2d192569c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AAPCVJJBALBDDK4FI62ND6VQTVYU64QA
X-Message-ID-Hash: AAPCVJJBALBDDK4FI62ND6VQTVYU64QA
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AAPCVJJBALBDDK4FI62ND6VQTVYU64QA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/04/2023 17:16, Krzysztof Kozlowski wrote:
> On 12/04/2023 17:28, Srinivas Kandagatla wrote:
>>
>>
>> On 03/04/2023 14:24, Krzysztof Kozlowski wrote:
>>> The port sample interval was always 16-bit, split into low and high
>>> bytes.  This split was unnecessary, although harmless for older devices
>>> because all of them used only lower byte (so values < 0xff).  With
>>> support for Soundwire controller on Qualcomm SM8550 and its devices,
>>> both bytes will be used, thus add a new 'qcom,ports-sinterval' property
>>> to allow 16-bit sample intervals.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>    .../bindings/soundwire/qcom,soundwire.yaml    | 22 +++++++++++++++++--
>>>    1 file changed, 20 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>>> index c283c594fb5c..883b8be9be1b 100644
>>> --- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>>> +++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>>> @@ -86,7 +86,7 @@ properties:
>>>      qcom,ports-sinterval-low:
>>>        $ref: /schemas/types.yaml#/definitions/uint8-array
>>>        description:
>>> -      Sample interval low of each data port.
>>> +      Sample interval (only lowest byte) of each data port.
>>>          Out ports followed by In ports. Used for Sample Interval calculation.
>>>          Value of 0xff indicates that this option is not implemented
>>>          or applicable for the respective data port.
>>> @@ -94,6 +94,19 @@ properties:
>>>        minItems: 3
>>>        maxItems: 16
>>>    
>>> +  qcom,ports-sinterval:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>
>> Should this not be ref: /schemas/types.yaml#/definitions/uint16-array ?
> 
> Same answer as for Rob:
> 
> Because I am afraid it will grow in next version to 24 or 32 bits. I can
> change easily maximum, but if I put here uint16-array, all DTS will have
> /bytes 16/ annotation.
> 
As per MiPi Specs the sample Interval is an integer in the range 2 to 
65535. I don't see a value in making this u32, other than adding some 
confusion by deviating from specs.

--srini

> Best regards,
> Krzysztof
> 
