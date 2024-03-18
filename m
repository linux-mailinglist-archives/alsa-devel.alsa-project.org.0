Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9830587E44E
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Mar 2024 08:50:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB997279E;
	Mon, 18 Mar 2024 08:50:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB997279E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710748229;
	bh=y3WZnxaRLumzG6G1ASmxGTs/zWsV4MVpU9WYuiMAELU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qhHrxAk3GR5RZWX/NWutXan4pmG9mRcoThLJkDy3ItGlhtQmqFUU9LY56ZtWONQ46
	 kutPKo8BMWOXTj1B719oRvvb2HNhQaGf739c0d3WUz/vAq7say42mHXppSOy2ynBvk
	 411KIEOu8MqMIZTZElnoFvefbOvkiHkeXQo1T1Dk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DF39F80588; Mon, 18 Mar 2024 08:49:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59316F80587;
	Mon, 18 Mar 2024 08:49:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 132F9F804E7; Mon, 18 Mar 2024 08:46:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C945CF80093
	for <alsa-devel@alsa-project.org>; Mon, 18 Mar 2024 08:46:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C945CF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KXNdOhCT
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a46cc855600so30096366b.0
        for <alsa-devel@alsa-project.org>;
 Mon, 18 Mar 2024 00:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710747966; x=1711352766;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U6FdA6MCBFgFpfyExPtk5oTZiXP8Z8L3nOt0OhNonkg=;
        b=KXNdOhCTY/2CVpG9FuXotBq+m/F4MvOs8wKbNQSFbYHq9xhOzwIMKTNMcBvrVBx9Og
         SzX7RnYh6mpY9Z/Z08z9MCvqsGROz2tdx4+eBdARXTFdxtLRuEYbyVr1sZm2lqmf+aUQ
         FHDm7XJirGLHQXORs5o6nejE/mhTM4Wd4dAeiQ5G14Dhh49rAX77U+I6ZFC9Mxz/Ih5K
         kW0zWT/ON6tmbf7aRUcetE+mM8DvSBZUelmk+jdW3k2aibgmbgudKW4GVn1SkJPPY9uU
         GaNoGnzB9usvasCfZn16XaTzhgAz8tuZcxp7zBkR3Qz6a676aGSxodbbfhdeBkWeJgBq
         HV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710747966; x=1711352766;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U6FdA6MCBFgFpfyExPtk5oTZiXP8Z8L3nOt0OhNonkg=;
        b=NvGc0KfuXBZmhPcToTwjLujZkcf+qS2ZR95ewkJRyZYHSCWH/XdbZ6LYJzFBivSUdD
         on1IfU4wdpyhY5LmcgTGzQtGM8JC7q7589wRAd0oJvu3K9dVSjH1xPP2yK0y+MnJ/Wd+
         6mOt8QX7RgTvMg01foVG1s8dlQIWq8+jkKcmGRW1Mg9FuqWTkhTmY+HMtC7r5YXUG8Ie
         z1LB0EkRuV8ZZ+xOXcbf02pDDP1cBM0b7ORz87fZQCMUKRt7bwWlgc2BGJgMElHhGSvw
         JWXZwXSnAcl//Oh9hHxTuOtZmjX4nK2X7n0bUnl/7PzM+pJB9on/S1oNv9Sc5KtaXjVC
         qN+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2R6zX6a/i361p0eft2T/9lxJak/kzWEr5t1NmsZJaQJJ+5aYpl5NBKP038rwxXVy0Eaozi4hwQQ4u/hV4eeG+JwF3YYBJ/GGlI5s=
X-Gm-Message-State: AOJu0YzVaCUIsLoEFvESDZM+8VUxRTHtENo4sL9N8gew31qnTaQkMfRp
	RDoBem8kocai0mc+zRNveLNc++2rIK/zbXib/i3apfY6m2xLDSSNaIf868NxuNk=
X-Google-Smtp-Source: 
 AGHT+IFLySr29BPlmK1ab29F+3z9XjUhu8TKS1L9V6lJm6vACuiT9TzdJV7XudEk7ySfdgh7lgvVpQ==
X-Received: by 2002:a17:906:3e18:b0:a44:51c1:733c with SMTP id
 k24-20020a1709063e1800b00a4451c1733cmr7411199eji.39.1710747966456;
        Mon, 18 Mar 2024 00:46:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id
 k9-20020a1709063e0900b00a469aaad6e6sm2917532eji.206.2024.03.18.00.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 00:46:05 -0700 (PDT)
Message-ID: <a007c2ee-2777-4db0-bdaa-c119bceeefe9@linaro.org>
Date: Mon, 18 Mar 2024 08:46:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/25] ASoC: dt-bindings: meson: t9015: add support for A1
 SoC family
Content-Language: en-US
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>,
 Rob Herring <robh@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-gpio@vger.kernel.org, kernel@salutedevices.com
References: <20240314232201.2102178-1-jan.dakinevich@salutedevices.com>
 <20240314232201.2102178-12-jan.dakinevich@salutedevices.com>
 <20240317190316.GA2071139-robh@kernel.org>
 <7d61700d-bfb5-46c6-bd45-a18aecf06a5b@salutedevices.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <7d61700d-bfb5-46c6-bd45-a18aecf06a5b@salutedevices.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZPIVS44JHNMPXO3QFG5YEF4P4STNBWS7
X-Message-ID-Hash: ZPIVS44JHNMPXO3QFG5YEF4P4STNBWS7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZPIVS44JHNMPXO3QFG5YEF4P4STNBWS7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18/03/2024 00:39, Jan Dakinevich wrote:
> 
> 
> On 3/17/24 22:03, Rob Herring wrote:
>> On Fri, Mar 15, 2024 at 02:21:47AM +0300, Jan Dakinevich wrote:
>>> Add "amlogic,t9015-a1" compatible string.
>>
>> That's obvious from the diff. Perhaps what does 'a1' mean? What the 
>> difference from the existing compatible?
>>
> 
> a1 means A1 SoC family. The difference is described in next commit where
> this compatible string is added to driver. Should I duplicate here the
> explanation from that commit?
> 

Bindings, not the driver, describe the hardware.

Best regards,
Krzysztof

