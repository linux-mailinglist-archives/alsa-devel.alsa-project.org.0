Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EA9671CB6
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 13:54:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 822F177DE;
	Wed, 18 Jan 2023 13:53:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 822F177DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674046473;
	bh=IJ2/CcswyffbKKxQ0Bl9azakjzjUXVGOSOtIg6xvvpw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EpP8F/PhMOQ9qvbSICJ2JTc+9ZkRK9YgIOuJgZR0+AvDQmnZA7+fKJJySyJcEi+4O
	 a46dgHDn3cvB41Cy9dnvL5vyR9jv3w6vqXTcADHFhFzoK2GQ5iGBg/XYvDSfAsTWOU
	 lyHJEgHJ0BEwlFRPJO7IZ1KiBJqk9KYA+onUQosk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50CABF80542;
	Wed, 18 Jan 2023 13:52:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 066ECF80542; Wed, 18 Jan 2023 13:52:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77BD2F804A9
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 13:52:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77BD2F804A9
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=axis.com header.i=@axis.com header.a=rsa-sha256
 header.s=axis-central1 header.b=abw+exdW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1674046355;
 x=1705582355; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9tpzvI7fdZDoAPrHN+US7UGk+e/yxtX1rAxxB7G8nrs=;
 b=abw+exdWoqCr5g2BGXP4ZXOyt00JfFjfMPTVJ4Nz7kDKFBKXzys32U7c
 MFuAlPa0B7w+ZuNuCrgqURQCRyE/M9fCtDXjxXn3vH5z+kY2wUU9eKQyr
 eMvbZZYOMuK9D6Z5sETvZ9xaPzeky7NIBDgyK3GpFAfAJZoGnGasg4VJJ
 7XBXJSgz3uh1xeVXr/hWuBv9Vh7my04pag8KuNn44rZ3vZBx1nDKDzFo0
 ynraqODKMvZuaMNlBYqQ6J3wiVPrWhb/UBf38SAmYcDKOzHlcTr6Ev9SR
 FSC28jhO1brU0uolDwmpWFxBSCY/UvSOii3OtPJdS8jKthcVG38ERsH01 A==;
From: Astrid Rost <astrid.rost@axis.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v1 4/4] ASoC: dt-bindings: simple-card: create jack for
 aux_devs
Date: Wed, 18 Jan 2023 13:52:26 +0100
Message-ID: <20230118125226.333214-5-astrid.rost@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230118125226.333214-1-astrid.rost@axis.com>
References: <20230118125226.333214-1-astrid.rost@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, kernel@axis.com,
 linux-kernel@vger.kernel.org, Astrid Rost <astrid.rost@axis.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add simple-card,aux-jack-types:
Array of snd_jack_type to create jack-input-event for jack devices in
aux-devs. If the setting is 0, the supported type of the device is used.
A device which has the functions set_jack and get_jack_supported_type
counts as jack device.

Signed-off-by: Astrid Rost <astrid.rost@axis.com>
---
 .../bindings/sound/simple-card.yaml           | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index ed19899bc94b..2635b1c04fc9 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -199,6 +199,13 @@ properties:
     maxItems: 1
   simple-audio-card,mic-det-gpio:
     maxItems: 1
+  simple-audio-card,aux-jack-types:
+    $ref: "/schemas/types.yaml#/definitions/uint32-array"
+    description: |
+      Array of snd_jack_type to create jack-input-event for jack
+      devices in aux-devs. If the setting is 0, the supported
+      type of the device is used. A device which has the functions
+      set_jack and get_jack_supported_type counts as jack device.
 
 patternProperties:
   "^simple-audio-card,cpu(@[0-9a-f]+)?$":
@@ -498,3 +505,31 @@ examples:
             };
         };
     };
+#--------------------
+# Add a headphone and a headset mic jack,
+# which use an auxiliary jack detector e.g. via i2c.
+# The events, which should be enabled are:
+# SND_JACK_HEADPHONE = 1
+# SND_JACK_MICROPHONE = 2
+#--------------------
+  - |
+    sound {
+        compatible = "simple-audio-card";
+        simple-audio-card,widgets =
+            "Headphone", "Headphone Jack",
+            "Headset Mic", "Headset Mic Jack";
+        simple-audio-card,routing =
+            "Headphone Jack", "HPLEFT",
+            "Headphone Jack", "HPRIGHT",
+            "LEFTIN", "Headset Mic",
+            "RIGHTIN", "Headset Mic";
+        simple-audio-card,aux-devs = <&hp_jack>, <&hs_mic_jack>;
+        simple-audio-card,aux-jack-types = <1 2>;
+        simple-audio-card,cpu {
+            sound-dai = <&ssi2>;
+        };
+        simple-audio-card,codec {
+            sound-dai = <&codec>;
+            clocks = <&clocks>;
+        };
+    };
-- 
2.30.2

