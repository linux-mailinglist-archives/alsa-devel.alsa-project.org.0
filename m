Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24879362760
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 20:02:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 974BF168C;
	Fri, 16 Apr 2021 20:02:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 974BF168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618596176;
	bh=661QuL4yjmp53aw1TFZY8hxtcYLLpusFGpGVptZ+tHI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FFz+QoLNeAx7wKrWmmih61QPFxssZ5rzVOWManmD8fxSWH7uVhS71Twp+axcbZyNr
	 4Q0sVGS3rGwf3c9rWBRJa9FYZj95CBwx9lB72Q4o+kyYmA7s/eIIetVFdAgxdpqAGv
	 ndAUHqIeLfEbEXRyxK7NVBdKBrGGR+rEgPWCOc+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D575AF80269;
	Fri, 16 Apr 2021 20:01:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2F2FF8025B; Fri, 16 Apr 2021 20:01:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68D3CF80128
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 20:01:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68D3CF80128
Received: by mail-ot1-f44.google.com with SMTP id
 w31-20020a9d36220000b02901f2cbfc9743so26495930otb.7
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 11:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vmf4XBXfx/GPa3Yjcsccgq05PYXS1ISqoSBtkIzuniw=;
 b=T2KriQiW0rHYtkQhu5jxEGjQrP3ZX+18NiAx96SKf99G2kNZESsqrUhISiH+Li9z8z
 YeZ9J/xUHlXCGvRZWf98XPGVKzDRGUy4kvzDKH9dI+hVo9auXdtQk7477HjKHCmCFhBt
 BuYR6184OMy/iNZX4jkPeNRU0I55g87F0rll3N9wmooB7R5nBwL5Vwd0A0cERhzRT1HW
 CZylrVj2ShS20VUBbswGMZJ//69yy7KQZe/i/IxcZnupCta7zt+4ZEjKiOPjtw+IyT8o
 f+6kPzdfb07v1jIbekIRzYv9ESZTMuVyphMYWpvYTjVsgVxIQ1o3Th7GxNjUJBqncxyd
 0Slg==
X-Gm-Message-State: AOAM533IigpX0xHL/1Mzp7W4Wo8Ws7mx7yZSO74RzlDxWGCactsXiPVv
 LCOuyHmFyxsdBn0GH9RDmA==
X-Google-Smtp-Source: ABdhPJw5PVcUE+vhVYVOcvFfMPwx98X7v9QTzuauOkbkFxiPCfHe/t1LBStf9Tht3Dd9zlgkuTcIIQ==
X-Received: by 2002:a05:6830:1e61:: with SMTP id
 m1mr4523038otr.36.1618596081220; 
 Fri, 16 Apr 2021 11:01:21 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id m129sm1554217oif.34.2021.04.16.11.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 11:01:19 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] Revert "ASoC: mt6359: add ASoC mt6359 ASoC accdet jack
 document"
Date: Fri, 16 Apr 2021 13:01:18 -0500
Message-Id: <20210416180118.3662904-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Argus Lin <argus.lin@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

This reverts commit e61c589587c772c5f672b22683c3e0b38be20702.

The binding document has lots of schema errors and there's been no
effort to fix them, so let's remove it.

Cc: Argus Lin <argus.lin@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/mt6359-accdet.yaml         | 164 ------------------
 1 file changed, 164 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/mt6359-accdet.yaml

diff --git a/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml b/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml
deleted file mode 100644
index 7fb3e8dfb4c5..000000000000
--- a/Documentation/devicetree/bindings/sound/mt6359-accdet.yaml
+++ /dev/null
@@ -1,164 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/sound/mt6359-accdet.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Mediatek Technologies Inc. MT6359 ASoC accdet jack driver bindings
-
-maintainers:
-  - Chipeng Chang <chipeng.chang@mediatek.com>
-
-description: |
-  This binding describes the Mediatek Technologies MT6359 ASoC
-  accdet jack driver.
-
-properties:
-  mediatek,accdet-name:
-    maxItems: 1
-    description: named as "mt6359-accdet" jack.
-
-  mediatek,mic-vol:
-    maxItems: 1
-    description: |
-      accdet micbias1 voltage.
-
-      enum:
-        - 0x00 # 1.7v - micbias1 volage is 1.7v.
-        - 0x01 # 1.8v - micbias1 volage is 1.8v.
-        - 0x02 # 1.9v - micbias1 volage is 1.9v.
-        - 0x03 # 2.0v - micbias1 volage is 2.0v.
-        - 0x04 # 2.1v - micbias1 volage is 2.1v.
-        - 0x05 # 2.5v - micbias1 volage is 2.5v.
-        - 0x06 # 2.6v - micbias1 volage is 2.6v.
-        - 0x07 # 2.7v - micbias1 volage is 2.7v.
-        - 0x08 # 2.8v - micbias1 volage is 2.8v.
-        - 0x09 # 2.85v - micbias1 volage is 2.85v.
-
-  mediatek,mic-mode:
-    maxItems: 1
-    description: |
-      value as 1, 2, 6 to indicate ACC/DCC mode. default is DCC mode 2.
-
-      enum:
-        - 0x01 # ACC - ACC mode.
-        - 0x02 # DCC - low cost without in bias.
-        - 0x06 # DCC - low cost with in bias.
-
-  mediatek,pwm-deb-setting:
-    maxItems: 15
-    description: |
-       headset-mode-setting : Indicates customized pwm, debounce setting
-       accdet pwm_width, pwm_thresh, fall_delay, rise_delay
-       debounce0, debounce1, debounce3, debounce4
-       eint pwm_width, eint pwm_thresh
-       eint deb(debounce0, debounce1, debounce2, debounce3), inv_debounce.
-
-  mediatek,eint-use-ap:
-    maxItems: 1
-    description: |
-      indicates to use ap gpio.
-
-      enum:
-        - 0x00 # MT6359 eint detection mode.
-        - 0x01 # SoC GPIO detection mode.
-
-  mediatek,eint-detect-mode:
-    maxItems: 1
-    description: |
-      indicates to use ap gpio.
-
-      enum:
-        - 0x00 # detection mode with higher detection power.
-        - 0x01 # detection mode with lower detection power.
-        - 0x02 # detection mode with sw moisture detection mode.
-        - 0x03 # detection mode with hw moisture detection mode1.
-        - 0x04 # detection mode with hw moisture detection mode2.
-
-  mediatek,eint-num:
-    maxItems: 1
-    description: |
-      incicates pmic eint usage.
-
-      enum:
-        - 0x0 # PMIC_EINT0 - use pmic eint0 to trigger plug interrupt.
-        - 0x1 # PMIC_EINT1 - use pmic eint1 to trigger plug interrupt.
-        - 0x2 # PMIC_BI_EINT - use pmic eint0/1 to trigger plug interrupt.
-
-  mediatek,eint-trig-mode:
-    maxItems: 1
-    description: |
-      incicates pmic eint trigger mode.
-
-      enum:
-        - 0x0 # PMIC_GPIO - use pmic gpio to detect plug status.
-        - 0x1 # PMIC_INVERTER - use pmic inverter to detect plug status.
-
-  mediatek,eint-use-ext-res:
-    maxItems: 1
-    description: |
-      select HP_EINT pull up resistance, default 0 use internal resistance.
-
-      enum:
-        - 0x0 # use internal resistor.
-        - 0x1 # use external resistor.
-
-  mediatek,eint-comp-vth:
-    maxItems: 1
-    description: |
-      indicates comparator detection voltage.
-
-      enum:
-        - 0x00 # 2.8v.
-        - 0x01 # 2.4v.
-        - 0x02 # 2.0v.
-        - 0x03 # 0.7v.
-
-  mediatek,key-mode:
-    maxItems: 1
-    description: |
-      incicates key mode type.
-
-      enum:
-        - 0x0 # THREE_KEY - support 3-key key mode.
-        - 0x1 # FOUR_KEY - support 4-key key mode.
-        - 0x2 # TRI_KEY_CDD - support 3-key google CDD key mode.
-
-  mediatek,three-key-thr:
-    maxItems: 4
-    description: |
-      3 key device detection threshold: 0--MD_MAX--UP_MAX--DW_MAX.
-
-  mediatek,tri-key-cdd-thr:
-    maxItems: 4
-    description: |
-      3 key CDD device detection threshold: 0--MD_MAX--UP_MAX--DW_MAX.
-
-  mediatek,four-key-thr:
-    maxItems: 4
-    description: |
-      4 key device detection threshold: 0--MD_MAX--VOICE_MAX--UP_MAX--DW_MAX.
-
-additionalProperties: false
-
-examples:
-  - |
-    accdet: accdet {
-        mediatek,accdet-name = "mt6359-accdet";
-        mediatek,mic-vol = <8>;
-        mediatek,mic-mode = <2>;
-        mediatek,pwm-deb-setting = <0x500 0x500 1 0x1f0
-                                    0x800 0x800 0x20 0x44
-                                    0x4 0x1
-                                    0x5 0x3 0x3 0x5 0xe>;
-        mediatek,eint-use-ap = <0>;
-        mediatek,eint-detect-mode = <4>;
-        mediatek,eint-num = <0>;
-        mediatek,eint-trig-mode = <1>;
-        mediatek,eint-use-ext-res = <0>;
-        mediatek,eint-comp-vth = <2>;
-        mediatek,key-mode = <0>;
-        mediatek,three-key-thr = <0 80 220 400>;
-        status = "okay";
-    };
-...
-- 
2.27.0

