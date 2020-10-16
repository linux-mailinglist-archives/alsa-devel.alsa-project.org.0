Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 566222907C5
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Oct 2020 16:51:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E488817E3;
	Fri, 16 Oct 2020 16:51:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E488817E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602859917;
	bh=zqG+PcY+gbvNVJyAN3YmXrv/tA55ga6KLg7RmfRpQzw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pbZLbao5HWsO4e66kMQDIpBN9+bo/Yy9T/bOJuwyKDa9ITaRNaLYA3GEZWc+VLUdC
	 hbkNgRHfmLtWYoYnENCDBpqchf77zCDHZjWVSKA18fdjaA/bcofUB+4XX863k5tToB
	 7rCuLKFkIEXoREDHtrCX6Z9ZjCUg9oGrf8Fa8fyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8338EF80343;
	Fri, 16 Oct 2020 16:45:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24A5DF8033E; Fri, 16 Oct 2020 16:45:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B82DF8033E
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 16:45:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B82DF8033E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="CTyvvR6L"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f89b1e10001>; Fri, 16 Oct 2020 07:44:49 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 14:44:56 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 16 Oct 2020 14:44:50 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>, <pierre-louis.bossart@linux.intel.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <p.zabel@pengutronix.de>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
Subject: [PATCH v4 15/15] arm64: tegra: Audio graph sound card for Jetson Nano
 and TX1
Date: Fri, 16 Oct 2020 20:13:02 +0530
Message-ID: <1602859382-19505-16-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602859489; bh=Zmo3gEQj1Q3iW8/ujdilA5fA/ZPa/RKFHm549VsxnfY=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=CTyvvR6Lx9YH+r3bSF2kJmkRpphh8Yv0KMn83L23xSqHPbA4QQ7IPLgtgHwht1LUF
 3unP0MW5gTkvtdAk/VZq0788gpCeUe2lkWAdK55f7kaExZhL7aOC6sM5Me+i1eXC7W
 zDTLFCaeedAQUe3Kc7B0q0GxTc8VIDO3+XtgGomTfbol9zTSIuXJbh4lPBIxSohpSP
 9l+O0+fw9eylAKLYp1uNAIUNZd7xFudKsbEu13ng2mIF680kR7vEHQE80N8GlJKbMG
 vx1+vpryG3k1oIcQcc3ITjsv/WX4x/WDJexH6Eyuyr/JtNKxG3l0fnA/L5D1Qzli0b
 aZ+Wc1tpqi9ag==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 nicoleotsuka@gmail.com, swarren@nvidia.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, atalambedu@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, nwartikar@nvidia.com, linux-tegra@vger.kernel.org,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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

Enable support for audio-graph based sound card on Jetson-Nano and
Jetson-TX1. Depending on the platform, required I/O interfaces are
enabled.

 * Jetson-Nano: Enable I2S3, I2S4, DMIC1 and DMIC2.
 * Jetson-TX1: Enable all I2S and DMIC interfaces.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 262 +++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 146 ++++++++++++
 2 files changed, 408 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index 4c9c2a0..dab24b4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -3,6 +3,7 @@
 
 #include "tegra210-p2180.dtsi"
 #include "tegra210-p2597.dtsi"
+#include "tegra210-audio-graph.dtsi"
 
 / {
 	model = "NVIDIA Jetson TX1 Developer Kit";
@@ -127,4 +128,265 @@
 			status = "okay";
 		};
 	};
+
+	tegra_sound {
+		status = "okay";
+
+		compatible = "nvidia,tegra210-audio-graph-card";
+
+		dais = /* FE */
+		       <&admaif1_port>, <&admaif2_port>, <&admaif3_port>,
+		       <&admaif4_port>, <&admaif5_port>, <&admaif6_port>,
+		       <&admaif7_port>, <&admaif8_port>, <&admaif9_port>,
+		       <&admaif10_port>,
+		       /* Router */
+		       <&xbar_i2s1_port>, <&xbar_i2s2_port>, <&xbar_i2s3_port>,
+		       <&xbar_i2s4_port>, <&xbar_i2s5_port>, <&xbar_dmic1_port>,
+		       <&xbar_dmic2_port>, <&xbar_dmic3_port>,
+		       /* I/O DAP Ports */
+		       <&i2s1_port>, <&i2s2_port>, <&i2s3_port>, <&i2s4_port>,
+		       <&i2s5_port>, <&dmic1_port>, <&dmic2_port>, <&dmic3_port>;
+
+		label = "jetson-tx1-ape";
+	};
+};
+
+&tegra_admaif {
+	status = "okay";
+};
+
+&tegra_ahub {
+	status = "okay";
+
+	ports {
+		xbar_i2s1_port: port@a {
+			reg = <0xa>;
+			xbar_i2s1_ep: endpoint {
+				remote-endpoint = <&i2s1_cif_ep>;
+			};
+		};
+		xbar_i2s2_port: port@b {
+			reg = <0xb>;
+			xbar_i2s2_ep: endpoint {
+				remote-endpoint = <&i2s2_cif_ep>;
+			};
+		};
+		xbar_i2s3_port: port@c {
+			reg = <0xc>;
+			xbar_i2s3_ep: endpoint {
+				remote-endpoint = <&i2s3_cif_ep>;
+			};
+		};
+		xbar_i2s4_port: port@d {
+			reg = <0xd>;
+			xbar_i2s4_ep: endpoint {
+				remote-endpoint = <&i2s4_cif_ep>;
+			};
+		};
+		xbar_i2s5_port: port@e {
+			reg = <0xe>;
+			xbar_i2s5_ep: endpoint {
+				remote-endpoint = <&i2s5_cif_ep>;
+			};
+		};
+		xbar_dmic1_port: port@f {
+			reg = <0xf>;
+			xbar_dmic1_ep: endpoint {
+				remote-endpoint = <&dmic1_cif_ep>;
+			};
+		};
+		xbar_dmic2_port: port@10 {
+			reg = <0x10>;
+			xbar_dmic2_ep: endpoint {
+				remote-endpoint = <&dmic2_cif_ep>;
+			};
+		};
+		xbar_dmic3_port: port@11 {
+			reg = <0x11>;
+			xbar_dmic3_ep: endpoint {
+				remote-endpoint = <&dmic3_cif_ep>;
+			};
+		};
+	};
+};
+
+&tegra_i2s1 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			i2s1_cif_ep: endpoint {
+				remote-endpoint = <&xbar_i2s1_ep>;
+			};
+		};
+		i2s1_port: port@1 {
+			reg = <1>;
+			i2s1_dap: endpoint {
+				dai-format = "i2s";
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_i2s2 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			i2s2_cif_ep: endpoint {
+				remote-endpoint = <&xbar_i2s2_ep>;
+			};
+		};
+		i2s2_port: port@1 {
+			reg = <1>;
+			i2s2_dap: endpoint {
+				dai-format = "i2s";
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_i2s3 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			i2s3_cif_ep: endpoint {
+				remote-endpoint = <&xbar_i2s3_ep>;
+			};
+		};
+		i2s3_port: port@1 {
+			reg = <1>;
+			i2s3_dap_ep: endpoint {
+				dai-format = "i2s";
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_i2s4 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			i2s4_cif_ep: endpoint {
+				remote-endpoint = <&xbar_i2s4_ep>;
+			};
+		};
+		i2s4_port: port@1 {
+			reg = <1>;
+			i2s4_dap: endpoint {
+				dai-format = "i2s";
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_i2s5 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			i2s5_cif_ep: endpoint {
+				remote-endpoint = <&xbar_i2s5_ep>;
+			};
+		};
+		i2s5_port: port@1 {
+			reg = <1>;
+			i2s5_dap: endpoint {
+				dai-format = "i2s";
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_dmic1 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dmic1_cif_ep: endpoint {
+				remote-endpoint = <&xbar_dmic1_ep>;
+			};
+		};
+		dmic1_port: port@1 {
+			reg = <1>;
+			dmic1_dap: endpoint {
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_dmic2 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dmic2_cif_ep: endpoint {
+				remote-endpoint = <&xbar_dmic2_ep>;
+			};
+		};
+		dmic2_port: port@1 {
+			reg = <1>;
+			dmic2_dap: endpoint {
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_dmic3 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dmic3_cif_ep: endpoint {
+				remote-endpoint = <&xbar_dmic3_ep>;
+			};
+		};
+		dmic3_port: port@1 {
+			reg = <1>;
+			dmic3_dap: endpoint {
+				/* Placeholder for external Codec */
+			};
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 859241d..1216b65c8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -6,6 +6,7 @@
 #include <dt-bindings/mfd/max77620.h>
 
 #include "tegra210.dtsi"
+#include "tegra210-audio-graph.dtsi"
 
 / {
 	model = "NVIDIA Jetson Nano Developer Kit";
@@ -870,4 +871,149 @@
 
 		vin-supply = <&vdd_5v0_sys>;
 	};
+
+	tegra_sound {
+		status = "okay";
+
+		compatible = "nvidia,tegra210-audio-graph-card";
+
+		dais = /* FE */
+		       <&admaif1_port>, <&admaif2_port>, <&admaif3_port>,
+		       <&admaif4_port>, <&admaif5_port>, <&admaif6_port>,
+		       <&admaif7_port>, <&admaif8_port>, <&admaif9_port>,
+		       <&admaif10_port>,
+		       /* Router */
+		       <&xbar_i2s3_port>, <&xbar_i2s4_port>,
+		       <&xbar_dmic1_port>, <&xbar_dmic2_port>,
+		       /* I/O DAP Ports */
+		       <&i2s3_port>, <&i2s4_port>,
+		       <&dmic1_port>, <&dmic2_port>;
+
+		label = "jetson-nano-ape";
+	};
+};
+
+&tegra_admaif {
+	status = "okay";
+};
+
+&tegra_ahub {
+	status = "okay";
+
+	ports {
+		xbar_i2s3_port: port@c {
+			reg = <0xc>;
+			xbar_i2s3_ep: endpoint {
+				remote-endpoint = <&i2s3_cif_ep>;
+			};
+		};
+		xbar_i2s4_port: port@d {
+			reg = <0xd>;
+			xbar_i2s4_ep: endpoint {
+				remote-endpoint = <&i2s4_cif_ep>;
+			};
+		};
+		xbar_dmic1_port: port@f {
+			reg = <0xf>;
+			xbar_dmic1_ep: endpoint {
+				remote-endpoint = <&dmic1_cif_ep>;
+			};
+		};
+		xbar_dmic2_port: port@10 {
+			reg = <0x10>;
+			xbar_dmic2_ep: endpoint {
+				remote-endpoint = <&dmic2_cif_ep>;
+			};
+		};
+	};
+};
+
+&tegra_i2s3 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			i2s3_cif_ep: endpoint {
+				remote-endpoint = <&xbar_i2s3_ep>;
+			};
+		};
+		i2s3_port: port@1 {
+			reg = <1>;
+			i2s3_dap_ep: endpoint {
+				dai-format = "i2s";
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_i2s4 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			i2s4_cif_ep: endpoint {
+				remote-endpoint = <&xbar_i2s4_ep>;
+			};
+		};
+		i2s4_port: port@1 {
+			reg = <1>;
+			i2s4_dap: endpoint@0 {
+				dai-format = "i2s";
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_dmic1 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dmic1_cif_ep: endpoint@0 {
+				remote-endpoint = <&xbar_dmic1_ep>;
+			};
+		};
+		dmic1_port: port@1 {
+			reg = <1>;
+			dmic1_dap: endpoint@0 {
+				/* Placeholder for external Codec */
+			};
+		};
+	};
+};
+
+&tegra_dmic2 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dmic2_cif_ep: endpoint@0 {
+				remote-endpoint = <&xbar_dmic2_ep>;
+			};
+		};
+		dmic2_port: port@1 {
+			reg = <1>;
+			dmic2_dap: endpoint@0 {
+				/* Placeholder for external Codec */
+			};
+		};
+	};
 };
-- 
2.7.4

