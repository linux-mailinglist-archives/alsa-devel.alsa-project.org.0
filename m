Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DBD3C4605
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 10:21:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D521E112;
	Mon, 12 Jul 2021 10:20:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D521E112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626078108;
	bh=+yJ3se6ffCu//qm7SNYSoXVdOUdYef3z72HQUHVON0w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IVkaa4meSkMed53FJ16ufFv8ur/fRirt/qs+C2iBnfyT0oe3Lt9tTUCk9No80AIdB
	 DKCuj+7+mcaQMP3ziHH/Qx0n+Vevu2wX98C+ceLTZz4cUwlGPj4tyJm4MWFBmdCqML
	 8tJHB7oeTbngMgueik5PtShGAtQtfihSdTojRM7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5210EF800EB;
	Mon, 12 Jul 2021 10:20:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1798F80254; Mon, 12 Jul 2021 10:20:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB525F8020C
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 10:20:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB525F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yMbiRrkK"
Received: by mail-wr1-x430.google.com with SMTP id f9so18708429wrq.11
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 01:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QHlXmzgYCLaFP1mLbFA9jYRGoFSwRmofbpKvixQG/EI=;
 b=yMbiRrkK9/p9xrQb7LoiVYsjj5zamGuNpJL7hkzXR9PRv/PUPitBCo++JtpQmmd/ka
 6qHtckH08lUFQSMSHh3dAIHIAhkr6AmICHeSISiWigsFjtxk00z0rCEiT9B54Bp9VwuD
 bB/lI+v+JXFE5zi10vUQ+vl254Sb88K4amHRiChE4IvI7FJr5dogbHAGJZFBv+qUlery
 crUa7mjG/txRYUi8qXATkeKsJ6TAIWifROmMeJgJPZ+JL9FuNHHlr4YxJYWA+FWJyGCq
 K1mYySgLKsrQohHHKztgKDa+wIQ1hnDTNSBpNMlR2F93lpjWz9uYcvYxXU36gNzk16jM
 9nhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QHlXmzgYCLaFP1mLbFA9jYRGoFSwRmofbpKvixQG/EI=;
 b=NnWf/RPWPpP7Kprx3wYlXxJB6vhcAyRZIYoSv//9sTa4T2INFG7XlBcZCiKFQEqzdJ
 Q8n3ff1uB2kkJ+kl+OyA/wIIZr2yZcMT7785N1pmmUzgVXxzS0Ca+Cw90zTV27Hca3VU
 PHNp/uFwDYkk3m3Ftrn8llpjKVfyM2zPYqZB01xpTaKQN7Q9tuoLj2a0YtvIjMz3GbVy
 0tKixgPCMLzhbG/nlHHswjwndsE7gtU9WLWii2e6cXxXg9CjRLpRybvaqO/JIOfuavIJ
 4olWnG2RC0aQbOV+scg25RErLAf0H8SxSkTyIdTDV4m6JDrg3kpY4R2ve79jP3X70bya
 VUMg==
X-Gm-Message-State: AOAM532r7gfKxP9xNqt7XwhVEum6AZF/dfvTjH0I67/iKjvjLAIcmmYa
 J4f7AWGwFkL7Q+T5iiVGMQLIcA==
X-Google-Smtp-Source: ABdhPJwXbve+EIZD2sZS7vVy/bCi0g4V0ei7/8Nc18Ft9JjOtidUjF8kMuubnSPz+I1noFhLENLjOw==
X-Received: by 2002:a5d:48ca:: with SMTP id p10mr57074091wrs.87.1626078014116; 
 Mon, 12 Jul 2021 01:20:14 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id 11sm2767584wmo.10.2021.07.12.01.20.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Jul 2021 01:20:13 -0700 (PDT)
Subject: Re: [RFC PATCH 03/13] ASoC: qcom: dt-bindings: add bindings Audio
 Processing manager
To: Rob Herring <robh@kernel.org>
References: <20210607152836.17154-1-srinivas.kandagatla@linaro.org>
 <20210607152836.17154-4-srinivas.kandagatla@linaro.org>
 <20210618201621.GA2801502@robh.at.kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <1a152ccf-f51c-a59c-c530-f3f51f3cc75c@linaro.org>
Date: Mon, 12 Jul 2021 09:20:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210618201621.GA2801502@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 18/06/2021 21:16, Rob Herring wrote:
> On Mon, Jun 07, 2021 at 04:28:26PM +0100, Srinivas Kandagatla wrote:
>> This patch adds bindings support for Qualcomm Audio Processing Manager
>> service in Audio DSP.
>>
>> Audio Process Manager is one of the static service in DSP which is
>> responsible for Command/response handling, graph Management
>> and Control/Event management between modules.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   .../devicetree/bindings/sound/qcom,q6apm.yaml | 72 +++++++++++++++++++
>>   1 file changed, 72 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
>> new file mode 100644
>> index 000000000000..9906ef935206
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
>> @@ -0,0 +1,72 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/sound/qcom,q6apm.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Qualcomm Audio Process Manager binding
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> +
>> +description: |
>> +  This binding describes the Qualcomm Audio Process Manager service in DSP
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,q6apm
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +#APM Services
>> +patternProperties:
>> +  "^.*@[0-9a-f]+$":
> 
> You can drop '^.*'.

Thanks Rob for review,

will fix this along other comments in next spin.

--srini

> 
>> +    type: object
>> +    description:
>> +      APM devices use subnodes for services.
>> +
>> +    properties:
>> +      compatible:
>> +        enum:
>> +          - qcom,q6apm-dai
>> +          - qcom,q6apm-bedai
>> +
>> +      iommus:
>> +        maxItems: 1
>> +
>> +      "#sound-dai-cels":
> 
> cells?
> 
> How is this optional?
> 
>> +        const: 1
>> +
>> +    required:
>> +      - compatible
>> +      - reg
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: true
> 
> This needs to be false and fix whatever is missing.
> 
>> +
>> +examples:
>> +  - |
>> +    gpr {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        gprservice@1 {
>> +          compatible = "qcom,q6apm";
>> +          reg = <1>;
>> +
>> +          q6apm-dai {
> 
> This doesn't match what you have in the schema at all.
> 
>> +            compatible = "qcom,q6apm-dai";
>> +            #sound-dai-cels = <1>;
>> +          };
>> +
>> +          q6apm-bedai {
>> +            compatible = "qcom,q6apm-bedai";
>> +            #sound-dai-cels = <1>;
>> +          };
>> +        };
>> +    };
>> -- 
>> 2.21.0
>>
>>
