Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D7B22DB2A
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Jul 2020 03:31:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01922169D;
	Sun, 26 Jul 2020 03:30:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01922169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595727082;
	bh=yEweuUznnacCNhKbubYfIsyyfjQ29Ap1CbLQSmNhCuE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H1RCQJBQpyMvsDt6i0YEsgxNq8rpoeNujU9idVcjS4L544/iOjHy9HGgBpvNokkHh
	 AKZ21DZw+C+uaBZWhU13I2Apysh/eN3h8mBy/lNyvRD5U4hns5HJZDC1r9gA2LXsA/
	 DU4p7sImr7bU7VSfkS/kcC5UgaEEYuU8hZdiUdAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DF30F802F8;
	Sun, 26 Jul 2020 03:26:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9277DF80274; Sun, 26 Jul 2020 03:26:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A97EF80278
 for <alsa-devel@alsa-project.org>; Sun, 26 Jul 2020 03:26:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A97EF80278
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="uQ9MP1me"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="aNQnG+g5"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4387E580164;
 Sat, 25 Jul 2020 21:26:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sat, 25 Jul 2020 21:26:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=YLBWcIY6TfCMV
 PdscSUAAQmXF/LED3PLTtA8SMRgg/M=; b=uQ9MP1me7FmaTR2K42yzAka+XYdBm
 4qmxaTZTBv1xbMQRw2xBO4GHjMG156QP6M+h/W/unsk8MpYwaVpD759Bsb3ci00L
 ewk82NMvcn/s0rrlvo+MO9OGhyV8H+u9BH3P8DmtLrzZnxnzi8uztw96xvlgBFi7
 jE8BUDxodKrNtrpHQVQe5dTn740QWcLudXcseUgL1jBACwgfcNZJEGg/k+Y1sIHg
 3rxZkUPrfHQDjrDPBEVi4pF0/KDxicJCXa/ikFZGod9WKpcTeBbTy0fhCxerNs31
 SL51ASx9nq0xc6x+wHURcYZ5sanFVrEqoEsNQogyKIbJB3UmXlLCNMpQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=YLBWcIY6TfCMVPdscSUAAQmXF/LED3PLTtA8SMRgg/M=; b=aNQnG+g5
 zUTEg3Z+y46J089EY5sCOtfKVSGgpe9U0OCv+JnYvZoHmobstcZXo498LhxOwjoF
 M0rRwNwOEhmfitLOj6eqgWJ1IAbZ0kg9ps/JGSzOVh2Zd80JM8CqXDJb+7uvNkP4
 9YWDsTf/fdBAJlYO1OzXWV8Z6mc6MP3Kesiw2uFkK1LFZ+dRmSpjeEHgmvX03H6p
 R4cRfW6A9E3JPkAnaMHMqaTQXXRYus1hrzLjRuaBff1EKZsaCe24ntaptXAdxPt4
 xRxoknMh+YoLr8ocuvJ4ZgA95vlw0QuA36OrwAKqQMogytZ89owCYBBzwe3b9vlh
 av26fhdcEe4tGQ==
X-ME-Sender: <xms:qtscXxNb4QvAW1EcoT14EPyVgVigjkk6kcJw7qeXX_VH-SXF5Q1o8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrheeigdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:qtscXz_1QD7dZvgbinfZUNrrsCIxiL57oYJkxtfYNiKWO1687WElTQ>
 <xmx:qtscXwRec41C5XqeblvrE3T4we_k0bba0qWxLLOsnwVsoDPnfsNP2A>
 <xmx:qtscX9sLKkkwNexaJTlo8rCGeI-LpkrYFo5nK9wd7Y25V068_rHBtQ>
 <xmx:qtscX50kpVrmWviECX8au6aNb8QpHnm341ui2yzJCMTTW4DN65ZFYg>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5FFCD30600A3;
 Sat, 25 Jul 2020 21:26:01 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 5/7] ARM: dts: sun8i: a33: Update codec widget names
Date: Sat, 25 Jul 2020 20:25:55 -0500
Message-Id: <20200726012557.38282-6-samuel@sholland.org>
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

The sun8i-codec driver introduced a new set of DAPM widgets that more
accurately describe the hardware topology. Update the various device
trees to use the new widget names.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 arch/arm/boot/dts/sun8i-a33-olinuxino.dts | 4 ++--
 arch/arm/boot/dts/sun8i-a33.dtsi          | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-a33-olinuxino.dts b/arch/arm/boot/dts/sun8i-a33-olinuxino.dts
index 3d78169cdeed..a1953b2872d0 100644
--- a/arch/arm/boot/dts/sun8i-a33-olinuxino.dts
+++ b/arch/arm/boot/dts/sun8i-a33-olinuxino.dts
@@ -194,8 +194,8 @@ &sound {
 				    "Headphone", "Headphone Jack";
 	/* Board level routing. First 2 routes copied from SoC level */
 	simple-audio-card,routing =
-		"Left DAC", "AIF1 Slot 0 Left",
-		"Right DAC", "AIF1 Slot 0 Right",
+		"Left DAC", "DACL",
+		"Right DAC", "DACR",
 		"HP", "HPCOM",
 		"Headphone Jack", "HP",
 		"MIC1", "Microphone Jack",
diff --git a/arch/arm/boot/dts/sun8i-a33.dtsi b/arch/arm/boot/dts/sun8i-a33.dtsi
index cfd3858afb3e..c458f5fb124f 100644
--- a/arch/arm/boot/dts/sun8i-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a33.dtsi
@@ -189,8 +189,8 @@ sound: sound {
 		simple-audio-card,mclk-fs = <128>;
 		simple-audio-card,aux-devs = <&codec_analog>;
 		simple-audio-card,routing =
-			"Left DAC", "AIF1 Slot 0 Left",
-			"Right DAC", "AIF1 Slot 0 Right";
+			"Left DAC", "DACL",
+			"Right DAC", "DACR";
 		status = "disabled";
 
 		simple-audio-card,cpu {
-- 
2.26.2

