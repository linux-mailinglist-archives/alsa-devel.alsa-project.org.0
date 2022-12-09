Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D329D648454
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 15:57:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AACDE2247;
	Fri,  9 Dec 2022 15:56:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AACDE2247
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670597842;
	bh=saI1ACDmKuQAj+M2GUVyLcERGMWim3Lm36bIi/+Amb0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=UH8RU8hxzMkzw4ridxFxpS/aFr8CYxWh6wgRNKg1NX46ADNxHQuV19ZbUEiCghpD2
	 ucSL08rftO7JPy52Pa9sAk3/3/yntzUNq/meEltfl+h6Y7JUhjS6PHWxrDoLSyzHsY
	 ltTfMqXS7yAIk7wGzVvq0NTddJqiVCHaNzGnmIXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53EABF8024E;
	Fri,  9 Dec 2022 15:56:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 961B8F80007; Fri,  9 Dec 2022 15:56:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CE03F80007
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 15:56:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CE03F80007
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oK6qJslO
Received: by mail-lf1-x12e.google.com with SMTP id b13so7423259lfo.3
 for <alsa-devel@alsa-project.org>; Fri, 09 Dec 2022 06:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zn39Cq6H46SfgCPMDp1Yyg4Hy1ifOLwJBJ6L3zqm8MM=;
 b=oK6qJslOKT34uL/1v4g3iVT1myebBNEM4jqIgvwqM03/FD9DabncthU7iZSDV0Dw6V
 XsercsMR7iFL4hosx9kgIZ9YzmeCwbSXsSX4/PK42T64csirCJrUZDGR63AA3gzG1g41
 zlLghgCExlKP16+a3f94HqnFX/ZzAhWZHtnZtcyd5lQqtnZGVR+xrZz6v60MtrThIAwE
 XQEk16WFuKtIqjvbXFNEA7UN1gFNRMxtw2StjPUdNgiBZiUp23HOjBaOGribElE0U6rD
 481bOTOymtR3SVQCOPXoy+Dnb7PRwjW6PGEXoMZeDb2M9MiCGeBIBtnUuFWXLdoTE2dW
 +kEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zn39Cq6H46SfgCPMDp1Yyg4Hy1ifOLwJBJ6L3zqm8MM=;
 b=w066tbDwY24mpVhw9LJ6leqjOmVdkW8l26EgbH1cX0Jzsx0XL4fxnvi7mmyjnj1Hcu
 jYS+ca8F/sDFjK047HKZIz5FwI+JFhYX2eCBmZArmlesD3Y6jIOKnNfts3P4vFYUbB0M
 yswrU9DZdzdAKX8dH/D685RCz1zXb77k2tBqL8/VELr3pFa4QRvHxPDf7eMoDWdnplQ2
 RDhm14FJrbfXT0+80ypFI59QgbkBJg9tSXn7bUYPB4kpmUN8AOUMNbcFJaSdQP9buvmo
 mUbUHu4QKSj9jCu9geJ5PpbZEy0eTXMgkzuxJMtJ6lRIQBhxooE8Lg3h0z3pLz5NR/wC
 vOsA==
X-Gm-Message-State: ANoB5pm63SOl1dCHgpG7P0fCqozqVMgWImVLqYWVJzJxizg82Rj/IH0i
 ASrQt+B6yrJDuvuYhrUupnCVjw==
X-Google-Smtp-Source: AA0mqf6+eQqJYIlJ4RBGy5DkLM0OPyqhKXbsUkA+Jn4oqxjdS9sXP0vfO1VIWussQDLHIAES8/dMgw==
X-Received: by 2002:a05:6512:13a2:b0:4a4:68b7:d61d with SMTP id
 p34-20020a05651213a200b004a468b7d61dmr2041235lfa.4.1670597785748; 
 Fri, 09 Dec 2022 06:56:25 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 h9-20020ac24d29000000b004b50b4f63b7sm287771lfk.170.2022.12.09.06.56.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 06:56:25 -0800 (PST)
Message-ID: <fb34e446-2904-a357-e54b-3e82a2b0745c@linaro.org>
Date: Fri, 9 Dec 2022 15:56:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 10/12] dt-bindings: mediatek: mt8188: add audio afe
 document
Content-Language: en-US
To: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>
References: <20221208033148.21866-1-trevor.wu@mediatek.com>
 <20221208033148.21866-11-trevor.wu@mediatek.com>
 <d7d9f3c7-b3e3-1e13-a80f-c7bf7b38a5b1@linaro.org>
 <45b4b287dfd57b99e0ba5675bf99194f6d84d9da.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <45b4b287dfd57b99e0ba5675bf99194f6d84d9da.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 09/12/2022 11:56, Trevor Wu (吳文良) wrote:
>>> +
>>> +patternProperties:
>>> +  "^mediatek,etdm-in[1-2]-chn-disabled$":
>>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>>> +    minItems: 1
>>> +    maxItems: 16
>>> +    description:
>>> +      By default, all data received from ETDM pins will be
>>> outputed to
>>> +      memory. etdm in supports disable_out in direct mode(w/o
>>> interconn).
>>> +      User can specify the channel ID which they hope dropping and
>>> then
>>> +      the specified channel won't be seen on memory.
>>
>> So we know what are the IDs but it's a mystery what are the values.
>> Especially with unique values - how any of these should case that
>> channel "won't be seen in memory"?
>>
> For example,
> FE can support 14ch, but BE(etdm) can't support 14ch(it can support
> 16ch).
> In the case, we can configure 16ch to etdm and make use of the property
> to disable the last two channels.
> 
> mediatek,etdm-in1-chn-disabled = /bits/ 8 <0xE 0xF>;

Your description should explain that this is a list of channel IDs which
should be disabled.

> 
> 
>>> +    uniqueItems: true
>>> +    items:
>>> +      minimum: 0
>>> +      maximum: 15
>>> +
>>> +  "^mediatek,etdm-in[1-2]-mclk-always-on-rate-hz$":
>>> +    description: Specify etdm in mclk output rate for always on
>>> case.
>>
>> How is it different than assigned-clock-rates?
>>
> This includes clock enabling at init stage.

assigned-clock-rates are also at init stage. I asked what is different.

> 
>>> +
>>> +  "^mediatek,etdm-out[1-3]-mclk-always-on-rate-hz$":
>>> +    description: Specify etdm out mclk output rate for always on
>>> case.
>>> +
>>> +  "^mediatek,etdm-in[1-2]-multi-pin-mode$":
>>> +    type: boolean
>>> +    description: if present, the etdm data mode is I2S.
>>> +
>>> +  "^mediatek,etdm-out[1-3]-multi-pin-mode$":
>>> +    type: boolean
>>> +    description: if present, the etdm data mode is I2S.
>>> +
>>> +  "^mediatek,etdm-in[1-2]-cowork-source$":
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description:
>>> +      etdm modules can share the same external clock pin. Specify
>>> +      which etdm clock source is required by this etdm in moudule.
>>
>> typo: module
>>

Best regards,
Krzysztof

