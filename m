Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B816C62EE05
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 07:58:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E6FF167B;
	Fri, 18 Nov 2022 07:57:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E6FF167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668754682;
	bh=hTEv4xcwyTpo0bjRfRefeRr7gU01kNdcY9d6A8vyBXQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NEcGt8wXQ2KHLVlZo+2t0mWxK3X/oaDKs4ECjjAMti7frV47Wqtq1xb6HbMqO8eJl
	 JjYbDzuoQVlZzgo7J/F8pEKc2lQYqEmvi9R3xsOWhUH1aDhdf4bsRD7XNQFfkXig3e
	 Lh2YZ4zB/8PmTVgQKVe92PnzgY93ozrN7Z+KsiFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8957F800B8;
	Fri, 18 Nov 2022 07:57:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36F42F800FD; Fri, 18 Nov 2022 07:57:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 914F0F800FD
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 07:56:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 914F0F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="f2FtTNvI"
Received: by mail-wr1-x430.google.com with SMTP id cl5so7804938wrb.9
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 22:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8e6rRpvY1utUAM1R1YfWwwuUchnWq32QH8sI3dudXPg=;
 b=f2FtTNvIEOxpR4zIofkbg9K2ZiAzfj0uUyeFw5/i9nRu5yazy4hoVq+LFTkFKhGWln
 r1jkxXZ/stDuUVtgukxi47AtvUEpl5NFpYvoGnDrMKj6XKHF1JBMwXElY6B/uFE4In93
 fC+q0L7gZamfMkq8bIvzU2sms1RfZq0rnzZOYT3KMUVDSq+3wjoBS18MaBNhdL0BaH9+
 N6PacWzgkFqU/nisYUYdtcMzj1Fx+Z874GEIg+qcs4wqStpN8Dj28XLB/2s3dmJJOOzS
 ZoUJoNnAL3l2s/0WZhxbHAf9SFH1z4T9warsXfDEmMMDDAY2Zq4wTvO0+AEwjXl1BINH
 VF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8e6rRpvY1utUAM1R1YfWwwuUchnWq32QH8sI3dudXPg=;
 b=7OVaQNsgzQDb08sL8c/8z4T0hyq5P8LQUf7Mn52sy3tWAREtd7rmL8FQG/SgYQ4U2R
 LmkNX4yQqnVophsD2IuluPf2a++/s096ieT3Xfc/k5tTDWEkGfTiLszText3aunVXBq9
 f54FWRL5LN3hPXLgshkZjdua7EkT9zZ343fALhhmPSo4mVNi45CDw7FPepDRBC1Zzl0W
 qMdDJk/GudJdSdGgIWP+AKR0FQDXGg5+Hr1p90gZtDYuV2cr7zyhy1vmgrAflLSL3X7F
 NUzkqDlNd5RReR/gFAhvpTuMfVhCKjXnHZUFOHbSOwFQi5tDDLj1Z4+nVy4wW9H+tlnq
 aG9A==
X-Gm-Message-State: ANoB5pnsy2kYdjkRBpwHqes6rjK8eywD4/BQwphDqsIQ0zZie+dUpnNX
 wUx6Qvo/3yF/pz5/QaX13b++7A==
X-Google-Smtp-Source: AA0mqf4NVcmP6MCkOZV0FixgkVpInlUhb9xP5GP2pFw3rwQWyUmfKZ6q+vOdvnzk/Th4LDU/1Ybnzw==
X-Received: by 2002:adf:e3cd:0:b0:241:bc27:f8b6 with SMTP id
 k13-20020adfe3cd000000b00241bc27f8b6mr2589924wrm.367.1668754617597; 
 Thu, 17 Nov 2022 22:56:57 -0800 (PST)
Received: from [192.168.22.132] ([167.98.215.174])
 by smtp.googlemail.com with ESMTPSA id
 m29-20020a05600c3b1d00b003c6b7f5567csm13771670wms.0.2022.11.17.22.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 22:56:56 -0800 (PST)
Message-ID: <6ca00c5f-a405-da68-8286-fd6d02138c30@linaro.org>
Date: Fri, 18 Nov 2022 06:56:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: lpass-va: add npl clock for new VA
 macro
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, broonie@kernel.org
References: <20221115105541.16322-1-srinivas.kandagatla@linaro.org>
 <20221115105541.16322-2-srinivas.kandagatla@linaro.org>
 <f3a6a7b1-b196-0abb-0c18-8a13908c6891@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <f3a6a7b1-b196-0abb-0c18-8a13908c6891@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Thanks Krzystof,

On 15/11/2022 14:21, Krzysztof Kozlowski wrote:
> On 15/11/2022 11:55, Srinivas Kandagatla wrote:
>> LPASS VA Macro now has soundwire master to deal with access to
>> analog mic in low power island use cases. This also means that VA macro
>> now needs to get hold of the npl clock too. Add clock bindings required
>> for this.
>>
>> As part of adding this bindings, also update bindings to be able to
>> specific and associate the clock names specific to the SoC.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   .../bindings/sound/qcom,lpass-va-macro.yaml   | 72 ++++++++++++++++---
>>   1 file changed, 64 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
>> index c36caf90b837..848e34111df1 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
>> @@ -27,16 +27,13 @@ properties:
>>       const: 0
>>   
>>     clocks:
>> -    maxItems: 3
>> +    minItems: 1
>> +    maxItems: 4
>> +
>>   
>>     clock-names:
>> -    oneOf:
>> -      - items:   #for ADSP based platforms
>> -          - const: mclk
>> -          - const: core
>> -          - const: dcodec
>> -      - items:   #for ADSP bypass based platforms
>> -          - const: mclk
>> +    minItems: 1
>> +    maxItems: 4
>>   
>>     clock-output-names:
>>       maxItems: 1
>> @@ -61,6 +58,65 @@ required:
>>     - reg
>>     - "#sound-dai-cells"
>>   
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sc7280-lpass-va-macro
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 1
> 
> You can skip minItems here.

I have addressed all the comments including this, will send a v2 with 
these changes.

--srini
> 
>> +          maxItems: 1
>> +        clock-names:
>> +          items:
>> +            - const: mclk
>> +      required:
>> +        - clock-names
>> +        - clocks
> 
> IIUC, all variants require now clocks, so these two lines should be part
> of top level "required:".
> 
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,sm8250-lpass-va-macro
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 3
>> +          maxItems: 3
>> +        clock-names:
>> +          items:
>> +            - const: mclk
>> +            - const: core
>> +            - const: dcodec
>> +      required:
>> +        - clock-names
>> +        - clocks
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,sc8280xp-lpass-va-macro
>> +              - qcom,sm8450-lpass-va-macro
>> +    then:
>> +      properties:
>> +        clocks:
>> +          minItems: 4
>> +          maxItems: 4
>> +        clock-names:
>> +          items:
>> +            - const: mclk
>> +            - const: npl
> 
> How about making it the last clock so the order matches with sm8250?
> 
> 
> Best regards,
> Krzysztof
> 
