Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B4A69B943
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Feb 2023 11:13:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EFE3F46;
	Sat, 18 Feb 2023 11:12:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EFE3F46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676715212;
	bh=AVvN82ZW7zUg4dsHWRFIaK2sTLKl5MFZrnW6f3yqvyQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kcGPvH1KCpLc6ShpGULVJjpN/a9rb3uI2mVtATPI4rpqx4lBVg29e4kgxaoxVZ+gc
	 Omiyp6cJax3xjNAVCPPopXIvrrepJuEM89/iW2gxqWCXiE2V98m0EmQx9AhIB9hRSm
	 k+ybdD3W4Lyq5opy+/tIkxu55JuammVtT6S26MhU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19A69F800E4;
	Sat, 18 Feb 2023 11:12:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 220FCF80171; Sat, 18 Feb 2023 11:11:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E41E5F800E3
	for <alsa-devel@alsa-project.org>; Sat, 18 Feb 2023 11:11:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E41E5F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=GV1pVXEH
Received: by mail-ed1-x532.google.com with SMTP id i28so1132600eda.8
        for <alsa-devel@alsa-project.org>;
 Sat, 18 Feb 2023 02:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dTrZlM/1j34PmNemq7d5HYpo1rmgNzw7BezUEBROqsY=;
        b=GV1pVXEHTU3KwzBKiZmlxiL54Wv26ipKjZ7O0pei0QV8W/TvzR5zSbbvM8TQzq6p+9
         uo+R/o+KLvFeygL4CC8eLWB2Y6wKqfzg6mdHaAYMsF3Y78+MBJiwae8qos+Iz+U5ReTw
         i0hqLEngqwYwvnrpgipCN/g3VsT0Ocbb6aaFqMwICxo7oOq+TgkWVWvRXaueMSSmWQtm
         XCgbjdkXPQkmPx0/bdblYUi3AyobQ6gfRoPFEy12lTJr4HKOg0iKyHI1tvBtVduSulYM
         Tf2FLhyxnmgjU9X5dIX8RXeMLtxudEt/Ou/JqO2vs0LECEt9+faLxnJKjmlPXc0R7WP9
         fdgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dTrZlM/1j34PmNemq7d5HYpo1rmgNzw7BezUEBROqsY=;
        b=jOzj2cmJajZsFyphiJFlcnExOpARJp1Ef12hUrf0xTm4pzbSz2Sh/vKzLKSmtcFy2j
         BWiVmWqu3OH9bFauw+fPTHVvHeeNdKqmxhGJ447IThXBLXOPvh/47RO29ONLroOmBJ3h
         Q6UMwVlDXzn9uewWnssmmfcsnrn8TY6N+weZk4Qkb1FWsqaZZgOLx3Xiii/lXdLYmvrn
         CcO1sBO7urkuhgJWo6WvynOuZJqpbae1YLqyv7GAKme/lvt2JDm0hdPImvIeNBMCnV3D
         /4mViqpBAO4y8nH2NdZpGCH68kuLnndx4g6jMUYmpAkEpPS7nfJZoQVT0L8GhTfovVZS
         Teeg==
X-Gm-Message-State: AO0yUKVHxWuQRvYvIjbHunOGjwiisxU7eOLo0xHrNqhRcYdxHhNtVyMy
	WKjnheczun+pNjZMitjgWyZfew==
X-Google-Smtp-Source: 
 AK7set9DV1fZtUekvagyuUQrTVveo/fbiaq0+hMrloLoKRYw7+NmcQbHmPPzdZcK10xee5YHOtLL9A==
X-Received: by 2002:a17:906:5a42:b0:8b1:7ac6:3186 with SMTP id
 my2-20020a1709065a4200b008b17ac63186mr6106770ejc.68.1676715097203;
        Sat, 18 Feb 2023 02:11:37 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 sa14-20020a170906edae00b008b176df2899sm2638876ejb.160.2023.02.18.02.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 02:11:36 -0800 (PST)
Message-ID: <0771a2db-53b8-20c0-eb28-f254f2eb6b25@linaro.org>
Date: Sat, 18 Feb 2023 11:11:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: renesas,rz-ssi: Update interrupts
 and interrupt-names properties
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20230217185225.43310-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230217185225.43310-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230217185225.43310-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JYHRV3PYV2FZN3B2PEHDDG2CD2LVNBOP
X-Message-ID-Hash: JYHRV3PYV2FZN3B2PEHDDG2CD2LVNBOP
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JYHRV3PYV2FZN3B2PEHDDG2CD2LVNBOP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17/02/2023 19:52, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> From R01UH0914EJ0120 Rev.1.20 HW manual, for full duplex channels
> (SSI0/1/3) dma_rt interrupt has now being marked as reserved and similarly
> for half duplex channel (SSI2) dma_rx and dma_tx interrupts have now being
> marked as reserved (this applies to RZ/G2L and alike SoC's). This patch
> updates the binding doc to match the same.

Do not use "This commit/patch".
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

