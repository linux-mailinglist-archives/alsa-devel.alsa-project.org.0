Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E448E6FEE3F
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 11:02:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59015F84;
	Thu, 11 May 2023 11:01:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59015F84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683795738;
	bh=GJZMAzYXG3V/hbY+bDSaOz1GCyE2jdepbMC6wmGTfAA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dYv14zBIzXxrEtpsEqbs72fIRJvZVUGo1c42shz+V2Z68RfnVoOVjcgAuqpls1KRO
	 3RF5Ir+nwIYRs54o7YWbFJoAUc7POXERDRFugJ25yv4YQzb5+lvOs2GuchYpKRRdp+
	 S4mZ1z9BljicT7NO6u0BZgpRDgtElJw81Irq5ORg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0592F80310;
	Thu, 11 May 2023 11:01:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68102F8032D; Thu, 11 May 2023 11:01:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97005F800BF
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 11:01:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97005F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cWCRSOdD
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-50bd37ca954so77119323a12.0
        for <alsa-devel@alsa-project.org>;
 Thu, 11 May 2023 02:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683795674; x=1686387674;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0CisL2rUE4Hw6hlxlukZuowP2tixyFGxjkXdRANpN4o=;
        b=cWCRSOdDgP46O6T1hMKoF/8U0aNMUK8Rt1UUXmAgisr+nnDt24sRYnhmXSx0YMLi83
         Tv43KqVI7M8dGwOuXmp8wTGaoxcLPIwynVL4gr9HdgdeTAf+OQpE1waZuLzcsxy/sSFg
         TU91PqWhPY7irbdfC+m/heDD7O5PtIBYYnFatINeBL0Qq6zYPgNdp5yYmK8wLPzMZMeD
         t3E9QC3y6K9mud1kciwYf5qkS8vVkcXlbeRqutAixTGCkB532igmHdiKaoGRWdZCtOcM
         3KQQhkOh1Qb5OKi4Ud7op4c9SDpIuOj3br7U2WB85Ik+qmGm2UoSKohftY7lDJ0zsRSl
         D+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683795674; x=1686387674;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0CisL2rUE4Hw6hlxlukZuowP2tixyFGxjkXdRANpN4o=;
        b=iu7+PET08ZZpRwwWPbAIlkO4kT0vU6LGx5ZodlB6uonyYKzeBJHsAipZ/L7gRYJyTa
         I8JsAKhgLgek/qvUzvaF+pe9lQo8sXbDZh3bSonb9+vpxgM+i8ELHsiXagIY7FKOdbYu
         WdJwitPBqrn+HE+m2DHW5RjbG6JmkkXPs8+OjDmm94huX7B0ZyIPmksHvbQ4BbmkEHYw
         A2xelUNlMD1OVi2BaTe2g28xTlTQpf5ai/oA76u0I4BkYZCiy7gxIHOLebdqUW2MfjRE
         BaOR9LpzD7mXbWHwAWbr8Qgf8ume9hNUJOfY0UtYX2tj6mHj16EoWYDRvcrAxmdbblzb
         9cdg==
X-Gm-Message-State: AC+VfDzIzIs5fyeGiB3OT5i3oIcSjSvU8Axhr6qHY+QwEEq0MxW97+Hi
	MiUJSr2wcjPRpJbX4zVklQQxzQ==
X-Google-Smtp-Source: 
 ACHHUZ6KOZWGlcRewxIzNr2yQQxjbZCIQpTw1t3mlu3ayU+bXuAyBCLXZ+Z5vsm6LCoN8NVEKftVCA==
X-Received: by 2002:a17:907:da4:b0:966:4e4c:a36d with SMTP id
 go36-20020a1709070da400b009664e4ca36dmr12121142ejc.20.1683795674367;
        Thu, 11 May 2023 02:01:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7e61:f14a:c3a4:809e?
 ([2a02:810d:15c0:828:7e61:f14a:c3a4:809e])
        by smtp.gmail.com with ESMTPSA id
 w10-20020a170907270a00b00965e9a23f2bsm3679359ejk.134.2023.05.11.02.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 02:01:13 -0700 (PDT)
Message-ID: <1959eb8a-d55f-5f62-2b41-0e7ea41b27b2@linaro.org>
Date: Thu, 11 May 2023 11:01:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXTERNAL] Re: [PATCH v2 2/5] ASoC: dt-bindings: Add tas2781
 amplifier
Content-Language: en-US
To: "Ding, Shenghao" <shenghao-ding@ti.com>
Cc: "Lu, Kevin" <kevin-lu@ti.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Xu, Baojun" <x1077012@ti.com>, "Gupta, Peeyush" <peeyush@ti.com>,
 "Navada Kanyana, Mukund" <navada@ti.com>,
 "gentuser@gmail.com" <gentuser@gmail.com>,
 "Ryan_Chu@wistron.com" <Ryan_Chu@wistron.com>,
 "Sam_Wu@wistron.com" <Sam_Wu@wistron.com>,
 Shenghao Ding <13916275206@139.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz"
 <perex@perex.cz>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
References: <20230508054512.719-1-13916275206@139.com>
 <ca9d45cf-8a84-4fbc-e1dd-c96eef36fe25@linaro.org>
 <c088d7dce83a45168d0dc25fee4a9e35@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c088d7dce83a45168d0dc25fee4a9e35@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4GKA7UBKHOV4XKCUTIL2LZXI2UAWB3R4
X-Message-ID-Hash: 4GKA7UBKHOV4XKCUTIL2LZXI2UAWB3R4
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4GKA7UBKHOV4XKCUTIL2LZXI2UAWB3R4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/05/2023 16:03, Ding, Shenghao wrote:
> 
>> +    items:
>> +      minimum: 0x38
>> +      maximum: 0x3f
> 
> ... So these are fixed? No need to encode them in such case...
> 
> and anyway actually I agree with Rob here - these addresses should be put in reg.
> [DING] if all the put in reg, the i2c_probe will be called several time. The code don not want to register several codecs, but one codec including several tas2781s.

Eh? Why and what would call probe multiple times for one device? It's
the first time I hear... I don't know, maybe Linux I2C has some
specifics, but sounds surprising.

> 
>> +      description:
>> +        I2C address of the device for different audio slots,
>> +        useless in mono case.
>> +
>> +  ti,broadcast-addr:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      Generic I2C address for all the tas2781 devices in
>> +      purpose of I2C broadcast during the multi-device
>> +      writes, useless in mono case.
> 
> Probably you can figure it out from previous addresses and there is no need for this property.
> [Ding] this address is the common address for all the tas2781, it can be used for dsp firmware downloading to all the tas2781s in parallel, which can save more downloading time

So the answer is yes? Then please drop it... If not, say why it cannot
be deducted from other addresses (e.g. last address + 1).

Best regards,
Krzysztof

