Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C53BD160B23
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 07:52:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A80316A0;
	Mon, 17 Feb 2020 07:52:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A80316A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581922371;
	bh=vfOEPtTKUKPwykrRYY+0F1/NEJXrn3PifabGvz9Q8zs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sg7z11adNMXQk+RYP2VPpJKNz6zwXtdMJSih/3rhrVG3yT61J+TpEfUZOtnGvD/O3
	 TUpLmHsbI5h+Ea27cfwYNcINWmVdzqc2s+nA/25a4t295ry6CkMxbfOF9yYk7yAU3e
	 k00ArPa6XHQVM6GYCSXUonfPvfIJw8aEAA/xp0Y0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0EE1F802BC;
	Mon, 17 Feb 2020 07:43:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E93A5F802E9; Mon, 17 Feb 2020 07:43:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C10FAF800C4
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 07:42:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C10FAF800C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="rK+0jnFZ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="NWAEYWr2"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id E370654A2;
 Mon, 17 Feb 2020 01:42:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 17 Feb 2020 01:42:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=TXf0lfAtb4rRF
 Ni9agpOJv1cy7bdJ7z+lKiIOMYKFRA=; b=rK+0jnFZp13oBQcu+pqVBGbd3HNre
 aV2iPpX/loPJsci/AK0iKBIUCY+vUjFH0LJf0mBRDHX0z3M6GJeu508UwHtGEYIe
 Cs2vkNNRMBkyDhJ2qqlOiJxN9yXx0+xxtixykDc+NBFg2QQ+PVPjqp+w3dpDj9Iw
 txhb7AkxFUg68Z22VyK2Y3+3tAhmhUXlcFVX/4Tvar3H7Fd+MYqRdQVq7wOLu7f1
 Ti9P1lClkif75RFGafVqwn9ZfoxKLqO6/bBdye7j3nFmi2uaoUNQa7YQuuQIoQfC
 NAd/94Mn5RNs1hicNqcVOhbb4+sQ/dznYyy3x11+GWP4I2KX2jXRbnJew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=TXf0lfAtb4rRFNi9agpOJv1cy7bdJ7z+lKiIOMYKFRA=; b=NWAEYWr2
 7U4toEUeUGZmjUSG/8s7Za4lwJeL/jqZHM6NrycfFDL635bCJs1nP/qcjGlkOiXK
 Ob5f3BeYm3LUUKj+1tdd4WToCEtd26lAa1k7Txfjw0WB2WJcOL5nF+BIUa6ZdWe7
 vfwJ0c83PJfyZATWhdQlMo7uJEOK6UZHx4UEvXMbQ42lpLli/gR2zv6kyY2AWIj7
 gy8hRfnq/mZMGKJCGwB4MjXNsg06FRJQd5uNqJVdandi9PyoDgIC0z9tJVlaGnvk
 25h2ErA7uVXpMduYo8/+HqTE5huyECCjeEYOOLcT0BP8lM5dHlOUKy0xa7GITNtC
 9IEhzjsUndBO1g==
X-ME-Sender: <xms:8DVKXpn0LaUv27FsVpjFo1uIgg5pQmKe8d399ZNbZIisbU_e4IGfqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjeehgdelkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
 ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
 ejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpeejnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:8DVKXoKJ8L9EVyPsRKW5IkimDSPeuR9lrmmntQLnRUwgyglH_jOuyg>
 <xmx:8DVKXjsCBWOQSg8jXYAhATrieZjoovwYCBXunZDGB3V7N8U9711ObA>
 <xmx:8DVKXv8-VhY8ox1A7F1Mnd6o1u_BOMBlpEIBO_omaooohhthbz5N3g>
 <xmx:8DVKXso5pqpS7COk_zaunYEGsQh0wVhucTzEEv5gTLLqA9S38o6MHA>
Received: from titanium.stl.sholland.net
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 26CD43280059;
 Mon, 17 Feb 2020 01:42:56 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Feb 2020 00:42:25 -0600
Message-Id: <20200217064250.15516-10-samuel@sholland.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200217064250.15516-1-samuel@sholland.org>
References: <20200217064250.15516-1-samuel@sholland.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 stable@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [RFC PATCH 09/34] ASoC: sun8i-codec: Fix broken DAPM
	routing
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The A33/A64 digital codec has 4 physical inputs and 4 physical outputs:
3 AIFs (DAIs) and one ADC/DAC pair. Every input and output has a volume
control for each channel in that connection. Furthermore, every input
and output has a mono/stereo mux of some sort. Internal routing is
accomplished by a 4-channel mixer connected to each output.

This commit provides the minimal necessary changes to the driver's
device tree ABI, so that the driver can begin to describe the full
hardware topology.

Currently the driver works mostly by accident. The DAPM routes currently
in the various device trees specify the AIF1 widgets, not the ADC or DAC
widgets they should have.

For Playback, the correct topology is:

    (CPU) -> AIF1 DA0 -> DAC Mixer -> DAC (digital) -> DAC (analog)

but the driver and device trees currently describe:

    (CPU) -> AIF1 DA0 -> DAC (analog)
                    \--> DAC Mixer -> ???

For Capture, the situation is worse, because the Mixer route is
backward. The topology should be:

    ADC (analog) -> ADC (digital) -> AIF1 AD0 Mixer -> AIF1 AD0 -> (CPU)

but the driver and device trees currently describe:

    ADC (analog) -> AIF1 AD0 -> (CPU)
                           \--> ADC Mixer -> ???

The reason that DAPM powers on the ADC/DAC at all is the supply routes
that make AIF1 AD0 depend on the ADC running, and AIF1 DA0 depend on the
DAC running. However, neither of these supplies are correct based on the
hardware topology: there is a route directly from the ADC to the DAC,
controlled by the "ADC Digital DAC Playback Switch". It doesn't work
(and wouldn't work if a route was added in the device tree), because
AIF1 isn't used in the route:

   ADC (analog) -> ADC (dig) -> DAC Mixer -> DAC (dig) -> DAC (analog)

so neither the ADC nor the DAC are powered up. Similarly, there are
routes between AIF2/3 and the ADC/DAC (and each other) that should work
without involving AIF1.

DAPM needs to represent the real hardware topology so the driver can be
extended to support AIF2 and AIF3 and the other codec features. To do
this, new ADC and DAC widgets are added. Only the minimal necessary
routes for AIF1 -> DAC playback and ADC -> AIF1 capture are included, to
keep this commit easier to backport.

Cc: stable@kernel.org
Fixes: 36c684936fae ("ASoC: Add sun8i digital audio codec")
Fixes: eda85d1fee05 ("ASoC: sun8i-codec: Add ADC support for a33")
Fixes: 9ee325d029c4 ("ASoC: sun8i-codec: add missing route for ADC")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 arch/arm/boot/dts/sun8i-a33-olinuxino.dts     |  6 ++--
 arch/arm/boot/dts/sun8i-a33.dtsi              |  6 ++--
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts |  8 ++---
 .../dts/allwinner/sun50i-a64-orangepi-win.dts |  8 ++---
 .../boot/dts/allwinner/sun50i-a64-pine64.dts  |  8 ++---
 .../dts/allwinner/sun50i-a64-pinebook.dts     |  8 ++---
 .../boot/dts/allwinner/sun50i-a64-pinetab.dts | 14 ++++----
 .../allwinner/sun50i-a64-sopine-baseboard.dts |  8 ++---
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts |  8 ++---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi |  8 ++---
 sound/soc/sunxi/sun8i-codec.c                 | 34 +++++++++++++++----
 11 files changed, 71 insertions(+), 45 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-a33-olinuxino.dts b/arch/arm/boot/dts/sun8i-a33-olinuxino.dts
index 3d78169cdeed..306f141772ff 100644
--- a/arch/arm/boot/dts/sun8i-a33-olinuxino.dts
+++ b/arch/arm/boot/dts/sun8i-a33-olinuxino.dts
@@ -194,10 +194,12 @@ &sound {
 				    "Headphone", "Headphone Jack";
 	/* Board level routing. First 2 routes copied from SoC level */
 	simple-audio-card,routing =
-		"Left DAC", "AIF1 Slot 0 Left",
-		"Right DAC", "AIF1 Slot 0 Right",
 		"HP", "HPCOM",
 		"Headphone Jack", "HP",
+		"Left DAC", "DAC Left",
+		"Right DAC", "DAC Right",
+		"ADC Left", "Left ADC",
+		"ADC Right", "Right ADC",
 		"MIC1", "Microphone Jack",
 		"Microphone Jack", "MBIAS";
 	status = "okay";
diff --git a/arch/arm/boot/dts/sun8i-a33.dtsi b/arch/arm/boot/dts/sun8i-a33.dtsi
index 1532a0e59af4..40b903fa73da 100644
--- a/arch/arm/boot/dts/sun8i-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a33.dtsi
@@ -189,8 +189,10 @@ sound: sound {
 		simple-audio-card,mclk-fs = <128>;
 		simple-audio-card,aux-devs = <&codec_analog>;
 		simple-audio-card,routing =
-			"Left DAC", "AIF1 Slot 0 Left",
-			"Right DAC", "AIF1 Slot 0 Right";
+			"Left DAC", "DAC Left",
+			"Right DAC", "DAC Right",
+			"ADC Left", "Left ADC",
+			"ADC Right", "Right ADC";
 		status = "disabled";
 
 		simple-audio-card,cpu {
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
index 208373efee49..8645b1d2facb 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
@@ -353,11 +353,11 @@ &sound {
 				    "Microphone", "Microphone Jack",
 				    "Microphone", "Onboard Microphone";
 	simple-audio-card,routing =
-			"Left DAC", "AIF1 Slot 0 Left",
-			"Right DAC", "AIF1 Slot 0 Right",
-			"AIF1 Slot 0 Left ADC", "Left ADC",
-			"AIF1 Slot 0 Right ADC", "Right ADC",
 			"Headphone Jack", "HP",
+			"Left DAC", "DAC Left",
+			"Right DAC", "DAC Right",
+			"ADC Left", "Left ADC",
+			"ADC Right", "Right ADC",
 			"MIC2", "Microphone Jack",
 			"Onboard Microphone", "MBIAS",
 			"MIC1", "Onboard Microphone";
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
index f54a415f2e3b..027aa55625af 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-orangepi-win.dts
@@ -352,11 +352,11 @@ &sound {
 				    "Microphone", "Microphone Jack",
 				    "Microphone", "Onboard Microphone";
 	simple-audio-card,routing =
-			"Left DAC", "AIF1 Slot 0 Left",
-			"Right DAC", "AIF1 Slot 0 Right",
-			"AIF1 Slot 0 Left ADC", "Left ADC",
-			"AIF1 Slot 0 Right ADC", "Right ADC",
 			"Headphone Jack", "HP",
+			"Left DAC", "DAC Left",
+			"Right DAC", "DAC Right",
+			"ADC Left", "Left ADC",
+			"ADC Right", "Right ADC",
 			"MIC2", "Microphone Jack",
 			"Onboard Microphone", "MBIAS",
 			"MIC1", "Onboard Microphone";
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
index 409523cb0950..749c864b88ae 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
@@ -283,11 +283,11 @@ &sound {
 	simple-audio-card,widgets = "Microphone", "Microphone Jack",
 				    "Headphone", "Headphone Jack";
 	simple-audio-card,routing =
-			"Left DAC", "AIF1 Slot 0 Left",
-			"Right DAC", "AIF1 Slot 0 Right",
 			"Headphone Jack", "HP",
-			"AIF1 Slot 0 Left ADC", "Left ADC",
-			"AIF1 Slot 0 Right ADC", "Right ADC",
+			"Left DAC", "DAC Left",
+			"Right DAC", "DAC Right",
+			"ADC Left", "Left ADC",
+			"ADC Right", "Right ADC",
 			"MIC2", "Microphone Jack";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
index 78c82a665c84..07f5b86906ed 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinebook.dts
@@ -319,15 +319,15 @@ &sound {
 				    "Headphone", "Headphone Jack",
 				    "Speaker", "Internal Speaker";
 	simple-audio-card,routing =
-			"Left DAC", "AIF1 Slot 0 Left",
-			"Right DAC", "AIF1 Slot 0 Right",
 			"Speaker Amp INL", "LINEOUT",
 			"Speaker Amp INR", "LINEOUT",
 			"Internal Speaker", "Speaker Amp OUTL",
 			"Internal Speaker", "Speaker Amp OUTR",
 			"Headphone Jack", "HP",
-			"AIF1 Slot 0 Left ADC", "Left ADC",
-			"AIF1 Slot 0 Right ADC", "Right ADC",
+			"Left DAC", "DAC Left",
+			"Right DAC", "DAC Right",
+			"ADC Left", "Left ADC",
+			"ADC Right", "Right ADC",
 			"Internal Microphone Left", "MBIAS",
 			"MIC1", "Internal Microphone Left",
 			"Internal Microphone Right", "HBIAS",
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
index 316e8a443913..463b998b3f24 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts
@@ -421,15 +421,15 @@ &sound {
 				    "Headphone", "Headphone Jack",
 				    "Speaker", "Internal Speaker";
 	simple-audio-card,routing =
-			"Left DAC", "AIF1 Slot 0 Left",
-			"Right DAC", "AIF1 Slot 0 Right",
-			"Speaker Amp INL", "LINEOUT",
-			"Speaker Amp INR", "LINEOUT",
+			"Headphone Jack", "HP",
 			"Internal Speaker", "Speaker Amp OUTL",
 			"Internal Speaker", "Speaker Amp OUTR",
-			"Headphone Jack", "HP",
-			"AIF1 Slot 0 Left ADC", "Left ADC",
-			"AIF1 Slot 0 Right ADC", "Right ADC",
+			"Speaker Amp INL", "LINEOUT",
+			"Speaker Amp INR", "LINEOUT",
+			"Left DAC", "DAC Left",
+			"Right DAC", "DAC Right",
+			"ADC Left", "Left ADC",
+			"ADC Right", "Right ADC",
 			"Internal Microphone Left", "MBIAS",
 			"MIC1", "Internal Microphone Left",
 			"Internal Microphone Right", "HBIAS",
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
index 920103ec0046..22c937b848d3 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
@@ -199,11 +199,11 @@ &sound {
 	simple-audio-card,widgets = "Microphone", "Microphone Jack",
 				    "Headphone", "Headphone Jack";
 	simple-audio-card,routing =
-			"Left DAC", "AIF1 Slot 0 Left",
-			"Right DAC", "AIF1 Slot 0 Right",
 			"Headphone Jack", "HP",
-			"AIF1 Slot 0 Left ADC", "Left ADC",
-			"AIF1 Slot 0 Right ADC", "Right ADC",
+			"Left DAC", "DAC Left",
+			"Right DAC", "DAC Right",
+			"ADC Left", "Left ADC",
+			"ADC Right", "Right ADC",
 			"MIC2", "Microphone Jack";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
index 970415106dcf..812fb47b833b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
@@ -326,15 +326,15 @@ &sound {
 				    "Microphone", "Internal Microphone",
 				    "Speaker", "Internal Speaker";
 	simple-audio-card,routing =
-			"Left DAC", "AIF1 Slot 0 Left",
-			"Right DAC", "AIF1 Slot 0 Right",
-			"AIF1 Slot 0 Left ADC", "Left ADC",
-			"AIF1 Slot 0 Right ADC", "Right ADC",
 			"Headphone Jack", "HP",
 			"Speaker Amp INL", "LINEOUT",
 			"Speaker Amp INR", "LINEOUT",
 			"Internal Speaker", "Speaker Amp OUTL",
 			"Internal Speaker", "Speaker Amp OUTR",
+			"Left DAC", "DAC Left",
+			"Right DAC", "DAC Right",
+			"ADC Left", "Left ADC",
+			"ADC Right", "Right ADC",
 			"Internal Microphone", "MBIAS",
 			"MIC1", "Internal Microphone",
 			"Headset Microphone", "HBIAS",
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 6d7aa1736d21..5b688687a2b2 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -165,10 +165,10 @@ sound: sound {
 		simple-audio-card,mclk-fs = <128>;
 		simple-audio-card,aux-devs = <&codec_analog>;
 		simple-audio-card,routing =
-				"Left DAC", "AIF1 Slot 0 Left",
-				"Right DAC", "AIF1 Slot 0 Right",
-				"AIF1 Slot 0 Left ADC", "Left ADC",
-				"AIF1 Slot 0 Right ADC", "Right ADC";
+				"Left DAC", "DAC Left",
+				"Right DAC", "DAC Right",
+				"ADC Left", "Left ADC",
+				"ADC Right", "Right ADC";
 		status = "disabled";
 
 		cpudai: simple-audio-card,cpu {
diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 83c812742cc1..dca6f4b9d4b8 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -406,6 +406,10 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 			     SUN8I_AIF1_ADCDAT_CTRL,
 			     SUN8I_AIF1_ADCDAT_CTRL_AIF1_DA0R_ENA, 0),
 
+	/* Main DAC Outputs (connected to analog codec DAPM context) */
+	SND_SOC_DAPM_PGA("DAC Left", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("DAC Right", SND_SOC_NOPM, 0, 0, NULL, 0),
+
 	/* DAC and ADC Mixers */
 	SOC_MIXER_ARRAY("Left Digital DAC Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_dac_mixer_controls),
@@ -416,6 +420,10 @@ static const struct snd_soc_dapm_widget sun8i_codec_dapm_widgets[] = {
 	SOC_MIXER_ARRAY("Right Digital ADC Mixer", SND_SOC_NOPM, 0, 0,
 			sun8i_input_mixer_controls),
 
+	/* Main ADC Inputs (connected to analog codec DAPM context) */
+	SND_SOC_DAPM_PGA("ADC Left", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA("ADC Right", SND_SOC_NOPM, 0, 0, NULL, 0),
+
 	/* Clocks */
 	SND_SOC_DAPM_SUPPLY("MODCLK AFI1", SUN8I_MOD_CLK_ENA,
 			    SUN8I_MOD_CLK_ENA_AIF1, 0, NULL, 0),
@@ -460,9 +468,23 @@ static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 	{ "MODCLK ADC", NULL, "RST ADC" },
 	{ "ADC", NULL, "MODCLK ADC" },
 
+	/* AIF "ADC" Output Routes */
+	{ "AIF1 Slot 0 Left ADC", NULL, "Left Digital ADC Mixer" },
+	{ "AIF1 Slot 0 Right ADC", NULL, "Right Digital ADC Mixer" },
+
+	{ "AIF1 Slot 0 Left ADC", NULL, "MODCLK AIF1" },
+	{ "AIF1 Slot 0 Right ADC", NULL, "MODCLK AIF1" },
+
+	/* AIF "DAC" Input Routes */
+	{ "AIF1 Slot 0 Left", NULL, "MODCLK AIF1" },
+	{ "AIF1 Slot 0 Right", NULL, "MODCLK AIF1" },
+
 	/* DAC Routes */
-	{ "AIF1 Slot 0 Right", NULL, "DAC" },
-	{ "AIF1 Slot 0 Left", NULL, "DAC" },
+	{ "DAC Left", NULL, "Left Digital DAC Mixer" },
+	{ "DAC Right", NULL, "Right Digital DAC Mixer" },
+
+	{ "DAC Left", NULL, "DAC" },
+	{ "DAC Right", NULL, "DAC" },
 
 	/* DAC Mixer Routes */
 	{ "Left Digital DAC Mixer", "AIF1 Slot 0 Digital DAC Playback Switch",
@@ -471,14 +493,14 @@ static const struct snd_soc_dapm_route sun8i_codec_dapm_routes[] = {
 	  "AIF1 Slot 0 Right"},
 
 	/* ADC Routes */
-	{ "AIF1 Slot 0 Right ADC", NULL, "ADC" },
-	{ "AIF1 Slot 0 Left ADC", NULL, "ADC" },
+	{ "ADC Left", NULL, "ADC" },
+	{ "ADC Right", NULL, "ADC" },
 
 	/* ADC Mixer Routes */
 	{ "Left Digital ADC Mixer", "AIF1 Data Digital ADC Capture Switch",
-	  "AIF1 Slot 0 Left ADC" },
+	  "ADC Left" },
 	{ "Right Digital ADC Mixer", "AIF1 Data Digital ADC Capture Switch",
-	  "AIF1 Slot 0 Right ADC" },
+	  "ADC Right" },
 };
 
 static const struct snd_soc_dai_ops sun8i_codec_dai_ops = {
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
