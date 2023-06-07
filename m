Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD532725611
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 09:42:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0AB86C0;
	Wed,  7 Jun 2023 09:41:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0AB86C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686123722;
	bh=e1syM3wF9tCo53BmDyCbfw0xLXzv1kc9iBvJvh69tVY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HDVsIDZzA6Tr0iQeDgNauJ0phWtWRMtDGvTh/NOFPWJs/x+g4z4fxXY1DCxowq1QS
	 KvjqdMff8Rkb5IA9yMzGylLndBWQDtmv5zdSjrIIrnOK4Wx7krI/v4YF7jP8iJxwJF
	 MxpeFqHfNFDN528WgLiucSAZ7/swZoJmWXQyangQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74C6DF8016C; Wed,  7 Jun 2023 09:40:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0026AF8016C;
	Wed,  7 Jun 2023 09:40:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8AF7F80199; Wed,  7 Jun 2023 09:40:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3E11F80130
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 09:40:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3E11F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dpiv/lAa
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-51475e981f0so860429a12.1
        for <alsa-devel@alsa-project.org>;
 Wed, 07 Jun 2023 00:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686123640; x=1688715640;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QzNzUxBgctT5U3+gB3td/wPDXx9tt+J9TkByw444vb4=;
        b=dpiv/lAao6jUqNRWIwDa/t6LO1tyPxkPWni1OUv3MwCcaBvBG9TZJWlQAsTwrpJG8z
         WiSLr3KTYWPNapPhFe4g/UQTjDvdv2Kh5m3vUHx2Uvn0qhMaWW7936pz4POvuJM/IQsq
         Nj5IuPvfSkJvvk2/lgKSqanZnlPWCLIWckttk5fd61hIvF0Cv5Sw1t5kE8iZvriviEW+
         In+gf5HZQY8yoXdiDm/zttqRTvXjVTxgNdcYNhuap4h3KffjSa1/I4wWvgR5nzhKYxNl
         ilEXGjb2B7MxuIK+KjltPks5gdQ0IXXIg2nLLmfmXMao4M6uuWPsgMMFy1+JhqAIHqER
         v4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686123640; x=1688715640;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QzNzUxBgctT5U3+gB3td/wPDXx9tt+J9TkByw444vb4=;
        b=YbmyCqsUHs4R5LJYDP2jYu9YJX/HPDd0D4cjO0dcIJG8N0aaz6phT9wzLbVMBicKQS
         nYHLQhkz/khO55bdP4bh9hoohItqU3NdlT7TxvtuJQ9OdBYKfgF7FOBDS74uZujGoulx
         Bjd6ZfmII/vutb9eo2lolSgMRJRRUdy9EEXljZYGtpzUZGcoZUD0tzjphL4bIs3pXaN9
         JE7al/LjMVBshVf35HEZc+g5NurOU5t+9nx1Ipdf8vE90mf0nsvn2OLT02bFB7ArYYIn
         wEm3ZxabGLfz7NHot0HZXuhBtlUU5Dx+CfYqmnY5u4XbUn7jodOsAIswlHP0hm/HsaIF
         oG3A==
X-Gm-Message-State: AC+VfDzXKgB/EAg6t4G7FmnRLGdXGJs6fi7PlxsSizKW4WACBJR+J5ZR
	OqSGfWthoiSgZYY0Fi9WADObCw==
X-Google-Smtp-Source: 
 ACHHUZ6nIjpeIRlx7fPahFZ5gzxmNl29452UMvG6AuY1y9w+PrjwLC4zGKqXZHhvW+xhYzrUW9v6Ug==
X-Received: by 2002:a17:907:9403:b0:965:cc76:7716 with SMTP id
 dk3-20020a170907940300b00965cc767716mr4912526ejc.76.1686123640173;
        Wed, 07 Jun 2023 00:40:40 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 k16-20020a1709065fd000b00977db7d08cbsm3376124ejv.74.2023.06.07.00.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 00:40:39 -0700 (PDT)
Message-ID: <f141a538-23b8-d10e-227c-5f0ad191c3a6@linaro.org>
Date: Wed, 7 Jun 2023 09:40:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 2/7] dt-bindings: pwm: restrict node name suffixes
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, Dipen Patel <dipenp@nvidia.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Dilip Kota <eswara.kota@linux.intel.com>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-spi@vger.kernel.org, timestamp@lists.linux.dev,
 linux-watchdog@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Oleksij Rempel <o.rempel@pengutronix.de>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
 <20230530144851.92059-3-krzysztof.kozlowski@linaro.org>
 <20230607073652.hoyrernfcuoryrqs@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230607073652.hoyrernfcuoryrqs@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZUUMP3LNE55CM44D4GTS7WGJSEDXDDAO
X-Message-ID-Hash: ZUUMP3LNE55CM44D4GTS7WGJSEDXDDAO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZUUMP3LNE55CM44D4GTS7WGJSEDXDDAO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07/06/2023 09:36, Uwe Kleine-König wrote:
> On Tue, May 30, 2023 at 04:48:46PM +0200, Krzysztof Kozlowski wrote:
>> Make the pattern matching node names a bit stricter to improve DTS
>> consistency.  The pattern is restricted to:
>> 1. Only one unit address or one -N suffix,
>> 2. -N suffixes to decimal numbers.
>>
>> Suggested-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
>>
>> ---
>>
>> Cc: Tony Lindgren <tony@atomide.com>
>> Cc: Oleksij Rempel <o.rempel@pengutronix.de>
>> ---
>>  Documentation/devicetree/bindings/pwm/pwm.yaml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/pwm/pwm.yaml b/Documentation/devicetree/bindings/pwm/pwm.yaml
>> index 3c01f85029e5..abd9fa873354 100644
>> --- a/Documentation/devicetree/bindings/pwm/pwm.yaml
>> +++ b/Documentation/devicetree/bindings/pwm/pwm.yaml
>> @@ -13,7 +13,7 @@ select: false
>>  
>>  properties:
>>    $nodename:
>> -    pattern: "^pwm(@.*|-[0-9a-f])*$"
>> +    pattern: "^pwm(@.*|-([0-9]|[1-9][0-9]+))?$"
> 
> With this patch we forbid now the following patterns:
> 
> 	pwm-[0-9a-f][@-].*
> 	pwm-0[0-9a-f]+
> 	pwm-[a-f]([@-].*)?

Yes, this was discussed last time:
https://lore.kernel.org/all/20221127182232.GA128974-robh@kernel.org/

> 
> Checking for such names:
> 
> 	$ git grep -oP '\bpwm-([0-9a-f][@-].*|0[0-9a-f]+|[0-9]*[a-f][0-9a-f]*)(*pla:\s*\{)' arch/*/boot/dts
> 	arch/arm/boot/dts/meson8.dtsi:pwm-f-ao
> 	arch/arm/boot/dts/meson8.dtsi:pwm-e
> 	arch/arm/boot/dts/meson8b.dtsi:pwm-d
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-a
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-b-x7
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-b-x19
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-c-c
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-c-x5
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-c-x8
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-d-x3
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-d-x6
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-e
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-f-z
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-f-a
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-f-x
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-f-h
> 	arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:pwm-a-e

Are you sure these are pwms, not pins?

> 
> These are all pinmux-settings and no pwm nodes, so the change is fine.
> (But arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi isn't properly
> sorted alphabetically.)

Exactly...

> 
> Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>


Best regards,
Krzysztof

