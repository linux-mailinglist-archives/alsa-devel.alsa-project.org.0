Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B266BD8B8
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 20:17:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4A6E10A5;
	Thu, 16 Mar 2023 20:16:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4A6E10A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678994256;
	bh=cWSoSa3JIdRyAi+fG/SfZrAW3aLzb44noqlS8QJkik0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hgqdelDwgzQw3khOigcBBdbKdHJnNoGG6p0e6ugRuXCrg2Y+UZRXoiYp0u8A/8I7d
	 WB69DeOY/04r0cNhWTfv5d7AecHgmK2zD79OyEaN3C10N5wFa6WnWXyXWc+KOxJ13D
	 vzqitlfiRQwiaA4v/yK3YkrS8E4LxsHyboONWZe0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31D94F8016C;
	Thu, 16 Mar 2023 20:16:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0A86F80423; Thu, 16 Mar 2023 20:16:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84492F800C9
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 20:16:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84492F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Gg8uFCNz
Received: by mail-ed1-x52f.google.com with SMTP id eg48so11626327edb.13
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Mar 2023 12:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678994191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p4dswHx01qFyh/CKCq0Z4NfZll3Xh2LeviJSxwsyG5w=;
        b=Gg8uFCNztqtT+wsx6xfWshpbc7uY5YbBmQpPWxiTPhbH/vb/RnRJpPq1QHfjjEqXum
         c5YGUzOEXLuppCYlyR2TflIgEWSBklB545MHNItGSMNe7vilB/lhQWlCMscI66FpohrE
         l+8MpyDM18ayd5wzIpDouqQlOliR7bbBGLT3U5nqkRfCXlf1qaYTNPjTo/NhP+jfqLfs
         3PyjkLbl3ha2wEpXY1b3+18L0Glh3IF7SmqYoRPqu6Yl70dyB1YnoWeZ3Ar1oWOMW99g
         K4gl2h+urC73/gWy4DsrMr8j2FJ0vqhAl3oyCropv7qsYaTuyWJni0RzzP9CsHY8UOzb
         WtPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678994191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p4dswHx01qFyh/CKCq0Z4NfZll3Xh2LeviJSxwsyG5w=;
        b=nDpNkj33A1FioDlTPxDcpQk97lEpkEBrHKXhyscmVn1P0fAShN9DU/wLcvD0tT4AlO
         0NH9w7T8+BwxM4IIj7pPRy0HOT3eZJhNCM6B64zInY9DF5Km91Ljafi4ogcdJGiplrNV
         B0wMebBnVHUxGrmgLpT3UgMEbGO0MnWN1SanXfucggCdDRTnIyXR0RQjIu0zsElb9hcq
         59p482xVI1X5/G4eNkEWcdI2vQKoxVdBglZm1Eo0kQa1WW/5amCBi4+FI9LSa31LJBp6
         9UvTwpeqWZvzYVeDCA+vn9BBqVleV6N/AvENqb/vO/vaFQvuCN0NW4vt8V3ZTGv21tam
         H+Bw==
X-Gm-Message-State: AO0yUKW9yZBWwcoSYVZL9lttoSthgILC1bcWF51Yh/AHwfJf9UEzHvkS
	oEoaf5kTTkZkYeFGYMzY+tGpGw==
X-Google-Smtp-Source: 
 AK7set9jYWsIjNheBCK32m5C4J/UE6srSN1wMLPMWS2c5BWJd9JjV2zVQLvhuTL0ER5eoAGFzo+/8Q==
X-Received: by 2002:aa7:d6d0:0:b0:4fb:fd22:29c0 with SMTP id
 x16-20020aa7d6d0000000b004fbfd2229c0mr636983edr.26.1678994191211;
        Thu, 16 Mar 2023 12:16:31 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f?
 ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id
 o2-20020a509b02000000b004faa1636758sm144187edi.68.2023.03.16.12.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 12:16:30 -0700 (PDT)
Message-ID: <a3f7b1bf-b37a-1e42-1e43-02b82fbd895b@linaro.org>
Date: Thu, 16 Mar 2023 20:16:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] ASoC: dt-bindings: adi,adau17x1: Convert to DT schema
To: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vijaya Anand <sunrockers8@gmail.com>
References: <20230315231055.3067-1-sunrockers8@gmail.com>
 <167897628543.92626.6326219364017588458.b4-ty@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <167897628543.92626.6326219364017588458.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XXELCT4UOH6EYVWWGJM7KQY7ACVFJ5SG
X-Message-ID-Hash: XXELCT4UOH6EYVWWGJM7KQY7ACVFJ5SG
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Daniel Baluta <daniel.baluta@nxp.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XXELCT4UOH6EYVWWGJM7KQY7ACVFJ5SG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/03/2023 15:18, Mark Brown wrote:
> On Thu, 16 Mar 2023 04:40:55 +0530, Vijaya Anand wrote:
>> Convert the binding document for adi,adau17x1 from txt to yaml
>> so one could validate dt-entries correctly and any future additions
>> can go into yaml format. Add address and size cells to example to
>> prevent errors regarding reg format.
>>
>>
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/1] ASoC: dt-bindings: adi,adau17x1: Convert to DT schema
>       commit: 87771c94025890246a6dfec9773eb62bd41c4c5a

Hi Mark,

There was a warning from Rob's bot. Can you drop the patch or you expect
follow-up?

Best regards,
Krzysztof

