Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F1D82AB3B
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jan 2024 10:49:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91845E65;
	Thu, 11 Jan 2024 10:48:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91845E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704966547;
	bh=JQGXDlaxT2vfKSbW0qdcNTg+hBBlT16ZOLiSK2IkEoE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iwzK1k+/921NzeDewtVtG0feaFvPx+zC7t1lfERVQgbr44xAEqRENOf+oV1h4nNIF
	 Enpx26MFbyTM9UzVN+BwrDsVJRc0vZtllvzB9xpzJ0rr+oIe4yg7+WeQAnbPoNTgFi
	 j+j8LAllfRhBnBFAxEzs+oYqRkNz/Rnn7ImxLKHo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 446C4F805A1; Thu, 11 Jan 2024 10:48:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5AABF8057C;
	Thu, 11 Jan 2024 10:48:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25765F80254; Thu, 11 Jan 2024 10:48:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A269F8003A
	for <alsa-devel@alsa-project.org>; Thu, 11 Jan 2024 10:48:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A269F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=BpNONwHc
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-336990fb8fbso4203421f8f.1
        for <alsa-devel@alsa-project.org>;
 Thu, 11 Jan 2024 01:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704966491; x=1705571291;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5adUtgne4jMaQu6ceUWNoNLxWhqRojcfBCn+PSBQ4qk=;
        b=BpNONwHcFpalYaEk6pVDaAh6RhxA5B0qFXaL2ARkZcotGoZ1d/VmKbtIeplG9ugxAB
         VkRypo1ihjZVZuD4mJyhx8ojOmWTn5nS6neuoY8SX+BMcojJeifbeHWd60YClde0DstG
         lpy0Cc1vsra0YX3CP/nK55mgrTRXS92rI4GiyaQ9IK3pqvIgf7uJ+NfPLeXEnWuLMhli
         pt5RsA9CaL5bICQxhris8WSyRVeFLwj9fyKvoJwprZp1fosb0xGnD2LSDQeSDroS7ar+
         /jtXeXr1OH3hJGVoF8ZjIiljgMIrs+JL1D9hXP+kZHuSMz1O8jNYMivWZVnUC7BCJFIw
         0kHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704966491; x=1705571291;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5adUtgne4jMaQu6ceUWNoNLxWhqRojcfBCn+PSBQ4qk=;
        b=ZUJtYonabA/H9nSPoByMOik0yRzVcEsjQ5+XqZaiG/ZODZeoYIxD72IyYAOIA5Fi0I
         nlMKjRJ8oeiUdJzbhOA5PMMdzWyfN1tbv02AdI0DSGFpX6/qo7gilpB/0hmfPMEbpwrN
         B2WBZyHlxhr5MoyFlyXMh76awWWx97+OEjSRbzHKkXXZJHEmPlj3PDA+fthwKXFCHUdJ
         W0ITf10vPzs+364fn6mwemEkLINevNErypNxqPdv44hmtddPWpSpZLTL/sdG546ACpfg
         X1XQxLDxdCkxkNuys0AonlKfeHooXdeZPTFD/ZPanFUgha1zio0+ENJvi3DdJfZQvDqW
         ZIOg==
X-Gm-Message-State: AOJu0Yz8IQvRsd1gb2KtsnNxHUjHf0YKbjdUoKD7OAQg5jRtg0iRkzni
	gmrEAbuep5aTlh1/v8oveCsAkPCLifOxuw==
X-Google-Smtp-Source: 
 AGHT+IHVM8NbyQMZ6OCgShlq1tvqwOzBs/0xPUGb+KmcocNAqwvQHqpajCUNbk4sQ0DM8PnyziRXRg==
X-Received: by 2002:a5d:558e:0:b0:337:5d86:af03 with SMTP id
 i14-20020a5d558e000000b003375d86af03mr391634wrv.114.1704966491096;
        Thu, 11 Jan 2024 01:48:11 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id
 q5-20020adf9dc5000000b003376dbc75e9sm753018wre.14.2024.01.11.01.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 01:48:08 -0800 (PST)
Message-ID: <fe7c0524-cbe9-4b02-bfec-5c5b5491cf17@linaro.org>
Date: Thu, 11 Jan 2024 10:48:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] reset: Instantiate reset GPIO controller for
 shared reset-gpios
Content-Language: en-US
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Sean Anderson <sean.anderson@seco.com>
References: <20240105155918.279657-1-krzysztof.kozlowski@linaro.org>
 <20240105155918.279657-3-krzysztof.kozlowski@linaro.org>
 <c2abc08d1b442fdcba7c41e2e1cc1617516441b2.camel@pengutronix.de>
 <767645a7-835d-4ac8-ac70-a701cea6df30@linaro.org>
 <fda63ae95d050e46dcb2446f0d841e01354a8643.camel@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <fda63ae95d050e46dcb2446f0d841e01354a8643.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NXYRI3HWF5ONXBHFVNDPBBBNIFFE2I26
X-Message-ID-Hash: NXYRI3HWF5ONXBHFVNDPBBBNIFFE2I26
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NXYRI3HWF5ONXBHFVNDPBBBNIFFE2I26/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/01/2024 12:58, Philipp Zabel wrote:
>>>> +	/* Not freed in normal path, persisent subsyst data */
>>>> +	rgpio_dev = kzalloc(sizeof(*rgpio_dev), GFP_KERNEL);
>>>
>>> Since this is persistent, instead of letting the reset-gpio driver call
>>> of_parse_phandle_with_args() again, this could be passed in via
>>> platform data. Is there a reason not to do that instead?
>>
>> We can pass it as read only platform data, but we cannot pass the
>> ownership. This is associated with registered platform device, not with
>> bound one device->driver.
>>
>> Imagine case:
>> 1. modprobe reset-gpio,
>> 2. Driver is bound to the device,
>> 3. unbind  (echo > unbind)
>> 4. rmmod
>> 5. goto 1
> 
> Keeping ownership on the list is fine, the reset-gpio driver makes its
> own copy of of_phandle_args anyway. I was just wondering whether it
> could make this copy from platform data instead of from the
> of_parse_phandle_with_args() return value.

Looks like it could. This could save us few lines of code in
reset-gpio.c. I'll try it.

> 
> [...]
>>>
>>>> @@ -839,21 +960,50 @@ __of_reset_control_get(struct device_node *node, const char *id, int index,
>>>>  					 index, &args);
>>>>  	if (ret == -EINVAL)
>>>>  		return ERR_PTR(ret);
>>>> -	if (ret)
>>>> -		return optional ? NULL : ERR_PTR(ret);
>>>> +	if (ret) {
>>>> +		/*
>>>> +		 * There can be only one reset-gpio for regular devices, so
>>>> +		 * don't bother with GPIO index.
>>>> +		 */
>>>
>>> I don't understand this comment. The GPIO index should be checked as
>>> part of __reset_gpios_args_match(), or should it not?
>>
>> This and earlier comment are result of a bit hacky approach to the
>> problem: how to find reset controllers for that GPIO?
>>
>> The point is that our reset gpio controller has only 1 reset, thus
>> of_reset_n_cells=1. However args_count from of_parse_handle is >0, which
>> later is compared in reset core:
>>
>> https://elixir.bootlin.com/linux/latest/source/drivers/reset/core.c#L859
>>
>> That part we need to match.
>>
>> I could make the reset-gpio driver to have of_reset_n_cells=2, but what
>> would be the point? The rest of the cells are not really relevant,
>> because you cannot refer to this reset gpio controller with any other
>> arguments.
>>
>> To remind: my solution spawns one reset-gpio controller for one GPIO.
> 
> Thank you. I think we could also just make that check
> 
> 	if (WARN_ON(!rcdev->of_args && ...))
> 
> instead and skip the of_xlate call in that case (or implement of_xlate
> in the reset-gpio driver to make this more explicit).

Ack

> 
>>>
>>>> +		ret = of_parse_phandle_with_args(node, "reset-gpios", "#gpio-cells",
>>>> +						 0, &args);
>>>> +		if (ret)
>>>> +			return optional ? NULL : ERR_PTR(ret);
>>>>  
>>>> -	mutex_lock(&reset_list_mutex);
>>>> -	rcdev = NULL;
>>>> -	list_for_each_entry(r, &reset_controller_list, list) {
>>>> -		if (args.np == r->of_node) {
>>>> -			rcdev = r;
>>>> -			break;
>>>> -		}
>>>> +		gpio_fallback = true;
>>>
>>> Is there a reason not just call __reset_add_reset_gpio_device() here?
>>> With that, there should be no need to call __reset_find_rcdev() twice.
>>
>> Hm, could be, although not sure if code would be simpler.
>>
>> This entire function handles two cases:
>> 1. Get normal reset controller ("resets" OF property),
>> 2. If above fails, get reset-gpio controller ("reset-gpios" OF property)
>>
>> Therefore the entire solution is following approach:
>> 1. of_parse_phandle(resets)
>> 1b. error? Then of_parse_phandle(reset-gpios)
>> 2. Find reset-controller based on any of above phandles.
>> 3. error? Check if we created reset-gpios platform device. If not:
>> create new reset-gpios platform device/
>> 3b. Platform device could probe, so lookup again for reset controller or
>> defer probe.
>>
>> What type of flow do you propose?
> 
> I propose to reorder after parsing the phandles: check/create the gpio
> platform device right after parsing the gpio handle. Only then lock
> reset_list_mutex look for the rcdev.
> 
> 1. of_parse_phandle(resets)
> 1b. error? Then of_parse_phandle(reset-gpios)
> 2b. gpio? Then check if we created reset-gpios platform device. If not:
> create new reset-gpios platform device/, defer if probe failed
> 3. Lock reset_list_mutex, find reset-controller based on any of above
> phandles.

Could work, let me try. I have impression this was my first approach
which resulted in a bit more complicated code, but I don't remember the
details now.

> 
>>
>>>
>>>>  	}
>>>>  
>>>> +	mutex_lock(&reset_list_mutex);
>>>> +	rcdev = __reset_find_rcdev(&args, gpio_fallback, NULL);
>>>
>>> This gets called with args as parsed. If there is a match, this will 
>>> overwrite args (in the gpio_fallback case) and return NULL.
>>
>> Overwrite not complete. It will only overwrite args_count and return a
>> valid rcdev.
>> I do not see overwriting in case of returning NULL.
> 
> Sorry, I meant to write
> 
> "This gets called with args as parsed. If there is a match, this will 
>  overwrite args (in the gpio_fallback case) _or_ return NULL."
> 
> at least at the end, when I understood the following.
> 
>>>
>>>> +
>>>>  	if (!rcdev) {
> 
> So in this non-NULL branch there was no overwriting.
> 
>>>> -		rstc = ERR_PTR(-EPROBE_DEFER);
>>>> -		goto out;
>>>> +		if (gpio_fallback) {
>>>> +			/*
>>>> +			 * Registering reset-gpio device might cause immediate
>>>> +			 * bind, thus taking reset_list_mutex lock via
>>>> +			 * reset_controller_register().
>>>> +			 */
>>>> +			mutex_unlock(&reset_list_mutex);
>>>> +			ret = __reset_add_reset_gpio_device(node, &args);
>>>
>>> So this will also be called with args as parsed.
>>>
>>>> +			mutex_lock(&reset_list_mutex);
>>>> +			if (ret) {
>>>> +				rstc = ERR_PTR(ret);
>>>> +				goto out;
>>>> +			}
>>>> +			/*
>>>> +			 * Success: reset-gpio could probe immediately, so
>>>> +			 * re-check the lookup.
>>>> +			 */
>>>> +			rcdev = __reset_find_rcdev(&args, gpio_fallback, NULL);
>>>
>>> And this will again be called with args as parsed and overwrite args
>>> again.>
>>>> +			if (!rcdev) {
>>>> +				rstc = ERR_PTR(-EPROBE_DEFER);
>>>> +				goto out;
>>>> +			}
>>>> +			/* Success, rcdev is valid thus do not bail out */
>>>> +		} else {
>>>> +			rstc = ERR_PTR(-EPROBE_DEFER);
>>>> +			goto out;
>>>> +		}
>>>>  	}
>>>
>>> So at this point args is overwritten in the gpio_fallback case. I would
>>> find it much clearer to just overwrite args here and make the first
>>> parameter to __reset_find_rcdev() const.
>>
>> I think I get your point. Overwriting happens after we store the
>> original of_args, but the code is indeed not intuitive. I think I can
>> move it further, as you suggested.
> 
> Now I think we can skip the overwriting altogether and just adapt the
> following of_reset_n_cells check ad of_xlate call as mentioned above.


Yep!

Best regards,
Krzysztof

