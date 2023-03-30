Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A929A6D1383
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 01:45:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EF341FE;
	Fri, 31 Mar 2023 01:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EF341FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680219935;
	bh=mFeDTUSsaKxwjLyU88OX5t07nCZXauC1Z24y3BNEVdE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=VzROfJk3qezQo2QfPGCRNfgjC2X1NBLo/9YmPQ2gyu6VAGSuzGwgDDSJtSLfHCoQ4
	 Dmq4FmLJUUZdNryHAuClx2IKCqIWn8XR9QYR5R8P0i9ovnKjEHVI9cgO1m7md+PcVi
	 rK2Ufl3a3HmNLjuDJ0MQ0aY6mE9jgRGZl1k2oe6s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99902F80423;
	Fri, 31 Mar 2023 01:43:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CD4CF80272; Fri, 31 Mar 2023 01:43:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01D97F800C9
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 01:43:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01D97F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=cp61TQFD
Received: by mail-pl1-x634.google.com with SMTP id o11so19686844ple.1
        for <alsa-devel@alsa-project.org>;
 Thu, 30 Mar 2023 16:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680219812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8NTXaHHO//3z+k+mNK1rkd5Zzs1cpAqfGCFxh55cRSg=;
        b=cp61TQFDfM8o339UtrnDmOFRlj1BU5ivIShulD1ygi1J5PnpYJXTAKVn8hN9LejGVW
         Ng7kmSq/bYlQPWmI1QEdbxdC5EDWye0iplCY3O9vbBJsOQwZagdUuHlwjqnV/1VrZARx
         T8O2yQKlWXJY/Kwocv2EqBMqzZr0DZZoGRgzEZKP+nksqXiVWfgal3cGfC7DoIikBxgR
         RNwzcTe6vYmbYZne8oQqDhiorPu9///1JFlwxwLJ9WDs+nPDLlPtRf+tDbztY+STkrRZ
         Cu3ncFqZlV6bigun6CI5/4+VP19ThctqU3wCM8ikjrXkP7cUgvfmIjbHfIBlZKkGzYM0
         isqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680219812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8NTXaHHO//3z+k+mNK1rkd5Zzs1cpAqfGCFxh55cRSg=;
        b=4x323kfAbaOB9iYXPUCpcEmEqDcgZBjs4fIgYYx7Ucd1MlJPAnJwaDyPKnOrt4fT97
         fvmIsxcRh7sjA/q2ZVWw1CxQJQANruF7xsPhxxKA23sGm1l0K0Oge2zUhY5cQfYrTyol
         FzQv9ZDWZYY1F05RfLRnzgc5NBiOvNofQwZb2I5tP7Z5gXLqHJZ9b+emr/+F3/w2DRg1
         lpFAfUw/yWAMpUHYBvOiimMQWcYB7scfR+FlFFG2Ck1Wev/3z+Y2yIP0bGtg+28XDcCY
         vSraWvepUyJa8cJhgxtdZ4X5caHGuQh1Y1S1rgGCXA1L5Kcu2CEuN21COLWC1ScmoU3q
         SPfw==
X-Gm-Message-State: AAQBX9dB6AasX/q9z3n7Re2Qi0L8CzZRXxfigqU0/HqdKes+LcrdPD2K
	hxEwnx7EWuUD4wEni1RUo/U=
X-Google-Smtp-Source: 
 AKy350bifEk1k722eISf1aA5Ur1irJAuMPL6ctlCNHdxG7TafXssIwk7Fqlxd3SbBqJzN+lYuoGzfg==
X-Received: by 2002:a17:903:1d1:b0:1a1:ad5e:bdbb with SMTP id
 e17-20020a17090301d100b001a1ad5ebdbbmr32329670plh.36.1680219811790;
        Thu, 30 Mar 2023 16:43:31 -0700 (PDT)
Received: from ryan-ThinkPad-T470.. (c-24-6-63-212.hsd1.ca.comcast.net.
 [24.6.63.212])
        by smtp.gmail.com with ESMTPSA id
 k2-20020a170902e90200b001a19cf1b37esm282733pld.40.2023.03.30.16.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 16:43:31 -0700 (PDT)
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
Subject: [PATCH V4 2/2] ASoC: dt-bindings: max98363: add soundwire amplifier
Date: Thu, 30 Mar 2023 16:43:19 -0700
Message-Id: <20230330234319.6841-2-ryan.lee.analog@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230330234319.6841-1-ryan.lee.analog@gmail.com>
References: <20230330234319.6841-1-ryan.lee.analog@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Q6G5DTHHKEXG5GD4ZHXO7WEPIXJJ6LGQ
X-Message-ID-Hash: Q6G5DTHHKEXG5GD4ZHXO7WEPIXJJ6LGQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q6G5DTHHKEXG5GD4ZHXO7WEPIXJJ6LGQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ryan Lee <ryans.lee@analog.com>

Add dt-bindings information for Analog Devices MAX98363 SoundWire Amplifier

Signed-off-by: Ryan Lee <ryans.lee@analog.com>
---
Changes from v1:
  Fixed a syntax error for the 'dt_binding_check' build.
  Removed unnecessary properties.
  Added description about SoundWire device ID of MAX98363
Changes from v2:
  Removed the legacy from i2c/i2s driver and added SoundWire device ID info.
  Added missing information about DAI.
Changes from v3:
  Modified the commit message. Removed "This patch"
  Converted uppercase hex to lowercase hex
  Dropped 'sound-name-prefix'.
  Added unevaluatedProperties instead of additionalProperties

 .../bindings/sound/adi,max98363.yaml          | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/adi,max98363.yaml

diff --git a/Documentation/devicetree/bindings/sound/adi,max98363.yaml b/Documentation/devicetree/bindings/sound/adi,max98363.yaml
new file mode 100644
index 000000000000..a844b63f3930
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/adi,max98363.yaml
@@ -0,0 +1,60 @@
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
+  SoundWire peripheral device ID of MAX98363 is 0x3*019f836300
+  where * is the peripheral device unique ID decoded from pin.
+  It supports up to 10 peripheral devices(0x0 to 0x9).
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: sdw3019f836300
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    soundwire-controller@3250000 {
+        #address-cells = <2>;
+        #size-cells = <0>;
+        reg = <0x3250000 0x2000>;
+
+        speaker@0,0 {
+            compatible = "sdw3019f836300";
+            reg = <0 0>;
+            #sound-dai-cells = <0>;
+            sound-name-prefix = "Speaker Left";
+        };
+
+        speaker@0,1 {
+            compatible = "sdw3019f836300";
+            reg = <0 1>;
+            #sound-dai-cells = <0>;
+            sound-name-prefix = "Speaker Right";
+        };
+    };
-- 
2.34.1

