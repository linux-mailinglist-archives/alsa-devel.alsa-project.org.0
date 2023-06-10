Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EB272AA79
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 11:09:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD7C01CE;
	Sat, 10 Jun 2023 11:08:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD7C01CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686388156;
	bh=XXST1+fb+x4YwZkjoN0oJu/F4n3pKknJgscz57rh1p0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KeJPWYBVy7Et3Im1QFvbMJ1t0ck5TObkMl4ccMioqhER9Zgo003qlFtRRuwl5C/JC
	 7lkSl6pZbBPgQ+zo+p/X8FZZsZryOI86kc7uN81jnEi4L5YWSQR8k0bIhI8/5U6PP1
	 /iCEFqOjWryd2udbo7m0uGgHhnxpXJDvsRzcstBY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56D52F80290; Sat, 10 Jun 2023 11:08:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02423F8016C;
	Sat, 10 Jun 2023 11:08:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EC5BF80199; Sat, 10 Jun 2023 11:08:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F334F80155
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 11:08:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F334F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wjM3Jfnb
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51493ec65d8so4540572a12.2
        for <alsa-devel@alsa-project.org>;
 Sat, 10 Jun 2023 02:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686388094; x=1688980094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=10why2ZoKYh8OCF9t05JfVcsTcRRTXdo00tGW5eG4P8=;
        b=wjM3JfnbHH5o8w0xdL/Mhg8l3ykNyNiWyo3xZDAtY+1thDWlBisez4R36Q37ymOimy
         5U4IL0DiurhhmjDGaTnNFLezHP9qoDb03NcW97L5UlfxCgc+IylCqkHpd50jsD9j/3XO
         iD+R/+EI44R9jKiL9bprzZC10S/4Bb64UH2CfLcjjM7v9+C66X+87duNhh7BM/ekGcgJ
         8bfkC/Y+cUxJNqrxgZcSnxSvCZ2ZI4O97nMkxk6DChgXK/SQvVdNMRKK2EWEFgI+6r1q
         kbf/KZAZqnsC5Sqn99BOuKTvfKEXDV1ifykNdaETQZ4+18/ob0BaY/9cSKphms7mPAaL
         V8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686388094; x=1688980094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=10why2ZoKYh8OCF9t05JfVcsTcRRTXdo00tGW5eG4P8=;
        b=Qw3Z5ix0mBARriTzmZher8L/sgAzr2L+vgYp4Q047ZxD8EHvrFv0AJ/BexV3Q0ZGpO
         98hQsbH5QnaLol94BwcUZHnUQKVKjmjel6W6xdzcJ39p0TwVnCoi8A8zGYOBXXK2wkpz
         ld8ks5zEQgxfbiipYKIr9OUrzQCWh5GNNPdydnoLRaAgU6CRV/SUAXOXsKN9czHqNBs2
         VGNBsSGUBNnB+wwszkGYKHZWNe/CtwdQGRto6W7RkuJZbVSzXXPWUmuIqe8k98DtfybK
         Bm0lZNlwDWWDYjvAGjPM5F5FNikQkdSm5FMt1jBXYi6zTWqr9VgQrwR8LRX+efIMkYdv
         Nk0Q==
X-Gm-Message-State: AC+VfDwvMbcSx1hXkXyspsDkWEJgirTZBHL3+ArzJS2APNc8PLZjSZje
	A5coISntAvC7EhvN9L73QGdG/w==
X-Google-Smtp-Source: 
 ACHHUZ7TsTyV7WKhpiWifl81yyvWaV2hJqCukEWQuqIz3aoJZs6EarLjzpDWqbSuq3qU9W73+A4Rew==
X-Received: by 2002:a17:907:6d9e:b0:97e:a917:e6a5 with SMTP id
 sb30-20020a1709076d9e00b0097ea917e6a5mr226842ejc.19.1686388093875;
        Sat, 10 Jun 2023 02:08:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 b16-20020a170906151000b009746023de34sm2325501ejd.150.2023.06.10.02.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 02:08:13 -0700 (PDT)
Message-ID: <84588a21-135a-adf0-e6c7-146c1305cbbd@linaro.org>
Date: Sat, 10 Jun 2023 11:08:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH V2 1/2] ASoC: dt-bindings: max98388: add amplifier driver
To: =?UTF-8?B?4oCcUnlhbg==?= <ryan.lee.analog@gmail.com>,
 lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, tiwai@suse.com,
 rf@opensource.cirrus.com, ryans.lee@analog.com, wangweidong.a@awinic.com,
 shumingf@realtek.com, herve.codina@bootlin.com,
 ckeepax@opensource.cirrus.com, doug@schmorgal.com,
 ajye_huang@compal.corp-partner.google.com, kiseok.jo@irondevice.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: venkataprasad.potturu@amd.com
References: <20230609234417.1139839-1-ryan.lee.analog@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230609234417.1139839-1-ryan.lee.analog@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: D5TJTMICGQ2ZMO5HOSNKATN37F5P2PGK
X-Message-ID-Hash: D5TJTMICGQ2ZMO5HOSNKATN37F5P2PGK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D5TJTMICGQ2ZMO5HOSNKATN37F5P2PGK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/06/2023 01:44, “Ryan wrote:
> From: Ryan Lee <ryans.lee@analog.com>
> 
> Add dt-bindings information for Analog Devices MAX98388 I2S Amplifier
> 
> Signed-off-by: Ryan Lee <ryans.lee@analog.com>
> ---
> Changes from v1:
>   Removed unnecessary blank line and description. Modified quotes.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

