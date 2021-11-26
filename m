Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F164045F1D9
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Nov 2021 17:26:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A0F71ACE;
	Fri, 26 Nov 2021 17:26:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A0F71ACE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637944015;
	bh=2uXCgcmnLPw/UxUc6tU22WhvW6eiURJr8LMnJ4vK018=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BbPh5Uf2/WNkBASn2dC5YP3+997XC+XbH1QEqS4ZbH3a0pnC/kT1gNEfOGP6hSPV6
	 4dlWi36pvh7lv2K22jkDHvvTwajEnyaxqUNI8JojSiumtdjYxraRlP8jNXz6qia6dL
	 8eVikPqgfDCn7vY0w4N+WR6yrkttwUP9Oz0UXTlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE27FF80571;
	Fri, 26 Nov 2021 17:20:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E94F6F80517; Fri, 26 Nov 2021 17:20:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02E97F80508
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 17:20:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02E97F80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="o1DWMEb1"
Received: by mail-lf1-x130.google.com with SMTP id k37so25546028lfv.3
 for <alsa-devel@alsa-project.org>; Fri, 26 Nov 2021 08:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n2CS486VK3pErXweLhn8rqAyzxInSDaJTqOjIWkbv/Q=;
 b=o1DWMEb1T5JGVr+QWfi0T8rJPO9ShLpM0eQbXgMMr1Ed0qb2n7CzvFC7hCAawvCPjx
 FV77MEtaOndwrCgVn5Sl4KDEhJsbBKzAxNGNRXVBjPaL/LmhyrnWk260AE3Kij5qsMxv
 WaEC377zdSgBY0l6XBQdtMnvb65ENAdKn+3FvcPi/297odNW3wdI6m3NJI+lf72WHljj
 EVyvLb6/gON+hYDViwFpZGMAbtDN6k8BbdmGS2dSfkwbEVaklbvQsAgfgDnwTBcx6lTG
 HnR5BI5gcu1hbvTRG2a3Rbio74zanVGBd4Pj8kVpHVZ9Er58G3FegIsKtV4ByQChJjjw
 EDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n2CS486VK3pErXweLhn8rqAyzxInSDaJTqOjIWkbv/Q=;
 b=lNYF4i9xbwnbYJaJpp7PyPwCxsln8DNKcYupEIzbSqpj4e1xrQ2ebabljCOnvL1Ip5
 5DIeuEg7OxNIOkMf5DDk5aFr9hKoRSxcyxZDux9U/2vDtpcXMNzo2reA0ZUyMNBRqffK
 BlpCpMO7o5KypSVyRJ/LnbUsFQbkAujhHwiAyOgwMTA3g7mBMqRFXtlQnAjSYJ46D2Un
 wwTe0t6VnZ89YCBLwWY3FP17L+RguYzAuGLkhQv5uYNVZNTD5P8+8690dMyoj4ncqPAR
 F0lfnJ/d7OgzCVHPAimuaz7/3XYTyITbCobFCBtyfJl7hD3yu44hBObURGt6tFZM9QzZ
 p2vA==
X-Gm-Message-State: AOAM532Q/g9cjyMPN6KGMXWnGIUqjBy4KDefammP7Sef/Za2s9DG2Kdv
 wRtXNY6tIsq6+g6RmPKrKHg=
X-Google-Smtp-Source: ABdhPJxufa09SdYBqo/kYgmkWvAdAZeSGh63a/rnmEQbEH51oFmeKfaB2ac9qq451gtYc6UF3a/UoQ==
X-Received: by 2002:ac2:4571:: with SMTP id k17mr29916266lfm.631.1637943598334; 
 Fri, 26 Nov 2021 08:19:58 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:57 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 18/20] ARM: tegra: Add HDMI audio graph to Tegra20
 device-tree
Date: Fri, 26 Nov 2021 19:18:05 +0300
Message-Id: <20211126161807.15776-19-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
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

Add HDMI audio graph to Tegra20 device-tree to enable HDMI audio on
Tegra20 devices.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 799da7dc929b..a2cdc591b4be 100644
--- a/arch/arm/boot/dts/tegra20.dtsi
+++ b/arch/arm/boot/dts/tegra20.dtsi
@@ -186,7 +186,7 @@ rgb {
 			};
 		};
 
-		hdmi@54280000 {
+		tegra_hdmi: hdmi@54280000 {
 			compatible = "nvidia,tegra20-hdmi";
 			reg = <0x54280000 0x00040000>;
 			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
@@ -1063,4 +1063,24 @@ pmu {
 		interrupt-affinity = <&{/cpus/cpu@0}>,
 				     <&{/cpus/cpu@1}>;
 	};
+
+	sound-hdmi {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "NVIDIA Tegra20 HDMI";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		simple-audio-card,dai-link@0 {
+			reg = <0>;
+
+			cpu {
+				sound-dai = <&tegra_spdif>;
+			};
+
+			codec {
+				sound-dai = <&tegra_hdmi>;
+			};
+		};
+	};
 };
-- 
2.33.1

