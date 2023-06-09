Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F4572A6D8
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jun 2023 01:46:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 447A56C1;
	Sat, 10 Jun 2023 01:45:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 447A56C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686354400;
	bh=dqfuPF8gvxthn/UNhwsUl7Ve3XiMMXXi9OtSqMTjgl0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=V5NXKVt7YgyajQ7824QLz4BCiAzBmI9G/cirmuyWB+QDfOfaP7pj9cC3BfHtUZC90
	 bNq1Nhe1AmlwaEfi9BvBKqpgMct3poGdfJlDzEhWReaQzZU8sZe+VM3PWTzm3F6Sb2
	 OK6705jeokz5C3TJwrzU5JI1bHocfHbvqhU9fe9U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F0B2F80520; Sat, 10 Jun 2023 01:45:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9FF9F80199;
	Sat, 10 Jun 2023 01:45:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8608DF80254; Sat, 10 Jun 2023 01:45:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 47915F800C8
	for <alsa-devel@alsa-project.org>; Sat, 10 Jun 2023 01:45:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47915F800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=i+wKiojX
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-53fbf2c42bfso1214674a12.3
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Jun 2023 16:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686354310; x=1688946310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U4ehiGM/N7IXBZEtRKRapAz9F/jIXPptAjEznsjwM+s=;
        b=i+wKiojXxB+HczPpXI5NSFIEOCTZ+lx9OeNLRoQpDWPrQOsJL6GssC2gcQVQYQ+GbD
         WRLLGacqxtbYcqrKRJlHF/W/5AppqByhn/MmwE4kQkAe6y9YrofOrwJym4zS8+Sv2nMk
         8yZSOWdHYAmCQ8bBs/C00xnTUPlvbnKA6kHSnx2ISBhKSNodwrfduMPuaKk7ah4g15Sd
         NsqyB9AELfqxtScprpNITWPEq8TJO8tUndZ+xmwt4WMoN2pYRq0cVj3idp21mO3+embl
         G8KUlnhtCeG/EVrZbfAdc2Ksr1HquEPGB8BzsWG8JZfubWLdmOWtv2/2eaOsPq5yC8mu
         3WVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686354310; x=1688946310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4ehiGM/N7IXBZEtRKRapAz9F/jIXPptAjEznsjwM+s=;
        b=R/MR1lE3GTHol/ey6Iyt1L/rtTBPHKhTvqlQmw0zyE93mv8euX2Wmkx8LDybwj0x+4
         MrRvnb2MptPtzMaKmX/eyght/7DtzlRS3GJtR1eBbmkQ1uyjQfrlXV7Ykk1vvmzXN799
         b7wipN6haSGD0PFM17Qy0WvhOL3hnL3rR8popHFyHnN3fYBcIzfsUYBO5G7ly6z90aHu
         epUDlw5DLL7f8ExViS47BeD9ITq4ZYb8okLbWTg2XaLFUO8aH3wXfOncgQUpr6WyIiVQ
         aSu5DBh50IwJVGFkCTCUSt+actkkJGVvEtgtR1/sEsZNkTP1lie1DBcDJYX0Y7OHPRjT
         IJGA==
X-Gm-Message-State: AC+VfDy2kdp/NmNNFOrGxrKcDS9XJCYmWzBjgZsQngpxjoP3jk/7jG0N
	85QCOgkDA8TLfVmO0u6YCTc=
X-Google-Smtp-Source: 
 ACHHUZ6ik9KXbeoq6kHXhbkYGgL30azjGKOjOQCW0jlcFkK68I/dpIR4ErS1/f7CU9eHrpKz48Khmg==
X-Received: by 2002:a17:903:22c6:b0:1b3:7de7:f845 with SMTP id
 y6-20020a17090322c600b001b37de7f845mr360467plg.23.1686354309630;
        Fri, 09 Jun 2023 16:45:09 -0700 (PDT)
Received: from ryan-ThinkPad-T470.. (c-24-6-63-212.hsd1.ca.comcast.net.
 [24.6.63.212])
        by smtp.gmail.com with ESMTPSA id
 k9-20020a170902ba8900b001a5260a6e6csm3755473pls.206.2023.06.09.16.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 16:45:09 -0700 (PDT)
From: =?UTF-8?q?=E2=80=9CRyan?= <ryan.lee.analog@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.com,
	ryans.lee@analog.com,
	wangweidong.a@awinic.com,
	shumingf@realtek.com,
	herve.codina@bootlin.com,
	ckeepax@opensource.cirrus.com,
	doug@schmorgal.com,
	ajye_huang@compal.corp-partner.google.com,
	kiseok.jo@irondevice.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: venkataprasad.potturu@amd.com
Subject: [PATCH V2 1/2] ASoC: dt-bindings: max98388: add amplifier driver
Date: Fri,  9 Jun 2023 16:44:16 -0700
Message-Id: <20230609234417.1139839-1-ryan.lee.analog@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WYNMJMX6SUKRRLBWLNTVKMS22AEKMIAY
X-Message-ID-Hash: WYNMJMX6SUKRRLBWLNTVKMS22AEKMIAY
X-MailFrom: ryan.lee.analog@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WYNMJMX6SUKRRLBWLNTVKMS22AEKMIAY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ryan Lee <ryans.lee@analog.com>

Add dt-bindings information for Analog Devices MAX98388 I2S Amplifier

Signed-off-by: Ryan Lee <ryans.lee@analog.com>
---
Changes from v1:
  Removed unnecessary blank line and description. Modified quotes.

 .../bindings/sound/adi,max98388.yaml          | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/adi,max98388.yaml

diff --git a/Documentation/devicetree/bindings/sound/adi,max98388.yaml b/Documentation/devicetree/bindings/sound/adi,max98388.yaml
new file mode 100644
index 000000000000..93ccd5905736
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/adi,max98388.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/adi,max98388.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices MAX98388 Speaker Amplifier
+
+maintainers:
+  - Ryan Lee <ryans.lee@analog.com>
+
+description:
+  The MAX98388 is a mono Class-D speaker amplifier with I/V feedback.
+  The device provides a PCM interface for audio data and a standard
+  I2C interface for control data communication.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - adi,max98388
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+  adi,vmon-slot-no:
+    description: slot number of the voltage feedback monitor
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    default: 0
+
+  adi,imon-slot-no:
+    description: slot number of the current feedback monitor
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    default: 1
+
+  adi,interleave-mode:
+    description:
+      For cases where a single combined channel for the I/V feedback data
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
+  - '#sound-dai-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        max98388: amplifier@39 {
+            compatible = "adi,max98388";
+            reg = <0x39>;
+            #sound-dai-cells = <0>;
+            adi,vmon-slot-no = <0>;
+            adi,imon-slot-no = <1>;
+            adi,interleave-mode;
+            reset-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
+        };
+    };

base-commit: 53ab6975c12d1ad86c599a8927e8c698b144d669
-- 
2.34.1

