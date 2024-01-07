Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C06A78263FA
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Jan 2024 12:58:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB1C4EC1;
	Sun,  7 Jan 2024 12:57:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB1C4EC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704628684;
	bh=/Zf3GvSwpOLRnUmePfH0D0/6YFePYD1AAtHvX228xkg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DOs/Ka6mUUSUCdsh25fzZdAMakBHdxhnyE6drj5ksbSJJWbpw6Z8ZXIyjUTfvwnL5
	 ogYRv+bBF5VQOzEx0y4x7ijLVwRrZ0NBo5e1YFQG/TadDoO84asLcivMflRuIkJZGI
	 3dGhM9Cj/nLnJ2XMQuecK0jHwe5gS09mvqlbYOMI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93349F80589; Sun,  7 Jan 2024 12:57:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B87CF8057E;
	Sun,  7 Jan 2024 12:57:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C13CEF80246; Sun,  7 Jan 2024 12:57:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A691DF800F5
	for <alsa-devel@alsa-project.org>; Sun,  7 Jan 2024 12:57:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A691DF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vXQNclQ5
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5576fae29ffso686694a12.1
        for <alsa-devel@alsa-project.org>;
 Sun, 07 Jan 2024 03:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704628621; x=1705233421;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=60gxa1noVk5cpuesKhyJXaBSd7M6NODkl1WRf8H+12E=;
        b=vXQNclQ5//jDSuM/y2dyGl3W53mXmC32vryKh0SAwQoYS4ypDWpZFfmdo24M6cfMHY
         xLzKGR6Fu98JnONvvke7T1L4f9/693hfjquzmAwqNpAmD7FTkLGHStDNP5ojAKVNRI41
         3iqHEChws4LyC5zqDM0QJ1c1mSe/iel9wW4svAkE3vTmAdHLf04fteWsyXHVIlm/oOhT
         ysUF7osXbfItnnnNqHvanqtZsB+6kXh6CoWO6yFG9TyVqQuFJr7y0EeUoxbaUsKqyUVg
         I/HzlTR1SZhUwyJoa5AvE1BkqFJzh77nvzkDPDhk9aty0MDutLSMdiv+2i6lTYReSrkO
         OI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704628621; x=1705233421;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=60gxa1noVk5cpuesKhyJXaBSd7M6NODkl1WRf8H+12E=;
        b=DjlYqK39/979MVIYlrOoDGuc2nou+O5TEwv5W/Q5OepanWcQv+5CvRZfHv34dooQw4
         N5m4DxA2R8SDiLmXr2EO/PAiUYlUbYFHeG32Y/TGW3gSuQDGlFq71tiMzLqyOsy+RP2B
         ltKYvw7NVOFhxiLaSCsGEaPLyYuq/xpZBM5qEUUygWSP0tnHJv0+/rolXkUsv0znRaau
         e20kT1TXKL4ExFP7FXiVemx53OyuSsSJa2JCIUQj3JXRLuAVUtxAGe6pHPpRRK2/udAV
         0HkCW8BcPZoVFUIvcB843uNrl5lAoFAdIGPpv99LciHRp4C+nt4nFzdINe7CuksjZ6Dx
         Qo/A==
X-Gm-Message-State: AOJu0Yyif/L8PnOH1SDyrfWNOC5d+AxZAaO7kk4wt/1Pf4y5T+PZU5Kg
	DUPM/N7jSCL51yzYvbd4eRxLTL9WU9UTJA==
X-Google-Smtp-Source: 
 AGHT+IFku5eS7Ul7qfzXlwcUsJ4e+3uDpOZuFp4Pldnu0jDHe+8V8bUzwqcmq5VS+NlcV3j+QcRHHg==
X-Received: by 2002:a50:9b4f:0:b0:557:639e:ae21 with SMTP id
 a15-20020a509b4f000000b00557639eae21mr1099610edj.23.1704628621347;
        Sun, 07 Jan 2024 03:57:01 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id
 q4-20020a056402248400b005579c887effsm529167eda.79.2024.01.07.03.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jan 2024 03:57:00 -0800 (PST)
Message-ID: <ea1c6c7d-08f2-4fc5-96cb-a6cfdd144f66@linaro.org>
Date: Sun, 7 Jan 2024 12:56:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] reset: gpio: Add GPIO-based reset controller
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
 Sean Anderson <sean.anderson@seco.com>
References: <20240105155918.279657-1-krzysztof.kozlowski@linaro.org>
 <20240105155918.279657-2-krzysztof.kozlowski@linaro.org>
 <TYCPR01MB11269ABEDCD115064D449267486662@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <40b4d29e-fa5c-43d5-8ccb-4a5a41150546@linaro.org>
 <TYVPR01MB1127920B611C25FD57DFBF75486642@TYVPR01MB11279.jpnprd01.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: 
 <TYVPR01MB1127920B611C25FD57DFBF75486642@TYVPR01MB11279.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZOJTBG3FVNKG64YM5HIAKIMNSZP3TGVK
X-Message-ID-Hash: ZOJTBG3FVNKG64YM5HIAKIMNSZP3TGVK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZOJTBG3FVNKG64YM5HIAKIMNSZP3TGVK/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07/01/2024 11:46, Biju Das wrote:
>>>> +
>>>> +	if (!platdata || !*platdata)
>>>
>>> Maybe, if (!(platdata && *platdata)) which reduces 1 inversion
>> operation.
>>
>> I would not call it easier to understand... To me !A and !*A are quite
>> obvious and easy to read instantly because !A is obvious: check if it is
>> not NULL. Therefore original check is obvious: is NULL or points to NULL?
>> Then exit.
>>
>> Now your check is a bit more complicated. It is not even frequent code
>> pattern which my brain used to see. You want to check if both are not NULL
>> and then negate it, wait, no, opposite, check if they are something and
>> then negate? To me it is really opposite of readable code.
> 
> I agree maybe it is not readable, even though it reduces 1 extra operation.
> 

Number of operations does not matter. Code readability matters.
Compilers are nowadays smarter than us, so don't write code more
difficult to read just to optimize some instruction like this.

Best regards,
Krzysztof

