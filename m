Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3B573B323
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jun 2023 11:00:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34C6D845;
	Fri, 23 Jun 2023 10:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34C6D845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687510838;
	bh=rgShhFeB0RvUnlChF5BVzhAM5ukujLONBTqI8RWHWvA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZUOhQGOkv6VLHFnzCGuScPdMFmEBs5QoogzNClZEtOlip/ULaqKcoMR5kOzq+nlDh
	 lSK78zu1YYNOiepH+jPex2xA+Bq7qC4wnbarndzOdQ66na2aT7Mshxy6Al54szjbUd
	 YhZ0dp06UlhMrwtgGfaqGmTAZt7J+cxx30jyNpBE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B330F80553; Fri, 23 Jun 2023 10:58:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 231D3F80557;
	Fri, 23 Jun 2023 10:58:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57644F801F5; Fri, 23 Jun 2023 10:58:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B988F8003A
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 10:58:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B988F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UotQHbaA
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687510720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EEEy793cjGF4C1unCyddxor7imGVvD+ZiP6bKckvbw4=;
	b=UotQHbaAJeNXasLN9mk7ePmGKLlGqSP5Pk+4e4/5oGOhcBkWTqdISJTeO8zYXONumIYwR3
	Od7Qd/WgRSMRq1o45te8iI48HzGRLT3mSf6jYm6zPkG4p27aPt4paAiWNd0i5xUJq42pb0
	5Ig4LySjXqz/dZF2avcsX4oFRD/8Fp5XbV/S+GP1Mi86Jvo96Vd3Ler343LhhDOcUGyCes
	Mbyd0W6rRpuFVbLHZrkiUtHfrSl7TL/0jBeIvKdf0a5SuEzFhYXwvXKyQZ3sKQviNgVvm5
	c5lHEslDQAjzYHT95A7JsL+v/jRe40vpqTWvd/r2I9ADxZAWcfhF6xFCtWwP7A==
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
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id A0B9CE000C;
	Fri, 23 Jun 2023 08:58:38 +0000 (UTC)
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
	Wojciech Ziemba <wojciech.ziemba@intel.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v6 01/13] ASoC: dt-bindings: Add audio-iio-aux
Date: Fri, 23 Jun 2023 10:58:18 +0200
Message-Id: <20230623085830.749991-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230623085830.749991-1-herve.codina@bootlin.com>
References: <20230623085830.749991-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FZ275NI4CBACTG3GOSK5H43RN2IHW65Q
X-Message-ID-Hash: FZ275NI4CBACTG3GOSK5H43RN2IHW65Q
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
Archived-At: <>
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
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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

