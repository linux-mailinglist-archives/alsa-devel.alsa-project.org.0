Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C41977D34D0
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 13:43:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29FBD850;
	Mon, 23 Oct 2023 13:42:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29FBD850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698061384;
	bh=/bcniv4NrBu83blRSQfbL0HZpZl2zE8+sj0MJaoxIzU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ZentlFaJlRKc+u0kPOBxC/HYS7SSOcIdd4NHtHjvoLB7q9fx+r81Af5w9b/UqI/kY
	 hDdlh8ygaZo4qot5DG9nuqDeHlyzbZ3R8nfCaQDbPQEpTU7jk2vMwbtC8rBHYoucBj
	 vF5F+3BDg/V76DLU8Bz60G677t0USCpjKvOalp9U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3527CF80134; Mon, 23 Oct 2023 13:42:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E43CF80134;
	Mon, 23 Oct 2023 13:42:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7886F804F3; Mon, 23 Oct 2023 13:41:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 792F4F80134
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 13:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 792F4F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=j/L+URqS
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9a58dbd5daeso480012566b.2
        for <alsa-devel@alsa-project.org>;
 Mon, 23 Oct 2023 04:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698061309; x=1698666109;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1bCerCDAEZy49Pjk9AKA1MD4HW0on4gv7aPJ4yjosrI=;
        b=j/L+URqS/YgqycSBFcS1VkZU5K+VlOR2BdmpHUlukpam94nieMls0rS7gXM/bO4i33
         m5HygUvKx1T6kQEVLqghxtPRwu/chX+orT6e/Y5DTjEi+TNMME02C1njnFPEkL9gKQPH
         E75GYSju/LAIbabJsK6IHYJXOFpqNB/dVn6rzQrqs9OisCwGRvU1aimp0BMv6uC3y9tq
         XI6L5MrGL0mwbjEczfWh1tVLGsfAyZUqURFVcSylXsIcj9rUtcyla+7bZ5Se6DJFHRhN
         JEV56q4P3WPk93fKpCv1C3WxUimAUrSYOGa8CSR5KYzYKY1SjtGG/ROfpiSL3Uviof2H
         pOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698061309; x=1698666109;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1bCerCDAEZy49Pjk9AKA1MD4HW0on4gv7aPJ4yjosrI=;
        b=o0Aufx2tcM7JEwk+syhDU14/IPWmxeFomC34dFXCYLS0Xu6rwC7ghD7wUTFMVUh7Y5
         //6H04jxMuVuiQc3fajUctn3lihRS0fuIoARuHNsXa3T0jl7Q8ffIFMXc/ee1ZM3Kctz
         b/+i4EPElh9tFrB5OIMWEIw4pkWzikSWtYfOMmdn2dwj73B4sqhHF2mPLFE7dTP4zF3a
         9XWRFx5LjOuam/ThDwdXU2j8oudaj/RfjIRTRKw6ZyrGYTwA+Lm9elTKRoDCXtaWtFD3
         nLwBePn0QuP2CFtJWjk8GPGiiftuzpwIZjHJP8iSZtqAd2Nm2aHsi6f7Sp79+v2K1ewF
         0WKA==
X-Gm-Message-State: AOJu0YxlNifV3pwmxBsrJ5Yq5Lc2mab6EY4rzFz01fljTOguy4BgmPZC
	KLsnkxHaVMNRZMQU3ODRqH13ug==
X-Google-Smtp-Source: 
 AGHT+IGhi87IDFEnFOgNFUa+IO/q70IXJ9jmoGkRXfWsgXQ4bzB5D+XAhw4ghTqYTur2wbCSLlI1ag==
X-Received: by 2002:a17:907:60d5:b0:9bf:c6a2:d3d8 with SMTP id
 hv21-20020a17090760d500b009bfc6a2d3d8mr7279998ejc.29.1698061309291;
        Mon, 23 Oct 2023 04:41:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 dv19-20020a170906b81300b009928b4e3b9fsm6587999ejb.114.2023.10.23.04.41.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Oct 2023 04:41:48 -0700 (PDT)
Message-ID: <0e34c780-3634-4ca1-954f-c74dc566c7cb@linaro.org>
Date: Mon, 23 Oct 2023 13:41:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add WSA2
 audio ports IDs
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Banajit Goswami <bgoswami@quicinc.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231019153541.49753-1-krzysztof.kozlowski@linaro.org>
 <06a2c115-278a-47e0-b5ba-74639b6b23aa@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <06a2c115-278a-47e0-b5ba-74639b6b23aa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VQ6DBKDWL4OANAN5ARJNULPP6PYK4FYG
X-Message-ID-Hash: VQ6DBKDWL4OANAN5ARJNULPP6PYK4FYG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VQ6DBKDWL4OANAN5ARJNULPP6PYK4FYG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/10/2023 10:37, Srinivas Kandagatla wrote:
> Hi Krzysztof,
> 
> On 19/10/2023 16:35, Krzysztof Kozlowski wrote:
>> Add defines for audio ports used on Qualcomm WSA2 LPASS (Low Power
>> Audio SubSystem).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> index 39f203256c4f..c5ea35abf129 100644
>> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> @@ -139,6 +139,11 @@
>>   #define DISPLAY_PORT_RX_5	133
>>   #define DISPLAY_PORT_RX_6	134
>>   #define DISPLAY_PORT_RX_7	135
>> +#define WSA2_CODEC_DMA_RX_0	136
>> +#define WSA2_CODEC_DMA_TX_0	137
>> +#define WSA2_CODEC_DMA_RX_1	138
>> +#define WSA2_CODEC_DMA_TX_1	139
>> +#define WSA2_CODEC_DMA_TX_2	140
>>   
> 
> Patches looks fine as it is, but do you realize that this s a dead code 
> w.r.t upstream.
> WSA2 is used only with 4 speaker setup and in such cases we use WSA 
> codec dma to drive 4 channels.
> 
> So WSA2 will not be used by itself.
> I would prefer support for this to be added when we are really able to 
> test WSA2 by itself.

OK, the patchset can be ignored.

Best regards,
Krzysztof

