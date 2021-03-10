Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF4A333DEB
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 14:35:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A30941777;
	Wed, 10 Mar 2021 14:34:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A30941777
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615383326;
	bh=bjYYDjOMIIjGXi3Ib60NXuHCjpcvqdubFNTp3iEFiyc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kh6Kjq7JIj/vFPDcqJT9c1iFr7oR/vVaW3P7Z8qgEv3nfZ7M4MgXq4asbheXXUjzX
	 yX7TtMuuh5xxbiRMwLc+ESb19Xa+5Tvht1w4Txn2RCijzIQg558lfezvignCrmJKGU
	 LF/hBBvhTdhXxRu6bUZ69hgJCCbOtSm6Ji6dckqA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F565F8012F;
	Wed, 10 Mar 2021 14:33:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B60CF80217; Wed, 10 Mar 2021 14:33:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by alsa1.perex.cz (Postfix) with ESMTP id D0C3DF8016C
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 14:33:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0C3DF8016C
X-UUID: dad055f9182c45478f2cedd13b3ea8cf-20210310
X-UUID: dad055f9182c45478f2cedd13b3ea8cf-20210310
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <argus.lin@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 301943222; Wed, 10 Mar 2021 21:33:12 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 21:33:11 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 10 Mar 2021 21:33:11 +0800
From: Argus Lin <argus.lin@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH V2 1/2] dt-bindings: mediatek: mt6359: add ASoC mt6359 ASoC
 accdet jack document
Date: Wed, 10 Mar 2021 21:33:05 +0800
Message-ID: <1615383186-18500-2-git-send-email-argus.lin@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1615383186-18500-1-git-send-email-argus.lin@mediatek.com>
References: <1615383186-18500-1-git-send-email-argus.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: Jack Yu <jack.yu@realtek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Argus Lin <argus.lin@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 "Shane.Chien" <shane.chien@mediatek.com>, linux-mediatek@lists.infradead.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-kernel@vger.kernel.org,
 Chipeng Chang <chipeng.chang@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>,
 devicetree@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dan Murphy <dmurphy@ti.com>, Shuming Fan <shumingf@realtek.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, wsd_upstream@mediatek.com
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

This patch adds MediaTek MT6359 ASoC accdet jack document.

Signed-off-by: Argus Lin <argus.lin@mediatek.com>
---
 .../bindings/sound/mt6359-accdet.yaml         | 164 ++++++++++++++++++
 1 file changed, 164 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mt6359-accdet.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml b/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml
new file mode 100644
index 000000000000..7fb3e8dfb4c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml
@@ -0,0 +1,164 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt6359-accdet.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Technologies Inc. MT6359 ASoC accdet jack driver bindings
+
+maintainers:
+  - Chipeng Chang <chipeng.chang@mediatek.com>
+
+description: |
+  This binding describes the Mediatek Technologies MT6359 ASoC
+  accdet jack driver.
+
+properties:
+  mediatek,accdet-name:
+    maxItems: 1
+    description: named as "mt6359-accdet" jack.
+
+  mediatek,mic-vol:
+    maxItems: 1
+    description: |
+      accdet micbias1 voltage.
+
+      enum:
+        - 0x00 # 1.7v - micbias1 volage is 1.7v.
+        - 0x01 # 1.8v - micbias1 volage is 1.8v.
+        - 0x02 # 1.9v - micbias1 volage is 1.9v.
+        - 0x03 # 2.0v - micbias1 volage is 2.0v.
+        - 0x04 # 2.1v - micbias1 volage is 2.1v.
+        - 0x05 # 2.5v - micbias1 volage is 2.5v.
+        - 0x06 # 2.6v - micbias1 volage is 2.6v.
+        - 0x07 # 2.7v - micbias1 volage is 2.7v.
+        - 0x08 # 2.8v - micbias1 volage is 2.8v.
+        - 0x09 # 2.85v - micbias1 volage is 2.85v.
+
+  mediatek,mic-mode:
+    maxItems: 1
+    description: |
+      value as 1, 2, 6 to indicate ACC/DCC mode. default is DCC mode 2.
+
+      enum:
+        - 0x01 # ACC - ACC mode.
+        - 0x02 # DCC - low cost without in bias.
+        - 0x06 # DCC - low cost with in bias.
+
+  mediatek,pwm-deb-setting:
+    maxItems: 15
+    description: |
+       headset-mode-setting : Indicates customized pwm, debounce setting
+       accdet pwm_width, pwm_thresh, fall_delay, rise_delay
+       debounce0, debounce1, debounce3, debounce4
+       eint pwm_width, eint pwm_thresh
+       eint deb(debounce0, debounce1, debounce2, debounce3), inv_debounce.
+
+  mediatek,eint-use-ap:
+    maxItems: 1
+    description: |
+      indicates to use ap gpio.
+
+      enum:
+        - 0x00 # MT6359 eint detection mode.
+        - 0x01 # SoC GPIO detection mode.
+
+  mediatek,eint-detect-mode:
+    maxItems: 1
+    description: |
+      indicates to use ap gpio.
+
+      enum:
+        - 0x00 # detection mode with higher detection power.
+        - 0x01 # detection mode with lower detection power.
+        - 0x02 # detection mode with sw moisture detection mode.
+        - 0x03 # detection mode with hw moisture detection mode1.
+        - 0x04 # detection mode with hw moisture detection mode2.
+
+  mediatek,eint-num:
+    maxItems: 1
+    description: |
+      incicates pmic eint usage.
+
+      enum:
+        - 0x0 # PMIC_EINT0 - use pmic eint0 to trigger plug interrupt.
+        - 0x1 # PMIC_EINT1 - use pmic eint1 to trigger plug interrupt.
+        - 0x2 # PMIC_BI_EINT - use pmic eint0/1 to trigger plug interrupt.
+
+  mediatek,eint-trig-mode:
+    maxItems: 1
+    description: |
+      incicates pmic eint trigger mode.
+
+      enum:
+        - 0x0 # PMIC_GPIO - use pmic gpio to detect plug status.
+        - 0x1 # PMIC_INVERTER - use pmic inverter to detect plug status.
+
+  mediatek,eint-use-ext-res:
+    maxItems: 1
+    description: |
+      select HP_EINT pull up resistance, default 0 use internal resistance.
+
+      enum:
+        - 0x0 # use internal resistor.
+        - 0x1 # use external resistor.
+
+  mediatek,eint-comp-vth:
+    maxItems: 1
+    description: |
+      indicates comparator detection voltage.
+
+      enum:
+        - 0x00 # 2.8v.
+        - 0x01 # 2.4v.
+        - 0x02 # 2.0v.
+        - 0x03 # 0.7v.
+
+  mediatek,key-mode:
+    maxItems: 1
+    description: |
+      incicates key mode type.
+
+      enum:
+        - 0x0 # THREE_KEY - support 3-key key mode.
+        - 0x1 # FOUR_KEY - support 4-key key mode.
+        - 0x2 # TRI_KEY_CDD - support 3-key google CDD key mode.
+
+  mediatek,three-key-thr:
+    maxItems: 4
+    description: |
+      3 key device detection threshold: 0--MD_MAX--UP_MAX--DW_MAX.
+
+  mediatek,tri-key-cdd-thr:
+    maxItems: 4
+    description: |
+      3 key CDD device detection threshold: 0--MD_MAX--UP_MAX--DW_MAX.
+
+  mediatek,four-key-thr:
+    maxItems: 4
+    description: |
+      4 key device detection threshold: 0--MD_MAX--VOICE_MAX--UP_MAX--DW_MAX.
+
+additionalProperties: false
+
+examples:
+  - |
+    accdet: accdet {
+        mediatek,accdet-name = "mt6359-accdet";
+        mediatek,mic-vol = <8>;
+        mediatek,mic-mode = <2>;
+        mediatek,pwm-deb-setting = <0x500 0x500 1 0x1f0
+                                    0x800 0x800 0x20 0x44
+                                    0x4 0x1
+                                    0x5 0x3 0x3 0x5 0xe>;
+        mediatek,eint-use-ap = <0>;
+        mediatek,eint-detect-mode = <4>;
+        mediatek,eint-num = <0>;
+        mediatek,eint-trig-mode = <1>;
+        mediatek,eint-use-ext-res = <0>;
+        mediatek,eint-comp-vth = <2>;
+        mediatek,key-mode = <0>;
+        mediatek,three-key-thr = <0 80 220 400>;
+        status = "okay";
+    };
+...
--
2.18.0

