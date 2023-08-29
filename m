Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA2878CB33
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 19:26:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3D529F6;
	Tue, 29 Aug 2023 19:25:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3D529F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693329982;
	bh=USKCSWXUFDyCTUh6zcqWKMp/J1Hpry7/kV9QROnxexI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QJGLz1YveknYlEATRaxRxhDimGR9QGE0c0t48zsgQvsVGdYGda1IHzhpSPFx+jdd+
	 0TB44CfjtIPvo4wm+SZ8X74yTWUtkQ2UUFyXKdlNF/Rjn2l0WqzambK1Nj4xa/BPiX
	 M0+Zl52EdAH6oLFWlVCmZCSKvUodfb71Nx97Qp88=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B9CCF80155; Tue, 29 Aug 2023 19:25:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 462CAF80155;
	Tue, 29 Aug 2023 19:25:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2940BF80158; Tue, 29 Aug 2023 19:25:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7BD81F800F5
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 19:25:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BD81F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=SZA1/XAf
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-51a52a7d859so101333a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 29 Aug 2023 10:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693329926; x=1693934726;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AOsSOchRRigf+GMT70wdUDRGXijaBiL95u8f9cme2Mo=;
        b=SZA1/XAfU+VVYtUa+osPWAsdTchnt1lAN17FzedjhTm7d149D7rO+irQoSckWGxvLY
         /8LN6cUfxo6Lt2Cq0LorOtIpUstWQb2dcxJU3cqG0e8FiuT+Fteu+g7Qm7nR1FXbcwgd
         Du2O132b4Y7soTx3vTuFS7Rd+DmkOlmbtYGaTTST8N26YG4Omj6GtE+qMCL4XopjLLFd
         NQ4f1OlZF23Yt1GW/lOEpxDVK6uonKY026qhKtkrcIarjJJ1kYt9jQ2Lur/NWUGx4/IO
         ucodJHDMM60GD/7Z2DhYBAvmZaIUOC3UF66VhKSGVh8DDheJAC811f/JeI77h+QDU9u9
         k2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693329926; x=1693934726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AOsSOchRRigf+GMT70wdUDRGXijaBiL95u8f9cme2Mo=;
        b=KRQq6ZftKvrIVC270TyHEj5cqYIL1r6x+9EjtKvQ1zHzWBSHT+ZzdKoB5heubrXUM8
         olWqtC3I2fPRMQzcm2MDmiFaLhL4GUrSRKaDza3hVFSf3cdDQa7LM24r3R3MCftDQ0NZ
         Uws+h+e/OLbp14BDgX6iv3wOCNGPZQVatuafGx6xJfxH9VnaonX7hIJ0ZqLtq1pKZZTZ
         d/5l7rFY5vpvqJEv0xd8O1Tk7WviAl4IdHdDFKUoUrh7s9ZZxf3HlDBDo2xdKkfW/2Pg
         KGzOI+UADwNpBFLhRtK6pNNDXldizwQeIxg2+m5GXsiQrS19TOgb+jPdmXW3v/6SbjmB
         W3gg==
X-Gm-Message-State: AOJu0YxRnZwUvlqzKCdV/LhrFGxPHWsAp6PRDtff1qu0WGt4d15I33sn
	Ow5BXk7qfTdyk/0KBHsJIkSYPQ==
X-Google-Smtp-Source: 
 AGHT+IF3yG8pM/1QQYR3cM78PgXLt47SF3cJUeeTGTYGaG5gDIhDp0rbhT11KNATVil2Mt43nb0AVg==
X-Received: by 2002:a17:907:6d0d:b0:9a5:7b9a:f32f with SMTP id
 sa13-20020a1709076d0d00b009a57b9af32fmr3582562ejc.1.1693329926489;
        Tue, 29 Aug 2023 10:25:26 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.196])
        by smtp.gmail.com with ESMTPSA id
 v17-20020a17090606d100b0098669cc16b2sm6103226ejb.83.2023.08.29.10.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 10:25:26 -0700 (PDT)
Message-ID: <771e116c-7e0d-d238-d35a-c5e9a44ce571@linaro.org>
Date: Tue, 29 Aug 2023 19:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 16/31] ARM: dts: rockchip: Add SRAM node for RK312x
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
 <20230829171647.187787-17-knaerzche@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230829171647.187787-17-knaerzche@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: W5HCELSL3WAKZH2TRVFTL3PE4Y2TKGCZ
X-Message-ID-Hash: W5HCELSL3WAKZH2TRVFTL3PE4Y2TKGCZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W5HCELSL3WAKZH2TRVFTL3PE4Y2TKGCZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29/08/2023 19:16, Alex Bee wrote:
> RK312x SoCs have 8KB of SRAM.
> Add the respective device tree node for it.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> ---

This really does not depend on your MFD, GPU nor ASoC changes. Keep
independent work for different subsystems separate.

Best regards,
Krzysztof

