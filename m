Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A11541A88D4
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 20:13:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EA5016A2;
	Tue, 14 Apr 2020 20:12:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EA5016A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586888029;
	bh=ybRaYgOCUKe/ejLN3H7AkPP1s9ubsffDApncUhMDbVc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ym+uRo52OeakvlhAV6qFJW0RMRa8B7aj3hSG4Iz2T3uDmlxggxR305VUa9CJf3RSv
	 CcxEi25C3ZonXyigUxRYOrf2bh7CCAgCZo2iPd4DXalm9o/rUCK7HZxLbVTXxY6UKj
	 f1xoW1RCWltKJC7dJNZqsBeOMQwpvKBMl2PXOcGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A298F80115;
	Tue, 14 Apr 2020 20:12:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD4B7F8013D; Tue, 14 Apr 2020 20:12:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DACAFF80115
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 20:11:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DACAFF80115
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 6E7F92A1BE3
Received: by jupiter.universe (Postfix, from userid 1000)
 id 22FA14800F7; Tue, 14 Apr 2020 20:11:56 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Fabio Estevam <festevam@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: sgtl5000: Fix VAG power-on handling
Date: Tue, 14 Apr 2020 20:11:40 +0200
Message-Id: <20200414181140.145825-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>
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

As mentioned slightly out of patch context in the code, there
is no reset routine for the chip. On boards where the chip is
supplied by a fixed regulator, it might not even be resetted
during (e.g. watchdog) reboot and can be in any state.

If the device is probed with VAG enabled, the driver's probe
routine will generate a loud pop sound when ANA_POWER is
being programmed. Avoid this by properly disabling just the
VAG bit and waiting the required power down time.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/codecs/sgtl5000.c | 34 ++++++++++++++++++++++++++++++++++
 sound/soc/codecs/sgtl5000.h |  1 +
 2 files changed, 35 insertions(+)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index d5130193b4a2..e8a8bf7b4ffe 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -1653,6 +1653,40 @@ static int sgtl5000_i2c_probe(struct i2c_client *client,
 		dev_err(&client->dev,
 			"Error %d initializing CHIP_CLK_CTRL\n", ret);
 
+	/* Mute everything to avoid pop from the following power-up */
+	ret = regmap_write(sgtl5000->regmap, SGTL5000_CHIP_ANA_CTRL,
+			   SGTL5000_CHIP_ANA_CTRL_DEFAULT);
+	if (ret) {
+		dev_err(&client->dev,
+			"Error %d muting outputs via CHIP_ANA_CTRL\n", ret);
+		goto disable_clk;
+	}
+
+	/*
+	 * If VAG is powered-on (e.g. from previous boot), it would be disabled
+	 * by the write to ANA_POWER in later steps of the probe code. This
+	 * may create a loud pop even with all outputs muted. The proper way
+	 * to circumvent this is disabling the bit first and waiting the proper
+	 * cool-down time.
+	 */
+	ret = regmap_read(sgtl5000->regmap, SGTL5000_CHIP_ANA_POWER, &value);
+	if (ret) {
+		dev_err(&client->dev, "Failed to read ANA_POWER: %d\n", ret);
+		goto disable_clk;
+	}
+	if (value & SGTL5000_VAG_POWERUP) {
+		ret = regmap_update_bits(sgtl5000->regmap,
+					 SGTL5000_CHIP_ANA_POWER,
+					 SGTL5000_VAG_POWERUP,
+					 0);
+		if (ret) {
+			dev_err(&client->dev, "Error %d disabling VAG\n", ret);
+			goto disable_clk;
+		}
+
+		msleep(SGTL5000_VAG_POWERDOWN_DELAY);
+	}
+
 	/* Follow section 2.2.1.1 of AN3663 */
 	ana_pwr = SGTL5000_ANA_POWER_DEFAULT;
 	if (sgtl5000->num_supplies <= VDDD) {
diff --git a/sound/soc/codecs/sgtl5000.h b/sound/soc/codecs/sgtl5000.h
index a4bf4bca95bf..56ec5863f250 100644
--- a/sound/soc/codecs/sgtl5000.h
+++ b/sound/soc/codecs/sgtl5000.h
@@ -233,6 +233,7 @@
 /*
  * SGTL5000_CHIP_ANA_CTRL
  */
+#define SGTL5000_CHIP_ANA_CTRL_DEFAULT		0x0133
 #define SGTL5000_LINE_OUT_MUTE			0x0100
 #define SGTL5000_HP_SEL_MASK			0x0040
 #define SGTL5000_HP_SEL_SHIFT			6
-- 
2.25.1

