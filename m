Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A9A50E76C
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 19:38:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B6FE1801;
	Mon, 25 Apr 2022 19:37:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B6FE1801
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650908318;
	bh=hKbQeh+GsgAGNbR34vuZBg3VzEY/deo86EN2PvpaRTg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oF+78yM51svtYUsNhaQAb4qKq431BODSQgy2Tq9Y57f7nH9uUAQxpNWPjAskGFMNJ
	 ZLlApH6+KqWPWqhZTIcFtFOJPVWDZiJt77ioViBV+zUZUrP+/7X/RzHzulKp8W6oFb
	 g9AjQ+P8yolQdE/ke6wtS3EeDa5bc/j8mOEUrfqI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7064F8016B;
	Mon, 25 Apr 2022 19:37:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C2B8F8014B; Mon, 25 Apr 2022 19:37:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3309FF8014B
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 19:37:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3309FF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Hm4FE29U"
Received: by mail-pg1-x52d.google.com with SMTP id t13so13973608pgn.8
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 10:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PjD/mfBFlz/AtrrL9x0Nf4kx8DWM5v1izBjt6/Kpab0=;
 b=Hm4FE29UfoLbczENW+XUuxCsdMMB21yOePMZ4K7szKAY6zQSi9WbZ0m3noMmt3WdFf
 qsTwr/PTWjYXoLhBldxZMfcLvy0xHaSk1DzPVavJ3Tv6LSbXOuuf1CgvMwZvjCSQ2ELT
 MH1NMEW7Sd5Tp2B6vYcwVh14Mw5URoKlmENkbVYGpZjKa/Z1L3r+aj7/Z/lT6JfOd6hY
 qdcC2pcp0KjvDNv/Hk9uUZXp09QkIJ0zvYRbQA63h5G2S8hoNgLuKcl6Cro30i752XtR
 MA+eD4GRCz9X3sca2/MazGJVJXB9qFgSaVvnLp1dUkIbNk0Yqobk27DNZAMIs9wyVHzW
 kMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PjD/mfBFlz/AtrrL9x0Nf4kx8DWM5v1izBjt6/Kpab0=;
 b=vfd747aBCunoDsO4W7mc3auOs27wkt9C4oUnjghhmE3lK1oOpiG/ZpmMY5mxh4vBv2
 ddOouV7sQD7mc2BTxkcFZUF4x3dQFBPFBQh/uecL7nIJjTT1qXeZl/Gn8zEk57WOFkX+
 sg/t4b5dgHT+xJgb9A9gdif//6HS79ZlJgwFmT2j9zMo7xyaUTl1ct14wLnKw5D7bXyE
 owr2JPdn7Gykpzarp4es9tjlhIGKhFyMlc5XFynB66sb5EbYR2FLvEbs26G1mFKyO+o/
 ivRMgqzqw1VBPxRaMyTPPUTR4WQKaryMmMiXZOuWvi71KXQG+Ii0mQfen4fIpqGwU/D5
 wgdw==
X-Gm-Message-State: AOAM530ixOq8pliMAyA7Vk2M/RSApIUT1Hca5StwroRbCEwa01jh54oW
 7X3okJAt+3+pZEeqz/senVR7r+FxZIoWBA==
X-Google-Smtp-Source: ABdhPJzd1XOAwmlG/JRg8XpnkspvBtxjBREClAWoak8wuJRQq2EaPozR9A9EhbRPAaDnsVWD5jTavA==
X-Received: by 2002:a63:8ac9:0:b0:3ab:dab:16b4 with SMTP id
 y192-20020a638ac9000000b003ab0dab16b4mr9077462pgd.129.1650908248880; 
 Mon, 25 Apr 2022 10:37:28 -0700 (PDT)
Received: from localhost.localdomain (c-73-241-94-58.hsd1.ca.comcast.net.
 [73.241.94.58]) by smtp.gmail.com with ESMTPSA id
 c1-20020a17090ab28100b001cd4989fecfsm16218491pjr.27.2022.04.25.10.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 10:37:27 -0700 (PDT)
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
Subject: [PATCH V3 1/2] ASoC: dt-bindings: max98396: add amplifier driver
Date: Mon, 25 Apr 2022 10:37:15 -0700
Message-Id: <20220425173715.1827706-1-ryan.lee.analog@gmail.com>
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
  Changes from v2:
    No change

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

