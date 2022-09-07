Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DAE5B066D
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 16:24:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56FB8164E;
	Wed,  7 Sep 2022 16:23:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56FB8164E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662560642;
	bh=0AJRaTR99WJiEoPvsDyYYoAlPqKXiSb7ub67S9ixuzM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ftwJpEkS8fCvDFVcd/x+oCw03dWfn7XjCV9T0MC3MKXLwXJgso/ICIWHdABcd2FZN
	 mSX6Gn0/jBtWlVimHXM0OVx7AAFAG+I/nf31OPA05pgLIOucusC39s1ss8lG+AzMsa
	 /9qm1qSkWIv5drImk0Qp0Q7icv+6iv5WUetfL6u8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30627F80423;
	Wed,  7 Sep 2022 16:22:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 449B7F80552; Wed,  7 Sep 2022 16:22:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B388F80423
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 16:22:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B388F80423
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.b="K3xa18hD"
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id F2C2920000F;
 Wed,  7 Sep 2022 14:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1662560526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VgbxwdFt5PQppcOV7X5ar9OBFO85n+/rhDp625ejemw=;
 b=K3xa18hD5THvri4wHGXS1ynPnBzxFd5Zor2sm9QM6SMroLfr12HiVYVsbewqW89p0iqgV4
 IlnnpUFS8seVJT3Mtv0E7rprRb3KqgTrVixWJN+fNMl6fibdHrWSEwwduzd3sEN9D7C5Kf
 7R+Hh0+gkO0A4KbbemjizLE5quL2C8M20AJgKZJhM1WaQ1sNXjU+2lpBbooX5O5HfXNQAx
 q/o/FegSFyelVAKO3y8zlWkcJtcN+6eGCdGElS9d+wfZg76iBu4oazIuQ7Bww9Ry0x2qvA
 rIYgWb+yghfJ2U2bCudSsu/kIAyKbz6kVQr6rHL9gI+PC6OAaCk3UAm1q4QbRg==
From: luca.ceresoli@bootlin.com
To: alsa-devel@alsa-project.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 2/8] ASoC: rockchip: rk3308: add audio card bindings
Date: Wed,  7 Sep 2022 16:21:18 +0200
Message-Id: <20220907142124.2532620-3-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220907142124.2532620-1-luca.ceresoli@bootlin.com>
References: <20220907142124.2532620-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 Takashi Iwai <tiwai@suse.com>, Chris Morgan <macromorgan@hotmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Johan Jonker <jbx6244@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Luca Ceresoli <luca.ceresoli@bootlin.com>

Add device tree bindings document for the audio card based on the internal
I2S of the Rockchip RK3308 SoC.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 .../rockchip,rk3308-audio-graph-card.yaml     | 50 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/rockchip,rk3308-audio-graph-card.yaml

diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3308-audio-graph-card.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3308-audio-graph-card.yaml
new file mode 100644
index 000000000000..8445a69dcdbb
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/rockchip,rk3308-audio-graph-card.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/rockchip,rk3308-audio-graph-card.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RK3308 Audio card based on internal I2S
+
+maintainers:
+  - Luca Ceresoli <luca.ceresoli@bootlin.com>
+
+allOf:
+  - $ref: /schemas/sound/audio-graph.yaml#
+
+properties:
+  compatible:
+    const: rockchip,rk3308-audio-graph-card
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "rockchip,rk3308-audio-graph-card";
+        dais = <&i2s_8ch_2_port>;
+    };
+
+    i2s_8ch_2 {
+        i2s_8ch_2_port: port {
+            i2s_8ch_2_endpoint: endpoint {
+                remote-endpoint = <&acodec_endpoint>;
+                dai-format = "i2s";
+
+                /* The RK3308 acodec has no clock dividers, use the CPU */
+                bitclock-master = <&i2s_8ch_2_endpoint>;
+                frame-master = <&i2s_8ch_2_endpoint>;
+            };
+        };
+    };
+
+    acodec {
+        port {
+            acodec_endpoint: endpoint {
+                remote-endpoint = <&i2s_8ch_2_endpoint>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index d53a8e74cb1e..079bdd95dc49 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17594,6 +17594,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
 F:	include/dt-bindings/sound/rockchip,rk3308-codec.h
 
+ROCKCHIP RK3308 SOUND CARD DRIVER
+M:	Luca Ceresoli <luca.ceresoli@bootlin.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/rockchip,rk3308-audio-graph-card.yaml
+
 ROCKCHIP VIDEO DECODER DRIVER
 M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 L:	linux-media@vger.kernel.org
-- 
2.34.1

