Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F5C46685F
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 17:31:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FBE4295E;
	Thu,  2 Dec 2021 17:30:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FBE4295E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638462703;
	bh=K41FuM+GZd+xNfwsGsdQfZhxmP1i4d6V6RxOahu83ic=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qka3AhwMAMnyrX0hRVVdABX+NXtvVE2gJMn/Y/fGKFO+qegF9F+8zQF5EekwlT1BK
	 8XAOtp7dII6MRYi1/3HT3hosWXKRYsB7Wtvkn9rUCXlhi6aD2bnqHTMJYVPfBHS5MZ
	 xwVN5AemJcRR62U73A3EmfxKqOXYeDWUkR/h5rZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEB68F80567;
	Thu,  2 Dec 2021 17:25:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A78C4F804FD; Thu,  2 Dec 2021 17:25:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EE17F80301
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 17:25:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EE17F80301
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aKbm0jqG"
Received: by mail-lf1-x12b.google.com with SMTP id f18so72796330lfv.6
 for <alsa-devel@alsa-project.org>; Thu, 02 Dec 2021 08:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zkcS7+n1gGRETsbxAVke0DfOgp5thJ9O9vqlNwbymZo=;
 b=aKbm0jqGqQBKRzqfDuhiE2xlT+R/vzJkmwWjfb0+xzKDh2xzPr1ZfXV7WFc1B976eD
 HSDFQVKr6YO/RZ72cNMOeNe9A6b/djeWPHQMIs4TruQEfzydiQrAfIWUgeXdSAXshrjR
 OcPeBvZTdCHWFXCAdtckkkezCVu/zJ7qR8feARLU5smSOj6qhmFeij2/T9cJSsVjTkZj
 AyKzfJSPOQh+9+sv2BovQgXLHYwUua5+RKzNc8CAs/zummyK5XnFCGhkYSrTFkNaZcH5
 yRRritoCYLKakaJSROkodMyCkG4oRzayGmZDZg9EX5QDr5fqJtJLMlzGcLRqd1TDAi28
 tSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zkcS7+n1gGRETsbxAVke0DfOgp5thJ9O9vqlNwbymZo=;
 b=M7TIWJyvSFyKrxChDYGoH6L0WaCv79e7ounzMfYh/qBdRP1ugTm8ZklIJUKOEwObos
 FovRp4oB6EecfD3OR2yxQ3Q4F0rSxmwtcNifcozirzx/a5y6MDg3SoBBqsgOXIAkZirW
 G4USOmGNVKIkTEfBkHOqazmx2EM/29VvG9wy1YcaF6nFaYxpB0vtCz5EBiaEYCmkkexF
 ZgGjufCGWg3yOVFfMabx4rZGUe9cUneQcRgI8ZcxYibc0VXIx5o/Kbt3feJYCt4ySnpr
 8jYEdHMPNR7NyRAP3hcJoyTbC/IIL+DESa5P0uuo2b2kM3G9FdorTGrZa9ENe/lMRsmd
 +OMg==
X-Gm-Message-State: AOAM531QVKfjjQZBoM72u/RfbtmR43ema/3Z7Tc8PQnRqFZWH3IR56/d
 6rlI520g9ZB1D+HTZ8IPGbk=
X-Google-Smtp-Source: ABdhPJxXWxkCEMsMgkvRWBk1cYAY6zm9sVWn+2iUZaxbe2VVIoDxFrkZckmO5aqHg1U1HX9z4kkfEw==
X-Received: by 2002:a05:6512:519:: with SMTP id
 o25mr12609268lfb.422.1638462331745; 
 Thu, 02 Dec 2021 08:25:31 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:31 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 17/20] ARM: tegra: Add S/PDIF node to Tegra20 device-tree
Date: Thu,  2 Dec 2021 19:23:38 +0300
Message-Id: <20211202162341.1791-18-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211202162341.1791-1-digetx@gmail.com>
References: <20211202162341.1791-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
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

Add S/PDIF node to Tegra20 device-tree. It's needed for enabling HDMI
audio support.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 63c2c2f8c0ce..72cbe32d0c1d 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -197,6 +197,7 @@ hdmi@54280000 {
 			reset-names = "hdmi";
 			power-domains = <&pd_core>;
 			operating-points-v2 = <&hdmi_dvfs_opp_table>;
+			#sound-dai-cells = <0>;
 			status = "disabled";
 		};
 
@@ -396,6 +397,23 @@ tegra_ac97: ac97@70002000 {
 		status = "disabled";
 	};
 
+	tegra_spdif: spdif@70002400 {
+		compatible = "nvidia,tegra20-spdif";
+		reg = <0x70002400 0x200>;
+		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA20_CLK_SPDIF_OUT>,
+			 <&tegra_car TEGRA20_CLK_SPDIF_IN>;
+		clock-names = "out", "in";
+		resets = <&tegra_car 10>;
+		dmas = <&apbdma 3>, <&apbdma 3>;
+		dma-names = "rx", "tx";
+		#sound-dai-cells = <0>;
+		status = "disabled";
+
+		assigned-clocks = <&tegra_car TEGRA20_CLK_SPDIF_OUT>;
+		assigned-clock-parents = <&tegra_car TEGRA20_CLK_PLL_A_OUT0>;
+	};
+
 	tegra_i2s1: i2s@70002800 {
 		compatible = "nvidia,tegra20-i2s";
 		reg = <0x70002800 0x200>;
-- 
2.33.1

