Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B949D78CB75
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 19:41:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C08D208;
	Tue, 29 Aug 2023 19:41:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C08D208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693330914;
	bh=5CmZURah62xRKI3HbDc/NBVIbs/RTWLSSMboJ9SAYOs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QylyZ4C+9X3A/nnNGJZMW46eHH3e/+OQxnjPNIIBKWac2UZNQ8SvYvjXmQNql+3vA
	 FAP+vWMmM2KaQk93xgDaewvUde44WaHcYRJsWzEm3ZSeXvmKmSzzSppMcaG8cE7uO+
	 OsZwixdPf0mkWsvqCAauOH6D34j6TFpvP2C+i1IU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 025D2F800D1; Tue, 29 Aug 2023 19:41:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AFA6F80155;
	Tue, 29 Aug 2023 19:41:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B4D4F80158; Tue, 29 Aug 2023 19:40:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C0ADF800F5
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C0ADF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KmEE7T5s
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-99bfcf4c814so611269066b.0
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693330850; x=1693935650;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2YNG7LD4K4KMxQp5UZSaL2MeLl8EFjm+UQ/TTjynihU=;
        b=KmEE7T5sialkQHA7uBm2PpWGs/ZGGqTq02s3Yw33ntN7nH7hF0rgTi6bhJcVRe0gUe
         n+7sXgY6R0X4sM3t9RrhSbtnj1wj7FIQhMmE+9XbqiOINprzleLlQnHZZBesnITHn/JB
         pvbJMvr+iOoS1qtKvP5amQio1ol8/VZSIUFHmJha+u/9YBBRjtawNb1iBqmCZTAI9U+6
         /EGo39TLk1NruxXYkr9na91s/mrhZkDa+aQcVrmEyH+0M/gX2m6YCGUWPJwRwuTNSud8
         Bh8WoteBLNLZbk9XMXJiCy0flgPIvNhFeKY9LCrheun1P9+mVwI9w0rCyGS3G9dzmVcQ
         dW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693330850; x=1693935650;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2YNG7LD4K4KMxQp5UZSaL2MeLl8EFjm+UQ/TTjynihU=;
        b=YsbGPaiZ1E3ZOuC3LmvpjFK+AXH+GnqSjN2sUZ5+VE0K0edDIdxuE2aZEqNqLR7gXO
         N82eAP4OewwkGkerXdn8Wx8jPzEh45eVJhZM7dbKeqVxNt+4lqcW1T6doKl4YGyWWDb5
         JlbXZ7K4jPJNahn0wWqCn/iw3UCkpXqPNIdQZAGQXqECgEeye2BwwBu1ifZDjUJIHJxj
         lFSV2BnZpma6h1L6D44XGmqXhTiVj0oq+2YbbwC2ePNneRBMrHZ03G68/jvfImcpwhnr
         caA8OlN7ZoPxDjJA85hbuCZhF2MK4MkqgSOVC/0/EIzbhocYSLYRKqIYVpE813rPrkbG
         Nbkw==
X-Gm-Message-State: AOJu0YxIkoK/2IVPEzcOBcCffBUuwiTXCje+yuwUcj7YN6P0/rtdegbr
	DBW5rjKt2O/MefjIL+0hd3YHog==
X-Google-Smtp-Source: 
 AGHT+IEitwmwVk9+KoKIBEHpiME/Abb3aHzRC9tehqbQ93vUndcYPbpMcUZcdG971B60lRyMIL5+mA==
X-Received: by 2002:a17:906:256:b0:9a1:cccb:5429 with SMTP id
 22-20020a170906025600b009a1cccb5429mr17132480ejl.15.1693330849791;
        Tue, 29 Aug 2023 10:40:49 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id
 f17-20020a17090624d100b0099cb0a7098dsm6285502ejb.19.2023.08.29.10.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 10:40:49 -0700 (PDT)
Message-ID: <dc2f32d3-001c-746f-6dc5-58a2a6a4a8e6@linaro.org>
Date: Tue, 29 Aug 2023 19:40:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 05/31] clk: rockchip: rk3128: Fix aclk_peri_src parent
Content-Language: en-US
To: Alex Bee <knaerzche@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Elaine Zhang <zhangqing@rock-chips.com>, Johan Jonker
 <jbx6244@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 alsa-devel@alsa-project.org, linux-clk@vger.kernel.org,
 linux-phy@lists.infradead.org, Finley Xiao <finley.xiao@rock-chips.com>
References: <20230829171647.187787-1-knaerzche@gmail.com>
 <20230829171647.187787-6-knaerzche@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829171647.187787-6-knaerzche@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GHWD5JRT7QV255ODGHHIKSLMSC6SR2KW
X-Message-ID-Hash: GHWD5JRT7QV255ODGHHIKSLMSC6SR2KW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GHWD5JRT7QV255ODGHHIKSLMSC6SR2KW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29/08/2023 19:16, Alex Bee wrote:
> From: Finley Xiao <finley.xiao@rock-chips.com>
> 
> According to the TRM there are no specific cpll_peri, gpll_div2_peri or
> gpll_div3_peri gates, but a single clk_peri_src gate and the peri mux
> directly connects to the plls respectivly the pll divider clocks.
> Fix this by creating a single gated composite.
> 
> Also rename all occurrences of "aclk_peri_src*" to clk_peri_src, since it
> is the parent for both peri aclks and hclks and that also matches the
> naming in the TRM.
> 
> Fixes: f6022e88faca ("clk: rockchip: add clock controller for rk3128")
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> [renamed aclk_peri_src -> clk_peri_src and added commit message]
> Signed-off-by: Alex Bee <knaerzche@gmail.com>

Please send fixes as separate patchset. Don't mix it with other work and
definitely it should not be in the middle of the patchset.

Best regards,
Krzysztof

