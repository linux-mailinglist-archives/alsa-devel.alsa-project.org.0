Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3412FB4E7
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 10:32:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4643187D;
	Tue, 19 Jan 2021 10:31:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4643187D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611048741;
	bh=vdkSpH/7lspvEHsOEIgQQ3Rpz4UTuc0RmPaf8fh26QE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p548G3NYjCvPCxuS05PoPa3Tf3utsENG5LYlQOrY680NuhazjUk5gIlPvSmILSgr6
	 EzJT650bCLStWKv3kcmyHk8V+swkeMKJTrk/L2El8dl2JEQCWnQUY07sQurDABXMnu
	 BPhLK01ow0Nszqzdj9XBniSS9XlAVRdNHGrfoBwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B93C2F804DF;
	Tue, 19 Jan 2021 10:29:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C4C6F802BE; Tue, 19 Jan 2021 10:29:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2035AF800FE
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 10:29:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2035AF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="jNUNUsm+"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6006a65b0007>; Tue, 19 Jan 2021 01:28:59 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Jan
 2021 09:28:59 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 19 Jan 2021 09:28:55 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <thierry.reding@gmail.com>
Subject: [RESEND PATCH v6 6/6] arm64: tegra: Audio graph sound card for Jetson
 Nano and TX1
Date: Tue, 19 Jan 2021 14:58:16 +0530
Message-ID: <1611048496-24650-7-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611048539; bh=7Xf2p7q6sLj/nHibZUjeyNnHhKjOwsiJG8GjpwoFLzg=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=jNUNUsm+3xhMKMb6vXU4TLnmOBV4MQZf0YQ8VMmmPbeVCB557bynunD6ziKW4KhaA
 6JfTERAnFRO6/a2okVEH6ws7zJOhiuFde8J+JC7L/PKJCmMI4SHnawr/Z9wvvB/USV
 pinSPON81Qnjpmr/tYH4fG1xr2Vv07AzNmhLiSOlpXG6YGHzp6SMB6aKTDcXwq+G0V
 GOePii8TDEMP2+OCCnmOYDxVQ/j3MjR2cPlr/f59Qox9/odYUMhG3+u2Jiw+Z2sesY
 WbcJMOhPVGUafJ5RNb5RrfQr/h/pckbEdH/XokhY1A1jnYNvs3MTekAX1Drelrze6i
 sAxSdlFgZLKxQ==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
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

Enable support for audio-graph based sound card on Jetson-Nano and
Jetson-TX1. Depending on the platform, required I/O interfaces are
enabled.

 * Jetson-Nano: Enable I2S3, I2S4, DMIC1 and DMIC2.
 * Jetson-TX1: Enable all I2S and DMIC interfaces.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 262 +++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 146 ++++++++++++
 2 files changed, 408 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index 69102dc..747ab93 100644
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
+			i2s1_dap_ep: endpoint {
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
+			i2s2_dap_ep: endpoint {
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
+			i2s4_dap_ep: endpoint {
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
+			i2s5_dap_ep: endpoint {
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
+			dmic1_dap_ep: endpoint {
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
+			dmic2_dap_ep: endpoint {
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
+			dmic3_dap_ep: endpoint {
+				/* Placeholder for external Codec */
+			};
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 6a877de..0c917a1 100644
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
+			i2s4_dap_ep: endpoint@0 {
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
+			dmic1_dap_ep: endpoint@0 {
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
+			dmic2_dap_ep: endpoint@0 {
+				/* Placeholder for external Codec */
+			};
+		};
+	};
 };
-- 
2.7.4

