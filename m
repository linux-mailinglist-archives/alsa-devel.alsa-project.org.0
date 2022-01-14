Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C90C248F2C6
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jan 2022 00:04:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BD591F43;
	Sat, 15 Jan 2022 00:03:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BD591F43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642201453;
	bh=GSNeyUG+jM/HNmHUnyncCmVdqlOiWYdCdc+2pEjZv2o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o1TNFm52W9Yk2x/tlYXCvnGLN/J7uIeThn44p2ObgIZ+vnETkNr5adcpjlZ+WPIHT
	 AcoP20QXXMLUvwW+L5yrdN2vRPPIxcaYc5UN0/nY2D9Er/yCILCcpCneD9d+eB48aW
	 KeFHgjR7a7BsLUVnfxpQ5AGGF5Jdekm21EMUhduQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A97FF8032B;
	Sat, 15 Jan 2022 00:02:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BD40F8049C; Sat, 15 Jan 2022 00:02:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6877EF8030F
 for <alsa-devel@alsa-project.org>; Sat, 15 Jan 2022 00:02:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6877EF8030F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="htS6cflF"
Received: by mail-pg1-x52e.google.com with SMTP id x83so3911972pgx.4
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 15:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o2h9cZxYJ3emYpUIj++uO1rilt4TStZ87q6578VwqZA=;
 b=htS6cflFJn1ZL5Y0EPBeN6hbyK7QvRLQG6rL5+hf+Wyp/p/OwvwAl+Evj2ZQ1THw8U
 UC6WEz/EhH69UAKuS4Z7gffz1k2LATR0EJgozsv2LnARXXrqxKBBQ4ABYZcLLxPDoo6k
 9jAJ1rcvLoaJTprwBOkTnDB9oHf7Sk8iuKDJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o2h9cZxYJ3emYpUIj++uO1rilt4TStZ87q6578VwqZA=;
 b=qfwudvM16X50sJKk89/84djs1Nz1WyjcBGaT6XgAuf1PrsTL2CTmqnDGpHshFHuR9G
 RgOvgbedGVku4/io9ti9EduTNarQ/Kijr7UBkJQPCKXLQy8PLyW3xG6y9XGF8YRWc/PT
 MJzVm/421rGjZnJ9DRmPszP6tUwsFdQD5G4NSYrxvioHtwG2iCSagNZau3rsuZyJJgGy
 198cicBc5q66eSHqUUqSEwzgSpUAwSUW7gyLaTzmfTAfurpEWpnBkk20KJEYSe3/aiiT
 DhBod7MxkRvxKejH0oOjGHMkFXTPod2YN3eXpvdLRTL2JZrZsiqDjg6lHs0vTHHF3A4c
 mCPw==
X-Gm-Message-State: AOAM533T9apEqhArg04DAwQ/0uFh3io7RJ2mRykAUXGFEBRpvIjD9njS
 FwfdF6XH2eha4sUOlYsBa7BQmA==
X-Google-Smtp-Source: ABdhPJyUUCEgb915ys8+J2HAqJSVrMJLFjTcoRKHgsU+KV+w14oykK1ZzYgHLlzxpYzPiETOK+okYA==
X-Received: by 2002:a05:6a00:2408:b0:4c1:e1a1:770 with SMTP id
 z8-20020a056a00240800b004c1e1a10770mr10548879pfh.70.1642201348060; 
 Fri, 14 Jan 2022 15:02:28 -0800 (PST)
Received: from localhost ([2620:15c:202:201:76ab:ede1:503d:1c39])
 by smtp.gmail.com with UTF8SMTPSA id h11sm6161656pjs.10.2022.01.14.15.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 15:02:27 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/3] arm64: dts: rockchip: Switch RK3399-Gru DP to SPDIF
 output
Date: Fri, 14 Jan 2022 15:02:07 -0800
Message-Id: <20220114150129.v2.1.I46f64b00508d9dff34abe1c3e8d2defdab4ea1e5@changeid>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114230209.4091727-1-briannorris@chromium.org>
References: <20220114230209.4091727-1-briannorris@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lin Huang <hl@rock-chips.com>, Brian Norris <briannorris@chromium.org>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Commit b18c6c3c7768 ("ASoC: rockchip: cdn-dp sound output use spdif")
switched the platform to SPDIF, but we didn't fix up the device tree.

Drop the pinctrl settings, because the 'spdif_bus' pins are either:
 * unused (on kevin, bob), so the settings is ~harmless
 * used by a different function (on scarlet), which causes probe
   failures (!!)

Fixes: b18c6c3c7768 ("ASoC: rockchip: cdn-dp sound output use spdif")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 - (Un)set pinctrl, because the default assumes we're routing out to
   external pins

 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
index 45a5ae5d2027..162f08bca0d4 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
@@ -286,7 +286,7 @@ max98357a: max98357a {
 
 	sound: sound {
 		compatible = "rockchip,rk3399-gru-sound";
-		rockchip,cpu = <&i2s0 &i2s2>;
+		rockchip,cpu = <&i2s0 &spdif>;
 	};
 };
 
@@ -437,10 +437,6 @@ &i2s0 {
 	status = "okay";
 };
 
-&i2s2 {
-	status = "okay";
-};
-
 &io_domains {
 	status = "okay";
 
@@ -537,6 +533,17 @@ &sdmmc {
 	vqmmc-supply = <&ppvar_sd_card_io>;
 };
 
+&spdif {
+	status = "okay";
+
+	/*
+	 * SPDIF is routed internally to DP; we either don't use these pins, or
+	 * mux them to something else.
+	 */
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
+};
+
 &spi1 {
 	status = "okay";
 
-- 
2.34.1.703.g22d0c6ccf7-goog

