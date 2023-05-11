Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BAA6FEF01
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 11:38:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DF8E1E0;
	Thu, 11 May 2023 11:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DF8E1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683797897;
	bh=nGXNCx3mX2qf5C8G133tq5Xx/YyzgfSRcCFmT8U5zjI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WaSNn4DJJwSis2wFKG6TKCeimUk3nzVpr1yrAE/GQxao/TBqnuau2agKsfZvsmX4G
	 35dBcV0y7mqAyZmx1L3HIZC2D83StRD7iTFqNLupB+WmeEwqqXaXTHxPVujLGN141c
	 XeqNVFcIETl5dd8Pu4wPq2pKxMjQ9Loh5qeKvM7A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6524F80310;
	Thu, 11 May 2023 11:37:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E06C0F8032D; Thu, 11 May 2023 11:37:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5980F800BF
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 11:37:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5980F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pfZeriXX
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-96a5903758fso133379966b.1
        for <alsa-devel@alsa-project.org>;
 Thu, 11 May 2023 02:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683797834; x=1686389834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0TRjdhGheNLs8yioJ0et+AqnEpVQkoA539PlQCzm5lQ=;
        b=pfZeriXXUl23v8ujioeEl7tU7lkqZg4uhs1cDv8ogmQ4nDTwj4f5BrsvbPAmGKE+ke
         uizekmWLlrfLoIYnZXtWu8r4Bk27QGRAOcSQgIefdvzWF1drv5DcN/2bYjyBydovPbWz
         TjkfKwbW/gTpYXSPT+otsiOxypWwGQga3lNVdpeqacOBNqeYH5UbRuhTFWNiQIebwHG0
         lvonbYwuR9dng+4MBA+oIWqCQAuRk65DjpAJvOCJhHZn5+OdBySlrvFSb8sP/GVFmYUU
         z6gh0CMcQZnO3DREanelq2x3pJSKKcQf/yAkbETAtg3Axm7UZNr78vG4FoaLf2W6JCHW
         bHlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683797834; x=1686389834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0TRjdhGheNLs8yioJ0et+AqnEpVQkoA539PlQCzm5lQ=;
        b=U2W+OC6yqBUZ4dhfBcQIZYPaHDcHZ1/i4bDe4Vh1rTEnIeZmyfYuywj7f1dKBkudZH
         nixXrsBeGztYt/DIYutFzjkUAPZ9mP3DedYTNpE5Uc43OLo3AmuIrZnhLzAi5vbzzOhv
         clMaxHexB7jV+FDqIxFqAfpiaU0RTA7whjxrJuVbNNP06IpAqSpJ9pi3USQCvjI1TzCu
         TPu/Ao/vcK70TRxwq/1FGyl8N2yq91Rda2VGEmXMPjv410J64fXAjioG0XR4cJnF73gU
         DLYd04AcaoayARSuMv1X2cWcxFG+T/ipFpE+Le8zqWjUJ0exkftzqwql3NwYwNhmp03N
         2agw==
X-Gm-Message-State: AC+VfDz0Qz6cb9JxHeVYtMi/17kARI4Gx1nW8ktK/LX3mfzFysASE4yK
	frHURRt/0LLFR5aHOHdGexnf3UUXzhm43TXY8kCN5g==
X-Google-Smtp-Source: 
 ACHHUZ4Hx4V319vc6VylXMO0Suff5DbHcFrowjRJuWGQieE5u6uGRJkXgthm4dY8KecLpl8JO8tKQQ==
X-Received: by 2002:a17:907:9308:b0:965:b2c3:9575 with SMTP id
 bu8-20020a170907930800b00965b2c39575mr16984246ejc.57.1683797833890;
        Thu, 11 May 2023 02:37:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7e61:f14a:c3a4:809e?
 ([2a02:810d:15c0:828:7e61:f14a:c3a4:809e])
        by smtp.gmail.com with ESMTPSA id
 v9-20020a170906380900b0094e1344ddfdsm3712446ejc.34.2023.05.11.02.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 02:37:13 -0700 (PDT)
Message-ID: <ca2ed8e9-850a-56c5-e395-72e5861b9c71@linaro.org>
Date: Thu, 11 May 2023 11:37:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/5] ASoC: dt-bindings: Add tas2781 amplifier
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Shenghao Ding <13916275206@139.com>, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 perex@perex.cz, pierre-louis.bossart@linux.intel.com, kevin-lu@ti.com,
 shenghao-ding@ti.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, x1077012@ti.com, peeyush@ti.com,
 navada@ti.com, gentuser@gmail.com, Ryan_Chu@wistron.com, Sam_Wu@wistron.com
References: <20230508054512.719-1-13916275206@139.com>
 <ca9d45cf-8a84-4fbc-e1dd-c96eef36fe25@linaro.org>
 <ZFyBzHWo3ORKAskX@finisterre.sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZFyBzHWo3ORKAskX@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AHKTPWCVXIL3JAKSTCP57GOII4X45VZL
X-Message-ID-Hash: AHKTPWCVXIL3JAKSTCP57GOII4X45VZL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AHKTPWCVXIL3JAKSTCP57GOII4X45VZL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/05/2023 07:49, Mark Brown wrote:
>> Missing minItems, but...
> 
>>> +    items:
>>> +      minimum: 0x38
>>> +      maximum: 0x3f
> 
>> ... So these are fixed? No need to encode them in such case...
> 
> I'm not sure I understand your concern here, there's up to 4 possible
> values from 0x38-0x3f which has more than 4 possible values.

Aren't the addresses going to be incremented by one (up to 8 of devices
in total)?


Best regards,
Krzysztof

