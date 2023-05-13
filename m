Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6572E701888
	for <lists+alsa-devel@lfdr.de>; Sat, 13 May 2023 19:38:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84850D8;
	Sat, 13 May 2023 19:37:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84850D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683999522;
	bh=gdlFmfP26Irq5OuWqG2qSWBPVO3rR3JWSpH1dsKAR9U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iFyVIJn/r3RavA0l7MZSN8F8zFW5GFTOFXeyLBzyzXflf8TD5sjUBhE3yj1hFCAMT
	 h3RxQOy+Nvx5L9JbV7wFNMtfXlkj39dDX5VmjwZKfWV6zffYmgczNhNOKEvCQengqb
	 tn1SPQBrls1d7MCFN7P1qSH7v1w8IAKhKQCjEL9Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D37B9F8032D; Sat, 13 May 2023 19:37:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B23AF8032D;
	Sat, 13 May 2023 19:37:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EEADF8052E; Sat, 13 May 2023 19:37:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B12B6F802E8
	for <alsa-devel@alsa-project.org>; Sat, 13 May 2023 19:37:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B12B6F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=evSV/R5f
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-953343581a4so1744715966b.3
        for <alsa-devel@alsa-project.org>;
 Sat, 13 May 2023 10:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683999456; x=1686591456;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=phEaoLqXnuHVjhKK/074Q+ATg9GGDFAIHK3RaliX/xs=;
        b=evSV/R5ffLjVwauCYY48D1u+m+e/VX17IimUCeC218UBpgANY/+ME4eqapH7Yj1bTq
         xOvbH10IfQYFcEFSpJA/qOGU+H1S+s9SJXp1ym6ZMvaC8bGppNn/tOLlS+eQXhtabKOq
         ZZiowXQeo7lgL3OsiH2dkUtArpkqSZLBAUQL4F2ivc78Q0SMMtkY1aXWZyWqvNoJoKQ8
         gX2TKhWmxEJTJ6omiYxBAL6Mtde07NztQGyu/SQD5kN20pM11pHSffzWQm3/D5zFs7hy
         DdxupsruO6PEYFIfy5VFVeMCgr0uXrYQ0woqBhW2ZrQH02iJ/hhztq/tQSCMWdik/m0b
         aPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683999456; x=1686591456;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=phEaoLqXnuHVjhKK/074Q+ATg9GGDFAIHK3RaliX/xs=;
        b=joj21zVXrpcxXgp/Rl0Jl8D3MiL9LND2USVWQbUL7+KcVBEYXAOefJXEzVyChoWTnJ
         5Z0Cpm4Ng0kuUx9zrTgOZyWx0juE7zwApkV8eNvNs1Lp0SXMYRMnOq3l6WPtgg6EkgO2
         yH7EaOB2qk6NGPdbEemnw4JoFsS3Zgb8C0ffkRQDG3AtFmXDWk3G+5hwCZkWHZo3Brf5
         ZHdQxrm/YcxsiRgEdEvhK4iHHuwUPJCMcAKckBu93zzZ9MXH9tA7Qngx55Dk0QHErscR
         DIvI1jyX9oTGzWISMc4Yab+3XPunkl82VFkk4vIWaPSPY4QY/QCvghapSpsOp/dWqbCD
         uUbg==
X-Gm-Message-State: AC+VfDzixDc064hy1NiSrrlBVyc0KsOVrgdR1k7butwMfuvYDn0/E6tZ
	32UMLziEmw+rqekZPYtzSp4Wfw==
X-Google-Smtp-Source: 
 ACHHUZ7Ff9s2f9f/z+N90bS59Y0tGzNori+ir7oCbpWhVrC2abp4fhHbcXH203MWt1UyD/1QZkhKsw==
X-Received: by 2002:a17:906:58c8:b0:966:168d:8c5 with SMTP id
 e8-20020a17090658c800b00966168d08c5mr24174817ejs.57.1683999456087;
        Sat, 13 May 2023 10:37:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bc2d:23f8:43c2:2aed?
 ([2a02:810d:15c0:828:bc2d:23f8:43c2:2aed])
        by smtp.gmail.com with ESMTPSA id
 jr18-20020a170906515200b00965f5d778e3sm7043541ejc.120.2023.05.13.10.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 10:37:35 -0700 (PDT)
Message-ID: <a65abc07-eace-eaa6-e821-2eed438e068b@linaro.org>
Date: Sat, 13 May 2023 19:37:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: MAINTAINERS: drop Krzysztof Kozlowski from Samsung
 audio
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org,
 'Sylwester Nawrocki' <s.nawrocki@samsung.com>,
 'Liam Girdwood' <lgirdwood@gmail.com>, 'Mark Brown' <broonie@kernel.org>,
 'Jaroslav Kysela' <perex@perex.cz>, 'Takashi Iwai' <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>,
 p.rajanbabu@samsung.com, =?UTF-8?B?J+2MkOy5tOymiCc=?=
 <pankaj.dubey@samsung.com>
References: 
 <CGME20230513090242epcas5p34625f5b6f0a180263e6607a38e0c996f@epcas5p3.samsung.com>
 <20230513090228.4340-1-krzysztof.kozlowski@linaro.org>
 <000001d985a8$9fd3fb50$df7bf1f0$@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <000001d985a8$9fd3fb50$df7bf1f0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FCUEPOJOIG646QFSYSQSXKXFKH6QUF34
X-Message-ID-Hash: FCUEPOJOIG646QFSYSQSXKXFKH6QUF34
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FCUEPOJOIG646QFSYSQSXKXFKH6QUF34/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 13/05/2023 16:38, Alim Akhtar wrote:
> Hello Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Saturday, May 13, 2023 2:32 PM
>> To: linux-samsung-soc@vger.kernel.org; Sylwester Nawrocki
>> <s.nawrocki@samsung.com>; Liam Girdwood <lgirdwood@gmail.com>;
>> Mark Brown <broonie@kernel.org>; Jaroslav Kysela <perex@perex.cz>;
>> Takashi Iwai <tiwai@suse.com>; alsa-devel@alsa-project.org; linux-
>> kernel@vger.kernel.org
>> Cc: Alim Akhtar <alim.akhtar@samsung.com>; Arnd Bergmann
>> <arnd@arndb.de>; Olof Johansson <olof@lixom.net>; Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org>
>> Subject: [PATCH] ASoC: MAINTAINERS: drop Krzysztof Kozlowski from
>> Samsung audio
>>
>> Remove Krzysztof Kozlowski from maintainer of Samsung SoC Audio drivers
>> and change the status to maintenance (no one is reality being paid for
>> looking at this).
>>
> Thank you! For your over the year’s contribution and support in
> maintaining and enhancing Samsung SoC Audio driver. Your input always helps
> and I hope that will continue in future as well.

Thanks! Although I did not contribute that much to the Samsung Audio
driver, but rather tried to keep it reviewed and in some shape.

> While at it, I know Padmanabhna (CCed) was recently doing and is working on
> I2S driver and Audio codec driver upstreaming to add support for some of
> the recent platforms. I will check with him if he has interest to take up
> this.

That would be great!

Best regards,
Krzysztof

