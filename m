Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A45E6C4C4A
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 14:49:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30F05E98;
	Wed, 22 Mar 2023 14:48:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30F05E98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679492963;
	bh=25MDoLsMni7fbrMo2alHq/fTHD8UphBa8SVjJ84SMiA=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=LEkviSRfpHEQqVGkTbOpHejh+JBVg1GPaqt4DwfubWLMXts7QRpKHFyFqGIunKZNl
	 VcVHH7DBbo170DSHoidHCWJWYqVCmzPgjDfdwZRMW8RyDyN5e5XJK3d6Z5+DI54h92
	 FbSd9erbBw1Uv3Wl474VbyrBURPZPtyBFiKt5/Vg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56399F8027B;
	Wed, 22 Mar 2023 14:47:42 +0100 (CET)
To: Herve Codina <herve.codina@bootlin.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 4/6] dt-bindings: sound: Add support for the Lantiq PEF2256
 codec
Date: Wed, 22 Mar 2023 14:46:52 +0100
In-Reply-To: <20230322134654.219957-1-herve.codina@bootlin.com>
References: <20230322134654.219957-1-herve.codina@bootlin.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IN6QDPQMZ26ASRP76FJLECQ7YVOKKUYI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167949286083.26.8528969630107665422@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E8F6F80542; Wed, 22 Mar 2023 14:47:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42FD9F8024E
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 14:47:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42FD9F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=d25XadhU
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 4382320002;
	Wed, 22 Mar 2023 13:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679492838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VwfPEx0id9lkmTqeXmonqzG+ttziM1BKTuoeNAq8HFk=;
	b=d25XadhUqVTiT72yzMYftJfPojyWVTfngWDWXxlGdooZE7tDw9U5Z5lOYQbBC81ozu5e3P
	SRd+WBLyUOnCJAkDxSFl2Sk2DN22HLAgpKuVgk3slglRc7NmFrvYEJwJYk8/KGLxVZ+aq/
	2wH7khKxLSRU4AFiGNdenKJUqt21VrRrrHtLCgfeLhkCPs2YZq5NQUVmey0T7sDphGo+Ud
	iHjkz/plns1h0tYaeakO6tCUeYSUEto9yBoS90askUVzVKjmJRLKtAXAR2ox5PZrHOkhBW
	ql7/3H4FNk3nJ3GIzSFQ6pIGtMrU19Ypfo31ocBkaegHpXDmtUuaqLNmW0nugA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 4/6] dt-bindings: sound: Add support for the Lantiq PEF2256
 codec
Date: Wed, 22 Mar 2023 14:46:52 +0100
Message-Id: <20230322134654.219957-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322134654.219957-1-herve.codina@bootlin.com>
References: <20230322134654.219957-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IN6QDPQMZ26ASRP76FJLECQ7YVOKKUYI
X-Message-ID-Hash: IN6QDPQMZ26ASRP76FJLECQ7YVOKKUYI
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IN6QDPQMZ26ASRP76FJLECQ7YVOKKUYI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Lantiq PEF2256 is a framer and line interface component designed to
fulfill all required interfacing between an analog E1/T1/J1 line and the
digital PCM system highway/H.100 bus.

The codec support allows to use some of the PCM system highway
time-slots as audio channels to transport audio data over the E1/T1/J1
lines.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../bindings/sound/lantiq,pef2256-codec.yaml  | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml

diff --git a/Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml b/Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml
new file mode 100644
index 000000000000..da35b70cda99
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/lantiq,pef2256-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lantiq PEF2256 codec
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+description: |
+  Codec support for PEF2256.
+
+  The Lantiq PEF2256, also known as Infineon PEF2256 or FALC56, is a framer and
+  line interface component designed to fulfill all required interfacing between
+  an analog E1/T1/J1 line and the digital PCM system highway/H.100 bus.
+
+  The codec support allows to use some of the PCM system highway time-slots as
+  audio channels to transport audio data over the E1/T1/J1 lines.
+
+  The time-slots used by the codec must be set and so, the properties
+  'dai-tdm-slot-num', 'dai-tdm-slot-width', 'dai-tdm-slot-tx-mask' and
+  'dai-tdm-slot-rx-mask' must be present in the ALSA sound card node for
+  sub-nodes that involve the codec. The codec uses 8bit time-slots.
+  'dai-tdm-tdm-slot-with' must be set to 8.
+  The tx and rx masks define the PEF2256 time-slots assigned to the codec.
+
+  The PEF2256 codec node should be a child of a PEF2256 node.
+  Refer to the bindings described in
+  Documentation/devicetree/bindings/mfd/lantiq,pef2256.yaml
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: lantiq,pef2256-codec
+
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - '#sound-dai-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    codec {
+        compatible = "lantiq,pef2256-codec";
+        #sound-dai-cells = <0>;
+    };
-- 
2.39.2

