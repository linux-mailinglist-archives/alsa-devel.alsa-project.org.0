Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C1F83A2E8
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 08:29:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D67C84D;
	Wed, 24 Jan 2024 08:29:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D67C84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706081378;
	bh=RnFvsZRAgPqC61p7ZiwGeVU7gxwIswOGV30gdQpZ8JM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kzHv2BtgOQ0ITrS8lFqE03SZcnN9aiW3dW1imsF+VQk6Z3qYO52t0mnYRtsYdNSY4
	 UwHLt2LZlu3fhR0JAkVtQXEocYrq+iqrSYV/WAzJ7rxYtK9qzPo7WUAfz0ezzB24ux
	 fSyi717NY88fGCG3gQTfrW4hl8CmDz4SYalXlJGg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 239BFF804E7; Wed, 24 Jan 2024 08:29:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F8FAF8055B;
	Wed, 24 Jan 2024 08:29:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A553DF8028D; Wed, 24 Jan 2024 08:28:56 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 280AFF8003A
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 08:28:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 280AFF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZXEfCwNc
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40e9ef9853bso28984645e9.1
        for <alsa-devel@alsa-project.org>;
 Tue, 23 Jan 2024 23:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706081324; x=1706686124;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0fLLuHTpgYX/yoJ14ATULSdZd7GfYaqCyS12xdAnKho=;
        b=ZXEfCwNcaYkBgXq6sMK7LdvjPBNMkARxoiwYIS7I7kjzMBoIReMD9K1P/rXZ2OyddN
         B6qInKfHn8bt0ltFDkL+WEOa1ELEaA0p10wG8zWaCeZm04BaSdNfA95m8YQPAum+YaWo
         54ldbGnpBz1uXi4TFXLBjwuZs6c4bSUuQJ26kn/h4fMYdKVCPDQXJXhxbMW5/Dz276BU
         x3CXsqO4lPUKwWTJdRVkujrfpNaLkcCpJv/I3KNNNvxAWNyyBMdcUgBdPBVRl/PecrpE
         h5v3/18qAGxUuj1Ncg2ohg59jV+vD4OdX1D65IEdirknq1iRN8MulIadvfe+QuZkAI9J
         toKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706081324; x=1706686124;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0fLLuHTpgYX/yoJ14ATULSdZd7GfYaqCyS12xdAnKho=;
        b=ZwSaxxqUEnBkuQvJ1mErk4tCg47uL6LqCelVOafVv5JG2yRrv3q8iNlAetTEjwdKkb
         UYK8MWET3S9MF+4INc0ONRtafrCsXyyWaG4j/es7DF+MoaYEYG2j4kN0MKYkRzoxq9W/
         75ILKJlnT0+pPdPQiSP/LN/YaytWtiCONxxPg6QoqZQOqjCAKfSHaKrXL5qP7qmP+NZV
         No+h1UM3dMvEo07vuMynncdfTzDZw+rbgVXp2UHiE0WtPHAKWbkUQWGYCncpbRRym/IS
         D5HUW0dysQAd+sfAMaXJTsCSNx74MI8L8MQa+VTXgrKpAsp1bqfFtEelplQ5cyT4+Y8u
         cf9w==
X-Gm-Message-State: AOJu0YyW6i9kBvySt8L8Bw3AOYY1Zaj8oQ91kuYuEVsmr2qavDfn/blk
	78t8J2x6H+pHs0Rrx/elbjeNP2ZSLyXkt0/6fPVhj4tgM0eHOltiPQ4iggdlOy8=
X-Google-Smtp-Source: 
 AGHT+IFHWidmI809iIPwByzsLtgi1YcTrXcg4xnhVgQwmpJrfhO7yHB0XCsR3Oaljz9ltsL0HILqiQ==
X-Received: by 2002:a05:600c:3155:b0:40e:bf71:f6db with SMTP id
 h21-20020a05600c315500b0040ebf71f6dbmr359367wmo.17.1706081323896;
        Tue, 23 Jan 2024 23:28:43 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id
 v4-20020a05600c470400b0040e5945307esm45004053wmo.40.2024.01.23.23.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 23:28:43 -0800 (PST)
Message-ID: <953497b6-b884-49e7-8376-cbece92b1567@linaro.org>
Date: Wed, 24 Jan 2024 08:28:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] reset: Instantiate reset GPIO controller for
 shared reset-gpios
Content-Language: en-US
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Sean Anderson <sean.anderson@seco.com>
References: <20240123141311.220505-1-krzysztof.kozlowski@linaro.org>
 <20240123141311.220505-5-krzysztof.kozlowski@linaro.org>
 <b9d2e1e5fd8b5022890e05fcc33410360e0d11d7.camel@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <b9d2e1e5fd8b5022890e05fcc33410360e0d11d7.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NFDDS4GE54ZSCLMHUDJVGGO7RH3LQAFP
X-Message-ID-Hash: NFDDS4GE54ZSCLMHUDJVGGO7RH3LQAFP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NFDDS4GE54ZSCLMHUDJVGGO7RH3LQAFP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/01/2024 16:06, Philipp Zabel wrote:
> On Di, 2024-01-23 at 15:13 +0100, Krzysztof Kozlowski wrote:
>> Devices sharing a reset GPIO could use the reset framework for
>> coordinated handling of that shared GPIO line.  We have several cases of
>> such needs, at least for Devicetree-based platforms.
>>
>> If Devicetree-based device requests a reset line, while "resets"
>> Devicetree property is missing but there is a "reset-gpios" one,
>> instantiate a new "reset-gpio" platform device which will handle such
>> reset line.  This allows seamless handling of such shared reset-gpios
>> without need of changing Devicetree binding [1].
>>
>> To avoid creating multiple "reset-gpio" platform devices, store the
>> Devicetree "reset-gpios" GPIO specifiers used for new devices on a
>> linked list.  Later such Devicetree GPIO specifier (phandle to GPIO
>> controller, GPIO number and GPIO flags) is used to check if reset
>> controller for given GPIO was already registered.
>>
>> If two devices have conflicting "reset-gpios" property, e.g. with
>> different ACTIVE_xxx flags, this would allow to spawn two separate
>> "reset-gpio" devices, where the second would fail probing on busy GPIO
>> request.
>>
>> Link: https://lore.kernel.org/all/YXi5CUCEi7YmNxXM@robh.at.kernel.org/ [1]
>> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
>> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
>> Cc: Sean Anderson <sean.anderson@seco.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> I'm nearly out of complaints, two tiny cosmetic issues remaining:
> 
> [...]
>> diff --git a/drivers/reset/core.c b/drivers/reset/core.c
>> index 4d5a78d3c085..6e81b8d35055 100644
>> --- a/drivers/reset/core.c
>> +++ b/drivers/reset/core.c
> [...]
>> @@ -813,12 +838,161 @@ static void __reset_control_put_internal(struct reset_control *rstc)
>>  	kref_put(&rstc->refcnt, __reset_control_release);
>>  }
>>  
>> +static int __reset_add_reset_gpio_lookup(int id, struct device_node *np,
>> +					 unsigned int gpio,
>> +					 unsigned int of_flags)
>> +{
>> +	unsigned int lookup_flags;
>> +	const char *label_tmp;
>> +
>> +	/*
>> +	 * Later we map GPIO flags between OF and Linux, however not all
>> +	 * constants from include/dt-bindings/gpio/gpio.h and
>> +	 * include/linux/gpio/machine.h match each other.
>> +	 */
>> +	if (of_flags > GPIO_ACTIVE_LOW) {
>> +		pr_err("reset-gpio code does not support GPIO flags %u for GPIO %u\n",
>> +			of_flags, gpio);
> 
> Alignment to parenthesis is slightly off.

Ack

> 
>> +		return -EINVAL;
>> +	}
>> +
>> +	struct gpio_device *gdev __free(gpio_device_put) = gpio_device_find_by_fwnode(of_fwnode_handle(np));
> 
> Adding a local fwnode variable would make this fit in the 100 character
> limit again.

Ack

Best regards,
Krzysztof

