Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DC422DB23
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Jul 2020 03:27:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5B1A168B;
	Sun, 26 Jul 2020 03:27:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5B1A168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595726875;
	bh=S2BAxCY7XZ2P897PVTA3VmjfM2ZdpNLH7S3Ji5kGsl0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AOLetuig6igBbjMGO6MiC6CpA71NgrTkUopvQ4NcYPoUM1EUe4Qj+gnVBp0ie4ccm
	 a8Briefwi395gw3idrXEm5aeHAjv15NGFeXQqEs5B/UwWa9lXQYPgYeK/7/dRAgDFg
	 N630fNxiaIU4XLZMYpUz4HvqHrN4wL9iGR2MoLt4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE9FCF8011F;
	Sun, 26 Jul 2020 03:26:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97444F8028D; Sun, 26 Jul 2020 03:26:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 910BCF8011F
 for <alsa-devel@alsa-project.org>; Sun, 26 Jul 2020 03:26:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 910BCF8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="lHVvSAw1"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="o561a/MA"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7384A58014B;
 Sat, 25 Jul 2020 21:26:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sat, 25 Jul 2020 21:26:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=Bc+s0nLaRpZIx
 yCBvQ4oj1VwkiAzKp+9hlsJuhGXWAM=; b=lHVvSAw1ZVEQfJMC1pDEJsvgNHUQC
 ToktL4COHMq/yhL+CXinpvhwck8N7ckpGHJoXgZAYW4+ZX+EACJHnGOZDE8N8dCu
 V8saNvMyvYjMsdCHLAorj2rKQZ6lU5hxsQvRIgt6DiBKLjfsOhwo+V+yqwdHNadP
 WFv9UrMrcwDiLgoJWK0pztN8TeivUK2wQQjrf2gNSZKnYF+IHvv3+tMRkfEV8WKF
 Ppx5V9wNX1el4R++U4QFa5GXmQ8gkl5cQ/qZygVTSTVayfQdakT39q5wuzGNilf7
 H/4Ex92+OvtrRIbnFNpL3HquZRt+rWhmwGr5dpUQYWDM4rDQp1mFnTyEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=Bc+s0nLaRpZIxyCBvQ4oj1VwkiAzKp+9hlsJuhGXWAM=; b=o561a/MA
 JTGnE42PW2YjZgncOVPhgWjXBBRDNPrA1jPhpaM+PahPWgglJvDF8F1CZCGB0dBK
 B3VEEGZzmjJG6rYW/P5T83fOTqnzHQyIGLXZ3OrDjxNSVnwHL7ygazZoUItBOQ1k
 zG391ZxWp0MGbFe0GvD7xgrJfI+6lEVEQHTuY+XhuXsTz8PxXFmIS793bMxuQJ0Y
 jko94yEe56rowUcECducoVe4KeTWeScfvlYLMK5rBaPqDBd2bRL5vyPx41IfuJ+O
 nmmvyBFtoRTQUx2q4UmTZUgf9pi61eW5er3hI3vPttPso+/6e4ug939s0UsCbHE+
 WavsLeGyMD87Mg==
X-ME-Sender: <xms:p9scX6QxgGqbunpekQBTatw5eZIHwmitByMoW1-uhaDl3BLMN2SwMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrheeigdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:p9scX_yWVMgMMUn_Fe5R6YbGcjJxFfzI3QqyQmYquCbxdsu4ZzJp4w>
 <xmx:p9scX30JW_vZ9B0qbbut9WlqEOlb4LVRFTx1vV4k3CBjW7pex6Xj2w>
 <xmx:p9scX2DEaDqJW1M2axr7KmV1Y0446X32Nealw3SmpcZfnqyGYJk8Cg>
 <xmx:qNscX2pC0afVfIF804Gnm4lhCY4u0ZoXlGf6inmLtdE4lEpeZeWThA>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id BFEF8306005F;
 Sat, 25 Jul 2020 21:25:58 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/7] ASoC: dt-bindings: Add a new compatible for the A64 codec
Date: Sat, 25 Jul 2020 20:25:51 -0500
Message-Id: <20200726012557.38282-2-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200726012557.38282-1-samuel@sholland.org>
References: <20200726012557.38282-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ondrej Jirman <megous@megous.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, Vasily Khoruzhick <anarsoul@gmail.com>,
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

The audio codecs in the A33 and A64 are both integrated variants of the
X-Powers AC100 codec. However, there are some differences between them
that merit having a separate compatible:
 - The A64 has a second DRC block, not present in the AC100 or A33.
 - The A33 has some extra muxing options for AIF1/2/3 in the
   AIF3_SGP_CTRL register, which are not present in the AC100 or A64.
 - The A33 is missing registers providing jack detection functionality.
 - The A33 is claimed to invert LRCK, but this is not seen on A64.

Since the driver will continue to work on the A64 using the A33
compatible, albeit without jack detection functionality and with
possibly inverted channels, as it does now, allow the A33 compatible
to be used as a fallback.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 .../bindings/sound/allwinner,sun8i-a33-codec.yaml           | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
index 55d28268d2f4..67405e6d8168 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
@@ -15,7 +15,11 @@ properties:
     const: 0
 
   compatible:
-    const: allwinner,sun8i-a33-codec
+    oneOf:
+      - items:
+          - const: allwinner,sun50i-a64-codec
+          - const: allwinner,sun8i-a33-codec
+      - const: allwinner,sun8i-a33-codec
 
   reg:
     maxItems: 1
-- 
2.26.2

