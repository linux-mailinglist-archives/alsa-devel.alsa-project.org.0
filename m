Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 460D8768C5F
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 08:52:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 119AC823;
	Mon, 31 Jul 2023 08:51:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 119AC823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690786352;
	bh=SAjkyCBSDbm57GigGIUDaUA6xymy0b4TX/v780N9wtk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ui6TaooBgrQvmf0aECEOYuChf0xr5kY+TghdwCq6ooYBwy3sT87HsWT7sMxjJXJH4
	 0m+Sv7IwbNZZRqvTcMfAkFevWEcOHBd9543+oeKNGKkRerg0PIe7fZlPXymK55XrZN
	 z3gP2FvldYv9ZA0z9fu9YCClkeZVN0ps/K3JZY/o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4300BF80535; Mon, 31 Jul 2023 08:51:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ED62BF80163;
	Mon, 31 Jul 2023 08:51:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D668F8016D; Mon, 31 Jul 2023 08:51:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6DF64F80149
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 08:51:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DF64F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fqhNILd+
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fe15bfb1adso6298746e87.0
        for <alsa-devel@alsa-project.org>;
 Sun, 30 Jul 2023 23:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690786292; x=1691391092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o8Rt9blDQLbjFIHhQ775musDPPuWgqdGNon+UjeozlQ=;
        b=fqhNILd+G7sGwNQlon4vl9xMCV6KAcUtPxN24oYplZasC7CtsAlFLVBv5++5X5dzFp
         IOC/b4f1zMXq/3oLeGbPyq890Xckf7fHOKPQQDZD1NL74HfWyBtbpj8hENbbjbRaL6KU
         8tuTCwgsPJ3tCoFe2sLbdywFgjb8F2/bJqCSsqmpXqOa6q5MTJPnF6VVxpoFm9SpeM4M
         eFXzddmikCTVURpjEZmStARjJjMJX3hzQ1/JT9AJhYlRhxHlx2tyuRcJ3noAnFpAUJYA
         xCmFBusTVRUQMXnCgxysie4DN38J0BoICESMKHHmhMMte3lFQRKqLfvdOkvSiqzfvNEs
         AsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690786292; x=1691391092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o8Rt9blDQLbjFIHhQ775musDPPuWgqdGNon+UjeozlQ=;
        b=ke5mlhITG3lHeoYeUG7q0jY9ARhEs6XMtmzcM4FZM4dqJGbht/rRNGhIBbcCncmKwj
         nM+KN2e9XMnsHCY8G3maDI4kGBRaeRuEHYjLrwUyV6exj/ZohTbYVgLbAW/Ci6ul/fT0
         6ubIBNfho1EAJlcNcA+ufb5mdNrO32gGsQEavqvmqC+naxENsXC8qQAn/Mg0xUCFcHdt
         xSVUhAybzZBwhqAzKpkD4ROjKzJmpz4WBiJ13Ph4CohXPlHa3u7G/4B8x+sU692+d71+
         zaJcUBQu3n0Zl/t3AtWJm+Neh2CvSdh0ZUfqWNFnknDsdIAAEui6s8EM6AEGEN0YnMqk
         mNdw==
X-Gm-Message-State: ABy/qLYAslA8YvfvxiUZZ1kv60plv1W+XO4UH+AXFf2uHwYi8A5XKF1e
	brc79JEm7rZK3XmIqOCoe0TXuQ==
X-Google-Smtp-Source: 
 APBJJlElJZxCgxmaPXKU3Ke4gYodUSFZNQP8VMTA3nl9zumxbtQsFjGBQzPgy40Hem3vm5x84sulWQ==
X-Received: by 2002:a05:6512:3b0b:b0:4f8:4512:c846 with SMTP id
 f11-20020a0565123b0b00b004f84512c846mr6074831lfv.49.1690786291811;
        Sun, 30 Jul 2023 23:51:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id
 j25-20020a170906255900b0099b4d86fbccsm5803011ejb.141.2023.07.30.23.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jul 2023 23:51:31 -0700 (PDT)
Message-ID: <be25dead-89f0-8859-d182-84754ad8bfc0@linaro.org>
Date: Mon, 31 Jul 2023 08:51:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH V3 4/5] ASoC: codecs: aw88261 device related operation
 functions
To: wangweidong.a@awinic.com
Cc: 13916275206@139.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 ckeepax@opensource.cirrus.com, colin.i.king@gmail.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, doug@schmorgal.com, fido_max@inbox.ru,
 herve.codina@bootlin.com, krzysztof.kozlowski+dt@linaro.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, liweilei@awinic.com,
 perex@perex.cz, povik+lin@cutebit.org, rf@opensource.cirrus.com,
 robh+dt@kernel.org, ryans.lee@analog.com, shumingf@realtek.com,
 tiwai@suse.com, trix@redhat.com, yijiangtao@awinic.com,
 zhangjianming@awinic.com
References: <7cdd4825-c0da-f60e-bbef-970bea48dc95@linaro.org>
 <20230731064154.4137-1-wangweidong.a@awinic.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230731064154.4137-1-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VHWT4QNATCI7XTUKDH5HGXXQP4QTTDTP
X-Message-ID-Hash: VHWT4QNATCI7XTUKDH5HGXXQP4QTTDTP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VHWT4QNATCI7XTUKDH5HGXXQP4QTTDTP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 31/07/2023 08:41, wangweidong.a@awinic.com wrote:
> 
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +int aw88261_dev_init(struct aw88261_device *aw_dev, struct aw_container *aw_cfg)
> 
>> You already used this function in patch #3, so your order of patches is
>> confusing.
> 
> Do I need to change the order of patch? 
> Do I neeed to put aw88261_device.c aw88261_device.h in patch #3 and 
> put aw88261.c aw88261.h in patch #4?
> Is that how you change the order?

Your patchset should be logically ordered, so first you add bindings
(because it must be before their users), then you one piece, then other
etc. I understand that only the last patch will make everything
buildable, but still code should be added before its user/caller.

...

> 
>>> +
>>> +	switch (chip_id) {
>>> +	case AW88261_CHIP_ID:
>>> +		ret = aw_dev_init((*aw_dev));
>>> +		break;
>>> +	default:
>>> +		ret = -EINVAL;
>>> +		dev_err((*aw_dev)->dev, "unsupported device");
>>> +		break;
>>> +	}
>>> +
>>> +	return ret;
>>> +}
>>> +
>>> +MODULE_DESCRIPTION("AW88261 device");
>>> +MODULE_LICENSE("GPL v2");
> 
>> Wait, is this a module? Does not look complete. I already saw one
>> module, so what is this for? For which module?
> 
> Can it be changed to MODULE_DESCRIPTION("AW88261 device lib")?

If this is a module, then it can. If this is not a module, then why
would you ever like to do it?

> The function in the aw88261_device.c file, which I used in the aw88261.c file.

Functions are not modules.


Best regards,
Krzysztof

