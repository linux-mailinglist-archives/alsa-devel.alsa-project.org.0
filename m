Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54604BDEF5
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2019 15:28:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC92F16FF;
	Wed, 25 Sep 2019 15:27:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC92F16FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569418106;
	bh=AowwMKzz6mDK4ZI06ol6f05alVayAhKjQ81U1D2WGMI=;
	h=From:To:Date:References:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UuoxvD/JpkFLK6KqkzwY3Ml13sp7i9TDjrtRNyZu+SU9axztBSSpy1S4joND9InEN
	 pydJ5kPQVSyXBYZLCKZPvbTueRjCeE5/r4sqqrzM3hraivgW/Xhk7KiT6gBDoW9yTk
	 +XInzLbU0gpTyaGN82i+Gm6Kc0BSywOnuQnWDKm4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43B70F80508;
	Wed, 25 Sep 2019 15:26:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C5FDF8049C; Wed, 25 Sep 2019 15:26:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26ABCF80213
 for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2019 15:26:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26ABCF80213
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="L1gwWJpP"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190925132645euoutp0144fa1c1e715d1df1d4ae1cc858259eee~HsVxJ8QWj0647006470euoutp01W
 for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2019 13:26:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190925132645euoutp0144fa1c1e715d1df1d4ae1cc858259eee~HsVxJ8QWj0647006470euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1569418005;
 bh=XPDoDSj1VKXjc91YR75MQOs2jtTnUErfhMkcE1S154M=;
 h=From:To:Cc:Subject:Date:References:From;
 b=L1gwWJpPbYkzgnpjdgDTgBX1Sn4qKtbO2fySLz2UMBaSJRyWXZ/NUMgzZC4hzKo3P
 0Pbwh0IgnZ5fl9PND4MKyachqwcgpHRnpPvMkDKJgxoR8lhogB9i5qsUQMc/BiRJF0
 AElwZfyLs9E0UeVsQI8HOJpalmyBQF9qgvtoTHmc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190925132644eucas1p2217e83b763060f8760286c2d4addf2ee~HsVwoypeT1496214962eucas1p2d;
 Wed, 25 Sep 2019 13:26:44 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id DF.C7.04309.41B6B8D5; Wed, 25
 Sep 2019 14:26:44 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190925132644eucas1p2716a805d184f9bbc4ad7a94cc9cca633~HsVwJ5K-N0152201522eucas1p2h;
 Wed, 25 Sep 2019 13:26:44 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190925132644eusmtrp28b3a5be336b588e7e38e804cf61da447~HsVwJKE-I0742607426eusmtrp2N;
 Wed, 25 Sep 2019 13:26:44 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-47-5d8b6b14dc18
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 34.36.04117.31B6B8D5; Wed, 25
 Sep 2019 14:26:43 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190925132643eusmtip2525d1cd22b254808f2d651b5d6c2c6f0~HsVvlag4_0547405474eusmtip2T;
 Wed, 25 Sep 2019 13:26:43 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Date: Wed, 25 Sep 2019 15:26:28 +0200
Message-Id: <20190925132628.31858-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42LZduzneV2R7O5Yg39PJC2uXDzEZDH14RM2
 i/lHzrFanD+/gd3i25UOJovLu+awWcw4v4/J4kHzOjaLtUfuslssvX6RyaJ17xF2i8Nv2lkd
 eDw2fG5i81gzbw2jx85Zd9k9Nq3qZPPo27KK0ePzJrkAtigum5TUnMyy1CJ9uwSujOlf3rAW
 fHCvePOBvYFxvXkXIweHhICJxL9mwy5GLg4hgRWMElNWrmWFcL4wSkx+v50dwvnMKLGibypT
 FyMnWMeTyZuZIBLLGSWOzr3KDtey4N52RpAqNgFDia63XWwgtohAncTZM0cYQYqYBY4wSTTf
 /w02SlggVOLFum6wIhYBVYkDCz4xg9i8ArYS9xYeZYZYJy+xesMBKLuZXeL5ElEI20Xi6ctO
 VghbWOLV8S3sELaMxP+d88HOA6pnlHh4bi07hNPDKHG5aQYjRJW1xOHjF1lBQcAsoCmxfpc+
 RNhR4sbMxcyQkOGTuPFWECTMDGRO2jYdKswr0dEmBFGtJjHr+Dq4tQcvXII600PiRmsX2GlC
 ArESq17vZJzAKDcLYdcCRsZVjOKppcW56anFRnmp5XrFibnFpXnpesn5uZsYgWnk9L/jX3Yw
 7vqTdIhRgINRiYf3QFh3rBBrYllxZe4hRgkOZiUR3lkyXbFCvCmJlVWpRfnxRaU5qcWHGKU5
 WJTEeasZHkQLCaQnlqRmp6YWpBbBZJk4OKUaGPXOavCfdalNVTzZnfZ0l8fFU8p35LvqRHcv
 /34iYMq61VdVW7YePDzhW9r92Quf785vrO3Rz3x7unVP/skzS86Y3mw+Wnk75tjhjZ+mvr15
 tOH9ysuHGr4Y/tzVF1k2odLeZ/2jojfTl++N+ihpW7wtiytp+fzd/AoOjvM/n1UROzlD49Au
 ObZgJZbijERDLeai4kQA5z3jkx8DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsVy+t/xe7rC2d2xBi+3WFpcuXiIyWLqwyds
 FvOPnGO1OH9+A7vFtysdTBaXd81hs5hxfh+TxYPmdWwWa4/cZbdYev0ik0Xr3iPsFofftLM6
 8Hhs+NzE5rFm3hpGj52z7rJ7bFrVyebRt2UVo8fnTXIBbFF6NkX5pSWpChn5xSW2StGGFkZ6
 hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GdO/vGEt+OBe8eYDewPjevMuRk4OCQET
 iSeTNzN1MXJxCAksZZS41rmCCSIhI3FyWgMrhC0s8edaFxtE0SdGieuznoIl2AQMJbreQiRE
 BJoYJY5tnskC4jALnGKSuHF1CiNIlbBAsMTffy/AbBYBVYkDCz4xg9i8ArYS9xYeZYZYIS+x
 esMB5gmMPAsYGVYxiqSWFuem5xYb6RUn5haX5qXrJefnbmIEhvC2Yz+37GDsehd8iFGAg1GJ
 h1cisjtWiDWxrLgy9xCjBAezkgjvLJmuWCHelMTKqtSi/Pii0pzU4kOMpkDLJzJLiSbnA+Mr
 ryTe0NTQ3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2ampBahFMHxMHp1QDY2DvmamXf+5I3Mq1
 zbn3leyrIOGwcNWWB8wKPxX9HR7Yzpus/SGnrvNGRX3DluBQ+fOL+vZtz1a48EWpZvmtbVMS
 I2rDJs3cdPsfu9XByxbL5V8+rjxk2f3OSaMpTYrVhb1m/aZXFg+Tj067IMP6SU7D7M2C+3/O
 sp8/dnjNzpjr/5xdqo4F1CqxFGckGmoxFxUnAgCDOwKadwIAAA==
X-CMS-MailID: 20190925132644eucas1p2716a805d184f9bbc4ad7a94cc9cca633
X-Msg-Generator: CA
X-RootMTR: 20190925132644eucas1p2716a805d184f9bbc4ad7a94cc9cca633
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190925132644eucas1p2716a805d184f9bbc4ad7a94cc9cca633
References: <CGME20190925132644eucas1p2716a805d184f9bbc4ad7a94cc9cca633@eucas1p2.samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maciej Falkowski <m.falkowski@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [alsa-devel] [PATCH v5] dt-bindings: sound: Convert Samsung I2S
 controller to dt-schema
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Maciej Falkowski <m.falkowski@samsung.com>

Convert Samsung I2S controller to newer dt-schema format.

Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v5:
- Removed '#clock-cells' property from required properties
- Added deprecated property to 'clock-output-names'
and removed corresponding comment. 

Best regards, 
Maciej Falkowski
---
 .../devicetree/bindings/sound/samsung-i2s.txt |  84 -----------
 .../bindings/sound/samsung-i2s.yaml           | 136 ++++++++++++++++++
 2 files changed, 136 insertions(+), 84 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.txt
 create mode 100644 Documentation/devicetree/bindings/sound/samsung-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.txt b/Documentation/devicetree/bindings/sound/samsung-i2s.txt
deleted file mode 100644
index a88cb00fa096..000000000000
--- a/Documentation/devicetree/bindings/sound/samsung-i2s.txt
+++ /dev/null
@@ -1,84 +0,0 @@
-* Samsung I2S controller
-
-Required SoC Specific Properties:
-
-- compatible : should be one of the following.
-   - samsung,s3c6410-i2s: for 8/16/24bit stereo I2S.
-   - samsung,s5pv210-i2s: for 8/16/24bit multichannel(5.1) I2S with
-     secondary fifo, s/w reset control and internal mux for root clk src.
-   - samsung,exynos5420-i2s: for 8/16/24bit multichannel(5.1) I2S for
-     playback, stereo channel capture, secondary fifo using internal
-     or external dma, s/w reset control, internal mux for root clk src
-     and 7.1 channel TDM support for playback. TDM (Time division multiplexing)
-     is to allow transfer of multiple channel audio data on single data line.
-   - samsung,exynos7-i2s: with all the available features of exynos5 i2s,
-     exynos7 I2S has 7.1 channel TDM support for capture, secondary fifo
-     with only external dma and more no.of root clk sampling frequencies.
-   - samsung,exynos7-i2s1: I2S1 on previous samsung platforms supports
-     stereo channels. exynos7 i2s1 upgraded to 5.1 multichannel with
-     slightly modified bit offsets.
-
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- dmas: list of DMA controller phandle and DMA request line ordered pairs.
-- dma-names: identifier string for each DMA request line in the dmas property.
-  These strings correspond 1:1 with the ordered pairs in dmas.
-- clocks: Handle to iis clock and RCLK source clk.
-- clock-names:
-  i2s0 uses some base clocks from CMU and some are from audio subsystem internal
-  clock controller. The clock names for i2s0 should be "iis", "i2s_opclk0" and
-  "i2s_opclk1" as shown in the example below.
-  i2s1 and i2s2 uses clocks from CMU. The clock names for i2s1 and i2s2 should
-  be "iis" and "i2s_opclk0".
-  "iis" is the i2s bus clock and i2s_opclk0, i2s_opclk1 are sources of the root
-  clk. i2s0 has internal mux to select the source of root clk and i2s1 and i2s2
-  doesn't have any such mux.
-- #clock-cells: should be 1, this property must be present if the I2S device
-  is a clock provider in terms of the common clock bindings, described in
-  ../clock/clock-bindings.txt.
-- clock-output-names (deprecated): from the common clock bindings, names of
-  the CDCLK I2S output clocks, suggested values are "i2s_cdclk0", "i2s_cdclk1",
-  "i2s_cdclk3" for the I2S0, I2S1, I2S2 devices respectively.
-
-There are following clocks available at the I2S device nodes:
- CLK_I2S_CDCLK    - the CDCLK (CODECLKO) gate clock,
- CLK_I2S_RCLK_PSR - the RCLK prescaler divider clock (corresponding to the
-		    IISPSR register),
- CLK_I2S_RCLK_SRC - the RCLKSRC mux clock (corresponding to RCLKSRC bit in
-		    IISMOD register).
-
-Refer to the SoC datasheet for availability of the above clocks.
-The CLK_I2S_RCLK_PSR and CLK_I2S_RCLK_SRC clocks are usually only available
-in the IIS Multi Audio Interface.
-
-Note: Old DTs may not have the #clock-cells property and then not use the I2S
-node as a clock supplier.
-
-Optional SoC Specific Properties:
-
-- samsung,idma-addr: Internal DMA register base address of the audio
-  sub system(used in secondary sound source).
-- pinctrl-0: Should specify pin control groups used for this controller.
-- pinctrl-names: Should contain only one value - "default".
-- #sound-dai-cells: should be 1.
-
-
-Example:
-
-i2s0: i2s@3830000 {
-	compatible = "samsung,s5pv210-i2s";
-	reg = <0x03830000 0x100>;
-	dmas = <&pdma0 10
-		&pdma0 9
-		&pdma0 8>;
-	dma-names = "tx", "rx", "tx-sec";
-	clocks = <&clock_audss EXYNOS_I2S_BUS>,
-		<&clock_audss EXYNOS_I2S_BUS>,
-		<&clock_audss EXYNOS_SCLK_I2S>;
-	clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
-	#clock-cells = <1>;
-	samsung,idma-addr = <0x03000000>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2s0_bus>;
-	#sound-dai-cells = <1>;
-};
diff --git a/Documentation/devicetree/bindings/sound/samsung-i2s.yaml b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
new file mode 100644
index 000000000000..b9502b82fa9d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/samsung-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung SoC I2S controller
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+
+properties:
+  compatible:
+    description: |
+      samsung,s3c6410-i2s: for 8/16/24bit stereo I2S.
+
+      samsung,s5pv210-i2s: for 8/16/24bit multichannel(5.1) I2S with
+      secondary fifo, s/w reset control and internal mux for root clk src.
+
+      samsung,exynos5420-i2s: for 8/16/24bit multichannel(5.1) I2S for
+      playback, stereo channel capture, secondary fifo using internal
+      or external dma, s/w reset control, internal mux for root clk src
+      and 7.1 channel TDM support for playback. TDM (Time division multiplexing)
+      is to allow transfer of multiple channel audio data on single data line.
+
+      samsung,exynos7-i2s: with all the available features of exynos5 i2s.
+      exynos7 I2S has 7.1 channel TDM support for capture, secondary fifo
+      with only external dma and more no.of root clk sampling frequencies.
+
+      samsung,exynos7-i2s1: I2S1 on previous samsung platforms supports
+      stereo channels. exynos7 i2s1 upgraded to 5.1 multichannel with
+      slightly modified bit offsets.
+    enum:
+      - samsung,s3c6410-i2s
+      - samsung,s5pv210-i2s
+      - samsung,exynos5420-i2s
+      - samsung,exynos7-i2s
+      - samsung,exynos7-i2s1
+
+  reg:
+    maxItems: 1
+
+  dmas:
+    minItems: 2
+    maxItems: 3
+
+  dma-names:
+    oneOf:
+      - items:
+          - const: tx
+          - const: rx
+      - items:
+          - const: tx
+          - const: rx
+          - const: tx-sec
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    oneOf:
+      - items:
+          - const: iis
+      - items: # for i2s0
+          - const: iis
+          - const: i2s_opclk0
+          - const: i2s_opclk1
+      - items: # for i2s1 and i2s2
+          - const: iis
+          - const: i2s_opclk0
+    description: |
+      "iis" is the i2s bus clock and i2s_opclk0, i2s_opclk1 are sources
+      of the root clk. i2s0 has internal mux to select the source
+      of root clk and i2s1 and i2s2 doesn't have any such mux.
+
+  "#clock-cells":
+    const: 1
+
+  clock-output-names:
+    deprecated: true
+    oneOf:
+      - items: # for i2s0
+          - const: i2s_cdclk0
+      - items: # for i2s1
+          - const: i2s_cdclk1
+      - items: # for i2s2
+          - const: i2s_cdclk2
+    description: Names of the CDCLK I2S output clocks.
+
+  samsung,idma-addr:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Internal DMA register base address of the audio
+      sub system(used in secondary sound source).
+
+  pinctrl-0:
+    description: Should specify pin control groups used for this controller.
+
+  pinctrl-names:
+    const: default
+
+  "#sound-dai-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - dmas
+  - dma-names
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos-audss-clk.h>
+
+    i2s0: i2s@3830000 {
+        compatible = "samsung,s5pv210-i2s";
+        reg = <0x03830000 0x100>;
+        dmas = <&pdma0 10>,
+                <&pdma0 9>,
+                <&pdma0 8>;
+        dma-names = "tx", "rx", "tx-sec";
+        clocks = <&clock_audss EXYNOS_I2S_BUS>,
+                <&clock_audss EXYNOS_I2S_BUS>,
+                <&clock_audss EXYNOS_SCLK_I2S>;
+        clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
+        #clock-cells = <1>;
+        samsung,idma-addr = <0x03000000>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&i2s0_bus>;
+        #sound-dai-cells = <1>;
+    };
+
-- 
2.17.1



_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
