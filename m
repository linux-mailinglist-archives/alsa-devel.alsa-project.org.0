Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FC66DE1CD
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 19:01:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78EE6F03;
	Tue, 11 Apr 2023 19:01:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78EE6F03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681232512;
	bh=vfXKcsnaBwQFka1texw0M4BAVLYtN+WCsdiZjdc6HuE=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LGF/rheKoZMLs2VFIDr8WUFQqACHgPeiC0p7WjBYeu9+QuDRyFB/Ki+sqH4kNNoLa
	 rySognyRy9yE7PfbmH/jNwVVua8FiZeCvfdLEjgEf7agK3s2+zeHwHJEqDrCQqe/gr
	 EMAoeLBJSJH1E72DpFVpOZ1Ev5lt2R78KJjzPKm8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0790F804F2;
	Tue, 11 Apr 2023 19:00:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 667F5F8032B; Tue, 11 Apr 2023 19:00:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85B80F80149
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 18:59:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85B80F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pWToz4U6
Received: by mail-ej1-x62c.google.com with SMTP id sh8so22031511ejc.10
        for <alsa-devel@alsa-project.org>;
 Tue, 11 Apr 2023 09:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681232394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=grPBE8/AW9duwaajeZP7b+dDjiUP9gDZ3cyS7x0Oihs=;
        b=pWToz4U61+BWTGI5jLpq8P1+fo6sLD5Mc/Gm+nUGDHeZB85cL9TEcmjA71LiSsFhWM
         /LE6IZuzJQVl5jhgetzdMZH0EU1tw1CcVSH16vrzAH+2koLWvj3uQDowXRoNcslhclGR
         zIiSC3z5m208ODU+CkmFwNhve/hRTfUQVFsc4b4D2C7wst4Og4uuCwfntHCIgvznFWWi
         NcAiRG0zJDETKSze5g2tJ8GH0IxnRjGSRy84eHTCIQ+0CI+NeUECNUfTF4L5JdBlf6FD
         sF9R2Cz8dpCc8byPfs9qG8vfK8RMARjxOpIVSvoZAEQ7ejIsDlDajiG12WHq4wV1smGf
         jLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681232394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grPBE8/AW9duwaajeZP7b+dDjiUP9gDZ3cyS7x0Oihs=;
        b=L9+Z8qfF15Ws5qjXIoohdjqFSiZJiYNALIbfF5LUCRzeuNJ6ySQVeAhYMBLupsTYYw
         aUVUWvdn0Up/1GUNLNDxhxfezJSsDfTgFj9sRXB9hago2RoUC5BcYpUzMpwP8IDJ5vtY
         CvZK4xE2JGJ563cDLppZ7BLJwc/vwa2RDLKlq8CxeDibz36VuY8JXu7U57u0YwXTpnOS
         yS3JdMng88cNg2HsE+RY7Qk52mvgWj9aTsruxe6imfi35Lz39o83eGzae72VoOXv53TY
         +ck5aRnFQbzzi0V7fH+7cLbIYyxIuCr/aTovXq9kB7zowvXFpDtZsjkjXUPIBCPlrA8J
         guUw==
X-Gm-Message-State: AAQBX9fe2LWAv/TBAbi7RknrSV36+YDw8DKP2uJl6kjiAWbSrvoTp1+x
	POlM4Bfkp07aEgz0TLm4o9A=
X-Google-Smtp-Source: 
 AKy350YDB905MTox0+gR/vwMshE99CJuQWK4JRRs7QS7l3CVsR5xDfIoYdMawlatVJnqlwj601ICVA==
X-Received: by 2002:a17:906:3093:b0:932:20a5:5b with SMTP id
 19-20020a170906309300b0093220a5005bmr8752336ejv.23.1681232394200;
        Tue, 11 Apr 2023 09:59:54 -0700 (PDT)
Received: from localhost ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with UTF8SMTPSA id
 m9-20020a170906848900b00947a97a42f2sm6337870ejx.103.2023.04.11.09.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 09:59:53 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: sound: ep93xx: Add I2S description
Date: Tue, 11 Apr 2023 18:59:50 +0200
Message-Id: <20230411165951.2335899-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 533MGS676F77NAUKHGBHY63VD6EXBM7F
X-Message-ID-Hash: 533MGS676F77NAUKHGBHY63VD6EXBM7F
X-MailFrom: alexander.sverdlin@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Nikita Shubin <nikita.shubin@maquefel.me>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/533MGS676F77NAUKHGBHY63VD6EXBM7F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add device tree bindings for Cirrus Logic EP93xx internal SoCs' I2S
controller.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v3:
- rebased onto
 https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
v2:
 - Incorporated most of the suggestions from Krzysztof Kozlowski [1]
 - Dropped AC97 (deleted from the tree)

[1]. https://lore.kernel.org/lkml/46d5b6af-23e1-4178-83bc-b4a435b1426e@linaro.org/

 .../bindings/sound/cirrus,ep9301-i2s.yaml     | 66 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,ep9301-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/cirrus,ep9301-i2s.yaml b/Documentation/devicetree/bindings/sound/cirrus,ep9301-i2s.yaml
new file mode 100644
index 000000000000..453d493c941f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cirrus,ep9301-i2s.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cirrus,ep9301-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cirrus EP93xx I2S Controller
+
+description: |
+  The I2S controller is used to stream serial audio data between the external
+  I2S CODECs’, ADCs/DACs, and the ARM Core. The controller supports I2S, Left-
+  and Right-Justified DSP formats.
+
+maintainers:
+  - Alexander Sverdlin <alexander.sverdlin@gmail.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: cirrus,ep9301-i2s
+
+  '#sound-dai-cells':
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 3
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: mclk
+      - const: sclk
+      - const: lrclk
+
+required:
+  - compatible
+  - '#sound-dai-cells'
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    i2s: i2s@80820000 {
+        compatible = "cirrus,ep9301-i2s";
+        #sound-dai-cells = <0>;
+        reg = <0x80820000 0x100>;
+        interrupt-parent = <&vic1>;
+        interrupts = <28>;
+        clocks = <&syscon 29>,
+                 <&syscon 30>,
+                 <&syscon 31>;
+        clock-names = "mclk", "sclk", "lrclk";
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index e52938f962b5..b39ec6dbcdc9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2072,6 +2072,7 @@ M:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/cirrus,ep9301-adc.yaml
+F:	Documentation/devicetree/bindings/sound/cirrus,ep9301-*
 F:	arch/arm/boot/compressed/misc-ep93xx.h
 F:	arch/arm/mach-ep93xx/
 F:	drivers/iio/adc/ep93xx_adc.c
-- 
2.40.0

