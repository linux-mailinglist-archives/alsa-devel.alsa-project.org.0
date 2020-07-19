Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C24224FC2
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jul 2020 07:17:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86CC416B2;
	Sun, 19 Jul 2020 07:16:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86CC416B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595135853;
	bh=9mkcj1R3uUvyN2JJubu0dIh2XOMsOHFzWP4vNfBAXu8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dB5YGm28VhgOpZ9y6ED1xu2cIqx2q+pHGv5aoM+qNj1TrUc+kvvTAllvi+kD+hWs2
	 cjeYhoqS3fYvv/ECNM0ULPBZ5rkl3HqpQQS7umK6KqN1sOoVr8S9PrgYuQVYQmxjtu
	 DIGAXPI9wloJfn0hTrvXZYA4wRRDyHbuneGXzFAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E847F80316;
	Sun, 19 Jul 2020 07:11:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E1AAF80315; Sun, 19 Jul 2020 07:11:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF08AF802EC
 for <alsa-devel@alsa-project.org>; Sun, 19 Jul 2020 07:11:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF08AF802EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="QdXOS+uA"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f13d5f00001>; Sat, 18 Jul 2020 22:11:12 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sat, 18 Jul 2020 22:11:25 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sat, 18 Jul 2020 22:11:25 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 19 Jul
 2020 05:11:24 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 19 Jul 2020 05:11:24 +0000
Received: from audio.nvidia.com (Not Verified[10.24.34.185]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f13d5f70002>; Sat, 18 Jul 2020 22:11:24 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <kuninori.morimoto.gx@renesas.com>, <robh+dt@kernel.org>,
 <lgirdwood@gmail.com>
Subject: [PATCH 09/10] arm64: tegra: Audio graph header for Tegra210
Date: Sun, 19 Jul 2020 10:40:16 +0530
Message-ID: <1595135417-16589-10-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
References: <1595135417-16589-1-git-send-email-spujar@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595135472; bh=BoqMFeYeBIo2NN4Un+oGYe1Z1EDA0N/2i1ZnSzyjBec=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:X-NVConfidentiality:MIME-Version:
 Content-Type;
 b=QdXOS+uA1JlhOToyqsSc9yVmKtupqvdYyiyANhpm9E0N2+ei2QWjbpuqJiAwqREI7
 bVq7O8xZ3Pzow7QYxn+B5dNKS6XquCaI/cdooiKCbJl5OCmGMK4gqco9oQ4etJlrD0
 OteEhDsrq7G7rEwsyfn2I8SltHhCXw96LGZYU4IR2bF2ncljOhP3NykUVsImA5exmx
 dlAAIXrew186U0uA7LhlJQB7DgkileL0k5Z1NR2gIp5yzET9qwQrInCLltzof0FdIj
 CTuwDTXQ/cE7I21GWVvD+AcOBU8NKk/GyAiiR4nWTlBqRn/cmXhpogd/NeGejdM8gx
 0qQiylvmBIhXw==
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

Expose a header which describes DT bindings required to use audio-graph
based sound card. All Tegra210 based platforms can include this header
and add platform specific information. Currently, from SoC point of view,
all links are exposed for ADMAIF, AHUB, I2S and DMIC components.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 .../boot/dts/nvidia/tegra210-audio-graph.dtsi      | 120 +++++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi
new file mode 100644
index 0000000..1cf2c87
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	tegra_sound {
+		status = "disabled";
+
+		compatible = "audio-graph-cc-card";
+
+		clocks = <&tegra_car TEGRA210_CLK_PLL_A>,
+			 <&tegra_car TEGRA210_CLK_PLL_A_OUT0>,
+			 <&tegra_car TEGRA210_CLK_EXTERN1>;
+		clock-names = "pll_a", "plla_out0", "aud_mclk";
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
+	admaif_port: port {
+		admaif0: endpoint@0 {
+			remote-endpoint = <&xbar_admaif0>;
+		};
+		admaif1: endpoint@1 {
+			remote-endpoint = <&xbar_admaif1>;
+		};
+		admaif2: endpoint@2 {
+			remote-endpoint = <&xbar_admaif2>;
+		};
+		admaif3: endpoint@3 {
+			remote-endpoint = <&xbar_admaif3>;
+		};
+		admaif4: endpoint@4 {
+			remote-endpoint = <&xbar_admaif4>;
+		};
+		admaif5: endpoint@5 {
+			remote-endpoint = <&xbar_admaif5>;
+		};
+		admaif6: endpoint@6 {
+			remote-endpoint = <&xbar_admaif6>;
+		};
+		admaif7: endpoint@7 {
+			remote-endpoint = <&xbar_admaif7>;
+		};
+		admaif8: endpoint@8 {
+			remote-endpoint = <&xbar_admaif8>;
+		};
+		admaif9: endpoint@9 {
+			remote-endpoint = <&xbar_admaif9>;
+		};
+	};
+};
+
+&tegra_ahub {
+	port@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/*
+		 * Audio Crossbar Codec endpoints.
+		 * Connected with FE endpoints.
+		 */
+
+		xbar_admaif0: endpoint@0 {
+			reg = <0>;
+			remote-endpoint = <&admaif0>;
+		};
+		xbar_admaif1: endpoint@1 {
+			reg = <1>;
+			remote-endpoint = <&admaif1>;
+		};
+		xbar_admaif2: endpoint@2 {
+			reg = <2>;
+			remote-endpoint = <&admaif2>;
+		};
+		xbar_admaif3: endpoint@3 {
+			reg = <3>;
+			remote-endpoint = <&admaif3>;
+		};
+		xbar_admaif4: endpoint@4 {
+			reg = <4>;
+			remote-endpoint = <&admaif4>;
+		};
+		xbar_admaif5: endpoint@5 {
+			reg = <5>;
+			remote-endpoint = <&admaif5>;
+		};
+		xbar_admaif6: endpoint@6 {
+			reg = <6>;
+			remote-endpoint = <&admaif6>;
+		};
+		xbar_admaif7: endpoint@7 {
+			reg = <7>;
+			remote-endpoint = <&admaif7>;
+		};
+		xbar_admaif8: endpoint@8 {
+			reg = <8>;
+			remote-endpoint = <&admaif8>;
+		};
+		xbar_admaif9: endpoint@9 {
+			reg = <9>;
+			remote-endpoint = <&admaif9>;
+		};
+	};
+
+	xbar_port: port@1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/*
+		 * Audio crossbar CPU endpoints:
+		 * Describe connections to HW accelerators (which will
+		 * be addded going forward) and I/O interfaces (which
+		 * are specified in Platform DT files).
+		 */
+	};
+};
-- 
2.7.4

