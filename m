Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C5A2AF84A
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 19:38:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE1641782;
	Wed, 11 Nov 2020 19:37:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE1641782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605119908;
	bh=jJncyQfarTlrKX3hyHagr9lBPhKEg9bS1LdZUbUb9M4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m4Q6DVs8pkktyp7ZPFyzpQB3U+YPDRC1wUjZ7G+ctKcAdj3L4aimcaBRmDeCZdblR
	 LrrthCDoZshzIlEnhjDHXTxsbrOYX0q2HdqmHfVBB1w7dto9nuE5PgS0IghEOAYhaA
	 l7SvQoRX9kkePhVMhxcwzRI52TzOBlpuBHvRFSNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5AF6F804E0;
	Wed, 11 Nov 2020 19:35:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03560F804E3; Wed, 11 Nov 2020 19:35:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E6FDF804D8
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 19:35:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E6FDF804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="OQoB0lga"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fac2ee30000>; Wed, 11 Nov 2020 10:35:15 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Nov
 2020 18:35:20 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 11 Nov 2020 18:35:18 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <thierry.reding@gmail.com>
Subject: [PATCH v5 5/6] arm64: tegra: Audio graph header for Tegra210
Date: Thu, 12 Nov 2020 00:04:35 +0530
Message-ID: <1605119676-32273-6-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605119676-32273-1-git-send-email-spujar@nvidia.com>
References: <1605119676-32273-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1605119715; bh=+akRhcYxstV6eqTT5e7r3Ipk74HJd1UDP40xMxmuTx4=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=OQoB0lga7worcHB96q397gq7j1FDbyb6E+70IwLM4wZTAYbTay0Wz1+DXXFcWMD6f
 k+6IzPcFbrcGDIX3KCdcuvFTNh+mNnfxdadv8ImBy9wesxi4aI8eeIgAvnKtj7rwGy
 +a6msP7vdArNvF1/BZKtT9hFjuady/6jt6uHvH0os1IlBwCM8VjgCGI5RZT+dAje+O
 YrnY2fRh3mqMvl+jqvjAVUkX3c3TbAFxP3QFG8645R0/tI1NqUn7GmfAf2XObceANK
 3dsr6BpSzcoApmWT6pdv/EDcSuRJbb/DwmmZ8twkcz0fzvmI9ynpgwUtF+BZb1FsSf
 x46xXR0RR6G5g==
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

Expose a header which describes DT bindings required to use audio-graph
based sound card. All Tegra210 based platforms can include this header
and add platform specific information. Currently, from SoC point of view,
all links are exposed for ADMAIF, AHUB, I2S and DMIC components.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 .../boot/dts/nvidia/tegra210-audio-graph.dtsi      | 153 +++++++++++++++++++++
 1 file changed, 153 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi
new file mode 100644
index 0000000..5c54358
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	tegra_sound {
+		status = "disabled";
+
+		clocks = <&tegra_car TEGRA210_CLK_PLL_A>,
+			 <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+		clock-names = "pll_a", "plla_out0";
+
+		assigned-clocks = <&tegra_car TEGRA210_CLK_PLL_A>,
+				  <&tegra_car TEGRA210_CLK_PLL_A_OUT0>,
+				  <&tegra_car TEGRA210_CLK_EXTERN1>;
+		assigned-clock-parents = <0>, <0>, <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
+		assigned-clock-rates = <368640000>, <49152000>, <12288000>;
+	};
+};
+
+&tegra_admaif {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		admaif1_port: port@0 {
+			reg = <0>;
+			admaif1_ep: endpoint {
+				remote-endpoint = <&xbar_admaif1_ep>;
+			};
+		};
+		admaif2_port: port@1 {
+			reg = <1>;
+			admaif2_ep: endpoint {
+				remote-endpoint = <&xbar_admaif2_ep>;
+			};
+		};
+		admaif3_port: port@2 {
+			reg = <2>;
+			admaif3_ep: endpoint {
+				remote-endpoint = <&xbar_admaif3_ep>;
+			};
+		};
+		admaif4_port: port@3 {
+			reg = <3>;
+			admaif4_ep: endpoint {
+				remote-endpoint = <&xbar_admaif4_ep>;
+			};
+		};
+		admaif5_port: port@4 {
+			reg = <4>;
+			admaif5_ep: endpoint {
+				remote-endpoint = <&xbar_admaif5_ep>;
+			};
+		};
+		admaif6_port: port@5 {
+			reg = <5>;
+			admaif6_ep: endpoint {
+				remote-endpoint = <&xbar_admaif6_ep>;
+			};
+		};
+		admaif7_port: port@6 {
+			reg = <6>;
+			admaif7_ep: endpoint {
+				remote-endpoint = <&xbar_admaif7_ep>;
+			};
+		};
+		admaif8_port: port@7 {
+			reg = <7>;
+			admaif8_ep: endpoint {
+				remote-endpoint = <&xbar_admaif8_ep>;
+			};
+		};
+		admaif9_port: port@8 {
+			reg = <8>;
+			admaif9_ep: endpoint {
+				remote-endpoint = <&xbar_admaif9_ep>;
+			};
+		};
+		admaif10_port: port@9 {
+			reg = <9>;
+			admaif10_ep: endpoint {
+				remote-endpoint = <&xbar_admaif10_ep>;
+			};
+		};
+	};
+};
+
+&tegra_ahub {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0x0>;
+			xbar_admaif1_ep: endpoint {
+				remote-endpoint = <&admaif1_ep>;
+			};
+		};
+		port@1 {
+			reg = <0x1>;
+			xbar_admaif2_ep: endpoint {
+				remote-endpoint = <&admaif2_ep>;
+			};
+		};
+		port@2 {
+			reg = <0x2>;
+			xbar_admaif3_ep: endpoint {
+				remote-endpoint = <&admaif3_ep>;
+			};
+		};
+		port@3 {
+			reg = <0x3>;
+			xbar_admaif4_ep: endpoint {
+				remote-endpoint = <&admaif4_ep>;
+			};
+		};
+		port@4 {
+			reg = <0x4>;
+			xbar_admaif5_ep: endpoint {
+				remote-endpoint = <&admaif5_ep>;
+			};
+		};
+		port@5 {
+			reg = <0x5>;
+			xbar_admaif6_ep: endpoint {
+				remote-endpoint = <&admaif6_ep>;
+			};
+		};
+		port@6 {
+			reg = <0x6>;
+			xbar_admaif7_ep: endpoint {
+				remote-endpoint = <&admaif7_ep>;
+			};
+		};
+		port@7 {
+			reg = <0x7>;
+			xbar_admaif8_ep: endpoint {
+				remote-endpoint = <&admaif8_ep>;
+			};
+		};
+		port@8 {
+			reg = <0x8>;
+			xbar_admaif9_ep: endpoint {
+				remote-endpoint = <&admaif9_ep>;
+			};
+		};
+		port@9 {
+			reg = <0x9>;
+			xbar_admaif10_ep: endpoint {
+				remote-endpoint = <&admaif10_ep>;
+			};
+		};
+	};
+};
-- 
2.7.4

