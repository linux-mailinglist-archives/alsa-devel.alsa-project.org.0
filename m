Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 989F56ACAF4
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 18:44:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5B45115F;
	Mon,  6 Mar 2023 18:43:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5B45115F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678124664;
	bh=JSi7EemZCUPtWCmpuXCPTfDGbYK8js+emGU+Dy+rToQ=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EK5vqpcddeo40aJUX6kEespEyXCcJVQmA6dxGuEIqE3fhtfrfhY65yjsRIO9BCA7U
	 gaARdSd/WegWqWol5HLYiVC/q1SO7LOxjJ1oYEq/it2dvvgQpaQVnxCsQ9a49XFqIu
	 d23jpFLE8hmSCykCKXabSY05Ntu6H+YfX+q4v47A=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D7B6F800DF;
	Mon,  6 Mar 2023 18:40:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4017DF80266; Thu,  2 Mar 2023 18:26:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01F84F80236
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 18:26:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01F84F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=mJQQqz1I
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3226vmNW014653;
	Thu, 2 Mar 2023 11:26:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=EHHCWzHpF4rQVg0WOJz1Y6d6fEeVpaItK9KZDCSViAc=;
 b=mJQQqz1IgHYhq7DqljqnNdJSOhs6xcd9nRsBNmOEv54xXB6VQj4E43PGjH7xFqCxsJXQ
 xCve9TfiHXjSm7yebMy9n0k+zIcRq8ZLD5y6cKWnjQitWBvcFb7RVbYkgzk9C6XwwG5w
 DAingXGKV3Fd7c4hgGsOA7CZ+/Bck+0cY/ndhcrxdu+q7RyUt/AI7nrK+yQTZatSfJ7p
 D7Ty94vWtecjJ6ldzBlBSl36UTi+xH8eNxHe7YNxOseyzb3/Ferv+7qkMGS3aTRtzg4Y
 ISI5DMYkPnr9PyZgpeFd/jKty7V1IqS7rbsfXKaIwg5O+8x1LzLcEuSJvWA5UJY4gkC5 Hg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3nygm714ac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Mar 2023 11:26:42 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Thu, 2 Mar
 2023 11:26:40 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 2 Mar 2023 11:26:40 -0600
Received: from vkarpovich-ThinkStation-P620.crystal.cirrus.com
 (vkarpovich-ThinkStation-P620.ad.cirrus.com [141.131.206.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 65A13B06;
	Thu,  2 Mar 2023 17:26:39 +0000 (UTC)
From: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 5/5] ASoC: cs35l45: Hibernation support
Date: Thu, 2 Mar 2023 11:26:36 -0600
Message-ID: <20230302172636.2344058-1-vkarpovi@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: TLI_zyYrcrslliocW8rTnQCBa3OluUco
X-Proofpoint-GUID: TLI_zyYrcrslliocW8rTnQCBa3OluUco
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=8425611b2f=vkarpovi@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: MWQEXJB4YL6MHUJXDZP2TKG7MZU6FDDI
X-Message-ID-Hash: MWQEXJB4YL6MHUJXDZP2TKG7MZU6FDDI
X-Mailman-Approved-At: Mon, 06 Mar 2023 17:40:30 +0000
CC: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org,
 "Vlad.Karpovich" <vkarpovi@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MWQEXJB4YL6MHUJXDZP2TKG7MZU6FDDI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Vlad.Karpovich" <vkarpovi@opensource.cirrus.com>

Adds support for the amplifier hibernation controlled by
DSP firmware.

Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45-i2c.c    |  2 +
 sound/soc/codecs/cs35l45-spi.c    |  1 +
 sound/soc/codecs/cs35l45-tables.c |  6 +++
 sound/soc/codecs/cs35l45.c        | 80 +++++++++++++++++++++++++++++++
 sound/soc/codecs/cs35l45.h        | 29 +++++++++++
 5 files changed, 118 insertions(+)

diff --git a/sound/soc/codecs/cs35l45-i2c.c b/sound/soc/codecs/cs35l45-i2c.c
index 5224aaf584b8..1c644ddf66bc 100644
--- a/sound/soc/codecs/cs35l45-i2c.c
+++ b/sound/soc/codecs/cs35l45-i2c.c
@@ -33,6 +33,8 @@ static int cs35l45_i2c_probe(struct i2c_client *client)
 
 	cs35l45->dev = dev;
 	cs35l45->irq = client->irq;
+	cs35l45->bus_type = CONTROL_BUS_I2C;
+	cs35l45->i2c_addr = client->addr;
 
 	return cs35l45_probe(cs35l45);
 }
diff --git a/sound/soc/codecs/cs35l45-spi.c b/sound/soc/codecs/cs35l45-spi.c
index bfb79255783e..3ea2e6fd2b88 100644
--- a/sound/soc/codecs/cs35l45-spi.c
+++ b/sound/soc/codecs/cs35l45-spi.c
@@ -36,6 +36,7 @@ static int cs35l45_spi_probe(struct spi_device *spi)
 
 	cs35l45->dev = dev;
 	cs35l45->irq = spi->irq;
+	cs35l45->bus_type = CONTROL_BUS_SPI;
 
 	return cs35l45_probe(cs35l45);
 }
diff --git a/sound/soc/codecs/cs35l45-tables.c b/sound/soc/codecs/cs35l45-tables.c
index 6b68773979ec..212d9cb5a4fb 100644
--- a/sound/soc/codecs/cs35l45-tables.c
+++ b/sound/soc/codecs/cs35l45-tables.c
@@ -47,6 +47,8 @@ static const struct reg_default cs35l45_defaults[] = {
 	{ CS35L45_INTB_GPIO2_MCLK_REF,		0x00000005 },
 	{ CS35L45_GPIO3,			0x00000005 },
 	{ CS35L45_PWRMGT_CTL,			0x00000000 },
+	{ CS35L45_WAKESRC_CTL,			0x00000008 },
+	{ CS35L45_WKI2C_CTL,			0x00000030 },
 	{ CS35L45_REFCLK_INPUT,			0x00000510 },
 	{ CS35L45_GLOBAL_SAMPLE_RATE,		0x00000003 },
 	{ CS35L45_ASP_ENABLES1,			0x00000000 },
@@ -126,6 +128,9 @@ static bool cs35l45_readable_reg(struct device *dev, unsigned int reg)
 	case CS35L45_INTB_GPIO2_MCLK_REF:
 	case CS35L45_GPIO3:
 	case CS35L45_PWRMGT_CTL:
+	case CS35L45_WAKESRC_CTL:
+	case CS35L45_WKI2C_CTL:
+	case CS35L45_PWRMGT_STS:
 	case CS35L45_REFCLK_INPUT:
 	case CS35L45_GLOBAL_SAMPLE_RATE:
 	case CS35L45_ASP_ENABLES1:
@@ -210,6 +215,7 @@ static bool cs35l45_volatile_reg(struct device *dev, unsigned int reg)
 	case CS35L45_GLOBAL_ENABLES:
 	case CS35L45_ERROR_RELEASE:
 	case CS35L45_AMP_PCM_HPF_TST:	/* not cachable */
+	case CS35L45_PWRMGT_STS:
 	case CS35L45_IRQ1_STATUS:
 	case CS35L45_IRQ1_EINT_1 ... CS35L45_IRQ1_EINT_18:
 	case CS35L45_IRQ1_STS_1 ... CS35L45_IRQ1_STS_18:
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index c5de2c8a9fe3..a2bab613daa2 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -36,6 +36,8 @@ static bool cs35l45_check_cspl_mbox_sts(const enum cs35l45_cspl_mboxcmd cmd,
 		return (sts == CSPL_MBOX_STS_RUNNING);
 	case CSPL_MBOX_CMD_STOP_PRE_REINIT:
 		return (sts == CSPL_MBOX_STS_RDY_FOR_REINIT);
+	case CSPL_MBOX_CMD_HIBERNATE:
+		return (sts == CSPL_MBOX_STS_HIBERNATE);
 	default:
 		return false;
 	}
@@ -745,11 +747,81 @@ static const struct snd_soc_component_driver cs35l45_component = {
 	.endianness = 1,
 };
 
+static void cs35l45_setup_hibernate(struct cs35l45_private *cs35l45)
+{
+	unsigned int wksrc;
+
+	if (cs35l45->bus_type == CONTROL_BUS_I2C)
+		wksrc = CS35L45_WKSRC_I2C;
+	else
+		wksrc = CS35L45_WKSRC_SPI;
+
+	regmap_update_bits(cs35l45->regmap, CS35L45_WAKESRC_CTL,
+			   CS35L45_WKSRC_EN_MASK,
+			   wksrc << CS35L45_WKSRC_EN_SHIFT);
+
+	regmap_set_bits(cs35l45->regmap, CS35L45_WAKESRC_CTL,
+			   CS35L45_UPDT_WKCTL_MASK);
+
+	regmap_update_bits(cs35l45->regmap, CS35L45_WKI2C_CTL,
+			   CS35L45_WKI2C_ADDR_MASK, cs35l45->i2c_addr);
+
+	regmap_set_bits(cs35l45->regmap, CS35L45_WKI2C_CTL,
+			   CS35L45_UPDT_WKI2C_MASK);
+}
+
+static int cs35l45_enter_hibernate(struct cs35l45_private *cs35l45)
+{
+	dev_dbg(cs35l45->dev, "Enter hibernate\n");
+
+	cs35l45_setup_hibernate(cs35l45);
+
+	// Don't wait for ACK since bus activity would wake the device
+	regmap_write(cs35l45->regmap, CS35L45_DSP_VIRT1_MBOX_1, CSPL_MBOX_CMD_HIBERNATE);
+
+	return 0;
+}
+
+static int cs35l45_exit_hibernate(struct cs35l45_private *cs35l45)
+{
+	const int wake_retries = 20;
+	const int sleep_retries = 5;
+	int ret, i, j;
+
+	for (i = 0; i < sleep_retries; i++) {
+		dev_dbg(cs35l45->dev, "Exit hibernate\n");
+
+		for (j = 0; j < wake_retries; j++) {
+			ret = cs35l45_set_cspl_mbox_cmd(cs35l45, cs35l45->regmap,
+					  CSPL_MBOX_CMD_OUT_OF_HIBERNATE);
+			if (!ret) {
+				dev_dbg(cs35l45->dev, "Wake success at cycle: %d\n", j);
+				return 0;
+			}
+			usleep_range(100, 200);
+		}
+
+		dev_err(cs35l45->dev, "Wake failed, re-enter hibernate: %d\n", ret);
+
+		cs35l45_setup_hibernate(cs35l45);
+	}
+
+	dev_err(cs35l45->dev, "Timed out waking device\n");
+
+	return -ETIMEDOUT;
+}
+
 static int __maybe_unused cs35l45_runtime_suspend(struct device *dev)
 {
 	struct cs35l45_private *cs35l45 = dev_get_drvdata(dev);
 
+	if (!cs35l45->dsp.preloaded || !cs35l45->dsp.cs_dsp.running)
+		return 0;
+
+	cs35l45_enter_hibernate(cs35l45);
+
 	regcache_cache_only(cs35l45->regmap, true);
+	regcache_mark_dirty(cs35l45->regmap);
 
 	dev_dbg(cs35l45->dev, "Runtime suspended\n");
 
@@ -761,9 +833,17 @@ static int __maybe_unused cs35l45_runtime_resume(struct device *dev)
 	struct cs35l45_private *cs35l45 = dev_get_drvdata(dev);
 	int ret;
 
+	if (!cs35l45->dsp.preloaded || !cs35l45->dsp.cs_dsp.running)
+		return 0;
+
 	dev_dbg(cs35l45->dev, "Runtime resume\n");
 
 	regcache_cache_only(cs35l45->regmap, false);
+
+	ret = cs35l45_exit_hibernate(cs35l45);
+	if (ret)
+		return ret;
+
 	ret = regcache_sync(cs35l45->regmap);
 	if (ret != 0)
 		dev_warn(cs35l45->dev, "regcache_sync failed: %d\n", ret);
diff --git a/sound/soc/codecs/cs35l45.h b/sound/soc/codecs/cs35l45.h
index 87032619b341..0da28439f628 100644
--- a/sound/soc/codecs/cs35l45.h
+++ b/sound/soc/codecs/cs35l45.h
@@ -30,6 +30,9 @@
 #define CS35L45_INTB_GPIO2_MCLK_REF		0x00002434
 #define CS35L45_GPIO3				0x00002438
 #define CS35L45_PWRMGT_CTL			0x00002900
+#define CS35L45_WAKESRC_CTL			0x00002904
+#define CS35L45_WKI2C_CTL			0x00002908
+#define CS35L45_PWRMGT_STS			0x0000290C
 #define CS35L45_REFCLK_INPUT			0x00002C04
 #define CS35L45_GLOBAL_SAMPLE_RATE		0x00002C0C
 #define CS35L45_BOOST_CCM_CFG			0x00003808
@@ -348,6 +351,25 @@
 #define CS35L45_POST_GLOBAL_EN_US		5000
 #define CS35L45_PRE_GLOBAL_DIS_US		3000
 
+/* WAKESRC_CTL */
+#define CS35L45_WKSRC_SYNC_GPIO1		BIT(0)
+#define CS35L45_WKSRC_INT_GPIO2			BIT(1)
+#define CS35L45_WKSRC_GPIO3			BIT(2)
+#define CS35L45_WKSRC_SPI			BIT(3)
+#define CS35L45_WKSRC_I2C			BIT(4)
+#define CS35L45_UPDT_WKCTL_SHIFT		15
+#define CS35L45_UPDT_WKCTL_MASK			BIT(15)
+#define CS35L45_WKSRC_EN_SHIFT			8
+#define CS35L45_WKSRC_EN_MASK			GENMASK(12, 8)
+#define CS35L45_WKSRC_POL_SHIFT			0
+#define CS35L45_WKSRC_POL_MASK			GENMASK(3, 0)
+
+/* WAKEI2C_CTL */
+#define CS35L45_UPDT_WKI2C_SHIFT		15
+#define CS35L45_UPDT_WKI2C_MASK			BIT(15)
+#define CS35L45_WKI2C_ADDR_SHIFT		0
+#define CS35L45_WKI2C_ADDR_MASK			GENMASK(6, 0)
+
 #define CS35L45_SPI_MAX_FREQ			4000000
 
 enum cs35l45_cspl_mboxstate {
@@ -369,6 +391,11 @@ enum cs35l45_cspl_mboxcmd {
 	CSPL_MBOX_CMD_INVALID_SEQUENCE = -2,
 };
 
+enum control_bus_type {
+	CONTROL_BUS_I2C = 0,
+	CONTROL_BUS_SPI = 1,
+};
+
 #define CS35L45_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 			 SNDRV_PCM_FMTBIT_S24_3LE| \
 			 SNDRV_PCM_FMTBIT_S24_LE)
@@ -439,6 +466,8 @@ struct cs35l45_private {
 	u8 slot_count;
 	int irq_invert;
 	int irq;
+	unsigned int i2c_addr;
+	enum control_bus_type bus_type;
 	struct regmap_irq_chip_data *irq_data;
 };
 
-- 
2.25.1

