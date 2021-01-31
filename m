Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8791730D3A7
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Feb 2021 08:03:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B9FA1741;
	Wed,  3 Feb 2021 08:02:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B9FA1741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612335797;
	bh=CwFNVjrVK62N3TAY3o7IKcQYL62hNKs6oms0HU/LKN8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qELW4finv6cn6daKFBShfDNLNRhp9Aux+ztigdFSN0eRRt2/oUAu2PWf+4WmXdtzK
	 2jv8WEp4QD3ZnxUGwgpxYiUbjGJy4smdICzMJAJeb5bgW5DxPA4s+2l/3J4vd4DYYN
	 JvCdx0tH+1mCBhh1dehwYlMP7l3dy2LBSc1cXyRI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A4B4F8023A;
	Wed,  3 Feb 2021 08:01:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D450F801F7; Sun, 31 Jan 2021 19:43:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sonic309-52.consmr.mail.ir2.yahoo.com
 (sonic309-52.consmr.mail.ir2.yahoo.com [77.238.179.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92DCCF8016E
 for <alsa-devel@alsa-project.org>; Sun, 31 Jan 2021 19:43:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92DCCF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="lVka3P44"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1612118612; bh=v7I3tB+1qyMyvErvK8UKhycYIpGAyMoxrrmdcVZj7mE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=lVka3P44uu/iXMrBGDnWObq6EtqDGzT0BFGwsOoTU5l3JcIVhFkYJpY89FzxDT+NVa2OpFHeAAoSLAnFaQAVHYJGE0KB7/CWvBCMNd0czFcw2wEgRMyMKgIuI4Zu1//zr4B95U4HSL5DRtBL7CwAas1tduVvFaF0ujvIGAwEIFPGwI85M3MFz97y7PsiVs50w3ZCRfMN/iHJY0XY3t5jKgumJQ7ualUnGAuCWVIgmF/pQy9EIzfxBFMgXeM1sCi4LK5rc1fJ3kCYjrN5QTcvl5mJcAG8fk0h8LZ1C2LgMXTwfl6MePRxN4lsHXDxWBWOc7iifV7iWwRxU1rnuXhIpA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1612118612; bh=Xw32kWVeSK/CayVh5GjdMPF94gk59hANTj3RE6CRAu0=;
 h=From:To:Subject:Date:From:Subject:Reply-To;
 b=QWITY4ZAQYUibjFOtVrr8t/MO58KMUAeJwfCgEJjJh9Nxt+DMP7kfu3cw/ohaJkzdgmux2QuZ2vNJStjnsPCTV5lpxToZp3Q/7lFlG0kr1zluiFXh3dx6x0b7ka2C0At+sd7eT3QaAJkT3AxCwbB5vLYutZ7xhi04rjVrCiNKcTbYHVHMK0U0RQSTCDXigiQSbf/278VnECCOeRCdT+N3A/0aJlQsXp5Bu/3tb7Cb1/zlp/k+dK5V6pr2GPsGj/jebo57GidxTrFlQIXOdgMhnH9BinxV96Qrv9UsbKz53f4v7SMO2yw+hEiMoVASHs77/ikQg6CsbjmX6wXd+GH/g==
X-YMail-OSG: o0_EcD0VM1msosdSEHQXbyovlD1nb0aaogVt7SUhoY42Y8a_g7kbK4iUHvpGYlo
 Yh8C9uWEN9kAV49k6L1ULlRaaHRYwW7OOcApiAIF5ECw.fVBz1V5ZyE9qz8pOXlsvAqmWhpMB1k9
 R3VbSzajGH0xZP3Rdm_mnfY8JMshLS8o8zEliA.xzW.ZrSR0urfTgWd8j4vcUx4Vo6Ov4.3HSlWb
 GhU4ZOXMhUkIAjrc0u0htB2EZOdbpAmg089TDyB7PBm4kK.apaIXm0LZfCXA9rxbdOnj_nuMjQfD
 E6Sn9VEWUahe5eP33TU2M.fjFE0sy4m2YikE58CpOGkzBYfAEK8ZOujuGscrN7jGjJ4Z.vfYdvwX
 eCJamdaBWdQUlb3gRjRrBcRG2KV05Dl.K86uOPaCuL4_HHl_2U4XzAPMVoHnn3Nnk8fAC_k8EvKK
 oKuCb2YojV7.hBjOgncNv6mx1FWo1cP9nm.uhAx_1Vl0raMcHlz6SXRrX.Pq5Vrpc1Ui2FnSbfnL
 SD0Le70TbnWApGS_v1f4HISZT6e0RXeXbnNlYmk8RrtZNr0jFcehrUZ0kuCKUa2cdSKghbr1ZqfR
 wAKZY7rlCF5lLZMAIDlfQ7mC9kvtUDCAFl5MgkHgis_29Eon7FUv1qNTrIrUXQqDTBDGfomplNQe
 V2pqFWPNNQZeqVsy4SpzQFqsMS1bRiywhDeALRQB12w0QinKrr6.G2T.QnxuCG6fID90nML68yqQ
 kqo4zAoXICcWSDDMZ1dFxBdqXgGkoNuuWHNU3bPyRe1rAbcKGM38fPt3H04Gr9pPuwjFJ.6mA4Ou
 .XDsgk3zQlcx4W3StRs4JqcM_AKY_rgSlU9zxIUZduqT4.Mhqnjb0.YLfji9FvwvfoBQ7CNdcWo7
 GKBhmwT5.6U9JLpUQ6OL001jLTlnCgvUbRc2XPJ.XFcJ.9.iVmE8ydKgZT4DWUZKlGXll63KlUSk
 IUHrgE5kS4PtG83V.yOwWVsB5gcKRbhDio9Ppp2760iM34Vxkdw0yiX7S5UeuMh6D.IvhHpFDCLY
 loWBITVwCUIXWbSagMgNbepeNxIqpsjdhZl2H8eyg.io6iqYAYWqABLOy60WVUscVgN4U6sooQVh
 tp1LE1tvNv4.ZBmVFNq9AodTPlfaTVH7EGP4QsK4DdVJqf.apBJ4fbzCK_c7ATdfmrkC.EFcsZZE
 o53I0GlNSTu_lho4EyPFCXODp0xpFRR_gpphvAlA2r_s9KsZopClisDLp.lWyweo5kD.SZJ9Fiio
 hAXZgz8hxGoKQzaD2Xx3R03vDySkCgesjJc5D7MQrvmHt.VZ8w5PblP5gqSz2K.n5Cweg3O2gV8B
 FOgitPoHAIBPpJ6NA3yMUunT4vEp98_Jiw9uqpEPSJBVIPgC8KPVOhkwgF5FX8B_4u6cSZynlvjr
 9HBcGzoTTDSQlOpxwhiuzmfkjIrpCK7IKFDx8I15V5H9wOwIwU9.2yzCnz.El99WoJUUQ4kZJCt9
 paMUSmoXvK3GE6h2XRX8aWbJLFtTk2Ld8KXwjKexBNpxr14LTDbJ79xmZI5m95rIpOGNTguy9XQT
 xFQJNdKo0mAdpRG_WkE5lHT1n5ZmzNlqLLpUS.v9xymWJaSm2p8IJ6_rzgKOKtCUhUQSzKH2xYVX
 Sb6JHYcUsVknjm1hz69Vrco0bGXgo7ASg8agiwCNo7qfzffwFMD2O75haZt.VFyHmfMeEWQXRE8f
 FKLNTveGR1GU4tnf0ZFT1kzBX2TLa2wOEQTTV7Pe4Me4e1EgJuJdqZ3aVCVIzJhgRWs1MFuFUNZS
 qph482ZE2ZpYaF95leQZFfEkEcnpXFNQRISyGpD_dEwPVxrEBfTz5HnX8QC.Xbu9SBmnT2uQXRsS
 DSQGax.W_QUFL_xBp4CMJCdn6_zyeJGK971.tkqNZG7.zkTTBgi8bovKMCe8EAaZJ_Nu8rC.4cs.
 5.3o1sbRcm21VW6K_XeVJ9nq782iFDbk72L_lJLWwy_Jkx95vXnnMDz8F1Q66pZtRCCezi0xRjRk
 yb3qOgZdhZ52K893Zz8tzu60EikkHVAYv45dLfoqdlV_NoLAQkYBCKhqvGt6ypiJTy2rPomKM0t2
 lzrnNh3TI83DlgLXTUuOktdBAkK8jCav8136PQv5LF0Yvtj6gLlpmhulfGO78V.sQcvJYpF14c0i
 tSOEuXgT5zaZyfCTWlrbFQj0pqo0PvqjuTu2suOWT59rdUkoltxU_iroynCDk_QJCx5tPVIJQG22
 fUzhx1VXPTfFeQQmCGgqA.1XHzGfHrI4dglNSAWKn.nU8x0D90Dq9QA6bcm82j8ywpxM_Sxb7c5w
 Fp5SyTdqLaL_OFX86NocsTIN7yzm3Lf9vRjkvuGsAzpJdBcYSGfwFdbB51qyEZSyzLKoQrDD7TQ2
 vIrHZCI0gpFniC4Bh430tBtl81KAwSsgFC0G7ST.Ggj2AXmXAr2XT9Iux3zHSCcVygEhnGr.1Veb
 rGbOJ6U2iQc.wowwi6tUHW__QNERLxJQ7kX_urZudati7THynIPiNHbiHXbHIQn6ZLTgLhZqadDz
 oEDvyYbQmLXup2zY0a6A94kKGESk6I4_.OBz2iaKd9W7v9E58_3wHVLNQZYjaiKXbuHZYCQVyFc4
 p6DujTu7pgoMx_q.BE9FEivWnlBWx11sT_8j9KuW9.919UVupN8Fg4D7.QTfiCi5R.TKMX4ixeq3
 uqq23l4x384X554xsMCGIh0.jeoiKSBvMUw_4bJDHMAekj291BKfike3Q7ue8WUqUDTg5GPMDD.w
 5AMlz2L51DTgHd9faFw8Tp3s2lJSfal2uGm9b3aJuXzgw46K.cHUSdHP0ZaOsvQAE09J4etxz7Wb
 JZQGVaCI7G_EtXtYYKdi7gm0KxIYnK4tagu0vICfiawKLaM0uohP8rDOhetp8htn6TX1FYjCM9kX
 yP.CcZWzmkCDn_5aqNj00QJ8KLhqsSILny6_HlGNA.eUuG8I6MRxC01tfwExEnCIFfI12XUPc1bc
 TzylM7NMP9LzYtX10q8RpfnZkmlLT9evZptpOngTp9xXj_WwsQOyx
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ir2.yahoo.com with HTTP; Sun, 31 Jan 2021 18:43:32 +0000
Received: by smtp407.mail.ir2.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID e16a2e904335ed9f41206b782293961f; 
 Sun, 31 Jan 2021 18:41:30 +0000 (UTC)
From: Ion Agorria <AG0RRIA@yahoo.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Stephen Warren <swarren@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Rob Herring <robh+dt@kernel.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Ion Agorria <ion@agorria.com>,
 Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 1/2] ASoC: dt-bindings: tegra: Add binding for RT5631
Date: Sun, 31 Jan 2021 19:41:00 +0100
Message-Id: <20210131184101.651486-2-AG0RRIA@yahoo.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131184101.651486-1-AG0RRIA@yahoo.com>
References: <20210131184101.651486-1-AG0RRIA@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 03 Feb 2021 08:01:31 +0100
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

From: Svyatoslav Ryhel <clamor95@gmail.com>

Add device-tree binding that describes hardware integration of RT5631
audio codec chip with NVIDIA Tegra SoCs.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Ion Agorria <ion@agorria.com>
---
 .../sound/nvidia,tegra-audio-rt5631.yaml      | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
new file mode 100644
index 000000000000..6ee62c599518
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5631.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra RT5631 ASoC
+
+description: |
+  This binding describes integration of the Realtek ALC5631/RT5631 sound
+  codec with the sound system of NVIDIA Tegra SoCs.
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Stephen Warren <swarren@nvidia.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+properties:
+  compatible:
+    enum:
+      - nvidia,tegra-audio-rt5631
+
+  clocks:
+    minItems: 3
+    items:
+      - description: PLL A clock
+      - description: PLL A OUT0 clock
+      - description: The Tegra cdev1/extern1 clock, which feeds the card's mclk
+
+  clock-names:
+    minItems: 3
+    items:
+      - const: pll_a
+      - const: pll_a_out0
+      - const: mclk
+
+  assigned-clocks:
+    minItems: 1
+    maxItems: 3
+
+  assigned-clock-parents:
+    minItems: 1
+    maxItems: 3
+
+  assigned-clock-rates:
+    minItems: 1
+    maxItems: 3
+
+  nvidia,model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User-visible name of this sound complex.
+
+  nvidia,audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      A list of the connections between audio components.
+      Each entry is a pair of strings, the first being the connection's sink,
+      the second being the connection's source. Valid names for sources and
+      sinks are the RT5631's pins (as documented in its binding), and the jacks
+      on the board:
+
+      * Int Spk
+      * Headphone Jack
+      * Mic Jack
+      * Int Mic
+
+  nvidia,i2s-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle of the Tegra I2S controller.
+
+  nvidia,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle of the RT5631 audio codec.
+
+  nvidia,hp-mute-gpios:
+    description: GPIO that mutes the headphones (button event).
+    maxItems: 1
+
+  nvidia,hp-det-gpios:
+    description: GPIO that detects headphones plug-in.
+    maxItems: 1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - assigned-clocks
+  - assigned-clock-parents
+  - nvidia,model
+  - nvidia,audio-routing
+  - nvidia,i2s-controller
+  - nvidia,audio-codec
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra30-car.h>
+    #include <dt-bindings/soc/tegra-pmc.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    sound {
+        compatible = "nvidia,tegra-audio-rt5631";
+        nvidia,model = "NVIDIA Tegra RT5631";
+
+        nvidia,audio-routing =
+            "Headphone Jack", "HPOL",
+            "Headphone Jack", "HPOR",
+            "Int Spk", "SPOL",
+            "Int Spk", "SPOR",
+            "MIC1", "MIC Bias1",
+            "MIC Bias1", "Mic Jack",
+            "DMIC", "Int Mic";
+
+        nvidia,i2s-controller = <&tegra_i2s1>;
+        nvidia,audio-codec = <&rt5631>;
+
+        nvidia,hp-det-gpios = <&gpio 178 GPIO_ACTIVE_LOW>;
+        nvidia,hp-mute-gpios = <&gpio 186 GPIO_ACTIVE_LOW>;
+
+        clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
+                 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
+                 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+        clock-names = "pll_a", "pll_a_out0", "mclk";
+
+        assigned-clocks = <&tegra_car TEGRA30_CLK_EXTERN1>,
+                          <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+
+        assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
+                                 <&tegra_car TEGRA30_CLK_EXTERN1>;
+    };
+
+...
-- 
2.26.2

