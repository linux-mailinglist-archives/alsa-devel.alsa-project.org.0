Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D9F79E068
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 09:04:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24990A4E;
	Wed, 13 Sep 2023 09:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24990A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694588652;
	bh=EnrwYR3muAjcVUCzaW37gneFBV8yBGR5Mn8kqkwRuFY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=kzeR2AuDN30pUOLKhW2w5rT/6qibC/P4fOk8wGiUNf2aneN+l9zIBSbjR9iDkRKb3
	 DokrFYOf0qAxP+qqBVLozPJwigzkwR+Im/XTtJNDtBjXfQIqvZC+XD/htEhHI0tM+a
	 iAwol5tlC6CDCwRdMNlSlR0ZlbPQOSrRU/teofgo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFBFAF8055B; Wed, 13 Sep 2023 09:03:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1650AF80552;
	Wed, 13 Sep 2023 09:03:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5ACFF80552; Wed, 13 Sep 2023 09:03:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8F9BF80246
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 09:03:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8F9BF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=o7HmvCG9
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-52a250aa012so8321115a12.3
        for <alsa-devel@alsa-project.org>;
 Wed, 13 Sep 2023 00:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694588592; x=1695193392;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KZ3zQjFWjU6aUGv1M6ufEZQD2GEy4rVqeEvdZE7HUcU=;
        b=o7HmvCG9GfA6Az6bDNmytyTIbe9+tSt5wD75DRQUH/RNCFCQvmj12MX4mrwfipE/4+
         Jv8H9/42G0ZcjrLrv3ja8izV6EIIrtu08ZjWEIwvWG00dSRJWynUDgpRvUnhLbKn7Qci
         CNybCI1iG2fhAl3Og9eDnScVNzJyYWCPRHci1eabO39drZ9kw+22bEYDuzkfkqudKv3h
         HWPRW7lqDORognFqVjCkuMExrd8VxViSPv4sbpVGKL1Qefc2R7BDFCTSP0u/Enc5llwh
         5SPUduyvQ3ylE+fS2mGf7A+n9X/tIB938vlCdazqaQt7nYqeAPnVL4d1cj2Q58f4bBVV
         4ZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694588592; x=1695193392;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KZ3zQjFWjU6aUGv1M6ufEZQD2GEy4rVqeEvdZE7HUcU=;
        b=uQNfDmwHrl7iLEyaAXzPOXpxYo0UtliJ8ojfDVlxIXIPShhSDoGdBAw7FXzCWj/ix9
         CTttFdeSHODgtlvifQKf+P2HFU/YTypxu8z2pf6ai458ua7+YQPMZWcsInZXaJmGvnsP
         YlNRfPrWlIZV9VN2YRvp8Z/g9AqFiq3kfS5Hzhl9qPlM+hqlA+ke0Jl1FrMARcDhjoV0
         7dl9MVrnRTUWHDTbLU/m//oPSlgUw+XnORyQ9Ir8JAwzCBWippEbhvkTk4UgKI4Ql8pO
         pOOU9LxLmy7Eb9VsR0w6Wy3vwJUVLrDqznBZFaqzclpNQQySz0BVcCJhGSw28x4I/b8B
         9tww==
X-Gm-Message-State: AOJu0YwfBOU8uuMSSC0vmhm1JZg5OFhdV76ig4HI4+HEyVZ3wa/DeBb2
	Xf09T+UbxihmUjdzqx1n9G7Wew==
X-Google-Smtp-Source: 
 AGHT+IEKAbAXa/5JMpdnKFLiyNtux5WP3j+5CeFfg9ME2oCoQ6zAJhpVu5+Wt7iMqVe/JefU7iiaAA==
X-Received: by 2002:a17:906:cc4d:b0:9a2:26e4:a5e8 with SMTP id
 mm13-20020a170906cc4d00b009a226e4a5e8mr1144760ejb.3.1694588592272;
        Wed, 13 Sep 2023 00:03:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id
 op5-20020a170906bce500b00992ea405a79sm7968662ejb.166.2023.09.13.00.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 00:03:11 -0700 (PDT)
Message-ID: <3ee11823-a441-b646-bdd7-aedd3a3a55e5@linaro.org>
Date: Wed, 13 Sep 2023 09:03:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH V2 4/5] ASoC: codecs: Change the aw88261 variable name and
 i2c driver name
Content-Language: en-US
To: wangweidong.a@awinic.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 perex@perex.cz, tiwai@suse.com, rf@opensource.cirrus.com,
 shumingf@realtek.com, ckeepax@opensource.cirrus.com,
 herve.codina@bootlin.com, 13916275206@139.com, ryans.lee@analog.com,
 linus.walleij@linaro.org, sebastian.reichel@collabora.com,
 fido_max@inbox.ru, povik+lin@cutebit.org, arnd@arndb.de,
 harshit.m.mogalapalli@oracle.com, liweilei@awinic.com,
 yijiangtao@awinic.com, colin.i.king@gmail.com, trix@redhat.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230912065852.347000-1-wangweidong.a@awinic.com>
 <20230912065852.347000-5-wangweidong.a@awinic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912065852.347000-5-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 37LK3OUZLQE3BCJZPSDKMCJIECBDL3BI
X-Message-ID-Hash: 37LK3OUZLQE3BCJZPSDKMCJIECBDL3BI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37LK3OUZLQE3BCJZPSDKMCJIECBDL3BI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/09/2023 08:58, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> Change "sound-channel" to "awinic,audio-channel"
> Change "aw88261_smartpa" to "aw88261"



> -	prof_name = aw88261_dev_get_prof_name(aw88261->aw_pa, count);
> -	if (!prof_name) {
> +	ret = aw88261_dev_get_prof_name(aw88261->aw_pa, count, &prof_name);
> +	if (ret) {
>  		strscpy(uinfo->value.enumerated.name, "null",
>  						strlen("null") + 1);
>  		return 0;
> @@ -1189,7 +1190,7 @@ static void aw88261_parse_channel_dt(struct aw88261 *aw88261)
>  	u32 channel_value = AW88261_DEV_DEFAULT_CH;
>  	u32 sync_enable = false;
>  
> -	of_property_read_u32(np, "sound-channel", &channel_value);
> +	of_property_read_u32(np, "awinic,audio-channel", &channel_value);
>  	of_property_read_u32(np, "sync-flag", &sync_enable);

What about this?

Best regards,
Krzysztof

