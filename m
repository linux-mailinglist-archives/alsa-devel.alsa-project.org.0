Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C547E71AA
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 13:42:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9A8B1E09;
	Mon, 28 Oct 2019 13:41:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9A8B1E09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572266554;
	bh=QIfLAe5jA0ucd+q1XUmWo54B1uIm1+tVBklfYo4Jdn0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rajXYExx/WXX0yRFjpX8teY47gtP4r6S6PrVleKGYv5pE4GwvtXSQHDli9J4HZrT+
	 J//yD8zyNxE+aSsmBrZQ23TQP20Ospk8MgmIo22elNOu/6kz7BRAleKASQmvZXqEI3
	 cLYCUv/oLnOMqWseVqofDlAPyEsfK2GO4M6lzCDM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10B7EF8044A;
	Mon, 28 Oct 2019 13:40:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23E4FF80361; Mon, 28 Oct 2019 13:40:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32599F80145
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 13:40:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32599F80145
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="KztUAi13"
Received: by mail-wm1-x343.google.com with SMTP id n7so9286262wmc.3
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 05:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w/WLt7O2taIP8YM7ktvX+R/TNl8ElnwnfMYK27iQOaI=;
 b=KztUAi13eLRxuTdBVRwh7Ha/+XqKvFTVZ7r97D5Dcn4OevqhKWCHl5VqQAcFcWPPz5
 gRWtBZn7ZtZo9GqySCYa75GMSvfkr8pVj7Sk8XLmnzpCRgGU/6ldH1Ld9miosbcfymoL
 iSHcyrDdLOW1eiDY7QIRwDy8Qag4soGDfQcrvA7p0ieaAd913vRGJ76VUyt6U6LnKvyn
 HW7aPzXto6UBTxD06JYTFN/ESAsbHhAMhbmTN6gLC5bWShWAl57tdoTJAbP6YTDQi+BM
 cMb1ytfnw0y60iLw0aUCqagyLjzXkFyHlbsM53OeHqwDEFqS8PsziTYdhshNW9FtJ+q0
 LTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w/WLt7O2taIP8YM7ktvX+R/TNl8ElnwnfMYK27iQOaI=;
 b=CMNQipTbC7INQWv1hSQ6JovS1LhLfL+asHEPwZNvKTRr65LTh+kzDj+aZiWzdjk/2z
 HsQdLzZibhV3B2yjnK3/P2PMuK8ZKIrl5DpXGKU+sHNmbI7QEem+g56WARWWv0N0XT6T
 9Pr3NLUPfflddAsLXf+8vSZgLJqQhYQ8qdi2uZ5hvNGFlg3J/6A8vmDYInxZNgr/aqcG
 Zd3Rz+tV8OvVP/KXz/WJ+4m7imT3tT/UGtuhP4Plc9GXFaMFRfnwdhzx0cc3Y6qNodD+
 USBtp/SE31B7pSluCCoLzNDIGIpvHsqVPTx3o6+mzlrXi4e/SUgKUqkXIneLGUJwWx+Z
 lhbQ==
X-Gm-Message-State: APjAAAWOnHjuGjDeQm56blhefDds1/ZH0m3e1Ol6mGxNhrSTiOCxcH+w
 jlrMD1YgA6TmeTmIQkBpvN0ChQ==
X-Google-Smtp-Source: APXvYqz4DB4lyfpP+bmW/8XijGIPT2kMEoKr8hKJwSWGlqShrMTBlem3CgCZyJMPgD0oZI0xyNDi4Q==
X-Received: by 2002:a05:600c:22c4:: with SMTP id
 4mr5720906wmg.177.1572266444055; 
 Mon, 28 Oct 2019 05:40:44 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id
 f204sm15333062wmf.32.2019.10.28.05.40.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Oct 2019 05:40:43 -0700 (PDT)
To: Rob Herring <robh@kernel.org>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-2-srinivas.kandagatla@linaro.org>
 <20191025204338.GA25892@bogus>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <90b2d83b-f2b2-3a5d-4deb-589f4b48b208@linaro.org>
Date: Mon, 28 Oct 2019 12:40:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191025204338.GA25892@bogus>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vinod.koul@linaro.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org,
 lee.jones@linaro.org, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 01/11] ASoC: dt-bindings: add dt
 bindings for WCD9340/WCD9341 audio codec
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Thanks Rob for the review.

On 25/10/2019 21:43, Rob Herring wrote:
> On Fri, Oct 18, 2019 at 01:18:39AM +0100, Srinivas Kandagatla wrote:
>> This patch adds bindings for wcd9340/wcd9341 audio codec which can
>> support both SLIMbus and I2S/I2C interface.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   .../bindings/sound/qcom,wcd934x.yaml          | 169 ++++++++++++++++++
>>   1 file changed, 169 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
>> new file mode 100644
>> index 000000000000..299d6b96c339
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd934x.yaml
>> @@ -0,0 +1,169 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,wcd934x.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Bindings for Qualcomm WCD9340/WCD9341 Audio Codec
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> +
>> +description: |
>> +  Qualcomm WCD9340/WCD9341 Codec is a standalone Hi-Fi audio codec IC.
>> +  It has in-built Soundwire controller, pin controller, interrupt mux and
>> +  supports both I2S/I2C and SLIMbus audio interfaces.
>> +
>> +properties:
>> +  compatible:
>> +    const: slim217,250
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  reset-gpios:
>> +    description: GPIO spec for reset line to use
>> +    maxItems: 1
>> +
>> +  slim-ifc-dev:
>> +    description: SLIMBus Interface device phandle
> 
> phandle or...
> 
Its Phandle.

something like this is okay?

slim-ifc-dev:
   $ref: '/schemas/types.yaml#/definitions/phandle-array'
   description: SLIMBus Interface device phandle



>> +    maxItems: 1
> 
> array?
> 
> Needs a type if a phandle.
> 
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    const: extclk
>> +
>> +  vdd-buck-supply:
>> +    description: A reference to the 1.8V buck supply
>> +
>> +  vdd-buck-sido-supply:
>> +    description: A reference to the 1.8V SIDO buck supply
>> +
>> +  vdd-rx-supply:
>> +    description: A reference to the 1.8V rx supply
>> +
>> +  vdd-tx-supply:
>> +    description: A reference to the 1.8V tx supply
>> +
>> +  vdd-vbat-supply:
>> +    description: A reference to the vbat supply
>> +
>> +  vdd-io-supply:
>> +    description: A reference to the 1.8V I/O supply
>> +
>> +  vdd-micbias-supply:
>> +    description: A reference to the micbias supply
>> +
>> +  qcom,micbias1-millivolt:
> 
> The standard unit is '-microvolt'
> 
>> +    description: Voltage betwee 1800mv-2850mv for micbias1 output
> 
> typo...
> 
Yep, will fix this and also move to standard unit microvolt

> Sounds like constraints.
> 
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
> 
> With standard units, you can drop the type.
> 
>> +
>> +  qcom,micbias2-millivolt:
>> +    description: Voltage betwee 1800mv-2850mv for micbias2 output
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +  qcom,micbias3-millivolt:
>> +    description: Voltage betwee 1800mv-2850mv for micbias3 output
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +  qcom,micbias4-millivolt:
>> +    description: Voltage betwee 1800mv-2850mv for micbias4 output
>> +    allOf:
>> +      - $ref: /schemas/types.yaml#/definitions/uint32
>> +
>> +  clock-output-names:
>> +    const: mclk
>> +
>> +  clock-frequency:
>> +    description: Clock frequency of output clk in Hz
>> +
>> +  interrupt-controller: true
>> +
>> +  '#interrupt-cells':
>> +    const: 1
>> +
>> +  '#clock-cells':
>> +    const: 0
>> +
>> +  '#sound-dai-cells':
>> +    const: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 1
>> +
>> +patternProperties:
>> +  "^.*@[0-9a-f]+$":
>> +    type: object
>> +    description: |
>> +      WCD934x subnode for each slave devices. Bindings of each subnodes
>> +      depends on the specific driver providing the functionality and
>> +      documented in there respective bindings.
> 
> s/there/their/

will fix this in next version!

thanks,
srini
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
