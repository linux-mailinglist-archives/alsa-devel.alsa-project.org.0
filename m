Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A70E308C94
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 19:32:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D728616A4;
	Fri, 29 Jan 2021 19:31:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D728616A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611945158;
	bh=xmmtiiXcD82XvbZ7cRsua6+dsgjGx7GztfwaC8S2XdI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KU6YAwhRcZo6Wy2UNAflZERCOgsSTViRUwniW/22rMmPjYxNwx2V/NtUf4ym8vUto
	 Liw/FSeAPoWX9aA9tgrVnPQZ9PYHlpadeyEChf6N2Sg4jCZJqCAmw+DJSv/qiUNXHE
	 QGmYFOoaHOxhdE8NcJjJczBc8WLYBY0+2a8Y6yyo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0451F80508;
	Fri, 29 Jan 2021 19:28:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5B42F80506; Fri, 29 Jan 2021 19:28:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A55DF804FB
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 19:28:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A55DF804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="OXj4oTOb"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B601453c90000>; Fri, 29 Jan 2021 10:28:25 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 Jan
 2021 18:28:25 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 29 Jan 2021 18:28:22 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <thierry.reding@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH v2 8/9] arm64: tegra: Audio graph sound card for Jetson TX2
Date: Fri, 29 Jan 2021 23:57:45 +0530
Message-ID: <1611944866-29373-9-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
References: <1611944866-29373-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611944905; bh=IQ4kJdcWP8n18OsPAUglK+0qFMf2cRaake0iyMmYPRg=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=OXj4oTObHccQYfO+erXHUUznxFiJO0c5b2Oci/uANBlUXUi+acS5YPx7jimfQ84VD
 D1x9wYAXG4QLCyjgbQi5qvUSilamFjmMoXX7sFAWB3e88Uc49+q49qsSvJX6pmvwSq
 i7aiKI3zYqg3tr9eS00UtdntwaAxg1vSzyFnQUmTJb6phaKWAYPe/QOdJ/JerZtK7c
 3YP4+QxLXFLIfcW5ynCgd+ApdSXGEDqsfs5j2+2o7FZkVIBoZLuiw+2UtH159jyGQZ
 nIV/9EC318oPtBkWxbvMe93QcPBoqSbF2fF9h8wMpcz11S6sgJjOv56vCooZvbbQlZ
 m85ToCGm9uDGw==
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

Enable support for audio-graph based sound card on Jetson TX2. Based
on the board design following I/O modules are enabled.
  * All I2S instances (I2S1 ... I2S6)
  * All DSPK instances (DSPK1, DSPK2)
  * DMIC1, DMIC2 and DMIC3

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 597 +++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  22 +
 2 files changed, 619 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 7e1723e..5e59584 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -20,6 +20,580 @@
 		interrupt-controller@2a40000 {
 			status = "okay";
 		};
+
+		ahub@2900800 {
+			status = "okay";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0x0>;
+					xbar_admaif0_ep: endpoint {
+						remote-endpoint = <&admaif0_ep>;
+					};
+				};
+				port@1 {
+					reg = <0x1>;
+					xbar_admaif1_ep: endpoint {
+						remote-endpoint = <&admaif1_ep>;
+					};
+				};
+				port@2 {
+					reg = <0x2>;
+					xbar_admaif2_ep: endpoint {
+						remote-endpoint = <&admaif2_ep>;
+					};
+				};
+				port@3 {
+					reg = <0x3>;
+					xbar_admaif3_ep: endpoint {
+						remote-endpoint = <&admaif3_ep>;
+					};
+				};
+				port@4 {
+					reg = <0x4>;
+					xbar_admaif4_ep: endpoint {
+						remote-endpoint = <&admaif4_ep>;
+					};
+				};
+				port@5 {
+					reg = <0x5>;
+					xbar_admaif5_ep: endpoint {
+						remote-endpoint = <&admaif5_ep>;
+					};
+				};
+				port@6 {
+					reg = <0x6>;
+					xbar_admaif6_ep: endpoint {
+						remote-endpoint = <&admaif6_ep>;
+					};
+				};
+				port@7 {
+					reg = <0x7>;
+					xbar_admaif7_ep: endpoint {
+						remote-endpoint = <&admaif7_ep>;
+					};
+				};
+				port@8 {
+					reg = <0x8>;
+					xbar_admaif8_ep: endpoint {
+						remote-endpoint = <&admaif8_ep>;
+					};
+				};
+				port@9 {
+					reg = <0x9>;
+					xbar_admaif9_ep: endpoint {
+						remote-endpoint = <&admaif9_ep>;
+					};
+				};
+				port@a {
+					reg = <0xa>;
+					xbar_admaif10_ep: endpoint {
+						remote-endpoint = <&admaif10_ep>;
+					};
+				};
+				port@b {
+					reg = <0xb>;
+					xbar_admaif11_ep: endpoint {
+						remote-endpoint = <&admaif11_ep>;
+					};
+				};
+				port@c {
+					reg = <0xc>;
+					xbar_admaif12_ep: endpoint {
+						remote-endpoint = <&admaif12_ep>;
+					};
+				};
+				port@d {
+					reg = <0xd>;
+					xbar_admaif13_ep: endpoint {
+						remote-endpoint = <&admaif13_ep>;
+					};
+				};
+				port@e {
+					reg = <0xe>;
+					xbar_admaif14_ep: endpoint {
+						remote-endpoint = <&admaif14_ep>;
+					};
+				};
+				port@f {
+					reg = <0xf>;
+					xbar_admaif15_ep: endpoint {
+						remote-endpoint = <&admaif15_ep>;
+					};
+				};
+				port@10 {
+					reg = <0x10>;
+					xbar_admaif16_ep: endpoint {
+						remote-endpoint = <&admaif16_ep>;
+					};
+				};
+				port@11 {
+					reg = <0x11>;
+					xbar_admaif17_ep: endpoint {
+						remote-endpoint = <&admaif17_ep>;
+					};
+				};
+				port@12 {
+					reg = <0x12>;
+					xbar_admaif18_ep: endpoint {
+						remote-endpoint = <&admaif18_ep>;
+					};
+				};
+				port@13 {
+					reg = <0x13>;
+					xbar_admaif19_ep: endpoint {
+						remote-endpoint = <&admaif19_ep>;
+					};
+				};
+				xbar_i2s1_port: port@14 {
+					reg = <0x14>;
+					xbar_i2s1_ep: endpoint {
+						remote-endpoint = <&i2s1_cif_ep>;
+					};
+				};
+				xbar_i2s2_port: port@15 {
+					reg = <0x15>;
+					xbar_i2s2_ep: endpoint {
+						remote-endpoint = <&i2s2_cif_ep>;
+					};
+				};
+				xbar_i2s3_port: port@16 {
+					reg = <0x16>;
+					xbar_i2s3_ep: endpoint {
+						remote-endpoint = <&i2s3_cif_ep>;
+					};
+				};
+				xbar_i2s4_port: port@17 {
+					reg = <0x17>;
+					xbar_i2s4_ep: endpoint {
+						remote-endpoint = <&i2s4_cif_ep>;
+					};
+				};
+				xbar_i2s5_port: port@18 {
+					reg = <0x18>;
+					xbar_i2s5_ep: endpoint {
+						remote-endpoint = <&i2s5_cif_ep>;
+					};
+				};
+				xbar_i2s6_port: port@19 {
+					reg = <0x19>;
+					xbar_i2s6_ep: endpoint {
+						remote-endpoint = <&i2s6_cif_ep>;
+					};
+				};
+				xbar_dmic1_port: port@1a {
+					reg = <0x1a>;
+					xbar_dmic1_ep: endpoint {
+						remote-endpoint = <&dmic1_cif_ep>;
+					};
+				};
+				xbar_dmic2_port: port@1b {
+					reg = <0x1b>;
+					xbar_dmic2_ep: endpoint {
+						remote-endpoint = <&dmic2_cif_ep>;
+					};
+				};
+				xbar_dmic3_port: port@1c {
+					reg = <0x1c>;
+					xbar_dmic3_ep: endpoint {
+						remote-endpoint = <&dmic3_cif_ep>;
+					};
+				};
+				xbar_dspk1_port: port@1e {
+					reg = <0x1e>;
+					xbar_dspk1_ep: endpoint {
+						remote-endpoint = <&dspk1_cif_ep>;
+					};
+				};
+				xbar_dspk2_port: port@1f {
+					reg = <0x1f>;
+					xbar_dspk2_ep: endpoint {
+						remote-endpoint = <&dspk2_cif_ep>;
+					};
+				};
+			};
+
+			admaif@290f000 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					admaif0_port: port@0 {
+						reg = <0x0>;
+						admaif0_ep: endpoint {
+							remote-endpoint = <&xbar_admaif0_ep>;
+						};
+					};
+					admaif1_port: port@1 {
+						reg = <0x1>;
+						admaif1_ep: endpoint {
+							remote-endpoint = <&xbar_admaif1_ep>;
+						};
+					};
+					admaif2_port: port@2 {
+						reg = <0x2>;
+						admaif2_ep: endpoint {
+							remote-endpoint = <&xbar_admaif2_ep>;
+						};
+					};
+					admaif3_port: port@3 {
+						reg = <0x3>;
+						admaif3_ep: endpoint {
+							remote-endpoint = <&xbar_admaif3_ep>;
+						};
+					};
+					admaif4_port: port@4 {
+						reg = <0x4>;
+						admaif4_ep: endpoint {
+							remote-endpoint = <&xbar_admaif4_ep>;
+						};
+					};
+					admaif5_port: port@5 {
+						reg = <0x5>;
+						admaif5_ep: endpoint {
+							remote-endpoint = <&xbar_admaif5_ep>;
+						};
+					};
+					admaif6_port: port@6 {
+						reg = <0x6>;
+						admaif6_ep: endpoint {
+							remote-endpoint = <&xbar_admaif6_ep>;
+						};
+					};
+					admaif7_port: port@7 {
+						reg = <0x7>;
+						admaif7_ep: endpoint {
+							remote-endpoint = <&xbar_admaif7_ep>;
+						};
+					};
+					admaif8_port: port@8 {
+						reg = <0x8>;
+						admaif8_ep: endpoint {
+							remote-endpoint = <&xbar_admaif8_ep>;
+						};
+					};
+					admaif9_port: port@9 {
+						reg = <0x9>;
+						admaif9_ep: endpoint {
+							remote-endpoint = <&xbar_admaif9_ep>;
+						};
+					};
+					admaif10_port: port@a {
+						reg = <0xa>;
+						admaif10_ep: endpoint {
+							remote-endpoint = <&xbar_admaif10_ep>;
+						};
+					};
+					admaif11_port: port@b {
+						reg = <0xb>;
+						admaif11_ep: endpoint {
+							remote-endpoint = <&xbar_admaif11_ep>;
+						};
+					};
+					admaif12_port: port@c {
+						reg = <0xc>;
+						admaif12_ep: endpoint {
+							remote-endpoint = <&xbar_admaif12_ep>;
+						};
+					};
+					admaif13_port: port@d {
+						reg = <0xd>;
+						admaif13_ep: endpoint {
+							remote-endpoint = <&xbar_admaif13_ep>;
+						};
+					};
+					admaif14_port: port@e {
+						reg = <0xe>;
+						admaif14_ep: endpoint {
+							remote-endpoint = <&xbar_admaif14_ep>;
+						};
+					};
+					admaif15_port: port@f {
+						reg = <0xf>;
+						admaif15_ep: endpoint {
+							remote-endpoint = <&xbar_admaif15_ep>;
+						};
+					};
+					admaif16_port: port@10 {
+						reg = <0x10>;
+						admaif16_ep: endpoint {
+							remote-endpoint = <&xbar_admaif16_ep>;
+						};
+					};
+					admaif17_port: port@11 {
+						reg = <0x11>;
+						admaif17_ep: endpoint {
+							remote-endpoint = <&xbar_admaif17_ep>;
+						};
+					};
+					admaif18_port: port@12 {
+						reg = <0x12>;
+						admaif18_ep: endpoint {
+							remote-endpoint = <&xbar_admaif18_ep>;
+						};
+					};
+					admaif19_port: port@13 {
+						reg = <0x13>;
+						admaif19_ep: endpoint {
+							remote-endpoint = <&xbar_admaif19_ep>;
+						};
+					};
+				};
+			};
+
+			i2s@2901000 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						i2s1_cif_ep: endpoint {
+							remote-endpoint = <&xbar_i2s1_ep>;
+						};
+					};
+					i2s1_port: port@1 {
+						reg = <1>;
+						i2s1_dap_ep: endpoint {
+							dai-format = "i2s";
+							/* Placeholder for external Codec */
+						};
+					};
+				};
+			};
+
+			i2s@2901100 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						i2s2_cif_ep: endpoint {
+							remote-endpoint = <&xbar_i2s2_ep>;
+						};
+					};
+					i2s2_port: port@1 {
+						reg = <1>;
+						i2s2_dap_ep: endpoint {
+							dai-format = "i2s";
+							/* Placeholder for external Codec */
+						};
+					};
+				};
+			};
+
+			i2s@2901200 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						i2s3_cif_ep: endpoint {
+							remote-endpoint = <&xbar_i2s3_ep>;
+						};
+					};
+					i2s3_port: port@1 {
+						reg = <1>;
+						i2s3_dap_ep: endpoint {
+							dai-format = "i2s";
+							/* Placeholder for external Codec */
+						};
+					};
+				};
+			};
+
+			i2s@2901300 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						i2s4_cif_ep: endpoint {
+							remote-endpoint = <&xbar_i2s4_ep>;
+						};
+					};
+					i2s4_port: port@1 {
+						reg = <1>;
+						i2s4_dap_ep: endpoint {
+							dai-format = "i2s";
+							/* Placeholder for external Codec */
+						};
+					};
+				};
+			};
+
+			i2s@2901400 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						i2s5_cif_ep: endpoint {
+							remote-endpoint = <&xbar_i2s5_ep>;
+						};
+					};
+					i2s5_port: port@1 {
+						reg = <1>;
+						i2s5_dap_ep: endpoint {
+							dai-format = "i2s";
+							/* Placeholder for external Codec */
+						};
+					};
+				};
+			};
+
+			i2s@2901500 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						i2s6_cif_ep: endpoint {
+							remote-endpoint = <&xbar_i2s6_ep>;
+						};
+					};
+					i2s6_port: port@1 {
+						reg = <1>;
+						i2s6_dap_ep: endpoint {
+							dai-format = "i2s";
+							/* Placeholder for external Codec */
+						};
+					};
+				};
+			};
+
+			dmic@2904000 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dmic1_cif_ep: endpoint {
+							remote-endpoint = <&xbar_dmic1_ep>;
+						};
+					};
+					dmic1_port: port@1 {
+						reg = <1>;
+						dmic1_dap_ep: endpoint {
+							/* Place holder for external Codec */
+						};
+					};
+				};
+			};
+
+			dmic@2904100 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dmic2_cif_ep: endpoint {
+							remote-endpoint = <&xbar_dmic2_ep>;
+						};
+					};
+					dmic2_port: port@1 {
+						reg = <1>;
+						dmic2_dap_ep: endpoint {
+							/* Place holder for external Codec */
+						};
+					};
+				};
+			};
+
+			dmic@2904200 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dmic3_cif_ep: endpoint {
+							remote-endpoint = <&xbar_dmic3_ep>;
+						};
+					};
+					dmic3_port: port@1 {
+						reg = <1>;
+						dmic3_dap_ep: endpoint {
+							/* Place holder for external Codec */
+						};
+					};
+				};
+			};
+
+			dspk@2905000 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dspk1_cif_ep: endpoint {
+							remote-endpoint = <&xbar_dspk1_ep>;
+						};
+					};
+					dspk1_port: port@1 {
+						reg = <1>;
+						dspk1_dap_ep: endpoint {
+							/* Place holder for external Codec */
+						};
+					};
+				};
+			};
+
+			dspk@2905100 {
+				status = "okay";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dspk2_cif_ep: endpoint {
+							remote-endpoint = <&xbar_dspk2_ep>;
+						};
+					};
+					dspk2_port: port@1 {
+						reg = <1>;
+						dspk2_dap_ep: endpoint {
+							/* Place holder for external Codec */
+						};
+					};
+				};
+			};
+		};
 	};
 
 	i2c@3160000 {
@@ -114,6 +688,29 @@
 		status = "okay";
 	};
 
+	sound {
+		compatible = "nvidia,tegra186-audio-graph-card";
+		status = "okay";
+
+		dais = /* FE */
+		       <&admaif0_port>, <&admaif1_port>, <&admaif2_port>, <&admaif3_port>,
+		       <&admaif4_port>, <&admaif5_port>, <&admaif6_port>, <&admaif7_port>,
+		       <&admaif8_port>, <&admaif9_port>, <&admaif10_port>, <&admaif11_port>,
+		       <&admaif12_port>, <&admaif13_port>, <&admaif14_port>, <&admaif15_port>,
+		       <&admaif16_port>, <&admaif17_port>, <&admaif18_port>, <&admaif19_port>,
+		       /* Router */
+		       <&xbar_i2s1_port>, <&xbar_i2s2_port>, <&xbar_i2s3_port>,
+		       <&xbar_i2s4_port>, <&xbar_i2s5_port>, <&xbar_i2s6_port>,
+		       <&xbar_dmic1_port>, <&xbar_dmic2_port>, <&xbar_dmic3_port>,
+		       <&xbar_dspk1_port>, <&xbar_dspk2_port>,
+		       /* I/O */
+		       <&i2s1_port>, <&i2s2_port>, <&i2s3_port>, <&i2s4_port>,
+		       <&i2s5_port>, <&i2s6_port>, <&dmic1_port>, <&dmic2_port>,
+		       <&dmic3_port>, <&dspk1_port>, <&dspk2_port>;
+
+		label = "jetson-tx2-ape";
+	};
+
 	padctl@3520000 {
 		status = "okay";
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 58c5196..0ba791f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -680,6 +680,28 @@
 		status = "disabled";
 	};
 
+	sound {
+		status = "disabled";
+
+		clocks = <&bpmp TEGRA186_CLK_PLLA>,
+			 <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
+		clock-names = "pll_a", "plla_out0";
+		assigned-clocks = <&bpmp TEGRA186_CLK_PLLA>,
+				  <&bpmp TEGRA186_CLK_PLL_A_OUT0>,
+				  <&bpmp TEGRA186_CLK_AUD_MCLK>;
+		assigned-clock-parents = <0>,
+					 <&bpmp TEGRA186_CLK_PLLA>,
+					 <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
+		/*
+		 * PLLA supports dynamic ramp. Below initial rate is chosen
+		 * for this to work and oscillate between base rates required
+		 * for 8x and 11.025x sample rate streams.
+		 */
+		assigned-clock-rates = <258000000>;
+
+		iommus = <&smmu TEGRA186_SID_APE>;
+	};
+
 	padctl: padctl@3520000 {
 		compatible = "nvidia,tegra186-xusb-padctl";
 		reg = <0x0 0x03520000 0x0 0x1000>,
-- 
2.7.4

