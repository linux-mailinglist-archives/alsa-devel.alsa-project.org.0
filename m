Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC7970E78A
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 23:41:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76C2F825;
	Tue, 23 May 2023 23:40:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76C2F825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684878065;
	bh=nFCOAfR/Ma2Y8N6XtG7fqP1ccz5V/IzotOkTLEG+L0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TwuRCc9xeGrOXTV64IaILnqxsoP3SJ2cRESPDrMSREcuRUa57yXuT9ndtlZOiVjNE
	 YgjjnlNWqKlwop3UAzV2UtXJB24UPQIhxGp0gnq488PDxU8Z7dhRcEWMY8YlEbP2CH
	 jlZrMMhaYUQNgTH6Doul4Feh8zQ2GVICQ+mMSLYo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 168E8F805AA; Tue, 23 May 2023 23:39:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B78DEF80425;
	Tue, 23 May 2023 23:39:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 980E7F805B0; Tue, 23 May 2023 23:39:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2AD9DF8024E
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 23:38:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AD9DF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=hXs8XQ+V
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-3980f932206so202724b6e.1
        for <alsa-devel@alsa-project.org>;
 Tue, 23 May 2023 14:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684877914; x=1687469914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Mgi1xCWZGOa//ARDGoMV+dgV7iPjlGc+gvDlG8j5pY=;
        b=hXs8XQ+VsM0uKKwxB8QRLNQNK78Qca3/YA7XW2GEi+5SxI1BvHOMq29cvWlDDyWCRx
         LQMPDyJicTszBjUZFqQyb8dBZSRpecRDiOFuHGbfBALS3FpsWm/qn0i8U0+sb2ugQiaN
         Vv0EFEe1LsPAVWJn/ZvOxE5NGXNnhhLg8+ZW61HWZD/lfitjOcL8lAx9rcHrS39YkMek
         OT/pvEmzZ7UiwrzhchcRME1csW3c6bfihfCgAS0D6GGK48WYYcwk8jR6U40GO1xuTxwo
         QwWzLRpHI1F3C1g50tKvyelhXzCwSq63TCB6ACBIZ/w5MQa29W26kACfzo0c7lXYY3oz
         mgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684877914; x=1687469914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Mgi1xCWZGOa//ARDGoMV+dgV7iPjlGc+gvDlG8j5pY=;
        b=hr+ZL+/HACCFZHO1nO9IbetBcjXdqb/UYOh4/MrFteJvbff0TtDpOtOc17FDtx9hV5
         +IPMFqificjuckOGvN7JKTc3AdMHp2DuuUifeYGJd5aAQ2e81D5ufaVyA27LHouQhxZU
         gG6pE5UOJjLjwkjmH67MZOOW/5eOjQ20PiNxg0g2DgykzsZYNLkdVlLC3F2VwzUjNLG/
         dTFl+pCKrbJ8AoVH3ykl9v9a5ZU7iz+1kLtQN9wrW3lDWeXLW5D71c794VxoUxcxXq0P
         vATgtNkGibUBLHv6buBXzEv0duDTuTdRknM+O5LR8QDgvBDhl5N7Bx5YUuO2+Pv4W4sp
         H76Q==
X-Gm-Message-State: AC+VfDwrCSssP48QRJEqmDXbwgS+T8PGyEe1Rec2PKSy7HbKEPCEGXQX
	Yw8EcnaeYPW8RnE6y8LHEUs=
X-Google-Smtp-Source: 
 ACHHUZ5j0wmMDzm4NXi9K7ZqQmj6d+e/UrUvMChhWlONqjQFtk+tG5LyXBhsF5o/9phbxLMt9cM1iA==
X-Received: by 2002:a05:6808:4c4:b0:394:2868:d51f with SMTP id
 a4-20020a05680804c400b003942868d51fmr7767223oie.4.1684877914232;
        Tue, 23 May 2023 14:38:34 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id
 y83-20020acae156000000b0037832f60518sm4442359oig.14.2023.05.23.14.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 14:38:33 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	zyw@rock-chips.com,
	sebastian.reichel@collabora.com,
	andyshrk@163.com,
	jagan@amarulasolutions.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 3/6] arm64: dts: rockchip: Add sdio node to rk3588
Date: Tue, 23 May 2023 16:38:22 -0500
Message-Id: <20230523213825.120077-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230523213825.120077-1-macroalpha82@gmail.com>
References: <20230523213825.120077-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PM5MGERTDGXPZ32NEBPJXGVC4APOIR7G
X-Message-ID-Hash: PM5MGERTDGXPZ32NEBPJXGVC4APOIR7G
X-MailFrom: macroalpha82@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PM5MGERTDGXPZ32NEBPJXGVC4APOIR7G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add SDIO node for rk3588/rk3588s.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
index 571cdec24a66..6335d5648bc3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
@@ -1176,6 +1176,21 @@ sdmmc: mmc@fe2c0000 {
 		status = "disabled";
 	};
 
+	sdio: mmc@fe2d0000 {
+		compatible = "rockchip,rk3588-dw-mshc", "rockchip,rk3288-dw-mshc";
+		reg = <0x00 0xfe2d0000 0x00 0x4000>;
+		interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH 0>;
+		clocks = <&cru HCLK_SDIO>, <&cru CCLK_SRC_SDIO>,
+			 <&cru SCLK_SDIO_DRV>, <&cru SCLK_SDIO_SAMPLE>;
+		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
+		fifo-depth = <0x100>;
+		max-frequency = <200000000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sdiom1_pins>;
+		power-domains = <&power RK3588_PD_SDIO>;
+		status = "disabled";
+	};
+
 	sdhci: mmc@fe2e0000 {
 		compatible = "rockchip,rk3588-dwcmshc";
 		reg = <0x0 0xfe2e0000 0x0 0x10000>;
-- 
2.34.1

