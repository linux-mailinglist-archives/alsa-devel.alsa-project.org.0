Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E562172C3A
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2020 00:26:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6CA216E9;
	Fri, 28 Feb 2020 00:25:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6CA216E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582845966;
	bh=k69qIj9vYTNqCnNoD8LslJjoCyg947/2+n0BdN2ZNrI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GETfXHAe8Jgs7ANMrW5x3HFob99EfvsH6FAH6lOXt5z2NJx1G6czlPJEj0C/znHwJ
	 W05NdgVuDsPTLeiQci1I6psXG+69SCyx8WgjjjZp7xw1trSQSAueX1GIWbNTp6E4rj
	 COWTdZ5ZH5p751/cPd5nb4YlNfE152srNnsDHHoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05290F80143;
	Fri, 28 Feb 2020 00:23:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 793E0F8025E; Fri, 28 Feb 2020 00:23:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30167F80143
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 00:23:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30167F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.b="alW5i5CG"
Received: by mail-ed1-x543.google.com with SMTP id c7so1138050edu.2
 for <alsa-devel@alsa-project.org>; Thu, 27 Feb 2020 15:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=maNRCkqEFToWwQhdLFKQW+0gZEdg0pLIXm9M/9EQEc8=;
 b=alW5i5CGU2Oyt2HGnJiqm5ubDg89nvcuWHJP+uXRIv3WOaaetFbwi1pvEqXAFqzhjg
 OmQhw7nP74oskjhkGUbP9XTZZwWy4Of588m7elc2t372EtgTorJdAIbwLQazxJCcneuD
 qS3BmxEXAXo2lkG1jqaXeT3Kgx50e7MBZE6Wx5qg0wBOfnJUDcYTuSddJxK2bO8A9Xdt
 2IBmEZJvMYuVIa56F7J2RC21pEtMqxZgs96Uj00HK1pRT6izgiBREYJ4u8QFNXZh2+yR
 SATTS6nRerKP/BttGdvsgZV15iNpMiQDABnXj7Lxqpw8Dgup6yUmKta995MuKrmTiAKa
 CK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=maNRCkqEFToWwQhdLFKQW+0gZEdg0pLIXm9M/9EQEc8=;
 b=IHPVSSCjZflHasw8o8VUqWxVBw2jJ+mCXPG4HEhb0okJ5S+ZtRVv7ELWNVmv8WXrvB
 5U40zz7XHtZ2XxblJL4Tzhu+d/EzKabQiaOOwgiD26Mbxi+ws/fkoliJSaJXJRLfplMl
 CHc1xOqVI4tzlOZMytKD18xftitiAsV2RIYsIaMhwWIAG4iF/PRvD7IVBtuMh4dcEPk1
 RMVk5meR1QuuIAN4JZIvEzLXRJWZTafLJa0RquXF082N6tKsGCgun6V8RfZZBviJVVfq
 RNRX1PDdwi/BwvHjabJ9fAWee1SDNCWOKToPebVbnzjVpcfG4HCM52MNDmRzzWl7+KQU
 K1+w==
X-Gm-Message-State: APjAAAUiG8v05WQghrlsi5U+pxgrFKxUa7eGvhOU1CXKvyMtjGYhTQl4
 P9gv0LZrEgjTKpYkC3BeD3hp30aQyDU=
X-Google-Smtp-Source: APXvYqxcbQ3j/ddNm1PVQJsPX2xZ4IlHzLT7KAL90l8pQoCHC3RcVgmN6UTcSqqNpp/r3cfQ8CSfYA==
X-Received: by 2002:aa7:d2cf:: with SMTP id k15mr851197edr.299.1582845823518; 
 Thu, 27 Feb 2020 15:23:43 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a03f:44b4:9700:886c:841d:dea2:ee2a])
 by smtp.googlemail.com with ESMTPSA id d16sm468117eds.18.2020.02.27.15.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 15:23:43 -0800 (PST)
From: Charles-Antoine Couret <charles-antoine.couret@mind.be>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2 V2] ASoC: tas5756m: Add DT binding document
Date: Fri, 28 Feb 2020 00:23:27 +0100
Message-Id: <20200227232327.46309-3-charles-antoine.couret@mind.be>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227232327.46309-1-charles-antoine.couret@mind.be>
References: <20200227232327.46309-1-charles-antoine.couret@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org,
 Charles-Antoine Couret <charles-antoine.couret@mind.be>
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

Document the bindings for the tas5756m driver.

Signed-off-by: Charles-Antoine Couret <charles-antoine.couret@mind.be>
---
 .../devicetree/bindings/sound/tas5756m.yaml   | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/tas5756m.yaml

diff --git a/Documentation/devicetree/bindings/sound/tas5756m.yaml b/Documentation/devicetree/bindings/sound/tas5756m.yaml
new file mode 100644
index 000000000000..47be70f1633a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tas5756m.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+
+$id: "http://devicetree.org/schemas/tas5756m.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: TAS5756M audio codec Device Tree Bindings
+
+maintainers:
+  - Charles-Antoine Couret <charles-antoine.couret@mind.be>
+
+description: |
+  You can read datasheets there:
+  http://www.ti.com/lit/ds/symlink/tas5754m.pdf
+  http://www.ti.com/lit/ds/symlink/tas5756m.pdf
+
+  TAS5754M datasheet has a more complete datasheet about register mapping
+  which is common with TAS5756M.
+
+  Those devices have a programmable DSP whith several modes named hybridflow.
+  More details about it there: http://www.ti.com/lit/ug/slau577a/slau577a.pdf
+
+properties:
+  compatible:
+    enum:
+      - "ti,tas5756m"
+      - "ti,tas5754m"
+
+  reg:
+    maxItems: 1
+    description: I2C slave address
+
+  "#sound-dai-cells":
+    const: 0
+
+  mute-gpios
+    maxItems: 1
+    description: GPIO wired to the mute pin.
+
+  ti,hybridflow
+    description: |
+      Select the HybridFlow DSP program.
+      If not supplied default DSP program is used instead.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+      - enum: [1, 2, 3, 4, 5, 6, 7, 8, 9]
+
+additionalProperties: false
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+  - reg
+
+examples:
+  - |
+    tas5756m: tas5756m@4c {
+        compatible = "ti,tas5756m";
+        reg = <0x4c>;
+        #sound-dai-cells = <0>;
+
+        ti,hybridflow = <6>;
+        mute-gpios = <&gpio1 11 GPIO_ACTIVE_LOW>;
+    };
-- 
2.24.1

