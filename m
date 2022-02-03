Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCBF4A7DA9
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Feb 2022 03:03:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D87C41736;
	Thu,  3 Feb 2022 03:02:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D87C41736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643853787;
	bh=YttEEs+ka11UZUpLC/YzW9tRpQ1dGZLwRYk/KyceJEY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SYW/234zS+JRWZwa9lGDjAmEfedukToU6akXWId71UZd1x20EDixO2ERwogtzZd4z
	 5SXxojEMuFFB3HahcSP7feTM3mI9sWWWO/bx3fXLfzitsHenxXiPeRllLNZG1YUTCM
	 X7AQXV9FxjM82UDY5NaMhGa5zdJ4W2xQQKocc/LI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C74DAF804B1;
	Thu,  3 Feb 2022 03:01:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DFBAF804CA; Thu,  3 Feb 2022 03:01:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9496F80130
 for <alsa-devel@alsa-project.org>; Thu,  3 Feb 2022 03:01:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9496F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="RtTRsm5c"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="JfB6PtSj"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id D92692B000A0;
 Wed,  2 Feb 2022 21:01:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 02 Feb 2022 21:01:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; bh=rC2+dZWDVrg0wkTDtOxg5tlnD87sB5
 niPnHeL+76N8E=; b=RtTRsm5ccdHYCt6pYg4g+jybxu7uBa97xf/a/6xOSLllrL
 CnzJig1qOlCD1+jiqzmnhAjlzLBRYUpt99qyDNrdL/T0FbCJcKrvvDCw9Uz0xCiB
 TJfDHU5vjWFIH21cFjFimwFhMONV6ocsXAnqOiu3lAz5Gyhu+F1kLeEfVL8SXfAN
 pay2c0cK+8UUG1v88LbALvlmNRadyQGC6fhTkFyNyrwM193Qzev4MfUwt2xFt6f6
 dUol2cWFIRbMd12T65AmnHj386YmYZXp+Cn9UCULcd6Xeen/WX2GcTbxmAaruBJc
 vVLK4s6Vja/25NxGE5lfLm5lZqLjKuZgGsWsA/4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=rC2+dZ
 WDVrg0wkTDtOxg5tlnD87sB5niPnHeL+76N8E=; b=JfB6PtSjmu4HPs3dy8BCSv
 83hEVERVV6jVnm17eI2yGSRKyVeonYsBlEJzmwhpKCh1bM5IQdLIOD5b+RocOgVh
 jWAYDZ1ZEXuwWvFdiLZHOiqKJUyUo8ehRTqdlyUydrg4jZ6d/ilZMwKXT54/T2X9
 U/g+7wlpea6Z/vM2G2qbExEUIeaFRVoK/5rBMOTzLLqSMcJwR9esOsybpcfB0maI
 eDB583AOR66cJ+Uv7TIxLJTIBAcxUlB0e++9SqELBW0ssiSXuaWpxVRH8GnK4Qaa
 r4vLg7qiA0yAJxWbT5gAEqbOEoZ2nJ1BLYYSz2xVlOq63SwdJxurk1cVUu3nd0Cw
 ==
X-ME-Sender: <xms:cTf7YbJZk2hnhaRw0clGcNu8C7foPna8BMsJPGsJoBJtyGRPFZP2Yg>
 <xme:cTf7YfI4YT2tO9ZOprr5s2ScfBoERiwAPlEs5HhZe0nrX_YNNfZ8ma5vV5l6iSvul
 bfO_H7UEoNJUjl1gw>
X-ME-Received: <xmr:cTf7YTsDB876hEtB6MEZjkhM3gmbS6HSIfMogHDJ1qQT1Upe6U_pY3Msj-gvTmjxd_G5wuic3eMwQC_J2Lj7jpUaVeQhxUYGHSHTix_kfq2A0YvDYTmzPiHR_LNmgrnRHBGRAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeeigdegudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:cTf7YUbOKm8xNJc-FOm2pIIjOMLb2XSm5bHeGOKK--o_9tXb71RVsg>
 <xmx:cTf7YSZ8WOMOsij8V5EJMI5lhhI7ZWZi8_iEdJCF2dm2cxPcl8ukQg>
 <xmx:cTf7YYCcJTRsv8dSRUtgJH4LXpXvIhcmpb6xEc4PT77xlQSu1vG3ng>
 <xmx:cjf7Yaph0RoKFsrmXbsKff3-sASK6_5EwpMWH5yNv180hJQQ1YG_Qq9GCNE>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Feb 2022 21:01:21 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/3] ASoC: dt-bindings: sun4i-i2s: Add compatibles for R329
 and D1
Date: Wed,  2 Feb 2022 20:01:13 -0600
Message-Id: <20220203020116.12279-2-samuel@sholland.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220203020116.12279-1-samuel@sholland.org>
References: <20220203020116.12279-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, Takashi Iwai <tiwai@suse.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

R329 contains I2S controllers which are similar to, but are incompatible
with, the H6 variant, because they change the layout of the RX channel
mapping registers. The D1 contains I2S controllers which appear to be
identical to those in the R329.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 .../devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
index 7d48ea094c66..c21c807b667c 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml
@@ -31,6 +31,10 @@ properties:
           - const: allwinner,sun50i-a64-i2s
           - const: allwinner,sun8i-h3-i2s
       - const: allwinner,sun50i-h6-i2s
+      - const: allwinner,sun50i-r329-i2s
+      - items:
+          - const: allwinner,sun20i-d1-i2s
+          - const: allwinner,sun50i-r329-i2s
 
   reg:
     maxItems: 1
@@ -67,6 +71,7 @@ allOf:
               - allwinner,sun8i-h3-i2s
               - allwinner,sun50i-a64-codec-i2s
               - allwinner,sun50i-h6-i2s
+              - allwinner,sun50i-r329-i2s
 
     then:
       required:
-- 
2.33.1

