Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB7F6A1484
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 02:09:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D76674C;
	Fri, 24 Feb 2023 02:08:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D76674C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677200985;
	bh=KE/0v749NOhj0oVLjbhpdEtVE51fA1OHQPFREe5UHso=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=LVpnhOWWAGcmzGvnU25quTRBSwVQ3DiBuRItbrxFpmUW+pe/wjdmUVzQbi4JD7ZNV
	 wO6WPsnLYgstkNvCw28DjE4XEqg6rhs9CDhUw+8ju/83Kc5alzd1wGLUsFQmoDGZRZ
	 M4eo0vv6ro1+W60nhFqdK37hq7qcuiuj4p6g2ycQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8864EF80125;
	Fri, 24 Feb 2023 02:08:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86411F80130; Fri, 24 Feb 2023 02:08:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22C69F800BA
	for <alsa-devel@alsa-project.org>; Fri, 24 Feb 2023 02:08:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22C69F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YyJtXr4d
Received: by mail-pj1-x102a.google.com with SMTP id x34so11464592pjj.0
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Feb 2023 17:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEGaxTrptF/i88hDG2ZZPDfmgm+Q0tSvkYEKB/u7k1M=;
        b=YyJtXr4dCPBimtyO0bOKFjj9lpU+V6GliYEV7tT3zN2u+sfwV4sTTMiDL2XR+o7l50
         B+pCrCrnMs2950ptW9F23gafbWVKjWxFhHfA3+HrN5+15ofJTKXD8oQGKnr70/fxFXty
         nvt6zzjPLifLD2ZKoNOjPoudRHzs6P6LWu55Tj8eUGKzgo9d1RkoOscD4v51jfITbo3I
         Y+dPA9ygtTSDnJFyHZMx8HgMPFMqRj5qfp1r6NopPa1grEsWVvsGMoHOkJskZ9vv22pb
         wh5MALsek/GFvAjNFMulQyXMMYRY3tq1/y0c+Pu5XxNDvK2ZKD9W5zC5USIKJ0zjjJWy
         tVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEGaxTrptF/i88hDG2ZZPDfmgm+Q0tSvkYEKB/u7k1M=;
        b=UWGcyvUozaOPhm/vY1sQta0cdKRc/TiKZI6atrRYIXBjjViozuqsz8tLfBRRMtieIA
         wlYGpYUnlh/+lsWkmCpW8ilpra2DNqP/TPy+fJtsNiLAv0rbqwzCuUV65gI1HymVZ7WB
         +mHNSlP2FxIlcP4QDA0qFS6TCE89e7PzwlogqxrnHwpNgGC8YikKU/5km4Yl077l8fiG
         AgAqkMZbEtNga9JCUHPFY8yBZCJUCvefnyqng5C7a2i+wRTBs7NQQlTRoGqzbUuv4Feb
         aVwNXOLHuirthC+MsvN8LhFPvIwOInpKdsMUTkjOIGZlC0hKXl0FvKxyaJmT7fEzNEco
         VTgw==
X-Gm-Message-State: AO0yUKVv9C6Dpk4ehVyE6msKWyzPFtqHXgt3LVeHDciw8aFXaA0pOf1l
	KOKGKxVSLcJcnQID/8vR56w=
X-Google-Smtp-Source: 
 AK7set9Br2M0tdazVDbZiCs0X3VbrL7as0h5R9J9TKRZGADBmXew7lvFqbL+fhZWHf0GFxrQlyz61Q==
X-Received: by 2002:a17:90b:224f:b0:236:9eef:e280 with SMTP id
 hk15-20020a17090b224f00b002369eefe280mr16311616pjb.46.1677200913497;
        Thu, 23 Feb 2023 17:08:33 -0800 (PST)
Received: from ryan-ThinkPad-T470.. (c-24-6-63-212.hsd1.ca.comcast.net.
 [24.6.63.212])
        by smtp.gmail.com with ESMTPSA id
 p5-20020a170902a40500b0019adfb96084sm3821008plq.36.2023.02.23.17.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 17:08:33 -0800 (PST)
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
Subject: [PATCH 2/2] ASoC: dt-bindings: max98363: add soundwire amplifier
 driver
Date: Thu, 23 Feb 2023 17:08:14 -0800
Message-Id: <20230224010814.504016-2-ryan.lee.analog@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230224010814.504016-1-ryan.lee.analog@gmail.com>
References: <20230224010814.504016-1-ryan.lee.analog@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P2JNTRZYRL3WXWRH2ITWXL5IULBRGMS4
X-Message-ID-Hash: P2JNTRZYRL3WXWRH2ITWXL5IULBRGMS4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P2JNTRZYRL3WXWRH2ITWXL5IULBRGMS4/>
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
 .../bindings/sound/adi,max98363.yaml          | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/adi,max98363.yaml

diff --git a/Documentation/devicetree/bindings/sound/adi,max98363.yaml b/Documentation/devicetree/bindings/sound/adi,max98363.yaml
new file mode 100644
index 000000000000..fda571d04a64
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/adi,max98363.yaml
@@ -0,0 +1,53 @@
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
+
+properties:
+  compatible:
+    enum:
+      - adi,max98363
+
+  reg:
+    maxItems: 1
+    description: Peripheral-device unique ID decoded from pin
+
+  vdd-supply:
+    description:
+      A 2.5V to 5.5V supply that powers up the VDD pin.
+
+  dvddio-supply:
+    description:
+      A 1.7V or 1.9V supply that powers up the DVDDIO pin.
+      This property is only needed for MAX98363A/B.
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+  - dvddio-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    soundwire {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        max98363: amplifier@3 {
+            compatible = "adi,max98363";
+            reg = <0x3>;
+            vdd-supply = <&regulator_vdd>;
+            dvddio-supply = <&regulator_1v8>;
+        };
+    };
-- 
2.34.1

