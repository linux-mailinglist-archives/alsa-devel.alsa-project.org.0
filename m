Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B1A2125DB
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 16:14:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EDAF16EB;
	Thu,  2 Jul 2020 16:14:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EDAF16EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593699292;
	bh=FS5bOxv/OEA9LBN7fY7vciN/k0h7GMhTwWG06WcxpdU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cftzEBbS4oedg6LrUm9AQXuxai6+Hd+MXF5PEdw7WOurw3Dmb0Rj6kZljkgeYisoo
	 iYJGZPU1vx9bWkK9QuEtI+FXYj+IvVkCc8vnl9GrAf8qURI1msGYmA+Py2E3/lc34P
	 9p9PlFa08LfyG/rxvuJ/fYaKCee73IWk0fUR7/O0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70F8FF802A9;
	Thu,  2 Jul 2020 16:12:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BDE0F8027B; Thu,  2 Jul 2020 16:12:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 929B4F80134
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 16:12:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 929B4F80134
Received: from xps.home (unknown [IPv6:2a01:e35:2fb5:1510:315a:ecf0:6250:a3ed])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: aferraris)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8C01F2A5EC3;
 Thu,  2 Jul 2020 15:12:18 +0100 (BST)
From: Arnaud Ferraris <arnaud.ferraris@collabora.com>
To: 
Subject: [PATCH 1/2] dt-bindings: sound: fsl-asoc-card: add new compatible for
 I2S slave
Date: Thu,  2 Jul 2020 16:11:14 +0200
Message-Id: <20200702141114.232688-2-arnaud.ferraris@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200702141114.232688-1-arnaud.ferraris@collabora.com>
References: <20200702141114.232688-1-arnaud.ferraris@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>
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

fsl-asoc-card currently doesn't support generic codecs with the SoC
acting as I2S slave.

This commit adds a new `fsl,imx-audio-i2s-slave` for this use-case, as
well as the following mandatory properties:
- `audio-codec-dai-name` for specifying the codec DAI to be used
- `audio-slot-width`

Signed-off-by: Arnaud Ferraris <arnaud.ferraris@collabora.com>
---
 .../bindings/sound/fsl-asoc-card.txt          | 23 ++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
index 133d7e14a4d0..694a138df462 100644
--- a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
+++ b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
@@ -22,6 +22,8 @@ Note: The card is initially designed for those sound cards who use AC'97, I2S
 The compatible list for this generic sound card currently:
  "fsl,imx-audio-ac97"
 
+ "fsl,imx-audio-i2s-slave"
+
  "fsl,imx-audio-cs42888"
 
  "fsl,imx-audio-cs427x"
@@ -75,7 +77,13 @@ Optional unless SSI is selected as a CPU DAI:
 
   - mux-ext-port	: The external port of the i.MX audio muxer
 
-Example:
+Optional unless compatible is "fsl,imx-audio-i2s-slave":
+
+  - audio-codec-dai-name: The name of the DAI provided by the codec
+
+  - audio-slot-width	: The audio sample format
+
+Examples:
 sound-cs42888 {
 	compatible = "fsl,imx-audio-cs42888";
 	model = "cs42888-audio";
@@ -96,3 +104,16 @@ sound-cs42888 {
 		"AIN2L", "Line In Jack",
 		"AIN2R", "Line In Jack";
 };
+
+sound-bluetooth {
+	compatible = "fsl,imx-audio-i2s-slave";
+	audio-cpu = <&ssi1>;
+	audio-codec = <&codec_bluetooth>;
+	audio-codec-dai-name = "bt-sco-pcm-wb";
+	audio-slot-width = <16>;
+	audio-routing =
+		"RX", "Mic Jack",
+		"Headphone Jack", "TX";
+	mux-int-port = <1>;
+	mux-ext-port = <4>;
+};
-- 
2.27.0

