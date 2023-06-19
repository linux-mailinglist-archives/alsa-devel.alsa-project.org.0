Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3247D734BB5
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 08:22:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3E82839;
	Mon, 19 Jun 2023 08:21:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3E82839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687155738;
	bh=jFqEYh7znitHRqRzHKfTPeq1biqVdrdPb9sEhJgmJMw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fVaANijsRGfjfTu1/dYZZJaUzL6BXS/UcE2OwBpqFsQVNO3TM2ojjLhmpYm1q/qZs
	 ea41W+2hW+shd69EThNbIe3HuV6TObXCO/8Bk11hRfENcuwweqlkHARYeOQ44HNbkw
	 sZoeEjY1oJJp+43JmdmZ3cXMfinwCebVWBMCHlIQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59C9CF8052E; Mon, 19 Jun 2023 08:21:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 035B2F80132;
	Mon, 19 Jun 2023 08:21:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C803AF80217; Mon, 19 Jun 2023 08:21:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 932FCF800BA
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 08:21:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 932FCF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RgxwUt7+
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9875c2d949eso352820966b.0
        for <alsa-devel@alsa-project.org>;
 Sun, 18 Jun 2023 23:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687155676; x=1689747676;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XCyRXi13d15locPh0YhgRlxibJEXWHIKmgD2226akmI=;
        b=RgxwUt7+gSg/BlHKxAzEhgqIh2aBIWg49ttnDchnnGCLPsOJHyLL2QeTEsgQNlv4yU
         ZQJUn9B54m4Df/FtZwy25yiGAyWGAvu1aW/whOJ/hWvPZm5VgPMBCW7XJSPcCfu+B3wi
         IkHo5HBZq23ta2hyS5+vI6fiO+sQYLvym83IKMsUzxBKTjQ0xDKj7GV1dIMrGBo1+R8C
         Rpo9mnShBYr+F2bqF6vARBLZdbxDYDJABO5YNGpyFYxF4FEn+o6a2+3YmVvlRsrZxHYz
         wfi+0mXR0smM7AR2XpMrb5Y1DfP5QY8YQsOruDG/M9aC0qo9mVw1ha4OymsayNV88oz/
         Kk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687155676; x=1689747676;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XCyRXi13d15locPh0YhgRlxibJEXWHIKmgD2226akmI=;
        b=ewK4r5DH5Eb7KF0xPU+9Tem0edxeicyR5/IgXpGPG8aCcUFpMF+D1dK22vWxwoZoKy
         uYCJZ9hKlR0n7RwKhQKBVx6cs7Q8LTIDK6h+lfjlIlmNv6u7bjhFynoVQUeGBwMemuqY
         RAxuJH9q+B9Gq/uIML9gNh/0IBpe7Xw4w8L4TZdl1k0QBSaipl2fPu9FMOQ01NW8NqZl
         v1bXgJdynI16oiZFGH/d19JZopwgUEc7ujgtwnvW6Si87jav8wskh+Ru+Bh35+4mQSQm
         xEYwdlDtDCdPiV39/HQ17+wE4eMwHXmgHkP5kqw8acYvMAllB8sZuS8QFImvvKmOc35c
         xKXg==
X-Gm-Message-State: AC+VfDwoi/LdQqXMlVYYVL/4YykZbTGTVWDSaA7rC/bwIaB+XmEGRmn2
	uY14y6Ls2oWdKmDgKZMdnE8rLA==
X-Google-Smtp-Source: 
 ACHHUZ6pJ9gBRmaoQa6XLm1cGGaP5iB2F8OjL2WeiUytTr/r2tPTGvceaK3m91xt6SNlQrtgYgPuTg==
X-Received: by 2002:a17:906:9749:b0:97d:2bdb:aa67 with SMTP id
 o9-20020a170906974900b0097d2bdbaa67mr9618810ejy.70.1687155676650;
        Sun, 18 Jun 2023 23:21:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 k9-20020a170906128900b00965ffb8407asm14090042ejb.87.2023.06.18.23.21.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jun 2023 23:21:16 -0700 (PDT)
Message-ID: <9c638204-7c42-cb43-e925-f0d0e3cc8eae@linaro.org>
Date: Mon, 19 Jun 2023 08:21:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 4/4] ASoC: dt-bindings: Add tas2781 amplifier
Content-Language: en-US
To: Shenghao Ding <13916275206@139.com>, broonie@kernel.org,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com
Cc: kevin-lu@ti.com, shenghao-ding@ti.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, x1077012@ti.com, peeyush@ti.com,
 navada@ti.com, gentuser@gmail.com, Ryan_Chu@wistron.com, Sam_Wu@wistron.com,
 tiwai@suse.de
References: <20230618122819.23143-1-13916275206@139.com>
 <20230618122819.23143-4-13916275206@139.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230618122819.23143-4-13916275206@139.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2UERALFNVUATKTNFAWQGJUVSF2ZZYEQU
X-Message-ID-Hash: 2UERALFNVUATKTNFAWQGJUVSF2ZZYEQU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2UERALFNVUATKTNFAWQGJUVSF2ZZYEQU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18/06/2023 14:28, Shenghao Ding wrote:
> Create tas2781.yaml for tas2781 driver.
> 
> Signed-off-by: Shenghao Ding <13916275206@139.com>
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

