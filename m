Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C686E3B55
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Apr 2023 20:52:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71F64832;
	Sun, 16 Apr 2023 20:51:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71F64832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681671140;
	bh=aOXud+Ya+MHU54Cn4NFX5stiwy+05kSTROyqHQxDVWY=;
	h=Date:Subject:From:To:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fxB+OlBTdsBr8U/R6MohefsThH/tT1Vgn2OiEklwSvPJrb18Hd+i88/Q+NWIQhk8I
	 zvWp8a3E9u6T8vRQGGvezKSH63HYr8E35PPslNcIvu4iac6RA1S0y/SwgKFAfr4NF5
	 a4D59nnNb2E0gM0zldaEf6M3o7JM7iDaPO812eGY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A7C0EF8025D;
	Sun, 16 Apr 2023 20:51:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5485EF80266; Sun, 16 Apr 2023 20:51:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3AC33F8023A
	for <alsa-devel@alsa-project.org>; Sun, 16 Apr 2023 20:51:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AC33F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=s7Cy79OQ
Received: by mail-ej1-x633.google.com with SMTP id dm2so58799076ejc.8
        for <alsa-devel@alsa-project.org>;
 Sun, 16 Apr 2023 11:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681671075; x=1684263075;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GKImHCjHVF5MZ/4M5IREBVMKJU5wQfIJuuJriWo9vEM=;
        b=s7Cy79OQkVoSUqwpUIa4AWNao0LwkjducBmRn/xrDI3YTfRKfxsy1NdT1DhklolWHz
         agVFkH2SM+Sev/Pxi0yBokTO67lNPQ9po7rxIguvFpXX2W7KmgH+oeAL+/LwwUaC8onn
         VGSaYCt3Fse06Zn83FmefE6gCa7XKwlMEDqUUnSe52G30qUOGjrTIokO+NItSxS4m9/j
         QuA66PMKS7ihuYAPnxjgGViptkmwGlEnnmkZtbho2JULPMs8zDUH171k61GpvaaXyGE+
         vsV3D7krkyEgfKiA3L+stcOe1IjYFjZml6jhGqjWyGQh6wJv88PTBbXDsO781DjJjz19
         kjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681671075; x=1684263075;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GKImHCjHVF5MZ/4M5IREBVMKJU5wQfIJuuJriWo9vEM=;
        b=ZPDenKKR17MEY/Qg79q6sl/4M9U+ewl7iADehla/3Pzecj0/Ogdow48uwljH5zc8E+
         0UnZYj4IUzUYyW8YTpmwEqwK5BPYZqh9bLJuETwdVRbTKUtWV95w1QBbBJz0DUaLovgN
         6sfgdQz5GDli3KpGRw4cFrhctjFHkPkm6ATV6TUBibHHaIUVy7xF9lS77CFvTScW5PTM
         MZRtkmz0FvNBYFsKm1u2RXsI8ak8mYOyrrw/W4RwjiQ8IZnRwKJw+dM+rSz8t04zBBE6
         FmV0S48B75gabft5xCOIq8vd9rzL4K9FgxR1vnE0V5vk02MYSGkEzrTmjVDe1Cyly+wh
         jaPQ==
X-Gm-Message-State: AAQBX9cPxCqtwSOZg2isC5MbmanyVHiDic3ZQW6C2tLr7oEJzZzSthMU
	sqY4IsfYp0CzzMpvgAb/to86oQ==
X-Google-Smtp-Source: 
 AKy350ZUnlsLiqcJGll/ROJIUcU/VJ4V8dQbWggjC/n4kdtez0qynFD8+ZslbYFgDYYJPL4FJM4PFw==
X-Received: by 2002:a17:906:fc0e:b0:94f:317f:6a58 with SMTP id
 ov14-20020a170906fc0e00b0094f317f6a58mr3656389ejb.35.1681671075214;
        Sun, 16 Apr 2023 11:51:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f9e3:1d38:66a7:ae92?
 ([2a02:810d:15c0:828:f9e3:1d38:66a7:ae92])
        by smtp.gmail.com with ESMTPSA id
 v2-20020a1709064e8200b0094efcc4a076sm3253368eju.164.2023.04.16.11.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 11:51:14 -0700 (PDT)
Message-ID: <98da9a32-9771-1002-f323-909e8b49a536@linaro.org>
Date: Sun, 16 Apr 2023 20:51:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ASoC: dt-bindings: wm8753: Convert to dtschema
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Saalim Quadri <danascape@gmail.com>
References: <5d629ff3-c5ae-bd00-e70d-8c0d58365ce3@linaro.org>
 <20230415201246.1200683-1-danascape@gmail.com>
 <92d0f4c7-ed53-5d84-3955-08d1ab8bbd98@linaro.org>
In-Reply-To: <92d0f4c7-ed53-5d84-3955-08d1ab8bbd98@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2P6XD7MNRH5QYM2ODWN7HROFDOJBZJGT
X-Message-ID-Hash: 2P6XD7MNRH5QYM2ODWN7HROFDOJBZJGT
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, broonie@kernel.org, daniel.baluta@nxp.com,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, robh+dt@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2P6XD7MNRH5QYM2ODWN7HROFDOJBZJGT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/04/2023 09:35, Krzysztof Kozlowski wrote:
> On 15/04/2023 22:12, Saalim Quadri wrote:
>>> You choose unusual bindings to convert to DT schema. It is fine but
>>> honestly, less useful, with limited impact. This is an old, 12 year old
>>> binding without users. Maybe it would be even removed by now...
>>> I suggest converting ones which have a real impact - have users in DTS.
>>> Otherwise you will be putting quite a lot of effort for no real gains...
>>> because what is the difference between this binding being TXT and DT schema?
>>
>> I am converting these bindings as part of my GSoC project where I need to convert
>> as many files as possible during the given tenure, I am slowly trying to read files
>> in other subsystems too and will push patches for other subsystems too.
>> Is it fine?
> 
> In general it is fine. I wonder if we can change the goal of GSoC? I am
> surprised that such goal was chosen in the first place. Converting old,
> unused bindings to DT schema is okay, but it would be much better to do
> this for the bindings which are actually used.
> 
> Because I still wonder - what is the difference between this binding
> being TXT and DT schema?

BTW,

If you want to find used bindings and tasks to do, check Rob's bot output:

https://gitlab.com/robherring/linux-dt/-/jobs/4118960859
https://gitlab.com/robherring/linux-dt/-/jobs/4118960858

I pointed to these jobs two months ago when Daniel was looking for some
feedback.

Best regards,
Krzysztof

