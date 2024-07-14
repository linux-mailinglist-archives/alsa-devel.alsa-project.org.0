Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF50930992
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Jul 2024 12:38:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C23FDFA;
	Sun, 14 Jul 2024 12:38:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C23FDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720953499;
	bh=UcuDJs+XlgVYl+OTxAAxOqbM9vj+nn7D7kyPOTjhZCo=;
	h=Date:Subject:From:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=U5y3R5I8QQiKsvhYbM3sA5xAYz7x5W/20MUSk9wCsMONkMa2il+ls/JNGZlegADMW
	 GVntdRxugC1HZBbrB2EM9cZrnM9ekTx4bErwfHVmYCCFWhIEDbQCO9GmxaoNdlosFj
	 Ebz0W38bAHvu6MKimPAJFH769uVd1R46yvG7gajA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD769F8058C; Sun, 14 Jul 2024 12:37:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58E1DF804FC;
	Sun, 14 Jul 2024 12:37:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14AF4F8026D; Sun, 14 Jul 2024 12:26:53 +0200 (CEST)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 199BDF800FA
	for <alsa-devel@alsa-project.org>; Sun, 14 Jul 2024 12:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 199BDF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=XBBgIFis
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-367818349a0so1933301f8f.1
        for <alsa-devel@alsa-project.org>;
 Sun, 14 Jul 2024 03:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720952492; x=1721557292;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5z/03b2vX7NcAXJ+dFsF5PuyQGEdW6/zBENfqYSkXws=;
        b=XBBgIFisY5tMcpzLyICbnu+PDOhDV2Dk12gFH2/MA6I+G/MrAPy/EEu1stxu48WnTX
         XaDfOUZNFYriGDN6sJbwij7tnu13+gQqv5IwASoCnIxMycCkrguMS9R9cPr+UoWaiPdR
         HQaTeuwTg30ilDmqWrZjjZlyIkaTcBm0pC7tP1qRXSyyT3dW743zJx0IGP0u0OH9ReJ3
         yVKEt/E4JG0KuI6BZMtqCnPnRfTEMlOstSdPb/efqvNie+Lum2LeZuN3w/TLFifl7YWc
         nWbWjAfUkYQDr387ZdvHcTkg7nSBevK95xoZYYfdOsxklR24T5hUfSS+tBgisa0Gsy9r
         8d8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720952492; x=1721557292;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5z/03b2vX7NcAXJ+dFsF5PuyQGEdW6/zBENfqYSkXws=;
        b=ZKTTzI+2OleHgPWf6gXg74MoYIo5KrWx78kaOi8P5M8lpFHf1iIEl5DoA037EGmWMq
         wJspoE6+JnwzJmHeanQKx9WzIf8uwmldeenS120AfZM80fQj66RhLlwbyXlRJo4yKVyU
         HuX8OufcX8GwiMJWp6r220ahn/fC6nVxpyfRpjtJzam8E07SSlrcdcGSyJMFMMIi1yeU
         +l1kbv1BybKXplDYOYJ9iYHo1LHsWs9j6kLCo3uU9L/MtKt/KNPm0sThZc7OFIl/3YU9
         DgdLzzqQViWggzkNnt/1NHd0b5SyViBIZNz84yx1BwW1gEoDxs6a6jhZ4/OkyhwyGiQV
         ufEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4VGllupu9DkURQY7ojRgfZzqZJW+8iZ76r2INXRcz8i3L+Eh1NL41+PwBzcel+xSQSancAaTdwaRcEkFsZYBJlWu7RQ0q1ESS6L8=
X-Gm-Message-State: AOJu0YxEyHeUgv+kj/HaRKpWFE0V1M2GTMDbvyP3fW/M8m06FWDCgOlI
	FbuIWeXpvJdlpLnPdj0q+J5i3liQJjYcH+L14jZtjHzhI3HB6dc3DEf0nr6KRg5Xm4ViHgcA7Ii
	K
X-Google-Smtp-Source: 
 AGHT+IGm6o+vwGijyHYqejsnlf6YGOgobKUZq1j+ksyWC2JQFBR4pON627dYIWnOuAYV5DQ6aApepg==
X-Received: by 2002:a05:6000:110f:b0:361:bcc5:2e26 with SMTP id
 ffacd0b85a97d-367cea7382cmr11068764f8f.19.1720952491982;
        Sun, 14 Jul 2024 03:21:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dafb939sm3485997f8f.89.2024.07.14.03.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jul 2024 03:21:31 -0700 (PDT)
Message-ID: <36840696-772b-4e57-a672-ec5210ebeb64@linaro.org>
Date: Sun, 14 Jul 2024 12:21:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: codecs: wsa884x: Implement temperature reading
 and hwmon
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-hwmon@vger.kernel.org
References: <20240713095635.23201-1-krzysztof.kozlowski@linaro.org>
 <fd09fa44-1795-43a1-ba8d-ca2ba8f71d07@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <fd09fa44-1795-43a1-ba8d-ca2ba8f71d07@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: N6YFV5TEI3MCSRVOXBIP6GHB2TJN6MHC
X-Message-ID-Hash: N6YFV5TEI3MCSRVOXBIP6GHB2TJN6MHC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N6YFV5TEI3MCSRVOXBIP6GHB2TJN6MHC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 14/07/2024 12:02, Krzysztof Kozlowski wrote:
> On 13/07/2024 11:56, Krzysztof Kozlowski wrote:
>> Read temperature of the speaker and expose it via hwmon interface, which
>> will be later used during calibration of speaker protection algorithms.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Changes in v2:
>> 1. Add missing dependency on HWMON for y!=m builds (kernel test robot
>>    report: undefined reference to
>>    `devm_hwmon_device_register_with_info').
>> ---
>>  sound/soc/codecs/Kconfig   |   1 +
>>  sound/soc/codecs/wsa884x.c | 197 +++++++++++++++++++++++++++++++++++++
>>  2 files changed, 198 insertions(+)
>>
>> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
>> index 97bb69c9848d..09a0b209bc2f 100644
>> --- a/sound/soc/codecs/Kconfig
>> +++ b/sound/soc/codecs/Kconfig
>> @@ -2447,6 +2447,7 @@ config SND_SOC_WSA883X
>>  config SND_SOC_WSA884X
>>  	tristate "WSA884X Codec"
>>  	depends on SOUNDWIRE
>> +	depends on HWMON || !HWMON
> 
> Eh, now I got build report that hwmon does not have stubs for !HWMON (by
> design or missing?), so this still has compile failures.
> 
> I think we should have (devm_)hwmon_device_register_with_info() stubs
> for drivers not depending on hwmon, so I will propose a patch for that.
> If that approach is accepted, no changes should be needed in this
> wsa884x v2 patchset.

Answering to myself: I see now that lack of !HWMON stubs for providers
is rather by design and drivers use IS_REACHABLE. I'll send a v3 of this
patch.

Best regards,
Krzysztof

