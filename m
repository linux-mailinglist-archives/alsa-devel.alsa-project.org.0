Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F473F8395
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 10:12:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23990168A;
	Thu, 26 Aug 2021 10:11:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23990168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629965524;
	bh=PIYy0NizWnYnPU5c0f/982HVSOmvJdjfmZ3HODXvH90=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BHH3nTCmqnXJ0d4z08h7Xlbcq/F777jaeDto6JLC4/H6DZd1qkTB13BZCnl9/wpfZ
	 vnqA8A2CpVDUCBCLu1dkiP1Znqm9odWsX8gU7S4ZfUOvUM6hOn0xbgEtb8NmZ1vQki
	 KhxiaUNZB+oSCYSQYSa4YbZj+/9dWnRinYSVMqek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9002FF804E2;
	Thu, 26 Aug 2021 10:10:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F368AF801D5; Thu, 26 Aug 2021 10:10:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90AD5F801D5
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 10:10:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90AD5F801D5
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 17Q8A5pjC006575,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36501.realtek.com.tw[172.21.6.27])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 17Q8A5pjC006575
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 26 Aug 2021 16:10:06 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36501.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 26 Aug 2021 16:10:04 +0800
Received: from derek-PORTEGE-R930.realtek.com.tw (172.22.102.119) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 26 Aug 2021 16:09:44 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: dt-bindings: rt5682s: add bindings for rt5682s
Date: Thu, 26 Aug 2021 16:09:38 +0800
Message-ID: <20210826080938.14872-2-derek.fang@realtek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210826080938.14872-1-derek.fang@realtek.com>
References: <20210826080938.14872-1-derek.fang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.102.119]
X-ClientProxiedBy: RTEXH36503.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 08/26/2021 07:54:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzgvMjYgpFekyCAwNDo0MTowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36501.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 08/26/2021 07:51:00
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 165782 [Aug 26 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: derek.fang@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 457 457 f9912fc467375383fbac52a53ade5bbe1c769e2a
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2; devicetree.org:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; realtek.com:7.1.1
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 08/26/2021 07:54:00
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, Derek Fang <derek.fang@realtek.com>,
 shumingf@realtek.com, flove@realtek.com
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
 .../bindings/sound/realtek,rt5682s.yaml       | 99 +++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
new file mode 100644
index 000000000000..51fa140b1f05
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
@@ -0,0 +1,99 @@
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
+      - 0 # dmic1 is not used
+      - 1 # using GPIO2 pin as dmic1 data pin
+      - 2 # using GPIO5 pin as dmic1 data pin
+
+  realtek,dmic1-clk-pin:
+    enum:
+      - 0 #using GPIO1 pin as dmic1 clock pin
+      - 1 #using GPIO3 pin as dmic1 clock pin
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

