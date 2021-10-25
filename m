Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D11439D8F
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 19:25:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5F1516E2;
	Mon, 25 Oct 2021 19:24:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5F1516E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635182719;
	bh=CAjtqI1F60zDurTaKO+uiyP1JlGfhhDpB3K9eFoHoa0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pjDqOjO01rN7AXAsd1iLDGWQgklGaNwcBre+T+tRoPNyflyJTOIOttiY0XSk/HF6X
	 cv+oXRyB6Pn6Q3zdgctYu2BxCcGGddMYKSafvmCLeymsbe7iZXB3mVhZBukve5JXEv
	 6nrlsI6rWA+pOEgtJDReeaGyC38/tKKLsnBbVjUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0D7DF8027B;
	Mon, 25 Oct 2021 19:20:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26682F8027B; Mon, 25 Oct 2021 19:20:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ixit.cz (ixit.cz [94.230.151.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A7EEF804F2
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 19:20:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A7EEF804F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz
 header.b="LWr0yaLn"
Received: from localhost.localdomain (unknown [213.151.89.154])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id D0D9720064;
 Mon, 25 Oct 2021 19:19:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1635182396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/jbaolPJ0zM8p0YTf5FD7MePAwSxF59+vBDYT9wbfxE=;
 b=LWr0yaLnWYoNpVxzIOybF0AHuXR6j6ZiKpSBWfQ4/IGDK9BEYcv2thZidy1io0sfuDFrgD
 XmuP9eGbRdyuspMtB1nljLnISQQXVWLS8/U1Eu6rIv7I5CwKJioUXCPJ5qk8Xsae/gOv8O
 z9TRHwJBxh4do6KkEhwY58AXhKyuYxk=
From: David Heidelberg <david@ixit.cz>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH] dt-bindings: sound: nvidia,
 tegra-audio: Convert multiple txt bindings to yaml
Date: Mon, 25 Oct 2021 19:19:25 +0200
Message-Id: <20211025171927.92332-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
 linux-tegra@vger.kernel.org, ~okias/devicetree@lists.sr.ht
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

Convert Tegra audio complex with the
 * ALC5632
 * MAX98090
 * RT5640
 * RT5677
 * SGTL5000
 * TrimSlice
 * WM8753
 * WM8903
 * WM9712
codec to the YAML format.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../sound/nvidia,tegra-audio-alc5632.txt      |  48 -----
 .../sound/nvidia,tegra-audio-max98090.txt     |  53 -----
 .../sound/nvidia,tegra-audio-rt5640.txt       |  52 -----
 .../sound/nvidia,tegra-audio-rt5677.txt       |  67 ------
 .../sound/nvidia,tegra-audio-sgtl5000.txt     |  42 ----
 .../sound/nvidia,tegra-audio-trimslice.txt    |  21 --
 .../sound/nvidia,tegra-audio-wm8753.txt       |  40 ----
 .../sound/nvidia,tegra-audio-wm8903.txt       |  62 ------
 .../sound/nvidia,tegra-audio-wm9712.txt       |  60 ------
 .../bindings/sound/nvidia,tegra-audio.yaml    | 190 ++++++++++++++++++
 10 files changed, 190 insertions(+), 445 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-trimslice.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.txt
 delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.txt
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.txt
deleted file mode 100644
index 57f40f93453e..000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-NVIDIA Tegra audio complex
-
-Required properties:
-- compatible : "nvidia,tegra-audio-alc5632"
-- clocks : Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names : Must include the following entries:
-  - pll_a
-  - pll_a_out0
-  - mclk (The Tegra cdev1/extern1 clock, which feeds the CODEC's mclk)
-- nvidia,model : The user-visible name of this sound complex.
-- nvidia,audio-routing : A list of the connections between audio components.
-  Each entry is a pair of strings, the first being the connection's sink,
-  the second being the connection's source. Valid names for sources and
-  sinks are the ALC5632's pins as documented in the binding for the device
-  and:
-
-  * Headset Stereophone
-  * Int Spk
-  * Headset Mic
-  * Digital Mic
-
-- nvidia,i2s-controller : The phandle of the Tegra I2S controller
-- nvidia,audio-codec : The phandle of the ALC5632 audio codec
-
-Example:
-
-sound {
-	compatible = "nvidia,tegra-audio-alc5632-paz00",
-				 "nvidia,tegra-audio-alc5632";
-
-	nvidia,model = "Compal PAZ00";
-
-	nvidia,audio-routing =
-				"Int Spk", "SPK_OUTP",
-				"Int Spk", "SPK_OUTN",
-				"Headset Mic","MICBIAS1",
-				"MIC1_N", "Headset Mic",
-				"MIC1_P", "Headset Mic",
-				"Headset Stereophone", "HP_OUT_R",
-				"Headset Stereophone", "HP_OUT_L";
-
-	nvidia,i2s-controller = <&tegra_i2s1>;
-	nvidia,audio-codec = <&alc5632>;
-
-	clocks = <&tegra_car 112>, <&tegra_car 113>, <&tegra_car 93>;
-	clock-names = "pll_a", "pll_a_out0", "mclk";
-};
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
deleted file mode 100644
index c3495beba358..000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-NVIDIA Tegra audio complex, with MAX98090 CODEC
-
-Required properties:
-- compatible : "nvidia,tegra-audio-max98090"
-- clocks : Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names : Must include the following entries:
-  - pll_a
-  - pll_a_out0
-  - mclk (The Tegra cdev1/extern1 clock, which feeds the CODEC's mclk)
-- nvidia,model : The user-visible name of this sound complex.
-- nvidia,audio-routing : A list of the connections between audio components.
-  Each entry is a pair of strings, the first being the connection's sink,
-  the second being the connection's source. Valid names for sources and
-  sinks are the MAX98090's pins (as documented in its binding), and the jacks
-  on the board:
-
-  * Headphones
-  * Speakers
-  * Mic Jack
-  * Int Mic
-
-- nvidia,i2s-controller : The phandle of the Tegra I2S controller that's
-  connected to the CODEC.
-- nvidia,audio-codec : The phandle of the MAX98090 audio codec.
-
-Optional properties:
-- nvidia,hp-det-gpios : The GPIO that detect headphones are plugged in
-- nvidia,mic-det-gpios : The GPIO that detect microphones are plugged in
-
-Example:
-
-sound {
-	compatible = "nvidia,tegra-audio-max98090-venice2",
-		     "nvidia,tegra-audio-max98090";
-	nvidia,model = "NVIDIA Tegra Venice2";
-
-	nvidia,audio-routing =
-		"Headphones", "HPR",
-		"Headphones", "HPL",
-		"Speakers", "SPKR",
-		"Speakers", "SPKL",
-		"Mic Jack", "MICBIAS",
-		"IN34", "Mic Jack";
-
-	nvidia,i2s-controller = <&tegra_i2s1>;
-	nvidia,audio-codec = <&acodec>;
-
-	clocks = <&tegra_car TEGRA124_CLK_PLL_A>,
-		 <&tegra_car TEGRA124_CLK_PLL_A_OUT0>,
-		 <&tegra_car TEGRA124_CLK_EXTERN1>;
-	clock-names = "pll_a", "pll_a_out0", "mclk";
-};
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt
deleted file mode 100644
index 7788808dcd0b..000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.txt
+++ /dev/null
@@ -1,52 +0,0 @@
-NVIDIA Tegra audio complex, with RT5640 CODEC
-
-Required properties:
-- compatible : "nvidia,tegra-audio-rt5640"
-- clocks : Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names : Must include the following entries:
-  - pll_a
-  - pll_a_out0
-  - mclk (The Tegra cdev1/extern1 clock, which feeds the CODEC's mclk)
-- nvidia,model : The user-visible name of this sound complex.
-- nvidia,audio-routing : A list of the connections between audio components.
-  Each entry is a pair of strings, the first being the connection's sink,
-  the second being the connection's source. Valid names for sources and
-  sinks are the RT5640's pins (as documented in its binding), and the jacks
-  on the board:
-
-  * Headphones
-  * Speakers
-  * Mic Jack
-
-- nvidia,i2s-controller : The phandle of the Tegra I2S controller that's
-  connected to the CODEC.
-- nvidia,audio-codec : The phandle of the RT5640 audio codec. This binding
-  assumes that AIF1 on the CODEC is connected to Tegra.
-
-Optional properties:
-- nvidia,hp-det-gpios : The GPIO that detects headphones are plugged in
-
-Example:
-
-sound {
-	compatible = "nvidia,tegra-audio-rt5640-dalmore",
-			"nvidia,tegra-audio-rt5640";
-	nvidia,model = "NVIDIA Tegra Dalmore";
-
-	nvidia,audio-routing =
-		"Headphones", "HPOR",
-		"Headphones", "HPOL",
-		"Speakers", "SPORP",
-		"Speakers", "SPORN",
-		"Speakers", "SPOLP",
-		"Speakers", "SPOLN";
-
-	nvidia,i2s-controller = <&tegra_i2s1>;
-	nvidia,audio-codec = <&rt5640>;
-
-	nvidia,hp-det-gpios = <&gpio 143 0>; /* GPIO PR7 */
-
-	clocks = <&tegra_car 216>, <&tegra_car 217>, <&tegra_car 120>;
-	clock-names = "pll_a", "pll_a_out0", "mclk";
-};
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.txt
deleted file mode 100644
index a4589cda214e..000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.txt
+++ /dev/null
@@ -1,67 +0,0 @@
-NVIDIA Tegra audio complex, with RT5677 CODEC
-
-Required properties:
-- compatible : "nvidia,tegra-audio-rt5677"
-- clocks : Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names : Must include the following entries:
-  - pll_a
-  - pll_a_out0
-  - mclk (The Tegra cdev1/extern1 clock, which feeds the CODEC's mclk)
-- nvidia,model : The user-visible name of this sound complex.
-- nvidia,audio-routing : A list of the connections between audio components.
-  Each entry is a pair of strings, the first being the connection's sink,
-  the second being the connection's source. Valid names for sources and
-  sinks are the RT5677's pins (as documented in its binding), and the jacks
-  on the board:
-
-  * Headphone
-  * Speaker
-  * Headset Mic
-  * Internal Mic 1
-  * Internal Mic 2
-
-- nvidia,i2s-controller : The phandle of the Tegra I2S controller that's
-  connected to the CODEC.
-- nvidia,audio-codec : The phandle of the RT5677 audio codec. This binding
-  assumes that AIF1 on the CODEC is connected to Tegra.
-
-Optional properties:
-- nvidia,hp-det-gpios : The GPIO that detects headphones are plugged in
-- nvidia,hp-en-gpios : The GPIO that enables headphone amplifier
-- nvidia,mic-present-gpios: The GPIO that mic jack is plugged in
-- nvidia,dmic-clk-en-gpios : The GPIO that gates DMIC clock signal
-
-Example:
-
-sound {
-	compatible = "nvidia,tegra-audio-rt5677-ryu",
-	        "nvidia,tegra-audio-rt5677";
-	nvidia,model = "NVIDIA Tegra Ryu";
-
-	nvidia,audio-routing =
-		"Headphone", "LOUT2",
-		"Headphone", "LOUT1",
-		"Headset Mic", "MICBIAS1",
-		"IN1P", "Headset Mic",
-		"IN1N", "Headset Mic",
-		"DMIC L1", "Internal Mic 1",
-		"DMIC R1", "Internal Mic 1",
-		"DMIC L2", "Internal Mic 2",
-		"DMIC R2", "Internal Mic 2",
-		"Speaker", "PDM1L",
-		"Speaker", "PDM1R";
-
-	nvidia,i2s-controller = <&tegra_i2s1>;
-	nvidia,audio-codec = <&rt5677>;
-
-	nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(R, 7) GPIO_ACTIVE_HIGH>;
-	nvidia,mic-present-gpios = <&gpio TEGRA_GPIO(O, 5) GPIO_ACTIVE_LOW>;
-	nvidia,hp-en-gpios = <&rt5677 1 GPIO_ACTIVE_HIGH>;
-	nvidia,dmic-clk-en-gpios = <&rt5677 2 GPIO_ACTIVE_HIGH>;
-
-	clocks = <&tegra_car TEGRA124_CLK_PLL_A>,
-	         <&tegra_car TEGRA124_CLK_PLL_A_OUT0>,
-	         <&tegra_car TEGRA124_CLK_EXTERN1>;
-	clock-names = "pll_a", "pll_a_out0", "mclk";
-};
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.txt
deleted file mode 100644
index 5da7da4ea07a..000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-NVIDIA Tegra audio complex, with SGTL5000 CODEC
-
-Required properties:
-- compatible : "nvidia,tegra-audio-sgtl5000"
-- clocks : Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names : Must include the following entries:
-  - pll_a
-  - pll_a_out0
-  - mclk (The Tegra cdev1/extern1 clock, which feeds the CODEC's mclk)
-- nvidia,model : The user-visible name of this sound complex.
-- nvidia,audio-routing : A list of the connections between audio components.
-  Each entry is a pair of strings, the first being the connection's sink,
-  the second being the connection's source. Valid names for sources and
-  sinks are the SGTL5000's pins (as documented in its binding), and the jacks
-  on the board:
-
-  * Headphone Jack
-  * Line In Jack
-  * Mic Jack
-
-- nvidia,i2s-controller : The phandle of the Tegra I2S controller that's
-  connected to the CODEC.
-- nvidia,audio-codec : The phandle of the SGTL5000 audio codec.
-
-Example:
-
-sound {
-	compatible = "toradex,tegra-audio-sgtl5000-apalis_t30",
-		     "nvidia,tegra-audio-sgtl5000";
-	nvidia,model = "Toradex Apalis T30";
-	nvidia,audio-routing =
-		"Headphone Jack", "HP_OUT",
-		"LINE_IN", "Line In Jack",
-		"MIC_IN", "Mic Jack";
-	nvidia,i2s-controller = <&tegra_i2s2>;
-	nvidia,audio-codec = <&sgtl5000>;
-	clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
-		 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
-		 <&tegra_car TEGRA30_CLK_EXTERN1>;
-	clock-names = "pll_a", "pll_a_out0", "mclk";
-};
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-trimslice.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-trimslice.txt
deleted file mode 100644
index ef1fe7358279..000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-trimslice.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-NVIDIA Tegra audio complex for TrimSlice
-
-Required properties:
-- compatible : "nvidia,tegra-audio-trimslice"
-- clocks : Must contain an entry for each entry in clock-names.
-- clock-names : Must include the following entries:
-  "pll_a" (The Tegra clock of that name),
-  "pll_a_out0" (The Tegra clock of that name),
-  "mclk" (The Tegra cdev1/extern1 clock, which feeds the CODEC's mclk)
-- nvidia,i2s-controller : The phandle of the Tegra I2S1 controller
-- nvidia,audio-codec : The phandle of the WM8903 audio codec
-
-Example:
-
-sound {
-	compatible = "nvidia,tegra-audio-trimslice";
-	nvidia,i2s-controller = <&tegra_i2s1>;
-	nvidia,audio-codec = <&codec>;
-	clocks = <&tegra_car 112>, <&tegra_car 113>, <&tegra_car 93>;
-	clock-names = "pll_a", "pll_a_out0", "mclk";
-};
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.txt
deleted file mode 100644
index 96f6a57dd6b4..000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-NVIDIA Tegra audio complex
-
-Required properties:
-- compatible : "nvidia,tegra-audio-wm8753"
-- clocks : Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names : Must include the following entries:
-  - pll_a
-  - pll_a_out0
-  - mclk (The Tegra cdev1/extern1 clock, which feeds the CODEC's mclk)
-- nvidia,model : The user-visible name of this sound complex.
-- nvidia,audio-routing : A list of the connections between audio components.
-  Each entry is a pair of strings, the first being the connection's sink,
-  the second being the connection's source. Valid names for sources and
-  sinks are the WM8753's pins as documented in the binding for the WM8753,
-  and the jacks on the board:
-
-  * Headphone Jack
-  * Mic Jack
-
-- nvidia,i2s-controller : The phandle of the Tegra I2S1 controller
-- nvidia,audio-codec : The phandle of the WM8753 audio codec
-Example:
-
-sound {
-	compatible = "nvidia,tegra-audio-wm8753-whistler",
-		     "nvidia,tegra-audio-wm8753"
-	nvidia,model = "tegra-wm8753-harmony";
-
-	nvidia,audio-routing =
-		"Headphone Jack", "LOUT1",
-		"Headphone Jack", "ROUT1";
-
-	nvidia,i2s-controller = <&i2s1>;
-	nvidia,audio-codec = <&wm8753>;
-
-	clocks = <&tegra_car 112>, <&tegra_car 113>, <&tegra_car 93>;
-	clock-names = "pll_a", "pll_a_out0", "mclk";
-};
-
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.txt
deleted file mode 100644
index bbd581a8c5bc..000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.txt
+++ /dev/null
@@ -1,62 +0,0 @@
-NVIDIA Tegra audio complex
-
-Required properties:
-- compatible : "nvidia,tegra-audio-wm8903"
-- clocks : Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names : Must include the following entries:
-  - pll_a
-  - pll_a_out0
-  - mclk (The Tegra cdev1/extern1 clock, which feeds the CODEC's mclk)
-- nvidia,model : The user-visible name of this sound complex.
-- nvidia,audio-routing : A list of the connections between audio components.
-  Each entry is a pair of strings, the first being the connection's sink,
-  the second being the connection's source. Valid names for sources and
-  sinks are the WM8903's pins (documented in the WM8903 binding document),
-  and the jacks on the board:
-
-  * Headphone Jack
-  * Int Spk
-  * Mic Jack
-  * Int Mic
-
-- nvidia,i2s-controller : The phandle of the Tegra I2S1 controller
-- nvidia,audio-codec : The phandle of the WM8903 audio codec
-
-Optional properties:
-- nvidia,spkr-en-gpios : The GPIO that enables the speakers
-- nvidia,hp-mute-gpios : The GPIO that mutes the headphones
-- nvidia,hp-det-gpios : The GPIO that detect headphones are plugged in
-- nvidia,int-mic-en-gpios : The GPIO that enables the internal microphone
-- nvidia,ext-mic-en-gpios : The GPIO that enables the external microphone
-- nvidia,headset : The Mic Jack represents state of the headset microphone pin
-
-Example:
-
-sound {
-	compatible = "nvidia,tegra-audio-wm8903-harmony",
-		     "nvidia,tegra-audio-wm8903"
-	nvidia,model = "tegra-wm8903-harmony";
-
-	nvidia,audio-routing =
-		"Headphone Jack", "HPOUTR",
-		"Headphone Jack", "HPOUTL",
-		"Int Spk", "ROP",
-		"Int Spk", "RON",
-		"Int Spk", "LOP",
-		"Int Spk", "LON",
-		"Mic Jack", "MICBIAS",
-		"IN1L", "Mic Jack";
-
-	nvidia,i2s-controller = <&i2s1>;
-	nvidia,audio-codec = <&wm8903>;
-
-	nvidia,spkr-en-gpios = <&codec 2 0>;
-	nvidia,hp-det-gpios = <&gpio 178 0>; /* gpio PW2 */
-	nvidia,int-mic-en-gpios = <&gpio 184 0>; /*gpio PX0 */
-	nvidia,ext-mic-en-gpios = <&gpio 185 0>; /* gpio PX1 */
-
-	clocks = <&tegra_car 112>, <&tegra_car 113>, <&tegra_car 93>;
-	clock-names = "pll_a", "pll_a_out0", "mclk";
-};
-
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.txt b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.txt
deleted file mode 100644
index 436f6cd9d07c..000000000000
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.txt
+++ /dev/null
@@ -1,60 +0,0 @@
-NVIDIA Tegra audio complex
-
-Required properties:
-- compatible : "nvidia,tegra-audio-wm9712"
-- clocks : Must contain an entry for each entry in clock-names.
-  See ../clocks/clock-bindings.txt for details.
-- clock-names : Must include the following entries:
-  - pll_a
-  - pll_a_out0
-  - mclk (The Tegra cdev1/extern1 clock, which feeds the CODEC's mclk)
-- nvidia,model : The user-visible name of this sound complex.
-- nvidia,audio-routing : A list of the connections between audio components.
-  Each entry is a pair of strings, the first being the connection's sink,
-  the second being the connection's source. Valid names for sources and
-  sinks are the WM9712's pins, and the jacks on the board:
-
-  WM9712 pins:
-
-  * MONOOUT
-  * HPOUTL
-  * HPOUTR
-  * LOUT2
-  * ROUT2
-  * OUT3
-  * LINEINL
-  * LINEINR
-  * PHONE
-  * PCBEEP
-  * MIC1
-  * MIC2
-  * Mic Bias
-
-  Board connectors:
-
-  * Headphone
-  * LineIn
-  * Mic
-
-- nvidia,ac97-controller : The phandle of the Tegra AC97 controller
-
-
-Example:
-
-sound {
-	compatible = "nvidia,tegra-audio-wm9712-colibri_t20",
-		         "nvidia,tegra-audio-wm9712";
-	nvidia,model = "Toradex Colibri T20";
-
-	nvidia,audio-routing =
-		"Headphone", "HPOUTL",
-		"Headphone", "HPOUTR",
-		"LineIn", "LINEINL",
-		"LineIn", "LINEINR",
-		"Mic", "MIC1";
-
-	nvidia,ac97-controller = <&ac97>;
-
-	clocks = <&tegra_car 112>, <&tegra_car 113>, <&tegra_car 93>;
-	clock-names = "pll_a", "pll_a_out0", "mclk";
-};
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio.yaml
new file mode 100644
index 000000000000..6b8876bfa40f
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio.yaml
@@ -0,0 +1,190 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/sound/nvidia,tegra-audio.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: NVIDIA Tegra audio complex
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - pattern: '^[a-z0-9]+,tegra-audio-alc5632(-[a-z0-9])+'
+          - const: nvidia,tegra-audio-alc5632
+      - items:
+          - enum:
+              - nvidia,tegra-audio-max98090-nyan-big
+              - nvidia,tegra-audio-max98090-nyan-blaze
+          - const: nvidia,tegra-audio-max98090-nyan
+          - const: nvidia,tegra-audio-max98090
+      - items:
+          - pattern: '^[a-z0-9]+,tegra-audio-max98090(-[a-z0-9])+'
+          - const: nvidia,tegra-audio-max98090
+      - items:
+          - pattern: '^[a-z0-9]+,tegra-audio-rt56(39|40)(-[a-z0-9])+'
+          - const: nvidia,tegra-audio-rt5640
+      - items:
+          - pattern: '^[a-z0-9]+,tegra-audio-rt5677(-[a-z0-9])+'
+          - const: nvidia,tegra-audio-rt5677
+      - items:
+          - enum:
+              - toradex,tegra-audio-sgtl5000-apalis_t30
+              - toradex,tegra-audio-sgtl5000-colibri_t30
+              - toradex,tegra-audio-sgtl5000-apalis_tk1
+          - const: nvidia,tegra-audio-sgtl5000
+      - const: nvidia,tegra-audio-trimslice
+      - items:
+          - pattern: '^[a-z0-9]+,tegra-audio-wm8753(-[a-z0-9])+'
+          - const: nvidia,tegra-audio-wm8753
+      - items:
+          - pattern: '^[a-z0-9]+,tegra-audio-(plutux|wm8903(-[a-z0-9])+)'
+          - const: nvidia,tegra-audio-wm8903
+      - items:
+          - pattern: '^[a-z0-9]+,tegra-audio-wm9712(-[a-z0-9])+'
+          - const: nvidia,tegra-audio-wm9712
+
+  clocks:
+    items:
+      - description: PLL A clock
+      - description: PLL A OUT0 clock
+      - description: The Tegra cdev1/extern1 clock, which feeds the card's mclk
+
+  clock-names:
+    items:
+      - const: pll_a
+      - const: pll_a_out0
+      - const: mclk
+
+  assigned-clocks: true
+
+  assigned-clock-parents: true
+
+  assigned-clock-rates: true
+
+  nvidia,model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: The user-visible name of this sound complex.
+
+  nvidia,audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      A list of the connections between audio components.
+      Each entry is a pair of strings, the first being the connection's sink,
+      the second being the connection's source. Valid names for sources and
+      sinks are the pins (documented in the binding document),
+      and the jacks on the board:
+        ALC5632:
+          * Headset Stereophone
+          * Int Spk
+          * Headset Mic
+          * Digital Mic
+        MAXX98090:
+          * Headphones
+          * SPeakers
+          * Mic Jack
+          * Int Mic
+        RT5640:
+          * Headphones
+          * Speakers
+          * Mic Jack
+        RT5677:
+          * Headphone
+          * Speaker
+          * Headset Mic
+          * Internal Mic 1
+          * Internal Mic 2
+        SGTL5000:
+          * Headphone Jack
+          * Line In Jack
+          * Mic Jack
+        WM8753:
+          * Headphone Jack
+          * Mic Jack
+        WM8903:
+          * Headphone Jack
+          * Int Spk
+          * Mic Jack
+          * Int Mic
+        WM9712:
+          * Headphone
+          * LineIn
+          * Mic
+
+  nvidia,ac97-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the AC97 controller
+
+  nvidia,i2s-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the Tegra I2S controller
+
+  nvidia,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of audio codec
+
+  nvidia,spkr-en-gpios:
+    maxItems: 1
+    description: The GPIO that enables the speakers
+
+  nvidia,hp-mute-gpios:
+    maxItems: 1
+    description: The GPIO that mutes the headphones
+
+  nvidia,hp-det-gpios:
+    maxItems: 1
+    description: The GPIO that detect headphones are plugged in
+
+  nvidia,mic-det-gpios:
+    maxItems: 1
+    description: The GPIO that detect microphone is plugged in
+
+  nvidia,int-mic-en-gpios:
+    maxItems: 1
+    description: The GPIO that enables the internal microphone
+
+  nvidia,ext-mic-en-gpios:
+    maxItems: 1
+    description: The GPIO that enables the external microphone
+
+  nvidia,headset:
+    type: boolean
+    description: The Mic Jack represents state of the headset microphone pin
+
+additionalProperties: false
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+
+oneOf:
+  - required:
+      - nvidia,audio-codec
+      - nvidia,i2s-controller
+  - required:
+      - nvidia,ac97-controller
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra30-car.h>
+
+    sound {
+      compatible = "toradex,tegra-audio-sgtl5000-apalis_t30",
+                   "nvidia,tegra-audio-sgtl5000";
+      nvidia,model = "Toradex Apalis T30 SGTL5000";
+      nvidia,audio-routing =
+              "Headphone Jack", "HP_OUT",
+              "LINE_IN", "Line In Jack",
+              "MIC_IN", "Mic Jack";
+      nvidia,i2s-controller = <&tegra_i2s2>;
+      nvidia,audio-codec = <&codec>;
+      clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
+               <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
+               <&tegra_car TEGRA30_CLK_EXTERN1>;
+      clock-names = "pll_a", "pll_a_out0", "mclk";
+    };
-- 
2.33.0

