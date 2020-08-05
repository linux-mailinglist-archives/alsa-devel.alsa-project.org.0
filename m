Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C1023C51D
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 07:32:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45F501666;
	Wed,  5 Aug 2020 07:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45F501666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596605520;
	bh=H8wm+M4al6eGibtH5sbRaI1cCehpwag32EUM4jqrV40=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jwwthI6mLygsUzzUssxD+2ZS0HGEJMY9LM+cJzNdWq7V0cboDpd3xrEFNzY4A4dRt
	 oBQk+gDfs0AuyjuPPFdiXiiJ04jF/w8H+pDENQiwCygsGq0H69gdtkzazDpfBCntaY
	 elrxrNlr7cEL+S+pAM7lTSYoyrLBbHXR4meSssuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B45E2F8032A;
	Wed,  5 Aug 2020 07:25:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FDDCF80329; Wed,  5 Aug 2020 07:25:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D86AF80323
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 07:25:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D86AF80323
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="kzgoNDou"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f2a42990000>; Tue, 04 Aug 2020 22:24:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 04 Aug 2020 22:25:30 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 04 Aug 2020 22:25:30 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Aug
 2020 05:25:30 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 5 Aug 2020 05:25:30 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f2a42c50004>; Tue, 04 Aug 2020 22:25:29 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH v2 9/9] arm64: tegra: Audio graph sound card for Jetson Nano
 and TX1
Date: Wed, 5 Aug 2020 10:54:24 +0530
Message-ID: <1596605064-27748-10-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596605064-27748-1-git-send-email-spujar@nvidia.com>
References: <1596605064-27748-1-git-send-email-spujar@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1596605081; bh=PeBWAGhMOCghx8hYx18FVuqK4MMpd2Y9L+RhDCXfhWg=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=kzgoNDou3KTrX3K427xo3xzcGl5v8EfSuIzdcx9pgI4RUSp+wf2w545NexnS2WFg4
 UxI4pTLejM8WbnRJzQtLV6QjkRfjECsyoO0QrOzq6elxSEGA2lweK/VBzTu8/x9BT4
 31mT7Od1NLKutolVbaOGtlrv1MwXsPlg04ivw/Kac3lcdRewafBXJFaH9OWxeH5AY6
 XynjPFEQDahV+axbi5n6dyZsaRmcNJs5AkyGmuk6U4QkJW1xZY10kymqf4yE6u4+w9
 sL97VPGqD6UQjy7xI1TwonhnOe6Nm6jjgVlBlMNEafoQ1cy2HKep+5njUS4OunZFMr
 IhbjePRbQWq2A==
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org, swarren@nvidia.com,
 Sameer Pujar <spujar@nvidia.com>, nwartikar@nvidia.com,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, thierry.reding@gmail.com, atalambedu@nvidia.com,
 linux-tegra@vger.kernel.org, rlokhande@nvidia.com, mkumard@nvidia.com,
 dramesh@nvidia.com
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
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 217 +++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 122 ++++++++++++
 2 files changed, 339 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index 56adf28..0eefad7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -3,6 +3,7 @@
 
 #include "tegra210-p2180.dtsi"
 #include "tegra210-p2597.dtsi"
+#include "tegra210-audio-graph.dtsi"
 
 / {
 	model = "NVIDIA Jetson TX1 Developer Kit";
@@ -126,4 +127,220 @@
 			status = "okay";
 		};
 	};
+
+	tegra_sound {
+		status = "okay";
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
+	port@0 {
+		i2s1_cif_ep: endpoint {
+			remote-endpoint = <&xbar_i2s1_ep>;
+		};
+	};
+
+	i2s1_port: port@1 {
+		i2s1_dap: endpoint {
+			dai-format = "i2s";
+
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_i2s2 {
+	status = "okay";
+
+	port@0 {
+		i2s2_cif_ep: endpoint {
+			remote-endpoint = <&xbar_i2s2_ep>;
+		};
+	};
+
+	i2s2_port: port@1 {
+		i2s2_dap: endpoint {
+			dai-format = "i2s";
+
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_i2s3 {
+	status = "okay";
+
+	port@0 {
+		i2s3_cif_ep: endpoint {
+			remote-endpoint = <&xbar_i2s3_ep>;
+		};
+	};
+
+	i2s3_port: port@1 {
+		i2s3_dap_ep: endpoint {
+			dai-format = "i2s";
+
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_i2s4 {
+	status = "okay";
+
+	port@0 {
+		i2s4_cif_ep: endpoint {
+			remote-endpoint = <&xbar_i2s4_ep>;
+		};
+	};
+
+	i2s4_port: port@1 {
+		i2s4_dap: endpoint {
+			dai-format = "i2s";
+
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_i2s5 {
+	status = "okay";
+
+	port@0 {
+		i2s5_cif_ep: endpoint {
+			remote-endpoint = <&xbar_i2s5_ep>;
+		};
+	};
+
+	i2s5_port: port@1 {
+		i2s5_dap: endpoint {
+			dai-format = "i2s";
+
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_dmic1 {
+	status = "okay";
+
+	port@0 {
+		dmic1_cif_ep: endpoint {
+			remote-endpoint = <&xbar_dmic1_ep>;
+		};
+	};
+
+	dmic1_port: port@1 {
+		dmic1_dap: endpoint {
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_dmic2 {
+	status = "okay";
+
+	port@0 {
+		dmic2_cif_ep: endpoint {
+			remote-endpoint = <&xbar_dmic2_ep>;
+		};
+	};
+
+	dmic2_port: port@1 {
+		dmic2_dap: endpoint {
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_dmic3 {
+	status = "okay";
+
+	port@0 {
+		dmic3_cif_ep: endpoint {
+			remote-endpoint = <&xbar_dmic3_ep>;
+		};
+	};
+
+	dmic3_port: port@1 {
+		dmic3_dap: endpoint {
+			/* Placeholder for external Codec */
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 0dd3d02..dc6a1d8 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -6,6 +6,7 @@
 #include <dt-bindings/mfd/max77620.h>
 
 #include "tegra210.dtsi"
+#include "tegra210-audio-graph.dtsi"
 
 / {
 	model = "NVIDIA Jetson Nano Developer Kit";
@@ -855,4 +856,125 @@
 			status = "okay";
 		};
 	};
+
+	tegra_sound {
+		status = "okay";
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
+	port@0 {
+		i2s3_cif_ep: endpoint {
+			remote-endpoint = <&xbar_i2s3_ep>;
+		};
+	};
+
+	i2s3_port: port@1 {
+		i2s3_dap_ep: endpoint {
+			dai-format = "i2s";
+
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_i2s4 {
+	status = "okay";
+
+	port@0 {
+		i2s4_cif_ep: endpoint {
+			remote-endpoint = <&xbar_i2s4_ep>;
+		};
+	};
+
+	i2s4_port: port@1 {
+		i2s4_dap: endpoint@0 {
+			dai-format = "i2s";
+
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_dmic1 {
+	status = "okay";
+
+	port@0 {
+		dmic1_cif_ep: endpoint@0 {
+			remote-endpoint = <&xbar_dmic1_ep>;
+		};
+	};
+
+	dmic1_port: port@1 {
+		dmic1_dap: endpoint@0 {
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_dmic2 {
+	status = "okay";
+
+	port@0 {
+		dmic2_cif_ep: endpoint@0 {
+			remote-endpoint = <&xbar_dmic2_ep>;
+		};
+	};
+
+	dmic2_port: port@1 {
+		dmic2_dap: endpoint@0 {
+			/* Placeholder for external Codec */
+		};
+	};
 };
-- 
2.7.4

