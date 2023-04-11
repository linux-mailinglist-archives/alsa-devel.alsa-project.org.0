Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EDE6DD1EE
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 07:42:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 706B2F6C;
	Tue, 11 Apr 2023 07:41:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 706B2F6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681191736;
	bh=EalEXuyum1URrX7KRo4oMLBXqz7aDoQJ4tp3oFfYp44=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NA9/ST4ACClik+EB9d7O0JP57PB7silgBBpQQp5V7e3n6BZ61kEjdq+hfbqXKsdLe
	 muBMolpIsuUEJ+CnpAIoQPZo4lqc/3m3xcp7gbt5TAQKhqMjWZ7+heoVt9/rzuX39o
	 X3Ze0iuvEqd16GJzX1OE17o8xa96k1g4l1f1Xa0k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF97EF8025E;
	Tue, 11 Apr 2023 07:41:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5393F8032B; Tue, 11 Apr 2023 07:39:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B298F80100
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 07:39:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B298F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=SQ0HcQxa
Received: by mail-ej1-x636.google.com with SMTP id f26so11301086ejb.1
        for <alsa-devel@alsa-project.org>;
 Mon, 10 Apr 2023 22:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681191585;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CoUp8773GFsWX8uWiArPvI14C/ql8uh0ic9aHuPd7Zk=;
        b=SQ0HcQxaYhVaPHJU7/Fddz5xSruENq8SIZdWF2hDnv6HCXdQGfcgCsgrZJa2z0hZEc
         wfKaOclUEBMXsWyQY7M+C73Olwkv/Vqn6sr+Hp6bMEZMwl0S5ipnPHtKdp11/iUAmol9
         JXubvATbAYG5toZNgHNu7fUYa3bllf+T3tIu9K486PiVzxAdhy/wo2IulinkybjPPrXd
         wtB9laoY8xPAlIL4vtcYc9WLnGj0gsvTXPZq0IbF66AxDbj2Df9Hbrkk7r5l1Ex7wYPe
         foGOcjvqwCLXUbkzNDLeogyIPOaN76VuAKp++SP7+nppcX1fz3RM3D2qMlk/WP8c0IpV
         2WFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681191585;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CoUp8773GFsWX8uWiArPvI14C/ql8uh0ic9aHuPd7Zk=;
        b=7PgXARkb7Wp0sSJFIVfxDD+W3ghlxrAtSCSOCa6r/n3OZn4QPaGmYo/x9349sBZyIO
         LPxNSMy3iDyEKYnODsXcMuj5W2XX0iQFJ3vTQNdXCXUz5E2pbRfWQ98NG1v9IoLZI7Zh
         qEq8F3IazEKQIBUXKsdu6HzWMZlbMGfFc/EkWqjPx2maGn4cUdrEse6XsBlA+JaBlcfi
         gqZNSIRsdLJ7XsJFV8TXyf5V9iCufG1HeiWJvqNGC3X6Dgqdo5efzK3pBUIXA9ONAXEj
         ShoUya9UAploXYgSvnkVHVVX3G8wZVryHYZMdGFJSoxWAhLtUfpYh/FW4onLpYIk8r47
         NBzw==
X-Gm-Message-State: AAQBX9eB+u1LIW/pvYCkfvBCG8HabHKy853SxjSLbVJod4tOId8NsCns
	lTMUFy9X0YFu92ReQe9MoRqaBA==
X-Google-Smtp-Source: 
 AKy350blMDeEpPqsWV8AahVbXa/XkySm179RRsqGLVKVGNELXAp3iuvjbp3/OoHwZHpcCTy2iLaaJw==
X-Received: by 2002:a17:907:2ced:b0:8ee:babc:d40b with SMTP id
 hz13-20020a1709072ced00b008eebabcd40bmr8342951ejc.58.1681191585694;
        Mon, 10 Apr 2023 22:39:45 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:dad2:72b7:3626:af61?
 ([2a02:810d:15c0:828:dad2:72b7:3626:af61])
        by smtp.gmail.com with ESMTPSA id
 tg12-20020a1709078dcc00b0094a473988b9sm2943049ejc.27.2023.04.10.22.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 22:39:45 -0700 (PDT)
Message-ID: <a6f78d8a-829a-a40e-0fc4-83eb9887b406@linaro.org>
Date: Tue, 11 Apr 2023 07:39:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: ep93xx: Add I2S description
Content-Language: en-US
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 devicetree@vger.kernel.org
References: <20230410222958.2321398-1-alexander.sverdlin@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230410222958.2321398-1-alexander.sverdlin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OONNQI47FHAJ7Q5CMZRVRAQOCDQXGUQX
X-Message-ID-Hash: OONNQI47FHAJ7Q5CMZRVRAQOCDQXGUQX
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Hartley Sweeten <hsweeten@visionengravers.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Nikita Shubin <nikita.shubin@maquefel.me>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OONNQI47FHAJ7Q5CMZRVRAQOCDQXGUQX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/04/2023 00:29, Alexander Sverdlin wrote:
> Add device tree bindings for Cirrus Logic EP93xx internal SoCs' I2S
> controller.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> Changelog:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

