Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0D084CDC5
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 16:12:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFC6C85D;
	Wed,  7 Feb 2024 16:12:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFC6C85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707318738;
	bh=NpStMwCvDk6+DFIzcAl4t+k/9yqfNwhqybVEfPEZJd8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EsDIYv1LVE3ybZVqE8PHG1rzGiO9Hfz/Al6M7YzbY7dQQRFMYgsxt0gEjyikH1GC9
	 uf7S2UPu37S2SuuyRdOqbgxlWBXnOhXfZTKfAyNRCUpWlyeqmJAJ1aiEp2mTuNsBux
	 PDYABSlbKWeiANHVMr8j2Cv6tcD6w9C7RWZQX/QY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32545F8057C; Wed,  7 Feb 2024 16:11:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16764F80570;
	Wed,  7 Feb 2024 16:11:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E385F801EB; Wed,  7 Feb 2024 16:11:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04ED3F8016E
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 16:11:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04ED3F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jqZOaQGD
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33b4b121e28so427857f8f.1
        for <alsa-devel@alsa-project.org>;
 Wed, 07 Feb 2024 07:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707318694; x=1707923494;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Awilv/LJeoQrPlNq8IqEh5NNjUL2yw9niQAoG1MQmfA=;
        b=jqZOaQGD1CXmU4tkDhIafMXIZeVSn5tF1Hh5Gf1YwM6tI7YWVGKC3eqCuEuLuQOvOn
         X245vHmOM/l70xfKRn1oJH4ioKP4fNBJn/UVRg1mquqGNwy8g57EOCzYBbF/tFi2mAiE
         vug1BxaWN1DNwu9j57oTwrGffAoEM9xm5Ef9EUCk9IHAgHwjI87PGF6rP1dmYpmmGB+B
         zyVCHaQ4/Iu68bLN00rWRHm7FsAWffX5RxeLe1D3WAlHigbUnE2G5l5fx5gLirP9jS7R
         Ji7s1tqwKmfi/nhs4T9DOADR/fRfdi4q6aTbaTn1n226sag61bv0og2H4QEYMwYEJGLF
         9fgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707318694; x=1707923494;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Awilv/LJeoQrPlNq8IqEh5NNjUL2yw9niQAoG1MQmfA=;
        b=GKBOg6f8fXI/9py8ko4Q4rinAF4/OItUusI1F2FEgDKcO2cJ0oc6JfWhVBwmTTQL2c
         iaN5aVINI9eSS0dXlgbLdu2vL2r0bCcZ5246pX266Bfyi3dKpLuu8JG6KOcpQN/9Q25l
         ebS5wCZp5xZmL9kbml7J5DwBYH9cq9/G+GLsL6ou05fbpjBeNN9R/gVG3lXlrwdqiVkb
         v2Zuh0CfD9CEzu95Xbq4xnDONARKnQ50iEFMQwxlamd9ZMb26SdUTd0k4c1A66kBky/w
         o96kx+olF1h1rzkHPNmQHM/eg71uwiM4N2z+O19m+1rzJCUdkB1CTdnt8RXpuwazCrza
         CQAA==
X-Gm-Message-State: AOJu0Yxp0GQBg/XQTwBvmSbh2kdIwmMx0vnBciVr+3vtGAVp/XFY/9/o
	E0ZwurkBJvdaNRBAOP/f0I8bjCgKGjh/Sm8FgxBmoGx0nCHw8IZ4L1B1Bl2KBNI=
X-Google-Smtp-Source: 
 AGHT+IEvGd/xHfCmS0M7CqZPHpDerWULSPGgmBjH0z0hPi12G17r1CcsmbkvWlBqZPMnjxYt9Ulk0Q==
X-Received: by 2002:a05:6000:232:b0:33a:f521:7066 with SMTP id
 l18-20020a056000023200b0033af5217066mr3644148wrz.9.1707318694011;
        Wed, 07 Feb 2024 07:11:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVlPjkWYbguLAUaahW0k+ufOKqLDWUF0NAxAaK+2UfzaeRxaCmDB8FZfkmOeepTi7FhB4GGiN+MJ2E+hRw6YsN9gmUdG8RzQ4pUSO5QO3fFfdgDBsuPKbAuv8kQSgqwkM05y4sAiFM6f94GcKB8WIR1NArS6m1GZWVX3VVFIScT3jxDWPnRJ0yeznA/hL+Kwvr253H8H3SMf8bR0KSzj1paLdIJ5VMhIFTVs/0YPqvIicfbi7cnuBdU0TxDEKQZY3sRBIR4lWusCEE2qK9lTm/4D23Fx7H1uQXkEZ0d2F7iDivXI8PLlsKFoo8vxuyW92ygSRdXuExX3W5ojD9Ha0vTiw9Mh7uTnYYz6pwz12yxWgfjIaN+T3omeeejZ8ZAIOhYDub7DlcvHqCcHdIgDaY7zXMxe+Whzot6g8+Dl6LTBPMAvW7JkBnJgkxfOF5XzeEWb9p44Bmmpv8kfYZpSk02SQg0BX2dHMvtwqi3pmajLQVPYe42KsE/MgM5HS00OiBzzaf/x8PCP1l29ZTap/ENthn5
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id
 dr9-20020a5d5f89000000b0033b14f22180sm1784995wrb.20.2024.02.07.07.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Feb 2024 07:11:33 -0800 (PST)
Message-ID: <cd2c5ad8-902c-4ea3-8bb1-7f71f130bcc9@linaro.org>
Date: Wed, 7 Feb 2024 16:11:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: dt-bindings: atmel,asoc-wm8904: Convert to
 json-schema
Content-Language: en-US
To: Dharma Balasubiramani <dharma.b@microchip.com>, claudiu.beznea@tuxon.dev,
 lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: hari.prasathge@microchip.com
References: <20240207094144.195397-1-dharma.b@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240207094144.195397-1-dharma.b@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GC2TD2IGCS2AIV4RFUDZU46XKUQO77ST
X-Message-ID-Hash: GC2TD2IGCS2AIV4RFUDZU46XKUQO77ST
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GC2TD2IGCS2AIV4RFUDZU46XKUQO77ST/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07/02/2024 10:41, Dharma Balasubiramani wrote:
> Convert atmel,asoc-wm8904 devicetree binding to json-schema.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

