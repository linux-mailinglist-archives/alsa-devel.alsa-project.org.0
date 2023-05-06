Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 805AE6FA178
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 09:50:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39ABD12DD;
	Mon,  8 May 2023 09:49:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39ABD12DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683532225;
	bh=RmY5VZCSB65ftYyJ6nh6y+Za536J0SZ4gQeYl/VAjS8=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bukxJll84mApIbSWczJS1d7okZTTWbwscaFEMxVuJwPIwpHqONJm93hdQwf/nHXNn
	 yNr51hLAItQamFp9y/dMtEkwvLYQF0jg/htDtJl2T7DxLj+pmBvaLX+j+YCTI4oja9
	 EeWb+o4jQv/nqI67eE/6dAFFBizlQ++7hqFwrR9c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7E6AF805D6;
	Mon,  8 May 2023 09:46:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F036F8052D; Sat,  6 May 2023 12:52:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B2C1F80114
	for <alsa-devel@alsa-project.org>; Sat,  6 May 2023 12:52:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B2C1F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Y02N91RB
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-24decf5cc03so1963907a91.0
        for <alsa-devel@alsa-project.org>;
 Sat, 06 May 2023 03:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683370336; x=1685962336;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2WPWQzoKyocx4jwyrEWsU5/Mb3QtUt6PFyws4Xy1T9Y=;
        b=Y02N91RBlzP2MsrhYJsjugMSEbfcZeRHNsSeyLH0V4jJ25bvKsKxum9+cfrKRdmtyE
         2jatmgCyio0UXbdC5JSLlzi8onHkp8ZHKZZn/iLsDX8mWZKwY6PFx1qPx7x/NJZ8rYbm
         KxrX+GYTu+U36gmbDb55e+PAqY6n2+SMxQ1x9yCiI/l/76xBikEFrFFYU8t+TYJM2kbd
         sJB5bKMu/Xu3nppT0lSI4csaJQ8m86fKjwN+ZwE5VCDsAhEsVMsbhGyKHh4oBCOSM1c6
         5ZEYz2hvMQTPDuVgNKp9LKmVynKqFqtITxT1OE3W8fUW5cd/82N15gDukM3QRmhdqkY2
         rAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683370336; x=1685962336;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2WPWQzoKyocx4jwyrEWsU5/Mb3QtUt6PFyws4Xy1T9Y=;
        b=eUd5i0JNL0i+o479WNPDJ1MIn1tB4tJlsNW4uJ0MHHrQb46DAep9T2FMvGawz/FgHG
         U9fNgv7nvcU35hQKr03SckjibDTmoGIl9lTESrEUadog4yoT36zXQIK4dVZwDmeaQ1wH
         lZ3KFSYCv3cua9P7ciAHo4lI9L6crpUGbBdeCEnXDhsqKB1B0ajRuXve7UB3dq1cBUua
         hgdtlii8XOXb7BHQ1aZk9sVnjdrI7NZ5G8l2T8P/xME4oXuPkoLsoIT+W2EYGLh6qNae
         54Hn4WEZxexZHwc8zcIPSSP28bBNT70ZESxF/P7ZPL5He5s0dHek+0gbCN9y25c5ebNI
         q0RQ==
X-Gm-Message-State: AC+VfDztmA6CLrd74HkQfrXWaImt+zHX/tkTxgqM4NaQE3gm7EPb5KnL
	CIm7yRqbErkv/4vocXMaSMo=
X-Google-Smtp-Source: 
 ACHHUZ64Hd99wZVk+p30c+4tID1J1V+hd30DeVjfmgF0X5yIzsDDwYEdecW6dcmGNDwQPN+e5WT1Rw==
X-Received: by 2002:a17:902:d4c3:b0:1ab:14da:981 with SMTP id
 o3-20020a170902d4c300b001ab14da0981mr5141456plg.35.1683370335839;
        Sat, 06 May 2023 03:52:15 -0700 (PDT)
Received: from yoga ([2400:1f00:13:6324:7c97:8040:5b6b:bbd5])
        by smtp.gmail.com with ESMTPSA id
 h12-20020a170902748c00b001a9581d3ef5sm3322457pll.97.2023.05.06.03.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 03:52:15 -0700 (PDT)
Date: Sat, 6 May 2023 16:22:09 +0530
From: Anup Sharma <anupnewsmail@gmail.com>
To: robh@kernel.org
Subject: [PATCH v2] ASoC: dt-bindings: nau8540: Convert to dtschema
Message-ID: <ZFYxWVdE9YkMKvXv@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-MailFrom: anupnewsmail@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZAS357TT3AB6BENK7EEOOYRAREXBNPJL
X-Message-ID-Hash: ZAS357TT3AB6BENK7EEOOYRAREXBNPJL
X-Mailman-Approved-At: Mon, 08 May 2023 07:45:55 +0000
CC: lgirdwood@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, KCHSU0@nuvoton.com, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZAS357TT3AB6BENK7EEOOYRAREXBNPJL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Convert the NAU8540 audio CODEC bindings to DT schema

Signed-off-by: Anup Sharma <anupnewsmail@gmail.com>

Changes:
V1 -> V2: Adhere to the correct procedure by including the maintainer's name.
          Drop Mark from maintainer.
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
index 000000000000..7ccfbb8d8b04
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
+  - John Hsu <KCHSU0@nuvoton.com>
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

