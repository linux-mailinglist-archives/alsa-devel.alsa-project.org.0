Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 186357916F0
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 14:15:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5E937F1;
	Mon,  4 Sep 2023 14:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5E937F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693829732;
	bh=wAoGj4PivjNjmSU0XgN+FoIFHXVvIgbu2sx7KLn30AQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GnkyorWUAtSlwLc7dbP8YgUQEtqbDoVCa3VjM613rL6BWLphBcVljW8IalMJXsX7K
	 hMljH72jSOGMcKk1y82yMCVqL41mA7eajv1lOxmh/RkZklx1DIz1StlnmTvGXgbbjz
	 B7xdVVtcHIM4RbK+mz/EDXrDNO0jlRqxjGgYJM+g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 104E2F80527; Mon,  4 Sep 2023 14:14:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9153DF80431;
	Mon,  4 Sep 2023 14:14:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BCF8F8047D; Mon,  4 Sep 2023 14:14:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 394FDF80141
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 14:14:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 394FDF80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=F+zTsxoS
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4ff8cf11b90so2244900e87.1
        for <alsa-devel@alsa-project.org>;
 Mon, 04 Sep 2023 05:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693829673; x=1694434473;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k8h2PEzYhpa6MHVwUhluiZHRc9KyJDz5gg/68n+8KtA=;
        b=F+zTsxoSw/3aVKzV/80SOKwwxOUvMSJQfmSloV5uuNwK9/OECm4+Lw3BUg7mrsTlIv
         bamTMBvm1G+nwOBfFdJcB/wdG4TtozSHkcXSyKYUoYfvlng7uNevJY+ouED7RZtU+Qfa
         0pbahwCveiZEaXkCFpZk3OB12dXiPKCMCZk7gqAmtXVw6ByXFLJvSAL/mpLrsdpG60oY
         DhyZKeEaaD6JhIgFymfGwuPbG5w9e8IK9femfbzfRzEZyQbg/bFJ6iJZaJI4Kovuwj9r
         HqOIh3XEteR2po5am2+YITjZ2W1kIXKFyY72rUVdAwgSseIgtsyLII3dNC7Jc9LxQc80
         zlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693829673; x=1694434473;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k8h2PEzYhpa6MHVwUhluiZHRc9KyJDz5gg/68n+8KtA=;
        b=Gh+0rOto2YY2+JNCE2A1K9YUWv2H6vRjzVtuOdHSJgGFqC/X4DpM4TXVFcBhUquBVq
         XCJ3abDPZ3hx57tn4qn247tQJeCraCPfcBFBU8lriBkLqjc2SxUxThSz2IS653XLlcBS
         LOG8A0Ztp1p/TlAGLRuVXuyKsOze9IPCj3YIP6wVpI8dL0nzIU/N0rbs1v8vHt3qXLE4
         EjcgXsNB6NxImnUt2zlOZBjU9DvMTdj6LhHW70pTfw+AJDkrWMGWXao5u3370ESNbv1Q
         frSyWHqUUvgxy6WuJ9Ce4H/elrw9GZ48TI49xoe7W9V5gRJfM6BVOFMgCM4WD4ri7td0
         q1Cg==
X-Gm-Message-State: AOJu0YzydtHJEXHHGA/pvN+AUDLqhNXUPMq018MSSu3ZTBpGc+LIMy6d
	LJK/q1PClxDShyE4cy9/VdvaOA==
X-Google-Smtp-Source: 
 AGHT+IE2wrX16Gd9r87d7r5ei0oq1G2ppg6vlpwEiVioalK8RSkBhOZ14YzpapLDxGwN6EbpHHSRBg==
X-Received: by 2002:a05:6512:ac7:b0:500:7cab:efc3 with SMTP id
 n7-20020a0565120ac700b005007cabefc3mr9077071lfu.11.1693829673359;
        Mon, 04 Sep 2023 05:14:33 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl.
 [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id
 r2-20020aa7c142000000b00522828d438csm5789637edp.7.2023.09.04.05.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 05:14:32 -0700 (PDT)
Message-ID: <a3ada071-4c8e-f65d-ad75-655370ba2c55@linaro.org>
Date: Mon, 4 Sep 2023 14:14:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH V1 1/3] ASoC: dt-bindings: Add schema for "awinic,aw87390"
Content-Language: en-US
To: wangweidong.a@awinic.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 perex@perex.cz, tiwai@suse.com, rf@opensource.cirrus.com,
 herve.codina@bootlin.com, shumingf@realtek.com, rdunlap@infradead.org,
 13916275206@139.com, ryans.lee@analog.com, linus.walleij@linaro.org,
 ckeepax@opensource.cirrus.com, yijiangtao@awinic.com, liweilei@awinic.com,
 colin.i.king@gmail.com, trix@redhat.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: zhangjianming@awinic.com
References: <20230904114621.4457-1-wangweidong.a@awinic.com>
 <20230904114621.4457-2-wangweidong.a@awinic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230904114621.4457-2-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DOSHIRMHXA2FGCCYGGPVXSE344G52BDX
X-Message-ID-Hash: DOSHIRMHXA2FGCCYGGPVXSE344G52BDX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DOSHIRMHXA2FGCCYGGPVXSE344G52BDX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 04/09/2023 13:46, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> Add a DT schema for describing awinic aw87390 audio amplifiers.
> They are controlled using I2C.

Thank you for your patch. There is something to discuss/improve.


> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: awinic,aw87390
> +
> +  reg:
> +    maxItems: 1

No reset-gpios? Shouldn't this be just merged with awinic,aw88395 bindings?

Missing sound-dai-cells (const: 0 or 1)

> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        audio-codec@58 {
> +            compatible = "awinic,aw87390";
> +            reg = <0x58>;

Please add sound-dai-cells for the example to be complete.

Best regards,
Krzysztof

