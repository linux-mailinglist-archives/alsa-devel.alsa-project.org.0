Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AFF78CB21
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 19:23:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A31D6886;
	Tue, 29 Aug 2023 19:22:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A31D6886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693329792;
	bh=+9dWuIz5vl8DGC+kiDhMKqjuEO4x1vTZJyfMRzti6vU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Uzjj+BUk/8qvkVDf1HUkIDT6g2yYDyHSHouOCKlnfQQtomCHE4qYmutQ5a0xIy+Rm
	 gCfI/dd1ydZ3IG+GHPTQ6SrrqsUkicxaYM0nSCS+Lv0ebQTaaF1WTqe5wTi/0TcUL/
	 oqHqTag2WlbvFXRGFN3unus+A3LGdsdRypFFtfAY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68351F80527; Tue, 29 Aug 2023 19:22:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0025EF80236;
	Tue, 29 Aug 2023 19:22:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC45CF80249; Tue, 29 Aug 2023 19:22:18 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3AC88F800F5
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:22:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AC88F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=zhdT4+gq
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-99de884ad25so627504466b.3
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693329730; x=1693934530;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2tJx1LZA2LjgFtn73CfwP5M/IqTnK+MwGx8w31m75yU=;
        b=zhdT4+gqpd6hXl/1AYIMtl2I0Wi+ntmhHwcmBTqkgBdvdiVKuV+a+dl3qf6MAC89Yg
         xtFKR6zdCcg3/y9R9kN0QMBc3eeiglNerx8lEfteQJMddk3E6iZif5l2T9B4XvKrE4ma
         hYV1xLa2w3qc7BFGJIpITAtU+wKnbA5fhNkJSaRIR9+2o36urU0mHIIeYsJkxt6huU8v
         SdEYknF7yo13DKV/C0MCR/50DtwnBGfyf/pCh5qAp0176tnlclQF4fBPE5h/SKyKzi4q
         alj0NninrfISvuwp2iM8QhKKKSXceytX0YvYXWTOUbyrmlluV8qB43btBUzRiXMPYAFy
         NyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329730; x=1693934530;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2tJx1LZA2LjgFtn73CfwP5M/IqTnK+MwGx8w31m75yU=;
        b=AdUgJc5s7EThF+yBg87SzWa9EoKvKwLq2sOwIps4wffsLjEVP6hlH/H85yOoHx3pgn
         WiY+vyGEOL51b9CZLjD++5sUmVBM1MSFc8Txapn8SqJBCy9yQOPe6k5wjGHQEvNSMJ97
         N32cOcOyjRB6ppyJJAqkn2DXPBMAWgpg9ujUkcc+ZY1JzIVYII5AfnHyoxLlns3qF3d2
         wcWz11Y+rGIlsEJWK1qei9qgjVvNGUDvFtDfiuw0lMX1d1Wh4nRg7pF8ScWDTwoM41s8
         2IK1PYLAMLwYFZdFvzlXetkxJ85KgeT4sbUIqIdBuN97a7HHT4db8D+LAWdpMiXG1ixR
         JHzg==
X-Gm-Message-State: AOJu0YySCZ993LRdMblQgycSPxu5YsO0/NJjk8024z2K5ZtXanFqU08K
	Qfw0oJO1XA4RidMlyQLSaW2ZFg==
X-Google-Smtp-Source: 
 AGHT+IEkfyuO10UaoAlJW/IYUjOxaNUiUgX99OtB+CD8vi2Z/YeQChXUrbKkNwIR57XqpbHKCgrV0w==
X-Received: by 2002:a17:906:51d6:b0:9a1:d087:e0bf with SMTP id
 v22-20020a17090651d600b009a1d087e0bfmr15768869ejk.43.1693329730572;
        Tue, 29 Aug 2023 10:22:10 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id
 v24-20020a17090606d800b0099364d9f0e2sm6189666ejb.98.2023.08.29.10.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 10:22:10 -0700 (PDT)
Message-ID: <92b8261b-420e-d96a-ba77-9abe7d53b427@linaro.org>
Date: Tue, 29 Aug 2023 19:22:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 04/31] dt-bindings: arm: rockchip: Add Geniatech XPI-3128
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
 linux-phy@lists.infradead.org
References: <20230829171647.187787-1-knaerzche@gmail.com>
 <20230829171647.187787-5-knaerzche@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829171647.187787-5-knaerzche@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZHJCX63LFYABAEBWJ6CYLSDHM3EMZMBH
X-Message-ID-Hash: ZHJCX63LFYABAEBWJ6CYLSDHM3EMZMBH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZHJCX63LFYABAEBWJ6CYLSDHM3EMZMBH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29/08/2023 19:16, Alex Bee wrote:
> Add Geniatech XPI-3128, a RK3128 based single board computer.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

