Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B29E71C0
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 13:43:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 092361F0D;
	Mon, 28 Oct 2019 13:42:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 092361F0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572266602;
	bh=G3iEaBzXG+DSzNQb7vCpIWPivkRReTOomZkhrWl8H4A=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hndHqhbrMm5wO05AkubeKOtI+3KwrEwEBCZRzaXBd99utiOYTbVKmjgRZ/s5twolM
	 3yYzP8t18EPvDskhskeRSdOIhsy/aHSZl0EKjUAgwPScKfPPCqXvumdDJXKEfMlHYF
	 FiEcti/EV78k0pQJ8OINTGsQ3fT5FwT7scgDrYTA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF667F8048F;
	Mon, 28 Oct 2019 13:42:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D9A1F803D6; Mon, 28 Oct 2019 13:42:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD32DF802BD
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 13:41:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD32DF802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="gzlVwieG"
Received: by mail-wm1-x341.google.com with SMTP id q130so8981336wme.2
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 05:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5xksvSoWClSEPqFisZy8fkW7iGrHC1hgE7A27QwV7HQ=;
 b=gzlVwieGLL+vRKmFH25rxW6uJL3c7ZUDBTuLJonZBtrHudOawmBb5SHfGzviP1gH8t
 hXNTMOg8xclCA4Od9HvUqPTpcRylA/7YwAB5NbK1tNVot+6H2lJFyZ5wbLwZZQOt0YVz
 xDnVaSEo0t2c+06VHQHs1nRNkAI5C1pmeyrCOXqrhFGYnXDmgbbUrrD2PNTKXunkRP7y
 oDc/IoxUdoZHmoIYw1TIkqegXCxMusr/wiFg9SLQxjUgWVw3yhOA0KI7B8xgellvl6sZ
 94/xu5989N5qnqz+ahT4jSbYLDj3j+bumF1FilJiuCvN85Q6RlCdoTO/AR90E2wvVWrR
 iB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5xksvSoWClSEPqFisZy8fkW7iGrHC1hgE7A27QwV7HQ=;
 b=YgrnFmzsmH/kcl88Bi9hIYmEEwZU76aeyMgNfIRDJgdrgtmcHDEbz+tNxdeSxo+WmG
 VLOyebHKC8A7Uj4lSNxLolCsXpEb0uSt+QArC0gZvkO5mUvPuvqk+FMBblIILIZ08s4U
 VuYTGWB0L5Y9bGAMacK8b1PNQT2XX09wVQuFuFUGAmNrBcIskCAvxKaeKUeBNF4gAB/Q
 k12XD2vGBke4tU8NPa64q04ZU5MSM334UmDxkuO7ry+bRanaMxzpyOvkVJtVakSKMga8
 IWEch3CDmX34BgkfHqmSdas2sfbWpfDKhZT2aKxG9czIeEx4gE+DAfFv0aie7yhtHe2G
 VXTQ==
X-Gm-Message-State: APjAAAVKoT7sT5jFTlfyDMwcbO3kUcHAzDiKnt6f2rQ7NhSzJhmYZ/v2
 w+QmNcfUrSy72LvwCpXjs+yfTg==
X-Google-Smtp-Source: APXvYqygo0fnWXSv7nZYL4U1ZXDFCeZaEZJnTPCrkdL1XZ8dj3TrWb5bXsY76ZWjmyYR8KItRj/F5g==
X-Received: by 2002:a1c:a751:: with SMTP id q78mr16448120wme.129.1572266517809; 
 Mon, 28 Oct 2019 05:41:57 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id u21sm13971582wmu.27.2019.10.28.05.41.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Oct 2019 05:41:56 -0700 (PDT)
To: Rob Herring <robh@kernel.org>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-9-srinivas.kandagatla@linaro.org>
 <20191025210021.GA12751@bogus>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e05ff19a-7c12-da80-4faf-3b152b24517d@linaro.org>
Date: Mon, 28 Oct 2019 12:41:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191025210021.GA12751@bogus>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vinod.koul@linaro.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org,
 lee.jones@linaro.org, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 08/11] dt-bindings: pinctrl:
 qcom-wcd934x: Add bindings for gpio
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

Thamks for the review Rob,


On 25/10/2019 22:00, Rob Herring wrote:
> On Fri, Oct 18, 2019 at 01:18:46AM +0100, Srinivas Kandagatla wrote:
>> Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
>> gpio controller to control 5 gpios on the chip. This patch adds
>> required device tree bindings for it.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   .../pinctrl/qcom,wcd934x-pinctrl.yaml         | 51 +++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,wcd934x-pinctrl.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,wcd934x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,wcd934x-pinctrl.yaml
>> new file mode 100644
>> index 000000000000..c8a36cbc4935
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,wcd934x-pinctrl.yaml
>> @@ -0,0 +1,51 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/qcom,wcd934x-pinctrl.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: WCD9340/WCD9341 GPIO Pin controller
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> +
>> +description: |
>> +  Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
>> +  gpio controller to control 5 gpios on the chip.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,wcd9340-pinctrl
>> +      - qcom,wcd9341-pinctrl
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  gpio-controller: true
>> +
>> +  gpio-ranges:
>> +    maxItems: 1
>> +
>> +  '#gpio-cells':
>> +    const: 2
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - gpio-controller
>> +  - gpio-ranges
>> +  - "#gpio-cells"
> 
> additionalProperties: false
> 
>> +
>> +
>> +examples:
>> +  - |
>> +    wcdpinctrl: wcdpinctrl@42 {
> 
> pinctrl@42

I will address above two comments in next version!

Thanks,
srini
> 
>> +        compatible = "qcom,wcd9340-pinctrl";
>> +        reg = <0x042 0x2>;
>> +        gpio-controller;
>> +        gpio-ranges = <&wcdpinctrl 0 0 5>;
>> +        #gpio-cells = <2>;
>> +    };
>> +
>> +...
>> -- 
>> 2.21.0
>>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
