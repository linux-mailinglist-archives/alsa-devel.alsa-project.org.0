Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB037276D8
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 07:44:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 708CD1D7;
	Thu,  8 Jun 2023 07:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 708CD1D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686203091;
	bh=W8FMJo33iASaatg0KNlUAQdOMlye32qXoDqQALTX6/U=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WIOoFmkb0ZQpPt7yF/fylqrRXf1EMxKXhtsEofQJeMs6TFO6MnR/2HJtM+oD6ojeA
	 /h3LDHo1pnn0TJjjzH4ADdiCNr8tXhf6oXw/qOTu4yD4Gs0Zch4SMxGSIFhjTWfPG4
	 Hn2HHBIeuNLnLRiSz8UjIqrMl6WBv2DY9luv6aJI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E570DF80494; Thu,  8 Jun 2023 07:44:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DB2FF80199;
	Thu,  8 Jun 2023 07:44:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5E08F80254; Thu,  8 Jun 2023 07:43:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F123AF80155
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 07:43:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F123AF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=P3Nk1tOC
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-33c1fb9f2ecso439325ab.1
        for <alsa-devel@alsa-project.org>;
 Wed, 07 Jun 2023 22:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686203006; x=1688795006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XtolSZaJdXUNvdM4Rjo5o9rL0OX1LHOcqWzmGyfnXNs=;
        b=P3Nk1tOCSxsMZ44I2T6MohGzDc4RG3rvbvMb972fw/dJOnk/VR6+0q5BolxNoYwDP5
         y6PoAzcgjbWC1fPMy+yyx3GtPqFVawlkTap4+2zH71s90sfLrI5a5bbHzq6LG96W0jCe
         laqTn8pVRk7AJnC6AvtZSAteNbRLuaZGLQJQt8mekLc86xCPrtQJYSkJqwcWioxsHJ0p
         tKMxymLw5rrrJCehfxqWZtw8uIrIcnqtbGpRx7xgTqlvzXJCy73FF6h6OvhQqHfNeKGg
         IHDDiYcE11j15RaDfeuonTiUVyXi1voTxODhUh0w+n4YmXNUugjqxQrzflo3O3vrLR1w
         wv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686203006; x=1688795006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XtolSZaJdXUNvdM4Rjo5o9rL0OX1LHOcqWzmGyfnXNs=;
        b=VckI50QNxogKJGM1IR52XY3BH2dLtfNLQw/Mq0eDqbmkSVv176+Aip4ER4b7SxzSdY
         O/yufcbIZKpRXY30/NT+hvCdz4tmkHVn2/DL8h/2k9piq6moH7Zg5NY8YZuW+evk1KDp
         x+8PI0tghLq2i8yhu+liSbrfeY1U744J1doi99lPsy/N+aIMz2euYipdz+yudMD+YFkU
         5RYw3jHja1ak/YMoiHim7nPTW5FFp0mXENLrrvfFKKVWGPhIeA/vz7udfqMo+zsStiOt
         5KBzH+02hXRm8e92WgP5YJJD9llq5DIJq4CCqfGci+5YPTngUtfLB5RTEeDWYBCg1hOR
         bqjg==
X-Gm-Message-State: AC+VfDwlC3QZy+W3CFDuqT9fUWxVi/trwfs1TGGdaz8HcmVe8qyogvtf
	c8FWJ8OSnwRpHss8t4SYAPA=
X-Google-Smtp-Source: 
 ACHHUZ7+bfFyU+fEd9s1V1vdPHDfQF1iA8u1ua3PGiwhj/TUrkLp6wgyS4cycp/OFscGL5El97acMA==
X-Received: by 2002:a92:da0d:0:b0:335:5bb2:6262 with SMTP id
 z13-20020a92da0d000000b003355bb26262mr7730875ilm.27.1686203006244;
        Wed, 07 Jun 2023 22:43:26 -0700 (PDT)
Received: from ryan-ThinkPad-T470.. (c-24-6-63-212.hsd1.ca.comcast.net.
 [24.6.63.212])
        by smtp.gmail.com with ESMTPSA id
 v24-20020a62a518000000b0064d2ad04cbesm249641pfm.209.2023.06.07.22.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 22:43:25 -0700 (PDT)
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
Subject: [PATCH 1/2] ASoC: dt-bindings: max98388: add amplifier driver
Date: Wed,  7 Jun 2023 22:42:29 -0700
Message-Id: <20230608054230.344014-1-ryan.lee.analog@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MOAYNWAAQIUJCP42LOLOYV7GLNRD5EM4
X-Message-ID-Hash: MOAYNWAAQIUJCP42LOLOYV7GLNRD5EM4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MOAYNWAAQIUJCP42LOLOYV7GLNRD5EM4/>
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
 .../bindings/sound/adi,max98388.yaml          | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/adi,max98388.yaml

diff --git a/Documentation/devicetree/bindings/sound/adi,max98388.yaml b/Documentation/devicetree/bindings/sound/adi,max98388.yaml
new file mode 100644
index 000000000000..fc0ac8d8c3ae
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
+  reg:
+    maxItems: 1
+    description: I2C address of the device.
+
+  '#sound-dai-cells':
+    const: 0
+
+  adi,vmon-slot-no:
+    description: slot number of the voltage feedback monitor
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 15
+    default: 0
+
+  adi,imon-slot-no:
+    description: slot number of the current feedback monitor
+    $ref: "/schemas/types.yaml#/definitions/uint32"
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
+  - "#sound-dai-cells"
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
-- 
2.34.1

