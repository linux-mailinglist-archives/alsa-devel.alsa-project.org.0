Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE09136F70C
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Apr 2021 10:22:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D08F168A;
	Fri, 30 Apr 2021 10:21:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D08F168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619770922;
	bh=wPYMnkS6b7ZjDT0chO2bzWRzZ1zFASb3+zrOTLnznbY=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CE5r7k05fiLj3dbfADelZJBt35fR/lojGcl77lFLy8O1gV2dAs7nexc+gqG57JyjH
	 0fs7vgfB0uvbcZaoywdmFXnWsAfdpbJP3Ev8EvUK3dn6UhaHE6FPBzQ96MaPDhMj5e
	 U8FE2/1+4mVCfltfpTpwVph6R6yICJah4WFityBU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98691F80171;
	Fri, 30 Apr 2021 10:20:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18D1AF8016C; Fri, 30 Apr 2021 10:20:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7201F8012B
 for <alsa-devel@alsa-project.org>; Fri, 30 Apr 2021 10:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7201F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="JOFR5P4z"
Received: by mail-wm1-x32b.google.com with SMTP id
 26-20020a05600c22dab029013efd7879b8so1271572wmg.0
 for <alsa-devel@alsa-project.org>; Fri, 30 Apr 2021 01:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k3V7PIJt4df52x4EhJvQyNhxcs7GT3vwtzimn9FSBpE=;
 b=JOFR5P4z2JgXwIzzvzUuxVUDGInvtmF/Ji0eODgv9me7xLvxYX+/YftiHdCIkMxwcq
 dX8QUfX37saKnVR26QTbhiDI33H1uwjT+Zf5GCdFyvDHMdEC/KQKBSfp+4JEFjg6VQze
 PUFoyG3opZ5Gh+E8Z3C3UR73y5Imz7ESWVqq0xMYlod7fMrRemuftXs9t3pvUUBPQYHS
 JXp1kp8dMxWRjJfpwHMjEkJLT3Rati3hr/cF6k+npMbB9reFWiOPrpJXsIcmStFW4IjG
 AR7FzIdL74nsE9HDPO4dHz5rxND0LRGh+Gueeu/OS+Yoe5xIz901CYyw06AT+AJht8ai
 RSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k3V7PIJt4df52x4EhJvQyNhxcs7GT3vwtzimn9FSBpE=;
 b=UzWMqoNfyoLcEhPGA0NFYYgiU5i7sAgN/uQ5LiQzF76MCg4O3Ci1wSlR8Uhpm7dqM5
 8wHCObFQF/+tGQv0E9sZQ3o64/6hfdt3hegM6B3vgKf4nrDH7KRLBKpayK5oNYI/DDoh
 smLUUTFWwHUck51z65/pnnS1Hm5gYv+VLc4fk1IJnfeWq1zrxfhuqDvwhlxnMQ5JiQti
 qg82ldnrsQ49HRQ4BVUQ84vDoMsqJILIuASexdB7XjPVG7ygi+U2WrcyRcMMTH33zhLE
 gnuj4xP4CF4BsEFytH+F3DchyFSuwrE1UHDzH9esAHC9BmjuzJCDAJYV4Ic6KKY33fGA
 Q6Kw==
X-Gm-Message-State: AOAM533+JQvKQX9HqWOBsgfPONUhuSKLSZbdaAj8TRspVYKkwD0SHFYt
 E5U1FD8VJwGoMJ0eAtWHTJFHid5JJNZadiQE
X-Google-Smtp-Source: ABdhPJwj2Jtz4lfgLVo8vX67xmuo0x4uN8Ad9r42TOq6WHEsTP+wOyClRvouTstm8/Iy4PJPH0I2JQ==
X-Received: by 2002:a7b:c05a:: with SMTP id u26mr14890660wmc.172.1619770818847; 
 Fri, 30 Apr 2021 01:20:18 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id 18sm12705810wmo.47.2021.04.30.01.20.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Apr 2021 01:20:18 -0700 (PDT)
Subject: Re: [PATCH v4 1/9] ASoC: dt-bindings: wcd938x: add bindings for
 wcd938x
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Rob Herring <robh@kernel.org>
References: <20210414154845.21964-1-srinivas.kandagatla@linaro.org>
 <20210414154845.21964-2-srinivas.kandagatla@linaro.org>
 <20210415162947.GA1511094@robh.at.kernel.org>
 <96e7c752-a962-cb5b-c936-8151fd4c32ea@linaro.org>
Message-ID: <22bab947-e760-be72-084b-41059bf02d19@linaro.org>
Date: Fri, 30 Apr 2021 09:20:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <96e7c752-a962-cb5b-c936-8151fd4c32ea@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Hi Rob,

On 15/04/2021 17:53, Srinivas Kandagatla wrote:
> Thanks Rob for quick review,
> 
> On 15/04/2021 17:29, Rob Herring wrote:
>> On Wed, Apr 14, 2021 at 04:48:37PM +0100, Srinivas Kandagatla wrote:
>>> Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC
>>> connected over SoundWire. This device has two SoundWire device RX and
>>> TX respectively, supporting 4 x ADCs, ClassH, Ear, Aux PA, 2xHPH,
>>> 7 x TX diff inputs, 8 DMICs, MBHC.
>>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> ---
>>>   .../bindings/sound/qcom,wcd938x.yaml          | 176 ++++++++++++++++++
>>>   1 file changed, 176 insertions(+)
>>>   create mode 100644 
>>> Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml 
>>> b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
>>> new file mode 100644
>>> index 000000000000..4c8fa8290af0
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
>>> @@ -0,0 +1,176 @@
> 
> ...
> 
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    codec {
>>> +        compatible = "qcom,wcd9380-codec";
>>> +        reset-gpios = <&tlmm 32 0>;
>>> +        #sound-dai-cells = <1>;
>>> +        qcom,tx-device = <&wcd938x_tx>;
>>> +        qcom,rx-device = <&wcd938x_rx>;
>>> +        qcom,micbias1-microvolt = <1800000>;
>>> +        qcom,micbias2-microvolt = <1800000>;
>>> +        qcom,micbias3-microvolt = <1800000>;
>>> +        qcom,micbias4-microvolt = <1800000>;
>>> +        qcom,mbhc-hphl-switch;
>>> +        qcom,mbhc-ground-switch;
>>> +        qcom,mbhc-button0-vthreshold-microvolt = <75000>;
>>> +        qcom,mbhc-button1-vthreshold-microvolt = <150000>;
>>> +        qcom,mbhc-button2-vthreshold-microvolt = <237000>;
>>> +        qcom,mbhc-button3-vthreshold-microvolt = <500000>;
>>> +        qcom,mbhc-button5-vthreshold-microvolt = <500000>;
>>> +        qcom,mbhc-button6-vthreshold-microvolt = <500000>;
>>> +        qcom,mbhc-button7-vthreshold-microvolt = <500000>;
>>> +    };
>>> +
>>> +    /* ... */
>>> +
>>> +    soundwire@3230000 {
>>> +        #address-cells = <2>;
>>> +        #size-cells = <0>;
>>> +        reg = <0x03230000 0x2000>;
>>> +        wcd938x_tx: codec@0,3 {
>>> +            compatible = "sdw20217010d00";
>>> +            reg  = <0 3>;
>>> +            qcom,direction = "tx";
>>> +            qcom,port-mapping = <2 3 4 5>;
>>> +        };
>>> +
>>> +        wcd938x_rx: codec@0,4 {
>>> +            compatible = "sdw20217010d00";
>>> +            reg  = <0 4>;
>>> +            qcom,direction = "rx";
>>> +            qcom,port-mapping = <1 2 3 4 5>;
>>> +        };
>>
>> This is a single device, right? We shouldn't need 3 nodes to describe
>> it. I think this should all be a single node like this:
>>
> No, WCD938x is a Audio Codec which has two SoundWire Slave device (TX 
> and RX). WCD938X reset lines and supplies are common for both TX and RX 
> SoundWire devices.
> 
> However TX SoundWire device only has register access to codec 
> CSR(Control Status registers).
> 
> So there are two SoundWire devices and a WCD938X common parts. Now 
> making the common Codec part as a separate device made more sense here.
> So we ended with total 3 devices.
> 
> 1 . WCD938x Codec which deals with all the codec side including Common 
> parts.
> 2. TX SoundWire device to configure TX SoundWire ports/interface and 
> provide CSR access.
> 3. RX SoundWire device to configure RX Soundwire ports/interface
> 


Are you okay with the existing device layout after providing the above 
information?


  codec {
         compatible = "qcom,wcd9380-codec";
         reset-gpios = <&tlmm 32 0>;
         #sound-dai-cells = <1>;
         qcom,tx-device = <&wcd938x_tx>;
         qcom,rx-device = <&wcd938x_rx>;
         qcom,micbias1-microvolt = <1800000>;
         qcom,micbias2-microvolt = <1800000>;
         qcom,micbias3-microvolt = <1800000>;
         qcom,micbias4-microvolt = <1800000>;
         qcom,mbhc-hphl-switch;
         qcom,mbhc-ground-switch;
         qcom,mbhc-button0-vthreshold-microvolt = <75000>;
         qcom,mbhc-button1-vthreshold-microvolt = <150000>;
         qcom,mbhc-button2-vthreshold-microvolt = <237000>;
         qcom,mbhc-button3-vthreshold-microvolt = <500000>;
         qcom,mbhc-button5-vthreshold-microvolt = <500000>;
         qcom,mbhc-button6-vthreshold-microvolt = <500000>;
         qcom,mbhc-button7-vthreshold-microvolt = <500000>;
     };


soundwire-controller@3230000 {
     reg = <0 0x3230000 0 0x2000>;
     compatible = "qcom,soundwire-v1.5.1";
     wcd938x_tx: codec@0,3 {
         compatible = "sdw20217010d00";
         reg  = <0 3>;
         qcom,direction = "tx";
         qcom,port-mapping = <2 3 4 5>;
     };
};


soundwire-controller@3210000 {
     reg = <0 0x3210000 0 0x2000>;
     compatible = "qcom,soundwire-v1.5.1";
      wcd938x_rx: codec@0,4 {
         compatible = "sdw20217010d00";
         reg  = <0 4>;
         qcom,direction = "rx";
         qcom,port-mapping = <1 2 3 4 5>;
     };
};


thanks,
srini


> 
>> codec@0,3 {
>>          reg = <0 3>, <0 4>;
> 
> We can't have this, as these two SoundWire devices hang on different 
> SoundWire bus instances.
> 
>>     compatible = "sdw20217010d00";
>>
>>          reset-gpios = <&tlmm 32 0>;
>>          #sound-dai-cells = <1>;
>>          qcom,micbias1-microvolt = <1800000>;
>>          qcom,micbias2-microvolt = <1800000>;
>>          qcom,micbias3-microvolt = <1800000>;
>>          qcom,micbias4-microvolt = <1800000>;
>>          qcom,mbhc-hphl-switch;
>>          qcom,mbhc-ground-switch;
>>          qcom,mbhc-button0-vthreshold-microvolt = <75000>;
>>          qcom,mbhc-button1-vthreshold-microvolt = <150000>;
>>          qcom,mbhc-button2-vthreshold-microvolt = <237000>;
>>          qcom,mbhc-button3-vthreshold-microvolt = <500000>;
>>          qcom,mbhc-button5-vthreshold-microvolt = <500000>;
>>          qcom,mbhc-button6-vthreshold-microvolt = <500000>;
>>          qcom,mbhc-button7-vthreshold-microvolt = <500000>;
>> };
>>
>> You'll have to figure out the qcom,direction and qcom,port-mapping parts
>> though.
> 
> That is the reason why we ended up with 3 devices here.
> 
> --srini
>>
>> Rob
>>
