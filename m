Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E983FC7D1
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Aug 2021 15:04:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F192170C;
	Tue, 31 Aug 2021 15:03:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F192170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630415085;
	bh=nBeAAJje8fMJ+aLsJWhDxJLRq5GxlnwJKjAvz2daBXI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R1ppQdwTJREQ8+XisSlLYODYMVpKxk4MzLgLg7lhI9irMVWxiMscJNXAK826Hq7AP
	 PKKzVkTEihKeZt7PM6gckoASymnORBG7pUDRwGsHMGUzs9FgH1FEfYk9B1pP0Gd8WT
	 20fmm7hkT6QBIPtK+w++TDteU7i/h/QOPWvvgWQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FA3EF80269;
	Tue, 31 Aug 2021 15:03:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C9F0F80269; Tue, 31 Aug 2021 15:03:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66EC4F800BE
 for <alsa-devel@alsa-project.org>; Tue, 31 Aug 2021 15:03:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66EC4F800BE
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 17VD37OY0012855,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36503.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 17VD37OY0012855
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 31 Aug 2021 21:03:07 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36503.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 31 Aug 2021 21:03:06 +0800
Received: from localhost.localdomain (172.22.232.15) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 31 Aug 2021 21:03:04 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH v2 2/2] ASoC: dt-bindings: rt5682s: add bindings for rt5682s
Date: Tue, 31 Aug 2021 21:02:58 +0800
Message-ID: <20210831130258.19286-2-derek.fang@realtek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210831130258.19286-1-derek.fang@realtek.com>
References: <20210831130258.19286-1-derek.fang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.232.15]
X-ClientProxiedBy: RTEXH36503.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 08/31/2021 12:51:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzgvMzEgpFekyCAwODowMTowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36503.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 08/31/2021 12:49:24
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 165883 [Aug 31 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: derek.fang@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 460 460 984a5b846aca9773080f7b1ec5049bf53f1b6f95
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: devicetree.org:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; realtek.com:7.1.1;
 127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 08/31/2021 12:51:00
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, Derek Fang <derek.fang@realtek.com>,
 shumingf@realtek.com, albertwang@realtek.com, flove@realtek.com
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

From: Derek Fang <derek.fang@realtek.com>

Realtek ALC5682I-VS codec is a ALC5682I-VD variant which supports I2C only.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
---
 .../bindings/sound/realtek,rt5682s.yaml       | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
new file mode 100644
index 000000000000..fbf23696f1a7
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/realtek,rt5682s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek rt5682s codec devicetree bindings
+
+maintainers:
+  - Derek Fang <derek.fang@realtek.com>
+
+description: |
+  Rt5682s(ALC5682I-VS) is a rt5682i variant which supports I2C only.
+
+properties:
+  compatible:
+    const: realtek,rt5682s
+
+  reg:
+    maxItems: 1
+    description: I2C address of the device.
+
+  interrupts:
+    description: The CODEC's interrupt output.
+
+  realtek,dmic1-data-pin:
+    enum:
+      - 0 # dmic1 data is not used
+      - 1 # using GPIO2 pin as dmic1 data pin
+      - 2 # using GPIO5 pin as dmic1 data pin
+
+  realtek,dmic1-clk-pin:
+    enum:
+      - 0 # dmic1 clk is not used
+      - 1 # using GPIO1 pin as dmic1 clock pin
+      - 2 # using GPIO3 pin as dmic1 clock pin
+
+  realtek,jd-src:
+    enum:
+      - 0 # No JD is used
+      - 1 # using JD1 as JD source
+
+  realtek,ldo1-en-gpios:
+    description: |
+      The GPIO that controls the CODEC's LDO1_EN pin.
+
+  realtek,dmic-clk-rate-hz:
+    description: |
+      Set the clock rate (hz) for the requirement of the particular DMIC.
+
+  realtek,dmic-delay-ms:
+    description: |
+      Set the delay time (ms) for the requirement of the particular DMIC.
+
+  realtek,dmic-clk-driving-high:
+    type: boolean
+    description: |
+      Set the high driving of the DMIC clock out.
+
+  clocks:
+    items:
+      - description: phandle and clock specifier for codec MCLK.
+
+  clock-names:
+    items:
+      const: mclk
+
+  "#clock-cells":
+    const: 1
+
+  clock-output-names:
+    items:
+      - description: Name given for DAI word clock output.
+      - description: Name given for DAI bit clock output.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+example:
+  - |
+    rt5682s {
+        compatible = "realtek,rt5682s";
+        reg = <0x1a>;
+        interrupt-parent = <&gpio>;
+        interrupts = <TEGRA_GPIO(U, 6) IRQ_TYPE_LEVEL_HIGH>;
+        realtek,ldo1-en-gpios =
+            <&gpio TEGRA_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
+        realtek,dmic1-data-pin = <1>;
+        realtek,dmic1-clk-pin = <1>;
+        realtek,jd-src = <1>;
+
+        #clock-cells = <1>;
+        clock-output-names = "rt5682-dai-wclk", "rt5682-dai-bclk";
+
+        clocks = <&osc>;
+        clock-names = "mclk";
+    };
-- 
2.17.1

