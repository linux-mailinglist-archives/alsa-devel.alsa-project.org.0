Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C054685BC
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 15:44:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E45A825A3;
	Sat,  4 Dec 2021 15:44:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E45A825A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638629099;
	bh=K41FuM+GZd+xNfwsGsdQfZhxmP1i4d6V6RxOahu83ic=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O6LPHwbczspSwPKrY8wu24/7DbiIr4q9ymKXcn5wUMUE8HloIl0xD2eyF8NiCNW5U
	 O76n2cK1WT8LQLvSbyTKxkTkz8qXKcmKA7Tj/vQi6D1mu/dXKQLDe4OAQ1vTHZSW78
	 9zsWrTWcYsqXebMLVG1CyKenLYdYZ8BPMOHMn9Y4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6644F8057D;
	Sat,  4 Dec 2021 15:38:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21BD3F8053B; Sat,  4 Dec 2021 15:38:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02CAAF80511
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 15:37:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02CAAF80511
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kv2emZJW"
Received: by mail-lf1-x12f.google.com with SMTP id f18so13796706lfv.6
 for <alsa-devel@alsa-project.org>; Sat, 04 Dec 2021 06:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zkcS7+n1gGRETsbxAVke0DfOgp5thJ9O9vqlNwbymZo=;
 b=kv2emZJWkJTujeoo/B8BstrOBYDbdGuc57GGc8hkUquVLVp7bDCUL0DA66kijcAH4d
 449pqpwpZ7zRfpKur2KGwMDOT83ItGf7l4k8LZqZ4+gDcYkwgJEYGmynkTnBe87KvUxb
 AH2KPgQUXa+hgf7DM4Gaz2mzuoRnSH5ncsgC/IEKy5ajMCFv/bWRMCsRshodRtdQkVJ/
 4v3Hc87NywbXLwSnsaPCBWits7Pn0gRwoi3FnE5VxRxLwqh9KXcGHwz0OzreXND/ffS9
 lGPytKHmoxALxblmGh6K0pZneN6lIvsGcYjrUHVyHyLo/kZKu+/r7aPdwnfNPl48nAGA
 iaog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zkcS7+n1gGRETsbxAVke0DfOgp5thJ9O9vqlNwbymZo=;
 b=eKpuft5s29Q2Kc0xnALMAh+4dIIn6154Ies+AwwSHOcJcwG3Dcu8zRnBvQKXA1ikc/
 Onir3NMPJu5rnqJYUkvdZyc4fU6jndrcueSQ6QFowakl80WLn05oGn9hfj9ATpos0rOQ
 m9Km/X7aFQ86fkLu1oq+bc5h1taH1B9eCsR9FGuPyI7FGQeCSwwr7oneNlOaPP224wM4
 PC13UOkrsNYv9m9XJJLd6Uw81nkTldSC5ttvMJ6ZZhFgXur+O51ni1uj4DpRtdbu2lwY
 hTboppbd62TjboFzzHDIivqql6mkk38S6dssD/Ph0JevBM3YODWEzKq9XUvPXPCwT/Up
 WHnw==
X-Gm-Message-State: AOAM530+1Q+lU5p2nrfRiggqivg/tXB9EBhXtKnXLfG80l3hLSKRF1RY
 3hcNWEno5V7hucMxaohC9W8=
X-Google-Smtp-Source: ABdhPJxVyr80sNTp3Ra50xhUsVA8jhye5Uem6qk6wXJWErKHgo6ZLg3UwuWsCshEDUsQpvKkvk7WgQ==
X-Received: by 2002:a19:791e:: with SMTP id u30mr24186475lfc.539.1638628666780; 
 Sat, 04 Dec 2021 06:37:46 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:46 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 19/22] ARM: tegra: Add S/PDIF node to Tegra20 device-tree
Date: Sat,  4 Dec 2021 17:37:22 +0300
Message-Id: <20211204143725.31646-20-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204143725.31646-1-digetx@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
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

