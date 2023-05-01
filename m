Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B406F5058
	for <lists+alsa-devel@lfdr.de>; Wed,  3 May 2023 08:51:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDA9D1382;
	Wed,  3 May 2023 08:50:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDA9D1382
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683096702;
	bh=JSaLQxezbnlZ+fb+jAq/0NATmHqA7xKE5nrpYVkraTY=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JOGOBx04nSg5YsBE4sqPRmqGu7kzRFJupngsSNqzmNTJgZeIQ91VZSmDcokrAN5ML
	 1QF6MMaqWZoUyPISsRZ4UziB9g93iCM2IKeTq2TkEEntPkXX0taASRsDE6RonoC8OZ
	 kBlYyoGzKBiZb2ja3FVOIbeO4Ytlxcc/jogHiPLs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA847F800EC;
	Wed,  3 May 2023 08:50:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE987F8032B; Mon,  1 May 2023 09:33:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDAA8F80087
	for <alsa-devel@alsa-project.org>; Mon,  1 May 2023 09:33:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDAA8F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=VZZxD7r2
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-63b4960b015so1515203b3a.3
        for <alsa-devel@alsa-project.org>;
 Mon, 01 May 2023 00:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682926386; x=1685518386;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5yhF2kJmDkq2QyRMJA1sSrfW3XhDRwS7D+Qmpc0RRM4=;
        b=VZZxD7r2iGrZsIMqiq5AnEdCCjdy7onR430ShOA2rU35wBTpDESQ4j+2rKI1SvHeKr
         +mFd0JhacVXyVXoxkXoJ09KhVt4WZW9GB6yU4djfPuGw2jbKENQp5yjfHjA58eqH2d+A
         DGHynAQy8wklYUC18OMEQy6/oxMg9BqRz1V7pp2mO1nRn8vgi+QffiwELMpqzi9Tu2m2
         I9c0Czm5uN64cNSJO7ei0Fpr1dAh75nKCg5tRUaCgUu3V8PDSrQc9Uku7IyIKkG3yBmu
         oQrV0PGbjWeGaZonLUlBchnv+oATpTs/T73WI8VyTiwBZjsj1OTzhAjl4GNgssNeGsrk
         gXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682926386; x=1685518386;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5yhF2kJmDkq2QyRMJA1sSrfW3XhDRwS7D+Qmpc0RRM4=;
        b=gfVPLoAbSD1+P1ZNkE5lFNwkLJztBkBxATAIyKk5dpstiqtHJJt/K8qpwpcxP5lv9g
         7owfka3MaNelIUR+0sWcujfzFx1r6wLQVJz3qmTN/2Tc6n2O8LB/MyEWjumSlfLRizj/
         UnafmrugH41Tl9wIgqISJLF00CHR8rYP/domj5igOAW+/fDIO4/ukLWnATQyttjQ8fki
         qQfNMdj6pt0SG8xlhFKHXgW9fON9tmL4eBXnexGaCjyyCU9zF0eZ6CZXsb+aSnySOq+1
         fP1iVFcna3TNfy6mMhu1qRUa8XQYwKk9rGgruBSA0abxBz8Ht7vUryazhkjM33NCFnXi
         y62w==
X-Gm-Message-State: AC+VfDxzY9j3nCwd+cVBnvUWI1kQO7XzeSX0HRZpTL62F7+B2c8bVEDy
	+16RgtdAdQJtp8gCVSpiA28=
X-Google-Smtp-Source: 
 ACHHUZ6co/rMjhKOyb8zdQZ5OT1jZtqQKGVeuw7UI+b+nt1E3eecgXiTDcBvvb/qw7EgrleM6/S5kQ==
X-Received: by 2002:a05:6a00:2281:b0:640:dbe4:1901 with SMTP id
 f1-20020a056a00228100b00640dbe41901mr16901796pfe.14.1682926386295;
        Mon, 01 May 2023 00:33:06 -0700 (PDT)
Received: from yoga ([2400:1f00:13:800:1d90:2dc1:65b:f2f3])
        by smtp.gmail.com with ESMTPSA id
 f195-20020a6238cc000000b0063b8428b0d8sm19241571pfa.152.2023.05.01.00.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 00:33:05 -0700 (PDT)
Date: Mon, 1 May 2023 13:02:59 +0530
From: Anup Sharma <anupnewsmail@gmail.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org
Subject: [PATCH] ASoC: dt-bindings: nau8540: Convert to dtschema
Message-ID: <ZE9rK6mktPByvRRz@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: anupnewsmail@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IAGDV3RYF5VJJNA6QT5TYGOYWSWGKJ6E
X-Message-ID-Hash: IAGDV3RYF5VJJNA6QT5TYGOYWSWGKJ6E
X-Mailman-Approved-At: Wed, 03 May 2023 06:50:46 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 KCHSU0@nuvoton.com, linux-kernel@vger.kernel.org, anupnewsmail@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IAGDV3RYF5VJJNA6QT5TYGOYWSWGKJ6E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the NAU8540 audio CODEC bindings to DT schema

Signed-off-by: Anup Sharma <anupnewsmail@gmail.com>
---
 .../devicetree/bindings/sound/nau8540.txt     | 16 --------
 .../bindings/sound/nuvoton,nau8540.yaml       | 40 +++++++++++++++++++
 2 files changed, 40 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nau8540.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8540.yaml

diff --git a/Documentation/devicetree/bindings/sound/nau8540.txt b/Documentation/devicetree/bindings/sound/nau8540.txt
deleted file mode 100644
index 307a76528320..000000000000
--- a/Documentation/devicetree/bindings/sound/nau8540.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-NAU85L40 audio CODEC
-
-This device supports I2C only.
-
-Required properties:
-
-  - compatible : "nuvoton,nau8540"
-
-  - reg : the I2C address of the device.
-
-Example:
-
-codec: nau8540@1c {
-       compatible = "nuvoton,nau8540";
-       reg = <0x1c>;
-};
diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8540.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8540.yaml
new file mode 100644
index 000000000000..ac344e435a5c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8540.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nuvoton,nau8540.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton Technology Corporation NAU85L40 Audio CODEC
+
+maintainers:
+  - KCHSU0@nuvoton.com, broonie@kernel.org
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,nau8540
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
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        codec@1c {
+            compatible = "nuvoton,nau8540";
+            reg = <0x1c>;
+        };
+    };
-- 
2.34.1

