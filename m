Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E07229D0A0
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 16:21:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E859A15E2;
	Wed, 28 Oct 2020 16:20:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E859A15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603898490;
	bh=F+AzjqEpoAaHHMF7j7CaliNkSn0nJMbhAhc375L5yFM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KdMu+HXE5hXaIoRBX1DfijzE/TJ5EtGQPm28CkhGr+RjVRtn1kxG0l7T5X4DnP2Ut
	 7wljD8mz9LfhBIX0msYcetsRtrC076vhjmYS6Cqy9ZT+sFXNFKMueJn/65eAjWseJ7
	 8mpc17gdSaRO99v15Oi/0BRWvlussSr2ltTnlzas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52304F80249;
	Wed, 28 Oct 2020 16:19:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 712AFF80212; Wed, 28 Oct 2020 16:19:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E0C1F80134
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 16:19:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E0C1F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rUP+JJfw"
Received: by mail-wr1-x444.google.com with SMTP id n18so6123536wrs.5
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 08:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x514F6gZYdZ6Ml7d5BwMRGVQM3GbGutbqJsB1Ozu+Nc=;
 b=rUP+JJfwCO3GMrN5WC7KVKpPvj7+iVkYGyHDLhTqKl5FYjGMBB9DnL1ZGaYO/jNIg8
 Lmt5mX1qdOC0eGxqN5xlwtilpqSAObS9rs51EeMhivf7Vs+z9mMXkB+CRPyqPURdSIfN
 JYCHh3ZhhOGtzQi+iaReVKTHtfPLu/WSSsAVeGL9zlWzem15a2h3Or/1GODbdn4s/8B5
 l3XBxCxYTKHt9pf2QV2L8p2L+OoUXBjb8sU8nAE4H63h4nygaKide9qwB5WpLHNPS8eP
 tR6lyFTZ4x6cYyBJyrR2JVtzrNA1ikmJ7rDagJims9vxm3CmJbcrmuPaFDCn4tCiRv1G
 U7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x514F6gZYdZ6Ml7d5BwMRGVQM3GbGutbqJsB1Ozu+Nc=;
 b=jGuJ5N5PweT+2sFyLT+1NZ467w5BHUpvaIUiukMh5ii1ZIX5QOTFpAIuuRKUjWx5aL
 dF0AgoZlHVNAiBLkK8bjZ52xbP9iHdtTCmFw8FiO3wvZyFfRAzpewHKbHp7XP51VU7nr
 UIzYCbXpUBJShmrN6bjha7DkcZZuzbWy/EJWn/qBG1JB+BRoCQDY51lfklcjZ9nPgOqW
 P65anyIUBMnU1HOgP+C1nFKO7Nodp1JFvOJ9RDaR4lElEcCEMzJ9auO8Ir1ypsTn1zP4
 IaRDoiPkZMBx095+ET5Hj+8cWzVZ7tn9bWMik+qKhvZXiO7vimsQeOF8v9W7qxAbrJB1
 M79Q==
X-Gm-Message-State: AOAM531twdjQPu99eZZaUJJKGkdzonaBaYYoy7wWRse4/b4UbOoGpZUU
 TXAHTurIWX3N5lAae3mDx+za7Q==
X-Google-Smtp-Source: ABdhPJxmgjy0sWYNhQDDvIzYf6zbC83N2esx/kijWUC+e1Ze75JVCM/aZaXbPnw77v647Bv/IDoHrA==
X-Received: by 2002:adf:f146:: with SMTP id y6mr3245254wro.418.1603898386817; 
 Wed, 28 Oct 2020 08:19:46 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id e2sm5699576wrr.85.2020.10.28.08.19.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2020 08:19:45 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] ASoC: qcom: dt-bindings: Add SM8250 sound card
 bindings
To: Rob Herring <robh@kernel.org>
References: <20201026170947.10567-1-srinivas.kandagatla@linaro.org>
 <20201026170947.10567-2-srinivas.kandagatla@linaro.org>
 <20201028150135.GA4009047@bogus>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <31981724-b260-e94d-ebc6-ccea21763531@linaro.org>
Date: Wed, 28 Oct 2020 15:19:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201028150135.GA4009047@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 plai@codeaurora.org
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



On 28/10/2020 15:01, Rob Herring wrote:
> On Mon, Oct 26, 2020 at 05:09:46PM +0000, Srinivas Kandagatla wrote:
>> This patch adds bindings required for SM8250 based soundcards
>> for example Qualcomm Robotics RB5 Development Kit which makes
>> use of ADSP and Internal LPASS codec.
> 
> You didn't send to DT list...

Ah.. my bad.. I did not realize that I missed it!

> 
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   .../bindings/sound/qcom,sm8250.yaml           | 161 ++++++++++++++++++
>>   1 file changed, 161 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> new file mode 100644
>> index 000000000000..b8f97fe6e92c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> @@ -0,0 +1,161 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,sm8250.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies Inc. SM8250 ASoC sound card driver
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> +
>> +description:
>> +  This bindings describes SC8250 SoC based sound cards
>> +  which uses LPASS internal codec for audio.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,qrb5165-rb5
>> +      - items:
>> +        - const: qcom,sm8250
> 
> This collides with the top level SoC compatible resulting in:
> 

I did run dt_binding_check before sending out this patch, I might have 
missed it somehow because the make dt_binding_check did not 
end/termnitate in any errors, however if I had scrolled 15-20 Page ups 
it does have this error log!


> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: $nodename:0: '/' was expected
> 	From schema: /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/arm/qcom.yaml
> /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible: ['qcom,qrb5165-rb5'] is not valid under any of the given schemas (Possible causes of the failure):
> 	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible: ['qcom,qrb5165-rb5'] is too short
> 	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['qcom,apq8016-sbc']
> 	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
> 	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['qcom,apq8074-dragonboard']
> 	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
> 	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
> 	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['qcom,msm8960-cdp']
> 	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['fairphone,fp2', 'lge,hammerhead', 'sony,xperia-amami', 'sony,xperia-castor', 'sony,xperia-honami']
> 	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,msm8916-mtp/1' was expected
> 	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['longcheer,l8150', 'samsung,a3u-eur', 'samsung,a5u-eur']
> 	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,msm8996-mtp' was expected
> 	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['qcom,ipq4019-ap-dk04.1-c3', 'qcom,ipq4019-ap-dk07.1-c1', 'qcom,ipq4019-ap-dk07.1-c2', 'qcom,ipq4019-dk04.1-c1']
> 	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['qcom,ipq8064-ap148']
> 	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['qcom,ipq8074-hk01', 'qcom,ipq8074-hk10-c1', 'qcom,ipq8074-hk10-c2']
> 	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['qcom,sc7180-idp']
> 	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['xiaomi,lavender']
> 	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['qcom,ipq6018-cp01-c1']
> 
> 	From schema: /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/arm/qcom.yaml
> 
Documentation/devicetree/bindings/arm/qcom.yaml does have 
qcom,qrb5165-rb5 entry under [qcom,sm8250]

Can you help me understand why is this not a valid compatible?


> Also, the indentation is off:
> ./Documentation/devicetree/bindings/sound/qcom,sm8250.yaml:21:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> 
I will fix it!

--srini
>> +        - const: qcom,qrb5165-rb5
>> +
>> +  audio-routing:
>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>> +    description:
>> +      A list of the connections between audio components. Each entry is a
>> +      pair of strings, the first being the connection's sink, the second
>> +      being the connection's source. Valid names could be power supplies,
>> +      MicBias of codec and the jacks on the board.
>> +
>> +  model:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description: User visible long sound card name
>> +
>> +patternProperties:
>> +  ".*-dai-link$":
> 
> '.*' at the beginning is not necessary.
> 
>> +    description:
>> +      Each subnode represents a dai link. Subnodes of each dai links would be
>> +      cpu/codec dais.
>> +
>> +    type: object
>> +
>> +    properties:
>> +      link-name:
>> +        description: Indicates dai-link name and PCM stream name.
>> +        $ref: /schemas/types.yaml#/definitions/string
>> +        maxItems: 1
>> +
>> +      cpu:
>> +        description: Holds subnode which indicates cpu dai.
>> +        type: object
>> +        properties:
>> +          sound-dai: true
>> +
>> +      platform:
>> +        description: Holds subnode which indicates platform dai.
>> +        type: object
>> +        properties:
>> +          sound-dai: true
>> +
>> +      codec:
>> +        description: Holds subnode which indicates codec dai.
>> +        type: object
>> +        properties:
>> +          sound-dai: true
>> +
>> +    required:
>> +      - link-name
>> +      - cpu
>> +
>> +    additionalProperties: false
>> +
>> +required:
>> +  - compatible
>> +  - model
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +
>> +  - |
>> +    #include <dt-bindings/sound/qcom,q6afe.h>
>> +    #include <dt-bindings/sound/qcom,q6asm.h>
>> +    sound {
>> +        compatible = "qcom,qrb5165-rb5";
>> +        model = "Qualcomm-qrb5165-RB5-WSA8815-Speakers-DMIC0";
>> +        audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
>> +                    "SpkrRight IN", "WSA_SPK2 OUT",
>> +                    "VA DMIC0", "vdd-micb",
>> +                    "VA DMIC1", "vdd-micb",
>> +                    "MM_DL1",  "MultiMedia1 Playback",
>> +                    "MM_DL2",  "MultiMedia2 Playback",
>> +                    "MultiMedia3 Capture", "MM_UL3";
>> +
>> +        mm1-dai-link {
>> +            link-name = "MultiMedia0";
>> +            cpu {
>> +                sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA1>;
>> +            };
>> +        };
>> +
>> +        mm2-dai-link {
>> +            link-name = "MultiMedia2";
>> +            cpu {
>> +                sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA2>;
>> +            };
>> +        };
>> +
>> +        mm3-dai-link {
>> +            link-name = "MultiMedia3";
>> +            cpu {
>> +                sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;
>> +            };
>> +        };
>> +
>> +        hdmi-dai-link {
>> +            link-name = "HDMI Playback";
>> +            cpu {
>> +                sound-dai = <&q6afedai TERTIARY_MI2S_RX>;
>> +            };
>> +
>> +            platform {
>> +                sound-dai = <&q6routing>;
>> +            };
>> +
>> +            codec {
>> +                sound-dai = <&lt9611_codec 0>;
>> +            };
>> +        };
>> +
>> +        wsa-dai-link {
>> +            link-name = "WSA Playback";
>> +            cpu {
>> +                sound-dai = <&q6afedai WSA_CODEC_DMA_RX_0>;
>> +            };
>> +
>> +            platform {
>> +                sound-dai = <&q6routing>;
>> +            };
>> +
>> +            codec {
>> +                sound-dai = <&left_spkr>, <&right_spkr>, <&swr0 0>, <&wsamacro>;
>> +            };
>> +        };
>> +
>> +        va-dai-link {
>> +            link-name = "VA Capture";
>> +            cpu {
>> +                sound-dai = <&q6afedai VA_CODEC_DMA_TX_0>;
>> +            };
>> +
>> +            platform {
>> +                sound-dai = <&q6routing>;
>> +            };
>> +
>> +            codec {
>> +                sound-dai = <&vamacro 0>;
>> +            };
>> +        };
>> +    };
>> -- 
>> 2.21.0
>>
