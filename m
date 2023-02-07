Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFCC68E43C
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 00:12:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 570961E1;
	Wed,  8 Feb 2023 00:11:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 570961E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675811548;
	bh=vSLNeOlCKJlwibOjbl+116GcUPJcLNyu2fBb1DkbSto=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kL7jGZ5V5duCjlavSOSciT5/3CBf9EGWjJqfjuDcnKO3g4/vJVBcGKbYJ1I5ZK3uV
	 ZVyaSz1HlDSmv1++W7Ijvl4uG77UitbZXx7JS8Z8WFXF2aojakzcG7WHhfJCCIO6cl
	 lXBgjs8ntt769sL1/I9/5leiWl52S1YTkeuUnQNw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94AFCF8010B;
	Wed,  8 Feb 2023 00:11:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E70CF8012B; Wed,  8 Feb 2023 00:11:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,T_SPF_TEMPERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BAE66F800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 00:11:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAE66F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=OOpf1czE
Received: by mail-wr1-x42f.google.com with SMTP id m14so15064954wrg.13
        for <alsa-devel@alsa-project.org>;
 Tue, 07 Feb 2023 15:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pNxhydrTd34r+uTCjdy7LmWbFpsf5f3sYLA3FNJZQww=;
        b=OOpf1czEbZTuwyeGOmOGKz7pMXyILFbVPQEgNdrukQw9ebAQtZ3Ph0X+OSqHKXxqiI
         N/SGx8WbJPHja+jDqLqkhzRlhZVgV3TSBRFNY9avBRQkE4q5JqiTiRq8U1/z8StFEDVZ
         eqKd8NsJYe4t04WB+x036wWk0qas+WL7GhPpXxtGK9fDJUsBm7KI8hVn8WaReFG3e3w/
         Zho6lpZ+7bnaGPY1JZTqJTQhAmNJFYItPWl4OXygL23p2f9QfN7IaCrvnfW8TJJtjIMf
         JWkhcWKGuzVREDAvhRJ2MWMMTCHw/kQw0lj7PLi8vQiTz/qVnDIgk8o3sEO7rTIwlKCd
         eQ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pNxhydrTd34r+uTCjdy7LmWbFpsf5f3sYLA3FNJZQww=;
        b=3h/odQZo3m44gisjp7v90a3i5iBY0T4q5h+8Saze9aSm32d87V0R/yGMhRr9ER4Ox5
         PYOXQ8988j0e78mxZt10Odyc+7lsVU4JCvNae35Z35JHaaneQgF0SNj9TkJoGgQ0oxJ7
         dp9ZE3Bb+Et3wq8aKvKPA9ZfHa6tXVNwZYmmkGYJTRSjHMwCCbfcr1iQPLzF00MpTcQZ
         zDD4u7Ukd6hyCkQc6ZcIMi+cVWaw4118G1qEjiIJDNclxoUc4o86ofxf8SOfQs7DPkge
         fpyzs8xzPG6sLDiMOBnkLoOUi6QszayHCVuiZKZAAv5kybf3SQp8/TYs9Df2FJclzWLa
         BS3Q==
X-Gm-Message-State: AO0yUKXSSObxAh1cAvlvwbJ//R86D/62DmaUSikgbCa/ks1NgxSCxR08
	5roTdkKtjvugQ2LaI1fkxKwFsQFwK7IwdT6F
X-Google-Smtp-Source: 
 AK7set/sTDamrm6lwZ2cQEH8kqJYkVmh9E/4XDzymL4dbTYXYvGyWqJKRMfRHh0fjqGQykDjRGMPmg==
X-Received: by 2002:adf:fe09:0:b0:2bf:bc0a:361d with SMTP id
 n9-20020adffe09000000b002bfbc0a361dmr3139814wrr.31.1675786432534;
        Tue, 07 Feb 2023 08:13:52 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 f7-20020a056000128700b002c3df9279f5sm8450225wrx.48.2023.02.07.08.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 08:13:52 -0800 (PST)
Message-ID: <44c7274f-8a5e-0235-413a-6c3260018601@linaro.org>
Date: Tue, 7 Feb 2023 17:13:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] Documentation: cs35l41: Shared boost properties
Content-Language: en-US
To: Lucas Tanure <lucas.tanure@collabora.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230207104021.2842-1-lucas.tanure@collabora.com>
 <20230207104021.2842-3-lucas.tanure@collabora.com>
 <44faeca1-94c9-4423-d87a-03d80e286812@linaro.org>
 <e7257f9a-86c5-74e8-c538-6f6d2ba13274@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e7257f9a-86c5-74e8-c538-6f6d2ba13274@collabora.com>
Message-ID-Hash: 3BT2XLFZC2UG4H5JO2C3JAZ5DHRVGT6Q
X-Message-ID-Hash: 3BT2XLFZC2UG4H5JO2C3JAZ5DHRVGT6Q
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 kernel@collabora.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3BT2XLFZC2UG4H5JO2C3JAZ5DHRVGT6Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 07/02/2023 16:46, Lucas Tanure wrote:
>>> +      Shared boost allows two amplifiers to share a single boost circuit by
>>> +      communicating on the MDSYNC bus. The passive amplifier does not control
>>> +      the boost and receives data from the active amplifier. GPIO1 should be
>>> +      configured for Sync when shared boost is used. Shared boost is not
>>> +      compatible with External boost. Active amplifier requires
>>> +      boost-peak-milliamp, boost-ind-nanohenry and boost-cap-microfarad.
>>>         0 = Internal Boost
>>>         1 = External Boost
>>> +      2 = Reserved
>>
>> How binding can be reserved? For what and why? Drop. 2 is shared active,
>> 3 is shared passive.
> 2 Is shared boost without VSPK switch, a mode not supported for new 
> system designs. But there is laptops using it, so we need to keep 
> supporting in the driver.

That's not the answer. 2 is nothing here, so it cannot be reserved.
Aren't you mixing now some register value with bindings?

Best regards,
Krzysztof

_______________________________________________
Alsa-devel mailing list -- alsa-devel@alsa-project.org
To unsubscribe send an email to alsa-devel-leave@alsa-project.org
