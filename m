Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BB76FCB80
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 18:40:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85D2410B3;
	Tue,  9 May 2023 18:39:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85D2410B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683650413;
	bh=/u0Nz6LiDiUab5iFY5QOiKekVfZne8nZBgrQA6NGFmU=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EXhQ5BfOAnDExvSzPTXIYQAkktynQfM0sA3JeHzpXbNUv3aBdb/HvcnkANn7Nqj8L
	 0VIALAxJcl/nmx36BzTxjbHMawJEXug1FkKakZvCPOfX+o752Kan9WQz/c6tmQslbv
	 QJYZBgoirUhNG+lnic0r6t+VOMuHapy+Tt7lvcxs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 70102F8032D;
	Tue,  9 May 2023 18:39:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB862F804B1; Tue,  9 May 2023 18:39:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7ABAFF80087
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 18:39:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ABAFF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=cutebit.org header.i=@cutebit.org header.a=rsa-sha256
 header.s=mail header.b=nhq0S7wC
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1683650348; bh=ABTxy/stFVOVt1ZnRJ5L55xUikl5p+QPvUWPKUSFmjk=;
	h=From:To:Cc:Subject:Date;
	b=nhq0S7wCSrUJDK+cnhpl+JVIGu2eawlnCHn/smmgpzByShlV32rpleACMS0RKmBfV
	 Ts4/R/5dLoOUeNQA2j/4I295DWWYEyQF/6Y4zTGVYKYciu8dKj9ypXUNR0/+Z3U/A+
	 +gj+p/hOcv+IXy6xyDB29PpJ5drijU/wRkOaib2g=
To: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Subject: [PATCH 1/2] ASoC: dt-bindings: Add adi,ssm3515 amp schema
Date: Tue,  9 May 2023 18:38:27 +0200
Message-Id: <20230509163828.86003-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KQKGWNNL7SXHDJVCWAPWF3F4CKGNAUWV
X-Message-ID-Hash: KQKGWNNL7SXHDJVCWAPWF3F4CKGNAUWV
X-MailFrom: povik+lin@cutebit.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: asahi@lists.linux.dev, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KQKGWNNL7SXHDJVCWAPWF3F4CKGNAUWV/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a DT schema for the SSM3515 amp by Analog Devices. It's a simple
mono amplifier with digital input.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 .../bindings/sound/adi,ssm3515.yaml           | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/adi,ssm3515.yaml

diff --git a/Documentation/devicetree/bindings/sound/adi,ssm3515.yaml b/Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
new file mode 100644
index 000000000000..19b7185ae8e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2019-20 Texas Instruments Incorporated
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/sound/adi,ssm3515.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Analog Devices SSM3515 Audio Amplifier
+
+maintainers:
+  - Martin Povišer <povik+lin@cutebit.org>
+
+description: |
+  SSM3515 is a mono Class-D audio amplifier with digital input.
+
+  https://www.analog.com/media/en/technical-documentation/data-sheets/SSM3515.pdf
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - adi,ssm3515
+
+  reg:
+    maxItems: 1
+
+  adi,ana-gain:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+    description: |
+      The value to be set in the ANA_GAIN register field on the codec. This determines
+      the full voltage span of the codec's analog output.
+
+      To quote the datasheet on the available options:
+
+        00: 8.4 V Full-Scale Gain Mapping
+        01: 12.6 V Full-Scale Gain Mapping
+        10: 14 V Full-Scale Gain Mapping
+        11: 15 V Full-Scale Gain Mapping
+
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - adi,ana-gain
+
+additionalProperties: true
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      codec@14 {
+        compatible = "adi,ssm3515";
+        reg = <0x14>;
+        #sound-dai-cells = <0>;
+        adi,ana-gain = <0>;
+        sound-name-prefix = "Left Tweeter";
+      };
+    };
-- 
2.38.3

