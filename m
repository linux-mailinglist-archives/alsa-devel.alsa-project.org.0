Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B92F7E79F0
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Nov 2023 08:59:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12B517F8;
	Fri, 10 Nov 2023 08:58:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12B517F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699603164;
	bh=Wwa8caBSKWXQz6gohnyhLhA7TUQY9A2uJIMM5ckE99w=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=kFUyjfXwufQOCInL7/AB4l7HAZtgV2Y06OCwvRpam6UkhDKYjhWd/ARkjeB4Sa3Wu
	 MCj2s2MhyNyt2bL/KgMF6bQWA1zC9nQULkzXuISPjqiTFkhs6Xbrrwy7qEYLZpg6Wj
	 8JzFZr0J/BmgbPjpCe2OScpa2/mueOP9m2o2r1Mg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C234AF80431; Fri, 10 Nov 2023 08:58:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57FEAF80166;
	Fri, 10 Nov 2023 08:58:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E8C0F80169; Fri, 10 Nov 2023 08:58:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D30AF80100
	for <alsa-devel@alsa-project.org>; Fri, 10 Nov 2023 08:58:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D30AF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FJceSW2+
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40859c464daso12993925e9.1
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Nov 2023 23:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699603095; x=1700207895;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CmNsSkxGNQJ9Q4GP0q3MvT9no1MR/Ri0odVIQEptAvk=;
        b=FJceSW2+/B3xhrkgC3kemxkKMYFTfWyF0B+AeevnvMXortI7liWQIF5dfyDYf7l0MF
         DD2q9+vEZ7MdJIpggXVb+fGjZ7o39o5C1Qflvmcw4J0Dtk8/M0uhQSOQ+/KEsz7sz48t
         iMWmfVNf5OpUzjgIOcKPt10OiJzIxcfhAaC+HOUcxVqFW3hqq7rZ9EWGYTXC6wn3mZIQ
         kp2NvSHGng8SFtXNDcZxdpWIG9oAaw5wwEswTocKjEExGJRngvmT71TSdelEC3B9hmsF
         HeAUKnh6nmVMu0jCjEszYSWLKkWzzkLnuDZBJTQxCvQB7fLyNyDJ0YH08LP0R+mkHm01
         bhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699603095; x=1700207895;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CmNsSkxGNQJ9Q4GP0q3MvT9no1MR/Ri0odVIQEptAvk=;
        b=BkYlPVRVGE6bt4p+k3JFhmZkhKiDXAG+8HJF9nqcZgUcpTFpV8S/e2GFDvWAZbFymz
         s+KwCZ9oiJq0YBuDnYWn5wQKK1L5uSwJC9oFNYJqCECZ6DRuoGYIDk2Gp+VfXQWXu+Bq
         bbhBWUGn8/4dfpk9o3WbPnzG4zJSKZA0+T0JvC7WmVkx5MbCccsQGC0mVkdhQGlj/P6B
         WunBQd1MScq/SD7vit5O9OHwHcdgDTLaV0+SBIPnvv4D1hDYKeunazemJY3xFXbqdrbU
         zHqki6VfnnGAHGjCBT7GS1kPJk/mNhgyv3/PHMUpuAnuWatShWegX+EqV3CRIjiGiztO
         IhdQ==
X-Gm-Message-State: AOJu0YxJt5kbgodOUYxc49Bys3AZ2J4nPr0VJYgLkjpuRK8VBG9fIrLA
	W5eviro4QaeQSw9/Yhc20gGZ8g==
X-Google-Smtp-Source: 
 AGHT+IGZKQiVi/l3PE3rMUGuuZB9Ya3QDCrJYK8NJRwEd76ii8VtTRZDdWH3qx39UjTk9tcaifEFJA==
X-Received: by 2002:a05:6000:188c:b0:32d:9850:9e01 with SMTP id
 a12-20020a056000188c00b0032d98509e01mr4958052wri.61.1699603095075;
        Thu, 09 Nov 2023 23:58:15 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 j17-20020adfea51000000b0032d829e10c0sm1362413wrn.28.2023.11.09.23.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 23:58:14 -0800 (PST)
Message-ID: <9db77625-8dc0-4963-b200-851c209ac238@linaro.org>
Date: Fri, 10 Nov 2023 08:58:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/17] dt-bindings: i2c: exynos5: add specific compatibles
 for existing SoC
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>, 'David Airlie'
 <airlied@gmail.com>, 'Daniel Vetter' <daniel@ffwll.ch>,
 'Maarten Lankhorst' <maarten.lankhorst@linux.intel.com>,
 'Maxime Ripard' <mripard@kernel.org>,
 'Thomas Zimmermann' <tzimmermann@suse.de>, 'Rob Herring'
 <robh+dt@kernel.org>,
 'Krzysztof Kozlowski' <krzysztof.kozlowski+dt@linaro.org>,
 'Conor Dooley' <conor+dt@kernel.org>, 'Andi Shyti' <andi.shyti@kernel.org>,
 'Jonathan Cameron' <jic23@kernel.org>, 'Lars-Peter Clausen'
 <lars@metafoo.de>, 'Lee Jones' <lee@kernel.org>,
 'Ulf Hansson' <ulf.hansson@linaro.org>, 'Tomasz Figa'
 <tomasz.figa@gmail.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>,
 'Linus Walleij' <linus.walleij@linaro.org>,
 'Thierry Reding' <thierry.reding@gmail.com>,
 =?UTF-8?Q?=27Uwe_Kleine-K=C3=B6nig=27?= <u.kleine-koenig@pengutronix.de>,
 'Alessandro Zummo' <a.zummo@towertech.it>,
 'Alexandre Belloni' <alexandre.belloni@bootlin.com>,
 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>,
 'Jiri Slaby' <jirislaby@kernel.org>, 'Liam Girdwood' <lgirdwood@gmail.com>,
 'Mark Brown' <broonie@kernel.org>, 'Jaehoon Chung' <jh80.chung@samsung.com>,
 'Sam Protsenko' <semen.protsenko@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
 <CGME20231108104407epcas5p4c52f140b035727b6110ff7d3c0f81bc0@epcas5p4.samsung.com>
 <20231108104343.24192-3-krzysztof.kozlowski@linaro.org>
 <02bb01da1337$65caf5e0$3160e1a0$@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <02bb01da1337$65caf5e0$3160e1a0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TACIXQ6FV4TL6NMD3FVNXPWNT6QMY6P3
X-Message-ID-Hash: TACIXQ6FV4TL6NMD3FVNXPWNT6QMY6P3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TACIXQ6FV4TL6NMD3FVNXPWNT6QMY6P3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/11/2023 19:05, Alim Akhtar wrote:

(...)

Please trim unrelated parts of response/quote before and after your message.

>> @@ -25,7 +25,15 @@ properties:
>>            - samsung,exynos5250-hsi2c    # Exynos5250 and Exynos5420
>>            - samsung,exynos5260-hsi2c    # Exynos5260
>>            - samsung,exynos7-hsi2c       # Exynos7
>> -          - samsung,exynosautov9-hsi2c  # ExynosAutoV9 and Exynos850
>> +          - samsung,exynosautov9-hsi2c
>> +      - items:
>> +          - enum:
>> +              - samsung,exynos5433-hsi2c
>> +          - const: samsung,exynos7-hsi2c
>> +      - items:
>> +          - enum:
>> +              - samsung,exynos850-hsi2c
> Does this need an entry in allOf:? to indicate exynos850 also has 2 clocks?
> 

No, autov9 is there already.

>> +          - const: samsung,exynosautov9-hsi2c


Best regards,
Krzysztof

