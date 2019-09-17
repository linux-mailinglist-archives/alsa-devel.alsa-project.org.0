Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E284BB60A3
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 11:46:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B2B51672;
	Wed, 18 Sep 2019 11:46:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B2B51672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568800011;
	bh=lynVK//fqdZ2dNiSLd/QNUzUkVIxBgZOSDmpplEihfk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CgWQvRgpI7glEA4qQtsyaDmTqO2LWtIDhtRd77ISwKUwSXyYVeB92wSmlhmGb8W4B
	 d/pMSqjzB9ABfqZgSuMDqhSC0NeWablZz++LwXtzaHfa1b//L/wtRXqeU3qPqD+ecu
	 iauB/+nsfYVWgweCxHRhAc4WgW/ikEON6dl0k0o0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A208F805F9;
	Wed, 18 Sep 2019 11:43:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28D13F80361; Tue, 17 Sep 2019 14:05:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05CE3F80146
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 14:05:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05CE3F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="D0VsMS0V"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20190917120519euoutp029ad93c256615326d352cbe4333d797af~FOEYt5XL21488014880euoutp02W
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 12:05:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20190917120519euoutp029ad93c256615326d352cbe4333d797af~FOEYt5XL21488014880euoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568721919;
 bh=y4ZmDUm+bZwwm0HD0MSPy7z7w+r1qg+vl9fIhezgRHE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D0VsMS0VkEppsNF1mSYLJe7vcy6iD70nXrj61BT7yu2lYdcSBhcBLpNmad4LYsezI
 kvLHH5/NY9ypSmtwn8xy6VZyxX50bUQbHN3BwQdQgbssuvuAs/AQJi/ZDFzirZZe0u
 NiQpSPZoZP2/dv7iHH4Hk1vBKIcLeSwioeXAZ9TA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20190917120518eucas1p1c5d478fa7565415b6cfe89d435bf4fc6~FOEYKr6Sd1203712037eucas1p1w;
 Tue, 17 Sep 2019 12:05:18 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 3F.88.04374.EFBC08D5; Tue, 17
 Sep 2019 13:05:18 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20190917120517eucas1p1188d244fac2d10d7990363ff25ffb70d~FOEXXWCBw1184811848eucas1p18;
 Tue, 17 Sep 2019 12:05:17 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190917120517eusmtrp25d22099ece0b279a2a2d576d8540ea3a~FOEXJHC690474004740eusmtrp2C;
 Tue, 17 Sep 2019 12:05:17 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-36-5d80cbfec979
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 16.E3.04166.DFBC08D5; Tue, 17
 Sep 2019 13:05:17 +0100 (BST)
Received: from AMDC2459.digital.local (unknown [106.120.51.95]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190917120516eusmtip22d2b97db6ed6bed0d1866d7d2da64efc~FOEWb2zks1881518815eusmtip2J;
 Tue, 17 Sep 2019 12:05:16 +0000 (GMT)
From: Maciej Falkowski <m.falkowski@samsung.com>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Date: Tue, 17 Sep 2019 14:04:52 +0200
Message-Id: <20190917120452.28135-1-m.falkowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190917111413.22711-1-m.falkowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsWy7djP87r/TjfEGpw7LWlxa905VosrFw8x
 WUx9+ITNYv4RIPf8+Q3sFt+udDBZXN41h81ixvl9TBYPmtexWaw9cpfdYun1i0wWrXuPsFsc
 ftPOanFxxRcmBz6PDZ+b2DzWzFvD6LFz1l12j02rOtk8+rasYvT4vEkugC2KyyYlNSezLLVI
 3y6BK+Pex2vsBaedK07u/MTcwHjPpIuRk0NCwERi0snn7F2MXBxCAisYJRacncQG4XxhlPg9
 +xhU5jOjxOyN+xlhWqZua2eBSCxnlOjftw2h5VJnO1gVm4CBRP+bvSwgtohAncTEafOYQYqY
 BR4yStzZ+5kdJCEsECmxZd0usAYWAVWJlz/nsnYxcnDwCthI9OzihdgmL7F6wwFmEJtTwFZi
 7q2/rCBzJATWsUts3HmSHaLIReJq22oWCFtY4tXxLVBxGYn/O+czgcyUEKiWuPZNFqK3hVHi
 +rS3bBA11hJ/Vk1kA6lhFtCUWL9LHyLsKLHsxXeoVj6JG28FQcLMQOakbdOZIcK8Eh1tQhCm
 qsSbCbEQjdISrWtgQeUh8evWUWhQTWCUONSxlG0Co/wshF0LGBlXMYqnlhbnpqcWG+ellusV
 J+YWl+al6yXn525iBKac0/+Of93BuO9P0iFGAQ5GJR7eG5vrY4VYE8uKK3MPMUpwMCuJ8AbU
 AoV4UxIrq1KL8uOLSnNSiw8xSnOwKInzVjM8iBYSSE8sSc1OTS1ILYLJMnFwSjUwhj115pyZ
 u+mbs58Q44JzB+IzVjwR17x5IE24vXnuGq9rMjHVXGZn8253Ty/0mfFLcLGI4KYGXrtj1kvU
 vnx4/5a3KvZLFJNWnb/TUu0/2340vyhavlTxv+A+lkOKvBc91bQXu6ZzirZcXh1/fN4jFc1U
 LqtnmkuMdFdu50mbKc5RdpNHeIWZEktxRqKhFnNRcSIAC70CdjUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplkeLIzCtJLcpLzFFi42I5/e/4Pd2/pxtiDW7fkrO4te4cq8WVi4eY
 LKY+fMJmMf8IkHv+/AZ2i29XOpgsLu+aw2Yx4/w+JosHzevYLNYeuctusfT6RSaL1r1H2C0O
 v2lntbi44guTA5/Hhs9NbB5r5q1h9Ng56y67x6ZVnWwefVtWMXp83iQXwBalZ1OUX1qSqpCR
 X1xiqxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl3Hv4zX2gtPOFSd3fmJu
 YLxn0sXIySEhYCIxdVs7SxcjF4eQwFJGiTnzrzJCJKQl9l/7yA5hC0v8udbFBlH0iVFi1olV
 YAk2AQOJ/jd7wbpFBJoYJebf/AnmMAu8ZZRo2XGIqYuRg0NYIFzi8ipjkAYWAVWJlz/nsoKE
 eQVsJHp28UIskJdYveEAM4jNKWArMffWX1YQWwioZOmTM+wTGPkWMDKsYhRJLS3OTc8tNtQr
 TswtLs1L10vOz93ECIyCbcd+bt7BeGlj8CFGAQ5GJR7eA6caYoVYE8uKK3MPMUpwMCuJ8AbU
 1scK8aYkVlalFuXHF5XmpBYfYjQFumkis5Rocj4wQvNK4g1NDc0tLA3Njc2NzSyUxHk7BA7G
 CAmkJ5akZqemFqQWwfQxcXBKNTBa7irM1pJRvMDrZrVp103+k3LVDDduVL95ph1+Z5Py5HPP
 /3o7Fq4NyV5+e1VTZ+LV+MTWTUsFbz3S2LMgZfb3bSEN3/lf6Tsujtw+6WO267bCt+atlRfq
 lEU6S5L2rwuq4eDuUH8wTS1+74TiT2LcPdtPyCjdKQvJ1C9fkNQ7Z1nlZd/O+YlKLMUZiYZa
 zEXFiQDUpY1amAIAAA==
X-CMS-MailID: 20190917120517eucas1p1188d244fac2d10d7990363ff25ffb70d
X-Msg-Generator: CA
X-RootMTR: 20190917120517eucas1p1188d244fac2d10d7990363ff25ffb70d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190917120517eucas1p1188d244fac2d10d7990363ff25ffb70d
References: <20190917111413.22711-1-m.falkowski@samsung.com>
 <CGME20190917120517eucas1p1188d244fac2d10d7990363ff25ffb70d@eucas1p1.samsung.com>
X-Mailman-Approved-At: Wed, 18 Sep 2019 11:43:26 +0200
Cc: mark.rutland@arm.com, m.falkowski@samsung.com, sbkim73@samsung.com,
 broonie@kernel.org, lgirdwood@gmail.com, krzk@kernel.org, a.hajda@samsung.com,
 robh+dt@kernel.org, s.nawrocki@samsung.com, m.szyprowski@samsung.com
Subject: [alsa-devel] [PATCH v2 1/2] dt-bindings: sound: Convert Samsung I2S
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

Convert Samsung I2S controller to newer dt-schema format.

Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
v2:
- Added missing Signed-off-by certificate
---
 .../devicetree/bindings/sound/samsung-i2s.txt |  84 -------------
 .../bindings/sound/samsung-i2s.yaml           | 119 ++++++++++++++++++
 2 files changed, 119 insertions(+), 84 deletions(-)
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
index 000000000000..59dc76035cb4
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
@@ -0,0 +1,119 @@
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
+  - Sangbeom Kim <sbkim73@samsung.com>
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
+
+      exynos7 I2S has 7.1 channel TDM support for capture, secondary fifo
+      with only external dma and more no.of root clk sampling frequencies.
+
+      samsung,exynos7-i2s1: I2S1 on previous samsung platforms supports
+      stereo channels. exynos7 i2s1 upgraded to 5.1 multichannel with
+      slightly modified bit offsets.
+    enum:
+      - "samsung,s3c6410-i2s"
+      - "samsung,s5pv210-i2s"
+      - "samsung,exynos5420-i2s"
+      - "samsung,exynos7-i2s"
+      - "samsung,exynos7-i2s1"
+
+  reg:
+    maxItems: 1
+
+  dmas:
+    description: list of DMA controller phandle and DMA request line ordered pairs.
+
+  dma-names:
+    description: |
+      identifier string for each DMA request line in the dmas property.
+      These strings correspond 1:1 with the ordered pairs in dmas.
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    oneOf:
+      - items:
+          - const: iis
+      - items:
+          - const: iis
+          - const: i2s_opclk0
+      - items:
+          - const: iis
+          - const: i2s_opclk0
+          - const: i2s_opclk1
+    description: |
+      "iis" is the i2s bus clock.
+      For i2s1 and i2s2 - "iis", "i2s_opclk0"
+      For i2s0 - "iis", "i2s_opclk0", "i2s_opclk1"
+
+  "#clock-cells":
+    const: 1
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
+    i2s0: i2s@3830000 {
+        compatible = "samsung,s5pv210-i2s";
+        reg = <0x03830000 0x100>;
+        dmas = <&pdma0 10
+                &pdma0 9
+                &pdma0 8>;
+        dma-names = "tx", "rx", "tx-sec";
+        clocks = <&clock_audss 0>, // EXYNOS_I2S_BUS
+                <&clock_audss 0>, // EXYNOS_I2S_BUS
+                <&clock_audss 0>; // EXYNOS_SCLK_I2S
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
