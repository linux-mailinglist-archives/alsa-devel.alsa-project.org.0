Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCF069AF08
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 16:08:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 868DAF59;
	Fri, 17 Feb 2023 16:07:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 868DAF59
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676646508;
	bh=4LVuRIBKQvvKNXZZ5rwUcjxzqTzIBuFiQjdOdTdaKcM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WgNpkiYobTMmvME+ToYH7P3KLvF2SDLOy37jxAtuspyJXSLceLXhzUzYf6Y9a4iCm
	 xOFvLZUMEFTcdXXXUAEw2MP4sRaGa+WmQOcsFHzwN878+7dR6iQ5Rd8Vz89E1I8MRQ
	 mlNTwX+wm402SvQNFBV1irp02d1lgi3ie5o4zsa8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48E34F80496;
	Fri, 17 Feb 2023 16:06:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC948F80171; Fri, 17 Feb 2023 16:06:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 30DF3F80083
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 16:06:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30DF3F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cPgqSYp5
Received: by mail-ed1-x52c.google.com with SMTP id er25so5136408edb.6
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Feb 2023 07:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3z185FWU7ZfyyzhLKoYedsNlicLGBx1kFdr349Ea550=;
        b=cPgqSYp5x0RbNey1QoYnp5yYjtPNnxIKHuV0yCV/tGu9ze+BWyKaZrgRC23xqf+aK1
         Aa75MQoEmRnU49ts0JOKIdAsizKdLGtGQ6i3gbPmR/8+6/QlLJNRQKcZLCdwp6qESKLk
         TNeODqdrNmmvu8AAMSwD/f+X9yYhNXjoTESvao7GPYh3/RJyInpDc8tOf328q9nSJfVK
         uNyJqYQAaYyhcRqfLEb141/RcX5WHo476bWoSoAdMBR7U9u64E3NB8EDcq+GHSRjJp5a
         b6Qh4FYtOa1Yw38WNUVZGEnLEWXE6z5y7xchSIgWc6sWTAckOKpnHBoSW1kh3ufDXVwb
         krkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3z185FWU7ZfyyzhLKoYedsNlicLGBx1kFdr349Ea550=;
        b=BCCXnIXvH8gUokJHNX3RvNyNQi+gvx3foSP5ivhNTiX9OvyGS7Y1UYya5ByewxULeG
         s+KDEwW8qlWD7xuoBoPNhl4bNkDpNYdd6vyypFDWHeh3lBDBVXUVcNU0vfLjiPONDmdn
         9ZmDTU5DZ1vcx1F7yx6TOVBqIqmE3SCAL8RATdSmL53I8WVfpYdGeVJTS99QrEkUxfku
         jlHWWFRW0WAVymPeacFHD45QHZrAdl6cvrHUlBSbC9Nopbh79yXzY47kzS1QJZY0k63K
         BisfjQ8dFOhAu0jQ0jT6NjsER5TX/fz8nEuUbPJubha+TN9cwUnqvUGbIKoJONytc0LY
         NoxA==
X-Gm-Message-State: AO0yUKXTJl+MGJIcC8ZmS3e3Ygdy8bRfl/xb/Xqg1fIqasnfkaMg37vs
	zOPaf6npr+WjLwG1pBvUW/QZDw==
X-Google-Smtp-Source: 
 AK7set/pn10vry4YigYRKtWssAPTbvwcClDP3kZTdAu0MAicSLuTBDXhSHoRKivXU0qwmTastoh1hQ==
X-Received: by 2002:a17:906:4708:b0:8ae:e82a:3230 with SMTP id
 y8-20020a170906470800b008aee82a3230mr10211274ejq.70.1676646399162;
        Fri, 17 Feb 2023 07:06:39 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 fx15-20020a170906b74f00b008b14ba6c954sm2221303ejb.194.2023.02.17.07.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 07:06:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	- <patches@opensource.cirrus.com>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Randy Li <ayaka@soulik.info>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: imx8mm-nitrogen-r2: fix WM8960 clock name
Date: Fri, 17 Feb 2023 16:06:26 +0100
Message-Id: <20230217150627.779764-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230217150627.779764-1-krzysztof.kozlowski@linaro.org>
References: <20230217150627.779764-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JBISWR4466UDDUOV2VI6NHLV2YODFGY4
X-Message-ID-Hash: JBISWR4466UDDUOV2VI6NHLV2YODFGY4
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JBISWR4466UDDUOV2VI6NHLV2YODFGY4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The WM8960 Linux driver expects the clock to be named "mclk".  Otherwise
the clock will be ignored and not prepared/enabled by the driver.

Fixes: 40ba2eda0a7b ("arm64: dts: imx8mm-nitrogen-r2: add audio")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts b/arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts
index 6357078185ed..0e8f0d7161ad 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-nitrogen-r2.dts
@@ -247,7 +247,7 @@ wm8960: codec@1a {
 		compatible = "wlf,wm8960";
 		reg = <0x1a>;
 		clocks = <&clk IMX8MM_CLK_SAI1_ROOT>;
-		clock-names = "mclk1";
+		clock-names = "mclk";
 		wlf,shared-lrclk;
 		#sound-dai-cells = <0>;
 	};
-- 
2.34.1

