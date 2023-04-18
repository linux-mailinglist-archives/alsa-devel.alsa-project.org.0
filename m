Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D62966E657B
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 15:08:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DD31E73;
	Tue, 18 Apr 2023 15:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DD31E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681823322;
	bh=DE2vreGREgDV2GE4G4qaaCuZEV1ow9JqBEsEQfidEe0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T+Vxy2Ml52VjcgzHOhN7AoMWR3IFsDxq9qaPUXZkQspkl/zsvw00RkR8IoMfPkzDz
	 wATFlwM/NrpVHG0XJ2C14cKfu/nYJjxsLBL3ej997IemSmbGQfOP+QE35RYLhFQdEv
	 4ijlJXa6h7Ce3l6aFgRHu50TbS3BUr4lc5cNEDrg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96349F80149;
	Tue, 18 Apr 2023 15:07:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0C11F80155; Tue, 18 Apr 2023 15:07:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B680EF800D0
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 15:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B680EF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=roRqrhX9
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-504eb1155d3so24128647a12.1
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Apr 2023 06:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681823261; x=1684415261;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8AOLhJAEQTI21tHDt5iL3GpDHZ2TzKg+M92LI2cgLe4=;
        b=roRqrhX9frNPq6BXAhUQix8S8kdfvO1UYwf6muNZatuo5DwUz3dE2Jy60Rv2u3o9JK
         2GyOsAE2lJgyJeNvsEDwSKW1rJT4Vq7CDkX8HiCjeI9pPwXFB9nojFLgmruqd05+dc+n
         mzs1MwGHqnTI7+w8VjynzB8CxQ/E5s/kC5KFEmoYQO5z/zhsYnkuUTPT9ITqfdnAzror
         KLvXKHOdZpI1/3pqzNc9ATApeB5798fr/v9WyvayRZ5OUYYi1ol0dnkhY5enuKC2fXfj
         lVenCj9bY7VW2kwqcffrNI22GkC9kfOJjeCaqHm02nMo8fUQKzAAMcvJOFKDLY9mNGED
         E2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681823261; x=1684415261;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8AOLhJAEQTI21tHDt5iL3GpDHZ2TzKg+M92LI2cgLe4=;
        b=HtqDujAGLd5ZB2WxheWgnSjV6T/osYoUSX/6RxcIy9owhKluVcjqo4TAYiKl6em2D4
         xFArVUOZKV+WqRk8ekRmQistVll2E69lMjhQIkusSlXgItP9Oler65TF439ANeKe/p+2
         4BEuALC7YgjjvIISAr6NwFB3XJqvwC95DYT+zIPRT8g0QUzLxmO3l72OWbKGIxfY8Y7R
         yCnJVMteS3eTj9juaEH78ZkqK2pKRloKRqHuYkXLMqgTROnliex/0pl7g6WsbPmqqrBB
         tY4wD8uxqZI1NbPShaE4MxhY9j0uWgpnvD1mbwmLnUd4L8kJBPW0ZrPDzsdIhFKtMelC
         vfnA==
X-Gm-Message-State: AAQBX9e34YbAPMxgdavEDAAyPIszD1rdk1xxdr0HBeE3nMgLzj0e4DDl
	Uucl+wj7+E/XBGvMM0nbbxRpXw==
X-Google-Smtp-Source: 
 AKy350a2DhZtENu9a+/b5zp2KWG6AtoXMkc+JM6QjLKZm7ZsfHEa6GZ+N+9uPzcHN3EO2/CzFOoJ4g==
X-Received: by 2002:a05:6402:518c:b0:506:bbf8:5152 with SMTP id
 q12-20020a056402518c00b00506bbf85152mr2280249edd.9.1681823261597;
        Tue, 18 Apr 2023 06:07:41 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a276:7d35:5226:1c77?
 ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id
 r7-20020aa7cb87000000b0050687ca0c92sm5156757edt.84.2023.04.18.06.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 06:07:41 -0700 (PDT)
Message-ID: <ff0f4871-4d26-e671-0239-fa47117381a0@linaro.org>
Date: Tue, 18 Apr 2023 15:07:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/4] ASoC: codecs: wcd9335: Simplify with dev_err_probe
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20230418074630.8681-1-krzysztof.kozlowski@linaro.org>
 <63a3b1c7-a68a-496c-99fe-9c936f4ebd94@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <63a3b1c7-a68a-496c-99fe-9c936f4ebd94@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HVNWTHLNRGIWLECVTSSGHCUSZJZJFXAI
X-Message-ID-Hash: HVNWTHLNRGIWLECVTSSGHCUSZJZJFXAI
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HVNWTHLNRGIWLECVTSSGHCUSZJZJFXAI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18/04/2023 14:55, Mark Brown wrote:
> On Tue, Apr 18, 2023 at 09:46:27AM +0200, Krzysztof Kozlowski wrote:
>> Replace dev_err() in probe() path with dev_err_probe() to:
>> 1. Make code a bit simpler and easier to read,
>> 2. Do not print messages on deferred probe.
> 
>>  	 */
>>  	wcd->intr1 = of_irq_get_byname(wcd->dev->of_node, "intr1");
>> -	if (wcd->intr1 < 0) {
>> -		if (wcd->intr1 != -EPROBE_DEFER)
>> -			dev_err(wcd->dev, "Unable to configure IRQ\n");
>> -
>> -		return wcd->intr1;
> 
> This is already not printing a message on deferred probe.

True, but the other places in the patch don't have such condition.

Best regards,
Krzysztof

