Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C27C7A62F8
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 14:30:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15163A4E;
	Tue, 19 Sep 2023 14:29:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15163A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695126645;
	bh=JAQd5xScPJxGhip2+D+AZ1GbvltqnfsheXJ/ZDeh/Sc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ao3ewn6hUAgqxjK055WKELvZyFvOZsSh65b2Gf6WS3Hq62KNiN024gRSbpydkUtj2
	 oAME1g2EzG7599jCTh78edcp8oWSq6zZ2VfHyxt0E/024IlFOfAWUuPRqcw7TbB0r2
	 4wqAIkO8cxgk+2Fd6arESM9cEwRHH6s5npVFnlbc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82D1DF800F4; Tue, 19 Sep 2023 14:29:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45913F801F5;
	Tue, 19 Sep 2023 14:29:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5604CF8025A; Tue, 19 Sep 2023 14:29:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 904AFF800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 14:29:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 904AFF800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=uztbKT23
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9ad8bf9bfabso739421666b.3
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Sep 2023 05:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695126579; x=1695731379;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8EtiuNXgnIZXl6uZ3s+na9fQCFST8PiCnTLp3+2BYCE=;
        b=uztbKT23U2KCZxDE8g4/MOYd5RROpziBDKOE67O1MZoKmWEkyE+Ihk8oA3Pw+bZ4r9
         DGDXTrT8rgXkouZep7xG1kj9Hsjwu6PNWsNZIK2OUtnEmHoh6tqmgBD7PPz9M5qfTTGm
         skwr8xke5mCX1dBzgeF7S6PS0oMh3mp4dG8hL9wk93uXh0S+evPRkzmBBCDj2zcappMj
         PsRvnLXgGpX/ikz5fySAuR4b4yYh7ka0xQz7CqslOSdN0jLIPJt3ahRiDxGjo97i1krB
         byAn8YakwRYPTXkc8d6bX/K00IT/HyIINT5T+2xoMCmfgniBtCNKhlFR3xHvAy5dgE5G
         Njug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695126579; x=1695731379;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8EtiuNXgnIZXl6uZ3s+na9fQCFST8PiCnTLp3+2BYCE=;
        b=e/qBx6IgBM3UGrVzOOMS1A7b7gy4SDC2jKozu1F9+6L7Ek7PLaj/9MRz8JU4QQHZgx
         fEooIUBvmjK77SO4KgE3gw7v8ogAx5g+oURPHL2S5URy+WZhFQ1kugL0zEY/n5WiHGxc
         qdJ8EnhjUwm92ULYohv1VllPhPQUGb92k+Zn28U7IyZDsTn6xtY+TU6ZbCK44GHxPOdO
         kid3jjHQKe1CSeub5p5uSc/twWcKQLpzQChA3avkHiTYTzoKhTq/pLqR7z2Ck4xAp7PE
         bWkfWGBxkXbmyZy0vbdn+wg/2D0LgmHIcGbST0ypHJ/41DwQRAkFP9vGbBZts510wUhg
         wBtA==
X-Gm-Message-State: AOJu0YzVqlBQ9be0IcUXqzZwyp14xPjyNltDlwlQl+hSsOV/sBbcYTm/
	5C0XUrkQ1o/EWjOsFdawESNfZw==
X-Google-Smtp-Source: 
 AGHT+IHHeTZchplaQKxq8oPK/RMzsBnOVPhOn2auV6wN1oA1mFfnJtCuhxn4/gkedGhA7WnuWYoR+w==
X-Received: by 2002:a17:907:b0c:b0:9ad:a46c:2936 with SMTP id
 h12-20020a1709070b0c00b009ada46c2936mr10566454ejl.8.1695126578936;
        Tue, 19 Sep 2023 05:29:38 -0700 (PDT)
Received: from [172.20.24.238] (static-212-193-78-212.thenetworkfactory.nl.
 [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id
 br20-20020a170906d15400b0098669cc16b2sm7677155ejb.83.2023.09.19.05.29.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Sep 2023 05:29:38 -0700 (PDT)
Message-ID: <1fd6fb74-40be-13e3-8a96-f4db358582d1@linaro.org>
Date: Tue, 19 Sep 2023 14:29:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: Add Richtek rtq9128 audio
 amplifier
To: cy_huang@richtek.com, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Allen Lin <allen_lin@richtek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1695086301-10376-1-git-send-email-cy_huang@richtek.com>
 <1695086301-10376-2-git-send-email-cy_huang@richtek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1695086301-10376-2-git-send-email-cy_huang@richtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WNR4NVUARGDH2FPI3FA42RUZ23WSBM3O
X-Message-ID-Hash: WNR4NVUARGDH2FPI3FA42RUZ23WSBM3O
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WNR4NVUARGDH2FPI3FA42RUZ23WSBM3O/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19/09/2023 03:18, cy_huang@richtek.com wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Create richtek,rtq9128.yaml for rtq9128 amplifier.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


---

This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

Best regards,
Krzysztof

