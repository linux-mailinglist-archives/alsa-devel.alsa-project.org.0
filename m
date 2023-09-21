Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B243C7AAAD0
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 09:52:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5613CDF1;
	Fri, 22 Sep 2023 09:51:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5613CDF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695369154;
	bh=p0porzjtM7prWMoGjFsbBDMK9K3omahP6owNEMNUJro=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aH7O6SiHmL17sZ/oSVsLIwt8q9fwGadMrbRtSxn75IF3MkkPczvD7jaTYuOaDH50V
	 IFR/UUDuJC6N18sfxAvLz+FmG15jpGTcqqyg4SeJivHbjkjhXaBmtITpkm6LgXMkb3
	 PIqr8g4ViczmIcHN7fG7J4U47UkJp12JnCOmdTzw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9C63F8025A; Fri, 22 Sep 2023 09:51:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 723ABF80125;
	Fri, 22 Sep 2023 09:51:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62624F8025A; Thu, 21 Sep 2023 20:34:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B085F800AA
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 20:34:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B085F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bydxRhDa
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1c1ff5b741cso11567585ad.2
        for <alsa-devel@alsa-project.org>;
 Thu, 21 Sep 2023 11:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695321259; x=1695926059;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bGf/7eKiw4GZy2wkGbtT/YuoGRNiPGyqjAL1OAImvU4=;
        b=bydxRhDaYK5DMLgon7h0zag/4Fvi79klW3WcQiG4RvYEzrePWO/17iPkQEg7/c2YOf
         ZlMs1PbjzESXy7K7r5Oh0v+xmRGWyk2eG7ZyH4/ZJSwrmvM0iFvfXS/2KdYmq8JXX515
         m17Vctyz52QgV+BrO4rGrOSAakehvrJ70SKBuoWZp3AlcLQzWsWR8kwqfDNz5JNVprh5
         dI0ma9WaW8/H7uW1VujkDH4LGa+VVaSjIyc1/KEbhBPwVRtChPr1ZzxkxO4YdLH2wkO9
         sP9N3iH6ovEGuVJFxdv6SzRORwfXFM5oLBUoc3eMfGGyhrxeNgeRMmkUgy5W8qEctuQi
         hmhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695321259; x=1695926059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGf/7eKiw4GZy2wkGbtT/YuoGRNiPGyqjAL1OAImvU4=;
        b=RUjEZOAQ5RCbZovJNG8sLKWSB6tJ+OtmDFFtXitTjxFFV15DYywrXdAMNFGBITmBd4
         xSyr6tD+rqQjuIvTGr7mUPVpEufYYwmpfF94z3R5uzgshbiqqwIDSnZK6hm+fAa+QL6Q
         FFh1i+jtcLccBZdx4E2mKSeFhffgfFG0pOGHMRFk8yc+qv/oCq2oWOacsQWirdY47Gpy
         DLK/t1ieno7zdUOw5N2iO9E8MtkBNAQLmAy1NQLIRCxqcF83+LbxTcPceu2bzL0ANFj/
         8vhiWmsG07WeYXPYKuYo5QB5jVbz9/nJJOyZ7SBaebIlDO5exwg9IK5fSGwBK/ocdIww
         5JAw==
X-Gm-Message-State: AOJu0YySenBVVrMfYgNJFF8PObCGtZgh9bBYcaljmCNI0FRJzbkM0qHs
	AvEi7ICJk7tw2nYBmSDpsu4=
X-Google-Smtp-Source: 
 AGHT+IHIURvUvx+ENScmM7CExkX+NBRuXfn7qir3DidtTnofrsT1JNEfob6CFehvv2XfBUELPXBlsg==
X-Received: by 2002:a17:902:7d93:b0:1c5:e00f:2 with SMTP id
 a19-20020a1709027d9300b001c5e00f0002mr910511plm.28.1695321258605;
        Thu, 21 Sep 2023 11:34:18 -0700 (PDT)
Received: from localhost.localdomain ([122.172.81.113])
        by smtp.gmail.com with ESMTPSA id
 c3-20020a170902d90300b001bbfa86ca3bsm1844790plz.78.2023.09.21.11.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 11:34:18 -0700 (PDT)
From: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: dt-bindings: tfa9879: Convert to dtschema
Date: Fri, 22 Sep 2023 00:03:13 +0530
Message-Id: <20230921183313.54112-1-bragathemanick0908@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: bragathemanick0908@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7XNPQFQ2V2ZCIN6O6BQJ6OYTHANBVALH
X-Message-ID-Hash: 7XNPQFQ2V2ZCIN6O6BQJ6OYTHANBVALH
X-Mailman-Approved-At: Fri, 22 Sep 2023 07:51:38 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7XNPQFQ2V2ZCIN6O6BQJ6OYTHANBVALH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the tfa9879 audio CODEC bindings to DT schema
No error/warning seen when running make dt_binding_check

Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>

Changes:
V1 -> V2: Fixed DT syntax errors and doc warning
---
 .../bindings/sound/nxp,tfa9879.yaml           | 44 +++++++++++++++++++
 .../devicetree/bindings/sound/tfa9879.txt     | 23 ----------
 MAINTAINERS                                   |  2 +-
 3 files changed, 45 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,tfa9879.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/tfa9879.txt

diff --git a/Documentation/devicetree/bindings/sound/nxp,tfa9879.yaml b/Documentation/devicetree/bindings/sound/nxp,tfa9879.yaml
new file mode 100644
index 000000000000..df26248573ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nxp,tfa9879.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nxp,tfa9879.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP TFA9879 class-D audio amplifier
+
+maintainers:
+  - Peter Rosin <peda@axentia.se>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: nxp,tfa9879
+
+  reg:
+    maxItems: 1
+
+  "#sound-dai-cells":
+    const: 0
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
+    i2c1 {
+       #address-cells = <1>;
+       #size-cells = <0>;
+       amplifier@6c {
+          compatible = "nxp,tfa9879";
+          reg = <0x6c>;
+          pinctrl-names = "default";
+          pinctrl-0 = <&pinctrl_i2c1>;
+          #sound-dai-cells = <0>;
+       };
+    };
diff --git a/Documentation/devicetree/bindings/sound/tfa9879.txt b/Documentation/devicetree/bindings/sound/tfa9879.txt
deleted file mode 100644
index 1620e6848436..000000000000
--- a/Documentation/devicetree/bindings/sound/tfa9879.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-NXP TFA9879 class-D audio amplifier
-
-Required properties:
-
-- compatible : "nxp,tfa9879"
-
-- reg : the I2C address of the device
-
-- #sound-dai-cells : must be 0.
-
-Example:
-
-&i2c1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_i2c1>;
-
-	amp: amp@6c {
-		#sound-dai-cells = <0>;
-		compatible = "nxp,tfa9879";
-		reg = <0x6c>;
-	};
-};
-
diff --git a/MAINTAINERS b/MAINTAINERS
index a4c30221eb30..569303daf9b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15476,7 +15476,7 @@ NXP TFA9879 DRIVER
 M:	Peter Rosin <peda@axentia.se>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
-F:	Documentation/devicetree/bindings/sound/tfa9879.txt
+F:	Documentation/devicetree/bindings/sound/nxp,tfa9879.yaml
 F:	sound/soc/codecs/tfa9879*
 
 NXP-NCI NFC DRIVER
-- 
2.34.1

