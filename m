Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF2B954537
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2024 11:12:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4C3D2BD5;
	Fri, 16 Aug 2024 11:12:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4C3D2BD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723799561;
	bh=LfWhagoS1pzhxx1zEMgk9yX693yvb5P3agLUzpS+cLo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rFvZvKAooU+6KmvCUnfQyR4Fqt8KTrHcDfDzQOtdXhQd7osYa5YWwzHlKG7lLuZ9o
	 WNWchL7utSnftL6kHoc9Ip7Zzyl59/07VGw9UlHit3yuLjM3cGU4/P4eVCJoB8C49b
	 vtZOsHDIOvCCe+wxlou4D+ZwA/WZkLE4twln7Tug=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A20AF805A0; Fri, 16 Aug 2024 11:12:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A740F805AE;
	Fri, 16 Aug 2024 11:12:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3AE6F80423; Fri, 16 Aug 2024 11:04:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.6 required=5.0 tests=RCVD_IN_SBL_CSS,SPF_HELO_NONE,
	TIME_LIMIT_EXCEEDED,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D1D6F800B0
	for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2024 10:59:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D1D6F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=I7OHg2th
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3683329f787so984873f8f.1
        for <alsa-devel@alsa-project.org>;
 Fri, 16 Aug 2024 01:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723798761; x=1724403561;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2AmXrAopEZ7cvd5ZME2fjOsPUxShdExph5aHyt4+s1I=;
        b=I7OHg2thIRF+HaZZCWKMseTSAd3eZbpioL19iZmgOGPlNl6XEIlRlWgzJh4uSds+J1
         fpDZRnHZ3N45uG7pf0aP3Py3y99swS1zke+O+flas0heWKppgNFCQ3fi31qoP2vuF560
         9g3DJyKVGRzjZy23gpGBXq1G6MzkAmnJdqz9jGZDM8s2BRm1w3hu6ALLjTKU3ttNjjTH
         vDo1AtiVTwjPgaxBie3/l/5gtn3Lkw8p47EoLshZYU/Y3JIPrvJ47qJHKw7h17s7gfbl
         5UqUt2iL0J78sVjx/IZ2YIyKevBVrChmNYbZKp0M3YCumK9eMq8QPR5ourQmrqVZu6Ce
         xOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723798761; x=1724403561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2AmXrAopEZ7cvd5ZME2fjOsPUxShdExph5aHyt4+s1I=;
        b=Teb4qUkQzPDsmzzG5DgqFfZKPP90KD30Wr7WIY1tyBQV/a0XHlKtqvT+Kdgl0Zciy2
         NIE3vL9EyLQKAKgjin1UJqIhtbmjzTRAImTKIdyPBRfUHHQvApkdvrobUUepRszsU+q+
         57HTr80wIM2PsN3fLsvUeiute5r8Z9GR8GjYS69svRDEe+JvR+Sgp5OdG33OcLbHOOVl
         NPxaMJG2tp/yCs/XKRuB2ISWOcEFV9xzvZ2xMBAKoZl7hGWxLwiDVKhLEDTphyANnox9
         j2CdcE8FYFFrQyQa8OUOT1PtE4K5kseKGVMC/2mM1V45HCd58nuWJVgUprMcUTtn0iPT
         FqIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUse6OB2lbUcbddnJg5Ko+mFe+uRRfDfKxDFEnkoiiOiLOQPM+8YVkGYpIbdIhP9g3CuNAd7k7nH/hZQJ9ejNhr35G8yyI/FDMTcig=
X-Gm-Message-State: AOJu0YyogGBgm+qqYsX7mGOiO1INzFphNOpKLkiytfxWiXbUb0HQAMlo
	vv5/RZSAVQazmYgM/zmNUPcuqXqt+7eh8jXGR1+9t2twSw9K13SRql7BZJVHj+c=
X-Google-Smtp-Source: 
 AGHT+IHVCiR8NTXQ5hS9+VCoex9bI3QB+qewq7KwuHB78ooUCG5gvzIThlb20x3W7WtZMN1AJE5+pQ==
X-Received: by 2002:adf:b307:0:b0:371:8c76:4ecc with SMTP id
 ffacd0b85a97d-371946a358cmr1367713f8f.46.1723798760507;
        Fri, 16 Aug 2024 01:59:20 -0700 (PDT)
Received: from [192.168.68.116] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-429ed658d32sm16997105e9.25.2024.08.16.01.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Aug 2024 01:59:20 -0700 (PDT)
Message-ID: <de0a9cf2-c656-430e-8c56-ca2975c73c0e@linaro.org>
Date: Fri, 16 Aug 2024 09:59:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: set the default codec
 version for sm8250
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, amit.pundir@linaro.org
References: <20240815164903.18400-1-srinivas.kandagatla@linaro.org>
 <F07BF288-66F4-497A-A581-5FE4B7B432BD@linaro.org>
 <18DCA30B-273D-415A-81EF-EA02CEBDAA94@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <18DCA30B-273D-415A-81EF-EA02CEBDAA94@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6LTAZM2ZRAQYTC3ZC4GU7MY3KPIC56Q4
X-Message-ID-Hash: 6LTAZM2ZRAQYTC3ZC4GU7MY3KPIC56Q4
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6LTAZM2ZRAQYTC3ZC4GU7MY3KPIC56Q4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 15/08/2024 22:22, Dmitry Baryshkov wrote:
> On August 16, 2024 4:07:10 AM GMT+07:00, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>> On August 15, 2024 11:49:03 PM GMT+07:00, srinivas.kandagatla@linaro.org wrote:
>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>
>>> sm8250 and sc7280 have lpass codec version 1.0, as these are very old
>>> platforms, they do not have a reliable way to get the codec version
>> >from core_id registers.
> 
> I wrote that it looked good, but maybe you can also describe, why core_id registers are not reliable? Are they just not present on those platforms or is there any other issue?
> 
Sure, the comment is correct because the registers are available to read 
however the values of those registers are not fit for dynamically 
detecting the version, like what we do in the driver.

one of the reasons is that the codec evolved over time, I think starting 
from v2 it has values made more sense to determine the version info from 
these registers. This is also evident in the current code.


Let me add this detail the commit log and send a v2.

--srini
> 
>>>
>>> Add the version info into of_data, so that it does not need to use
>>> core_id registers to get version number.
>>>
>>> Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
>>> Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions")
>>> Fixes: 727de4fbc546 ("ASoC: codecs: lpass-wsa-macro: Correct support for newer v2.5 version")
>>
>> Which commit introduced the issue? I think having just the first tag is enough.
>>
>> LGTM otherwise.
>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> ---
>>> sound/soc/codecs/lpass-va-macro.c | 11 ++++++++++-
>>> 1 file changed, 10 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
>>> index 8454193ed22a..e95d1f29ef18 100644
>>> --- a/sound/soc/codecs/lpass-va-macro.c
>>> +++ b/sound/soc/codecs/lpass-va-macro.c
>>> @@ -228,11 +228,13 @@ struct va_macro {
>>> struct va_macro_data {
>>> 	bool has_swr_master;
>>> 	bool has_npl_clk;
>>> +	int version;
>>> };
>>>
>>> static const struct va_macro_data sm8250_va_data = {
>>> 	.has_swr_master = false,
>>> 	.has_npl_clk = false,
>>> +	.version = LPASS_CODEC_VERSION_1_0,
>>> };
>>>
>>> static const struct va_macro_data sm8450_va_data = {
>>> @@ -1587,7 +1589,14 @@ static int va_macro_probe(struct platform_device *pdev)
>>> 			goto err_npl;
>>> 	}
>>>
>>> -	va_macro_set_lpass_codec_version(va);
>>> +	/**
>>> +	 * old version of codecs do not have a reliable way to determine the
>>> +	 * version from registers, get them from soc specific data
>>> +	 */
>>> +	if (data->version)
>>> +		lpass_macro_set_codec_version(data->version);
>>> +	else /* read version from register */
>>> +		va_macro_set_lpass_codec_version(va);
>>>
>>> 	if (va->has_swr_master) {
>>> 		/* Set default CLK div to 1 */
>>
>>
> 
> 
