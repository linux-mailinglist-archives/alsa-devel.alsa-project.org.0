Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6400A7A7E7
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 14:14:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6E5317F5;
	Tue, 30 Jul 2019 14:13:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6E5317F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564488874;
	bh=RC6T/49vIMAIXYnzSdeWRG+OmHqPcVMYUMO3mRM/+HE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LpXW0EymGalMYM0AnWcsNqDUE3wIrcvgWosUqxzx3j3GRUA1SW4j2sjF0fUGyMMRc
	 7VP9TgwLfenm9RSoENbZr0Acdc77OyGpfZkgkg5XD+HN4v/t08c7a+jeEBiSkE8h7S
	 dWY+LrABaxHj1PEFr+8ZuwC1WmUWejSMmg+kWAmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43A51F8058C;
	Tue, 30 Jul 2019 14:10:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 160A2F805A9; Tue, 30 Jul 2019 14:10:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3DBAF8058C
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 14:10:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3DBAF8058C
Received: from [167.98.27.226] (helo=ct-lt-1124.office.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hsQwq-0003E4-86; Tue, 30 Jul 2019 13:09:44 +0100
From: Thomas Preston <thomas.preston@codethink.co.uk>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Vinod Koul <vkoul@kernel.org>, Annaliese McDermond <nh6z@nh6z.net>,
 Thomas Preston <thomas.preston@codethink.co.uk>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 30 Jul 2019 13:09:35 +0100
Message-Id: <20190730120937.16271-2-thomas.preston@codethink.co.uk>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
MIME-Version: 1.0
Cc: Patrick Glaser <pglaser@tesla.com>, Rob Duncan <rduncan@tesla.com>,
 Nate Case <ncase@tesla.com>
Subject: [alsa-devel] [PATCH v2 1/3] dt-bindings: ASoC: Add TDA7802 amplifier
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

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
Cc: Patrick Glaser <pglaser@tesla.com>
Cc: Rob Duncan <rduncan@tesla.com>
Cc: Nate Case <ncase@tesla.com>
---
 .../devicetree/bindings/sound/tda7802.txt     | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/tda7802.txt

diff --git a/Documentation/devicetree/bindings/sound/tda7802.txt b/Documentation/devicetree/bindings/sound/tda7802.txt
new file mode 100644
index 000000000000..f80aaf4f1ba0
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tda7802.txt
@@ -0,0 +1,26 @@
+ST TDA7802 audio processor
+
+This device supports I2C only.
+
+Required properties:
+
+- compatible : "st,tda7802"
+- reg : the I2C address of the device
+- enable-supply : a regulator spec for the PLLen pin
+
+Optional properties:
+
+- st,gain-ch13 : gain for channels 1 and 3 (range: 1-4)
+- st,gain-ch24 : gain for channels 2 and 3 (range: 1-4)
+- st,diagnostic-mode-ch13 : diagnotic mode for channels 1 and 3
+                            values: "Speaker" (default), "Booster"
+- st,diagnostic-mode-ch24 : diagnotic mode for channels 2 and 4
+                            values: "Speaker" (default), "Booster"
+
+Example:
+
+amp: tda7802@6c {
+	compatible = "st,tda7802";
+	reg = <0x6c>;
+	enable-supply = <&amp_enable_reg>;
+};
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
