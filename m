Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEC56C6FBB
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 18:54:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D1A5ED0;
	Thu, 23 Mar 2023 18:53:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D1A5ED0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679594050;
	bh=IHf8bYuMbBrnQz1WQ5fZkgiHtkTPtj41LjUsiFQ97TY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=B277qEVpGfOzOOpcUN94vN/i7l7h77P0pRPrBkl8SVhTUx9Ho1xyBv6gLnJELtTs+
	 yQDvvlMm7kPJOAkWRvKtAuK3F1e/Zp5fOTOpXwolzmqTTGBz8e+AIcYJqEqKh9yWx2
	 Z5p5Cf0BvmtX7Cen1GO0DD7jNIf+U1Oyr7s9/vOo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2069F804B1;
	Thu, 23 Mar 2023 18:53:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35A74F804FE; Thu, 23 Mar 2023 18:53:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04445F80093
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 18:53:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04445F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=L+NEcWGj
Received: by mail-pg1-x52d.google.com with SMTP id s19so7723129pgi.0
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Mar 2023 10:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679593983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UNlU/dImMAR9PDxxI0s95TJ5dyS1Y5Lepeba170fA/o=;
        b=L+NEcWGjZ/go6ert+EXlAxDJQnO06RSthhAMwsWd7rmvImymaL+4KN8NFxdrw8GLob
         HHE9dKnnd8BKaQ0JZaAVkh7U0vAyOT9U0x8S0MSShwIbt6PJOimRhT2Dj98tbIOECiGl
         5ZHFJJGF63W4PAzFhHvPr0e5soCYrCdWi6fx0GUuGvoe9zYMbRycvd+tk/NBnBPWPCh6
         F7+zi3O5+ooxvsNQsXKlVI0Jm1w56HdPpk6qy6OdpLWEbdoeaphDQLSBK/dslMNSpmBe
         +db93Fi9h7bq5eBCpiD3ngTAwAOkkh/KEb0R6TtJM+yrdMcwN2GlHv0ufT8vuDnDeXDU
         pXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679593983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNlU/dImMAR9PDxxI0s95TJ5dyS1Y5Lepeba170fA/o=;
        b=oqCeJCOztGax9JaxOIAsdEL+7257STsAzAUyoh1gVZt970bDlfAln8u1UE6w7++OQw
         r21bbKRXI81A8++jNZwxhUFPXUiNyD3HGAq3PuIan3ty/5AUaHEsYGO3Qrz3kpY9Xuli
         XcjvW5jeA8ZeAY5pHOykiatGeAXein18g0qjt4aboVKlMlnK/sQo4ZJbtjQVQTgDLo0S
         vNlG49u5lih9EBUH+QWr/OabM6LGA1wwnkUF0/8tN4rRyTyUPx2SCsiBBwQ+1v44hEcb
         yPvuI0M1Oz4xp3Lf6B49+hGkO8urW1lezYpPEsY7nGkClQFCsG/5TRwrHm0f/JtBUzvL
         ohZw==
X-Gm-Message-State: AO0yUKXianP0UA32KDjTwz7u0F3Npw1TipVYDMPo79FxSs5E1DEvdByr
	kukFJ+hWKCmQRpfEmDFxVlY=
X-Google-Smtp-Source: 
 AK7set9IWYkq8vOqWDrw2argZnBJ+KtjvpJcDPy+i5/sNZPDv/rFGbOe/tskaGFQHckkuiBG3yNsmw==
X-Received: by 2002:aa7:9e04:0:b0:625:500c:35bd with SMTP id
 y4-20020aa79e04000000b00625500c35bdmr6854610pfq.6.1679593983704;
        Thu, 23 Mar 2023 10:53:03 -0700 (PDT)
Received: from ryan-ThinkPad-T470.. (c-24-6-63-212.hsd1.ca.comcast.net.
 [24.6.63.212])
        by smtp.gmail.com with ESMTPSA id
 k17-20020a63d111000000b004fbb4a55b64sm11761040pgg.86.2023.03.23.10.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 10:53:03 -0700 (PDT)
From: =?UTF-8?q?=E2=80=9CRyan?= <ryan.lee.analog@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	rf@opensource.cirrus.com,
	ckeepax@opensource.cirrus.com,
	pierre-louis.bossart@linux.intel.com,
	herve.codina@bootlin.com,
	wangweidong.a@awinic.com,
	james.schulman@cirrus.com,
	ajye_huang@compal.corp-partner.google.com,
	shumingf@realtek.com,
	povik+lin@cutebit.org,
	flatmax@flatmax.com,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	ryans.lee@analog.com
Subject: [PATCH V3 2/2] ASoC: dt-bindings: max98363: add soundwire amplifier
Date: Thu, 23 Mar 2023 10:52:56 -0700
Message-Id: <20230323175256.2606939-2-ryan.lee.analog@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230323175256.2606939-1-ryan.lee.analog@gmail.com>
References: <20230323175256.2606939-1-ryan.lee.analog@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CNXCSGQN3QT57CUEBV4PWLDQAROTF3O4
X-Message-ID-Hash: CNXCSGQN3QT57CUEBV4PWLDQAROTF3O4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CNXCSGQN3QT57CUEBV4PWLDQAROTF3O4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ryan Lee <ryans.lee@analog.com>

This patch adds dt-bindings information for Analog Devices MAX98363
SoundWire Amplifier.

Signed-off-by: Ryan Lee <ryans.lee@analog.com>
---
Changes from v1:
  Fixed a syntax error for the 'dt_binding_check' build.
  Removed unnecessary properties.
  Added description about SoundWire device ID of MAX98363
Changes from v2:
  Removed the legacy from i2c/i2s driver and added SoundWire device ID info.
  Added missing information about DAI.

 .../bindings/sound/adi,max98363.yaml          | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/adi,max98363.yaml

diff --git a/Documentation/devicetree/bindings/sound/adi,max98363.yaml b/Documentation/devicetree/bindings/sound/adi,max98363.yaml
new file mode 100644
index 000000000000..92352a23e1cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/adi,max98363.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/adi,max98363.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices MAX98363 SoundWire Amplifier
+
+maintainers:
+  - Ryan Lee <ryans.lee@analog.com>
+
+description:
+  The MAX98363 is a SoundWire input Class D mono amplifier that
+  supports MIPI SoundWire v1.2-compatible digital interface for
+  audio and control data.
+  SoundWire peripheral device ID of MAX98363 is 0x3X019F836300
+  where X is the peripheral device unique ID decoded from pin.
+  It supports up to 10 peripheral devices(0x0 to 0x9).
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: sdw3019F836300
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+  sound-name-prefix: true
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    soundwire-controller@3250000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        reg = <0x3250000 0x2000>;
+
+        speaker@0,0 {
+            compatible = "sdw3019F836300";
+            reg = <0 0>;
+            #sound-dai-cells = <0>;
+            sound-name-prefix = "Speaker Left";
+        };
+
+        speaker@0,1 {
+            compatible = "sdw3019F836300";
+            reg = <0 1>;
+            #sound-dai-cells = <0>;
+            sound-name-prefix = "Speaker Right";
+        };
+    };
-- 
2.34.1

