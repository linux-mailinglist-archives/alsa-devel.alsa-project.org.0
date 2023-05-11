Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C18B6FF4EC
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 16:49:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B206EBE;
	Thu, 11 May 2023 16:48:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B206EBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683816580;
	bh=fxduqBSlDFTFlSIvVsbXWMi2P2QLrFn+pgrxquMLBjk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pbyFHp7cmBVM2H1NSjuTKMbPQ1tFIRFFtQTyj7g7zs9eofpZyDFeFJRVf63jHCO1U
	 a83KylDuNvW4Nm1OCdv2BV4nrzajkyHgIAm+hv81LpzPPZCZ7kAtVah80nQ4LV+bpP
	 ObCLXyfmXpfjxUgAd+iSPWGgx+jFIQFB8JPeEkbo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27EEFF80542; Thu, 11 May 2023 16:48:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94370F8032D;
	Thu, 11 May 2023 16:48:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9913CF8052E; Thu, 11 May 2023 16:48:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D63B2F80310
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 16:48:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D63B2F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ee6Reohc
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-50bc2feb320so13563204a12.3
        for <alsa-devel@alsa-project.org>;
 Thu, 11 May 2023 07:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683816514; x=1686408514;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N0lfFs0fI//pMtIuen9dWfRi/CQXFUiQ87w8iR2kEQ4=;
        b=ee6ReohcdKtHzMX4Il1SxxYW/4EIKTeBtclivjZNcGDTVgnn0dtlZ58A9QJEG41fub
         87bPHyFGkr0YBMc7MGgFJ390dYvv7Rk3Ts4ZyD/ame48ImPvtesSPg0ecyrw5o91hZCn
         8VB8pGJ0IJBjE2TalK8iqP9rH/BqwXOWrpZxKlJGLIpf23oPXM1NplRxs0gjomZEKT8/
         eK7cRqldc+ZZ8n8xrnjbpUv4hibV+dAU8S/oAEd23vvTyeP5C2DUiVKXY0Rd9CoWF31Y
         o9B9WKra88JlKMuu6uICJ5AsZ7a66gry4YfSiRZ/yufSnGrfPzdOm9cELtYYG5Q3pRkn
         HsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683816514; x=1686408514;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N0lfFs0fI//pMtIuen9dWfRi/CQXFUiQ87w8iR2kEQ4=;
        b=HvYP2Q+GIbAtp6Fpy5t2yxRo923X5Aj/q3LLuGszzproBo1lr4Peu3MqiR306+ttxt
         lnVxDxhYc9kdwDI2zKsOPQjoaXrfsR5cmW28BxTGCMn4LW28buKgMxKEP91qBguoRT9f
         ufr3sLcFWZgyXoy4ogeb/ETot2oN/fMTS1qXL0iZYM1qxPN3LvZOggaKJKQ5Ua4O684Q
         iGS1obLZEGa6uOcmrmQA53MXBrxunPLf/HdtpPBhr3XQBd9niR+wiXwQRO5F9AptS0t4
         2Vnp2Tvfsp4HzNAgbSd7FwKmCQSNHhYvfxO43q+hKXupVP23cvm5Ut4hiYznXB9eygm5
         JqMA==
X-Gm-Message-State: AC+VfDyHw5PbUZG3NEv4EhLc3OAcr6rt+JTmhWKHUh92oNzSx357Dtoo
	hpTbXj9Y1yhQi9wZNkH5DEjFIQ==
X-Google-Smtp-Source: 
 ACHHUZ5SvCEOd79yMZBuWOdQEKZfi1ooo8OMgkXarqDS2HjcJIA8fsyYDjZAWVoqIcFsSADtl9+21Q==
X-Received: by 2002:aa7:c6c9:0:b0:50d:f881:1afc with SMTP id
 b9-20020aa7c6c9000000b0050df8811afcmr1725396eds.23.1683816514512;
        Thu, 11 May 2023 07:48:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d7cd:1be6:f89d:7218?
 ([2a02:810d:15c0:828:d7cd:1be6:f89d:7218])
        by smtp.gmail.com with ESMTPSA id
 b17-20020aa7c6d1000000b004fd1ee3f723sm3030633eds.67.2023.05.11.07.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 07:48:33 -0700 (PDT)
Message-ID: <3e62d34b-a439-ac42-83a1-deb26ade63ff@linaro.org>
Date: Thu, 11 May 2023 16:48:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXTERNAL] Re: [PATCH v2 2/5] ASoC: dt-bindings: Add tas2781
 amplifier
Content-Language: en-US
To: "Ding, Shenghao" <shenghao-ding@ti.com>, Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <13916275206@139.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "perex@perex.cz"
 <perex@perex.cz>,
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>, "Lu, Kevin" <kevin-lu@ti.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Xu, Baojun" <x1077012@ti.com>, "Gupta, Peeyush" <peeyush@ti.com>,
 "Navada Kanyana, Mukund" <navada@ti.com>,
 "gentuser@gmail.com" <gentuser@gmail.com>,
 "Ryan_Chu@wistron.com" <Ryan_Chu@wistron.com>,
 "Sam_Wu@wistron.com" <Sam_Wu@wistron.com>
References: <20230508054512.719-1-13916275206@139.com>
 <ca9d45cf-8a84-4fbc-e1dd-c96eef36fe25@linaro.org>
 <ZFyBzHWo3ORKAskX@finisterre.sirena.org.uk>
 <ca2ed8e9-850a-56c5-e395-72e5861b9c71@linaro.org>
 <3c48d5e47aff478b8ce8998d7efe001b@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3c48d5e47aff478b8ce8998d7efe001b@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: A3UZ2CJSVIMVNE6I6SLXBRFC3K2HQE64
X-Message-ID-Hash: A3UZ2CJSVIMVNE6I6SLXBRFC3K2HQE64
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A3UZ2CJSVIMVNE6I6SLXBRFC3K2HQE64/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/05/2023 15:19, Ding, Shenghao wrote:
> 
> On 11/05/2023 07:49, Mark Brown wrote:
>>> Missing minItems, but...
>>
>>>> +    items:
>>>> +      minimum: 0x38
>>>> +      maximum: 0x3f
>>
>>> ... So these are fixed? No need to encode them in such case...
>>
>> I'm not sure I understand your concern here, there's up to 4 possible 
>> values from 0x38-0x3f which has more than 4 possible values.
> 
> Aren't the addresses going to be incremented by one (up to 8 of devices in total)?

With your style of replies, it looks like you wrote it...

> 
> No, the i2c address order is not always monotonic increase or decrease, sometime it would be disorder, according to the application.
> Each device would have eight possible i2c address, the final address depends on the hardware connections.

OK, the question about the broadcast is still there - cannot it be deduced?

Best regards,
Krzysztof

