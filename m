Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 881A245CFE5
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 23:13:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A826182D;
	Wed, 24 Nov 2021 23:12:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A826182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637792009;
	bh=2uXCgcmnLPw/UxUc6tU22WhvW6eiURJr8LMnJ4vK018=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SvEZkqJ27D687ooUyo/PbRAjLiktd9vQh4QwEi+eNhIpRfpGzH5QK8DOpO/mAgxrb
	 wbTmC+GWG/V0QqGdNsYiKP1uS7D05MmYO71GfRj2RSUvco2t/SOVqA9NCJ78hjA9J7
	 Xd4qCxap3pmUaRKoNdk6AmVHRQA3haKIb0HDTFXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04B0EF80567;
	Wed, 24 Nov 2021 23:07:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92D42F80543; Wed, 24 Nov 2021 23:07:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E467FF80510
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 23:06:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E467FF80510
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AzhidqPU"
Received: by mail-lj1-x22e.google.com with SMTP id l9so8412666ljq.5
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 14:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n2CS486VK3pErXweLhn8rqAyzxInSDaJTqOjIWkbv/Q=;
 b=AzhidqPUkoUns8QOS62dAH1aAyY6x8WzVSMaCWSMW/v7EjfiKy6xrqhiqXmtxhUCmC
 /2G7YwfhBCmAhfarvaBJPMX6gaEcOnjUiG+Q+tOfpv7zbn0bRKLu+xWhqlyEz3y9hlU3
 oNRBMFHqkO74xCuNB5bRP5swXj65BF2de/4RtXs86ACsZT4NJiyw0ioVlhTr5kow+TM4
 S76hg0ZNS780AvAd1wHLb00xgPLbneEOhx7vragCXrctYxh4jYNgnW4qHXpytxHBeGrA
 B08iJ56WOCm7lFe5CwvMgy9Jg+21GDCxsdSkFq0eohdxR7psifo27PBS1xxiUThkk1In
 EhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n2CS486VK3pErXweLhn8rqAyzxInSDaJTqOjIWkbv/Q=;
 b=U90gLaGSotG6I7vA0Czj4MlMBy4NTL5eintrm7b/YZ4v8M0pk8W2GXlCLjCMiL7xky
 6ATTazUhVSkW5lffQ6AmgKPxyrYCb4fU8qewX9JQ/niHnN7wbMdBVLjrFwZiKDkHA5TB
 Rbi+Uz+x1NjpthaWBcrjPMefleideBJORSao9oa03TDoVVZGJYXd3z7t2SVkMZPzgozE
 W+e/YkU6C58LOHNPuJOyu22iYbmnbm4B4BZBf31lpYeej6Kn3mVuc+qOn+Cnq7w+B5M0
 e+Op+NokADYE4DEKwFEZrFXuuPfj9hGWqyAp8q/Vaa0txX/YW1ya6+lBfHyfc4bq65+m
 1vQg==
X-Gm-Message-State: AOAM531yN9OB+VsdI+zWySMvjXfOMhBZGy1pIPv+o3ZNaY1ILm8QtDgP
 TNzwbopCAv2UB7mePdsw0nw=
X-Google-Smtp-Source: ABdhPJwRHr0nxYuROaGQUAZSqmgr+yRP+LZJ4IR9xN3LqBlcWJvx+zvAwwT+8xfj2BU3q2YKedVOLw==
X-Received: by 2002:a2e:94d7:: with SMTP id r23mr19197418ljh.224.1637791605366; 
 Wed, 24 Nov 2021 14:06:45 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 14:06:45 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 18/20] ARM: tegra: Add HDMI audio graph to Tegra20
 device-tree
Date: Thu, 25 Nov 2021 01:00:55 +0300
Message-Id: <20211124220057.15763-19-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
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

