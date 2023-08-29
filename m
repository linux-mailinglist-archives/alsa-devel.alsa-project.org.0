Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8347078CB37
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 19:26:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E140A4D;
	Tue, 29 Aug 2023 19:26:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E140A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693330018;
	bh=XASF6L+CFT37xAgTRLzvSw5XT/pAT+qRxQqIx8eoTe4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eAsfziIhFzwjk3/yb7oKb86G2AUdAcWyP00/iCNV/yrWXYehP0+xyMGoo+sr7s8pt
	 lTljBwenYYpYEt1F1/p/vhD1adnADbRHPS+b3fA1yyBTjCMqXGERczkGx8FotUq6IW
	 xs0mTMr4iMa/DiRs8kUpsOwqAmDvq6m4HrUcc5gY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37A62F804F3; Tue, 29 Aug 2023 19:26:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D4A0AF80158;
	Tue, 29 Aug 2023 19:26:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB1C5F8032D; Tue, 29 Aug 2023 19:26:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 639B5F80158
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:26:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 639B5F80158
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kHbU+j63
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2bcc4347d2dso69850131fa.0
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693329960; x=1693934760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XASF6L+CFT37xAgTRLzvSw5XT/pAT+qRxQqIx8eoTe4=;
        b=kHbU+j63kRJgi19vriktot12nqwsQEFKOH92u6vdDrVpsZweOAUzFYD2jMRVZONtHB
         8oqMSawB5f/rUfbFdyoZZSeSbQNp2Qy7tR6DgybERzmJT83rICzzkoGQk2XZqyk7ctcd
         Qo0qLiW6c+Mhy6O1SSArqwSPnfoadLxFuMEsFg3G5OIFeYHbeEBWIrmo47N/zTLK6vK2
         S/2YVtg1nm66M3w6dqaNW1lkwhijfgcUAld2IqWjubjKAGtF3wRtAGth+yw0t4R+knpp
         9Yrrzco7+yLakp+f28SG+mWHIxXeTmtvIx6njQcK2459fq8ot/epCFFuSlkLUrDBPC65
         rAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329960; x=1693934760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XASF6L+CFT37xAgTRLzvSw5XT/pAT+qRxQqIx8eoTe4=;
        b=VMVP1SD4W99kmUkPI3rJTHKjjMyiCprVcNCevS+nnO9b3JBThP7KJ6JxdaBEgU1AOO
         qHTXmRmlHt+n/uKOm15Opuk3p7LdTovn0pqD5PLJOL240UCh/0rY5ZJwI+rrB9J73lsI
         K95Owj4KDNGSMJNSB9DJyoDa1MHwZxb1wZ4tXpIU4hFC/TA49KD8nR3XNA6uo9gIbZGr
         pnTmdyMsLcNYjxw3MxrWH/4tksJfEEf4zQO6BUdYsFLAFq0b1sDjuyiPk+/qdW+1dc8h
         xkzhKnDicyMGdDH44pUFYx42c/GP/LKhkmy2vu90t6XnqZV3+fmcGjpVdNmpEhDGXMAm
         mUww==
X-Gm-Message-State: AOJu0YyQ2GW1eeszawfEr8X9+KoymphsHBHfx/trxbnDBTRHqHhxXx0U
	rn1VPtxEOT9YMnWrLJlEz7+YcQ==
X-Google-Smtp-Source: 
 AGHT+IGHdaXGoRpgBFSCCGbMrc9WN2vaolT0HlJjcJrqIeZe/CQVLwYV84VHWJ3Nah14pPFkboyfcA==
X-Received: by 2002:a2e:9649:0:b0:2bc:c28c:a2b8 with SMTP id
 z9-20020a2e9649000000b002bcc28ca2b8mr17205992ljh.27.1693329959883;
        Tue, 29 Aug 2023 10:25:59 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id
 vw13-20020a170907058d00b00993664a9987sm6181867ejb.103.2023.08.29.10.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 10:25:59 -0700 (PDT)
Message-ID: <4343e032-aafe-ed57-9374-c21961926184@linaro.org>
Date: Tue, 29 Aug 2023 19:25:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 17/31] ARM: dts: rockchip: Add CPU resets for RK312x
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
 <20230829171647.187787-18-knaerzche@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829171647.187787-18-knaerzche@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TUMZRTGBUNNY2IRHUHBY6VMJYYMKJQ4V
X-Message-ID-Hash: TUMZRTGBUNNY2IRHUHBY6VMJYYMKJQ4V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TUMZRTGBUNNY2IRHUHBY6VMJYYMKJQ4V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29/08/2023 19:16, Alex Bee wrote:
> Add the reset controls for all 4 cpu cores.

This we see from the diff. Commit should say why.


Best regards,
Krzysztof

