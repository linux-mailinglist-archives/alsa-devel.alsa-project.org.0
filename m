Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C98FD843B7D
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jan 2024 10:53:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B135514F2;
	Wed, 31 Jan 2024 10:53:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B135514F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706694833;
	bh=fTIfhqGw1d/HJR+aqs5SB6WwWZFYD2zxuQWrfL/S1dw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HOO7R5EhIGf1saMjGEh/L2zW2boHZPl7B++jooeh+Kpc5CWZ0Kyqo4x4dYJz4wk02
	 KVGgHm0rrmqTMOr2VdiWhOF7URPTE9HR46kEyt3T2ARHzfvX8XFkc+xSVfhFlgZxiN
	 MNfPs8eORfsOMQ9pdIwiwwMtNLnCmSbI6sJ5RzM0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C05EF805A9; Wed, 31 Jan 2024 10:53:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC041F80564;
	Wed, 31 Jan 2024 10:53:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3701F80564; Wed, 31 Jan 2024 10:52:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CB26F804E7
	for <alsa-devel@alsa-project.org>; Wed, 31 Jan 2024 10:52:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CB26F804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YSGMNysR
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d043160cd1so39913981fa.1
        for <alsa-devel@alsa-project.org>;
 Wed, 31 Jan 2024 01:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706694764; x=1707299564;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vy9ag9vSpz3bXWFEemDbbZ5ICpPB9T59zqDCvXFR710=;
        b=YSGMNysR2R5t1RDSkGsa8uzzQ6szdS7bmBgQuURpEZQwbmnwZM6Pk+DhCMRoA5kb4V
         x6wWYOuDuBd4wYIHp9pyMnK2BdySHnIRGSncrBqrRlkJIY0B8hPga66LW1dVIFLyoMP2
         Saxj2IcoKo+kVWD+r47nzX0/uOejGEkXZPFWJezj3pxrHe94x2IngsvL2pfGLPrEQY6u
         6gQRvXoQanoxs6bDMMT67PQGF6gRK7Wbr++BR0/5sdwm3C0ndo6leHlyJKGw0mU7h+7f
         46jybKESmlpw9mOy2c1mAebp9C8phg7kNAkJvzmuvY9If9mZkn0JUQubIJT+VO44NObo
         4nnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706694764; x=1707299564;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vy9ag9vSpz3bXWFEemDbbZ5ICpPB9T59zqDCvXFR710=;
        b=IMSifa60Ug1AIPfH+jnnpCp9dGiG0pd8NxIj/mPuq4ZS1VmMZvmOM/GA2pNawzwW5s
         CgY1wwuVY4fXPhf0P/AGl7cRcz0lEOPAKSt/sSCmGwL93xgBHQLSUOrzBCf4do6vE+QD
         DyQg6TGmgnw62UCzrnr9p2HlVggy4sw/RZzqnAMYLOnDdeZmnVIjDg7yoPHFTmo42U3E
         w9++cIMnuhnNCzqhKllEclbO9uadFcTHOEP+Bnqgaz4th4GqZm7wDJ9qDY3SZCU70jXZ
         PKBelfIoMg703wsiH8v4Lk4+nT5R+loIwy34jhMfUIsuW/UrB2kS78bksL7UJQBDOnU6
         X3mQ==
X-Gm-Message-State: AOJu0Ywm1ZrxA47sopDQZvyTvai9x4HBfluTd0FNoTesKDr+u9AkAlSd
	ozwZdNJLGqNhkKD46IWaxNoKCdXaxIxYqoMIXY5yet9dU3r5awuCwJ8XgbjHvXU=
X-Google-Smtp-Source: 
 AGHT+IG6Xu1C1j6SyDZmreNSX8+xfoVcpAMVxiflT3WbYkQ3umBoKf9MN0TWAMy06KSGoLm0U6GKsA==
X-Received: by 2002:a2e:84cd:0:b0:2cf:2db4:cd84 with SMTP id
 q13-20020a2e84cd000000b002cf2db4cd84mr772150ljh.49.1706694764460;
        Wed, 31 Jan 2024 01:52:44 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVn6dszHl2gPrVUm94CT0J4a9x7kfsAG5Hj3PD80ZzNLeSwkoamvLdSKKTaKtRk6oSlN90EMwaN63rcgt/tJPc5cFZkCN1yV2ChH0Ujbe57KAWr2E2BgTQ2d8dz5W8p6F/2T89v+tEN8rFblqbb8aJVQ07BvyslkrD8XTmmTn4ZnaQICNStWkmmxswOuUqTyApWOFIDmrgvrWer56bdOTO14h8gY/8GJYnVO+ikOw6ggTQajutJj0oH6qYlUNWB6ZmocLNeTufdb/g+wJwpqWCogykXmnfgx3RUFPcKqXKdI/49WbaBVgm/anhAu+K5cH2iwtQj5A7BP4Muuds6wLD+gmohkhr9w6vzNHy6KJtIAVvkkXZfzMVhUSh0kkNRjB5oRltTV4w2/Qgk/8PFwtIF+YnbRSorbmzqxlmTqCl2jTKWpW8ZATL0xI/LSlNQLjy06ON752/jClZj3CCeENZRjv1vnkWskxO15uWAWiz9OvbEZhT8nx8UwUZ2XELt7wN3V489ZXnhTSdzXytxVx4pd/RXSC3Ml84zhUysoaMS0du2ncpX9fB6Fn3D2wJE+SO4EoaXYDyVjRgkb/HnBX9g9F4YfHjIPQDS+LK5nU+ccR5rNYc8TjttcZHfFn5gqHCUx/fPqekaXMt/G7jgBtYHIYly+Zoy63J53TBMZ+lBww7evLpFrdMUYIiI4pwLFcYu2L0MX8s9GtPXIpHrZgw0iILaA58qzlUSevF7S1znTdvBR/GlzgK2K8gY3jz+Q6ioTvisMTIJeKhZIShhZb5/4lJFBqmm4m+SBkQzwsYCmfMKDZeSYbcxAcBlbTasFfeBeW+9dw==
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id
 di11-20020a056402318b00b0055ef0105f2fsm3426803edb.80.2024.01.31.01.52.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 01:52:43 -0800 (PST)
Message-ID: <3f906732-74b7-4219-88ee-59509bff8459@linaro.org>
Date: Wed, 31 Jan 2024 10:52:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] reset: Instantiate reset GPIO controller for
 shared reset-gpios
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Sean Anderson <sean.anderson@seco.com>
References: <20240129115216.96479-1-krzysztof.kozlowski@linaro.org>
 <20240129115216.96479-5-krzysztof.kozlowski@linaro.org>
 <CACRpkdYf4HUaV-Pjr81WjLbzy9zdAnyFWs9gPayPC6-3OjHQwA@mail.gmail.com>
 <6473952d-893d-4591-9bfd-dd983313bee9@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <6473952d-893d-4591-9bfd-dd983313bee9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L2ZSSK66WEGGSNMFQW3ASKK62A5XPP6N
X-Message-ID-Hash: L2ZSSK66WEGGSNMFQW3ASKK62A5XPP6N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L2ZSSK66WEGGSNMFQW3ASKK62A5XPP6N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 31/01/2024 10:50, Krzysztof Kozlowski wrote:
> On 31/01/2024 09:57, Linus Walleij wrote:
>> Hi Krzysztof,
>>
>> something is odd with the addresses on this patch, because neither GPIO
> 
> Nothing is odd - I use get_maintainers.pl which just don't print your
> names. I can add your addresses manually, no problem, but don't blame
> the contributor that get_maintainers.pl has a missing content-regex. If
> you want to be Cced on usage of GPIOs, you need to be sure that
> MAINTAINERS file has appropriate pattern.
> 
> 
>> maintainer is on CC nor linux-gpio@vger, and it's such a GPIO-related
>> patch. We only saw it through side effects making <linux/gpio/driver.h>
>> optional, as required by this patch.
>>
>> Please also CC Geert Uytterhoeven, the author of the GPIO aggregator.
> 
> 
>>
>> i.e. this:
>>> 2. !GPIOLIB stub:
>>>    https://lore.kernel.org/all/20240125081601.118051-3-krzysztof.kozlowski@linaro.org/
>>
>> On Mon, Jan 29, 2024 at 12:53 PM Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org> wrote:
>>
>>> Devices sharing a reset GPIO could use the reset framework for
>>> coordinated handling of that shared GPIO line.  We have several cases of
>>> such needs, at least for Devicetree-based platforms.
>>>
>>> If Devicetree-based device requests a reset line, while "resets"
>>> Devicetree property is missing but there is a "reset-gpios" one,
>>> instantiate a new "reset-gpio" platform device which will handle such
>>> reset line.  This allows seamless handling of such shared reset-gpios
>>> without need of changing Devicetree binding [1].
>>>
>>> To avoid creating multiple "reset-gpio" platform devices, store the
>>> Devicetree "reset-gpios" GPIO specifiers used for new devices on a
>>> linked list.  Later such Devicetree GPIO specifier (phandle to GPIO
>>> controller, GPIO number and GPIO flags) is used to check if reset
>>> controller for given GPIO was already registered.
>>>
>>> If two devices have conflicting "reset-gpios" property, e.g. with
>>> different ACTIVE_xxx flags, this would allow to spawn two separate
>>> "reset-gpio" devices, where the second would fail probing on busy GPIO
>>> request.
>>>
>>> Link: https://lore.kernel.org/all/YXi5CUCEi7YmNxXM@robh.at.kernel.org/ [1]
>>> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
>>> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>> Cc: Sean Anderson <sean.anderson@seco.com>
>>> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> (...)
>>
>> In my naive view, this implements the following:
>>
>> reset -> virtual "gpio" -> many physical gpios[0..n]
> 
> It does not, there is no single GPIO here. There is a single reset
> controller, though, but still multiple GPIOs in DTS.
> 
>>
>> So if there was already a way in the kernel to map one GPIO to
>> many GPIOs, the framework could just use that with a simple
>> single GPIO?
>>
>> See the bindings in:
>> Documentation/devicetree/bindings/gpio/gpio-delay.yaml
>>
>> This is handled by drivers/gpio/gpio-aggregator.c.
>>
>> This supports a 1-to-1 map: one GPIO in, one GPIO out, same offset.
>> So if that is extended to support 1-to-many, this problem is solved.
> 
> It does not match the hardware thus I don't know how to implement it in
> DTS while keeping the requirement that we are describing hardware, not
> OS abstractions.
> 
>>
>> Proposed solution: add a single boolean property such as
>> aggregate-all-gpios; to the gpio-delay node, making it provide
>> one single gpio at offset 0 on the consumer side, and refuse any
>> more consumers.
> 
> And how do you solve the reset requirements? The problem is not just to
> share GPIO. The problem is to share in a way that devices operate
> properly when they assert/deassert reset.
> 
>>
>> This will also solve the problem with induced delays on
>> some GPIO lines as I can see was discussed in the bindings,
>> the gpio aggregator already supports that, but it would work
>> fine with a delay being zero as well.
>>
>> This avoids all the hackery with driver stubs etc as well.
> 
> 
> So none of these ideas were posted in previous threads, just because you
> were not CCed (except one thread)?
> 
> https://lore.kernel.org/lkml/20191030120440.3699-1-peter.ujfalusi@ti.com/
> https://lore.kernel.org/all/9eebec9b-e6fd-4a22-89ea-b434f446e061@linaro.org/
> https://lore.kernel.org/all/20231018100055.140847-1-krzysztof.kozlowski@linaro.org/
> https://social.treehouse.systems/@marcan/111268780311634160
> 

And here:

https://lore.kernel.org/all/CAL_JsqL3oZXJJ5_i4BRGpvWu1X8QFB7OGG=D+zLvvWb=UR1mWg@mail.gmail.com/
which the place where this idea of using resets appeared. I agree that
you were not CCed there, but that only means you miss lei filters or
pattern in MAINTAINERS.

Best regards,
Krzysztof

