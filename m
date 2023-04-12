Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E62D6DFB13
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Apr 2023 18:17:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC0B81085;
	Wed, 12 Apr 2023 18:16:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC0B81085
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681316221;
	bh=1X6PfUaEcQ3RnF9mPI+o0WYyYGvqFqAUeXVehp71OHw=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=joXTU31HJ8t8KpW7UenexZoYixr262NZdN5mOj6E+mCMuEN8oPOVtMO99JRzDEkKb
	 ZPS9VT07tqBhk7bgJnNlXeEON+rtSd+ptoTm3x2gtHIeMmSFOLSHtO58Vf3WJSfJHE
	 hjropDASLI/+k+3L2fpPsrhW6DVjvR3seQxr19/4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E4FAF8025E;
	Wed, 12 Apr 2023 18:16:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2D1AF8032B; Wed, 12 Apr 2023 18:16:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76B1DF80149
	for <alsa-devel@alsa-project.org>; Wed, 12 Apr 2023 18:16:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76B1DF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=g7jiaNa/
Received: by mail-ej1-x630.google.com with SMTP id sg7so41622116ejc.9
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Apr 2023 09:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681316162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xKz2CfdmkyWEUAUCRBGTeQXDG/9nQXron/CwZa9Nm00=;
        b=g7jiaNa/w7rvSAY10RFzRhPYx6wX3SzW9Ltp47xv27yKDwNXQ8wwQshMGu1UwZBDnP
         nIoBoAzWw9eAyBnL5DQdKWgKntxvoQIFaEWI3xGsCqDukrJo9+ybXsuRl1On4LJbWSUJ
         Md8iI+45YnPbziICs08oDOd+jDcFsHhc6Vc+ESQUqAnauTaXLTnS5oab5edjyN4Kir+j
         1d71UXvEFipu+X9znuLgywbDpYEeANh+IyLOrDyESFwQ3IJnAP73JNvFiqdkvfmdtP0k
         tpgP+Ln/0OJW0PPvCjTmfjy8HcmYk/A44noUGcPZnR1PoP/iAyo8OdZgXB9zJmK3kzTz
         6jxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681316162;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xKz2CfdmkyWEUAUCRBGTeQXDG/9nQXron/CwZa9Nm00=;
        b=IxnnsZUcE7sS7WRaiUt5qLUtySeNa+/hmzOMdx+96A1lwiRiosvfsyVQ+KMAt3stlT
         dXUH9bwFIejiTfUv9KievRNiBwUOO+McQx0pIV0dtMWIwkH5EpcEKQiPKh+J/Buw7azG
         AfIRUwPagT8mLN9QEoTSeR9RuhlcUDRcyUPzn2+NrySKTYHguVZj4aMUDGHWFekRCN8j
         CF2+tfHbYQqDXJEHRhDMgFVfW/gO/8nKMhMWpL3K8oYNSPtGj6Oigl+7njUH4z2gPRJU
         DOy4cxTPUN+mlP+CsXqy9/LdTo6GGrQfqYapjZ0QzmUkYm3V+3E/LHZJtUtS+s1WRcqg
         H+mg==
X-Gm-Message-State: AAQBX9frsvohxD8ZotdnsBhBJPzEN1DrrngKLnudREINnNreIOvvZHAl
	XEEgwXfW9TkFm3+fSnbGiEfmxw==
X-Google-Smtp-Source: 
 AKy350Yl7iVyPSmeKdJ9g9LAu8gPmo81pX9ruC7lLLt8C82rDZNRUAlOPGbHNe3gHcL/ST8gYVF1ew==
X-Received: by 2002:a17:906:3b8f:b0:94a:6fc2:75b7 with SMTP id
 u15-20020a1709063b8f00b0094a6fc275b7mr10639381ejf.33.1681316162374;
        Wed, 12 Apr 2023 09:16:02 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:938a:b3db:7c59:795e?
 ([2a02:810d:15c0:828:938a:b3db:7c59:795e])
        by smtp.gmail.com with ESMTPSA id
 sa3-20020a1709076d0300b0094e4b8816e0sm1153036ejc.217.2023.04.12.09.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 09:16:01 -0700 (PDT)
Message-ID: <7c7afc80-713f-1949-4feb-f5f2d192569c@linaro.org>
Date: Wed, 12 Apr 2023 18:16:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 2/7] dt-bindings: soundwire: qcom: add 16-bit sample
 interval
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <94590a79-cae3-7b88-8f02-0c356adf06b7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7BCGUY4BBSLM6LVCRQ2KOJGVW6ZV5JRC
X-Message-ID-Hash: 7BCGUY4BBSLM6LVCRQ2KOJGVW6ZV5JRC
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7BCGUY4BBSLM6LVCRQ2KOJGVW6ZV5JRC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/04/2023 17:28, Srinivas Kandagatla wrote:
> 
> 
> On 03/04/2023 14:24, Krzysztof Kozlowski wrote:
>> The port sample interval was always 16-bit, split into low and high
>> bytes.  This split was unnecessary, although harmless for older devices
>> because all of them used only lower byte (so values < 0xff).  With
>> support for Soundwire controller on Qualcomm SM8550 and its devices,
>> both bytes will be used, thus add a new 'qcom,ports-sinterval' property
>> to allow 16-bit sample intervals.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   .../bindings/soundwire/qcom,soundwire.yaml    | 22 +++++++++++++++++--
>>   1 file changed, 20 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> index c283c594fb5c..883b8be9be1b 100644
>> --- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> +++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
>> @@ -86,7 +86,7 @@ properties:
>>     qcom,ports-sinterval-low:
>>       $ref: /schemas/types.yaml#/definitions/uint8-array
>>       description:
>> -      Sample interval low of each data port.
>> +      Sample interval (only lowest byte) of each data port.
>>         Out ports followed by In ports. Used for Sample Interval calculation.
>>         Value of 0xff indicates that this option is not implemented
>>         or applicable for the respective data port.
>> @@ -94,6 +94,19 @@ properties:
>>       minItems: 3
>>       maxItems: 16
>>   
>> +  qcom,ports-sinterval:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> 
> Should this not be ref: /schemas/types.yaml#/definitions/uint16-array ?

Same answer as for Rob:

Because I am afraid it will grow in next version to 24 or 32 bits. I can
change easily maximum, but if I put here uint16-array, all DTS will have
/bytes 16/ annotation.

Best regards,
Krzysztof

