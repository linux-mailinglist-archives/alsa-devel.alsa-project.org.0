Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2546E3D10CD
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jul 2021 16:06:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84B5A16CA;
	Wed, 21 Jul 2021 16:05:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84B5A16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626876390;
	bh=Furpxcw/8zEOx332vF6MNwqpN8YKUoMWvNQznMGnC5g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dbF22KNydQXqvdlQsfQiAs/3s+zvomYSo13CFwEqEc4YK8FPlBiD6oZuzZ7hsU6wY
	 WtQa5gJ5P40qvFf4/CoTtC58C3IvrFFmqZVGxWVD/pYKoTIyNw83sfKlydFOcT3VLj
	 V5X16q2PLvs5sNajI67ALbWZ9OWJHcZl1GexTveA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4DB6F804E0;
	Wed, 21 Jul 2021 16:04:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C05EDF804DF; Wed, 21 Jul 2021 16:04:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6886F804AF
 for <alsa-devel@alsa-project.org>; Wed, 21 Jul 2021 16:04:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6886F804AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="HvM5/QR/"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="drgG6S4w"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 292DD580490;
 Wed, 21 Jul 2021 10:04:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 21 Jul 2021 10:04:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Zgr8SkjVXTrjP
 dHj3+VD3ABb0EW3DnHyVxtkzD126Ms=; b=HvM5/QR/XLaRiqW/Oa44U3Lcg0ZOo
 ks4S0jmu3Js4prSqj6992NNjB8FFMbXnqwXe7qg3a7V4goTfT07YplQ1SqNXXkBN
 +kmPU+gqWrv/pJZ456dss2K1lNCBvedxSvOEl/l93ATxjpmkpm+IX/pgAq4ABZsR
 WLsbbeXKyglZEeHt7rsdIbJMsen2cQBZ2NGF5EEGRPNrptZ8T1JrXOuh06hIHgw8
 KBsTG3xKHkFfEQq1dj7fEyIH5ie3NNOhfkv5Sn7leiOIxrqN/IddugggwU9Fj9uh
 Afc8xZ2GoyZhcQsi50mImlsr46B5SyK9Piust61/XKwpPRKe/U679LjIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Zgr8SkjVXTrjPdHj3+VD3ABb0EW3DnHyVxtkzD126Ms=; b=drgG6S4w
 t6w62hRF0ucNLlJHZbOxv6Q5007oCdB7qWAGH+dOmrSn+x7M18br8JakaNaD833l
 TATlebDmR6D7ODvfe90ECfcAw021Gsme6hkgJwcPtfAI044KPNgKxmHBgQ+jSjcS
 GOF1Ru4EG4xChV97dWWWS+mH1FogjsF8Ap1euEu0JcGvHRXTDsZA/YeS061QxNIH
 n1mccHruzcxh+QIsRWhmz56+NLVWeNXYixlvJ77WT572rOeqZ3NPSX1iWc2PINAB
 LDwhhK7GXFvDrRc3tMyhC70IElFN1UoTYF5W0YmdAt1kOMBOktXlK11fHZ1d0NqC
 r6QKU1TfsjMokw==
X-ME-Sender: <xms:cSn4YNqAk-Hq8Tgd2Vt14HU4RwDBnOqagtxPAjA6MP2ALbAhjq8TXw>
 <xme:cSn4YPrUf67Gkl90t_iN-pz8Dx2gGr6Yuf8uUFvHhM1vFovPwis6olUxaHptSkqeF
 wHw3DyRt_7Pk1LmUMA>
X-ME-Received: <xmr:cSn4YKOinj_-d5zvW70VCIJn0wYxMHKek_Cm2kOFgG9lzsas_-oIEuX0v_IX9dlpUOs5c-pDkWPZReeRkEI6eIQJw1imNLWJ3hgO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeeggdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 evohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffojghf
 ggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgi
 himhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepveejieejtdevgfff
 gfejuefggfeutdelteekgeetueeftddutddtgfffhffgueffnecuffhomhgrihhnpeguvg
 hvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cSn4YI4d0SkZPrmLLkXemkupi2aRYru2HwJU7wj17eIeLTPbMeHohg>
 <xmx:cSn4YM7twk1b5W6OAWeS6jQfHTBG_yrSEnLv1zRDMnZL5n8m2kTZiA>
 <xmx:cSn4YAjxdJxrn6NuR0KWjLDPQW6-K1KO6EMBtDQ3JsDfdW6MKX90dw>
 <xmx:cin4YJyPGNZ6_BCEI2tW10dvyYpuz0bxUNBm_MRULoQ3QvzDJsP3vA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 10:04:33 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@siol.net>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 02/54] ASoC: dt-bindings: Convert Bluetooth SCO Link binding
 to a schema
Date: Wed, 21 Jul 2021 16:03:32 +0200
Message-Id: <20210721140424.725744-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721140424.725744-1-maxime@cerno.tech>
References: <20210721140424.725744-1-maxime@cerno.tech>
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

The value expected for #sound-dai-cells wasn't documented though, and
the users were inconsistent. The example didn't list it, and across the
4 users we have in tree:
  - 1 had a cells value of 1, but using only 0 as argument
  - 1 had a cells value of 0,
  - 2 didn't have this property at all, behaving as if it was 0,

It seems like the consensus seems to be that it should be 0, so let's
enforce it.

Cc: alsa-devel@alsa-project.org
Cc: devicetree@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../devicetree/bindings/sound/bt-sco.txt      | 13 -------
 .../bindings/sound/linux,bt-sco.yaml          | 34 +++++++++++++++++++
 2 files changed, 34 insertions(+), 13 deletions(-)
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
index 000000000000..334b508205cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/linux,bt-sco.yaml
@@ -0,0 +1,34 @@
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
+    const: 0
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

