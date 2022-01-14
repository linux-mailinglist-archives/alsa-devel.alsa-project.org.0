Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1976F48F0DA
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 21:18:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B062F1EFD;
	Fri, 14 Jan 2022 21:18:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B062F1EFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642191537;
	bh=WCZbQhaKQd51f29Wgt0SCxH1mWmMgfDh5r13jvAIuK0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IP3CWseRaq2Kpop0GE/lnwOjAOoxJ2p/S3yBuVxSNePuCTb5ocg0bbPqfJxj/Ayft
	 qRrjmMCdN/nVfWBz6I/0ytKnOYoW+BPgFcVFh72HBtyOTj/QUuO4xhSx9l7c/IPxm6
	 qLR13mx2LrNBp449Gg2es3aFZ6E4RKYUiPsENSqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADF86F804F2;
	Fri, 14 Jan 2022 21:17:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E75D6F804FB; Fri, 14 Jan 2022 21:17:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0503F8027C
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 21:17:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0503F8027C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="EEigY38b"
Received: by mail-pj1-x1033.google.com with SMTP id l16so4921372pjl.4
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 12:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NHI4YdJkg3blWqPelJAYTO4ml6hVxIePrSWCG1B/xFA=;
 b=EEigY38b1fTu+aiEP3SmQ0r0AcAMPN99i8wrAOaTvKy4ytD/0GOOBLLlpl+WXnajij
 X3Nu9yfWhzPIYpKmaOpgO0vwkP1Y7RDErmL2kBD1EAZt9n3wXWYMtNw602JoVR5bLHN4
 vUF+EV32uGddQTHPmX5WBu3o20sB8//KqZoXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NHI4YdJkg3blWqPelJAYTO4ml6hVxIePrSWCG1B/xFA=;
 b=nxXa3wi9Vsu1wJwuwyNovfjByQnWT9QdeFHgGSqImRDs6U+/qaJg7S9WHAl/WfUfF/
 CHEnakZ1QThl0rJ9Lu06vX11udAEvVR0guqxMmPdMAO89WnGg24yLrtL6UTuZWkmMtsD
 v9m3HztOaV2JoGO1lo6yZvH2LIcqOBT9xoZHFCf4s3lU1AE3zvLIX/YjNuJ+uGooiuM6
 I7o2iSiFI6B3E6K6dlAlnQTiS7Nwkyl/+8nWL0+MCnQTasrnD2xh13kxjbOfnTBJYyPf
 UY5BmS939ZYFJ+U5Hk9opnMQ9+E0ZU9UgAGZLUTI+UhYG2rVGr6oLewfbyWQX/bFnXXu
 ZoLw==
X-Gm-Message-State: AOAM532yFDYKD4w/VXIJHRFmO9PhnP0Pq22Ka2bS+2nGBGUS/2rq/UBq
 ilN4O+Em9gIOCyItir/eeIuhRA==
X-Google-Smtp-Source: ABdhPJyANqLFSMw/ah46py8E9k5uIE2DiLUf4ryo5wQMT8muBxJU4jdXvlE8Hx0LhnJYKQTgOC1SiQ==
X-Received: by 2002:a17:90b:4a92:: with SMTP id
 lp18mr12273149pjb.123.1642191432492; 
 Fri, 14 Jan 2022 12:17:12 -0800 (PST)
Received: from localhost ([2620:15c:202:201:76ab:ede1:503d:1c39])
 by smtp.gmail.com with UTF8SMTPSA id l13sm5300187pgq.34.2022.01.14.12.17.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 12:17:12 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/3] arm64: dts: rockchip: Switch RK3399-Gru DP to SPDIF output
Date: Fri, 14 Jan 2022 12:16:50 -0800
Message-Id: <20220114121515.1.I46f64b00508d9dff34abe1c3e8d2defdab4ea1e5@changeid>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114201652.3875838-1-briannorris@chromium.org>
References: <20220114201652.3875838-1-briannorris@chromium.org>
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

Fixes: b18c6c3c7768 ("ASoC: rockchip: cdn-dp sound output use spdif")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
index 45a5ae5d2027..21ec073f4d51 100644
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
 
@@ -537,6 +533,10 @@ &sdmmc {
 	vqmmc-supply = <&ppvar_sd_card_io>;
 };
 
+&spdif {
+	status = "okay";
+};
+
 &spi1 {
 	status = "okay";
 
-- 
2.34.1.703.g22d0c6ccf7-goog

