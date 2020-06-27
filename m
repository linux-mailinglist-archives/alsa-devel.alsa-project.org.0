Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C38AB20BEC5
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jun 2020 07:09:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7176F1685;
	Sat, 27 Jun 2020 07:08:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7176F1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593234588;
	bh=0NKdtRcIQe6J4MxUfLfMwE8Ey+CZkIr1fvJyHZFFZ4E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ScolBHSLOQ1BUTTAFJeSvg8Iuurw6Lye7BcSirfbcFgz/g7X0PEyxTuJUGGdcW/bU
	 KFw+b9b5k+s8A/BbqN4IWgx14uBU75goXHGRVJNWxqJu8OronnWQq4PV0sfIIdGyxf
	 LKeheZwLBHzOxtieuuAiop8aPAI4NDMqxd9icGH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C4B3F803BD;
	Sat, 27 Jun 2020 06:56:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7046FF803B2; Sat, 27 Jun 2020 06:56:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38CF0F8037F
 for <alsa-devel@alsa-project.org>; Sat, 27 Jun 2020 06:56:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38CF0F8037F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="ddLfQ6Zq"
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef6d1680000>; Fri, 26 Jun 2020 21:56:09 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 26 Jun 2020 21:56:21 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 26 Jun 2020 21:56:21 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 27 Jun
 2020 04:56:21 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sat, 27 Jun 2020 04:56:21 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ef6d1700001>; Fri, 26 Jun 2020 21:56:20 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH v4 23/23] arm64: tegra: Add support for APE sound card on
 Jetson Nano and TX1
Date: Sat, 27 Jun 2020 10:23:45 +0530
Message-ID: <1593233625-14961-24-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593233769; bh=taGJx4bnloUgV2sDI2d4cd/qcV9qYym60K4y+pWho+I=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Type;
 b=ddLfQ6ZqgcJjKddkhaXM+i6RtbI0Dj80XmVHjRcUwn0osUbF1Cu38zjubnmUFsLH2
 uEiAeafhsLn3CkzUVJB69CHPogvF7dMtAa5e4qCg84Y8kB0x19mr/lerMbRfCQJXaX
 7BOLLueVWOH/vnWTwd2FCySGciMOD4n63HOPUMVVk1Qw0sLkvw2fXvKBc7Kkc2UJTc
 NM0nuWCVNxLDz8QUS7LE0FFo3/QxfmXFphZdpgHlknF8xpl8vIFpUuJqnFQ5PHw0AB
 qTGDZuiN5RqpEHLO3x+m6kYy/wgFz46gHrSX3UXYmRtskm+VlJuUPsPtw3JJhOG+Tl
 6Bagn6CFRAwbQ==
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, swarren@nvidia.com,
 Sameer Pujar <spujar@nvidia.com>, nwartikar@nvidia.com,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, thierry.reding@gmail.com, atalambedu@nvidia.com,
 linux-tegra@vger.kernel.org, digetx@gmail.com, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
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

This adds APE sound card support on Jetson Nano and TX1 which is based
on simple-card driver. Earlier in the series simple-card driver is
enhanced to work with multiple ASoC components. Based on board design
required I/O interfaces are exposed for I2S and DMIC. More complicated
audio paths will be added going forward.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 94 ++++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 49 +++++++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 67 +++++++++++++++
 3 files changed, 210 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index 3c21137..7c4b521 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -166,4 +166,98 @@
 			};
 		};
 	};
+
+	tegra_sound {
+		status = "okay";
+
+		simple-audio-card,name = "jetson-tx1-ape";
+
+		simple-audio-card,widgets =
+			"Microphone",   "MIC",
+			"Speaker",	"SPK";
+
+		simple-audio-card,routing =
+			"SPK",		  "I2S1 Playback",
+			"SPK",		  "I2S2 Playback",
+			"SPK",		  "I2S3 Playback",
+			"SPK",		  "I2S4 Playback",
+			"SPK",		  "I2S5 Playback",
+			"I2S1 Capture",   "MIC",
+			"I2S2 Capture",   "MIC",
+			"I2S3 Capture",   "MIC",
+			"I2S4 Capture",   "MIC",
+			"I2S5 Capture",   "MIC",
+			"DMIC1 Capture",  "MIC",
+			"DMIC2 Capture",  "MIC",
+			"DMIC3 Capture",  "MIC";
+
+		/* BE links */
+		simple-audio-card,dai-link@1 {
+			format = "i2s";
+			bitclock-master = <&cpu_i2s1>;
+			frame-master = <&cpu_i2s1>;
+
+			cpu_i2s1: cpu@0 {
+				sound-dai = <&tegra_i2s1 0>;
+			};
+		};
+
+		simple-audio-card,dai-link@2 {
+			format = "i2s";
+			bitclock-master = <&cpu_i2s2>;
+			frame-master = <&cpu_i2s2>;
+
+			cpu_i2s2: cpu@0 {
+				sound-dai = <&tegra_i2s2 0>;
+			};
+		};
+
+		simple-audio-card,dai-link@3 {
+			format = "i2s";
+			bitclock-master = <&cpu_i2s3>;
+			frame-master = <&cpu_i2s3>;
+
+			cpu_i2s3: cpu@0 {
+				sound-dai = <&tegra_i2s3 0>;
+			};
+		};
+
+		simple-audio-card,dai-link@4 {
+			format = "i2s";
+			bitclock-master = <&cpu_i2s4>;
+			frame-master = <&cpu_i2s4>;
+
+			cpu_i2s4: cpu@0 {
+				sound-dai = <&tegra_i2s4 0>;
+			};
+		};
+
+		simple-audio-card,dai-link@5 {
+			format = "i2s";
+			bitclock-master = <&cpu_i2s5>;
+			frame-master = <&cpu_i2s5>;
+
+			cpu_i2s5: cpu@0 {
+				sound-dai = <&tegra_i2s5 0>;
+			};
+		};
+
+		simple-audio-card,dai-link@6 {
+			cpu@0 {
+				sound-dai = <&tegra_dmic1 0>;
+			};
+		};
+
+		simple-audio-card,dai-link@7 {
+			cpu@0 {
+				sound-dai = <&tegra_dmic2 0>;
+			};
+		};
+
+		simple-audio-card,dai-link@8 {
+			cpu@0 {
+				sound-dai = <&tegra_dmic3 0>;
+			};
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 721f66c..31994f6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -842,4 +842,53 @@
 			};
 		};
 	};
+
+	tegra_sound {
+		status = "okay";
+
+		simple-audio-card,name = "jetson-nano-ape";
+		simple-audio-card,widgets =
+			"Microphone",   "MIC",
+			"Speaker",	"SPK";
+		simple-audio-card,routing =
+			"SPK",		  "I2S3 Playback",
+			"SPK",		  "I2S4 Playback",
+			"I2S3 Capture",   "MIC",
+			"I2S4 Capture",   "MIC",
+			"DMIC1 Capture",  "MIC",
+			"DMIC2 Capture",  "MIC";
+
+		/* BE links */
+		simple-audio-card,dai-link@1 {
+			format = "i2s";
+			bitclock-master = <&cpu_i2s1>;
+			frame-master = <&cpu_i2s1>;
+
+			cpu_i2s1: cpu@0 {
+				sound-dai = <&tegra_i2s3 0>;
+			};
+		};
+
+		simple-audio-card,dai-link@2 {
+			format = "i2s";
+			bitclock-master = <&cpu_i2s2>;
+			frame-master = <&cpu_i2s2>;
+
+			cpu_i2s2: cpu@0 {
+				sound-dai = <&tegra_i2s4 0>;
+			};
+		};
+
+		simple-audio-card,dai-link@3 {
+			cpu@0 {
+				sound-dai = <&tegra_dmic1 0>;
+			};
+		};
+
+		simple-audio-card,dai-link@4 {
+			cpu@0 {
+				sound-dai = <&tegra_dmic2 0>;
+			};
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 73ae58f..f1925f1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1841,4 +1841,71 @@
 			};
 		};
 	};
+
+	tegra_sound {
+		status = "disabled";
+
+		compatible = "simple-cc-audio-card";
+
+		clocks = <&tegra_car TEGRA210_CLK_PLL_A>,
+			 <&tegra_car TEGRA210_CLK_PLL_A_OUT0>,
+			 <&tegra_car TEGRA210_CLK_EXTERN1>;
+		clock-names = "pll_a", "plla_out0", "aud_mclk";
+		assigned-clocks = <&tegra_car TEGRA210_CLK_PLL_A>,
+				  <&tegra_car TEGRA210_CLK_PLL_A_OUT0>,
+				  <&tegra_car TEGRA210_CLK_EXTERN1>;
+		assigned-clock-parents = <0>, <0>, <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+		assigned-clock-rates = <368640000>, <49152000>, <12288000>;
+
+		simple-audio-card,aux-devs = <&tegra_ahub>;
+
+		/* FE links */
+		simple-audio-card,dai-link@0 {
+			cpu@0 {
+				sound-dai = <&tegra_admaif 0>;
+			};
+
+			cpu@1 {
+				sound-dai = <&tegra_admaif 1>;
+			};
+
+			cpu@2 {
+				sound-dai = <&tegra_admaif 2>;
+			};
+
+			cpu@3 {
+				sound-dai = <&tegra_admaif 3>;
+			};
+
+			cpu@4 {
+				sound-dai = <&tegra_admaif 4>;
+			};
+
+			cpu@5 {
+				sound-dai = <&tegra_admaif 5>;
+			};
+
+			cpu@6 {
+				sound-dai = <&tegra_admaif 6>;
+			};
+
+			cpu@7 {
+				sound-dai = <&tegra_admaif 7>;
+			};
+
+			cpu@8 {
+				sound-dai = <&tegra_admaif 8>;
+			};
+
+			cpu@9 {
+				sound-dai = <&tegra_admaif 9>;
+			};
+
+			/*
+			 * Empty codec list.
+			 * Router MUX controls take care of audio path by
+			 * connecting multiple components.
+			 */
+		};
+	};
 };
-- 
2.7.4

