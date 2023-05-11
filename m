Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E99D56FEF74
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 11:55:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 028821E8;
	Thu, 11 May 2023 11:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 028821E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683798905;
	bh=dT6O/qOUjxWK/7UghIzFQ1BJzjhCMJXR7NfFctFuzPg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ph8wwwy4lu8YZVvummdb1t5aPDqp97gpT3SsTqcXXtn1Wy+ecFC/UwmIX2D4E0DfA
	 jRD8q5Zib7VdVJQoXUtvs6WYyo3rSqpmJm0qMrB6V79vEIotb8S0uT1lTwN9GJsmDh
	 t911YnKWeyZOh3ArdHMugmAsvxqve/p7kI0LkOMs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BDCCF80534;
	Thu, 11 May 2023 11:53:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 248C0F8053B; Thu, 11 May 2023 11:53:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C29BF8032D
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 11:53:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C29BF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eBrz8ahO
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50bd37ca954so77543157a12.0
        for <alsa-devel@alsa-project.org>;
 Thu, 11 May 2023 02:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683798805; x=1686390805;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S708+pUvDFYWDhg/1ibK1FeSHqXbBxrzbsAmRoBje2E=;
        b=eBrz8ahOX9Nt+cpSY4jQYBLH5/8Y21ybmI4Eh9suIC0RJIDutSLVZajsfe2MHYqUai
         1VLRvBSY+RmlnV3e2G7l0JpbLLScjAKzVGl9JsWVUBAvzFnKyorYQW2Av0nar80WqIH0
         YpEMWTODP+6Ar/59jgsas//85yL2Qd02TbRezUAEQFdq0+gzbvco8VEvqwcfdMXkPft2
         drRB8JlBsBuFY3Af1cOWInNhg6RKM+U+EXj+vNQFjsUw5tyNnDTzptqZPyWFYeGCH0wO
         YpRWBhygUjuRcgq0nkOnAfooM75wokQbbhTgr3Jv25BayNbZn+nWjhqcMpXHLTF2hyZR
         O6KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683798805; x=1686390805;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S708+pUvDFYWDhg/1ibK1FeSHqXbBxrzbsAmRoBje2E=;
        b=NzICMYI3JTRFvKsnuOWXmQcOHF229UqH2vaOpw7XMoyTSBsDuf88EW4GWNCbLS1aDy
         EXt7nBDp96YylQHXpXax5O1G5LeZ2gbnYC6vHusHh8XHyvEChcfV5WAF8k3dZXL/C7RX
         HZrDovTWDGGIQdFuOB4J0BdYKTYuJzXkEmqlYG2+h8Oj4RRyMt5SHYEf5D6VyX+T7znZ
         xgblv3RlflX+xvNUg0dKqbDlGofR9XxYiWA4bYxwbeu7syE43S4M8zBqWZtXuS5ebR8Z
         /u5OUgCkNLDEVMTvXxM5bhnGdUczd82NiRj75BkaEoEvfYo9MqqZxi4e2kbds0A5HYhN
         cq0A==
X-Gm-Message-State: AC+VfDyCCTdJehMDj1mUMBjSn3KL/iGE0eIqLXTtpL44jJ8J94IpsnJG
	FUIEZXthJiXotWaLoQglSRc8yg==
X-Google-Smtp-Source: 
 ACHHUZ6qMnGtgj1qfIE8u7lEPm6rTd85pDEMMZFe3OwKKQq8fm4MkTTXhsDjhGsGStHPh3U6GVo/Aw==
X-Received: by 2002:aa7:d3c3:0:b0:509:f399:278d with SMTP id
 o3-20020aa7d3c3000000b00509f399278dmr18753088edr.5.1683798805438;
        Thu, 11 May 2023 02:53:25 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7e61:f14a:c3a4:809e?
 ([2a02:810d:15c0:828:7e61:f14a:c3a4:809e])
        by smtp.gmail.com with ESMTPSA id
 q22-20020a056402041600b004ad601533a3sm2777002edv.55.2023.05.11.02.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 02:53:24 -0700 (PDT)
Message-ID: <23ae905f-cc25-a695-5985-7f9742c4b78a@linaro.org>
Date: Thu, 11 May 2023 11:53:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 2/3] dt-bindings: vendor-prefixes: Add ESS Technology
 vendor prefix
Content-Language: en-US
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230510112349.939991-1-aidanmacdonald.0x0@gmail.com>
 <20230510112349.939991-2-aidanmacdonald.0x0@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230510112349.939991-2-aidanmacdonald.0x0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5SOA5FQI5SXIZWLIV2XYYX2UJ64BSUNC
X-Message-ID-Hash: 5SOA5FQI5SXIZWLIV2XYYX2UJ64BSUNC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5SOA5FQI5SXIZWLIV2XYYX2UJ64BSUNC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/05/2023 13:23, Aidan MacDonald wrote:
> Add prefix "ess" for ESS Technology <https://www.esstech.com>.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

