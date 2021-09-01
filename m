Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C33963FDDD0
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 16:30:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51406174C;
	Wed,  1 Sep 2021 16:29:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51406174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630506621;
	bh=ROarUGGhZo6nMph8LIRFfdRnsCV5MZeK9OUor1VlQpM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cN0BPk1f0tF8r+F++ivFuVvFpUr4yVENPZTwgoJL3w9NXGBtaygU9GEd5WJBQ2Mde
	 CwRnG8ZcfpY5V68y+sXKI66BYDWCzYwE8qnunWlA0D+MAlO9KHulpypDtAAXJByBGp
	 pndh8xTpGgTs2bwSMxaGRb2vEFEIu58Psb+cAqD4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29E4DF8020D;
	Wed,  1 Sep 2021 16:28:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D5FDF80256; Wed,  1 Sep 2021 16:28:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45F6FF80218
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 16:28:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45F6FF80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="oVfDLZKq"
Received: by mail-wr1-x432.google.com with SMTP id u9so4802186wrg.8
 for <alsa-devel@alsa-project.org>; Wed, 01 Sep 2021 07:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SrfHFEqlK9Hqt9lK1GHUvYZLhZ+zB9oUHgZgCIL0xLQ=;
 b=oVfDLZKq+2kKz2ycYpNYxPRHY46TOrpndiGdLJIuejoZegpoVsZJ/P+KWjXOix9ER9
 ainOtq3IjXyMkd0YNCqq6bhdwKXpcA9VY/4phP6Zxhi1trlOYRfJwaHlnWh94JfaMi0m
 tUr9YBUg2RVGRaUkrGgyFJC3Y9dWxBgMGLPBwqP+6BcPzIUQre9GsbiqBQyMAcXwvXfZ
 Dfk9zUufTO/X0dCmOueEfe95hb5B13eOxRKYYWB1ikT0EWTUPU/pJ61tGqKt2kpHNVk0
 nVV7AXOPWtReh3rdUADHUM0iu2CK+9A/jz+/bfNG0YbuUnHb+DUXBvyPfnmJVy+DYDCE
 recQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SrfHFEqlK9Hqt9lK1GHUvYZLhZ+zB9oUHgZgCIL0xLQ=;
 b=p5uiQt5aW50x09eaJYY+R38cGF1/FchkuuLjD3QVXaXuu31mIP0a45L0LRPuMj3/QP
 45TnCCFXNCAX2bfhU/O66PJ+cqhpM5xii1EHE9B+p3iKJ/sktBxzcqHPRsa0rfyHljvM
 N5o5yDOJxCGCX+mrbexi12u8vzWe7KD5ZXBIQVrCZwIWGQA7s7tk7/9jhCyubJ/I4mfp
 +x1YhK1tMw/fped/RvZGoJ8U/WRl1krvQe4Hph8iT/g5ENnpIGpfIwHW203cLzPAsssy
 cte8QC1KALHAe/372DPEG2wtbJmLyNmbkjdmsOOvHONabValRu4EorCzLVRDlOKg9RVN
 0qsg==
X-Gm-Message-State: AOAM531MAULAWrLIcvKxRaqNEVmA9Med1MrH8Y593YJUIhbj1U1VxBOV
 Bj3rcRcmfGV9gzee8pSNEZ9C2g==
X-Google-Smtp-Source: ABdhPJyg1LldOd2tXZfEey27anScHEr6Oii/Wn3DAjKIun1igN6v8g8WATudtI7LrnKgYHPsKnRrxQ==
X-Received: by 2002:adf:f984:: with SMTP id f4mr37735320wrr.331.1630506500183; 
 Wed, 01 Sep 2021 07:28:20 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id b18sm21651601wrr.89.2021.09.01.07.28.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 07:28:19 -0700 (PDT)
Subject: Re: [PATCH v4 01/20] soc: dt-bindings: qcom: apr: convert to yaml
To: Rob Herring <robh@kernel.org>
References: <20210809112339.8368-1-srinivas.kandagatla@linaro.org>
 <20210809112339.8368-2-srinivas.kandagatla@linaro.org>
 <YRbwyIYt4YdzAbqj@robh.at.kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ab5238bb-5cb9-0292-09ef-747a497236e8@linaro.org>
Date: Wed, 1 Sep 2021 15:28:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRbwyIYt4YdzAbqj@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com, broonie@kernel.org, bjorn.andersson@linaro.org
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

Thanks Rob for the review,

On 13/08/2021 23:23, Rob Herring wrote:
> On Mon, Aug 09, 2021 at 12:23:20PM +0100, Srinivas Kandagatla wrote:
>> Convert APR bindings to yaml format so that we could add new bindings support.
>>
>> All the dsp services bindings are now part of apr bindings instead
>> of adding them to audio bindings.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   .../devicetree/bindings/soc/qcom/qcom,apr.txt | 134 ------------------
>>   .../bindings/soc/qcom/qcom,apr.yaml           | 127 +++++++++++++++++
>>   2 files changed, 127 insertions(+), 134 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
>>   create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
>> deleted file mode 100644
>> index 2e2f6dc351c0..000000000000
>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.txt
>> +++ /dev/null
>> @@ -1,134 +0,0 @@

...

>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
>> new file mode 100644
>> index 000000000000..12650f7084f4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
>> @@ -0,0 +1,127 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/soc/qcom/qcom,apr.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Qualcomm APR (Asynchronous Packet Router) binding
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> +
>> +description: |
>> +  This binding describes the Qualcomm APR, APR is a IPC protocol for
>> +  communication between Application processor and QDSP. APR is mainly
>> +  used for audio/voice services on the QDSP.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,apr
> 
> This wasn't a valid compatible before.

True, Will remove that in next version.
> 
>> +      - qcom,apr-v2
>> +
>> +  qcom,apr-domain:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [1, 2, 3, 4, 5, 6, 7]
>> +    description:
>> +      Selects the processor domain for apr
>> +        1 = APR simulator
>> +        2 = PC Domain
>> +        3 = Modem Domain
>> +        4 = ADSP Domain
>> +        5 = Application processor Domain
>> +        6 = Modem2 Domain
>> +        7 = Application Processor2 Domain
>> +
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +#APR Services
>> +patternProperties:
>> +  "^apr-service@[0-9a-e]$":
> 
> Based on reg, this should be: [3-9a-d]

Sure, will fix that.

> 
>> +    type: object
>> +    description:
>> +      APR node's client devices use subnodes for desired static port services.
>> +
>> +    properties:
>> +      compatible:
>> +        enum:
>> +          - qcom,q6core
>> +          - qcom,q6asm
>> +          - qcom,q6afe
>> +          - qcom,q6adm
>> +
>> +      reg:
>> +        enum: [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
>> +        description:
>> +          APR Service ID
>> +            3 = DSP Core Service
>> +            4 = Audio  Front End Service.
>> +            5 = Voice Stream Manager Service.
>> +            6 = Voice processing manager.
>> +            7 = Audio Stream Manager Service.
>> +            8 = Audio Device Manager Service.
>> +            9 = Multimode voice manager.
>> +            10 = Core voice stream.
>> +            11 = Core voice processor.
>> +            12 = Ultrasound stream manager.
>> +            13 = Listen stream manager.
>> +
>> +      qcom,protection-domain:
>> +        $ref: /schemas/types.yaml#/definitions/string-array
>> +        description: protection domain service name and path for apr service
>> +          has dependency on.
>> +        items:
>> +          - const: avs/audio
>> +          - const: msm/adsp/audio_pd
> 
> You've dropped a bunch of possible values.
> 
PDR services used for APR driver are only these two audio services.
so the others are really list of other services that APR driver will not 
using.

I can retain them as it was before, but we can tidy this list up in a 
cleanup patch later.

--srini

>> +
>> +      '#address-cells':
>> +        const: 1
>> +
>> +      '#size-cells':
>> +        const: 0
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - qcom,apr-domain
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/soc/qcom,apr.h>
>> +    apr {
>> +        compatible = "qcom,apr-v2";
>> +        qcom,apr-domain = <APR_DOMAIN_ADSP>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        q6core: apr-service@3 {
>> +          compatible = "qcom,q6core";
>> +          reg = <APR_SVC_ADSP_CORE>;
>> +          qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>> +        };
>> +
>> +        q6afe: apr-service@4 {
>> +          compatible = "qcom,q6afe";
>> +          reg = <APR_SVC_AFE>;
>> +          qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>> +        };
>> +
>> +        q6asm: apr-service@7 {
>> +          compatible = "qcom,q6asm";
>> +          reg = <APR_SVC_ASM>;
>> +          qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>> +        };
>> +
>> +        q6adm: apr-service@8 {
>> +          compatible = "qcom,q6adm";
>> +          reg = <APR_SVC_ADM>;
>> +          qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
>> +        };
>> +    };
>> -- 
>> 2.21.0
>>
>>
