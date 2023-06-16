Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30457732BEC
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 11:35:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42961825;
	Fri, 16 Jun 2023 11:34:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42961825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686908147;
	bh=/g7vkU2kV4mN4NcGOrYRIn6msLXsORkH2JuU3XiQORA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H2WEJa51kcGpl3g9gRxeJOt89RHYZO8u41wH3SGUQpCo102kcnEFWBXsIcT3P2oQq
	 GCv5nQC7Xw2V40qCiJScvK2UmhVMZ9/OM/NPXSO9UitwVqnfFmBLr3Bkm/ra7p18S/
	 dWp+1oL+bciIxsSw8pm7bHrf1zUhgGQrrwdPZVhE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90C7FF80155; Fri, 16 Jun 2023 11:34:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4201EF80132;
	Fri, 16 Jun 2023 11:34:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9F92F80149; Fri, 16 Jun 2023 11:34:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F7E2F80093
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 11:34:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F7E2F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RFbR3G/t
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51a2160a271so613836a12.1
        for <alsa-devel@alsa-project.org>;
 Fri, 16 Jun 2023 02:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686908081; x=1689500081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kZHHWviwTUp2ejqoeSZblZoLVhlAgV7AT/D/NA4zn2g=;
        b=RFbR3G/tJWjdDIhl9htsX/oE2/jyhXJPe7msrR7SD7etbtY7R5vps+2jRyEMM1cn1H
         OQGuk0DikMBzJxAtu0S8MmGnEDivWTbsbancTB2zJFM0GfeiwscwBRH7p9uCLPCu40FQ
         EjO0FALoXEE9lYAOeqxVwXnqBb5RDLpTf4ISklq6OMCokH9nrXg3zj47Nem+Nwl9VPvB
         5fYgobK51SnYWuInP1lANM2AAjqT4JK7l4UdFrmnLVsL/5CnomT1RygmZoq3EAQ/ljKL
         T4DSvmrK5hYssJ6aQoIJAHZwTbpUNLivkmzajCAZ0qrryrSJfqWWRj7XIFXCC+a36nVe
         uRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686908081; x=1689500081;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kZHHWviwTUp2ejqoeSZblZoLVhlAgV7AT/D/NA4zn2g=;
        b=Cm9BRJKcY1N89fhyta7biHGYA4VxyAhBUO8PVIIqGWIM+C6KnsK3iVIXMreddljxNt
         owtvtIggW48SLCA9GguzrzDU3xGBn76+Hf8UqlnwrTHD1Atj3+iadPghJMSWgfF8XP78
         ABvzU4j3Ms/ZlBr3NcyxeKJkNRHi8AWpaiWZ1B55eV/e0gxQsBUAFLnBSsaFyoiVH0Jj
         YKmewK8MGkl7uTdOSIMx+X/KhTCjBh4x/6KzECuXHCeFzB04gFUWefpVCxzFvleqRyad
         gIMZuU3esBh+wJH/6xuOkzFb5HIXHPhfhfYc3p2fTqw3OD61tipp7mXhvQ5RH2R9B6jT
         zfUg==
X-Gm-Message-State: AC+VfDy6/JH0aGYx6pJA3nfjPp8iZKdNYNRL0BZIZ7395VdtJx5SI1M2
	rzJJQwmhRG6H3VJrzuN5ypyh/g==
X-Google-Smtp-Source: 
 ACHHUZ4JmeiI5S5sC7B7JLCWQlF0z5JzQWoNDMiTjrVoe1w/cjglt+eqV1gOtm/XPjX2e8NGxPvknw==
X-Received: by 2002:a17:907:3ea2:b0:978:9b09:ccaf with SMTP id
 hs34-20020a1709073ea200b009789b09ccafmr1586083ejc.14.1686908080964;
        Fri, 16 Jun 2023 02:34:40 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 re6-20020a170906d8c600b00982aca1560asm1777417ejb.219.2023.06.16.02.34.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 02:34:40 -0700 (PDT)
Message-ID: <ffd57fcc-51f1-cb1f-e589-c1a42d3ceeb2@linaro.org>
Date: Fri, 16 Jun 2023 11:34:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/1] ASoC: dt-bindings: tlv320aic32x4: convert to DT
 schema format
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20230616083549.2331830-1-alexander.stein@ew.tq-group.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230616083549.2331830-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DDW3EXVIYDVRNRPGTP3IEQOZTWKATLE6
X-Message-ID-Hash: DDW3EXVIYDVRNRPGTP3IEQOZTWKATLE6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DDW3EXVIYDVRNRPGTP3IEQOZTWKATLE6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/06/2023 10:35, Alexander Stein wrote:
> Convert the binding to DT schema format.
> Since commit 514b044cba667 ("ASoC: tlv320aic32x4: Model PLL in CCF")
> clocks & clock-names = "mclk" is mandatory, it has been added to required
> properties as well. '#sound-dai-cells' is added for reference from
> simple-audio-card.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

