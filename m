Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C71506B8E
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Apr 2022 13:57:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A1001849;
	Tue, 19 Apr 2022 13:56:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A1001849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650369421;
	bh=wQPRkvEt9osj9Vr+FYMogEOQ5/llgyg3qJO2le6OB40=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uUdyKTl0iwgGiQ9ZBe4dYdDTdQJjq+4CAKX8JmY/8O9rdJOlz4S824OCOg2J4LTbq
	 //BcHCXHmwI/l3DekUuZLnXVXx+qeuMEAt1/iYWJ+jB5WJTbhDSeFRXMlGe4rlDE4n
	 nXpfrp8tZStFTzkDUFt/WuMDxYKk2uJbkTfxFg28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99B8EF80563;
	Tue, 19 Apr 2022 13:52:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A4D2F8016B; Sat, 16 Apr 2022 02:40:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F62FF8012E
 for <alsa-devel@alsa-project.org>; Sat, 16 Apr 2022 02:40:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F62FF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="X3pmP/83"
Received: by mail-pj1-x1042.google.com with SMTP id
 i24-20020a17090adc1800b001cd5529465aso8195743pjv.0
 for <alsa-devel@alsa-project.org>; Fri, 15 Apr 2022 17:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Les2UL23YeIevDhG3Z2Qgn1FSs69ezvIqCdvr/g4ho=;
 b=X3pmP/83JNw068wUc0Dwc/eB1hfDmcO0c7h4P4CWTRPTAL9Lwi/6sNoDY75uG413G4
 u2Ac+RYGI4qc8tjzxtrBNe+ZmwHZ3JvQSl68DtyM0QcLoMW8cF4XbiFCBc/b2jtXxAvg
 czslVbtiqNZg3f+gAuSFakzhJRLu0q+WjfDr+or82OnN2qakZxO9vmcgaaiaxH6p7a1i
 EetP7YF73mPGYAEFAOB26josOoVQuyXIuM9H93FI0sZigrGMYUwfaNeRxspjwbR4Xo1s
 njR/j1fNgzalQdZZkJN+QoozaLKI4rR8G47kaRFhQv+kuQuvdbzN7mN9tqnuOwrkMlP6
 QuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Les2UL23YeIevDhG3Z2Qgn1FSs69ezvIqCdvr/g4ho=;
 b=N8T4ZNTiBSa0FHgqFE0EcxvDJQF9wAfisuKR2SSDm3jQxHKhnQ3s91pEg19H3ZIh+C
 APFSmbwj+rNweimZ3bwqmSJz+guPsBNdaDKi8scFh7xTha9eX2HoYGWwl+mR78vtEzk8
 w/5bWY7Fxd7sk6hLut4KfQCt5SxqOzGwtaRWIgwv2qPJgziIiSYg2AWCj4Oj6sM7umFF
 QxxKC99Wdh6AUUFiGk4RdADA+wMiCmz8NsByRtX+F91M502H1Y6IWv1GWZEqN+xZxWki
 nJV5WupOCV+hMbgNhYvdyYOC3QAqDbFHYFYDuinY9P+SsNkwehkkVMTgFIm5HRbpVuLh
 eA4A==
X-Gm-Message-State: AOAM530lnf2vPa44NVzTBd/XN1nFXjPTXdeWc8VERAH5CszFlWVN7AOF
 9PmNY44sRVhKxjGhivX1c4c=
X-Google-Smtp-Source: ABdhPJykxiXYmn1N3ukz/dW55wNY1Lgeg6tCAhkCY9X2N73Pqr000lp0esog3uKXrWyO9G0bDcFVRw==
X-Received: by 2002:a17:90b:164f:b0:1c7:8d27:91fc with SMTP id
 il15-20020a17090b164f00b001c78d2791fcmr6869325pjb.228.1650069643984; 
 Fri, 15 Apr 2022 17:40:43 -0700 (PDT)
Received: from localhost.localdomain (c-73-241-94-58.hsd1.ca.comcast.net.
 [73.241.94.58]) by smtp.gmail.com with ESMTPSA id
 b10-20020a056a00114a00b004f784ba5e6asm4222482pfm.17.2022.04.15.17.40.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 17:40:43 -0700 (PDT)
From: Ryan Lee <ryan.lee.analog@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, ckeepax@opensource.cirrus.com,
 tanureal@opensource.cirrus.com, cy_huang@richtek.com,
 pierre-louis.bossart@linux.intel.com, drhodes@opensource.cirrus.com,
 pbrobinson@gmail.com, hdegoede@redhat.com, lukas.bulwahn@gmail.com,
 stephan@gerhold.net, arnd@arndb.de, ryan.lee.analog@gmail.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ryans.lee@analog.com
Subject: [PATCH 1/2] ASoC: dt-bindings: max98396: add amplifier driver
Date: Fri, 15 Apr 2022 17:40:23 -0700
Message-Id: <20220416004024.210418-1-ryan.lee.analog@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 19 Apr 2022 13:52:22 +0200
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

From: Ryan Lee <ryans.lee@analog.com>

This patch adds dt-bindings information for Analog Devices MAX98396
and MAX98397 Smart Amplifier.

Signed-off-by: Ryan Lee <ryans.lee@analog.com>
---
 .../bindings/sound/adi,max98396.yaml          | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/adi,max98396.yaml

diff --git a/Documentation/devicetree/bindings/sound/adi,max98396.yaml b/Documentation/devicetree/bindings/sound/adi,max98396.yaml
new file mode 100644
index 000000000000..4aee32f43ad1
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/adi,max98396.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/adi,max98396.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices MAX98396 Speaker Amplifier Device Tree Bindings
+
+maintainers:
+  - Ryan Lee <ryans.lee@analog.com>
+
+description:
+  The MAX98396 is a mono Class-DG speaker amplifier with I/V sense.
+  The device provides a PCM interface for audio data and a standard
+  I2C interface for control data communication.
+  The MAX98397 is a variant of MAX98396 with wide input supply range.
+
+properties:
+  compatible:
+    enum:
+      - adi,max98396
+      - adi,max98397
+  reg:
+    maxItems: 1
+    description: I2C address of the device.
+
+  adi,vmon-slot-no:
+    description: slot number of the voltage sense monitor
+    minimum: 0
+    maximum: 15
+    default: 0
+
+  adi,imon-slot-no:
+    description: slot number of the current sense monitor
+    minimum: 0
+    maximum: 15
+    default: 0
+
+  adi,spkfb-slot-no:
+    description: slot number of speaker DSP monitor
+    minimum: 0
+    maximum: 15
+    default: 0
+
+  adi,interleave-mode:
+    type: boolean
+    description: For cases where a single combined channel for the I/V sense data is not sufficient,
+                the device can also be configured to share a single data output channel on alternating frames.
+                In this configuration, the current and voltage data will be frame interleaved on a single output channel.
+    default: false
+
+  reset-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        max98396: amplifier@39 {
+            compatible = "adi,max98396";
+            reg = <0x39>;
+            adi,vmon-slot-no = <0>;
+            adi,imon-slot-no = <1>;
+            adi,interleave-mode = <0>;
+            reset-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
+        };
+        max98397: amplifier@3c {
+            compatible = "adi,max98397";
+            reg = <0x3c>;
+            adi,vmon-slot-no = <0>;
+            adi,imon-slot-no = <1>;
+            adi,interleave-mode = <0>;
+            reset-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
+        };
+    };
+
-- 
2.25.1

