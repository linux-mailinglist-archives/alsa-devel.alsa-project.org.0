Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33497731C9F
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jun 2023 17:28:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A52484A;
	Thu, 15 Jun 2023 17:27:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A52484A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686842914;
	bh=omyK8EMZFIuk2H2NcLRfSrI/todecGtoc2EXB60MIrs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NsXmUzk2jrmsU0To/q4AxjKv9kWhFs7y1SspIr6lQo7BcdPmUNoYaq43FWu7qVOg7
	 vCw662m0fhoO+Zws5QyejqEUQFCIJudbYodv1U4ApdzgBz7i1vziarcjofZZ0dPQIw
	 9f0BK2oZUJKF3hEHkf+OUFT9gyTOGSQWagLu7Vg4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D04AF8057C; Thu, 15 Jun 2023 17:26:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 88971F80549;
	Thu, 15 Jun 2023 17:26:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D7D9F8025E; Thu, 15 Jun 2023 17:26:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C656AF800ED
	for <alsa-devel@alsa-project.org>; Thu, 15 Jun 2023 17:26:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C656AF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hEsTxs4F
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686842797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GyTXVmL/5teIh8xuYTUUi3ltQcCGVDf6AcEbfADS6og=;
	b=hEsTxs4FYerXIh5EHWoQI0TmMEDx3dymBWYlPvN7qpgqMdrnMMFZFdm769O7M5RLmQr0TF
	cRf0g9gXPRGnaxOdrgoB3o3BMg4ApnEWCx8cR+y4SYzXz71U1AIBFTlmvpb81ifqwLgKRM
	Gxla0V3y744JELfZso8AtVer/OPRePbaEqaqzrUF3dY3AnR0CpuPGj2uXypOTJA7Y048zI
	gOSpAiNnC2xXhYW1NKyhQIBDxurSZbBv/w2qLdXoFBS8QIjCng0RiJfRQfaKYkyubOuE+d
	FR+z63B08sfCZW1ULYalGYslK1C3kCpImmPBpnqpa6K1kA3w1USE9PzdWEO+TA==
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 3E4FCFF807;
	Thu, 15 Jun 2023 15:26:36 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v5 01/13] ASoC: dt-bindings: Add audio-iio-aux
Date: Thu, 15 Jun 2023 17:26:19 +0200
Message-Id: <20230615152631.224529-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230615152631.224529-1-herve.codina@bootlin.com>
References: <20230615152631.224529-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TSIWOMXJJPVJIYT2KFYJKKW5YZ2UD7P6
X-Message-ID-Hash: TSIWOMXJJPVJIYT2KFYJKKW5YZ2UD7P6
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TSIWOMXJJPVJIYT2KFYJKKW5YZ2UD7P6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Industrial I/O devices can be present in the audio path.
These devices needs to be viewed as audio components in order to be
fully integrated in the audio path.

audio-iio-aux allows to consider these Industrial I/O devices as
auxliary audio devices.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../bindings/sound/audio-iio-aux.yaml         | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/audio-iio-aux.yaml

diff --git a/Documentation/devicetree/bindings/sound/audio-iio-aux.yaml b/Documentation/devicetree/bindings/sound/audio-iio-aux.yaml
new file mode 100644
index 000000000000..d3cc1ea4a175
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/audio-iio-aux.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/audio-iio-aux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Audio IIO auxiliary
+
+maintainers:
+  - Herve Codina <herve.codina@bootlin.com>
+
+description:
+  Auxiliary device based on Industrial I/O device channels
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: audio-iio-aux
+
+  io-channels:
+    description:
+      Industrial I/O device channels used
+
+  io-channel-names:
+    description:
+      Industrial I/O channel names related to io-channels.
+      These names are used to provides sound controls, widgets and routes names.
+
+  snd-control-invert-range:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      A list of 0/1 flags defining whether or not the related channel is
+      inverted
+    items:
+      enum: [0, 1]
+      default: 0
+      description: |
+        Invert the sound control value compared to the IIO channel raw value.
+          - 1: The related sound control value is inverted meaning that the
+               minimum sound control value correspond to the maximum IIO channel
+               raw value and the maximum sound control value correspond to the
+               minimum IIO channel raw value.
+          - 0: The related sound control value is not inverted meaning that the
+               minimum (resp maximum) sound control value correspond to the
+               minimum (resp maximum) IIO channel raw value.
+
+required:
+  - compatible
+  - io-channels
+  - io-channel-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    iio-aux {
+        compatible = "audio-iio-aux";
+        io-channels = <&iio 0>, <&iio 1>, <&iio 2>, <&iio 3>;
+        io-channel-names = "CH0", "CH1", "CH2", "CH3";
+        /* Invert CH1 and CH2 */
+        snd-control-invert-range = <0 1 1 0>;
+    };
-- 
2.40.1

