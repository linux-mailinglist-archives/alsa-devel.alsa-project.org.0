Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F626751FD1
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 13:22:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60EE5203;
	Thu, 13 Jul 2023 13:21:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60EE5203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689247348;
	bh=IUTDJqFXKMi7o8nX0Em72O7PtK2bD2VhovgqHLDwnRY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EeHvun1aeMl5qs1xHNJ82/1l4xgpIaQrECD24ozGM69GIUVKuX+TClgim+DiVc/S5
	 0MRHjl3VFpri9D8K9akgWGrhHqYRNGSqd6/eOD2LinsMtj/k5oIUWaWiuhJZ3GcV18
	 SEJPWi4Iu+kD38zKc61mgIt7fSDZCDceTyow1+mM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9E4BF80290; Thu, 13 Jul 2023 13:21:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66FA7F80236;
	Thu, 13 Jul 2023 13:21:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63CBDF80249; Thu, 13 Jul 2023 13:21:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0906BF800E4
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 13:21:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0906BF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FO5o8KIN
Received: by mail.gandi.net (Postfix) with ESMTPA id 11B531BF208;
	Thu, 13 Jul 2023 11:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689247287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iaGYvCgK+q34WSSKPrB7Pwd2mXJV/fa98+tweN5VGpM=;
	b=FO5o8KINBx1x1L7zhGkRhU8SP3FUAyfCOs7X7oc5mb8/MVXkEecsnsdJBw2FHsTj//zXWx
	JF2fSPm9nqxFZBGb9/5AQfXTfkVzUIFwIMQ3+3JQ8NU7g00x4gaxx20bWeZw1UDPtudnJC
	cdfX+WmX/UYI33ykOCFMb0uQp/Cxwr6pw7k3pAuMO0FwYoAxb9y3X0ZCEksDVf+U0xDp0Q
	ROegZkDmZ9o0YOSgVxwKFckGtsSlOhVTvGGbLAPoblZe2NF/htdfOa9svxJ+rQtYCCxRW9
	vw4wYqRsy4vLjPqfspqG4VheFVKN5AjaKX1IgbwVc2D4zZpjsTCmXCK5NQl33w==
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: cs42l51: fix driver to properly autoload with automatic
 module loading
Date: Thu, 13 Jul 2023 13:21:12 +0200
Message-ID: <20230713112112.778576-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.petazzoni@bootlin.com
Message-ID-Hash: RXDCPK4EY2QDHU655N6FGMJZP3DFHIFE
X-Message-ID-Hash: RXDCPK4EY2QDHU655N6FGMJZP3DFHIFE
X-MailFrom: thomas.petazzoni@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RXDCPK4EY2QDHU655N6FGMJZP3DFHIFE/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In commit 2cb1e0259f50 ("ASoC: cs42l51: re-hook of_match_table
pointer"), 9 years ago, some random guy fixed the cs42l51 after it was
split into a core part and an I2C part to properly match based on a
Device Tree compatible string.

However, the fix in this commit is wrong: the MODULE_DEVICE_TABLE(of,
....) is in the core part of the driver, not the I2C part. Therefore,
automatic module loading based on module.alias, based on matching with
the DT compatible string, loads the core part of the driver, but not
the I2C part. And threfore, the i2c_driver is not registered, and the
codec is not known to the system, nor matched with a DT node with the
corresponding compatible string.

In order to fix that, we move the MODULE_DEVICE_TABLE(of, ...) into
the I2C part of the driver. The cs42l51_of_match[] array is also moved
as well, as it is not possible to have this definition in one file,
and the MODULE_DEVICE_TABLE(of, ...) invocation in another file, due
to how MODULE_DEVICE_TABLE works.

Thanks to this commit, the I2C part of the driver now properly
autoloads, and thanks to its dependency on the core part, the core
part gets autoloaded as well, resulting in a functional sound card
without having to manually load kernel modules.

Fixes: 2cb1e0259f50 ("ASoC: cs42l51: re-hook of_match_table pointer")
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 sound/soc/codecs/cs42l51-i2c.c | 6 ++++++
 sound/soc/codecs/cs42l51.c     | 7 -------
 sound/soc/codecs/cs42l51.h     | 1 -
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/cs42l51-i2c.c b/sound/soc/codecs/cs42l51-i2c.c
index b2106ff6a7cb..e7db7bcd0296 100644
--- a/sound/soc/codecs/cs42l51-i2c.c
+++ b/sound/soc/codecs/cs42l51-i2c.c
@@ -19,6 +19,12 @@ static struct i2c_device_id cs42l51_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, cs42l51_i2c_id);
 
+const struct of_device_id cs42l51_of_match[] = {
+	{ .compatible = "cirrus,cs42l51", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, cs42l51_of_match);
+
 static int cs42l51_i2c_probe(struct i2c_client *i2c)
 {
 	struct regmap_config config;
diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
index a67cd3ee84e0..a7079ae0ca09 100644
--- a/sound/soc/codecs/cs42l51.c
+++ b/sound/soc/codecs/cs42l51.c
@@ -823,13 +823,6 @@ int __maybe_unused cs42l51_resume(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(cs42l51_resume);
 
-const struct of_device_id cs42l51_of_match[] = {
-	{ .compatible = "cirrus,cs42l51", },
-	{ }
-};
-MODULE_DEVICE_TABLE(of, cs42l51_of_match);
-EXPORT_SYMBOL_GPL(cs42l51_of_match);
-
 MODULE_AUTHOR("Arnaud Patard <arnaud.patard@rtp-net.org>");
 MODULE_DESCRIPTION("Cirrus Logic CS42L51 ALSA SoC Codec Driver");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/cs42l51.h b/sound/soc/codecs/cs42l51.h
index a79343e8a54e..125703ede113 100644
--- a/sound/soc/codecs/cs42l51.h
+++ b/sound/soc/codecs/cs42l51.h
@@ -16,7 +16,6 @@ int cs42l51_probe(struct device *dev, struct regmap *regmap);
 void cs42l51_remove(struct device *dev);
 int __maybe_unused cs42l51_suspend(struct device *dev);
 int __maybe_unused cs42l51_resume(struct device *dev);
-extern const struct of_device_id cs42l51_of_match[];
 
 #define CS42L51_CHIP_ID			0x1B
 #define CS42L51_CHIP_REV_A		0x00
-- 
2.41.0

