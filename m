Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1446B574C
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Mar 2023 02:15:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C66E21697;
	Sat, 11 Mar 2023 02:14:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C66E21697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678497329;
	bh=B7O5+W8fliA+Gj0MqMlcX7fhvGB0lqdwmODxtc2X5Sk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=beIb9BSx/vAlvW+QLesrjP6eJDSPu1MjVgRpajh8ZgZqdIwmeX5DR8ed0P+/ezBUb
	 moGlAXnuYIFG5BPpAn7NJZY6cMC0k5XXTGHlaD0dWmX83tPdBIGWUylmhTVkDsrL1S
	 p9VMuuy564KBCYxl3Z4f37CHs9hnd7hpT9R61a8w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11FDDF8042F;
	Sat, 11 Mar 2023 02:14:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4698F80431; Sat, 11 Mar 2023 02:14:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A60AAF8007E
	for <alsa-devel@alsa-project.org>; Sat, 11 Mar 2023 02:14:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A60AAF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=iLXJ+8i7
Received: by mail-pj1-x102b.google.com with SMTP id
 u3-20020a17090a450300b00239db6d7d47so6737801pjg.4
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 17:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678497265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rh7oDZ2wH8OxNXYeRmxDps+pFhJvkYtrO5SAgqEl724=;
        b=iLXJ+8i7ZJHN+1fIKRoEzbeDSCB6SFWr0rbtzFMRW63cEG8sjqOjReUSSOTyVbkrrh
         s/feFZkpMwQGwF/e3T1CxKOKtMwxKd/gdqPBO16gDrdGNMspugRV4e+InoZ+cypr2REg
         DATA+01g+kPwenAiWdZbb49TuDRopFh+AIIWqiHaOzrTsZniZ87xgh+LH7Bl031qCTSd
         7IjTvMq5d2Es9NGmjPp40ZAIy2bfJgMkX4JSXfajPhlTNEqPQyX4CPDhipaM0gzi/RDA
         Zd81epkX7Kg23H2MsYEJNVpAzYL67iJBOS/HiSpo82/CDp4BmpqBxuO0VLLymwyFuy3L
         IgOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678497265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rh7oDZ2wH8OxNXYeRmxDps+pFhJvkYtrO5SAgqEl724=;
        b=wM3muUPZyZtnfZGdriODkAhXkDQPWn5GFO2RgChsL8fTMHlaQSS5cB1DfPy6AaFDpo
         CGlux1jHQOgauH2mxo+zdHE9IMueWmqlsv4gNs84W0f9L3fe0xJ4r4n2b0LdSBxeiS3e
         pKM2/eJnFE1KlK+ZfSMgJuwpbPW72+Y/LMV5BU9O2Nah+17aTcy5vElA9KRqJ/1yjG8T
         uUuIny2B1FusAvJ3gvBUUOMYVKmlfv1H8duNWbRMum4aa6ErotCI6VLX7Y7LHL9Z6XjU
         BTF0hm3Bh+/DlQYmZBYyWjWklDnw598QufaroTdXCgM09yB1k67mEhK1MHi3z64192EM
         v5rg==
X-Gm-Message-State: AO0yUKWtrdZk6X/9dKezYxN6PMN+qrAoNDfLZrdpGocWQuG3s7f7oBZR
	4CKseLBotJMjGKm3ZofQeuo=
X-Google-Smtp-Source: 
 AK7set+9UTvGbB9wlgUIPHEmDL2PHFkebYxlGCjJD3HnunYUU257fn+NuaCmmdq9Dzvnt4hGugeLkg==
X-Received: by 2002:a17:90a:ae83:b0:237:ae98:a484 with SMTP id
 u3-20020a17090aae8300b00237ae98a484mr4150329pjq.7.1678497264677;
        Fri, 10 Mar 2023 17:14:24 -0800 (PST)
Received: from ryan-ThinkPad-T470.. (c-24-6-63-212.hsd1.ca.comcast.net.
 [24.6.63.212])
        by smtp.gmail.com with ESMTPSA id
 r20-20020a17090b051400b002376d85844dsm475323pjz.51.2023.03.10.17.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 17:14:24 -0800 (PST)
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
Subject: [PATCH V2 2/2] ASoC: dt-bindings: max98363: add soundwire amplifier
Date: Fri, 10 Mar 2023 17:14:09 -0800
Message-Id: <20230311011409.210014-2-ryan.lee.analog@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311011409.210014-1-ryan.lee.analog@gmail.com>
References: <20230311011409.210014-1-ryan.lee.analog@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QYSJPGPEPPVSESJMXQZURFDXCYQFM7HP
X-Message-ID-Hash: QYSJPGPEPPVSESJMXQZURFDXCYQFM7HP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QYSJPGPEPPVSESJMXQZURFDXCYQFM7HP/>
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

 .../bindings/sound/adi,max98363.yaml          | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/adi,max98363.yaml

diff --git a/Documentation/devicetree/bindings/sound/adi,max98363.yaml b/Documentation/devicetree/bindings/sound/adi,max98363.yaml
new file mode 100644
index 000000000000..0e71b6c84007
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/adi,max98363.yaml
@@ -0,0 +1,42 @@
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
+properties:
+  compatible:
+    enum:
+      - adi,max98363
+  reg:
+    maxItems: 1
+    description: Peripheral-device unique ID decoded from pin.
+
+required:
+  - compatible
+  - reg
+additionalProperties: false
+
+examples:
+  - |
+    soundwire {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        amplifier@3 {
+            compatible = "adi,max98363";
+            reg = <0x3>;
+        };
+    };
-- 
2.34.1

