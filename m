Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B87406E4D7E
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 17:44:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01335BC0;
	Mon, 17 Apr 2023 17:43:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01335BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681746248;
	bh=Il8G+CnqOatl1rrS4njmL/CYagcVl5tHrKodWMwca98=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PRDF75SZveU5cmuhtdfOKOGLjAWnfbi02qnscAOab1ESbOgP/1Skc+3VCW/DGmemb
	 mKr98wTKiL7NcpSW5tRR0+kbroE4JCUYVMgLAc8DRrIf97sBMLh7AV9PGzUPqRRONg
	 /HKw0mlM5Q4qCP6TwMnwk+Lm5bppBh4hxuTLEeKg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64B98F8025D;
	Mon, 17 Apr 2023 17:43:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05025F80266; Mon, 17 Apr 2023 17:43:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 323EEF800E2
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 17:43:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 323EEF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jeh7WSne
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-504fce3d7fbso3662140a12.2
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Apr 2023 08:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681746185; x=1684338185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GJYJw6tWsqkpdYQ4hdNlQoYrkpeQHw5VAulU94/xuYk=;
        b=jeh7WSne0PW0CUOQXsjmdihDXbZKk8wM38WNp/ff41gAXcfZWMVyDwdXh4WwET1qc5
         8HVNn3IiT+COZLWyk2wQowoUIofdkaa0Ftciq8KLVYVwnWnnVmTkAgWujtef5AnPowaX
         iDCoGRPiFsTBpBKbf0Kl31rQFmA7sgwQ3RSTUJZbi2V3bT89ZeIfvI6PBIn5ZMk8cjHZ
         gBvzmxtZ3SvQGz9ExsujLCQZz2ofIReOnmqozb7pT9MOXlDVciO1rLplV6I7DW/gDCOG
         sBqS5Fp5qRYFrMpWVJ2Wer1XFSwlm1XF46r7rCvM8OJ13tqTg78NkLdRBbMi4KOvAksu
         J/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681746185; x=1684338185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GJYJw6tWsqkpdYQ4hdNlQoYrkpeQHw5VAulU94/xuYk=;
        b=hNBbmcFlL6/WwIn1hy1W5RIopjLdm/cE3eUJc3C1eetLUCA65bfgWlEN0nvm8LpiBX
         E6wtk10rkYw4H2en9OCszhD6M7T/DOOUThAsX2OlAD+DC6t1d++22SpPDkt5uiHMAMKO
         4SvCM/5Gj6VIINBgf+72yXl4V63FIqBTWrIaEgao8pSj+R7wgTdol4/Tmzk2uhI3fZlO
         yOtqggdtI9WLsHq6Wc8oNXx7E/kgHTBaBHt8dWcEkEQtelkSKnAehAgjNWFLWhdkNkV8
         UC0adWo75rZrt2cAg9pXOSDcFvGRUZo7N//3MS7HaTEj1X1cT/E9ogQlI7Z3x0NFOQSn
         Lk0g==
X-Gm-Message-State: AAQBX9eXLIb5YAX6Hj1jZ+E0FiuOI8ZcONx1HZ5RGPr4Z/Jd2raCC3a8
	kl2rnpuZRWYGwqb1DawfUJS7BQ==
X-Google-Smtp-Source: 
 AKy350aAG0b6vPN6e0SzhfdEAz6qg8I09AqiwZG7XGdDNenjTcn75aJ783EEkyKfulx8SVqsIWPqiA==
X-Received: by 2002:a50:fc05:0:b0:4fb:5089:6e01 with SMTP id
 i5-20020a50fc05000000b004fb50896e01mr16436227edr.6.1681746185120;
        Mon, 17 Apr 2023 08:43:05 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:96aa:60eb:e021:6511?
 ([2a02:810d:15c0:828:96aa:60eb:e021:6511])
        by smtp.gmail.com with ESMTPSA id
 w17-20020aa7cb51000000b004aeeb476c5bsm5894871edt.24.2023.04.17.08.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 08:43:04 -0700 (PDT)
Message-ID: <c294d672-c2fa-7468-f02d-18d5230a1d95@linaro.org>
Date: Mon, 17 Apr 2023 17:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/4] ASoC: codecs: wcd934x: Simplify with dev_err_probe
To: Mark Brown <broonie@kernel.org>
References: <20230417141453.919158-1-krzysztof.kozlowski@linaro.org>
 <20230417141453.919158-2-krzysztof.kozlowski@linaro.org>
 <20aa9662-9cbb-4fbe-b6ed-3a6ba33e820a@sirena.org.uk>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20aa9662-9cbb-4fbe-b6ed-3a6ba33e820a@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4JVSXPMISHX56N5W4TOLUURABCDVYQVI
X-Message-ID-Hash: 4JVSXPMISHX56N5W4TOLUURABCDVYQVI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4JVSXPMISHX56N5W4TOLUURABCDVYQVI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17/04/2023 17:33, Mark Brown wrote:
> On Mon, Apr 17, 2023 at 04:14:51PM +0200, Krzysztof Kozlowski wrote:
> 
>> Code can be a bit simpler with dev_err_probe().
> 
>> -	if (IS_ERR(wcd->if_regmap)) {
>> -		dev_err(dev, "Failed to allocate ifc register map\n");
>> -		return PTR_ERR(wcd->if_regmap);
>> -	}
>> +	if (IS_ERR(wcd->if_regmap))
>> +		return dev_err_probe(dev, PTR_ERR(wcd->if_regmap),
>> +				     "Failed to allocate ifc register map\n");
> 
> This is a functional change.

Hmm... I don't see it. Return value is the same, same message is
printed, same condition. Did I make some copy-paste error?

Best regards,
Krzysztof

