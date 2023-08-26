Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C6B789568
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Aug 2023 11:47:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BABB084A;
	Sat, 26 Aug 2023 11:46:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BABB084A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693043265;
	bh=MDTTgiV84DUxfi9XTkOGCROuhSkT4GCeLUGDO+nXC5o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uNW1gDyChQBeZMNTdHIvmdj0nsb8DQl2AJirFWikdQU8/YxC4wLaG5rcyRp356Qd0
	 fTjBdaY3Y0aZDvjRy8eZ+C6zrgzEbphRerMbpzJhxkn+6xKZClJortEQizkKaL6qHh
	 GbYnBg5CaMXuikbRfU/mLWCxcs0CMwpgQZD6otdQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A40FF804F3; Sat, 26 Aug 2023 11:46:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9894F800F5;
	Sat, 26 Aug 2023 11:46:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13591F80158; Sat, 26 Aug 2023 11:46:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CE4E3F800D1
	for <alsa-devel@alsa-project.org>; Sat, 26 Aug 2023 11:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE4E3F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lmCoxeIq
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99bf3f59905so205971866b.3
        for <alsa-devel@alsa-project.org>;
 Sat, 26 Aug 2023 02:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693043205; x=1693648005;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xEbLos18PAXF+VWDexugVSPY8cGgVPouJFgqeAIgj2g=;
        b=lmCoxeIqztpe+opKBbUijFsC6GOPWVrhtomY78qaM6TlZjVaPJSPk8s5ZlFe61FC7l
         p39cb4dpX1s+D3B0Jnrz9M1ECcH5aO7DTRyZAynGM5icqJjRr+caI80bdPdVM8Uw5+NN
         nIraLLC7pxJAmJt/QEdO7exAcUMsT7DxAnUaheSCaI1U3qsTqzHK68dinbD21gZDajGR
         rpiMi+G5nsu8DTn3+mDwZyD5pepNbhLfnuJ8CCWI2BVJzMQs+oylBtMUuKtL7vF1V+R0
         dryzW4yO1sm0IETnkgkdQ9rKJMt269re2UQrEfOKeCK99vBwCHZE993T2DmaX9r1Epqq
         5bKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693043205; x=1693648005;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xEbLos18PAXF+VWDexugVSPY8cGgVPouJFgqeAIgj2g=;
        b=EmDcQaFYa1OH2WPw3w70URh9f9cBu53AJRp74qcJBMTc5dse2eqvgpDK4owVST4Iz1
         d9n857ysRy+FzUkiNyatLwOQ0/PhZRUdtkVoZkPew4ZIpzkHalweL6LPg+hH01i9HUdS
         2RFX/izoy8mzC9/6cruqjOxQsu0cWd9pljfGTkxpdNpjlGaNArFBE/0eIOtj0iSAcXRd
         ChqGmDcgORYlSN/xkeUaW5GfdbEmjznt2EjW019WXNIF9n0/P4PCCN//CKSoFZsUMMJn
         HJFB/IgmArvoBwB8n6tE2aoUVEQMBivQKDlCU7dtkY6mkBd2rCaF8WGRmFQaTuastuv9
         bVKQ==
X-Gm-Message-State: AOJu0Yx8a0KMYU0YB9Q7FZ4uXtfG5s29rU1jYmnkCXGQcmzlMay6hHPm
	Q7oPtEYBlYYgTZ4P9NcY28zgyg==
X-Google-Smtp-Source: 
 AGHT+IEP7ndTWQOR+5ImclTFoFfHYoXYsPwZTnUGtRVfLr6CS1R55d2YXHpGL89sNFFvaNIT17wSUg==
X-Received: by 2002:a17:906:2098:b0:9a1:dd2a:c2c6 with SMTP id
 24-20020a170906209800b009a1dd2ac2c6mr7448605ejq.8.1693043204734;
        Sat, 26 Aug 2023 02:46:44 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id
 d14-20020a17090648ce00b0099cb349d570sm1939294ejt.185.2023.08.26.02.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 02:46:44 -0700 (PDT)
Message-ID: <4007687e-1176-cffa-5945-94787fe6d5d9@linaro.org>
Date: Sat, 26 Aug 2023 11:46:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom,lpass-tx-macro: Add SM6115
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230825-topic-6115tx-v1-0-ebed201ad54b@linaro.org>
 <20230825-topic-6115tx-v1-1-ebed201ad54b@linaro.org>
 <1a0dc235-eb44-9923-6206-560199a70d4e@linaro.org>
 <f3c43297-1b05-47b6-a158-5b45df77cfed@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f3c43297-1b05-47b6-a158-5b45df77cfed@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TXNBCT542XNP7MBEK7ZPCS2YUUDZ4KUZ
X-Message-ID-Hash: TXNBCT542XNP7MBEK7ZPCS2YUUDZ4KUZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TXNBCT542XNP7MBEK7ZPCS2YUUDZ4KUZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26/08/2023 11:37, Konrad Dybcio wrote:
> On 26.08.2023 11:32, Krzysztof Kozlowski wrote:
>> On 25/08/2023 19:23, Konrad Dybcio wrote:
>>> SM6115 has a TX Macro, requiring an NPL clock, but not DCODEC.
>>> Document it.
>>>
>>
>> ...
>>
>>>  
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          enum:
>>> +            - qcom,sm6115-lpass-tx-macro
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          minItems: 4
>>> +          maxItems: 4
>>> +        clock-names:
>>> +          items:
>>> +            - const: mclk
>>> +            - const: npl
>>> +            - const: dcodec
>>> +            - const: fsgen
>>
>> Are you sure there is no macro? This means there will be no
>> LPASS_HW_MACRO_VOTE vote.
> Yes.
> 
> Do you have downstream sources somewhere?
> Also yes, but they're not public..

Indeed. Looks correct:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

