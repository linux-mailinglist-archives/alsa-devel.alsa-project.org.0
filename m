Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B39ED2F4468
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 07:10:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B0201725;
	Wed, 13 Jan 2021 07:09:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B0201725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610518234;
	bh=EYzow9Bvd38WgBVhSBaN6AdMK16Nx+CvrAQtCBm+6CE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CkxU+W6Qr+9YIXCmFohAwyuLu/GjLQHMVFBzExXkZkFYl1R7qNqrlGRJrDguaa57+
	 jsdKpKkGjGbuB1He8lsS9vMHNTQS0zUL3diLycXzJbFhPIeCFUKnvaqls4qDx37nxg
	 IfUVn78jmRzDJXbV225Z8CmBfhL07uQXVlu1oC0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67370F804EB;
	Wed, 13 Jan 2021 07:06:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98927F80254; Wed, 13 Jan 2021 07:06:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43683F801ED
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 07:06:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43683F801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="KeGNzJda"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="I+ll3Ibh"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 1318E1B99;
 Wed, 13 Jan 2021 01:06:20 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 13 Jan 2021 01:06:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=9cip7s1aFbMII
 yrk+2/l9sW3AVhWwueouG9RqkcinmI=; b=KeGNzJda1CU72Iy7QVydjqLvHebj9
 WFBl1fjCeI7lykworSTVFxE9n48qpKxQrX/3xjiP2s3c68lnvatFekmdpOHOB7Eb
 8NM7m3JhUItS4Ixv4mM4cL1UyHs4/AAp1gwhCm6S+bU3+xjr1ueALVvBF4JgTcWL
 yCJiY1Wf4HRo05wHWaFHO8AsrTC5W3FQYzcddl462EnbdSw00l6GHTwOH8J/sX9f
 k69ML16V1YqgYcp8Hx5kqKwEPiKWvzuHp10fofooqLXWjXMxG6jNyUYAfR5h8jKa
 gKRwcWc1k4hbFdgO/r4xM/FJXMjsFOoao4xQZ6+KHWEfbkZyuT6RgaYZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=9cip7s1aFbMIIyrk+2/l9sW3AVhWwueouG9RqkcinmI=; b=I+ll3Ibh
 RCxEFTUvQfGHqzRzp1HJEck4tXwh3VUAOyRtPxhkQUNchXdufYxHLFMtR3kHIey+
 4wCzNrFW5UFr/ThHjbKlbA8up8qNWwbH6ZnfKCcgybz4kaeFG6PCfzmCrwhuUCgD
 OggQxUCVXozjjJq3hqrgBZw/nFiFMadWxMrp6eOgc37HFwWJ3WBbIpq5iQsr3RkG
 UtLn82W9UE6k7gExrSgtFLnSu0R0lBIm0rG2cJIH/8xmNXi4LRp22l9g4BKUVMA/
 RDjuoZ2KXT5Es2Wi6H8/cwVRmyI5L6C+C+N9vQ4C6ysR0NqeVncLflRkqvQIeoHc
 243mCw2CRdRcDg==
X-ME-Sender: <xms:243-X8P1x61UUIsaiJxntKkZ24mO6DgWxTXFJYxoRJGYPWjOgLWwhg>
 <xme:243-X6bNhgD_P9W_TEegU5Q4LRx_HBM2VUMcYQ7zQdODJPRNGD5CQ5q_1Bm4y9tBP
 BvXJ7nlPwfpj5NNVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
 grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
 jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
 gvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
 rdhorhhg
X-ME-Proxy: <xmx:243-Xwq8rhOLnrnnQq69hOm6Ti5KBNwBZbU6NDkWLorlXDT_Wcrdgw>
 <xmx:243-X-aPWUzPbBnXOZaYO18j7kb4Ro2EVCdDwcaDs_cgC8n-35ipyA>
 <xmx:243-X4Rk1H-b7drw5mSCV9FjZU8TTK_WJ_o8CAOMq35BjsY15XFdfg>
 <xmx:243-X5C835T3mNqguixxiC6Yznd1z0ma-wWVOUhfSl7Z4sQsrY-LOT6qays>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2DAA7240065;
 Wed, 13 Jan 2021 01:06:19 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 6/7] arm64: dts: allwinner: pinephone: Add support for
 Bluetooth audio
Date: Wed, 13 Jan 2021 00:06:14 -0600
Message-Id: <20210113060615.53088-7-samuel@sholland.org>
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

The PinePhone has a Bluetooth chip with its PCM interface connected to
AIF3. Add the DAI link so headeset audio can be routed in hardware.

Even though the link is 16 bit PCM, configuring the link a 32-bit slot
is required for compatibility with AIF2, which also uses a 32-bit slot,
and which shares clock dividers with AIF3. Using equal clock frequencies
allows the modem and headset to be used at the same time.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 .../dts/allwinner/sun50i-a64-pinephone.dtsi   | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
index 2dfe9bae8c67..e0db2f1373bc 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
@@ -24,6 +24,11 @@ backlight: backlight {
 		/* Backlight configuration differs per PinePhone revision. */
 	};
 
+	bt_sco_codec: bt-sco-codec {
+		#sound-dai-cells = <1>;
+		compatible = "linux,bt-sco";
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -82,6 +87,8 @@ vibrator {
 };
 
 &codec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&aif3_pins>;
 	status = "okay";
 };
 
@@ -439,6 +446,23 @@ &sound {
 			"MIC1", "Internal Microphone",
 			"Headset Microphone", "HBIAS",
 			"MIC2", "Headset Microphone";
+
+	simple-audio-card,dai-link@2 {
+		format = "dsp_a";
+		frame-master = <&link2_codec>;
+		bitclock-master = <&link2_codec>;
+		bitclock-inversion;
+
+		link2_cpu: cpu {
+			sound-dai = <&bt_sco_codec 0>;
+		};
+
+		link2_codec: codec {
+			sound-dai = <&codec 2>;
+			dai-tdm-slot-num = <1>;
+			dai-tdm-slot-width = <32>;
+		};
+	};
 };
 
 &uart0 {
-- 
2.26.2

