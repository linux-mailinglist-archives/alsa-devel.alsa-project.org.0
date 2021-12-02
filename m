Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C6D466865
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 17:32:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3345297B;
	Thu,  2 Dec 2021 17:31:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3345297B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638462746;
	bh=96krRvreUm2iu4ydznpueRnlYw6Yvaa39UT/lUYqmo4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PxiffF/J1d0vtJaYV3dVL9+pVmb3+CzzKJG/Sq8GI12uSQVp/dLSqU0L6gnVu585w
	 LRSyiqW3gd/bBXx9FMDu0OK8XeaOuK27YcARvGafykI21vLU/C1441B5AHXeArf/AI
	 8a3Nz7FNBsbIvRJiKs5s8ixrMizGTO2shcSSD3l4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34D34F8058C;
	Thu,  2 Dec 2021 17:25:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBB71F804E2; Thu,  2 Dec 2021 17:25:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15180F800EE
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 17:25:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15180F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PJS5NAph"
Received: by mail-lj1-x22a.google.com with SMTP id k23so785484lje.1
 for <alsa-devel@alsa-project.org>; Thu, 02 Dec 2021 08:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hHEu7xIUmbPKbJQuG/1auedODddNVJ0Qz8PQOApRayA=;
 b=PJS5NAphD8TMG13iWbjMT5Rvd0gBYlUTq3SvIbF/78W43Bl3rA3Jzqx03+4R2FKkuW
 QX5+9/OHFFtwo47h0GMJWQ8u+MGzEs/x1gDGKRNEDMBnayGFJuHhHA4uJSaugJIgUxSx
 hf18OYwSYZY43aGoXqzYOplCl6uOUAOkoPKouEcTNwkhOFrQMo+6oyw0cCZSFEYz6x0f
 KS48Lyto0JhjGWClc6WCbPuAFCkfeUARvdE+O9v1/I9T40gmsT+9ufErgcHwL1jpdZ+g
 x0cSUMSamn2a0xVPPXbTtCtdmbc1jpO6BsDfcLsLCCeIilr4nw4p+Eazzo4VEDab2IZK
 IXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hHEu7xIUmbPKbJQuG/1auedODddNVJ0Qz8PQOApRayA=;
 b=kcHDv2CrW47gfnkk6jM/zvFC7JZIRhUxdZ0xHy5SdQRwMyncP1hR2LpnwhoZPGuv4Y
 bd2Yg5zPehXHKtV5fpqG56FqQkJHOgAJosBC72M4l8C0mUu2QL35qyVcsLhKdUETT3ao
 1T61LcqNrTArSZHtlssE91grkGg3PZbKLaFt+CEsF98O5K+Aw1/v55NhzGngHIXEAgG3
 gdoRLhjIsGZH5VYvVZzaH2qxshN6mnvC1psdcJFGpsX9XVo9jZKVXAi7dB6BTOqLLIPU
 ScvJWekGiJZw2Wxb3DhxMIQut7VwSLhJk5CHJOStUgYFCNACwMc1x7h+Hbrc3UojpMI1
 XQog==
X-Gm-Message-State: AOAM531Wp1swSsOPp9ALyotrte0dRpuu5eJYXpWzv9xxL4kOeKNIF0So
 KHPnfDR6Cp0YK079sM5uUjg=
X-Google-Smtp-Source: ABdhPJx97fEFBmRZTMoe4ceEqyDWsJCVc6i11HIbIt8I0RAFW/psqD4Gy32WAxA2oWW7diz92ZbKUw==
X-Received: by 2002:a2e:8090:: with SMTP id i16mr12623406ljg.125.1638462332604; 
 Thu, 02 Dec 2021 08:25:32 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:32 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 18/20] ARM: tegra: Add HDMI audio graph to Tegra20
 device-tree
Date: Thu,  2 Dec 2021 19:23:39 +0300
Message-Id: <20211202162341.1791-19-digetx@gmail.com>
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

Add HDMI audio graph to Tegra20 device-tree to enable HDMI audio on
Tegra20 devices.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20.dtsi | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
index 72cbe32d0c1d..dde228bcbbff 100644
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

