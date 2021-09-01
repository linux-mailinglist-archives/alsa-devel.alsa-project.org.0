Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBECD3FD6A6
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 11:21:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C1891758;
	Wed,  1 Sep 2021 11:20:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C1891758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630488103;
	bh=M5BtFuH8jccDsee25CQGs/U/Q3Luy+V/iW7g5FKGScY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GoqJr/1kSxTmoeRzntAJKTxeXEFDYlWqmqUH7+ic1dQEjWaC5o43tqDpN6KxE8KtM
	 WcHTGR63Ag1lK7SmXtHAIIOpjFqNdAXVBVdt76fgklmbckN1CLGU4VAXOHo5sQ5IvM
	 SkC97TzXEI46l9hkyWBpic9q6sDgTTuFL+4qMODw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CAE7F80256;
	Wed,  1 Sep 2021 11:19:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3533CF804F2; Wed,  1 Sep 2021 11:19:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31DA8F80256
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 11:19:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31DA8F80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="baojiu4A"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="RB4TrP19"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id BD6AF580B22;
 Wed,  1 Sep 2021 05:19:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 01 Sep 2021 05:19:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=2Xz3Y6D/gyY7C
 tqe9aITkYRRiC0YF/N0mmFuOUDcmxA=; b=baojiu4AXHb1/BOJ3XlZGTejFS3Rc
 xs14ADrURj+MxS57S2SkW4OR6iHUE8ohOiq3HRldTwxc+KAuG7IPHCxs5EZWJ7YJ
 hDfZSvl4XenH1mi42NRPi2PMME6u+1xcbqR3V3nZB3c/ZWYdJn3XmQhdjcZT/U/x
 Ukt4YwdJVa4QiOSVwHYS7GfJvSafks+DRoBLOcYVifWZlB38tamRhi0sJ6LZGIl9
 Df6v9WE6L7uK/wQ+1GhyuvYCoDYSiFKZs6KOWZoDvYZf4eMvxDwJv12fa4SGccQz
 plw/TBWVBv6J4lX+PNAt+u78gLsM5YMKMLrdQPavgFL3pNe0xSYjvnx7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=2Xz3Y6D/gyY7Ctqe9aITkYRRiC0YF/N0mmFuOUDcmxA=; b=RB4TrP19
 X5CzSK6LVt2FcwuDJ4ulKIk/ToFgqI2iMk8ir97ALJG6VbF9+Jk+BUK6Jr9n+s5Z
 NUZfHQk39EAoX7VD+lW8u7Th0Xg8G/WBdAuHImD34YGdjZG/abvHiJidIQji6LsB
 eOXWb8PITc5SmftKdtte9eajoCLzjQbOl4W5K9+gqHabM+LVbikixO7bHgpo1BOP
 F85Qkc4qi13n05zhy7WroFknoORv5M68Incxz5lKrKX8XcY/Gv50SfXh7DIvZglx
 e9LSfAdk6eEII1vtEp5satg371ucgQZhoGGDo2/8mRuDSRlGt6lJtiyHlTjBt5PA
 NGPWrMzulRv0Zw==
X-ME-Sender: <xms:h0UvYROSC-WnfPiTFu80dayoAyNzIbFAuyxH5ckWWqDaLWi8IZutpw>
 <xme:h0UvYT9gpFZkgniApsZbZXdumxSec9AGw2t-2ovijLF0-YtdgUIm2HgJV78S1lygR
 OBogv3CSIzbJfuYQa8>
X-ME-Received: <xmr:h0UvYQTt6eWLfz0ocRh7oDZx88FAQNLm0OVPsYycKIK0eWjGlFdlGEJgYlncqeIaSlJonbbIdKov77kigQ1STR3YKVfb5TEsJ1ZW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 govehorghsthgrlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgj
 fhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrg
 igihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeevjeeijedtvefg
 fffgjeeugffguedtleetkeegteeufedtuddttdfgfffhgfeuffenucffohhmrghinhepug
 gvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:h0UvYdvuHkxCDq0Dz7cdyHr7SnaczkPGMs5v-1_hAOIg5dI2LIbdIw>
 <xmx:h0UvYZc57IszIUeYqHhDqWI4_-iKHxWNQvetRoYQpuZjrNiKPBRqgA>
 <xmx:h0UvYZ3LbFkforw9NJBv6fn3lj_EPJBizkvAHPQlJw3nhEiMR5R9ew>
 <xmx:h0UvYZ3_8O_5ZixSWwBw2doUztVQWrNm-zRtVFCZrkPMZzoVeIUMCg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 05:19:02 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [PATCH v2 04/52] ASoC: dt-bindings: Convert Simple Amplifier binding
 to a schema
Date: Wed,  1 Sep 2021 11:18:04 +0200
Message-Id: <20210901091852.479202-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901091852.479202-1-maxime@cerno.tech>
References: <20210901091852.479202-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-sunxi@googlegroups.com,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
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

Simple audio amplifiers are supported by Linux with a matching device
tree binding.

Now that we have the DT validation in place, let's convert the device
tree bindings for that driver over to a YAML schema.

Cc: alsa-devel@alsa-project.org
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../bindings/sound/simple-amplifier.txt       | 17 -------
 .../sound/simple-audio-amplifier.yaml         | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/simple-amplifier.txt
 create mode 100644 Documentation/devicetree/bindings/sound/simple-audio-amplifier.yaml

diff --git a/Documentation/devicetree/bindings/sound/simple-amplifier.txt b/Documentation/devicetree/bindings/sound/simple-amplifier.txt
deleted file mode 100644
index b1b097cc9b68..000000000000
--- a/Documentation/devicetree/bindings/sound/simple-amplifier.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Simple Amplifier Audio Driver
-
-Required properties:
-- compatible : "dioo,dio2125" or "simple-audio-amplifier"
-
-Optional properties:
-- enable-gpios : the gpio connected to the enable pin of the simple amplifier
-- VCC-supply   : power supply for the device, as covered
-                 in Documentation/devicetree/bindings/regulator/regulator.txt
-
-Example:
-
-amp: analog-amplifier {
-	compatible = "simple-audio-amplifier";
-	VCC-supply = <&regulator>;
-	enable-gpios = <&gpio GPIOH_3 0>;
-};
diff --git a/Documentation/devicetree/bindings/sound/simple-audio-amplifier.yaml b/Documentation/devicetree/bindings/sound/simple-audio-amplifier.yaml
new file mode 100644
index 000000000000..26379377a7ac
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/simple-audio-amplifier.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/simple-audio-amplifier.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Simple Audio Amplifier Device Tree Bindings
+
+maintainers:
+  - Jerome Brunet <jbrunet@baylibre.com>
+
+properties:
+  compatible:
+    enum:
+      - dioo,dio2125
+      - simple-audio-amplifier
+
+  enable-gpios:
+    maxItems: 1
+
+  VCC-supply:
+    description: >
+      power supply for the device
+
+  sound-name-prefix:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: >
+      See ./name-prefix.txt
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/meson8-gpio.h>
+
+    analog-amplifier {
+        compatible = "simple-audio-amplifier";
+        VCC-supply = <&regulator>;
+        enable-gpios = <&gpio GPIOH_3 0>;
+    };
+
+...
-- 
2.31.1

