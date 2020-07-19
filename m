Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CBC224FC4
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jul 2020 07:18:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCD51169E;
	Sun, 19 Jul 2020 07:17:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCD51169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595135895;
	bh=XkN2GztU65g62cRxVfTtmhz3xEjKMnr0wmcGBB23nzE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gY897vMxvoNXCAyTB3JMy2cmTxBGAXUxkoIgGgk+IY70y81tVl1lCJqiHpkekb9PM
	 qu5ne0t+Pm4o6YOg2WgKOLva27kw/CmydCxxIAGy0pk3DgY2K7xDxtdyOhVw8PyEJ8
	 MigMjvbOynbwmrdsLgahD5F6K1UGHNrjYcVojfy4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F18CF80317;
	Sun, 19 Jul 2020 07:11:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C223F80321; Sun, 19 Jul 2020 07:11:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00107F80308
 for <alsa-devel@alsa-project.org>; Sun, 19 Jul 2020 07:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00107F80308
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="c6Y2RE15"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f13d5f50000>; Sat, 18 Jul 2020 22:11:17 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sat, 18 Jul 2020 22:11:30 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sat, 18 Jul 2020 22:11:30 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 19 Jul
 2020 05:11:30 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 19 Jul 2020 05:11:30 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f13d5fd0000>; Sat, 18 Jul 2020 22:11:29 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH 10/10] arm64: tegra: Audio graph sound card for Jetson Nano
 and TX1
Date: Sun, 19 Jul 2020 10:40:17 +0530
Message-ID: <1595135417-16589-11-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
References: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595135477; bh=7jOO8qtQ+67irHoTVwSaVNxkwxk1t+NtkaWFSQHqTpA=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=c6Y2RE15QRDjlXsVjo+wXE1ds/7X7mlHRx8RZ7b+Cy2QJws9dW2HhD7ICvhgsprCe
 bdP+0PHdJAqFDUJbxDLAXQDd70wF0iK6YreWfWlFcvJY8QOcTmlayr18YMmtaROrP1
 gFSijCQ4gmajz98AjBxyOURG/xm6HB9Fv5MXHi3LXurUSxCqF47s3vJF/dnaAS/5Xq
 AvO9vNOZtK1yWkHSReRi/ZtMD/FgNe+bb/7Nl56TKnnbO8Y6qhYLLo0Y3WrZEJUq6m
 I3Ngg4VPhN1GQ+bq1GdLUTgZ8VCaToZEVz2krsnydoqs58dDzoChhhTvtpURIyANDl
 dQxFVCuR5PKSQ==
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
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 196 +++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 110 ++++++++++++
 2 files changed, 306 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
index 56adf28..d228f02 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts
@@ -3,6 +3,7 @@
 
 #include "tegra210-p2180.dtsi"
 #include "tegra210-p2597.dtsi"
+#include "tegra210-audio-graph.dtsi"
 
 / {
 	model = "NVIDIA Jetson TX1 Developer Kit";
@@ -126,4 +127,199 @@
 			status = "okay";
 		};
 	};
+
+	tegra_sound {
+		status = "okay";
+
+		dais = /* FE */
+		       <&admaif_port>,
+		       /* Router */
+		       <&xbar_port>,
+		       /* I/O DAP Ports */
+		       <&i2s1_port>, <&i2s2_port>, <&i2s3_port>, <&i2s4_port>, <&i2s5_port>,
+		       <&dmic1_port>, <&dmic2_port>, <&dmic3_port>;
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
+	port@1 {
+		xbar_i2s1: endpoint@a {
+			reg = <0xa>;
+			remote-endpoint = <&i2s1_cif>;
+		};
+		xbar_i2s2: endpoint@b {
+			reg = <0xb>;
+			remote-endpoint = <&i2s2_cif>;
+		};
+		xbar_i2s3: endpoint@c {
+			reg = <0xc>;
+			remote-endpoint = <&i2s3_cif>;
+		};
+		xbar_i2s4: endpoint@d {
+			reg = <0xd>;
+			remote-endpoint = <&i2s4_cif>;
+		};
+		xbar_i2s5: endpoint@e {
+			reg = <0xe>;
+			remote-endpoint = <&i2s5_cif>;
+		};
+		xbar_dmic1: endpoint@f {
+			reg = <0xf>;
+			remote-endpoint = <&dmic1_cif>;
+		};
+		xbar_dmic2: endpoint@10 {
+			reg = <0x10>;
+			remote-endpoint = <&dmic2_cif>;
+		};
+		xbar_dmic3: endpoint@11 {
+			reg = <0x11>;
+			remote-endpoint = <&dmic3_cif>;
+		};
+	};
+};
+
+&tegra_i2s1 {
+	status = "okay";
+
+	port@0 {
+		i2s1_cif: endpoint@0 {
+			remote-endpoint = <&xbar_i2s1>;
+		};
+	};
+
+	i2s1_port: port@1 {
+		i2s1_dap: endpoint@0 {
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
+		i2s2_cif: endpoint@0 {
+			remote-endpoint = <&xbar_i2s2>;
+		};
+	};
+
+	i2s2_port: port@1 {
+		i2s2_dap: endpoint@0 {
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
+		i2s3_cif: endpoint@0 {
+			remote-endpoint = <&xbar_i2s3>;
+		};
+	};
+
+	i2s3_port: port@1 {
+		i2s3_dap: endpoint@0 {
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
+		i2s4_cif: endpoint@0 {
+			remote-endpoint = <&xbar_i2s4>;
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
+&tegra_i2s5 {
+	status = "okay";
+
+	port@0 {
+		i2s5_cif: endpoint@0 {
+			remote-endpoint = <&xbar_i2s5>;
+		};
+	};
+
+	i2s5_port: port@1 {
+		i2s5_dap: endpoint@0 {
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
+		dmic1_cif: endpoint@0 {
+			remote-endpoint = <&xbar_dmic1>;
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
+		dmic2_cif: endpoint@0 {
+			remote-endpoint = <&xbar_dmic2>;
+		};
+	};
+
+	dmic2_port: port@1 {
+		dmic2_dap: endpoint@0 {
+			/* Placeholder for external Codec */
+		};
+	};
+};
+
+&tegra_dmic3 {
+	status = "okay";
+
+	port@0 {
+		dmic3_cif: endpoint@0 {
+			remote-endpoint = <&xbar_dmic3>;
+		};
+	};
+
+	dmic3_port: port@1 {
+		dmic3_dap: endpoint@0 {
+			/* Placeholder for external Codec */
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index 0325fc0..0226297 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -6,6 +6,7 @@
 #include <dt-bindings/mfd/max77620.h>
 
 #include "tegra210.dtsi"
+#include "tegra210-audio-graph.dtsi"
 
 / {
 	model = "NVIDIA Jetson Nano Developer Kit";
@@ -818,4 +819,113 @@
 			status = "okay";
 		};
 	};
+
+	tegra_sound {
+		status = "okay";
+
+		dais = /* FE */
+		       <&admaif_port>,
+		       /* Router */
+		       <&xbar_port>,
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
+	port@1 {
+		xbar_i2s3: endpoint@c {
+			reg = <0xc>;
+			remote-endpoint = <&i2s3_cif>;
+		};
+		xbar_i2s4: endpoint@d {
+			reg = <0xd>;
+			remote-endpoint = <&i2s4_cif>;
+		};
+		xbar_dmic1: endpoint@f {
+			reg = <0xf>;
+			remote-endpoint = <&dmic1_cif>;
+		};
+		xbar_dmic2: endpoint@10 {
+			reg = <0x10>;
+			remote-endpoint = <&dmic2_cif>;
+		};
+	};
+};
+
+&tegra_i2s3 {
+	status = "okay";
+
+	port@0 {
+		i2s3_cif: endpoint@0 {
+			remote-endpoint = <&xbar_i2s3>;
+		};
+	};
+
+	i2s3_port: port@1 {
+		i2s3_dap: endpoint@0 {
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
+		i2s4_cif: endpoint@0 {
+			remote-endpoint = <&xbar_i2s4>;
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
+		dmic1_cif: endpoint@0 {
+			remote-endpoint = <&xbar_dmic1>;
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
+		dmic2_cif: endpoint@0 {
+			remote-endpoint = <&xbar_dmic2>;
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

