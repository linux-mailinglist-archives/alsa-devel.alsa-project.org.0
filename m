Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3F145B4EC
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 08:08:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48E5216A5;
	Wed, 24 Nov 2021 08:07:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48E5216A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637737714;
	bh=dtcDvyFuXQJvFtaFs0deLwLE5oQzchv7LsdktZl3sFk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JnZhiCJ9u05GNymmiDMsfXP9d1m8MVtYX2bivS7Si44KErou+o8ItqFjFd0o0795+
	 cHbZ7dpiGPX9gHRH+fyZzntC94oV5arJVMcGhO6xvcuTPfc6kiDDYl2H02lH7EUJMb
	 cmxmqNyYAxxYFdCIPh+Dj21/AYz/xbuTX2dtiDDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 651AEF804FC;
	Wed, 24 Nov 2021 08:05:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35DC5F804FC; Tue, 23 Nov 2021 17:32:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29667F804E7
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 17:31:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29667F804E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="A6KSaU3K"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1ANCeXB7012277;
 Tue, 23 Nov 2021 10:31:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=13QOOMOHEfJf3x3dxB3ukuVPcu2n/luurIuTBvsCw3o=;
 b=A6KSaU3KIqHgMpy/30fzbI/Ds9gduNhPRjKtULO8zbWxVzsCA5TNSN7wSeQikMmfL1J8
 6SXHWCGwyVEZ+YH6J+nDQRgu6aSMPbLWQ71zvEPjmzK4K+GU8VMTBe8Mcq015TfSKnP7
 TEYhHwk17XDXr7jBM7GJe+jhmxm2XPi1p74c3/OzfIpxgpMRR6OvkVJBtE7SUgVxGVFP
 UeHBfdE3rHHndMxjgvVy6qbkSp6XKuXu45vLPblg/xsu79MHKk3cVpuTcv5H/3tdmPrw
 tvJaHEdZEV2HU6tLvrWhTjbUeWY2KfFJikQOHAuVWAER9lOyKUhTC3JN9AjeMYhCppTG jA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3cg5ms21ng-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 23 Nov 2021 10:31:54 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 23 Nov
 2021 16:31:52 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Tue, 23 Nov 2021 16:31:52 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.11])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8D1FA2A3;
 Tue, 23 Nov 2021 16:31:51 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 "Liam Girdwood" <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Kailang Yang <kailang@realtek.com>,
 Shuming Fan <shumingf@realtek.com>, "Pierre-Louis
 Bossart" <pierre-louis.bossart@linux.intel.com>, David Rhodes
 <david.rhodes@cirrus.com>, Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Subject: [PATCH 01/11] ASoC: cs35l41: Set the max SPI speed for the whole
 device
Date: Tue, 23 Nov 2021 16:31:39 +0000
Message-ID: <20211123163149.1530535-2-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211123163149.1530535-1-tanureal@opensource.cirrus.com>
References: <20211123163149.1530535-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: f9adWZFewEyfyy02AW3fk9vscyXMtFyX
X-Proofpoint-ORIG-GUID: f9adWZFewEyfyy02AW3fk9vscyXMtFyX
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Wed, 24 Nov 2021 08:05:53 +0100
Cc: Chris Chiu <chris.chiu@canonical.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Jack Yu <jack.yu@realtek.com>, Lucas
 Tanure <tanureal@opensource.cirrus.com>, Arnd
 Bergmann <arnd@arndb.de>, Jeremy Szu <jeremy.szu@canonical.com>,
 patches@opensource.cirrus.com, Elia Devito <eliadevito@gmail.com>,
 alsa-devel@alsa-project.org, Werner Sembach <wse@tuxedocomputers.com>,
 platform-driver-x86@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 linux-acpi@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Sami Loone <sami@loone.fi>, Cameron Berkenpas <cam@neo-zeon.de>,
 linux-kernel@vger.kernel.org
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

Higher speeds are only supported when PLL is enabled, but
the current driver doesn't enable PLL outside of stream
use cases, so better to set the lowest SPI speed accepted
by the entire device.

Move the current frequency set to the spi sub-driver so
the whole device can benefit from that speed.

spi-max-frequency property could be used, but ACPI systems don't
support it, so by setting it in the spi sub-driver probe
both Device Trees and ACPI systems are supported.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41-spi.c | 32 +++-----------------------------
 sound/soc/codecs/cs35l41.c     |  7 -------
 sound/soc/codecs/cs35l41.h     |  4 +---
 3 files changed, 4 insertions(+), 39 deletions(-)

diff --git a/sound/soc/codecs/cs35l41-spi.c b/sound/soc/codecs/cs35l41-spi.c
index 90a921f726c3..3fa99741779a 100644
--- a/sound/soc/codecs/cs35l41-spi.c
+++ b/sound/soc/codecs/cs35l41-spi.c
@@ -42,34 +42,6 @@ static const struct spi_device_id cs35l41_id_spi[] = {
 
 MODULE_DEVICE_TABLE(spi, cs35l41_id_spi);
 
-static void cs35l41_spi_otp_setup(struct cs35l41_private *cs35l41,
-				  bool is_pre_setup, unsigned int *freq)
-{
-	struct spi_device *spi;
-	u32 orig_spi_freq;
-
-	spi = to_spi_device(cs35l41->dev);
-
-	if (!spi) {
-		dev_err(cs35l41->dev, "%s: No SPI device\n", __func__);
-		return;
-	}
-
-	if (is_pre_setup) {
-		orig_spi_freq = spi->max_speed_hz;
-		if (orig_spi_freq > CS35L41_SPI_MAX_FREQ_OTP) {
-			spi->max_speed_hz = CS35L41_SPI_MAX_FREQ_OTP;
-			spi_setup(spi);
-		}
-		*freq = orig_spi_freq;
-	} else {
-		if (spi->max_speed_hz != *freq) {
-			spi->max_speed_hz = *freq;
-			spi_setup(spi);
-		}
-	}
-}
-
 static int cs35l41_spi_probe(struct spi_device *spi)
 {
 	const struct regmap_config *regmap_config = &cs35l41_regmap_spi;
@@ -81,6 +53,9 @@ static int cs35l41_spi_probe(struct spi_device *spi)
 	if (!cs35l41)
 		return -ENOMEM;
 
+	spi->max_speed_hz = CS35L41_SPI_MAX_FREQ;
+	spi_setup(spi);
+
 	spi_set_drvdata(spi, cs35l41);
 	cs35l41->regmap = devm_regmap_init_spi(spi, regmap_config);
 	if (IS_ERR(cs35l41->regmap)) {
@@ -91,7 +66,6 @@ static int cs35l41_spi_probe(struct spi_device *spi)
 
 	cs35l41->dev = &spi->dev;
 	cs35l41->irq = spi->irq;
-	cs35l41->otp_setup = cs35l41_spi_otp_setup;
 
 	return cs35l41_probe(cs35l41, pdata);
 }
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index afb07d2991ba..e8e997efaa8b 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -438,7 +438,6 @@ static int cs35l41_otp_unpack(void *data)
 	const struct cs35l41_otp_packed_element_t *otp_map;
 	struct cs35l41_private *cs35l41 = data;
 	int bit_offset, word_offset, ret, i;
-	unsigned int orig_spi_freq;
 	unsigned int bit_sum = 8;
 	u32 otp_val, otp_id_reg;
 	u32 *otp_mem;
@@ -462,9 +461,6 @@ static int cs35l41_otp_unpack(void *data)
 		goto err_otp_unpack;
 	}
 
-	if (cs35l41->otp_setup)
-		cs35l41->otp_setup(cs35l41, true, &orig_spi_freq);
-
 	ret = regmap_bulk_read(cs35l41->regmap, CS35L41_OTP_MEM0, otp_mem,
 			       CS35L41_OTP_SIZE_WORDS);
 	if (ret < 0) {
@@ -472,9 +468,6 @@ static int cs35l41_otp_unpack(void *data)
 		goto err_otp_unpack;
 	}
 
-	if (cs35l41->otp_setup)
-		cs35l41->otp_setup(cs35l41, false, &orig_spi_freq);
-
 	otp_map = otp_map_match->map;
 
 	bit_offset = otp_map_match->bit_offset;
diff --git a/sound/soc/codecs/cs35l41.h b/sound/soc/codecs/cs35l41.h
index eea3b14acb0b..a23eabff074f 100644
--- a/sound/soc/codecs/cs35l41.h
+++ b/sound/soc/codecs/cs35l41.h
@@ -729,7 +729,7 @@
 #define CS35L41_FS2_WINDOW_MASK		0x00FFF800
 #define CS35L41_FS2_WINDOW_SHIFT	12
 
-#define CS35L41_SPI_MAX_FREQ_OTP	4000000
+#define CS35L41_SPI_MAX_FREQ		4000000
 
 #define CS35L41_RX_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 #define CS35L41_TX_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
@@ -784,8 +784,6 @@ struct cs35l41_private {
 	int irq;
 	/* GPIO for /RST */
 	struct gpio_desc *reset_gpio;
-	void (*otp_setup)(struct cs35l41_private *cs35l41, bool is_pre_setup,
-			  unsigned int *freq);
 };
 
 int cs35l41_probe(struct cs35l41_private *cs35l41,
-- 
2.34.0

