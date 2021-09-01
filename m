Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAF63FD6A5
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 11:21:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67AF216AC;
	Wed,  1 Sep 2021 11:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67AF216AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630488072;
	bh=FZCgYUCUJSRBWx7gnU5loyjLyxvPxwnbQuZr7PiY2EQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C24RILy5SVhnrfXSj7mX2Bmsm2zDF9vpOK+j6keOQYK+dY/6fzRS0fUR4uEbhCe1E
	 6SoJZ8yD8wP3UuSwqsuBgazFhZN2Fp1fBeYmdjfG1k8C0XdlI0xcUXamcl97ye8a8l
	 3kPNs8JFXUywmc2CpQAefGlvKEiC00uV5iFnmVao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B6DAF80227;
	Wed,  1 Sep 2021 11:19:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CFC1F804EC; Wed,  1 Sep 2021 11:19:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1205F80227
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 11:19:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1205F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="oxXR4UEC"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="TJqzxIw8"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 38212580AF6;
 Wed,  1 Sep 2021 05:19:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 01 Sep 2021 05:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Nw1E3XUhXZl3E
 Vib6iKp0DgaQ2k4DNURT8dZMhvJBEc=; b=oxXR4UEChdHrgDprcepoqKGmrPtTJ
 FKM0HYR9JBUurzHrYQhmtPLkm5byi5r/SfHZVE4JSmR6l1DcK3yNIe+tpTWVQ682
 IecwW3iT9Eu0X+2wd3qoNFHAQpp2qRXcGTChMzkPjqUg+W3ZkDYvNx4ioamLndXZ
 thATHUzl3LLYdcYosTPmJrr8gS+flAWKk4Eg8a7GGqW11ibBWwd7UQJZ5a0iWHb3
 K01GudGUaBipZuvAVpe7H/6YrssQBd3HD18wWLdjPxCupT/sxILcXJvmYhKktQJu
 93ma6xeQkwe7Tyzu3YWJzujoLEKMiGVY8QDW0Mqugg2Y54TwkV0w9sVSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Nw1E3XUhXZl3EVib6iKp0DgaQ2k4DNURT8dZMhvJBEc=; b=TJqzxIw8
 IfUnYv9X4E5f+gzGWHmqWDyTHR6sHFt4beIUaAEcNfZqGghFkuejsXsUwIJEwH/r
 rep6yGhJB/Z/oMHL7SUhqPDpDQl03+P00APxqXdFLj8PieFeMWlc5vBHaKerXIVQ
 GuPMamPrKD2TjhOQK8nxhgPJ/lJPLOvhvs13yf95tu1BowmATncHnjMX+t4x1Thu
 W8d0IWoS+UFkKw/PjQO/CzBx8mIKM2rlZO4REAbSnGODNtkAooSuQCWBVq9AW9UK
 o45OgHW5VBl69w7IR9N74+hVEMCr20iySyBTOWyvsa9A59ShjQbcv7+brankxwMo
 1NwtxoIvTzILFw==
X-ME-Sender: <xms:g0UvYeFewQjgWg4Q5TQcdda4TCGaoKfGrDzXXX5xPDdgsZ35jbs-mg>
 <xme:g0UvYfWn9VJ3wAACd6N3GFJp9Qqj2cF6iBvaugrQJdVncM6aoYW5LBxUTNmIZuMuv
 m_lruMiwO_XdqH2O2w>
X-ME-Received: <xmr:g0UvYYL5ukqemdO6EguosH4hsi7xrF6MMa7se0FzWe2PLdujnNdwCKC0OrDviLubHm4iZC2IOJ4E4O9FPQUnExykEegQ7KF_tdJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 govehorghsthgrlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgj
 fhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrg
 igihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeevjeeijedtvefg
 fffgjeeugffguedtleetkeegteeufedtuddttdfgfffhgfeuffenucffohhmrghinhepug
 gvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:g0UvYYF0gtIusCOhao4tsvvqe4BQYUHOoapsFUv71UhGuIzDZZcNYg>
 <xmx:g0UvYUVFZ1dWT_rknCkalreXXTQol5qd3dSYKFkJC_GPZ8Yd8ZcwVA>
 <xmx:g0UvYbMYtzFrBs4IBU9164-zNoUEureCtbAJ1JIimWK1CJdKhSGVLg>
 <xmx:hEUvYdOybdO5nJ91dqTI4SrB3emNG3BWMZpByisdmpDGA-zoU7At6A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 05:18:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [PATCH v2 02/52] ASoC: dt-bindings: Convert Bluetooth SCO Link
 binding to a schema
Date: Wed,  1 Sep 2021 11:18:02 +0200
Message-Id: <20210901091852.479202-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901091852.479202-1-maxime@cerno.tech>
References: <20210901091852.479202-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Samuel Holland <samuel@sholland.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-sunxi@googlegroups.com,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
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

Bluetooth SCO Link are supported by Linux with a matching device tree
binding.

Now that we have the DT validation in place, let's convert the device
tree bindings for that driver over to a YAML schema.

Cc: alsa-devel@alsa-project.org
Cc: devicetree@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---

Changes from v1:
  - Accept either a 0 or 1 #sound-dai-cells
---
 .../devicetree/bindings/sound/bt-sco.txt      | 13 -------
 .../bindings/sound/linux,bt-sco.yaml          | 38 +++++++++++++++++++
 2 files changed, 38 insertions(+), 13 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/bt-sco.txt
 create mode 100644 Documentation/devicetree/bindings/sound/linux,bt-sco.yaml

diff --git a/Documentation/devicetree/bindings/sound/bt-sco.txt b/Documentation/devicetree/bindings/sound/bt-sco.txt
deleted file mode 100644
index 641edf75e184..000000000000
--- a/Documentation/devicetree/bindings/sound/bt-sco.txt
+++ /dev/null
@@ -1,13 +0,0 @@
-Bluetooth-SCO audio CODEC
-
-This device support generic Bluetooth SCO link.
-
-Required properties:
-
-  - compatible : "delta,dfbmcs320" or "linux,bt-sco"
-
-Example:
-
-codec: bt_sco {
-	compatible = "delta,dfbmcs320";
-};
diff --git a/Documentation/devicetree/bindings/sound/linux,bt-sco.yaml b/Documentation/devicetree/bindings/sound/linux,bt-sco.yaml
new file mode 100644
index 000000000000..e3a1f485f664
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/linux,bt-sco.yaml
@@ -0,0 +1,38 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/linux,bt-sco.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bluetooth SCO Audio Codec Device Tree Bindings
+
+maintainers:
+  - Mark Brown <broonie@kernel.org>
+
+properties:
+  '#sound-dai-cells':
+    enum:
+      - 0
+
+      # For Wideband PCM
+      - 1
+
+  compatible:
+    enum:
+      - delta,dfbmcs320
+      - linux,bt-sco
+
+required:
+  - '#sound-dai-cells'
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    codec {
+        #sound-dai-cells = <0>;
+        compatible = "linux,bt-sco";
+    };
+
+...
-- 
2.31.1

