Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF913DA031
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 11:20:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42F981909;
	Thu, 29 Jul 2021 11:19:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42F981909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627550408;
	bh=AJ6rmhD+B9vKDLlKwN+fCTHBcD6sJyNOT+lQnzjlR/A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dZ25eElMLCCYq+n2WYjQ/lUveVNTGo2uVDKOkJlr+705GFKzgCg6EqSJMGBWtF6RV
	 O+JDjHxTdJeT/FQIRe4rf5smtT96w5R4kFsz4D66EpeBMmmbRcVfAlnctv1rSUV4Ta
	 /lBLbiM4r/5EQPDLdv5lN9oBbzFuaUjHGmXyG1X8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 828C0F80276;
	Thu, 29 Jul 2021 11:18:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6D4EF8026C; Thu, 29 Jul 2021 11:18:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0366F800E9
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 11:18:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0366F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="pgNV599S"
Received: by mail-wr1-x431.google.com with SMTP id c16so5999448wrp.13
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 02:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l+nZIaXTzSWTbnhdYn/fQ9vw1KtraaQBcGvKxiJnOVw=;
 b=pgNV599SAM1Wu4Z7W8wsHZQ9LL9gipMaS3MRne6sF27+vnoGq0peDXC87s6c+LvmGJ
 viSc63sQ1dvtrJU5VSDchu9C/V6kxepVWxb5y8EGL6N+NW7+G5XZd3KbYYnINiFbgRUI
 93uRowNHnRysb1ZxP9YIHHrx7E2/fnq1/Ti1P/X+iGbwocR2dyvxkfpEvshholb2rLWJ
 zmSo3aLoMIfkFTctYIyUl3RtJbDeCzi67pYa3G8kYHBNu5wnl1IMAAdohfSFKOHpE78J
 bWI1iztAGgNT0s6piNUm2/0XaSzpwl6rs/GjvjmuXtDCwCOls5sSfaVis0RuBvAUQdeP
 4mVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l+nZIaXTzSWTbnhdYn/fQ9vw1KtraaQBcGvKxiJnOVw=;
 b=JZUaSh+m9IkkkTvNqZpCd+Uy8BtWkTKf8mQ9FPCopwOHQUFMMW86f65t93q1Hw16Tn
 o2qZPRzu/8anc4cMWwHkPnmLJlYuTvQIzRXN9CV1EB6g9ZvQtzt9fQ5KKsoU10Ee+LGR
 XAh3Xgbit91n0HR7LTsz86atRrcQibcjMfpco5bu8AYmtnFKiGuoOoSwOGaFXLAc17Qp
 xmDSo5xLRelcIuHQdC6Th3wvGK/KwX1YaD+jEHV50tuGvaSRDnWqiJgchdtTtZQyH08s
 kLT6Ddrz9nanTIMrkod5/Qr44GW+OIpDJznbqMAu2M1SvEZ+oungrYGc63Xqx4k1mri/
 a0Yg==
X-Gm-Message-State: AOAM5302VOt3288VxK9WHAZIU5IAe7FqNVZwpbbH2i3xpkUMoWx/MztW
 /qOdQH1GNrxZFrb2d0RJijuSEQ==
X-Google-Smtp-Source: ABdhPJwbtN/KMFdWqOjpEGAIAmb/E5eMPOUmcD3QrH3AYbFGdp5HdwIorhiQ1NargruMZelfvpx5ow==
X-Received: by 2002:adf:eb4c:: with SMTP id u12mr3809891wrn.111.1627550310476; 
 Thu, 29 Jul 2021 02:18:30 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id c2sm2634105wrs.60.2021.07.29.02.18.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 02:18:29 -0700 (PDT)
Subject: Re: [PATCH v2 04/16] ASoC: qcom: dt-bindings: add bindings Audio
 Processing manager
To: Rob Herring <robh@kernel.org>
References: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
 <20210714153039.28373-5-srinivas.kandagatla@linaro.org>
 <20210728173649.GA1290628@robh.at.kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <092018be-50ae-6dda-73cd-6c7eb002dc19@linaro.org>
Date: Thu, 29 Jul 2021 10:18:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728173649.GA1290628@robh.at.kernel.org>
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

Thanks Rob for the review,

On 28/07/2021 18:36, Rob Herring wrote:
> On Wed, Jul 14, 2021 at 04:30:27PM +0100, Srinivas Kandagatla wrote:
>> This patch adds bindings support for Qualcomm Audio Processing Manager
>> service in Audio DSP.
>>
>> Audio Process Manager is one of the static service in DSP which is
>> responsible for Command/response handling, graph Management
>> and Control/Event management between modules.
> 
> This all looks fairly similar to the prior Qcom audio binding(s). It
> would be nice to not see this all re-invented.
> 
AudioReach is a new DSP signal processing framework Which is different 
to its previous DSP firmware(aka Elite).
It makes use of ASoC Topology to load audio graphs on to the DSP which 
is then managed by APM (Audio Processing Manager) service.

So internals are not exactly same.

 From device tree side we might end up with similar layout, but there 
are some subtle differences like clocks are managed by q6prm service 
instead of q6afe service in old firmware, front-end pcm dais definitions 
come from ASoC topology.

Are you suggesting that we should reuse the old bindings (q6afe, q6asm) 
by add new compatible strings along with differences ?


>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   .../devicetree/bindings/sound/qcom,q6apm.yaml | 87 +++++++++++++++++++
>>   include/dt-bindings/sound/qcom,q6apm.h        |  8 ++
>>   2 files changed, 95 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
>>   create mode 100644 include/dt-bindings/sound/qcom,q6apm.h
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
>> new file mode 100644
>> index 000000000000..6f27567523a9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
>> @@ -0,0 +1,87 @@
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
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +#APM Services
>> +patternProperties:
>> +  'apm@[0-9]+$':
> 
> This means '.*apm' for the node name. Did you need a '^'?
> 
yes we need begins with '^' , will add that in next version.

>> +    type: object
>> +    description:
>> +      APM devices use subnodes for services.
>> +
>> +    properties:
>> +      compatible:
>> +        enum:
>> +          - qcom,q6apm-dais
>> +          - qcom,q6apm-bedais
>> +
>> +      iommus:
>> +        maxItems: 1
>> +
>> +      "#sound-dai-cells":
>> +        const: 1
>> +
>> +      reg:
>> +        maxItems: 1
>> +
>> +    required:
>> +      - compatible
>> +      - reg
>> +      - '#sound-dai-cells'
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
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
>> +          #address-cells = <1>;
>> +          #size-cells = <0>;
>> +
>> +          apm@1 {
>> +            compatible = "qcom,q6apm-dais";
>> +            #sound-dai-cells = <1>;
>> +            reg = <1>;
>> +          };
>> +
>> +          apm@2 {
>> +            compatible = "qcom,q6apm-bedais";
>> +            #sound-dai-cells = <1>;
>> +            reg = <2>;
>> +          };
>> +        };
>> +    };
>> diff --git a/include/dt-bindings/sound/qcom,q6apm.h b/include/dt-bindings/sound/qcom,q6apm.h
>> new file mode 100644
>> index 000000000000..3c3987eb6e95
>> --- /dev/null
>> +++ b/include/dt-bindings/sound/qcom,q6apm.h
>> @@ -0,0 +1,8 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef __DT_BINDINGS_Q6_APM_H__
>> +#define __DT_BINDINGS_Q6_APM_H__
>> +
>> +/* Audio Process Manager (APM) virtual ports IDs */
>> +#include <dt-bindings/sound/qcom,q6afe.h>
> 
> Why add this indirection? Rename the file if you need something to cover
> both.

Thats a good idea,

These are basically audio endpoint device ids which should be same 
across different audio firmwares.

I can rename this to dt-bindings/sound/qcom,adsp-audio-ports.h or 
something more generic to be able to reuse.

--srini
> 
>> +
>> +#endif /* __DT_BINDINGS_Q6_APM_H__ */
>> -- 
>> 2.21.0
>>
>>
