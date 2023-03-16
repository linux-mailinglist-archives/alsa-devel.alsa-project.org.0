Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5594D6BCF80
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 13:30:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87BA8114C;
	Thu, 16 Mar 2023 13:29:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87BA8114C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678969842;
	bh=mFp5GmtDkCba1h9r/+chBCrVq1/usfJfwkUHZO4I8xs=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=ucoWrvwn+yZ5RFA47Z4fDmOYzZiFZIhEoCxOy+Ijgr5ckjY9kex1adDHjvi/3OTbs
	 uOqp8jgP0bDfZQmqdr2cCpf6zKEYaipFozytW24mCnQ2bkHQidCFDIyeQ5FZ6hiN7f
	 tujQ2WyexDHn23yMiXSAgjz5uuftxd7pT9TEArV8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51FA8F8055C;
	Thu, 16 Mar 2023 13:28:24 +0100 (CET)
To: Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Derek Kiernan <derek.kiernan@xilinx.com>,
	Dragan Cvetic <dragan.cvetic@xilinx.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 5/7] dt-bindings: sound: Add support for the Lantiq PEF2256
 codec
Date: Thu, 16 Mar 2023 13:27:39 +0100
In-Reply-To: <20230316122741.577663-1-herve.codina@bootlin.com>
References: <20230316122741.577663-1-herve.codina@bootlin.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SLTJQDP2FM5N2BBK4M4KQKLSBPWGAPL2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167896970372.26.6524664644002247738@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE11FF80558; Thu, 16 Mar 2023 13:28:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72C61F80425
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 13:28:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72C61F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Nbi7TrkL
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 99B131BF213;
	Thu, 16 Mar 2023 12:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678969684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nSK6QmzgFgboixiIAQGzqWb/rCb1DitwrXgQXi+UVkQ=;
	b=Nbi7TrkLkYJVMDTy7OyTKmYnRLxHrnx4sCdvuefGXrQkz7tjz9ZGk1Yiv4POn8l8J2Z4PL
	KsmdLKcxC64YiJKkbx7oKXF5LDWaYWPz9sWgK+ZExCqGchCF4Yei07leAanl68MUavJz0u
	RmTefd4l5Ooa0ukzfh/RFHRm5VN0G4hu9krzH0sPz0xhkuQlCZcoyNJDgmYwIlpudR1wzY
	XV+SKwlffdNMRuSp5pTWbiPvCK5JT5rN5wwIbm2bf7EMYwLjipUEnK8CYxYgpzIijSEywI
	x6DvWbaddlUh07zBVg5x8uHC0O9nPeq0dhhUP/ckGRwDIEj1BGST03skyeR3eA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Derek Kiernan <derek.kiernan@xilinx.com>,
	Dragan Cvetic <dragan.cvetic@xilinx.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 5/7] dt-bindings: sound: Add support for the Lantiq PEF2256
 codec
Date: Thu, 16 Mar 2023 13:27:39 +0100
Message-Id: <20230316122741.577663-6-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316122741.577663-1-herve.codina@bootlin.com>
References: <20230316122741.577663-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SLTJQDP2FM5N2BBK4M4KQKLSBPWGAPL2
X-Message-ID-Hash: SLTJQDP2FM5N2BBK4M4KQKLSBPWGAPL2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SLTJQDP2FM5N2BBK4M4KQKLSBPWGAPL2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Lantiq PEF2256, also known as Infineon PEF2256 or FALC256, is a
framer and line interface component designed to fulfill all required
interfacing between an analog E1/T1/J1 line and the digital PCM system
highway/H.100 bus.

The codec support allows to use some of the PCM system highway
time-slots as audio channels to transport audio data over the E1/T1/J1
lines.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../bindings/sound/lantiq,pef2256-codec.yaml  | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml

diff --git a/Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml b/Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml
new file mode 100644
index 000000000000..acba3a0ccd1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/lantiq,pef2256-codec.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/lantiq,pef2256-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lantiq PEF2256 codec device
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+description: |
+  Codec support for PEF2256.
+
+  The Lantiq PEF2256, also known as Infineon PEF2256 or FALC256, is a framer and
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
+
+allOf:
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: lantiq,pef2256-codec
+
+  lantiq,pef2256:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to the PEF2256
+
+  '#sound-dai-cells':
+    const: 0
+
+required:
+  - compatible
+  - lantiq,pef2256
+  - '#sound-dai-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    audio-codec {
+        compatible = "lantiq,pef2256-codec";
+        lantiq,pef2256 = <&pef2256>;
+        #sound-dai-cells = <0>;
+    };
-- 
2.39.2

