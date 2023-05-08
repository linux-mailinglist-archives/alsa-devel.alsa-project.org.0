Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EE76FD70A
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 08:32:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE7591067;
	Wed, 10 May 2023 08:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE7591067
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683700363;
	bh=FwbLxo5MbL87Z+TU5KDbhpd9RTa2B/77ghBu36ZoG6g=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=KX4JI5TK+xwRdIsUn2W/xBAefGj8PTtTLVixo9WTdSvgzIz84NSGkd3juZm0xYXHr
	 B2ePiwfWldsrG5vEiyB1aIOx/KBEtSacpWFvQC/6ROO2xSnhScPy6icECHaSeLurp6
	 kJkdU1fnd0Gi45QG84S7mQrhVrl6BJCjVH/Y8gtg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD7C6F8053B;
	Wed, 10 May 2023 08:30:59 +0200 (CEST)
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 3/7] ASoC: dt-bindings: Add Google Chameleon v3 i2s device
Date: Mon,  8 May 2023 13:30:33 +0200
In-Reply-To: <20230508113037.137627-1-pan@semihalf.com>
References: <20230508113037.137627-1-pan@semihalf.com>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Wed, 10 May 2023 06:30:55 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DATSKYVMK56JSXN37GQYBCLMUVJQWE7L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168370025888.26.7471125901389928303@mailman-core.alsa-project.org>
From: =?utf-8?q?Pawe=C5=82_Anikiel_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>
Reply-To: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Cc: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, amstan@chromium.org,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A3EAF8053B; Mon,  8 May 2023 13:31:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8ACCEF8032D
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 13:30:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ACCEF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=qUCA3KSp
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f00d41df22so28208183e87.1
        for <alsa-devel@alsa-project.org>;
 Mon, 08 May 2023 04:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1683545458; x=1686137458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCcpa8mh8EUPdc5cCKwnMcMZnzZb8Ven1VF00UODHfU=;
        b=qUCA3KSpK0KLofEQAl1J4VbNkFSBblrbel7Qyuby6GRPvaAdm4jfsLW4bnPm6lbW1e
         qcx4KopofnzhxwdlRp5SgOvrsC8bSrQikYwDCe8CB0VzaaV29H3evCR07OyELOjjd9hv
         4ABDXIq9k+NnJkSnIvGCTxqEkC3J2ijAsap0a326g4cBJErQiTFHDh1HyeEJrrF0aQyV
         so4WxN+vdwxfLVQ0zsQ/oAPw6hl8Xp6RSbAhruzbWScKKnzz8m7iuYWDzcUiK2HoQxYM
         dfPCaLnF77CwiboVDj2zI3wlkFslCIvwTwL3Z9dta+vjQS4I0jKVO0i/fTAS+KT0Ztz0
         GLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683545458; x=1686137458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCcpa8mh8EUPdc5cCKwnMcMZnzZb8Ven1VF00UODHfU=;
        b=cLu4DTMa24VPCEZxaTBykrynWJ+D9eTY/xZt7k5fCOrrjr7OVVtVPP1jpyOWi1kvoZ
         d4wf+PJxIqIiE51lpckULUi3MxTWvKHlaZ2zUpgLUxSihs2eHu/6PI/uw0aynWDcRxW+
         w++V1LGiL46kDnNFkwhtGlopYU4+zzjb+gVTv+U+fq/yb1LH7JOFhWJ9CBolYiRWmA+a
         KWITmpH3ZugklhdUvGw8nsSZaglL23qvrf9CYo+k47/pkI+xlzQL5SiSWSdUXo5az7oJ
         mNn72v0K4WPg5H9YE2DlrGSpTd1MHWFfnkqANq137YYwpsxBIYHrFPL/3u5zmNRyW80i
         heqw==
X-Gm-Message-State: AC+VfDy/eo2XuQrOvTvAtLuQBxD/BKQBi7GPJYIJOJDtHMGmxeBFN+YK
	dAecjB+r+/RGwRjgyOGBf0EzPHoa2IO2IZAdkMw=
X-Google-Smtp-Source: 
 ACHHUZ4EEcaGcUaK7vu//980DZoWeqhAaPt+zAj10ov/qO3SBtQsFVya9VsjeLlvmcsuL40m+iZZXQ==
X-Received: by 2002:a2e:b5d4:0:b0:2a9:45fb:6331 with SMTP id
 g20-20020a2eb5d4000000b002a945fb6331mr2698032ljn.6.1683545457872;
        Mon, 08 May 2023 04:30:57 -0700 (PDT)
Received: from panikiel.office.semihalf.net ([83.142.187.84])
        by smtp.gmail.com with ESMTPSA id
 k8-20020a2e2408000000b002a8b9353338sm1144406ljk.117.2023.05.08.04.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:30:57 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 3/7] ASoC: dt-bindings: Add Google Chameleon v3 i2s device
Date: Mon,  8 May 2023 13:30:33 +0200
Message-ID: <20230508113037.137627-4-pan@semihalf.com>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
In-Reply-To: <20230508113037.137627-1-pan@semihalf.com>
References: <20230508113037.137627-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: pan@semihalf.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DATSKYVMK56JSXN37GQYBCLMUVJQWE7L
X-Message-ID-Hash: DATSKYVMK56JSXN37GQYBCLMUVJQWE7L
X-Mailman-Approved-At: Wed, 10 May 2023 06:30:55 +0000
CC: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, amstan@chromium.org,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DATSKYVMK56JSXN37GQYBCLMUVJQWE7L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add binding for google,chv3-i2s device.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 .../bindings/sound/google,chv3-i2s.yaml       | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml b/Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml
new file mode 100644
index 000000000000..3ce910f44d39
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/google,chv3-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Chameleon v3 I2S device
+
+maintainers:
+  - Paweł Anikiel <pan@semihalf.com>
+
+description: |
+  I2S device for the Google Chameleon v3. The device handles both RX
+  and TX using a producer/consumer ring buffer design.
+
+properties:
+  compatible:
+    const: google,chv3-i2s
+
+  reg:
+    items:
+      - description: core registers
+      - description: irq registers
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i2s@c0060300 {
+        compatible = "google,chv3-i2s";
+        reg = <0xc0060300 0x100>,
+              <0xc0060f00 0x10>;
+        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.40.1.521.gf1e218fcd8-goog

