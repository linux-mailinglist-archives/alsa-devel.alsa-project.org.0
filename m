Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAF86DE203
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 19:12:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FD28EF4;
	Tue, 11 Apr 2023 19:11:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FD28EF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681233139;
	bh=JzoVnbx8tLn5feqXortZjuu/9XvFQA8pGKKHatA/Zig=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eX1YBVfVvY2Za5GsnCUDZT+TgSOrOcbh6ZAQel7kB0vuDLv0Op12ASsus5aNZ24Hg
	 0aX8nYcvSS+Ih322gxMPIUJ/L8ixNxsac6q0GP0/1JwEGakJsiaZQLyOP+v9i6pa6p
	 3bK30ukCfqB4S11bOMbyGIPQf9Uo0PFwLu5KKiiM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 119E4F8025E;
	Tue, 11 Apr 2023 19:11:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8481F8032B; Tue, 11 Apr 2023 19:11:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D3B8F80149
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 19:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D3B8F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dFhJFjoA
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-94a34a0b531so212891166b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 11 Apr 2023 10:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681233079;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pWF1p5GA25OvC5IkhaNGaOg//cQPDFhqXYPwtZg5x8g=;
        b=dFhJFjoAyK5R5qUYgh0yy2kGnzMaXC2N0bUaD6ds2jGWr+eg21x5h5Y59+bii68GE/
         O9OXZ1lQnbZX0L9zcVcK68nwXmOBGw7buRRy33ISHJLAuEGTS2nLR1zMzuwp3zmkdtdy
         YyvHndm7VOLKCNjvlHGUXML5nG5b5Mhp0zotXMfgsTU/+go3Stzmayvk1FaopSuByQqL
         587TWv3Z5f0LAHsG1rjGcMkqZzYE7zwR2Powj9lwx/wzmD6d7HivHFZ0RvAxu9usT4Ke
         LUUgzQ3wRAFcgom89mshhLwvHZlZ2KVcium/5sR8t6G9+gXC5f7YtmhjL4kmEjYfkwqm
         /aQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681233079;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pWF1p5GA25OvC5IkhaNGaOg//cQPDFhqXYPwtZg5x8g=;
        b=3WBiJDaJNkkXQnFlrju7q0MOtwA6v6xqq1iNovTgytp3M5w1wnGxfDv+XGBUJbVXwX
         p/dvL+B5GSJ9r2EaAv09JylMr6bJaJsxCroV4eVh0qCD9BT90y6Oren4zcxzzBJaa/iu
         tXeOLYBWApXjWrhzup/1krnuqDuTOJFdbQuczg/L0WEY9H3NKhBNtWSV0v0DaKNbCkJ0
         TFRjyiz9G3Z+17BI86cGDcWFI7biDpeaCcmWMsf1qNXKYewPLKKfxHK9eNcosS7l5mrM
         qr2m1NT4akAMyNAcRhmKAuGLOuTkIyN40G5Wsvf84hx8+wd9HclJVt8oqEczZ1Fi2oqt
         jpcg==
X-Gm-Message-State: AAQBX9fyuyTjwX2hIkaMdG+WSyRt1JnwJHweBlMtAnQkZMK9NQFSUo31
	uAFoXHqxa5/kgjZMPtKydO04sw==
X-Google-Smtp-Source: 
 AKy350a8G75tLqrttqnXqD68zKhR4Bwu9CYLqf4N5npE1a25zQI5U9DFgT07MGKm1HXMLPmOpUvkXg==
X-Received: by 2002:aa7:c59a:0:b0:504:bba1:de8b with SMTP id
 g26-20020aa7c59a000000b00504bba1de8bmr3464462edq.19.1681233079521;
        Tue, 11 Apr 2023 10:11:19 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f1da:c117:3657:c8a?
 ([2a02:810d:15c0:828:f1da:c117:3657:c8a])
        by smtp.gmail.com with ESMTPSA id
 k6-20020a50cb86000000b00501d73cfc86sm5820199edi.9.2023.04.11.10.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 10:11:18 -0700 (PDT)
Message-ID: <9a7b8fda-9a6a-59e3-3173-1d173b34825a@linaro.org>
Date: Tue, 11 Apr 2023 19:11:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 1/2] dt-bindings: sound: ep93xx: Add I2S description
Content-Language: en-US
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 devicetree@vger.kernel.org
References: <20230411165951.2335899-1-alexander.sverdlin@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230411165951.2335899-1-alexander.sverdlin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DEIRIGU7EIQA2PMVB7REIRGHAYUJJQT3
X-Message-ID-Hash: DEIRIGU7EIQA2PMVB7REIRGHAYUJJQT3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DEIRIGU7EIQA2PMVB7REIRGHAYUJJQT3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/04/2023 18:59, Alexander Sverdlin wrote:
> Add device tree bindings for Cirrus Logic EP93xx internal SoCs' I2S
> controller.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> Changelog:
> v3:
> - rebased onto
>  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> v2:
>  - Incorporated most of the suggestions from Krzysztof Kozlowski [1]
>  - Dropped AC97 (deleted from the tree)
> 

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

