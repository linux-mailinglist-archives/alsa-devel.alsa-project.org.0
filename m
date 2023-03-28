Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BFF6CBD9F
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 13:29:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 631251F1;
	Tue, 28 Mar 2023 13:28:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 631251F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680002987;
	bh=/K6STWaIy6e9OcvNUsE7Tp59SAyabDOw3Eioo3vEpd8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rZ25mGp3eYe5O7NmCqL9cRf4gJrtOEkEQmNGElLPVI5l9ZK1v8ylkEBXBaRywWVX/
	 tai6Rs1i8gQ7U5YxqW9qS7Tu2Q9PVpp07ML6T04+1bryVazYfwTOoJ92Hqtp5vPdCM
	 N02EzyvfUNArmMtueswc7yCkMPfXvcDia2FB6JEg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE14BF8021D;
	Tue, 28 Mar 2023 13:28:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07426F80272; Tue, 28 Mar 2023 13:28:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BB7E2F80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 13:28:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB7E2F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=MJ6suSzJ
Received: by mail-ed1-x529.google.com with SMTP id eh3so48141383edb.11
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Mar 2023 04:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680002924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/K6STWaIy6e9OcvNUsE7Tp59SAyabDOw3Eioo3vEpd8=;
        b=MJ6suSzJkIE5lVSpdd5PYU9nw590FqVu/bRl9O2HgkCUK13jwfAEQH+DtbGLGiFTr7
         CL5mMOgARauu9o5txDQeZZieTj9yBbHXIpjffZjiYtraTJEIMol+3QzmvcWCZo0W3Fju
         sPW/N5HdAyZw+Lyi1N4RZH/j45NyYq76EyculrB5ScL6V3ySYG2ZqGpvlnkDtgslgEAg
         Q1B3GpRyhUT3bPgg+L6Q/VTNeV7+pfXavInSfXwzze7wo5+5FMyDtiCOSFcy+lcUvNNV
         LjZ21bhhMcTdIpDSqCXFeJ2KNOVGhV3SOMcpRl5i5ga3L1v6xLpsfdodDSdbhau+Yzsq
         eZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680002924;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/K6STWaIy6e9OcvNUsE7Tp59SAyabDOw3Eioo3vEpd8=;
        b=l5OU0i2EWkPD4K9jefB+rQnV93xnLHRGN5qHio2PNpbBUqSv46bcOj++bSU9i6yIhr
         FgyeWPkdc4LwcSoHMEJ0unlpns3CG9+rUJMC6xYh7PSUvkPiKDWAfpMmwADC1SC3EGMQ
         fC0jAwW2/Qa+kepnIVBnCBsrqXfaVwEO7Gr52ilBEH+3DkfDvIWG2H1GULt1N8JPfZNc
         9/XicN4CuPU6u/cPWSBIxL1jwSfy6iBdxSO8mkWRTcGQuyRDpmb52BNJxSuwOafvBnTF
         4JSrl8iC5OjQUX7tDpAmv78AgFatzc8An1hA5cpzBMyOCmmmn+mOZgWpai4oL357OEnb
         sr3g==
X-Gm-Message-State: AAQBX9ek4YzMCEihKd200e83WNOk+0lXk+2+8C8bQYENgEk3QBWBAzqt
	gq9hbuAkm2BA+DkysWy8Uzt8pg==
X-Google-Smtp-Source: 
 AKy350aF1uD63+KyoOOABrSL5pAVC5SEKbBo+DgMgt0bGMg5O+uHWfR69bAIpA3bzfvfv7FZxs8EMw==
X-Received: by 2002:a17:907:6d27:b0:932:cfbc:7613 with SMTP id
 sa39-20020a1709076d2700b00932cfbc7613mr18504573ejc.24.1680002924141;
        Tue, 28 Mar 2023 04:28:44 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6?
 ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id
 x16-20020a170906b09000b00938041aef83sm11039329ejy.169.2023.03.28.04.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 04:28:43 -0700 (PDT)
Message-ID: <3b51cb0e-4e6e-d458-a393-15067948b0db@linaro.org>
Date: Tue, 28 Mar 2023 13:28:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: dt-bindings: maxim,max9867: fix example
Content-Language: en-US
To: Richard Leitner <richard.leitner@linux.dev>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ladislav Michl <ladis@linux-mips.org>
References: <20230328-max9867_dt_example_fix-v1-1-cdf31c3fdfc8@linux.dev>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230328-max9867_dt_example_fix-v1-1-cdf31c3fdfc8@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WJE6YDVE3IUHRZ36SYD7V5LMCW4Z35BI
X-Message-ID-Hash: WJE6YDVE3IUHRZ36SYD7V5LMCW4Z35BI
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WJE6YDVE3IUHRZ36SYD7V5LMCW4Z35BI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/03/2023 13:25, Richard Leitner wrote:
> Remove the common clock node from the example as suggested by
> Krzysztof Kozlowski in [1].

... because it is redundant in s codec binding example.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

