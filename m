Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A01922DB2B
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Jul 2020 03:32:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C318F1687;
	Sun, 26 Jul 2020 03:31:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C318F1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595727125;
	bh=3G+r3KS0BzVkV6/u800GjTa4cG8mvoxdWLAS8lmC5OE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NSxAkAWSjb+rtsvFVzMQ0Lj3s3ri2gSpfwCNNfHILcOBgB0JyPJqYzJYn9PMfJ4FN
	 FN/tcW9AIXAUWNFS4/gE5vpFoKklIxNzQDh1DCQcNIcJ/x+VkvvDL/7HoomJjdsQ5j
	 T51MrgeCkTV4etiSfX1VDdbAwrJNKrmfaal01Te4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CA45F802FF;
	Sun, 26 Jul 2020 03:26:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF1C9F800C7; Sun, 26 Jul 2020 03:26:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79150F8024A
 for <alsa-devel@alsa-project.org>; Sun, 26 Jul 2020 03:26:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79150F8024A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="PJ+Oa5kH"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Dad5MuFu"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 981225803EA;
 Sat, 25 Jul 2020 21:26:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sat, 25 Jul 2020 21:26:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=zniOgjBVDjzwc
 FzCQ5VisrbxqLW88v+7YjNv2U8VdwA=; b=PJ+Oa5kHxTGVKa819xKyIo9XhUpsy
 MxV1xREn35tIJHEmvXnk4bSUpYej2kQxCs5TGocTZIlVDK+a81PnIWtvbD17kGbv
 4Q/LoQrnwWQ1qF8gB1BnyuD5KUeE71sv1KK/Utnri2sFf3B5BDbMCtXMX8E4/8Pb
 VVKdsAublimntYRqoKx7PpErVgdQ6xVEUI7nRF5eNF0Or0elERDEIzm/NKLpiI4N
 LIma/rXTpDh9Az+NHHDyFr3AyG0QYXtF6Oyz/m81YkNA1kz7W69XQeQxTonrio/I
 cY8tL7HvZvMmA1bDkiZA2+obq9bzSM0p5GHh7D4cOJhDvHcBhfYqIXylw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=zniOgjBVDjzwcFzCQ5VisrbxqLW88v+7YjNv2U8VdwA=; b=Dad5MuFu
 Zt9T4DR+KMBf0RjbT33sRMx+RDHITZrRUbj/jWkv7ClbLMQbvNtqZ/mknWj3kLvU
 dHav/m56nYJGkL91ssmqMJa5cqqC6ZsSJOHRCI0FJIzd9e4RuGtPNUUJUaC6u+Ja
 lRpPpAq59A25qEidDFCdyyQtdUcjymb3u4BwybDefZyQsZ/yXZiCguXSMYgSYA8h
 p3BnHRmnPhMixmH4Y5OeghWhkvS7ENk/aOgy7M6ie56CNnqz11gYSn3corOl7jkC
 ct8PZPRpRwr45MfxB6UB1Fb0tJtlvxfE1qI+V0YCn0opBrZZmtj2NfTq2wdQ32xc
 anFK+Z09L13Akg==
X-ME-Sender: <xms:q9scX3NLQiLSwwwDLMlSMjFjpV7e4wzgKMFBRIS80JXh1ZgTY7aWAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrheeigdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:q9scXx-O_bW0wcoE6PUKU3yhzMZyuhF9ArPOsA77dVp-a3yOJ5jjlg>
 <xmx:q9scX2S1mSjwM3krrgOInygqr9fwrWBeEHvNT4Sg48ibpuojhAIh1g>
 <xmx:q9scX7t_fZdBbgBizTZGFZXTV5Aag0Kl7zy2o7Z9jdiMh0BZtz60DQ>
 <xmx:q9scX33jxQHmADYspKGKdWEVdq0ygykFhRPt3O32RHjuX8xAHnWYNA>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id C641A30600A9;
 Sat, 25 Jul 2020 21:26:02 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 7/7] arm64: dts: allwinner: a64: Update the audio codec
 compatible
Date: Sat, 25 Jul 2020 20:25:57 -0500
Message-Id: <20200726012557.38282-8-samuel@sholland.org>
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

The audio codec in the A64 has some differences from the A33 codec, so
it needs its own compatible. Since the two codecs are similar, the A33
codec compatible is kept as a fallback.

Using the correct compatible fixes a channel inversion issue and cleans
up some DAPM widgets that are no longer used.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 73ae7656e0f3..26df6278dfb7 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -860,7 +860,8 @@ dai: dai@1c22c00 {
 
 		codec: codec@1c22e00 {
 			#sound-dai-cells = <0>;
-			compatible = "allwinner,sun8i-a33-codec";
+			compatible = "allwinner,sun50i-a64-codec",
+				     "allwinner,sun8i-a33-codec";
 			reg = <0x01c22e00 0x600>;
 			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_CODEC>, <&ccu CLK_AC_DIG>;
-- 
2.26.2

