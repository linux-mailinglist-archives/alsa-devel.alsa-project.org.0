Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB09070E01B
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 17:14:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D0F482B;
	Tue, 23 May 2023 17:13:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D0F482B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684854872;
	bh=cvt4qSEMq/xa7Zrcpq+YtTKXlgndf6d5qkmGg4fmBF8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vNHZrz+ydEiynV6zLZzBU4iRW3hcuHD+UsTr2RFs3qFmBbYm3WyoLtYjIKCKFxyw5
	 3krjfxmVfHdHlH8B6o/LV2Lg9JpOcHh77hbxAWhy2mGjHub44I0wRqsgKUeUmswbo+
	 TqEZJRYFKaOorRV/LOZZPoaJ8J1gW3FWYb3Wre1k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 889EEF80571; Tue, 23 May 2023 17:12:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1E25F8056F;
	Tue, 23 May 2023 17:12:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8929F80553; Tue, 23 May 2023 17:12:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1368F800DF
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 17:12:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1368F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=EvezOhAv
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 85B0DC0008;
	Tue, 23 May 2023 15:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684854759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5N9NSA3ycLJUSucfBk1k0lUH03RfOeo/UXNYngARjpo=;
	b=EvezOhAvwI6QLfONUptzen99rqPE2gcCja9TLNST4YCqrBJe1hw2Csg90Nenr/O7S/mpKL
	ezDdg89iS2+2OjRf8OwzWRWlmmXsLO4mQBRl8CDdVM4i+zEHSu8n4Y5sNoDP78LA6fCj3k
	9DufT16RrzkROIA/bwVHFm8tZ85m7SKPF+MpoE+5Ah8Kek0l277HVdwFPIG1rR1j2g77W1
	ZTHJX/b3OW0fnXF28gDgm3+m2YZLAUT0YtmlNWGTPk8ghEbgVcP+Ls4U+Xz6M4LiPPt61Q
	IQp30rqwgpAs5Z3W17X4wneSKsUKYfZwqVcknT2cDx9W38kp0iRCay0Gen5/EQ==
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
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 2/9] ASoC: dt-bindings: simple-card: Add additional-devs
 subnode
Date: Tue, 23 May 2023 17:12:16 +0200
Message-Id: <20230523151223.109551-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523151223.109551-1-herve.codina@bootlin.com>
References: <20230523151223.109551-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: J3O5OEOGI6Z4J2NHAT2XSIPTCFNESYVD
X-Message-ID-Hash: J3O5OEOGI6Z4J2NHAT2XSIPTCFNESYVD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J3O5OEOGI6Z4J2NHAT2XSIPTCFNESYVD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The additional-devs subnode allows to declared some virtual devices
as sound card children.
These virtual devices can then be used by the sound card and so be
present in the audio path.

The first virtual device supported is the audio IIO auxiliary device
in order to support an IIO device as an audio auxiliary device.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 .../bindings/sound/simple-card.yaml           | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index b05e05c81cc4..59ac2d1d1ccf 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -148,6 +148,15 @@ definitions:
     required:
       - sound-dai
 
+  additional-devs:
+    type: object
+    description:
+      Additional devices used by the simple audio card.
+    patternProperties:
+      '^iio-aux(-.+)?$':
+        type: object
+        $ref: audio-iio-aux.yaml#
+
 properties:
   compatible:
     contains:
@@ -187,6 +196,8 @@ properties:
     $ref: "#/definitions/mclk-fs"
   simple-audio-card,aux-devs:
     $ref: "#/definitions/aux-devs"
+  simple-audio-card,additional-devs:
+    $ref: "#/definitions/additional-devs"
   simple-audio-card,convert-rate:
     $ref: "#/definitions/convert-rate"
   simple-audio-card,convert-channels:
@@ -359,6 +370,48 @@ examples:
         };
     };
 
+# --------------------
+# route audio to/from a codec through an amplifier
+# designed with a potentiometer driven by IIO:
+# --------------------
+  - |
+    sound {
+        compatible = "simple-audio-card";
+
+        simple-audio-card,aux-devs = <&amp_in>, <&amp_out>;
+        simple-audio-card,routing =
+            "CODEC LEFTIN", "AMP_IN LEFT OUT",
+            "CODEC RIGHTIN", "AMP_IN RIGHT OUT",
+            "AMP_OUT LEFT IN", "CODEC LEFTOUT",
+            "AMP_OUT RIGHT IN", "CODEC RIGHTOUT";
+
+        simple-audio-card,additional-devs {
+            amp_out: iio-aux-out {
+                compatible = "audio-iio-aux";
+                io-channels = <&pot_out 0>, <&pot_out 1>;
+                io-channel-names = "LEFT", "RIGHT";
+                snd-control-invert-range = <1 1>;
+                sound-name-prefix = "AMP_OUT";
+            };
+
+            amp_in: iio_aux-in {
+                compatible = "audio-iio-aux";
+                io-channels = <&pot_in 0>, <&pot_in 1>;
+                io-channel-names = "LEFT", "RIGHT";
+                sound-name-prefix = "AMP_IN";
+            };
+        };
+
+        simple-audio-card,cpu {
+            sound-dai = <&cpu>;
+        };
+
+        simple-audio-card,codec {
+            sound-dai = <&codec>;
+            clocks = <&clocks>;
+        };
+    };
+
 # --------------------
 # Sampling Rate Conversion
 # --------------------
-- 
2.40.1

