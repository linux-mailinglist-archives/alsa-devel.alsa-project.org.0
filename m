Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7921B78CB11
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 19:21:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 252231E3;
	Tue, 29 Aug 2023 19:20:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 252231E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693329698;
	bh=48wcKsFbXyaE621EnB8kzGP/6DfU2feRkR40atr3T8s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Upv/tZp8whDQnClUoalVa+auagPKpujILeX9GV9qUHyOPksJu5Lc6zJc1KqzVR4QG
	 bpezoHT59UqQHItaM12JRsAT0PvQrglEQPYIwjSueu15mbOBSqdXOf3uIEhqCbbGW3
	 TLQsWjt57JUO5L0GMtkU2GJD8Vyf5Umvv2X9RXls=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC440F80155; Tue, 29 Aug 2023 19:20:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54D6DF80155;
	Tue, 29 Aug 2023 19:20:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6CFAF80158; Tue, 29 Aug 2023 19:20:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CBA25F800D1
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:20:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBA25F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=svFv/Z9p
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5007f3d3235so7382687e87.2
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693329638; x=1693934438;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2gJh7hh3Cv4MKGAYWWiEyZbDkr75Vxh68gw9dOhliEo=;
        b=svFv/Z9pr7z+fE96FtSY4wNw5Qa2yWz9MMDZgo8e5txPC7jOPprZ+/VfkDOhO9+5ff
         JZbANOmLFqeO8HbS9PoJbKb8b3ziDDnQyTUOlfVWdJ5IBXengbnaH+UBjH1U6aFAEsWo
         H0F44cpGBCVK18gmBV0dWJi1qVfi3txaFE2I4YM9onDQB2OfMS4VTVoCQQQJgZhD8dhi
         aq57PQjk/nBpwCbPwjSHfVxNMRTfNVqOiqu600sz3+nNxjjDIs7GU6nLF0fFWuOKdgm4
         k2Nj6XlyP0xiztq8gbA+3vi2kXSKxd4ze0yumQ8Hz9IDWAknT7KaS9nXgckiNRTMnjdh
         HJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329638; x=1693934438;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2gJh7hh3Cv4MKGAYWWiEyZbDkr75Vxh68gw9dOhliEo=;
        b=SAEweb8nK50cnySL9SXUWTFf65ecMVHFBMr/coevZkwKVOfqATvir6MHnfVSDjSGTm
         JhsfJE3XoVFOOdjsts2s/nbomrztAXw8H5zMt6Z/Crt1eQfk+eRTEO+b2/IEGxRvV9J8
         AMe9nh5Sde4rsxVYcxcsWwGJ6hvh07OSxm0a2Fkl3BwNepcD8ZB+64AKqj5kZYStSLzN
         KTi3LsAlO04mWNCNE47VjLPD9uvzWVH6NWt7K924BiBTgEmCkmZNM/Bl3yYJyLj4+5Fg
         5sio4iYQm86omEWGltI9PDDObJ5/Ch62nS2w4ZnqIe2Gcit7y+nkEBIeNzbAeRz/6z6c
         jJ9Q==
X-Gm-Message-State: AOJu0YyEEQgH1jS8ghtGOBkw/PRR+5y1opir0Tsm98nfARr7uiXP1QCz
	xCl1wRSeAeb19EvnPTISCDGELQ==
X-Google-Smtp-Source: 
 AGHT+IGlVnUWA48hZ1fV2ZgoaAUWDkmNEboaK1aSOxLC5DhzgZm2KyvX6J5uG+IbCKz7WrZM5DcSfA==
X-Received: by 2002:ac2:4985:0:b0:4f9:51ac:41eb with SMTP id
 f5-20020ac24985000000b004f951ac41ebmr17504153lfl.16.1693329638491;
        Tue, 29 Aug 2023 10:20:38 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id
 u18-20020a1709064ad200b0099bc08862b6sm6299274ejt.171.2023.08.29.10.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 10:20:38 -0700 (PDT)
Message-ID: <20308990-0701-6dae-a5f3-b0c5d6cccbe4@linaro.org>
Date: Tue, 29 Aug 2023 19:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 01/31] dt-bindings: mfd: syscon: Add rockchip,rk3128-qos
 compatible
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
 <20230829171647.187787-2-knaerzche@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829171647.187787-2-knaerzche@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VOVIC3F5JHPLCSZIU3JE6KT6Q7DVGMYN
X-Message-ID-Hash: VOVIC3F5JHPLCSZIU3JE6KT6Q7DVGMYN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VOVIC3F5JHPLCSZIU3JE6KT6Q7DVGMYN/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29/08/2023 19:16, Alex Bee wrote:
> Document Rockchip RK3128 SoC compatible for qos registers.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +

You should probably split patches per subsystem, if you want it to get
applied.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

