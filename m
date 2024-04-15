Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F64E8A9F34
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:55:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3406021E0;
	Thu, 18 Apr 2024 17:55:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3406021E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455722;
	bh=+sZ4VpMaNAH3Kyh1mrOtLGIavWRSCUxu2kcXWNcK9Ag=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YrG4WlExQzzQRtyBfWmbYpW66cNehzrYi2c3a4iHitnfz7AJU/sIlzhBMf35XGNdv
	 eSRCd/X0Anq/1O81N3njEr6qP/tZQmvMeNe956bm6P8MeJotw6WrsKe2CpmEyXFV94
	 BriP3qKLph78ecyAD1FbQcnZa8j6XXjwnB/P1VtU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 644CFF897D8; Thu, 18 Apr 2024 17:48:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE1E4F897C9;
	Thu, 18 Apr 2024 17:48:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFD34F8025A; Mon, 15 Apr 2024 12:35:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55F8CF8013D
	for <alsa-devel@alsa-project.org>; Mon, 15 Apr 2024 12:35:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55F8CF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=A+z1nWCz
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-36b0ae2b7d7so15339165ab.3
        for <alsa-devel@alsa-project.org>;
 Mon, 15 Apr 2024 03:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713177335; x=1713782135;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+XyhthZLoESO9WHc+S1+kDbhL7mPzfup8TR5Ezu6fL8=;
        b=A+z1nWCzx5NASnkr4o55tF9WG0f0a29laRAgS/+BVy5OmY4LtLtfiqDuavkxB0Y35R
         Jshuy0i1sUDMCKZyzi+VXeYBvWcRw9wpAxbPct608n+vELxh4hLrtt6KYagk5jduIswN
         rnkf+RlZp0zhwXb4NkexHivSbkxU/9ag4JLTW+jEZ6u4asvW4XqKDqBJ3VpK4emOnp/f
         o7T2lUb9ADM6YCjdc27ImnDw6n1C4q1xu2Tr0nDcRhAw2N+NQ90HGPJVCVrh6Sld7IHG
         lGPZ9ser4vxu7OSxcDV+QVvDAQlxiAwaTiU7T/Mj7zm0LVTXbr+ynXmwInzMSlhobPye
         EPpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713177335; x=1713782135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+XyhthZLoESO9WHc+S1+kDbhL7mPzfup8TR5Ezu6fL8=;
        b=OMzMyIzhKWTlMnroP4ZuAhjh2QyKqIO5jEr8hYhwx2NO4T4vMooBqB65QxzdR9fFLR
         1N4uuELAd+LxnaMrKnQ1f+Sq4uj7F4opCpYVnbvUynZ9+74A6EP6Dt39JWDwKX5sEj5Q
         rsv3IVhWEJql6nt0a9Uh5Jtg/ynFLa6DlNzia9RAaCpqodi8yc7ZQDBqG0VmgRNDkmaH
         0ucSIhm//tPZ6JWZUckmEjQrv1EL5aj9A/2SoCDMXJyMrK21JoiAcW/8AaMtZhfhMe6o
         Yg/GJF9x00U2tXaiJm+XTGdP7dxG6RJBivX5O2Is8LBXM/IP43nWanBu983gAClny1YN
         65ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDykqCS/GvZa5kqv86z3b8aIxoQDx4ysqvPEtAnd0PI20KhPby1Oi1hR06HXuy0+JkvpFfuXUwhzb3aDhejO8MEV3wou7yH4uFwjk=
X-Gm-Message-State: AOJu0YyGy3L4sVJnWJi5V54jprQS9A29GK6JQr1Vd8SwY2Afgrnrb+D5
	wye6sQeXy0R14v/jcIdU075Pnkh9LsplcEfGF3a+BhrJVB5JS6tw
X-Google-Smtp-Source: 
 AGHT+IGJY0q9uBdwrLu0JkPMZbqGy95JD3Xs0cjTSo3ts38OfBJnJAWmE+u6dEhicMygwm+jq5e5qw==
X-Received: by 2002:a05:6e02:19cd:b0:36a:a6c4:b6da with SMTP id
 r13-20020a056e0219cd00b0036aa6c4b6damr12178592ill.4.1713177334703;
        Mon, 15 Apr 2024 03:35:34 -0700 (PDT)
Received: from localhost.localdomain ([103.242.120.171])
        by smtp.gmail.com with ESMTPSA id
 u10-20020a63b54a000000b005dca5caed40sm6799430pgo.81.2024.04.15.03.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 03:35:34 -0700 (PDT)
From: Mighty <bavishimithil@gmail.com>
To: 
Cc: Mithil Bavishi <bavishimithil@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] ASoC: dt-bindings: omap-mcpdm: Convert to DT schema
Date: Mon, 15 Apr 2024 16:05:23 +0530
Message-Id: <20240415103523.139-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: bavishimithil@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OI3WHOKPN6Z5UFXSUHSHTJMJ27WU4FKK
X-Message-ID-Hash: OI3WHOKPN6Z5UFXSUHSHTJMJ27WU4FKK
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:47:20 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OI3WHOKPN6Z5UFXSUHSHTJMJ27WU4FKK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Mithil Bavishi <bavishimithil@gmail.com>

Convert the OMAP4+ McPDM bindings to DT schema.

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 .../devicetree/bindings/sound/omap-mcpdm.txt  | 30 ----------
 .../bindings/sound/ti,omap4-mcpdm.yaml        | 58 +++++++++++++++++++
 2 files changed, 58 insertions(+), 30 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/omap-mcpdm.txt
 create mode 100644 Documentation/devicetree/bindings/sound/ti,omap4-mcpdm.yaml

diff --git a/Documentation/devicetree/bindings/sound/omap-mcpdm.txt b/Documentation/devicetree/bindings/sound/omap-mcpdm.txt
deleted file mode 100644
index ff98a0cb5..000000000
--- a/Documentation/devicetree/bindings/sound/omap-mcpdm.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-* Texas Instruments OMAP4+ McPDM
-
-Required properties:
-- compatible: "ti,omap4-mcpdm"
-- reg: Register location and size as an array:
-       <MPU access base address, size>,
-       <L3 interconnect address, size>;
-- interrupts: Interrupt number for McPDM
-- ti,hwmods: Name of the hwmod associated to the McPDM
-- clocks:  phandle for the pdmclk provider, likely <&twl6040>
-- clock-names: Must be "pdmclk"
-
-Example:
-
-mcpdm: mcpdm@40132000 {
-	compatible = "ti,omap4-mcpdm";
-	reg = <0x40132000 0x7f>, /* MPU private access */
-	      <0x49032000 0x7f>; /* L3 Interconnect */
-	interrupts = <0 112 0x4>;
-	interrupt-parent = <&gic>;
-	ti,hwmods = "mcpdm";
-};
-
-In board DTS file the pdmclk needs to be added:
-
-&mcpdm {
-	clocks = <&twl6040>;
-	clock-names = "pdmclk";
-	status = "okay";
-};
diff --git a/Documentation/devicetree/bindings/sound/ti,omap4-mcpdm.yaml b/Documentation/devicetree/bindings/sound/ti,omap4-mcpdm.yaml
new file mode 100644
index 000000000..73fcfaf6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/ti,omap4-mcpdm.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/ti,omap-mcpdm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OMAP McPDM
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+
+description:
+  OMAP ALSA SoC DAI driver using McPDM port used by TWL6040
+
+properties:
+  compatible:
+    const: ti,omap4-mcpdm
+
+  reg:
+    items:
+      - description: MPU access base address
+      - description: L3 interconnect address
+
+  interrupts:
+    maxItems: 1
+
+  ti,hwmods:
+    description: Name of the hwmod associated to the McPDM, likely "mcpdm"
+
+  clocks:
+    description: phandle for the pdmclk provider, likely <&twl6040>
+
+  clock-names:
+    description: Must be "pdmclk"
+
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - ti,hwmods
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    pdm@0 {
+      compatible = "ti,omap4-mcpdm";
+      reg = <0x40132000 0x7f>, /* MPU private access */
+            <0x49032000 0x7f>; /* L3 Interconnect */
+      interrupts = <0 112 0x4>;
+      interrupt-parent = <&gic>;
+      ti,hwmods = "mcpdm";
+      clocks = <&twl6040>;
+      clock-names = "pdmclk";
+    };
-- 
2.34.1

