Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D823308881
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 12:46:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36E7316C2;
	Fri, 29 Jan 2021 12:45:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36E7316C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611920775;
	bh=XnArUuAfCzqdjXI/TcSixGSUSxApOeJWPqowQGxzkXI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M6EbFe8kBDrb/laUZZKkPMuuDsbzBPSgnXSttalMw1yfOGxmXBIRHsacFvRxUjy5q
	 uUXoV8ATDgXiFMcgpw7ixsJELFzFClcpNg3KkF/xpNAU+6VtH/SAcXJ+U5ZS7rGoLL
	 VxOz0IyEE5Kt2FF+6CMNgUqfVQTJpK/3lh/tiC7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8D14F80516;
	Fri, 29 Jan 2021 12:42:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70823F80515; Fri, 29 Jan 2021 12:42:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 117D3F804F3
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 12:42:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 117D3F804F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="o/29ra36"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6013f4910002>; Fri, 29 Jan 2021 03:42:09 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 11:42:08 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 29 Jan 2021 11:42:05 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <thierry.reding@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH 8/8] arm64: tegra: Audio graph sound card for Jetson AGX Xavier
Date: Fri, 29 Jan 2021 17:11:10 +0530
Message-ID: <1611920470-24225-9-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611920470-24225-1-git-send-email-spujar@nvidia.com>
References: <1611920470-24225-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611920529; bh=akmmlr0wsZsNq9ApnF5DPhblyOfetF66zucpPUh//F4=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=o/29ra361/uKDegIfD0a6Bmx8TXCA15fHr5oWdF2GkLgGT4zb9uNNZ2p8h2FLDR6Q
 4yFOg9kS7nCqp/xXB6QAaBLaqWY/jR5mG7FeedoVMkw/uZj28iwkaKjJXoaYVLeXUt
 sC1ftXChEvUXJGcXfl9Eq7/EcrGjzk1D4d/BmlvoN7cYeblPlw+/XZfO9Ii+8RIX3+
 NFnr4hSN+UTmKKrXrejMuvaOPKsE9XscjAmyNyG6v4MNoenYcrs98JXzRKNn+jofl6
 oYkfsqJrNfvQO9CIF8V9aOpu4ilgHhMCyNZ4Wy4ABfkFSXY5RQdiIEi5m4ZJ+F/S6x
 BhVa+X2ciIxSA==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Sameer Pujar <spujar@nvidia.com>,
 jonathanh@nvidia.com, sharadg@nvidia.com, linux-tegra@vger.kernel.org
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

Enable support for audio-graph based sound card on Jetson AGX Xavier.
Following I/O interfaces are enabled.
  * I2S1, I2S2, I2S4 and I2S6
  * DMIC3

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 453 +++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  20 +
 2 files changed, 473 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 36f19c9..bd7ee4c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -21,6 +21,410 @@
 			interrupt-controller@2a40000 {
 				status = "okay";
 			};
+
+			ahub@2900800 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0x0>;
+						xbar_admaif0_ep: endpoint {
+							remote-endpoint = <&admaif0_ep>;
+						};
+					};
+					port@1 {
+						reg = <0x1>;
+						xbar_admaif1_ep: endpoint {
+							remote-endpoint = <&admaif1_ep>;
+						};
+					};
+					port@2 {
+						reg = <0x2>;
+						xbar_admaif2_ep: endpoint {
+							remote-endpoint = <&admaif2_ep>;
+						};
+					};
+					port@3 {
+						reg = <0x3>;
+						xbar_admaif3_ep: endpoint {
+							remote-endpoint = <&admaif3_ep>;
+						};
+					};
+					port@4 {
+						reg = <0x4>;
+						xbar_admaif4_ep: endpoint {
+							remote-endpoint = <&admaif4_ep>;
+						};
+					};
+					port@5 {
+						reg = <0x5>;
+						xbar_admaif5_ep: endpoint {
+							remote-endpoint = <&admaif5_ep>;
+						};
+					};
+					port@6 {
+						reg = <0x6>;
+						xbar_admaif6_ep: endpoint {
+							remote-endpoint = <&admaif6_ep>;
+						};
+					};
+					port@7 {
+						reg = <0x7>;
+						xbar_admaif7_ep: endpoint {
+							remote-endpoint = <&admaif7_ep>;
+						};
+					};
+					port@8 {
+						reg = <0x8>;
+						xbar_admaif8_ep: endpoint {
+							remote-endpoint = <&admaif8_ep>;
+						};
+					};
+					port@9 {
+						reg = <0x9>;
+						xbar_admaif9_ep: endpoint {
+							remote-endpoint = <&admaif9_ep>;
+						};
+					};
+					port@a {
+						reg = <0xa>;
+						xbar_admaif10_ep: endpoint {
+							remote-endpoint = <&admaif10_ep>;
+						};
+					};
+					port@b {
+						reg = <0xb>;
+						xbar_admaif11_ep: endpoint {
+							remote-endpoint = <&admaif11_ep>;
+						};
+					};
+					port@c {
+						reg = <0xc>;
+						xbar_admaif12_ep: endpoint {
+							remote-endpoint = <&admaif12_ep>;
+						};
+					};
+					port@d {
+						reg = <0xd>;
+						xbar_admaif13_ep: endpoint {
+							remote-endpoint = <&admaif13_ep>;
+						};
+					};
+					port@e {
+						reg = <0xe>;
+						xbar_admaif14_ep: endpoint {
+							remote-endpoint = <&admaif14_ep>;
+						};
+					};
+					port@f {
+						reg = <0xf>;
+						xbar_admaif15_ep: endpoint {
+							remote-endpoint = <&admaif15_ep>;
+						};
+					};
+					port@10 {
+						reg = <0x10>;
+						xbar_admaif16_ep: endpoint {
+							remote-endpoint = <&admaif16_ep>;
+						};
+					};
+					port@11 {
+						reg = <0x11>;
+						xbar_admaif17_ep: endpoint {
+							remote-endpoint = <&admaif17_ep>;
+						};
+					};
+					port@12 {
+						reg = <0x12>;
+						xbar_admaif18_ep: endpoint {
+							remote-endpoint = <&admaif18_ep>;
+						};
+					};
+					port@13 {
+						reg = <0x13>;
+						xbar_admaif19_ep: endpoint {
+							remote-endpoint = <&admaif19_ep>;
+						};
+					};
+					xbar_i2s1_port: port@14 {
+						reg = <0x14>;
+						xbar_i2s1_ep: endpoint {
+							remote-endpoint = <&i2s1_cif_ep>;
+						};
+					};
+					xbar_i2s2_port: port@15 {
+						reg = <0x15>;
+						xbar_i2s2_ep: endpoint {
+							remote-endpoint = <&i2s2_cif_ep>;
+						};
+					};
+					xbar_i2s4_port: port@17 {
+						reg = <0x17>;
+						xbar_i2s4_ep: endpoint {
+							remote-endpoint = <&i2s4_cif_ep>;
+						};
+					};
+					xbar_i2s6_port: port@19 {
+						reg = <0x19>;
+						xbar_i2s6_ep: endpoint {
+							remote-endpoint = <&i2s6_cif_ep>;
+						};
+					};
+					xbar_dmic3_port: port@1c {
+						reg = <0x1c>;
+						xbar_dmic3_ep: endpoint {
+							remote-endpoint = <&dmic3_cif_ep>;
+						};
+					};
+				};
+
+				admaif@290f000 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						admaif0_port: port@0 {
+							reg = <0x0>;
+							admaif0_ep: endpoint {
+								remote-endpoint = <&xbar_admaif0_ep>;
+							};
+						};
+						admaif1_port: port@1 {
+							reg = <0x1>;
+							admaif1_ep: endpoint {
+								remote-endpoint = <&xbar_admaif1_ep>;
+							};
+						};
+						admaif2_port: port@2 {
+							reg = <0x2>;
+							admaif2_ep: endpoint {
+								remote-endpoint = <&xbar_admaif2_ep>;
+							};
+						};
+						admaif3_port: port@3 {
+							reg = <0x3>;
+							admaif3_ep: endpoint {
+								remote-endpoint = <&xbar_admaif3_ep>;
+							};
+						};
+						admaif4_port: port@4 {
+							reg = <0x4>;
+							admaif4_ep: endpoint {
+								remote-endpoint = <&xbar_admaif4_ep>;
+							};
+						};
+						admaif5_port: port@5 {
+							reg = <0x5>;
+							admaif5_ep: endpoint {
+								remote-endpoint = <&xbar_admaif5_ep>;
+							};
+						};
+						admaif6_port: port@6 {
+							reg = <0x6>;
+							admaif6_ep: endpoint {
+								remote-endpoint = <&xbar_admaif6_ep>;
+							};
+						};
+						admaif7_port: port@7 {
+							reg = <0x7>;
+							admaif7_ep: endpoint {
+								remote-endpoint = <&xbar_admaif7_ep>;
+							};
+						};
+						admaif8_port: port@8 {
+							reg = <0x8>;
+							admaif8_ep: endpoint {
+								remote-endpoint = <&xbar_admaif8_ep>;
+							};
+						};
+						admaif9_port: port@9 {
+							reg = <0x9>;
+							admaif9_ep: endpoint {
+								remote-endpoint = <&xbar_admaif9_ep>;
+							};
+						};
+						admaif10_port: port@a {
+							reg = <0xa>;
+							admaif10_ep: endpoint {
+								remote-endpoint = <&xbar_admaif10_ep>;
+							};
+						};
+						admaif11_port: port@b {
+							reg = <0xb>;
+							admaif11_ep: endpoint {
+								remote-endpoint = <&xbar_admaif11_ep>;
+							};
+						};
+						admaif12_port: port@c {
+							reg = <0xc>;
+							admaif12_ep: endpoint {
+								remote-endpoint = <&xbar_admaif12_ep>;
+							};
+						};
+						admaif13_port: port@d {
+							reg = <0xd>;
+							admaif13_ep: endpoint {
+								remote-endpoint = <&xbar_admaif13_ep>;
+							};
+						};
+						admaif14_port: port@e {
+							reg = <0xe>;
+							admaif14_ep: endpoint {
+								remote-endpoint = <&xbar_admaif14_ep>;
+							};
+						};
+						admaif15_port: port@f {
+							reg = <0xf>;
+							admaif15_ep: endpoint {
+								remote-endpoint = <&xbar_admaif15_ep>;
+							};
+						};
+						admaif16_port: port@10 {
+							reg = <0x10>;
+							admaif16_ep: endpoint {
+								remote-endpoint = <&xbar_admaif16_ep>;
+							};
+						};
+						admaif17_port: port@11 {
+							reg = <0x11>;
+							admaif17_ep: endpoint {
+								remote-endpoint = <&xbar_admaif17_ep>;
+							};
+						};
+						admaif18_port: port@12 {
+							reg = <0x12>;
+							admaif18_ep: endpoint {
+								remote-endpoint = <&xbar_admaif18_ep>;
+							};
+						};
+						admaif19_port: port@13 {
+							reg = <0x13>;
+							admaif19_ep: endpoint {
+								remote-endpoint = <&xbar_admaif19_ep>;
+							};
+						};
+					};
+				};
+
+				i2s@2901000 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+							i2s1_cif_ep: endpoint {
+								remote-endpoint = <&xbar_i2s1_ep>;
+							};
+						};
+						i2s1_port: port@1 {
+							reg = <1>;
+							i2s1_dap_ep: endpoint {
+								dai-format = "i2s";
+								remote-endpoint = <&rt5658_ep>;
+							};
+						};
+					};
+				};
+
+				i2s@2901100 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+							i2s2_cif_ep: endpoint {
+								remote-endpoint = <&xbar_i2s2_ep>;
+							};
+						};
+						i2s2_port: port@1 {
+							reg = <1>;
+							i2s2_dap_ep: endpoint {
+								dai-format = "i2s";
+								/* Place holder for external Codec */
+							};
+						};
+					};
+				};
+
+				i2s@2901300 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+							i2s4_cif_ep: endpoint {
+								remote-endpoint = <&xbar_i2s4_ep>;
+							};
+						};
+						i2s4_port: port@1 {
+							reg = <1>;
+							i2s4_dap_ep: endpoint {
+								dai-format = "i2s";
+								/* Place holder for external Codec */
+							};
+						};
+					};
+				};
+
+				i2s@2901500 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+							i2s6_cif_ep: endpoint {
+								remote-endpoint = <&xbar_i2s6_ep>;
+							};
+						};
+						i2s6_port: port@1 {
+							reg = <1>;
+							i2s6_dap_ep: endpoint@0 {
+								dai-format = "i2s";
+								/* Place holder for external Codec */
+							};
+						};
+					};
+				};
+
+				dmic@2904200 {
+					status = "okay";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+							dmic3_cif_ep: endpoint {
+								remote-endpoint = <&xbar_dmic3_ep>;
+							};
+						};
+						dmic3_port: port@1 {
+							reg = <1>;
+							dmic3_dap_ep: endpoint {
+								/* Place holder for external Codec */
+							};
+						};
+					};
+				};
+			};
 		};
 
 		i2c@3160000 {
@@ -53,6 +457,14 @@
 				interrupts = <TEGRA194_MAIN_GPIO(S, 5) GPIO_ACTIVE_HIGH>;
 				realtek,jd-src = <2>;
 				sound-name-prefix = "CVB-RT";
+
+				port {
+					rt5658_ep: endpoint {
+						remote-endpoint = <&i2s1_dap_ep>;
+						mclk-fs = <256>;
+						clocks = <&bpmp TEGRA194_CLK_AUD_MCLK>;
+					};
+				};
 			};
 		};
 
@@ -66,6 +478,47 @@
 			status = "okay";
 		};
 
+		sound {
+			compatible = "nvidia,tegra186-audio-graph-card";
+			status = "okay";
+
+			dais = /* ADMAIF (FE) Ports */
+			       <&admaif0_port>, <&admaif1_port>, <&admaif2_port>, <&admaif3_port>,
+			       <&admaif4_port>, <&admaif5_port>, <&admaif6_port>, <&admaif7_port>,
+			       <&admaif8_port>, <&admaif9_port>, <&admaif10_port>, <&admaif11_port>,
+			       <&admaif12_port>, <&admaif13_port>, <&admaif14_port>, <&admaif15_port>,
+			       <&admaif16_port>, <&admaif17_port>, <&admaif18_port>, <&admaif19_port>,
+			       /* XBAR Ports */
+			       <&xbar_i2s1_port>, <&xbar_i2s2_port>, <&xbar_i2s4_port>,
+			       <&xbar_i2s6_port>, <&xbar_dmic3_port>,
+			       /* BE I/O Ports */
+			       <&i2s1_port>, <&i2s2_port>, <&i2s4_port>, <&i2s6_port>,
+			       <&dmic3_port>;
+
+			label = "jetson-xavier-ape";
+
+			widgets =
+				"Microphone",	"CVB-RT MIC Jack",
+				"Microphone",	"CVB-RT MIC",
+				"Headphone",	"CVB-RT HP Jack",
+				"Speaker",	"CVB-RT SPK";
+
+			routing =
+				/* I2S1 <-> RT5658 */
+				"CVB-RT AIF1 Playback",	"I2S1 DAP-Playback",
+				"I2S1 DAP-Capture",	"CVB-RT AIF1 Capture",
+				/* RT5658 Codec controls */
+				"CVB-RT HP Jack",	"CVB-RT HPO L Playback",
+				"CVB-RT HP Jack",	"CVB-RT HPO R Playback",
+				"CVB-RT IN1P",		"CVB-RT MIC Jack",
+				"CVB-RT IN2P",		"CVB-RT MIC Jack",
+				"CVB-RT SPK",		"CVB-RT SPO Playback",
+				"CVB-RT DMIC L1",	"CVB-RT MIC",
+				"CVB-RT DMIC L2",	"CVB-RT MIC",
+				"CVB-RT DMIC R1",	"CVB-RT MIC",
+				"CVB-RT DMIC R2",	"CVB-RT MIC";
+		};
+
 		padctl@3520000 {
 			status = "okay";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 852980f..04b5e4a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -824,6 +824,26 @@
 			status = "disabled";
 		};
 
+		sound {
+			status = "disabled";
+
+			clocks = <&bpmp TEGRA194_CLK_PLLA>,
+				 <&bpmp TEGRA194_CLK_PLLA_OUT0>;
+			clock-names = "pll_a", "plla_out0";
+			assigned-clocks = <&bpmp TEGRA194_CLK_PLLA>,
+					  <&bpmp TEGRA194_CLK_PLLA_OUT0>,
+					  <&bpmp TEGRA194_CLK_AUD_MCLK>;
+			assigned-clock-parents = <0>,
+						 <&bpmp TEGRA194_CLK_PLLA>,
+						 <&bpmp TEGRA194_CLK_PLLA_OUT0>;
+			/*
+			 * PLLA supports dynamic ramp. Below initial rate is chosen
+			 * for this to work and oscillate between base rates required
+			 * for 8x and 11.025x sample rate streams.
+			 */
+			assigned-clock-rates = <258000000>;
+		};
+
 		xusb_padctl: padctl@3520000 {
 			compatible = "nvidia,tegra194-xusb-padctl";
 			reg = <0x03520000 0x1000>,
-- 
2.7.4

