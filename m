Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C72BA2F4463
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 07:09:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 500D516EC;
	Wed, 13 Jan 2021 07:08:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 500D516EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610518144;
	bh=ffV5c01M3LSamckU9Pxq1xkcDd16fmApSZQFB/BEeaI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rVjY9xLcgvJbPBiE1BYB8Tbt6wSU3oL1NTDCpl1TJzsUW/bDFXQ30I+ck+ff6TD5I
	 6XKhsyP92cCyBbIqw6MoV58KbXENT0ADoJQrbZt94kp8XpCvDCvUOFkQHk/x9Cd7+g
	 AGvu9ZZnyt02gNoCLRY+APqnvftn5hTNARd61IhU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 441A0F8025F;
	Wed, 13 Jan 2021 07:06:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD05AF804C3; Wed, 13 Jan 2021 07:06:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F77BF80254
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 07:06:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F77BF80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="U4VZi+lc"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="cFjuIyEf"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 462D91B9B;
 Wed, 13 Jan 2021 01:06:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 13 Jan 2021 01:06:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=ZYsMQQjTX9JKz
 4LOeiCvHDrsib2JqS0VKF0I+SixF8c=; b=U4VZi+lct8w2G6VsOrcK7zGoJKcbC
 kGWNIrPrZRZ+rj5R8NsGFNkWgOeZorsqnWlfwayfi03kJs7qfJTs4y70TeYHsvDD
 cssjgQ7u68IYZwMSHteC2wAqdkyymobEe4WVX3eFMg3AUecEcraNOC5dWwVya8Pj
 MZkKgsQGExzGD82i+RRQWnFVCFRheihsswl6bpTyXUwMqRAcysa0VP8KJwwVUyy8
 8CrGz6oyU/sCeYwh9MtsTYgh831nIDiDyqxBXTocccW8Vwz6+rKP1B+cPWQn58my
 YkTR+Mnov1FiVNBEoqdtP7Dbuh32RzzkaS8ZZj21lsLgjBmP4P2D+QF0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=ZYsMQQjTX9JKz4LOeiCvHDrsib2JqS0VKF0I+SixF8c=; b=cFjuIyEf
 KiLkbZOzM4scyeolbk0h4n2Lq5ItD3HNFbvfYO18WUgfvrUYHntD/EipU/fobp11
 bB2COac2hxc8NUTVJbV2bw+/h5YgBkvP7HAbUlPP6U6AECoQgi36iG3Yqef9e5YJ
 AuStHMdihgPPzBz9X7d6g3b0SGnRHkZYxTs09Gv8vFpLF1IwL55o1qpz0WyFoMWv
 6xWkWpfUTV+LxJottYbAeIhNBpGBvbI7naqN/qyvbzHYhNpQNdOLkvGTmn13SrNi
 65oRZfUNduEwQ87Ggb6A1bfyfuyxR0jwkqduKasaf90IIh8PtCrLvEHkbSCxJ84a
 YKgvjQoW+KDVIg==
X-ME-Sender: <xms:2o3-X9uPIMapMoeIP2vKRbEqrVCQVDlyVeanoApqJ3tbOoBPFPeh2g>
 <xme:2o3-X2ce9mzGXbzWiiE3ALu18ncnplYgn2-f85aksaALMA0-cfdXJlbfe12ErZHiL
 AOr2UP0um-VJmrrFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:2o3-XwzUb9T4KuMkG2Rv4WDTldmj3YYNJ19ZIBhxCrbpvsYNVS8CBA>
 <xmx:2o3-X0N9ExQ14a_i43ax5KbBDrlcJO64zt4E3JE74mrZ3o860i83nQ>
 <xmx:2o3-X99L3t5EE7ldhWujsaSJYjBQ17xFhX5x5Ae_3TTduM5SK5wUxw>
 <xmx:2o3-X5TXK51F8FZwynQMGy45xeOJY0Z1JXrX8OYibC9MHq_MpVIp8kVLOG0>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4125924005D;
 Wed, 13 Jan 2021 01:06:18 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 4/7] arm64: dts: allwinner: a64: Add pinmux nodes for
 AIF2/AIF3
Date: Wed, 13 Jan 2021 00:06:12 -0600
Message-Id: <20210113060615.53088-5-samuel@sholland.org>
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

Now that the sun8i-codec driver supports AIF2 and AIF3, boards can use
them in DAI links. Add the necessary pinmux nodes.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index e788251e582f..4bba468d8ec2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -654,6 +654,18 @@ pio: pinctrl@1c20800 {
 			interrupt-controller;
 			#interrupt-cells = <3>;
 
+			/omit-if-no-ref/
+			aif2_pins: aif2-pins {
+				pins = "PB4", "PB5", "PB6", "PB7";
+				function = "aif2";
+			};
+
+			/omit-if-no-ref/
+			aif3_pins: aif3-pins {
+				pins = "PG10", "PG11", "PG12", "PG13";
+				function = "aif3";
+			};
+
 			csi_pins: csi-pins {
 				pins = "PE0", "PE2", "PE3", "PE4", "PE5", "PE6",
 				       "PE7", "PE8", "PE9", "PE10", "PE11";
-- 
2.26.2

