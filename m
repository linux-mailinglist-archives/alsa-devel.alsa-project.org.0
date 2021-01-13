Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DED7C2F4465
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 07:09:26 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 637BC1729;
	Wed, 13 Jan 2021 07:08:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 637BC1729
Authentication-Results: alsa0.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="K5JtOKfG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="F2uVzt61"
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18A57F804D2;
	Wed, 13 Jan 2021 07:06:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDAB2F80085; Wed, 13 Jan 2021 07:06:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 373BEF8016D
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 07:06:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 373BEF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="K5JtOKfG"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="F2uVzt61"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 7DFA91B92;
 Wed, 13 Jan 2021 01:06:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 13 Jan 2021 01:06:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=satIn0D2dr0dK
 CzgUTF/ukd8o810xusPKG6T6TQ2h4M=; b=K5JtOKfG3NC+IAjv19T8b28kPDuA3
 ExXfYx4Tn8eRhY25upypD8x9h2lbAskvmAncoKCz5asRvwgENm9cIoDNiSA9OfdU
 oZ1Ff9ChwTftwyi6ZSQm/OVeIqquwzIr38CR3jA05f/UFYCztGSGBWPtNzRw7///
 oDCJTbqMTQO/vJ/7XEmre+iT5Rh1yAfC5eazdz9T7nEz6aZ2O3zL/wrKbG2bkYKL
 P5w6vfJawiT69lNvyNuYvZi2GPJgVI2q9Z1pixBuu069Y5I6YAPQ2F9xmfgbcZlB
 LMHQY+b5YgOyonV6miZGUN4797CdV3a/Qu6qP7mcvdboyNLLKzuu5Kf/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=satIn0D2dr0dKCzgUTF/ukd8o810xusPKG6T6TQ2h4M=; b=F2uVzt61
 cK13UPu9AOkV4FGVyEjgs5sg6m17AeksdwVEWKWkWP7BSmXHOCVAtgi+I/ZSpHsn
 6xuhXBpZ5NpAYvW3uMs7oVraR8CMTEMcy7Fq4DQT1QpxSds6GZ7FYsMJeRrMTUS2
 sbEyZ+WxBOZaEHghVhCKza6blKIrkbKfBWy7SkHE69acNY2tt5qddPHb+kltxRQm
 S7rmRTgBsXc4AOpqEVjRmOGl2ZrvtQpYt+EaFCjwBHoAlZWQQotOlNhGAvxooC8D
 H+Oj/HabK2cKYLPlWb4oxHwlv68+BxuEbllJ7VWFArf/ZhxbXFGvvAavqZLqxyJP
 GjLDUSLAMXIAPA==
X-ME-Sender: <xms:2Y3-X4xRUW5RlDumjdVpeEvlvVUpFQH3WnTtOMehRD20t7qyEx9qLQ>
 <xme:2Y3-X8Sc6eQ7zW18Tdd1aRPNM_q0Gc1BFJzPdWKXDdmP6zU5R7gF3NdGswLx0NToc
 xnTwwxa3Tzv1nXXIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:2Y3-X6UvYM6OGfEyZJjhUyHs3kmfUrzIxAVcqiG4HmElmM7N7-nHJQ>
 <xmx:2Y3-X2jzwZDojQPbW57-XLQ8EQdq9BrteyFwtCgFt6DLtOLM69VWnQ>
 <xmx:2Y3-X6DXZ7Ms5-M3-MCSF-F1N-ykKGLWrmNISzejbmORFWowjNI7xQ>
 <xmx:2o3-X21LPtXpFaxTxlqn2etkgNrXdgt9d8ZNaOEMKbGXbVLIWXSsouQYG_o>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id D504F24005B;
 Wed, 13 Jan 2021 01:06:16 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/7] ASoC: dt-bindings: sun8i-codec: Increase
 #sound-dai-cells
Date: Wed, 13 Jan 2021 00:06:09 -0600
Message-Id: <20210113060615.53088-2-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210113060615.53088-1-samuel@sholland.org>
References: <20210113060615.53088-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Samuel Holland <samuel@sholland.org>
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

Increase sound-dai-cells to 1 to allow using the DAIs in the codec
corresponding to AIF2 and AIF3.

The generic ASoC OF code supports a #sound-dai-cells value of 0 or 1
with no impact to the driver, so this is a backward-compatible change.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 .../devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
index 67405e6d8168..3e02baa1d9ce 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
@@ -12,7 +12,7 @@ maintainers:
 
 properties:
   "#sound-dai-cells":
-    const: 0
+    const: 1
 
   compatible:
     oneOf:
@@ -50,7 +50,7 @@ additionalProperties: false
 examples:
   - |
     audio-codec@1c22e00 {
-      #sound-dai-cells = <0>;
+      #sound-dai-cells = <1>;
       compatible = "allwinner,sun8i-a33-codec";
       reg = <0x01c22e00 0x400>;
       interrupts = <0 29 4>;
-- 
2.26.2

