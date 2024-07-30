Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D91C0940DE9
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 11:38:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 463F1B60;
	Tue, 30 Jul 2024 11:38:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 463F1B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722332324;
	bh=0xKQ8ePHZ1nxl3vRVkbVRM3hAX6iaJ+djkAq9oV6Jtc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SQpV87B9BHkHb59yBFpM7AwVEAACmos4/UGEJsAxVEJq70/LGRzUIcte7PW9ZZ+Ww
	 wAeHkFX7ziMcqgS9EfQIa1rKfwEqlJ7lRaaCR2DyVR+QH7g2uEH94/eFvJA0xyl8RU
	 TOchXaBkws1VPlzNsZNKbgKVVOv3ntYvFaL3Cn4U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6019EF805BA; Tue, 30 Jul 2024 11:38:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 422ACF805CB;
	Tue, 30 Jul 2024 11:38:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33AAAF802DB; Tue, 30 Jul 2024 11:29:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D91EBF800C9
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 11:29:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D91EBF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FUWzzI7k
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a7a9a369055so492536066b.3
        for <alsa-devel@alsa-project.org>;
 Tue, 30 Jul 2024 02:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722331776; x=1722936576;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RyPQd1rNtzkvPQOPwTC5nu2cWyPLShX4EwWQLIqOsVA=;
        b=FUWzzI7krN71GpGU2Yl1jyd9oXMUKxQDKYxnJlaGahmCBFDTqprztEv597QdAM7ec2
         AW7U2eBkbFtHoaQcXSEVSW2ZZ/K6R/2i2hIhqXNi2CIGuI1L9TPPgSPJFbOm7eesFq8e
         oT7rP4vIWvaFyDWl9eNt8zeL/MiwTcrOKpJSeFv2+uQ+tpjd0Kimj4eMWjMMHiLxs6Ed
         kQMYZS0SvV8ewv17goB/NUJ3WHic+eoK4KNggAjKheZ6JGusFt8ukidcDiPD32wt2CLb
         XxRyzb9uc3BtKWSKjRaHYRc5SrneQ6TPe6r6KgCsBt0v+81oa3MTrnW0RVZQ4FLJ8ZQ8
         NOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722331776; x=1722936576;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RyPQd1rNtzkvPQOPwTC5nu2cWyPLShX4EwWQLIqOsVA=;
        b=cJ+/oN7/A5PiRkZOkEj5oQppKOJvajERBMbmWuljywcRjdbutOIkAn51tetrQdCpft
         fmSkInSGOQaw+wVAEuFSgN4ELNE0/Y0QdH9DqRAiGytdJ6OrBy1EwNWKV/xW/OhXIgm0
         hpOWVwaOkie1C9T1mVmgi/YOHIpu8PgGMBa/oytOWRBpluRTsxhVfHq+voImVPH4AapC
         KkgWi6H/79VyqlmVzE2YwuLqLTjk3qIO6wuyMpE7G5HpYcaQOlBPfSsO7G2kg5TIjqGX
         5WW0E9iPcCWe4IdxgfntCfIDnmKV3gVrNXUg67S5Yg7L0NTndf7mfSYit1KX9iTJsUco
         vQVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUukohxt30yOeV6OM+Y2JKL+/1fCLPy7D0OYzsor6gBAzbPyIt796hWrD87wk6Xu/wpAOg2GZuApxTNfmnx0RMfCN4mZBGec4UFa8E=
X-Gm-Message-State: AOJu0YyU9sBNYgKzUHeJg6SzlQYcPjW+HdDwgaQy+jE+VVNqTcxTRljJ
	GuTGJb9PBKUJSU0roMnAnXr95WKvVbbJNzgIJPqd/nOyfMB04GN6N+A+ijSSwmQ=
X-Google-Smtp-Source: 
 AGHT+IHgojYE+CtIpYR1JRAwUAnGWB050kbLdNTiY2z8F1EfjV7iRWTJvo1dQcVprB/pL3iVszGJ+A==
X-Received: by 2002:a17:907:9443:b0:a7a:b620:aa2f with SMTP id
 a640c23a62f3a-a7d3ff9e068mr729583866b.15.1722331775876;
        Tue, 30 Jul 2024 02:29:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab236c2sm621073666b.31.2024.07.30.02.29.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 02:29:35 -0700 (PDT)
Message-ID: <9b916fb9-84ac-4574-8f3d-aad2f539fcd0@linaro.org>
Date: Tue, 30 Jul 2024 11:29:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: stream: fix programming slave ports for
 non-continous port maps
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Shreyas NC <shreyas.nc@intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20240729140157.326450-1-krzysztof.kozlowski@linaro.org>
 <095d7119-8221-450a-9616-2df6a0df4c77@linux.intel.com>
 <22b20ad7-8a25-4cb2-a24e-d6841b219977@linaro.org>
 <dc66cd0d-6807-4613-89a8-296ce5dd2daf@linaro.org>
 <62280458-3e74-43b0-b9a1-84df09abd30e@linux.intel.com>
 <7171817f-e8c6-4828-8423-0929644ff2df@linaro.org>
 <048122b2-f4cc-4cfa-a766-6fcfb05f840a@linux.intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <048122b2-f4cc-4cfa-a766-6fcfb05f840a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6JBMCEH4UM75TJAQ4OQZBISAVPKYEX7Q
X-Message-ID-Hash: 6JBMCEH4UM75TJAQ4OQZBISAVPKYEX7Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6JBMCEH4UM75TJAQ4OQZBISAVPKYEX7Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 30/07/2024 11:28, Pierre-Louis Bossart wrote:
>>
>>>
>>> So if ports can be either source or sink, I am not sure how the
>>> properties could be shared with a single array?
>>
>> Because I could, just easier to code. :) Are you saying the code is not
>> correct? If I understand the concept of source/sink dpn port mask, it
>> should be correct. I have some array with source and sink ports. I pass
>> it to Soundwire with a mask saying which ports are source and which are
>> sink.
>>
>>>
>>> Those two lines aren't clear to me at all:
>>>
>>> 	pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
>>> 	pdev->prop.src_dpn_prop = wsa884x_sink_dpn_prop;
>>
>> I could do: s/wsa884x_sink_dpn_prop/wsa884x_dpn_prop/ and expect the
>> code to be correct.
> 
> Ah I think I see what you are trying to do, you have a single dpn_prop
> array but each entry is valid for either sink or source depending on the
> sink / source_mask which don't overlap.
> 
> Did I get this right?

Yes, correct.

Best regards,
Krzysztof

