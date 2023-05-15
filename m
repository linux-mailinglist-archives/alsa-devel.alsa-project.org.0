Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F087031E6
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 17:52:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7B721D9;
	Mon, 15 May 2023 17:51:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7B721D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684165960;
	bh=/t+AC5UW4SMBRtQn3rrK4PszG65f7JmCyvxvAwBWE8s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uGNYmCo8hrD74khfsO+6eTKFP7XKiDwBAsr+WkQ1VZEXuL2ZE3Y1UhH4baLaNgmZT
	 hs1MQw//PlprbP57P5y4OrLTgfGsXkQuHhN8+tD41j56avtYRzY6E8U39FXWciradQ
	 Xac5iO6R19kbjNV3uzsXIMpABhbeiDQJ2qbntoc8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85690F80542; Mon, 15 May 2023 17:51:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFE8BF8025A;
	Mon, 15 May 2023 17:51:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C302F80272; Mon, 15 May 2023 17:51:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C11F2F8016D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 17:51:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C11F2F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=f5nuVdhZ
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-96b4ed40d97so151621166b.0
        for <alsa-devel@alsa-project.org>;
 Mon, 15 May 2023 08:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684165902; x=1686757902;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kdNz3qj51SwfZ+r+b09kzPJZyDa4Ig5/xBmsTKTUjEQ=;
        b=f5nuVdhZ+hRRBZQFY9CfxX4RUOG49IB73A/FZEkdPmLju2E14owoT7kHmviZf5NJ75
         mJprvxfbO2ssflDOSJ5qpTQq3SiUXn3OFrGUzRNAjH8ukkiRgsL53czi/0G+8k9nkMLM
         1DUdF4+5W9wKimMn/mY7zRT8YumgRpxSwAz/wpLnFMzdcqwQHBtz6miSr9+cK/ADoM2q
         yRcz6LejFZ0dln7w2F8Gs9ZYnKTenveUpBKYKUb1tN6h07qrl6YBoPsQzZESayTBUhKJ
         KnrQjvhVX/SHTBx6jAwfgZQOgYUb8fdF541vguWy0w62MVO1hgmaZ4OUucweuynqUI5j
         6vFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684165902; x=1686757902;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kdNz3qj51SwfZ+r+b09kzPJZyDa4Ig5/xBmsTKTUjEQ=;
        b=G+1R8wFr9b/vWQceRa4QIjQMWHRMDq6zWrimGDoRir2XB29vLMLUDAfmHZY3N3eVyz
         vYHnZknlHBuIh5yLEbz+YSuJGbqRGLvzoGpE0hdnH7i3oZCPtlHl/SBIZLu5GhQ5wbc5
         Qz6fvzcGjxQiKu7kCY7GKt3gyAg+UHr6Zqj99N/FAHEaHUVaFSDGa70fYpvDCsiaJYQ6
         D8TBPbVgQr7+F5+kZFwrdBDQF18ojqkqD/8PiUeBC/E6EdfuXBLn4W9+qJLJFlwaY3oc
         AMtCxPYVDQ+GGrIcXkf1dwKbiXEJI3I2O4WncB7wRfqWt/ijFAxJKldINKONgCUOA0ec
         968A==
X-Gm-Message-State: AC+VfDzYCWC+hm/mvmsoZPWowBMFB6RFKibJC33wxhDG/TjCMXt6l3Jv
	qs6qPWvPsdF9rnOd8K9BeVhjyw==
X-Google-Smtp-Source: 
 ACHHUZ5jN17XrGaPHyCGUhm5wC27WVRKpROAOuSRrGeFBkg1hTTaBXVX7+9yVJD+NdrVG9eG+IklPQ==
X-Received: by 2002:a17:906:da88:b0:93a:353d:e38b with SMTP id
 xh8-20020a170906da8800b0093a353de38bmr32619468ejb.37.1684165901929;
        Mon, 15 May 2023 08:51:41 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992?
 ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id
 u18-20020a170906069200b00967004187b8sm9635438ejb.36.2023.05.15.08.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 08:51:41 -0700 (PDT)
Message-ID: <a63df7fa-5bd0-97fe-5a6e-74aca1d50599@linaro.org>
Date: Mon, 15 May 2023 17:51:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] ASoC: dt-bindings: nau8824: Convert to dtschema
Content-Language: en-US
To: David Lin <CTLIN0@nuvoton.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 WTLI@nuvoton.com, SJLIN0@nuvoton.com, ctlin0.linux@gmail.com
References: <20230515065557.614125-1-CTLIN0@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230515065557.614125-1-CTLIN0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: W2GFIVLRNJB34OBYQ65JEWZKORBHXVBI
X-Message-ID-Hash: W2GFIVLRNJB34OBYQ65JEWZKORBHXVBI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W2GFIVLRNJB34OBYQ65JEWZKORBHXVBI/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15/05/2023 08:55, David Lin wrote:
> Convert the NAU8824 audio CODEC bindings to DT schema.
> 
> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
> ---
> Change:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

This is an automated instruction, just in case, because many review tags
are being ignored. If you do not know the process, here is a short
explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tools like b4 can help
here. However, there's no need to repost patches *only* to add the tags.
The upstream maintainer will do that for acks received on the version
they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

Best regards,
Krzysztof

