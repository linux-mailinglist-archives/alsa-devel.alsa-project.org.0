Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEB1B8F52
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 13:53:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B14881678;
	Fri, 20 Sep 2019 13:53:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B14881678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568980434;
	bh=k+3E6y3wI+mP9O1jA84jN9aP1B6GQHVlkxe0qgRufLg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I+CpyTAjT4naqD4dVN2OfheS2ya+QaGggRjN/gCtqa7D0HmuCCnTmNhGIlpdPBwmB
	 QsUKlO2Ff/NdzircvGfUxe1mU9EC5I7nAr+3EM7wsjuxQk+zx/J10OZ1Qw6tCIiRZq
	 XSb74kgxB9Bja9f3gADHZEMiQMTofvSXtosNfxmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F298FF804FF;
	Fri, 20 Sep 2019 13:52:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C625F80506; Fri, 20 Sep 2019 13:52:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0ED7F80146
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 13:52:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0ED7F80146
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com
 header.b="i2biMoES"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20190920115202euoutp0113b97e00bf0cef73c29bd7bffecf010c~GI0pW6pyj0788407884euoutp01P
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 11:52:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20190920115202euoutp0113b97e00bf0cef73c29bd7bffecf010c~GI0pW6pyj0788407884euoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1568980322;
 bh=LdpnFosArp18PSXWxbWOiB78llp8RSy/a48eY2UkFgo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i2biMoESeyQb6QlrgW2cDyNy5rKplQT431x2UgMhLiucTUBwfip5V/9x6nVIuWQio
 TOgMKW6zqwGEWIIwHPS8hZUJEsgI9UXdDsQP8JRoBnIvxesO5k2HyHGdCMxyHMFKyS
 wO5loY2FoS+urwtfIt740Qw8qWz91lvWj+ghAUsw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190920115201eucas1p2a7c5ab0b43df6524df9c731b6e1d14b1~GI0ot4Zex0750807508eucas1p2d;
 Fri, 20 Sep 2019 11:52:01 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 24.23.04469.16DB48D5; Fri, 20
 Sep 2019 12:52:01 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190920115200eucas1p2253a3eb13373061ef8aa39131c98a319~GI0nq1sZM1617116171eucas1p20;
 Fri, 20 Sep 2019 11:52:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190920115200eusmtrp1caf59b818f2a18b9d5ae6ef1db8e32c3~GI0nZBdKN2442224422eusmtrp10;
 Fri, 20 Sep 2019 11:52:00 +0000 (GMT)
X-AuditID: cbfec7f2-569ff70000001175-cf-5d84bd6108b9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id EB.08.04117.06DB48D5; Fri, 20
 Sep 2019 12:52:00 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190920115159eusmtip152781bf9abf176baae7494360c48dd07~GI0mrrjGe0753107531eusmtip1D;
 Fri, 20 Sep 2019 11:51:59 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Date: Fri, 20 Sep 2019 13:35:40 +0200
Message-Id: <20190920113540.30687-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAL_JsqJ=QWk07y=h7dHFiRrKuE7NGoUr50bu3kiOC+YU8qS9jg@mail.gmail.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrAKsWRmVeSWpSXmKPExsWy7djP87qJe1tiDVY/ELG4te4cq8WVi4eY
 LKY+fMJmMf8IkHv+/AZ2i29XOpgsLu+aw2Yx4/w+JosHzevYLNYeuctusfT6RSaL1r1H2C0O
 v2lndeD12PC5ic1jzbw1jB47Z91l99i0qpPNo2/LKkaPz5vkAtiiuGxSUnMyy1KL9O0SuDLe
 rJ7JXLDKo2Jh4x/mBsY/5l2MnBwSAiYSF9t/MXUxcnEICaxglOh/8pgFwvnCKHFm+VVmkCoh
 gc+MEu9P6cF0zOpoY4QoWs4ocePzcja4jsYdPxhBqtgEDCW63naxgdgiAnUSJ28uBhvLLPCS
 SeLy562sIAlhgVCJw4vegNksAqoSbQsawNbxCthK7J2/iR1inbzE6g0HwOKcAoESS/o2gR0r
 IbCMXeL77mY2iCIXif9z1jFD2MISr45vgWqWkTg9uYcFoqGZUeLhubXsEE4Po8TlphmMEFXW
 EoePXwQ6gwPoPk2J9bv0IcKOEv3tXSwgYQkBPokbbwVBwsxA5qRt05khwrwSHW1CENVqErOO
 r4Nbe/DCJahzPCTm7u5mhoTQEkaJvjUf2Scwys9CWLaAkXEVo3hqaXFuemqxYV5quV5xYm5x
 aV66XnJ+7iZGYLo5/e/4px2MXy8lHWIU4GBU4uFVKG+OFWJNLCuuzD3EKMHBrCTCO8e0KVaI
 NyWxsiq1KD++qDQntfgQozQHi5I4bzXDg2ghgfTEktTs1NSC1CKYLBMHp1QDY0ZPtsQZB8Hq
 WVcVXgcmnxX0+SHDk5M581ijvbWIiYj+cu0LKrFaGhXNklOnrXRS+RvXkD9dau7GQHFLt8q/
 KplXpt/OyLphccV1lv+LeezWZbd9OrMN3lg38Vo9mnDt/ptFuy/cb5z+IJuvZKVAJd/ESbH7
 rttkOopdKFz7wu/9gmvrZwsGKLEUZyQaajEXFScCABhpzQEzAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkkeLIzCtJLcpLzFFi42I5/e/4Xd2EvS2xBuvecljcWneO1eLKxUNM
 FlMfPmGzmH8EyD1/fgO7xbcrHUwWl3fNYbOYcX4fk8WD5nVsFmuP3GW3WHr9IpNF694j7BaH
 37SzOvB6bPjcxOaxZt4aRo+ds+6ye2xa1cnm0bdlFaPH501yAWxRejZF+aUlqQoZ+cUltkrR
 hhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehlvVs9kLljlUbGw8Q9zA+Mf8y5G
 Tg4JAROJWR1tjF2MXBxCAksZJb7tuMQGkZCRODmtgRXCFpb4c62LDaLoE6NE94GfjCAJNgFD
 ia63EAkRgSZGiY3/TrKAOMwCH5kkWp7cA6ri4BAWCJboupAF0sAioCrRtqCBGcTmFbCV2Dt/
 EzvEBnmJ1RsOgMU5BQIllvRtYgKxhQQCJHbeeMg2gZFvASPDKkaR1NLi3PTcYiO94sTc4tK8
 dL3k/NxNjMDg33bs55YdjF3vgg8xCnAwKvHwKpQ3xwqxJpYVV+YeYpTgYFYS4Z1j2hQrxJuS
 WFmVWpQfX1Sak1p8iNEU6KiJzFKiyfnAyMwriTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliS
 mp2aWpBaBNPHxMEp1cDoqPT7G1fh3HUhKzrY3lipT37Yr17asay2Z+aRznUv9Lf6BtWxT5Ne
 P/3p3qNZy60v5Pw25ehzzLtw0fu1xHKp5bqF2o1CPDvzeuZWCPwRCWYSu7o20UslzLqeLYrJ
 Yjq74JJwN8sU0/W+8a3Jys4P92000Nm2XPeQ1rOX9xfnNR9jeSB6+ZUSS3FGoqEWc1FxIgAi
 041OlAIAAA==
X-CMS-MailID: 20190920115200eucas1p2253a3eb13373061ef8aa39131c98a319
X-Msg-Generator: CA
X-RootMTR: 20190920115200eucas1p2253a3eb13373061ef8aa39131c98a319
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190920115200eucas1p2253a3eb13373061ef8aa39131c98a319
References: <CAL_JsqJ=QWk07y=h7dHFiRrKuE7NGoUr50bu3kiOC+YU8qS9jg@mail.gmail.com>
 <CGME20190920115200eucas1p2253a3eb13373061ef8aa39131c98a319@eucas1p2.samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Maciej Falkowski <m.falkowski@samsung.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [alsa-devel] [PATCH v3] dt-bindings: sound: Convert Samsung I2S
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
v3:
- Removed quotation marks from strings in compatible property
- Added min/max items to dmas property
- Removed unneeded description from dma-names property
- Added specific dma-names
- Added clock description
- Added include directive to examples to use clock macros directly
---
 .../devicetree/bindings/sound/samsung-i2s.txt |  84 -----------
 .../bindings/sound/samsung-i2s.yaml           | 135 ++++++++++++++++++
 2 files changed, 135 insertions(+), 84 deletions(-)
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
index 000000000000..20ae5da7f798
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/samsung-i2s.yaml
@@ -0,0 +1,135 @@
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
+    description: |
+      There are following clocks available at the I2S device nodes:
+      CLK_I2S_CDCLK:
+      the CDCLK (CODECLKO) gate clock.
+
+      CLK_I2S_RCLK_PSR:
+      RCLK prescaler divider clock corresponding to the IISPSR register.
+
+      CLK_I2S_RCLK_SRC:
+      RCLKSRC mux clock corresponding to RCLKSRC bit in IISMOD register.
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
