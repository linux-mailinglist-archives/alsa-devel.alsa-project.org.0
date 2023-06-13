Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4330772D9B2
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 08:10:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B67A6826;
	Tue, 13 Jun 2023 08:10:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B67A6826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686636656;
	bh=y39bjUj4SwqyeG7qQIEUcMxtq0G1RxTV6zoRVMkATkU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fuFvSU8DSCqawTrxwEAOQdRfiPZ4pAIBZrvIch3I3NhQBdXtg4OyPfPyM4BGMP+Ti
	 vF8AvhJU1wRCuvzSTnK5Jfar4bLxlpzTGndn2OBsHFmVNlnwyFfCz1n1UVqsrRdDhk
	 IGVVvR5/F48mUaFLTY3JmGzTJESYXaW2XBUYQy3g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CC60F80533; Tue, 13 Jun 2023 08:10:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 180E5F80155;
	Tue, 13 Jun 2023 08:10:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94CD3F80155; Tue, 13 Jun 2023 08:10:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84CDDF800ED
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 08:09:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84CDDF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=nE3DWJTG
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6b29b9f5a94so3241568a34.2
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Jun 2023 23:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686636594; x=1689228594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qfxDffF4oNGyONCr8odOKoLiVtDni1HDTuQoeb5CKkQ=;
        b=nE3DWJTG1S8ILTVBQZA4FulsRGkRjuh11xmjDFgLfoeU3GEweKE/gkze/JXQEVpk9I
         XcJLGi0RGkGvFAR2WaXVg8qDHD+UHbHIvIzOIqCK80liNco8SkmDXcOLlrS7FE7lLMJf
         lwEYjWiM9Am0rWckiGV75z6OnQutWKUNiXPim9WUEUNhxIJLsT4XPUvTiGzP3+eWTL/+
         gV2Pg5AKhejEwCr8dTNoM6eS7m2rFFv6/JUs8MzrLcoFsaAF8eiombyxAkg/I99g/lx1
         K8wtgE6Sx8MBnUGiH0CVWJeN8CTOylpLQxA9GnqF1f0DC3zg/bgamlXCi7CIvvJec1f/
         RuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686636594; x=1689228594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qfxDffF4oNGyONCr8odOKoLiVtDni1HDTuQoeb5CKkQ=;
        b=EtMvcdxD6CpJvyDNSB1ilUmKIhQ0w+ALIsvMikpx3ThOcMeC8dsHY7rYuqp//TFPHV
         kWr1EclPBTho+6vI/aSK9TAmpV1Nh1SaAc5UOo4cvnZGSfmdZkwUUyWGUjgW6hBrsC8e
         TCfcvDDN2e9J6EEWdH3AHQsR2Sgbiorjdc88LNyll3V2btTYEt2R9MzD0gdZqnM2oRBd
         ysKtWbgICF0l3y4FTA5P65oP91NIsHlonnMNh4wnVkWshQqUNd/3aSM9idgUbhSE8pNx
         W108eNXIOzbqKajpx31rsu3K7phudFJRryws3L3oYGPFbJmpUR4sbb6JgUxzT69zZhDe
         Cmfw==
X-Gm-Message-State: AC+VfDzrIMSmqTzGsFQBo/jvmfMwLwQYneCtopYPRLYceSa3sgsLFZRU
	AMd2Olcx/FUH4vLVZ6MHPxY=
X-Google-Smtp-Source: 
 ACHHUZ6YSgQn2bvL4KlRa71K1UtlgfkoGdUXnp2n8S1QyTy7AbJT22tja7f24hm3x7iAgfzub3tbOw==
X-Received: by 2002:a05:6830:1d6d:b0:6b3:477c:c725 with SMTP id
 l13-20020a0568301d6d00b006b3477cc725mr1662298oti.12.1686636594085;
        Mon, 12 Jun 2023 23:09:54 -0700 (PDT)
Received: from ryan-ThinkPad-T470.. (c-24-6-63-212.hsd1.ca.comcast.net.
 [24.6.63.212])
        by smtp.gmail.com with ESMTPSA id
 z17-20020a631911000000b00548fb73874asm7009529pgl.37.2023.06.12.23.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 23:09:53 -0700 (PDT)
From: =?UTF-8?q?=E2=80=9CRyan?= <ryan.lee.analog@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.com,
	shumingf@realtek.com,
	povik+lin@cutebit.org,
	herve.codina@bootlin.com,
	ryans.lee@analog.com,
	wangweidong.a@awinic.com,
	ckeepax@opensource.cirrus.com,
	ajye_huang@compal.corp-partner.google.com,
	sebastian.reichel@collabora.com,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: venkataprasad.potturu@amd.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V3 1/2] ASoC: dt-bindings: max98388: add amplifier driver
Date: Mon, 12 Jun 2023 23:09:44 -0700
Message-Id: <20230613060945.183128-1-ryan.lee.analog@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: W5RFE5G6O4FDLFMJUJ27NTSDULYJKG2I
X-Message-ID-Hash: W5RFE5G6O4FDLFMJUJ27NTSDULYJKG2I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W5RFE5G6O4FDLFMJUJ27NTSDULYJKG2I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ryan Lee <ryans.lee@analog.com>

Add dt-bindings information for Analog Devices MAX98388 I2S Amplifier

Signed-off-by: Ryan Lee <ryans.lee@analog.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes from v1:
  Removed unnecessary blank line and description. Modified quotes.

Changes from v2:
  No change.  

 .../bindings/sound/adi,max98388.yaml          | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/adi,max98388.yaml

diff --git a/Documentation/devicetree/bindings/sound/adi,max98388.yaml b/Documentation/devicetree/bindings/sound/adi,max98388.yaml
new file mode 100644
index 000000000000..93ccd5905736
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/adi,max98388.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/adi,max98388.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices MAX98388 Speaker Amplifier
+
+maintainers:
+  - Ryan Lee <ryans.lee@analog.com>
+
+description:
+  The MAX98388 is a mono Class-D speaker amplifier with I/V feedback.
+  The device provides a PCM interface for audio data and a standard
+  I2C interface for control data communication.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - adi,max98388
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+  adi,vmon-slot-no:
+    description: slot number of the voltage feedback monitor
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    default: 0
+
+  adi,imon-slot-no:
+    description: slot number of the current feedback monitor
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+    default: 1
+
+  adi,interleave-mode:
+    description:
+      For cases where a single combined channel for the I/V feedback data
+      is not sufficient, the device can also be configured to share
+      a single data output channel on alternating frames.
+      In this configuration, the current and voltage data will be frame
+      interleaved on a single output channel.
+    type: boolean
+
+  reset-gpios:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - '#sound-dai-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        max98388: amplifier@39 {
+            compatible = "adi,max98388";
+            reg = <0x39>;
+            #sound-dai-cells = <0>;
+            adi,vmon-slot-no = <0>;
+            adi,imon-slot-no = <1>;
+            adi,interleave-mode;
+            reset-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
+        };
+    };

base-commit: 53ab6975c12d1ad86c599a8927e8c698b144d669
-- 
2.34.1

