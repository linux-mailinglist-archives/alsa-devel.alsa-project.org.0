Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E6D7B9B5E
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 09:28:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 041FAE74;
	Thu,  5 Oct 2023 09:27:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 041FAE74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696490918;
	bh=MCDHXf1PAu+rSsnNngdoI9qtkWujFGa6u+gC2oSddf0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=oU9kpaGXelPCA/vjdQBiDQY8pmh5yYVrTtQc5sPa1oHFKk9JVJFQDYIgCnXyOMj1w
	 TIIjOpRBO87a68syPuohpOx8qBBzWvX0TyR6b4YDx6vBEmyIeMGRefo/KznzEuMRav
	 K9GKyPVnyxb2Ms5G5zVKrQ5kDO1yegp9y5PpR4ik=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0557F8055B; Thu,  5 Oct 2023 09:27:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F162F8055A;
	Thu,  5 Oct 2023 09:27:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46B0CF8055B; Thu,  5 Oct 2023 09:27:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F65AF8047D
	for <alsa-devel@alsa-project.org>; Thu,  5 Oct 2023 09:27:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F65AF8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=rgoRwU9w
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5344d996bedso1030592a12.3
        for <alsa-devel@alsa-project.org>;
 Thu, 05 Oct 2023 00:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696490826; x=1697095626;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5SrzplvVlseH8yy0u9HJkWONhb3rVNqc0m2X466+msY=;
        b=rgoRwU9wFPkNXBEqmbelGK2jD7NytBKs+bFBdgSwTwiJMX7+KYsIsAxhBpLFFD6xj9
         TCD8sf3WGGEM5uNQxT6DxqEcAAscKXDBA77NhiI6qZ4cFp9VzdBBHkg2yLO69+R4JveX
         HCzKyvi7XImp0+8uKre7OsuzqOHZxtLgKY2lRy/s5zl6ebupXiLBAT0KAk2I9GAG1/+c
         6N5bQKIRmTHUTLadQ5tJlMVkKXfBQoyTN+DoJvfnr4uaS0pRQXErxRzxzK7fNb8saXYV
         UiZ/n/4jfX3vAWDxv6O/2B0KBK2Mv7lPfmKYDutjBN5Ririsiw4Al19sOogR+ekGNNeA
         Hwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696490826; x=1697095626;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5SrzplvVlseH8yy0u9HJkWONhb3rVNqc0m2X466+msY=;
        b=n/gGSHj676d2YAHgLKK77KEWI5COYYh/mR2tjJsJjmbTd2v4rwZ3GSUmd3urTp+kum
         tk8i028pfXfd1VAH8ihPYPEVoB/cn9YyKopqVco7nV3BWAOqZFweQ5CDqtrn+TyiDltP
         LDs2LN1Q7uIMbejzH07zEvq3eUAngJbwRNIfaas3rFaf5o1sEnG2g7JnloXFhk5uR90v
         SP24VaL7+ruhtiHzpnjO3fQt9G4OUnjj5H4yMmYdNnq2UYcXo7CIwNJeWKeRhC4RS+/k
         tZzrwYNgLymhIKr2xCZGXqqp/Valu8wJlttXwP4yRMxm4TtbPf0rBUAvn5MVqzrh6wZ9
         ohww==
X-Gm-Message-State: AOJu0YyTLtiojBbfvs+8HAa0fNKZAxeR7GJ8PRuow7wYUIYfaMZwmdeI
	snUSI1+Hl/4wZMgzdsJK6k/X0P3NnHamLvrJHzd8Fw==
X-Google-Smtp-Source: 
 AGHT+IEAt2qJb+jrN4dW4OOChrFrkXUoDnpak2JaBtAGUxEC6HObmc2VY9PwRk4/Rrw4iL0oCb2dCA==
X-Received: by 2002:a17:906:23e9:b0:9b2:c583:cd71 with SMTP id
 j9-20020a17090623e900b009b2c583cd71mr3984453ejg.50.1696490826286;
        Thu, 05 Oct 2023 00:27:06 -0700 (PDT)
Received: from [192.168.1.197] (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id
 l17-20020a170906415100b009ad87fd4e65sm684142ejk.108.2023.10.05.00.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 00:27:05 -0700 (PDT)
Message-ID: <688c0678-fad8-490a-9f1e-bb0caffee129@linaro.org>
Date: Thu, 5 Oct 2023 09:27:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: qcom: reduce number of binding headers includes
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20231004163030.670039-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231004163030.670039-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5YOGCX6MZEDNV5K6YVVSMCULDXS4SWVU
X-Message-ID-Hash: 5YOGCX6MZEDNV5K6YVVSMCULDXS4SWVU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5YOGCX6MZEDNV5K6YVVSMCULDXS4SWVU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 04/10/2023 18:30, Krzysztof Kozlowski wrote:
> Move the includes of binding headers from Qualcomm SoC sound drivers
> headers to unit files actually using these bindings.  This reduces the
> amount of work for C preprocessor and makes usage of bindings easier to
> follow.  No impact expected on final binaries.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/qcom/apq8016_sbc.c            | 1 +
>  sound/soc/qcom/common.c                 | 2 +-
>  sound/soc/qcom/lpass-cdc-dma.c          | 1 +
>  sound/soc/qcom/lpass-cpu.c              | 1 +
>  sound/soc/qcom/lpass-platform.c         | 1 +
>  sound/soc/qcom/lpass.h                  | 1 -
>  sound/soc/qcom/qdsp6/q6afe-clocks.c     | 1 +
>  sound/soc/qcom/qdsp6/q6afe-dai.c        | 1 +
>  sound/soc/qcom/qdsp6/q6afe.c            | 1 +
>  sound/soc/qcom/qdsp6/q6afe.h            | 2 --
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 1 +
>  sound/soc/qcom/qdsp6/q6apm.h            | 1 -
>  sound/soc/qcom/qdsp6/q6asm-dai.c        | 1 +
>  sound/soc/qcom/qdsp6/q6asm.c            | 1 +
>  sound/soc/qcom/qdsp6/q6asm.h            | 1 -
>  sound/soc/qcom/qdsp6/q6prm-clocks.c     | 2 +-
>  sound/soc/qcom/qdsp6/q6routing.c        | 2 ++
>  sound/soc/qcom/sc7180.c                 | 2 +-
>  sound/soc/qcom/sc7280.c                 | 2 ++
>  sound/soc/qcom/sc8280xp.c               | 1 +
>  sound/soc/qcom/sdm845.c                 | 1 +
>  sound/soc/qcom/sdw.c                    | 2 +-
>  sound/soc/qcom/sm8250.c                 | 1 +

I missed few cases of header dependencies, as pointed out by kbuild. I
will send v2.

Best regards,
Krzysztof

