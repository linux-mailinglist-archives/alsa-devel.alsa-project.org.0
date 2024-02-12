Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C738851D32
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 19:48:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34011852;
	Mon, 12 Feb 2024 19:48:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34011852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707763715;
	bh=BFJjN8ONCgkmsa4PW9qUxSQnQuER8UwLgYKkgYkqKj4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=mN1QBvwMtYztp6GbCBSEQ1Nr60Od1K+14ijYAJ3yR+zLMXp0EQtjDQiPkCzB2IkFr
	 sPgtghb7mzmq4OeBe9aro9G2IDUwy7Ag9nK9h6mkbLrF0TKFIfrIttKWNMePuXhmNu
	 PmMF/hFy5iEZoD+kL5JAD3cz5ZHNU6DsX5GFiYYs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D56EFF80238; Mon, 12 Feb 2024 19:48:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2647F80568;
	Mon, 12 Feb 2024 19:48:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2A73F80238; Mon, 12 Feb 2024 19:47:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4630F800BF
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 19:47:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4630F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MQMOl9hr
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-410c59a3e46so10528195e9.3
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Feb 2024 10:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707763672; x=1708368472;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SYWSvZSGyZd1GI0l4m1/e99sDhaFp9G5rCeC7L8H0xo=;
        b=MQMOl9hroPzBtFLSiNKkf3mXDd1zHqYTbpMwp1YoAlPBsMFsfgeZjflSy8CKBAOCkK
         kcx4IaGJiizzdo+UPQlUrqxkfQ9tEKrmvz0esgwZCKE7xZtSqR8M5IK4f5UMI3lfgXAv
         +vXv/maE31sdZoJ3fEipsr1YXeilHzd8i8JcWiRaX8bJfZoIryLSCc90gr/0+Px7RAe9
         iKjGOJCFbXcZgAbd1bkSaHUhhsV+CUaofgtaYV3SdN7AINTHbt/G8gttwWJftzJXt+/B
         lSUth767SVM7kV74Q1iW6jkcUNPx8o6UkyvDWxitY5Iu/ZitEVr+VqxCzwVLx099HbBL
         CYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707763672; x=1708368472;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SYWSvZSGyZd1GI0l4m1/e99sDhaFp9G5rCeC7L8H0xo=;
        b=kEqOvsmzIwTBFO4H5uwMiEt2+PJ41hldk9vmCIWxKUvpf1y+8w5tptN6lnNmXZ1Net
         W/cklXgIaKsni1taA7NYtEgyNX4fOfWJQHL+fFwGGzGsEzETpP7ZaOb3q2jvvyda5Z36
         Kn2NBz7R6vTXtxFfS5r3Bop0J3emGDZ7w3EjC5NGW7YUmIIIBhYD4ntvDbjzrS7jPSCx
         a1CjRoHWwWa6/tcFDAnds8N+1vYqGDK+GPqFDrvdpJ8cHTb7fCl6OrFOGm8XQEh8bbXO
         qCS6Ni0ocZJT5bnmseIkrczXDOfTPRqaJ0Je33SoiSDK5SEGLc06X9Ajy866xOZtRAZr
         1YMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX1pQEO/lHbEMh6Z7SKq71iQGGp21Fhu/LEPy7AEqfdLW8/FrEGEvGGam3I5/PfA2OQx732GqN2ZSy/G9A1M5uA/oe/XATil1nZ+s=
X-Gm-Message-State: AOJu0Yzv7zBQab8PCnAcN+gppyFNN+B3fX53g6bixp/ncUCoMLzfxfqb
	cLh1+EgT1MTXdDvU/3Lre+4NB2A3CdvbhLHqjcUzxAnHj7LhAfIFNUgj/rauPpw=
X-Google-Smtp-Source: 
 AGHT+IE0ArX+pv8YDqS8Zzy/USZGC+ffgmfFlW3LkewjS26gDJQVwoHo+wq4KsMfWrkLlPw3YuDanA==
X-Received: by 2002:a05:600c:45c6:b0:410:4a3:1ae7 with SMTP id
 s6-20020a05600c45c600b0041004a31ae7mr6383316wmo.17.1707763672400;
        Mon, 12 Feb 2024 10:47:52 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUESZbskZAkeimcJbyMJK1tBzW6vO3rcPrK/aTQVfNFkN1ZmZep48UQlLeihUE7Xu8uzyZrUVOlu9hDWPmhIk4E1/kVmCnBpfaNV90oJJn2zFQY5tVKKy3D9JrlIAx4FcCIpykS31AL3qt9Vd60eGdfkP/E662yXmh9eafM9Vw6OXdZFtAl4WvAA9cbdUIDz46IdyjtKim/babwPjqnhfmxOA2JgOmJVH2TJqy/Xe6rYLWSrxVreLBz5HeOx6vtZv/OSb2ndzgXtzSDKEegoV1QnyKR5WN5LLfcRzDXEp1t3SKuG7IuENIbH8WV784Ap+oKtOH16Y0EAanL98cIFyj6MoA1oqgYW5WFh+VHfr+4oJdQn/UIUELiyPmDi8pofxALewo1d8ygmkee/3xFjdN7xR+4KHqWhShPYtPzu5eVhxothTvHn8oGx907nocOlNg616jqhFh29L+QknsCfGZ/zJ10ksH5s+ksNujQioSNO1WGGaWzWhU1WaHeC+Iz04oYY7E=
Received: from [192.168.1.20] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id
 v8-20020a5d43c8000000b0033b512b2031sm7466475wrr.114.2024.02.12.10.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 10:47:51 -0800 (PST)
Message-ID: <44eec61f-5294-4f2f-b80e-56b8a9f220fa@linaro.org>
Date: Mon, 12 Feb 2024 19:47:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,sm8250: Allow up to 8 codec DAIs
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240212183800.243017-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240212183800.243017-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2GQB6SJLGKR7GATEVMXZQWDJU33GO6KN
X-Message-ID-Hash: 2GQB6SJLGKR7GATEVMXZQWDJU33GO6KN
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2GQB6SJLGKR7GATEVMXZQWDJU33GO6KN/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/02/2024 19:38, Krzysztof Kozlowski wrote:
> Sound card on Qualcomm X1E80100 CRD board has eight DAIs in one DAI
> link (for WSA speakers).  Boards with older SoCs could technically have
> similar setup, even if it was not observed on mainlined devices.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> DTS with X1E80100 sound card using this:
> https://lore.kernel.org/linux-devicetree/20240212172335.124845-5-krzysztof.kozlowski@linaro.org/T/#u

Apologies, wrong link:

https://lore.kernel.org/linux-devicetree/20240212184403.246299-1-krzysztof.kozlowski@linaro.org/

This is not a dependency, just providing relevant work for reference.

Best regards,
Krzysztof

