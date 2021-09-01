Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8E33FD691
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 11:20:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1C4F1762;
	Wed,  1 Sep 2021 11:19:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1C4F1762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630488029;
	bh=gxxk3mh7eTjYtp31Suc1eQFtLWYfeRd1Z0/3Duy486I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UHld+WOWj8pJQAYci0wXB7+MiU4HxclMqAmi5mZDAeV7gz0ixWkCdlFXcaYLJcTr0
	 b1zacKHvkIF+wgb2RNXKkKZjhUwYt929FdNvvApcfOBXgGuOiSVOmO/RyRpNDwK/zZ
	 MAsKrh8T5oybz80yh3wWTqcSdMNZ3kQDsToC19u8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FC2AF8032B;
	Wed,  1 Sep 2021 11:19:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DAC8F8032B; Wed,  1 Sep 2021 11:19:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 355FBF8020D
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 11:19:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 355FBF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="rmzn7uhW"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="aWKDEajc"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id C8034580B15;
 Wed,  1 Sep 2021 05:19:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 01 Sep 2021 05:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=LPit8wcoZO4dv
 io5leaRKYe3Q9Z+NaV+MmDoHIcsCLg=; b=rmzn7uhWsmZKkqaq/gB7HPlw7NY3K
 ua44uo8ZOp4NlNUgUrz410VIHVMtBqfe75Q16DsQ0yYFTJkmujUuerOwc2ad4hDr
 /8YPCtz/OMKYjcQ/liZcCAx9yXfObbR713QMfU8FwipnHZxKl/Gpq6x55ZAsEaqk
 85w9Lt4El1VtsBsEurnoJa4NPJIlCmAdHTmWazSgQmDYIha6AhN0nF+UnicaWOk0
 ksLE6Kk0ZZ3Puz9jfSk6R/DQB8oYzUGE1JjUcuinpw9Ps/EJz5TwWwbkqi0xj0Zl
 fZTdOXj4GqWmojMmulhjvmRskTJIx9tRBPhfjLjCz0sWi3hKcD0YXI4dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=LPit8wcoZO4dvio5leaRKYe3Q9Z+NaV+MmDoHIcsCLg=; b=aWKDEajc
 8JwmukY+cVmpYsMMgF1Wy2oLQ6aJd//XcHzEfJe1OpQf6ompCIjEANLR042PiCiu
 RJ7RwT7Ru5HTMXTTHj6jZFJ/hb/ULYN0+iAbE3EKbofi7mpYqr14i/7/yQX4CfSl
 VlKDs8H4cO5cvDh7y9Y03V6J2qHFqofuV3NqWPWqR7vSxk4kPJsrD03aooPZKZxM
 SyOsAjfOFp5VY/5FlRTMAAO0HdBHh1tz7EbQSNE9LmHFX2GZoLO682bNt86u/4qm
 1oF7q1HV0EP2nsoCHh1XGmN5ar7+fKJA5j1jO++3lV2Z/idzQ4oB8IzUO7pW04Te
 kYlp5WdC2kpM1w==
X-ME-Sender: <xms:hUUvYXc2zgTpSI5463nv5w0M25Q8ZagVBueJuZ-tYhcLC_QtfG1fSQ>
 <xme:hUUvYdM2ZgAWP1K95tpm5u7mQS8tRbs6MH5hv4Xx9fKyGlNVPSBT30NZCW87abIjt
 e-3j2xWan2hRx1fVRU>
X-ME-Received: <xmr:hUUvYQhCq3xkBuCSY-89tVyiXrA7m0-Mw9jXcwUDO4PLm_pASHZY8JPUrV8F20z2Kyl-aH32Lm82yrm2FxpGEtf2owXE6WrVWxCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 govehorghsthgrlhdqhfeguddvqddtvdculdduhedtmdenucfjughrpefhvffufffkofgj
 fhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrg
 igihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeevjeeijedtvefg
 fffgjeeugffguedtleetkeegteeufedtuddttdfgfffhgfeuffenucffohhmrghinhepug
 gvvhhitggvthhrvggvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hUUvYY-5gQY4VDkb54X3ZN6iocababe40JGsLwqCuPWnKIupagEajg>
 <xmx:hUUvYTtACqBZqy3mjMrgHrjTGMXSl_tcSmv02MSirSfrqzx-UP-LyQ>
 <xmx:hUUvYXH3XDtla30eBRw7dNv-ZXznwdWwOOe6ZuDWioUowACWBzmRJA>
 <xmx:hUUvYUlXPYJgky2qaVpc1b4nZxXm7yFjqN1xB1iCB4pYwh_Wb6uGfg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 05:19:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: [PATCH v2 03/52] ASoC: dt-bindings: Convert SPDIF Transmitter binding
 to a schema
Date: Wed,  1 Sep 2021 11:18:03 +0200
Message-Id: <20210901091852.479202-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901091852.479202-1-maxime@cerno.tech>
References: <20210901091852.479202-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
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

The SPDIF Transmitter binding is used by Linux with a matching Device
Tree binding.

Now that we have the DT validation in place, let's convert the device
tree bindings for that driver over to a YAML schema.

Cc: alsa-devel@alsa-project.org
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../bindings/sound/linux,spdif-dit.yaml       | 32 +++++++++++++++++++
 .../bindings/sound/spdif-transmitter.txt      | 10 ------
 2 files changed, 32 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/linux,spdif-dit.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/spdif-transmitter.txt

diff --git a/Documentation/devicetree/bindings/sound/linux,spdif-dit.yaml b/Documentation/devicetree/bindings/sound/linux,spdif-dit.yaml
new file mode 100644
index 000000000000..c6b070e1d014
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/linux,spdif-dit.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/linux,spdif-dit.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dummy SPDIF Transmitter Device Tree Bindings
+
+maintainers:
+  - Mark Brown <broonie@kernel.org>
+
+properties:
+  compatible:
+    const: linux,spdif-dit
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - "#sound-dai-cells"
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    spdif-out {
+        #sound-dai-cells = <0>;
+        compatible = "linux,spdif-dit";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/spdif-transmitter.txt b/Documentation/devicetree/bindings/sound/spdif-transmitter.txt
deleted file mode 100644
index 55a85841dd85..000000000000
--- a/Documentation/devicetree/bindings/sound/spdif-transmitter.txt
+++ /dev/null
@@ -1,10 +0,0 @@
-Device-Tree bindings for dummy spdif transmitter
-
-Required properties:
-	- compatible: should be "linux,spdif-dit".
-
-Example node:
-
-	codec: spdif-transmitter {
-		compatible = "linux,spdif-dit";
-	};
-- 
2.31.1

