Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B487A94A9
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 15:23:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CC71A4D;
	Thu, 21 Sep 2023 15:22:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CC71A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695302598;
	bh=KdDojGtR4+q+0YrKAbuo32zKEzC/Tb/4F1i7waYDPSs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=sNGsrtE7SFnjrPaeoWD1rKfGADd4NvuzpeuN49wmEzlh+TvuuvW50q/2ZZn592Cqv
	 ucC3RYN0Vj47VIAvSXVkCa6frtRhEnvfrKzXBV7fwHK0owzOPtrTo5f8ZyIYZNLGMP
	 w0yHgK1+pua1zkSj4QN1ObPvhY3Evow6Wmii9XDg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFA91F805A0; Thu, 21 Sep 2023 15:21:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFBFEF8057F;
	Thu, 21 Sep 2023 15:21:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DF44F801F5; Tue, 19 Sep 2023 11:08:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AAF5EF80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 11:07:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAF5EF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jtIYh6QM
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1c3d8fb23d9so42663225ad.0
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Sep 2023 02:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695114469; x=1695719269;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NnhRGqMKJY6uMT0U4qJtmaqTBOCE6EUZnss064Sq+3E=;
        b=jtIYh6QMpY79PPy1vmhxmsYxNhKBHggHBgDXEhi3FI+r6772ISOFIz9aiqo5W7xFei
         qhR/KfDgs+0JEY+QH1TqOzg8ReVpmXISIBev1we9Tn68dfD0izDi50jwllhkuN7KGjmE
         vUj9szMSXjKwf5ogtia/k8fTejLKbw7v5YrYWTQENJ46pMCKWoeJyw6bGnhbOaHD79s0
         qPwdK0hzIHtm+uaP3jrQW/MNFZ75nj2UPFL79/cKvXVA0kXH48DsAy7FW4hT4Ha41Cdc
         X0OYCFqRTeKWnyon2Pfi0nVnfu48DNaBcrL2qFcHNC1qhx5FtmzxGPxzUYAMd9Rc0saZ
         cCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695114469; x=1695719269;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NnhRGqMKJY6uMT0U4qJtmaqTBOCE6EUZnss064Sq+3E=;
        b=P6vg8Dej56CjdDunSpgWjgiM6kxCt7XSZgxREVp7GLNU+h8B6a8j+WJDRfT4Yx6kj5
         Fzos1rao0EW+QSlgh98ubN+cDGCrricCofs9Bo8KsvvImbV1r8n/v5smHlnE2LDy3Nj8
         ZFh779stlfXFT90bJ44920wWMT8WENo2ZzgJm0kgR2zeHJ9ffQb2nlmXiIBVkNC2XZEC
         36mJUf4lhGurLFWZfWryDXdouGmMbhoL4HY473F32mQwKonYbkRMYdHpbwNYOGJOPmP2
         WK9T+KDZQPGr/h0UXrokBRZLxU8Z9JEu6iGYykl3DKVaCimclpBhzXZ2KGa/GDyTLr5n
         cLvw==
X-Gm-Message-State: AOJu0YwZxvd80u6P6FZMTloLGvjFqXSBrn6dUb1QIVu8AphH2f4rAI+Y
	tBcu717ylvg8QQGEVPXItpQ=
X-Google-Smtp-Source: 
 AGHT+IGzObmJ/bbdrcKjNOqflSJNm5msY4VALGTtgmzd+ZHM9rWYiThmYNqGyN+is5H/DLJFRS9zLA==
X-Received: by 2002:a17:902:f68b:b0:1b7:e86f:7631 with SMTP id
 l11-20020a170902f68b00b001b7e86f7631mr12437557plg.19.1695114469235;
        Tue, 19 Sep 2023 02:07:49 -0700 (PDT)
Received: from brag-vm.localdomain ([117.243.68.251])
        by smtp.gmail.com with ESMTPSA id
 p6-20020a170902a40600b001bf00317a49sm9582411plq.104.2023.09.19.02.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 02:07:48 -0700 (PDT)
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
Subject: [PATCH] ASoC: dt-bindings: tfa9879: Convert to dtschema
Date: Tue, 19 Sep 2023 14:37:39 +0530
Message-Id: <20230919090739.2448-1-bragathemanick0908@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: bragathemanick0908@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BUFLRFKMJHBT4A3VXPU4I4BVKPAG3XTU
X-Message-ID-Hash: BUFLRFKMJHBT4A3VXPU4I4BVKPAG3XTU
X-Mailman-Approved-At: Thu, 21 Sep 2023 13:21:18 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BUFLRFKMJHBT4A3VXPU4I4BVKPAG3XTU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the tfa9879 audio CODEC bindings to DT schema

Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
---
 .../bindings/sound/nxp,tfa9879.yaml           | 45 +++++++++++++++++++
 .../devicetree/bindings/sound/tfa9879.txt     | 23 ----------
 2 files changed, 45 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,tfa9879.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/tfa9879.txt

diff --git a/Documentation/devicetree/bindings/sound/nxp,tfa9879.yaml b/Documentation/devicetree/bindings/sound/nxp,tfa9879.yaml
new file mode 100644
index 000000000000..792494f4a2dd
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nxp,tfa9879.yaml
@@ -0,0 +1,45 @@
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
+additionalProperties: false
+
+examples:
+  - |
+    i2c1 {
+       #address-cells = <1>;
+       #size-cells = <0>;
+       amp: amp@6c {
+          compatible: "nxp,tfa9879";
+          reg: <0x6c>;
+          "#sound-dai-cells": <0>;
+          pinctrl-names: "default";
+          pinctrl-0: <&pinctrl_i2c1>;
+       };
+    };
+
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
-- 
2.34.1

