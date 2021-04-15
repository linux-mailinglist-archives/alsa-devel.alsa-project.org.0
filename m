Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B47333610A1
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Apr 2021 18:59:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 379F71658;
	Thu, 15 Apr 2021 18:58:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 379F71658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618505977;
	bh=Zl46cRVz1yClDCNCDKeBwq0y0cNBz+oRDhtfYF9iSks=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VKhhz0Y1rvxiu0hQftacUhMuyNXqSeJZw0I6qf2w9cn1Gi1pexOpf+4SHDFIzF/3x
	 i/gFNA+vklLnemY6THGlW1pwF/jCqi/YjxhzPihzcRmA70GS54OZ+dA3m2YpLqkdey
	 Tda77l2iG59RxJirR0R7DrhfQSr0M2Fk75H72iAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3633F800ED;
	Thu, 15 Apr 2021 18:58:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2BA9F8022B; Thu, 15 Apr 2021 18:58:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2F4EF800ED
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 18:57:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2F4EF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zDujCGHh"
Received: by mail-ej1-x630.google.com with SMTP id n2so37886773ejy.7
 for <alsa-devel@alsa-project.org>; Thu, 15 Apr 2021 09:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3DgCO52fftNeZ41idappXG0DEfdrTMom3c7Wz2waGIc=;
 b=zDujCGHhaJGpB03Y8csiGEnu2TlKuSIiAyw5BbLnVhntUDWISiQY0pre2AKCezZkzw
 6cWjr+JIFvepZ9RZBujdjrQalMmbQRTfkAjky9igeT96ZKGFMUgC1c662fqo7VGZ2W0U
 gMfe3Q39SE4y91BJEpZtHUEL36U1j6dXONhO4YNUkRQamSr67fP+YM9d7TK44uyDs2VT
 n0qBlI2MTdEc3AmlfD8J6DKhKCq+OudbE7JYaxuBgC6WFmZShhC1xoxsbBllH/6rTB+d
 hbmerLU8HwZlPJs2Zr3g6SSGZQKzm3nuW38nNpv2b2PdqNNP6MNjacC4MypEB2MOwGjJ
 8lZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3DgCO52fftNeZ41idappXG0DEfdrTMom3c7Wz2waGIc=;
 b=qQSYA1IZUwwz7yFgy+hTN0826w3BQg2uZaWHiGsarEaaaZQDNOUM/9iX5WzRsVOoCk
 ijeaJADhz6NE2Y21odjXgp9yVGWxwsohgfOzqFMd+9p8SxLuEr6eMmqy/EyeYKuIhyT3
 DdMMCT/lrgcxQwMKMQ7w1LCKa08DtHHa7/kQ+z6RymAtcjzKLAr2pBr0YWA1UyVgg7cf
 0bjF1S4LL5jTubRAqjp9Iu//NbEZ4EigA+yREN2RNOUOvWGcFKPdvY5SQiVRp4q4RLcl
 rtmYt/jczBhQ9dtxy8imnLkgW9YQtywpy/Nw2vWMFQneLFUpAkEaq1QGBZi+7tS4Fm5D
 lKrA==
X-Gm-Message-State: AOAM5309fKwEtb3ye+Q6Gb9oKBRJU7YySBCIbcl6qm8dIJsUtGVxSxx5
 u2gWHhrM3W8FfxIaf6PC2Ucwiw==
X-Google-Smtp-Source: ABdhPJy6gp4jWVe189u4BauC4L6mG/7JLHUHTYQJmlJd1gLmtdY4ro6AZVCQPt5FMgB6G++44TvNcA==
X-Received: by 2002:a17:906:1519:: with SMTP id
 b25mr4441330ejd.254.1618505878656; 
 Thu, 15 Apr 2021 09:57:58 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id bw14sm2313535ejb.89.2021.04.15.09.57.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Apr 2021 09:57:58 -0700 (PDT)
Subject: Re: [PATCH v4 4/9] ASoC: dt-bindings: wcd938x-sdw: add bindings for
 wcd938x-sdw
To: Rob Herring <robh@kernel.org>
References: <20210414154845.21964-1-srinivas.kandagatla@linaro.org>
 <20210414154845.21964-5-srinivas.kandagatla@linaro.org>
 <20210415163912.GA1524320@robh.at.kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <2458de43-2747-d377-e115-f014fb2b9907@linaro.org>
Date: Thu, 15 Apr 2021 17:57:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210415163912.GA1524320@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org
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



On 15/04/2021 17:39, Rob Herring wrote:
> On Wed, Apr 14, 2021 at 04:48:40PM +0100, Srinivas Kandagatla wrote:
>> Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC
>> connected over SoundWire. This device has two SoundWire devices RX and
>> TX respectively. This bindings is for those slave devices on WCD9380/WCD9385.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   .../bindings/sound/qcom,wcd938x-sdw.yaml      | 61 +++++++++++++++++++
>>   1 file changed, 61 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml
>> new file mode 100644
>> index 000000000000..fff33c65491b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml
>> @@ -0,0 +1,61 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,wcd938x-sdw.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Bindings for Qualcomm SoundWire Slave devices on WCD9380/WCD9385
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> +
>> +description: |
>> +  Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC.
>> +  It has RX and TX Soundwire slave devices. This bindings is for the
>> +  slave devices.
>> +
>> +properties:
>> +  compatible:
>> +    const: sdw20217010d00
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  qcom,direction:
>> +    description: direction of the SoundWire device instance
>> +    enum:
>> +      - rx
>> +      - tx
> 
> Was thinking these were some established bus properties...
> 
> This would just be implied by the 'reg' property index. You could define
> 'reg-names' too I guess.
> 
>> +
>> +  qcom,port-mapping:
>> +    description: |
>> +      Specifies static port mapping between slave and master ports.
>> +      In the order of slave port index.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 4
>> +    maxItems: 5
> 
> qcom,rx-port-mapping and qcom,tx-port-mapping?
> 

If we have this property then "qcom,direction" becomes redundant.

> Or keep a single property and the driver knows how many slave ports for
> each direction. IOW, an array of 9 with first 4 entries for tx and last
> 5 for rx.

We can't have a single property with 9 entries as these are two separate 
devices, rx SoundWire Slave has 5 ports implemented where as tx SounWire 
slave has only 4 ports implemented in hw.

And the are on different SoundWire buses.

--srini
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - qcom,direction
>> +  - qcom,port-mapping
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    soundwire@3230000 {
>> +        #address-cells = <2>;
>> +        #size-cells = <0>;
>> +        reg = <0x03230000 0x2000>;
>> +
>> +        codec@0,3 {
>> +            compatible = "sdw20217010d00";
>> +            reg  = <0 3>;
>> +            qcom,direction = "tx";
>> +            qcom,port-mapping = <2 3 4 5>;
>> +        };
>> +    };
>> +
>> +...
>> -- 
>> 2.21.0
>>
