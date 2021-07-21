Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC423D10CF
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 16:06:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AF8716FE;
	Wed, 21 Jul 2021 16:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AF8716FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626876404;
	bh=G4xkuJJ0plOPX9nytIMNMLUZYAonWK1isYZ3lJChha0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gtcs49Ly/gw5Su8UC/8c9ZoPu50kiZzXWxlqq+aR9vJPLBefFugA32UVEJUiYdwvb
	 YGEPU/JSwtYkfFCXKrU9QPfzpCOFiRxRx4Pg0J8F12oQZC0cUziHDklLJGidWcKEB0
	 C2Pc4MKlR6S7Y6iO00mB0clz7UOkNKWCCB5yz7xM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90948F804E1;
	Wed, 21 Jul 2021 16:04:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0D60F804DF; Wed, 21 Jul 2021 16:04:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6AEBF804BD
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 16:04:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6AEBF804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="H+VsCVyp"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Z3YkWzlc"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 33761580482;
 Wed, 21 Jul 2021 10:04:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 21 Jul 2021 10:04:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=yaFAahpcJkLP9
 c9IO8blHHGww65bHSmpbQ9yOfpm/+s=; b=H+VsCVypLV7c5oEbJ+xaM67kgTtg4
 cDZkj+SmEO/WPYK+VNnZcCSfmeKCPz/DOVN2HQ/Nn/i/biTFKsFMShlEhHMPPIM1
 Vz4IUj9QjDdLzkBrpThwiqlGBmCMVLK0QY0sUxtdItq7ZOKRYFtBksXC0LrAsNkk
 tmHkVV6XQ+KStUyeH4Puag0ETaZ0Unwm9hS1Y7aych7rT6JfrHLOpfPCJHMvfan0
 Im+DTtJ0rUehJo47v6KnUKta5J/ZwCZREwg1QV3RB5HvhQ0dUsD5YWm8jVHMVi/y
 9CTYRPuYZA8Mvfp5gDxSdkniwvE9wwsEO6FuWrfTIa36S4A3kW6swgZiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=yaFAahpcJkLP9c9IO8blHHGww65bHSmpbQ9yOfpm/+s=; b=Z3YkWzlc
 m71HQf3Q5pXokZVSEWhjF2pvlodE4DVNjWUuUOChtMPu42u4XUG8zvWD4jb7dsmX
 fery/8HwIRvfaFAqFyhG4e29wj4q2auLbGxzQyraGgGvaxmw2B0IwZD2cO1qd/c7
 OjqCy688GBFN10Ti4OW4ZNNT41hO88bh8/Fcfh2+6+qWCrJzwtBLiicvbY8rcg7D
 dHo4eKKlFz56aOSwwQ/3QpKlPWu5RCIigLVeazqA0axANMC5xQmeaHmJQMJAZcn3
 Ge/XpCNTYjAJKYJOH/8rGiZ3jAvxOEwlXKOZOAi2NtLmu6XY0HNJIuhRsGmpLpUN
 9CBAKjSseHIABA==
X-ME-Sender: <xms:dSn4YGtZu5rEs-3fdyGH4G_b_0ffRMpIDAA72JmGeOpYQoKmk2JKhA>
 <xme:dSn4YLdQtbQIH9VxmnQ96XuQu6QIrf29kH0q9zRymQPErFTW4Scnfnrbi4w5GJ8vA
 kTWOAQnHadlZCCJVYo>
X-ME-Received: <xmr:dSn4YBwgzOmTs_DNtJLzo1uvBk_-xbSLu1rOhQ_n7_nusHD7HNKUmYDkc7VwUITscvpaOBuO5JklDR3ikfFwyvwhqJxhbVoePbZV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeeggdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 evohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffojghf
 ggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgi
 himhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepveejieejtdevgfff
 gfejuefggfeutdelteekgeetueeftddutddtgfffhffgueffnecuffhomhgrihhnpeguvg
 hvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dSn4YBNAdhcqAgcEupdePIK4Ak8YRqGWE76i_uRaNsYkjZw53IYwKw>
 <xmx:dSn4YG8esgJCQagoCcjRW-1MPsUnkQpBOLRRQC8zNDjZarsugSphbQ>
 <xmx:dSn4YJVLaf4D2VDWB_hJR6GQzmUYEtKE-s30RqMovLRmzscQuFgq4g>
 <xmx:din4YH0qKQ637GspXuj7USX3CiQ4A4Xo-l5nYNbM0nPJ1qRYsNn68A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 10:04:37 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@siol.net>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 04/54] ASoC: dt-bindings: Convert Simple Amplifier binding to
 a schema
Date: Wed, 21 Jul 2021 16:03:34 +0200
Message-Id: <20210721140424.725744-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721140424.725744-1-maxime@cerno.tech>
References: <20210721140424.725744-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-sunxi@googlegroups.com, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
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

