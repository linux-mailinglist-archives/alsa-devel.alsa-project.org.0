Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FCF50ABC9
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 01:05:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F7C616F2;
	Fri, 22 Apr 2022 01:04:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F7C616F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650582300;
	bh=GUQbMWX1AQNhWKYS6jWrAsJNu+q3DIMDf0aUtV9/HVg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=D2aES+un93RkkWngJJxAsBRnmFYaSHhQo3zbDCY18pGMFaYNGj7+ricviSiNpSRgT
	 Y0GTHR8LRfDrxkUME0LJTa8a3vBhpprtnV1XB6ZWyc3FB8rKnIUNUkU+vlwDJKmlik
	 bOiUqJlcipMbgkOTdcw4HBNF/+pSpuQECO59h0XY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3EDDF804C1;
	Fri, 22 Apr 2022 01:04:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B49C0F8047D; Fri, 22 Apr 2022 01:03:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47DE7F800F4
 for <alsa-devel@alsa-project.org>; Fri, 22 Apr 2022 01:03:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47DE7F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UhzbFZk/"
Received: by mail-pl1-x641.google.com with SMTP id c23so6998557plo.0
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 16:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6lETE4tLzS4hKJ1u/oePk2fhU7jHe/s3/pNmvXVjZcU=;
 b=UhzbFZk/OF9avjf1Dw5CvpdHDR7o/YhO54wS+drjkdZVgv+x1Zmf7Vp2/nMFu/vHNQ
 aB0zvD92+OaAXYCHpSddb8B2J0GGlDIoT1SeXVFjwLBa5DGckLhQAzd7xM7QCwcgHcFX
 rw6/5k4C9qqA7idqS4r7oLTvtN59UvRAi4xQzBbJW9ea6tOQJlcJVGx8TwnF6kiVd/WV
 Ymxgf8KMJWr0WebEPvlomFEHHgZ/yaQDjQBqlzo4fdyrV87W/t98TbfjECfH3D0DBEjb
 WR4B7bDrIJp3j7TAcvmMURrm2rbubhPYxv7ykIISQg+eupAuhBJqd5998L3Cut2YY+n9
 9nDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6lETE4tLzS4hKJ1u/oePk2fhU7jHe/s3/pNmvXVjZcU=;
 b=tLo2UktokbKElK78XqrFIW4xS08ECM/S2rEzptvFDWsH88XHL9Phwqpx3FKzMivJZN
 EHpAQcUXj04KCCTBBtaGBTDcS2wdY18mrs9ST4c81oF/4/7ZGuaA+RrG2SDXd2bhjWfc
 kCJaytlFXGQJQ2nGMtb9cAMCnQVzF9Fhv7omFxF83FvWdaxbdtFKywaiRCkQD2fTXtZ0
 +nYGCYeuZ41+YBQc2HelChci5I7Fz2QvQ7GNcahUo//86pdCzfkLAMD8j3vf3Px7Zi0A
 HuZ72iHHPRblWMTJ2zNhX4OIiZtXh+g77z8mr3ZKehPPkaXQCjsfsNygfjoYDCuvkumQ
 60XQ==
X-Gm-Message-State: AOAM533Hl5Bvj4KCmgkFX3mHiVCkB6Y/Jcfl5yQxgDK2tmJHFZ5xfk/3
 btjdZ7dhV+hcIlA8PRwrEBI=
X-Google-Smtp-Source: ABdhPJzW+XA9jMQWSiTiZveW2YDJbye/xVxh8r5uT5ngeig1q9drkro5hFvvGcxMHBf+ET2adpzZ8Q==
X-Received: by 2002:a17:902:f688:b0:15b:45ea:b682 with SMTP id
 l8-20020a170902f68800b0015b45eab682mr1472088plg.134.1650582230362; 
 Thu, 21 Apr 2022 16:03:50 -0700 (PDT)
Received: from localhost.localdomain (c-73-241-94-58.hsd1.ca.comcast.net.
 [73.241.94.58]) by smtp.gmail.com with ESMTPSA id
 t2-20020a17090a448200b001cd4989fee7sm3810238pjg.51.2022.04.21.16.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 16:03:49 -0700 (PDT)
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
Subject: [PATCH V2 1/2] ASoC: dt-bindings: max98396: add amplifier driver
Date: Thu, 21 Apr 2022 16:02:52 -0700
Message-Id: <20220421230253.823798-1-ryan.lee.analog@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
  Changes from v1:
    Fixed yamllint/dtschema/dtc warnings and errors

 .../bindings/sound/adi,max98396.yaml          | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/adi,max98396.yaml

diff --git a/Documentation/devicetree/bindings/sound/adi,max98396.yaml b/Documentation/devicetree/bindings/sound/adi,max98396.yaml
new file mode 100644
index 000000000000..ec4c10c2598a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/adi,max98396.yaml
@@ -0,0 +1,79 @@
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
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 15
+    default: 0
+
+  adi,imon-slot-no:
+    description: slot number of the current sense monitor
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 15
+    default: 0
+
+  adi,spkfb-slot-no:
+    description: slot number of speaker DSP monitor
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 15
+    default: 0
+
+  adi,interleave-mode:
+    description:
+      For cases where a single combined channel for the I/V sense data
+      is not sufficient, the device can also be configured to share
+      a single data output channel on alternating frames.
+      In this configuration, the current and voltage data will be frame
+      interleaved on a single output channel.
+    type: boolean
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
+            reset-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
+        };
+    };
-- 
2.25.1

