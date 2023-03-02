Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3646ACAED
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 18:43:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9ACBB1167;
	Mon,  6 Mar 2023 18:43:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9ACBB1167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678124631;
	bh=Y5e8fKq+iJ6tyFSaUOsXDoeQ1KayZxFwUi3esC8YIj0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jbzK4k9eh7NmzGQBYKVkNeY2Xs4qDHITLia8VReCL/G/tUFLUUAC2XgVSOQwjIu3i
	 Q152Jh0Q03bA2SCdJnbpld0+wepjiKZ9MBazyzxfFrKPEaILwXwaoFcYh2+TkTkt7+
	 Z7p0CYduzfiaFv32Lf9I5CmoS8m+j4pQ4gXdKDVI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B31E1F805C1;
	Mon,  6 Mar 2023 18:39:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFC2BF8025A; Thu,  2 Mar 2023 18:13:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12B05F80266
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 18:12:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12B05F80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=mDZu61hS
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3225WaTP007775;
	Thu, 2 Mar 2023 11:12:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=X2cMMS9/uMcXNfLD81Cc4NGiULLKCdOKpJ+WXk65lTk=;
 b=mDZu61hSepQdGtZ3DSOUFpeXSk3qvLBe/nNggYFWUhT1TeKl51lEQyCIfY51ZNvpj60A
 Or953rYCzyaQyz3D5u8I9Dwr58JzqQo+xs11kPUGnMw61KVYKMSQfXM4zmWDizQ/xEAx
 nuMPxNNzXX+kS03wCv4lrsvoE7Ms+P+uJsB5nJaLpWzEotoYPmvprAwVSKHJYn4dRFKK
 bhm8aemWxqlMbrDN4XZ7+UNoX4EqYZLVosSovp+I2J36alS8n1uTGZCu+pl8lnilUvlU
 6Mo4xlruJGN4kXG4Ec+VffZ2kWmp1StutfvXtwnpurHBQR2STYVRE0O6cm/YVDJQi4ie fw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3nygm713ha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Mar 2023 11:12:25 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Thu, 2 Mar
 2023 11:12:23 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 2 Mar 2023 11:12:23 -0600
Received: from vkarpovich-ThinkStation-P620.crystal.cirrus.com
 (vkarpovich-ThinkStation-P620.ad.cirrus.com [141.131.206.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 671E2B2F;
	Thu,  2 Mar 2023 17:12:22 +0000 (UTC)
From: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 4/5] ASoC: cs35l45: DSP Support
Date: Thu, 2 Mar 2023 11:11:53 -0600
Message-ID: <20230302171154.2342527-4-vkarpovi@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230302171154.2342527-1-vkarpovi@opensource.cirrus.com>
References: <20230302171154.2342527-1-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: AOqmQ43ar1MnQeVkHe8y7Lp_Bpxtya66
X-Proofpoint-GUID: AOqmQ43ar1MnQeVkHe8y7Lp_Bpxtya66
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=8425611b2f=vkarpovi@opensource.cirrus.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 56HVCX5AAX7GDJF6VKPOFAHT4JL5QZUZ
X-Message-ID-Hash: 56HVCX5AAX7GDJF6VKPOFAHT4JL5QZUZ
X-Mailman-Approved-At: Mon, 06 Mar 2023 17:39:05 +0000
CC: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org,
 "Vlad.Karpovich" <vkarpovi@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/56HVCX5AAX7GDJF6VKPOFAHT4JL5QZUZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Vlad.Karpovich" <vkarpovi@opensource.cirrus.com>

Adds HALO DSP support

Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
---
 sound/soc/codecs/Kconfig          |   4 +
 sound/soc/codecs/cs35l45-spi.c    |   3 +
 sound/soc/codecs/cs35l45-tables.c |  86 +++++++
 sound/soc/codecs/cs35l45.c        | 392 +++++++++++++++++++++++++++++-
 sound/soc/codecs/cs35l45.h        | 108 +++++++-
 5 files changed, 580 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 7022e6286e6c..5a0287e3bbec 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -357,6 +357,8 @@ config SND_SOC_WM_ADSP
 	default y if SND_SOC_WM2200=y
 	default y if SND_SOC_CS35L41_SPI=y
 	default y if SND_SOC_CS35L41_I2C=y
+	default y if SND_SOC_CS35L45_SPI=y
+	default y if SND_SOC_CS35L45_I2C=y
 	default m if SND_SOC_MADERA=m
 	default m if SND_SOC_CS47L24=m
 	default m if SND_SOC_WM5102=m
@@ -364,6 +366,8 @@ config SND_SOC_WM_ADSP
 	default m if SND_SOC_WM2200=m
 	default m if SND_SOC_CS35L41_SPI=m
 	default m if SND_SOC_CS35L41_I2C=m
+	default m if SND_SOC_CS35L45_SPI=m
+	default m if SND_SOC_CS35L45_I2C=m
 
 config SND_SOC_AB8500_CODEC
 	tristate
diff --git a/sound/soc/codecs/cs35l45-spi.c b/sound/soc/codecs/cs35l45-spi.c
index b885ad3f3d4e..bfb79255783e 100644
--- a/sound/soc/codecs/cs35l45-spi.c
+++ b/sound/soc/codecs/cs35l45-spi.c
@@ -23,6 +23,9 @@ static int cs35l45_spi_probe(struct spi_device *spi)
 	if (cs35l45 == NULL)
 		return -ENOMEM;
 
+	spi->max_speed_hz = CS35L45_SPI_MAX_FREQ;
+	spi_setup(spi);
+
 	spi_set_drvdata(spi, cs35l45);
 	cs35l45->regmap = devm_regmap_init_spi(spi, &cs35l45_spi_regmap);
 	if (IS_ERR(cs35l45->regmap)) {
diff --git a/sound/soc/codecs/cs35l45-tables.c b/sound/soc/codecs/cs35l45-tables.c
index c39c1e6876a4..6b68773979ec 100644
--- a/sound/soc/codecs/cs35l45-tables.c
+++ b/sound/soc/codecs/cs35l45-tables.c
@@ -46,6 +46,7 @@ static const struct reg_default cs35l45_defaults[] = {
 	{ CS35L45_SYNC_GPIO1,			0x00000007 },
 	{ CS35L45_INTB_GPIO2_MCLK_REF,		0x00000005 },
 	{ CS35L45_GPIO3,			0x00000005 },
+	{ CS35L45_PWRMGT_CTL,			0x00000000 },
 	{ CS35L45_REFCLK_INPUT,			0x00000510 },
 	{ CS35L45_GLOBAL_SAMPLE_RATE,		0x00000003 },
 	{ CS35L45_ASP_ENABLES1,			0x00000000 },
@@ -63,6 +64,30 @@ static const struct reg_default cs35l45_defaults[] = {
 	{ CS35L45_ASPTX3_INPUT,			0x00000020 },
 	{ CS35L45_ASPTX4_INPUT,			0x00000028 },
 	{ CS35L45_ASPTX5_INPUT,			0x00000048 },
+	{ CS35L45_DSP1_RX1_RATE,		0x00000001 },
+	{ CS35L45_DSP1_RX2_RATE,		0x00000001 },
+	{ CS35L45_DSP1_RX3_RATE,		0x00000001 },
+	{ CS35L45_DSP1_RX4_RATE,		0x00000001 },
+	{ CS35L45_DSP1_RX5_RATE,		0x00000001 },
+	{ CS35L45_DSP1_RX6_RATE,		0x00000001 },
+	{ CS35L45_DSP1_RX7_RATE,		0x00000001 },
+	{ CS35L45_DSP1_RX8_RATE,		0x00000001 },
+	{ CS35L45_DSP1_TX1_RATE,		0x00000001 },
+	{ CS35L45_DSP1_TX2_RATE,		0x00000001 },
+	{ CS35L45_DSP1_TX3_RATE,		0x00000001 },
+	{ CS35L45_DSP1_TX4_RATE,		0x00000001 },
+	{ CS35L45_DSP1_TX5_RATE,		0x00000001 },
+	{ CS35L45_DSP1_TX6_RATE,		0x00000001 },
+	{ CS35L45_DSP1_TX7_RATE,		0x00000001 },
+	{ CS35L45_DSP1_TX8_RATE,		0x00000001 },
+	{ CS35L45_DSP1RX1_INPUT,		0x00000008 },
+	{ CS35L45_DSP1RX2_INPUT,		0x00000009 },
+	{ CS35L45_DSP1RX3_INPUT,		0x00000018 },
+	{ CS35L45_DSP1RX4_INPUT,		0x00000019 },
+	{ CS35L45_DSP1RX5_INPUT,		0x00000020 },
+	{ CS35L45_DSP1RX6_INPUT,		0x00000028 },
+	{ CS35L45_DSP1RX7_INPUT,		0x0000003A },
+	{ CS35L45_DSP1RX8_INPUT,		0x00000028 },
 	{ CS35L45_AMP_PCM_CONTROL,		0x00100000 },
 	{ CS35L45_IRQ1_CFG,			0x00000000 },
 	{ CS35L45_IRQ1_MASK_1,			0xBFEFFFBF },
@@ -100,6 +125,7 @@ static bool cs35l45_readable_reg(struct device *dev, unsigned int reg)
 	case CS35L45_SYNC_GPIO1:
 	case CS35L45_INTB_GPIO2_MCLK_REF:
 	case CS35L45_GPIO3:
+	case CS35L45_PWRMGT_CTL:
 	case CS35L45_REFCLK_INPUT:
 	case CS35L45_GLOBAL_SAMPLE_RATE:
 	case CS35L45_ASP_ENABLES1:
@@ -117,6 +143,14 @@ static bool cs35l45_readable_reg(struct device *dev, unsigned int reg)
 	case CS35L45_ASPTX3_INPUT:
 	case CS35L45_ASPTX4_INPUT:
 	case CS35L45_ASPTX5_INPUT:
+	case CS35L45_DSP1RX1_INPUT:
+	case CS35L45_DSP1RX2_INPUT:
+	case CS35L45_DSP1RX3_INPUT:
+	case CS35L45_DSP1RX4_INPUT:
+	case CS35L45_DSP1RX5_INPUT:
+	case CS35L45_DSP1RX6_INPUT:
+	case CS35L45_DSP1RX7_INPUT:
+	case CS35L45_DSP1RX8_INPUT:
 	case CS35L45_AMP_PCM_CONTROL:
 	case CS35L45_AMP_PCM_HPF_TST:
 	case CS35L45_IRQ1_CFG:
@@ -128,6 +162,40 @@ static bool cs35l45_readable_reg(struct device *dev, unsigned int reg)
 	case CS35L45_GPIO1_CTRL1:
 	case CS35L45_GPIO2_CTRL1:
 	case CS35L45_GPIO3_CTRL1:
+	case CS35L45_DSP_MBOX_1:
+	case CS35L45_DSP_MBOX_2:
+	case CS35L45_DSP_VIRT1_MBOX_1 ... CS35L45_DSP_VIRT1_MBOX_4:
+	case CS35L45_DSP_VIRT2_MBOX_1 ... CS35L45_DSP_VIRT2_MBOX_4:
+	case CS35L45_DSP1_SYS_ID:
+	case CS35L45_DSP1_CLOCK_FREQ:
+	case CS35L45_DSP1_RX1_RATE:
+	case CS35L45_DSP1_RX2_RATE:
+	case CS35L45_DSP1_RX3_RATE:
+	case CS35L45_DSP1_RX4_RATE:
+	case CS35L45_DSP1_RX5_RATE:
+	case CS35L45_DSP1_RX6_RATE:
+	case CS35L45_DSP1_RX7_RATE:
+	case CS35L45_DSP1_RX8_RATE:
+	case CS35L45_DSP1_TX1_RATE:
+	case CS35L45_DSP1_TX2_RATE:
+	case CS35L45_DSP1_TX3_RATE:
+	case CS35L45_DSP1_TX4_RATE:
+	case CS35L45_DSP1_TX5_RATE:
+	case CS35L45_DSP1_TX6_RATE:
+	case CS35L45_DSP1_TX7_RATE:
+	case CS35L45_DSP1_TX8_RATE:
+	case CS35L45_DSP1_SCRATCH1:
+	case CS35L45_DSP1_SCRATCH2:
+	case CS35L45_DSP1_SCRATCH3:
+	case CS35L45_DSP1_SCRATCH4:
+	case CS35L45_DSP1_CCM_CORE_CONTROL:
+	case CS35L45_DSP1_XMEM_PACK_0 ... CS35L45_DSP1_XMEM_PACK_4607:
+	case CS35L45_DSP1_XMEM_UNPACK32_0 ... CS35L45_DSP1_XMEM_UNPACK32_3071:
+	case CS35L45_DSP1_XMEM_UNPACK24_0 ... CS35L45_DSP1_XMEM_UNPACK24_6143:
+	case CS35L45_DSP1_YMEM_PACK_0 ... CS35L45_DSP1_YMEM_PACK_1532:
+	case CS35L45_DSP1_YMEM_UNPACK32_0 ... CS35L45_DSP1_YMEM_UNPACK32_1022:
+	case CS35L45_DSP1_YMEM_UNPACK24_0 ... CS35L45_DSP1_YMEM_UNPACK24_2043:
+	case CS35L45_DSP1_PMEM_0 ... CS35L45_DSP1_PMEM_3834:
 		return true;
 	default:
 		return false;
@@ -146,6 +214,24 @@ static bool cs35l45_volatile_reg(struct device *dev, unsigned int reg)
 	case CS35L45_IRQ1_EINT_1 ... CS35L45_IRQ1_EINT_18:
 	case CS35L45_IRQ1_STS_1 ... CS35L45_IRQ1_STS_18:
 	case CS35L45_GPIO_STATUS1:
+	case CS35L45_DSP_MBOX_1:
+	case CS35L45_DSP_MBOX_2:
+	case CS35L45_DSP_VIRT1_MBOX_1 ... CS35L45_DSP_VIRT1_MBOX_4:
+	case CS35L45_DSP_VIRT2_MBOX_1 ... CS35L45_DSP_VIRT2_MBOX_4:
+	case CS35L45_DSP1_SYS_ID:
+	case CS35L45_DSP1_CLOCK_FREQ:
+	case CS35L45_DSP1_SCRATCH1:
+	case CS35L45_DSP1_SCRATCH2:
+	case CS35L45_DSP1_SCRATCH3:
+	case CS35L45_DSP1_SCRATCH4:
+	case CS35L45_DSP1_CCM_CORE_CONTROL:
+	case CS35L45_DSP1_XMEM_PACK_0 ... CS35L45_DSP1_XMEM_PACK_4607:
+	case CS35L45_DSP1_XMEM_UNPACK32_0 ... CS35L45_DSP1_XMEM_UNPACK32_3071:
+	case CS35L45_DSP1_XMEM_UNPACK24_0 ... CS35L45_DSP1_XMEM_UNPACK24_6143:
+	case CS35L45_DSP1_YMEM_PACK_0 ... CS35L45_DSP1_YMEM_PACK_1532:
+	case CS35L45_DSP1_YMEM_UNPACK32_0 ... CS35L45_DSP1_YMEM_UNPACK32_1022:
+	case CS35L45_DSP1_YMEM_UNPACK24_0 ... CS35L45_DSP1_YMEM_UNPACK24_2043:
+	case CS35L45_DSP1_PMEM_0 ... CS35L45_DSP1_PMEM_3834:
 		return true;
 	default:
 		return false;
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 0c3d01363c8d..c5de2c8a9fe3 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
+#include <linux/firmware.h>
 #include <linux/regulator/consumer.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -19,6 +20,69 @@
 
 #include "cs35l45.h"
 
+static bool cs35l45_check_cspl_mbox_sts(const enum cs35l45_cspl_mboxcmd cmd,
+					enum cs35l45_cspl_mboxstate sts)
+{
+	switch (cmd) {
+	case CSPL_MBOX_CMD_NONE:
+	case CSPL_MBOX_CMD_UNKNOWN_CMD:
+		return true;
+	case CSPL_MBOX_CMD_PAUSE:
+	case CSPL_MBOX_CMD_OUT_OF_HIBERNATE:
+		return (sts == CSPL_MBOX_STS_PAUSED);
+	case CSPL_MBOX_CMD_RESUME:
+		return (sts == CSPL_MBOX_STS_RUNNING);
+	case CSPL_MBOX_CMD_REINIT:
+		return (sts == CSPL_MBOX_STS_RUNNING);
+	case CSPL_MBOX_CMD_STOP_PRE_REINIT:
+		return (sts == CSPL_MBOX_STS_RDY_FOR_REINIT);
+	default:
+		return false;
+	}
+}
+
+static int cs35l45_set_cspl_mbox_cmd(struct cs35l45_private *cs35l45,
+				      struct regmap *regmap,
+				      const enum cs35l45_cspl_mboxcmd cmd)
+{
+	unsigned int sts = 0, i;
+	int ret;
+
+	if (!cs35l45->dsp.cs_dsp.running) {
+		dev_err(cs35l45->dev, "DSP not running\n");
+		return -EPERM;
+	}
+
+	// Set mailbox cmd
+	ret = regmap_write(regmap, CS35L45_DSP_VIRT1_MBOX_1, cmd);
+	if (ret < 0) {
+		if (cmd != CSPL_MBOX_CMD_OUT_OF_HIBERNATE)
+			dev_err(cs35l45->dev, "Failed to write MBOX: %d\n", ret);
+		return ret;
+	}
+
+	// Read mailbox status and verify it is appropriate for the given cmd
+	for (i = 0; i < 5; i++) {
+		usleep_range(1000, 1100);
+
+		ret = regmap_read(regmap, CS35L45_DSP_MBOX_2, &sts);
+		if (ret < 0) {
+			dev_err(cs35l45->dev, "Failed to read MBOX STS: %d\n", ret);
+			continue;
+		}
+
+		if (!cs35l45_check_cspl_mbox_sts(cmd, sts))
+			dev_dbg(cs35l45->dev, "[%u] cmd %u returned invalid sts %u", i, cmd, sts);
+		else
+			return 0;
+	}
+
+	if (cmd != CSPL_MBOX_CMD_OUT_OF_HIBERNATE)
+		dev_err(cs35l45->dev, "Failed to set mailbox cmd %u (status %u)\n", cmd, sts);
+
+	return -ENOMSG;
+}
+
 static int cs35l45_global_en_ev(struct snd_soc_dapm_widget *w,
 				struct snd_kcontrol *kcontrol, int event)
 {
@@ -46,10 +110,68 @@ static int cs35l45_global_en_ev(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int cs35l45_dsp_preload_ev(struct snd_soc_dapm_widget *w,
+				  struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct cs35l45_private *cs35l45 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		if (cs35l45->dsp.cs_dsp.booted)
+			return 0;
+
+		return wm_adsp_early_event(w, kcontrol, event);
+	case SND_SOC_DAPM_POST_PMU:
+		if (cs35l45->dsp.cs_dsp.running)
+			return 0;
+
+		regmap_set_bits(cs35l45->regmap, CS35L45_PWRMGT_CTL,
+				   CS35L45_MEM_RDY_MASK);
+
+		return wm_adsp_event(w, kcontrol, event);
+	case SND_SOC_DAPM_PRE_PMD:
+		if (cs35l45->dsp.preloaded)
+			return 0;
+
+		if (cs35l45->dsp.cs_dsp.running) {
+			ret = wm_adsp_event(w, kcontrol, event);
+			if (ret)
+				return ret;
+		}
+
+		return wm_adsp_early_event(w, kcontrol, event);
+	default:
+		return 0;
+	}
+}
+
+static int cs35l45_dsp_audio_ev(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct cs35l45_private *cs35l45 = snd_soc_component_get_drvdata(component);
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		return cs35l45_set_cspl_mbox_cmd(cs35l45, cs35l45->regmap,
+						 CSPL_MBOX_CMD_RESUME);
+	case SND_SOC_DAPM_PRE_PMD:
+		return cs35l45_set_cspl_mbox_cmd(cs35l45, cs35l45->regmap,
+						 CSPL_MBOX_CMD_PAUSE);
+	default:
+		return 0;
+	}
+
+	return 0;
+}
+
 static const char * const cs35l45_asp_tx_txt[] = {
 	"Zero", "ASP_RX1", "ASP_RX2",
 	"VMON", "IMON", "ERR_VOL",
 	"VDD_BATTMON", "VDD_BSTMON",
+	"DSP_TX1", "DSP_TX2",
 	"Interpolator", "IL_TARGET",
 };
 
@@ -57,6 +179,7 @@ static const unsigned int cs35l45_asp_tx_val[] = {
 	CS35L45_PCM_SRC_ZERO, CS35L45_PCM_SRC_ASP_RX1, CS35L45_PCM_SRC_ASP_RX2,
 	CS35L45_PCM_SRC_VMON, CS35L45_PCM_SRC_IMON, CS35L45_PCM_SRC_ERR_VOL,
 	CS35L45_PCM_SRC_VDD_BATTMON, CS35L45_PCM_SRC_VDD_BSTMON,
+	CS35L45_PCM_SRC_DSP_TX1, CS35L45_PCM_SRC_DSP_TX2,
 	CS35L45_PCM_SRC_INTERPOLATOR, CS35L45_PCM_SRC_IL_TARGET,
 };
 
@@ -78,12 +201,54 @@ static const struct soc_enum cs35l45_asp_tx_enums[] = {
 			      cs35l45_asp_tx_val),
 };
 
+static const char * const cs35l45_dsp_rx_txt[] = {
+	"Zero", "ASP_RX1", "ASP_RX2",
+	"VMON", "IMON", "ERR_VOL",
+	"CLASSH_TGT", "VDD_BATTMON",
+	"VDD_BSTMON", "TEMPMON",
+};
+
+static const unsigned int cs35l45_dsp_rx_val[] = {
+	CS35L45_PCM_SRC_ZERO, CS35L45_PCM_SRC_ASP_RX1, CS35L45_PCM_SRC_ASP_RX2,
+	CS35L45_PCM_SRC_VMON, CS35L45_PCM_SRC_IMON, CS35L45_PCM_SRC_ERR_VOL,
+	CS35L45_PCM_SRC_CLASSH_TGT, CS35L45_PCM_SRC_VDD_BATTMON,
+	CS35L45_PCM_SRC_VDD_BSTMON, CS35L45_PCM_SRC_TEMPMON,
+};
+
+static const struct soc_enum cs35l45_dsp_rx_enums[] = {
+	SOC_VALUE_ENUM_SINGLE(CS35L45_DSP1RX1_INPUT, 0, CS35L45_PCM_SRC_MASK,
+			      ARRAY_SIZE(cs35l45_dsp_rx_txt), cs35l45_dsp_rx_txt,
+			      cs35l45_dsp_rx_val),
+	SOC_VALUE_ENUM_SINGLE(CS35L45_DSP1RX2_INPUT, 0, CS35L45_PCM_SRC_MASK,
+			      ARRAY_SIZE(cs35l45_dsp_rx_txt), cs35l45_dsp_rx_txt,
+			      cs35l45_dsp_rx_val),
+	SOC_VALUE_ENUM_SINGLE(CS35L45_DSP1RX3_INPUT, 0, CS35L45_PCM_SRC_MASK,
+			      ARRAY_SIZE(cs35l45_dsp_rx_txt), cs35l45_dsp_rx_txt,
+			      cs35l45_dsp_rx_val),
+	SOC_VALUE_ENUM_SINGLE(CS35L45_DSP1RX4_INPUT, 0, CS35L45_PCM_SRC_MASK,
+			      ARRAY_SIZE(cs35l45_dsp_rx_txt), cs35l45_dsp_rx_txt,
+			      cs35l45_dsp_rx_val),
+	SOC_VALUE_ENUM_SINGLE(CS35L45_DSP1RX5_INPUT, 0, CS35L45_PCM_SRC_MASK,
+			      ARRAY_SIZE(cs35l45_dsp_rx_txt), cs35l45_dsp_rx_txt,
+			      cs35l45_dsp_rx_val),
+	SOC_VALUE_ENUM_SINGLE(CS35L45_DSP1RX6_INPUT, 0, CS35L45_PCM_SRC_MASK,
+			      ARRAY_SIZE(cs35l45_dsp_rx_txt), cs35l45_dsp_rx_txt,
+			      cs35l45_dsp_rx_val),
+	SOC_VALUE_ENUM_SINGLE(CS35L45_DSP1RX7_INPUT, 0, CS35L45_PCM_SRC_MASK,
+			      ARRAY_SIZE(cs35l45_dsp_rx_txt), cs35l45_dsp_rx_txt,
+			      cs35l45_dsp_rx_val),
+	SOC_VALUE_ENUM_SINGLE(CS35L45_DSP1RX8_INPUT, 0, CS35L45_PCM_SRC_MASK,
+			      ARRAY_SIZE(cs35l45_dsp_rx_txt), cs35l45_dsp_rx_txt,
+			      cs35l45_dsp_rx_val),
+};
+
 static const char * const cs35l45_dac_txt[] = {
-	"Zero", "ASP_RX1", "ASP_RX2"
+	"Zero", "ASP_RX1", "ASP_RX2", "DSP_TX1", "DSP_TX2"
 };
 
 static const unsigned int cs35l45_dac_val[] = {
-	CS35L45_PCM_SRC_ZERO, CS35L45_PCM_SRC_ASP_RX1, CS35L45_PCM_SRC_ASP_RX2
+	CS35L45_PCM_SRC_ZERO, CS35L45_PCM_SRC_ASP_RX1, CS35L45_PCM_SRC_ASP_RX2,
+	CS35L45_PCM_SRC_DSP_TX1, CS35L45_PCM_SRC_DSP_TX2
 };
 
 static const struct soc_enum cs35l45_dacpcm_enums[] = {
@@ -100,11 +265,29 @@ static const struct snd_kcontrol_new cs35l45_asp_muxes[] = {
 	SOC_DAPM_ENUM("ASP_TX5 Source", cs35l45_asp_tx_enums[4]),
 };
 
+static const struct snd_kcontrol_new cs35l45_dsp_muxes[] = {
+	SOC_DAPM_ENUM("DSP_RX1 Source", cs35l45_dsp_rx_enums[0]),
+	SOC_DAPM_ENUM("DSP_RX2 Source", cs35l45_dsp_rx_enums[1]),
+	SOC_DAPM_ENUM("DSP_RX3 Source", cs35l45_dsp_rx_enums[2]),
+	SOC_DAPM_ENUM("DSP_RX4 Source", cs35l45_dsp_rx_enums[3]),
+	SOC_DAPM_ENUM("DSP_RX5 Source", cs35l45_dsp_rx_enums[4]),
+	SOC_DAPM_ENUM("DSP_RX6 Source", cs35l45_dsp_rx_enums[5]),
+	SOC_DAPM_ENUM("DSP_RX7 Source", cs35l45_dsp_rx_enums[6]),
+	SOC_DAPM_ENUM("DSP_RX8 Source", cs35l45_dsp_rx_enums[7]),
+};
+
 static const struct snd_kcontrol_new cs35l45_dac_muxes[] = {
 	SOC_DAPM_ENUM("DACPCM1 Source", cs35l45_dacpcm_enums[0]),
 };
 
 static const struct snd_soc_dapm_widget cs35l45_dapm_widgets[] = {
+	SND_SOC_DAPM_SPK("DSP1 Preload", NULL),
+	SND_SOC_DAPM_SUPPLY_S("DSP1 Preloader", 100, SND_SOC_NOPM, 0, 0,
+				cs35l45_dsp_preload_ev,
+				SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_OUT_DRV_E("DSP1", SND_SOC_NOPM, 0, 0, NULL, 0,
+				cs35l45_dsp_audio_ev,
+				SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 	SND_SOC_DAPM_SUPPLY("GLOBAL_EN", SND_SOC_NOPM, 0, 0,
 			    cs35l45_global_en_ev,
 			    SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
@@ -139,6 +322,15 @@ static const struct snd_soc_dapm_widget cs35l45_dapm_widgets[] = {
 	SND_SOC_DAPM_MUX("ASP_TX4 Source", SND_SOC_NOPM, 0, 0, &cs35l45_asp_muxes[3]),
 	SND_SOC_DAPM_MUX("ASP_TX5 Source", SND_SOC_NOPM, 0, 0, &cs35l45_asp_muxes[4]),
 
+	SND_SOC_DAPM_MUX("DSP_RX1 Source", SND_SOC_NOPM, 0, 0, &cs35l45_dsp_muxes[0]),
+	SND_SOC_DAPM_MUX("DSP_RX2 Source", SND_SOC_NOPM, 0, 0, &cs35l45_dsp_muxes[1]),
+	SND_SOC_DAPM_MUX("DSP_RX3 Source", SND_SOC_NOPM, 0, 0, &cs35l45_dsp_muxes[2]),
+	SND_SOC_DAPM_MUX("DSP_RX4 Source", SND_SOC_NOPM, 0, 0, &cs35l45_dsp_muxes[3]),
+	SND_SOC_DAPM_MUX("DSP_RX5 Source", SND_SOC_NOPM, 0, 0, &cs35l45_dsp_muxes[4]),
+	SND_SOC_DAPM_MUX("DSP_RX6 Source", SND_SOC_NOPM, 0, 0, &cs35l45_dsp_muxes[5]),
+	SND_SOC_DAPM_MUX("DSP_RX7 Source", SND_SOC_NOPM, 0, 0, &cs35l45_dsp_muxes[6]),
+	SND_SOC_DAPM_MUX("DSP_RX8 Source", SND_SOC_NOPM, 0, 0, &cs35l45_dsp_muxes[7]),
+
 	SND_SOC_DAPM_MUX("DACPCM1 Source", SND_SOC_NOPM, 0, 0, &cs35l45_dac_muxes[0]),
 
 	SND_SOC_DAPM_OUT_DRV("AMP", SND_SOC_NOPM, 0, 0, NULL, 0),
@@ -149,6 +341,8 @@ static const struct snd_soc_dapm_widget cs35l45_dapm_widgets[] = {
 #define CS35L45_ASP_MUX_ROUTE(name) \
 	{ name" Source", "ASP_RX1",	 "ASP_RX1" }, \
 	{ name" Source", "ASP_RX2",	 "ASP_RX2" }, \
+	{ name" Source", "DSP_TX1",	 "DSP1" }, \
+	{ name" Source", "DSP_TX2",	 "DSP1" }, \
 	{ name" Source", "VMON",	 "VMON" }, \
 	{ name" Source", "IMON",	 "IMON" }, \
 	{ name" Source", "ERR_VOL",	 "ERR_VOL" }, \
@@ -157,10 +351,17 @@ static const struct snd_soc_dapm_widget cs35l45_dapm_widgets[] = {
 	{ name" Source", "Interpolator", "AMP_INTP" }, \
 	{ name" Source", "IL_TARGET",	 "IL_TARGET" }
 
-#define CS35L45_DAC_MUX_ROUTE(name) \
+#define CS35L45_DSP_MUX_ROUTE(name) \
 	{ name" Source", "ASP_RX1",	"ASP_RX1" }, \
 	{ name" Source", "ASP_RX2",	"ASP_RX2" }
 
+#define CS35L45_DAC_MUX_ROUTE(name) \
+	{ name" Source", "ASP_RX1",	"ASP_RX1" }, \
+	{ name" Source", "ASP_RX2",	"ASP_RX2" }, \
+	{ name" Source", "DSP_TX1",	"DSP1" }, \
+	{ name" Source", "DSP_TX2",	"DSP1" }
+
+
 static const struct snd_soc_dapm_route cs35l45_dapm_routes[] = {
 	/* Feedback */
 	{ "VMON", NULL, "VMON_SRC" },
@@ -204,6 +405,27 @@ static const struct snd_soc_dapm_route cs35l45_dapm_routes[] = {
 	{ "AMP", NULL, "DACPCM1 Source"},
 	{ "AMP", NULL, "GLOBAL_EN"},
 
+	CS35L45_DSP_MUX_ROUTE("DSP_RX1"),
+	CS35L45_DSP_MUX_ROUTE("DSP_RX2"),
+	CS35L45_DSP_MUX_ROUTE("DSP_RX3"),
+	CS35L45_DSP_MUX_ROUTE("DSP_RX4"),
+	CS35L45_DSP_MUX_ROUTE("DSP_RX5"),
+	CS35L45_DSP_MUX_ROUTE("DSP_RX6"),
+	CS35L45_DSP_MUX_ROUTE("DSP_RX7"),
+	CS35L45_DSP_MUX_ROUTE("DSP_RX8"),
+
+	{"DSP1", NULL, "DSP_RX1 Source"},
+	{"DSP1", NULL, "DSP_RX2 Source"},
+	{"DSP1", NULL, "DSP_RX3 Source"},
+	{"DSP1", NULL, "DSP_RX4 Source"},
+	{"DSP1", NULL, "DSP_RX5 Source"},
+	{"DSP1", NULL, "DSP_RX6 Source"},
+	{"DSP1", NULL, "DSP_RX7 Source"},
+	{"DSP1", NULL, "DSP_RX8 Source"},
+
+	{"DSP1 Preload", NULL, "DSP1 Preloader"},
+	{"DSP1", NULL, "DSP1 Preloader"},
+
 	CS35L45_DAC_MUX_ROUTE("DACPCM1"),
 
 	{ "SPK", NULL, "AMP"},
@@ -219,6 +441,8 @@ static const struct snd_kcontrol_new cs35l45_controls[] = {
 			 -409, 48,
 			 (CS35L45_AMP_VOL_PCM_WIDTH - 1) - 1,
 			 0, cs35l45_dig_pcm_vol_tlv),
+	WM_ADSP2_PRELOAD_SWITCH("DSP1", 1),
+	WM_ADSP_FW_CONTROL("DSP1", 0),
 };
 
 static int cs35l45_set_pll(struct cs35l45_private *cs35l45, unsigned int freq)
@@ -489,7 +713,24 @@ static struct snd_soc_dai_driver cs35l45_dai[] = {
 	},
 };
 
+static int cs35l45_component_probe(struct snd_soc_component *component)
+{
+	struct cs35l45_private *cs35l45 = snd_soc_component_get_drvdata(component);
+
+	return wm_adsp2_component_probe(&cs35l45->dsp, component);
+}
+
+static void cs35l45_component_remove(struct snd_soc_component *component)
+{
+	struct cs35l45_private *cs35l45 = snd_soc_component_get_drvdata(component);
+
+	wm_adsp2_component_remove(&cs35l45->dsp, component);
+}
+
 static const struct snd_soc_component_driver cs35l45_component = {
+	.probe = cs35l45_component_probe,
+	.remove = cs35l45_component_remove,
+
 	.dapm_widgets = cs35l45_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(cs35l45_dapm_widgets),
 
@@ -607,6 +848,60 @@ static int cs35l45_apply_property_config(struct cs35l45_private *cs35l45)
 	return 0;
 }
 
+static int cs35l45_dsp_virt2_mbox3_irq_handle(struct cs35l45_private *cs35l45,
+					      const unsigned int cmd,
+					      unsigned int data)
+{
+	static char *speak_status = "Unknown";
+
+	switch (cmd) {
+	case EVENT_SPEAKER_STATUS:
+		switch (data) {
+		case 1:
+			speak_status = "All Clear";
+			break;
+		case 2:
+			speak_status = "Open Circuit";
+			break;
+		case 4:
+			speak_status = "Short Circuit";
+			break;
+		}
+
+		dev_info(cs35l45->dev, "MBOX event (SPEAKER_STATUS): %s\n",
+			 speak_status);
+		break;
+	case EVENT_BOOT_DONE:
+		dev_dbg(cs35l45->dev, "MBOX event (BOOT_DONE)\n");
+		break;
+	default:
+		dev_err(cs35l45->dev, "MBOX event not supported %u\n", cmd);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static irqreturn_t cs35l45_dsp_virt2_mbox_cb(int irq, void *data)
+{
+	struct cs35l45_private *cs35l45 = data;
+	unsigned int mbox_val;
+	int ret = 0;
+
+	ret = regmap_read(cs35l45->regmap, CS35L45_DSP_VIRT2_MBOX_3, &mbox_val);
+	if (!ret && mbox_val)
+		ret = cs35l45_dsp_virt2_mbox3_irq_handle(cs35l45, mbox_val & CS35L45_MBOX3_CMD_MASK,
+				(mbox_val & CS35L45_MBOX3_DATA_MASK) >> CS35L45_MBOX3_DATA_SHIFT);
+
+	/* Handle DSP trace log IRQ */
+	ret = regmap_read(cs35l45->regmap, CS35L45_DSP_VIRT2_MBOX_4, &mbox_val);
+	if (!ret && mbox_val != 0) {
+		dev_err(cs35l45->dev, "Spurious DSP MBOX4 IRQ\n");
+	}
+
+	return IRQ_RETVAL(ret);
+}
+
 static irqreturn_t cs35l45_pll_unlock(int irq, void *data)
 {
 	struct cs35l45_private *cs35l45 = data;
@@ -639,6 +934,7 @@ static const struct cs35l45_irq cs35l45_irqs[] = {
 	CS35L45_IRQ(DSP_WDT_EXPIRE, "DSP Watchdog Timer", cs35l45_spk_safe_err),
 	CS35L45_IRQ(PLL_UNLOCK_FLAG_RISE, "PLL unlock", cs35l45_pll_unlock),
 	CS35L45_IRQ(PLL_LOCK_FLAG, "PLL lock", cs35l45_pll_lock),
+	CS35L45_IRQ(DSP_VIRT2_MBOX, "DSP virtual MBOX 2 write flag", cs35l45_dsp_virt2_mbox_cb),
 };
 
 static irqreturn_t cs35l45_spk_safe_err(int irq, void *data)
@@ -665,6 +961,7 @@ static const struct regmap_irq cs35l45_reg_irqs[] = {
 	CS35L45_REG_IRQ(IRQ1_EINT_2, DSP_WDT_EXPIRE),
 	CS35L45_REG_IRQ(IRQ1_EINT_3, PLL_UNLOCK_FLAG_RISE),
 	CS35L45_REG_IRQ(IRQ1_EINT_3, PLL_LOCK_FLAG),
+	CS35L45_REG_IRQ(IRQ1_EINT_2, DSP_VIRT2_MBOX),
 };
 
 static const struct regmap_irq_chip cs35l45_regmap_irq_chip = {
@@ -724,14 +1021,63 @@ static int cs35l45_initialize(struct cs35l45_private *cs35l45)
 	if (ret < 0)
 		return ret;
 
-	pm_runtime_set_autosuspend_delay(cs35l45->dev, 3000);
-	pm_runtime_use_autosuspend(cs35l45->dev);
-	pm_runtime_set_active(cs35l45->dev);
-	pm_runtime_enable(cs35l45->dev);
-
 	return 0;
 }
 
+static const struct reg_sequence cs35l45_fs_errata_patch[] = {
+	{0x02B80080,			0x00000001},
+	{0x02B80088,			0x00000001},
+	{0x02B80090,			0x00000001},
+	{0x02B80098,			0x00000001},
+	{0x02B800A0,			0x00000001},
+	{0x02B800A8,			0x00000001},
+	{0x02B800B0,			0x00000001},
+	{0x02B800B8,			0x00000001},
+	{0x02B80280,			0x00000001},
+	{0x02B80288,			0x00000001},
+	{0x02B80290,			0x00000001},
+	{0x02B80298,			0x00000001},
+	{0x02B802A0,			0x00000001},
+	{0x02B802A8,			0x00000001},
+	{0x02B802B0,			0x00000001},
+	{0x02B802B8,			0x00000001},
+};
+
+static const struct cs_dsp_region cs35l45_dsp1_regions[] = {
+	{ .type = WMFW_HALO_PM_PACKED,	.base = CS35L45_DSP1_PMEM_0 },
+	{ .type = WMFW_HALO_XM_PACKED,	.base = CS35L45_DSP1_XMEM_PACK_0 },
+	{ .type = WMFW_HALO_YM_PACKED,	.base = CS35L45_DSP1_YMEM_PACK_0 },
+	{. type = WMFW_ADSP2_XM,	.base = CS35L45_DSP1_XMEM_UNPACK24_0},
+	{. type = WMFW_ADSP2_YM,	.base = CS35L45_DSP1_YMEM_UNPACK24_0},
+};
+
+static int cs35l45_dsp_init(struct cs35l45_private *cs35l45)
+{
+	struct wm_adsp *dsp = &cs35l45->dsp;
+	int ret;
+
+	dsp->part = "cs35l45";
+	dsp->fw = 9; /* 9 is WM_ADSP_FW_SPK_PROT in wm_adsp.c */
+	dsp->toggle_preload = true;
+	dsp->cs_dsp.num = 1;
+	dsp->cs_dsp.type = WMFW_HALO;
+	dsp->cs_dsp.rev = 0;
+	dsp->cs_dsp.dev = cs35l45->dev;
+	dsp->cs_dsp.regmap = cs35l45->regmap;
+	dsp->cs_dsp.base = CS35L45_DSP1_CLOCK_FREQ;
+	dsp->cs_dsp.base_sysinfo = CS35L45_DSP1_SYS_ID;
+	dsp->cs_dsp.mem = cs35l45_dsp1_regions;
+	dsp->cs_dsp.num_mems = ARRAY_SIZE(cs35l45_dsp1_regions);
+	dsp->cs_dsp.lock_regions = 0xFFFFFFFF;
+
+	ret = wm_halo_init(dsp);
+
+	regmap_multi_reg_write(cs35l45->regmap, cs35l45_fs_errata_patch,
+						   ARRAY_SIZE(cs35l45_fs_errata_patch));
+
+	return ret;
+}
+
 int cs35l45_probe(struct cs35l45_private *cs35l45)
 {
 	struct device *dev = cs35l45->dev;
@@ -781,6 +1127,17 @@ int cs35l45_probe(struct cs35l45_private *cs35l45)
 	if (ret < 0)
 		goto err_reset;
 
+	ret = cs35l45_dsp_init(cs35l45);
+	if (ret < 0)
+		goto err_reset;
+
+	pm_runtime_set_autosuspend_delay(cs35l45->dev, 3000);
+	pm_runtime_use_autosuspend(cs35l45->dev);
+	pm_runtime_mark_last_busy(cs35l45->dev);
+	pm_runtime_set_active(cs35l45->dev);
+	pm_runtime_get_noresume(cs35l45->dev);
+	pm_runtime_enable(cs35l45->dev);
+
 	if (cs35l45->irq) {
 		if (cs35l45->irq_invert)
 			irq_pol |= IRQF_TRIGGER_HIGH;
@@ -791,7 +1148,7 @@ int cs35l45_probe(struct cs35l45_private *cs35l45)
 					       &cs35l45_regmap_irq_chip, &cs35l45->irq_data);
 		if (ret) {
 			dev_err(dev, "Failed to register IRQ chip: %d\n", ret);
-			goto err_reset;
+			goto err_dsp;
 		}
 
 		for (i = 0; i < ARRAY_SIZE(cs35l45_irqs); i++) {
@@ -799,7 +1156,7 @@ int cs35l45_probe(struct cs35l45_private *cs35l45)
 			if (irq < 0) {
 				dev_err(dev, "Failed to get %s\n", cs35l45_irqs[i].name);
 				ret = irq;
-				goto err_reset;
+				goto err_dsp;
 			}
 
 			ret = devm_request_threaded_irq(dev, irq, NULL, cs35l45_irqs[i].handler,
@@ -807,7 +1164,7 @@ int cs35l45_probe(struct cs35l45_private *cs35l45)
 			if (ret) {
 				dev_err(dev, "Failed to request IRQ %s: %d\n",
 					cs35l45_irqs[i].name, ret);
-				goto err_reset;
+				goto err_dsp;
 			}
 		}
 	}
@@ -816,10 +1173,17 @@ int cs35l45_probe(struct cs35l45_private *cs35l45)
 					      cs35l45_dai,
 					      ARRAY_SIZE(cs35l45_dai));
 	if (ret < 0)
-		goto err_reset;
+		goto err_dsp;
+
+	pm_runtime_put_autosuspend(cs35l45->dev);
 
 	return 0;
 
+err_dsp:
+	pm_runtime_disable(cs35l45->dev);
+	pm_runtime_put_noidle(cs35l45->dev);
+	wm_adsp2_remove(&cs35l45->dsp);
+
 err_reset:
 	gpiod_set_value_cansleep(cs35l45->reset_gpio, 0);
 err:
@@ -832,9 +1196,13 @@ EXPORT_SYMBOL_NS_GPL(cs35l45_probe, SND_SOC_CS35L45);
 
 void cs35l45_remove(struct cs35l45_private *cs35l45)
 {
+	pm_runtime_get_sync(cs35l45->dev);
 	pm_runtime_disable(cs35l45->dev);
+	wm_adsp2_remove(&cs35l45->dsp);
 
 	gpiod_set_value_cansleep(cs35l45->reset_gpio, 0);
+
+	pm_runtime_put_noidle(cs35l45->dev);
 	regulator_disable(cs35l45->vdd_a);
 	/* VDD_BATT must be the last to power-off */
 	regulator_disable(cs35l45->vdd_batt);
diff --git a/sound/soc/codecs/cs35l45.h b/sound/soc/codecs/cs35l45.h
index ce92f5068ac5..87032619b341 100644
--- a/sound/soc/codecs/cs35l45.h
+++ b/sound/soc/codecs/cs35l45.h
@@ -15,6 +15,7 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <dt-bindings/sound/cs35l45.h>
+#include "wm_adsp.h"
 
 #define CS35L45_DEVID				0x00000000
 #define CS35L45_REVID				0x00000004
@@ -28,6 +29,7 @@
 #define CS35L45_SYNC_GPIO1			0x00002430
 #define CS35L45_INTB_GPIO2_MCLK_REF		0x00002434
 #define CS35L45_GPIO3				0x00002438
+#define CS35L45_PWRMGT_CTL			0x00002900
 #define CS35L45_REFCLK_INPUT			0x00002C04
 #define CS35L45_GLOBAL_SAMPLE_RATE		0x00002C0C
 #define CS35L45_BOOST_CCM_CFG			0x00003808
@@ -48,6 +50,14 @@
 #define CS35L45_ASPTX3_INPUT			0x00004C28
 #define CS35L45_ASPTX4_INPUT			0x00004C2C
 #define CS35L45_ASPTX5_INPUT			0x00004C30
+#define CS35L45_DSP1RX1_INPUT			0x00004C40
+#define CS35L45_DSP1RX2_INPUT			0x00004C44
+#define CS35L45_DSP1RX3_INPUT			0x00004C48
+#define CS35L45_DSP1RX4_INPUT			0x00004C4C
+#define CS35L45_DSP1RX5_INPUT			0x00004C50
+#define CS35L45_DSP1RX6_INPUT			0x00004C54
+#define CS35L45_DSP1RX7_INPUT			0x00004C58
+#define CS35L45_DSP1RX8_INPUT			0x00004C5C
 #define CS35L45_LDPM_CONFIG			0x00006404
 #define CS35L45_AMP_PCM_CONTROL			0x00007000
 #define CS35L45_AMP_PCM_HPF_TST			0x00007004
@@ -91,7 +101,55 @@
 #define CS35L45_GPIO1_CTRL1			0x0000F008
 #define CS35L45_GPIO2_CTRL1			0x0000F00C
 #define CS35L45_GPIO3_CTRL1			0x0000F010
-#define CS35L45_LASTREG			0x0000F010
+#define CS35L45_DSP_MBOX_1			0x00011000
+#define CS35L45_DSP_MBOX_2			0x00011004
+#define CS35L45_DSP_VIRT1_MBOX_1		0x00011020
+#define CS35L45_DSP_VIRT1_MBOX_2		0x00011024
+#define CS35L45_DSP_VIRT1_MBOX_3		0x00011028
+#define CS35L45_DSP_VIRT1_MBOX_4		0x0001102C
+#define CS35L45_DSP_VIRT2_MBOX_1		0x00011040
+#define CS35L45_DSP_VIRT2_MBOX_2		0x00011044
+#define CS35L45_DSP_VIRT2_MBOX_3		0x00011048
+#define CS35L45_DSP_VIRT2_MBOX_4		0x0001104C
+#define CS35L45_DSP1_XMEM_PACK_0		0x02000000
+#define CS35L45_DSP1_XMEM_PACK_4607		0x020047FC
+#define CS35L45_DSP1_XMEM_UNPACK32_0		0x02400000
+#define CS35L45_DSP1_XMEM_UNPACK32_3071	0x02402FFC
+#define CS35L45_DSP1_SYS_ID			0x025E0000
+#define CS35L45_DSP1_XMEM_UNPACK24_0		0x02800000
+#define CS35L45_DSP1_XMEM_UNPACK24_6143	0x02805FFC
+#define CS35L45_DSP1_CLOCK_FREQ		0x02B80000
+#define CS35L45_DSP1_RX1_RATE			0x02B80080
+#define CS35L45_DSP1_RX2_RATE			0x02B80088
+#define CS35L45_DSP1_RX3_RATE			0x02B80090
+#define CS35L45_DSP1_RX4_RATE			0x02B80098
+#define CS35L45_DSP1_RX5_RATE			0x02B800A0
+#define CS35L45_DSP1_RX6_RATE			0x02B800A8
+#define CS35L45_DSP1_RX7_RATE			0x02B800B0
+#define CS35L45_DSP1_RX8_RATE			0x02B800B8
+#define CS35L45_DSP1_TX1_RATE			0x02B80280
+#define CS35L45_DSP1_TX2_RATE			0x02B80288
+#define CS35L45_DSP1_TX3_RATE			0x02B80290
+#define CS35L45_DSP1_TX4_RATE			0x02B80298
+#define CS35L45_DSP1_TX5_RATE			0x02B802A0
+#define CS35L45_DSP1_TX6_RATE			0x02B802A8
+#define CS35L45_DSP1_TX7_RATE			0x02B802B0
+#define CS35L45_DSP1_TX8_RATE			0x02B802B8
+#define CS35L45_DSP1_SCRATCH1			0x02B805C0
+#define CS35L45_DSP1_SCRATCH2			0x02B805C8
+#define CS35L45_DSP1_SCRATCH3			0x02B805D0
+#define CS35L45_DSP1_SCRATCH4			0x02B805D8
+#define CS35L45_DSP1_CCM_CORE_CONTROL		0x02BC1000
+#define CS35L45_DSP1_YMEM_PACK_0		0x02C00000
+#define CS35L45_DSP1_YMEM_PACK_1532		0x02C017F0
+#define CS35L45_DSP1_YMEM_UNPACK32_0		0x03000000
+#define CS35L45_DSP1_YMEM_UNPACK32_1022	0x03000FF8
+#define CS35L45_DSP1_YMEM_UNPACK24_0		0x03400000
+#define CS35L45_DSP1_YMEM_UNPACK24_2043	0x03401FEC
+#define CS35L45_DSP1_PMEM_0			0x03800000
+#define CS35L45_DSP1_PMEM_3834			0x03803BE8
+#define CS35L45_LASTREG			0x03C6EFE8
+
 /* SFT_RESET */
 #define CS35L45_SOFT_RESET_TRIGGER		0x5A000000
 
@@ -112,9 +170,20 @@
 /* BLOCK_ENABLES2 */
 #define CS35L45_ASP_EN_SHIFT			27
 
+#define CS35L45_MEM_RDY_SHIFT			1
+#define CS35L45_MEM_RDY_MASK			BIT(1)
+
 /* ERROR_RELEASE */
 #define CS35L45_GLOBAL_ERR_RLS_MASK		BIT(11)
 
+/* CCM_CORE */
+#define CS35L45_CCM_CORE_RESET_SHIFT		9
+#define CS35L45_CCM_CORE_RESET_MASK		BIT(9)
+#define CS35L45_CCM_PM_REMAP_SHIFT		7
+#define CS35L45_CCM_PM_REMAP_MASK		BIT(7)
+#define CS35L45_CCM_CORE_EN_SHIFT		0
+#define CS35L45_CCM_CORE_EN_MASK		BIT(0)
+
 /* REFCLK_INPUT */
 #define CS35L45_PLL_FORCE_EN_SHIFT		16
 #define CS35L45_PLL_FORCE_EN_MASK		BIT(16)
@@ -240,6 +309,8 @@
 /* CS35L45_IRQ1_EINT_2 */
 #define CS35L45_DSP_WDT_EXPIRE_SHIFT		4
 #define CS35L45_DSP_WDT_EXPIRE_MASK		BIT(4)
+#define CS35L45_DSP_VIRT2_MBOX_SHIFT		21
+#define CS35L45_DSP_VIRT2_MBOX_MASK		BIT(21)
 
 /* CS35L45_IRQ1_EINT_3 */
 #define CS35L45_PLL_LOCK_FLAG_SHIFT		1
@@ -266,6 +337,8 @@
 #define CS35L45_PCM_SRC_CLASSH_TGT		0x21
 #define CS35L45_PCM_SRC_VDD_BATTMON		0x28
 #define CS35L45_PCM_SRC_VDD_BSTMON		0x29
+#define CS35L45_PCM_SRC_DSP_TX1			0x32
+#define CS35L45_PCM_SRC_DSP_TX2			0x33
 #define CS35L45_PCM_SRC_TEMPMON			0x3A
 #define CS35L45_PCM_SRC_INTERPOLATOR		0x40
 #define CS35L45_PCM_SRC_IL_TARGET		0x48
@@ -275,6 +348,27 @@
 #define CS35L45_POST_GLOBAL_EN_US		5000
 #define CS35L45_PRE_GLOBAL_DIS_US		3000
 
+#define CS35L45_SPI_MAX_FREQ			4000000
+
+enum cs35l45_cspl_mboxstate {
+	CSPL_MBOX_STS_RUNNING = 0,
+	CSPL_MBOX_STS_PAUSED = 1,
+	CSPL_MBOX_STS_RDY_FOR_REINIT = 2,
+	CSPL_MBOX_STS_HIBERNATE = 3,
+};
+
+enum cs35l45_cspl_mboxcmd {
+	CSPL_MBOX_CMD_NONE = 0,
+	CSPL_MBOX_CMD_PAUSE = 1,
+	CSPL_MBOX_CMD_RESUME = 2,
+	CSPL_MBOX_CMD_REINIT = 3,
+	CSPL_MBOX_CMD_STOP_PRE_REINIT = 4,
+	CSPL_MBOX_CMD_HIBERNATE = 5,
+	CSPL_MBOX_CMD_OUT_OF_HIBERNATE = 6,
+	CSPL_MBOX_CMD_UNKNOWN_CMD = -1,
+	CSPL_MBOX_CMD_INVALID_SEQUENCE = -2,
+};
+
 #define CS35L45_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | \
 			 SNDRV_PCM_FMTBIT_S24_3LE| \
 			 SNDRV_PCM_FMTBIT_S24_LE)
@@ -318,10 +412,22 @@ enum cs35l45_irq_list {
 	CS35L45_DSP_WDT_EXPIRE_IRQ,
 	CS35L45_PLL_UNLOCK_FLAG_RISE_IRQ,
 	CS35L45_PLL_LOCK_FLAG_IRQ,
+	CS35L45_DSP_VIRT2_MBOX_IRQ,
 	CS35L45_NUM_IRQ
 };
 
+#define CS35L45_MBOX3_CMD_MASK		0xFF
+#define CS35L45_MBOX3_CMD_SHIFT		0
+#define CS35L45_MBOX3_DATA_MASK		0xFFFFFF00
+#define CS35L45_MBOX3_DATA_SHIFT	8
+
+enum mbox3_events {
+	EVENT_SPEAKER_STATUS = 0x66,
+	EVENT_BOOT_DONE = 0x67,
+};
+
 struct cs35l45_private {
+	struct wm_adsp dsp; /* needs to be first member */
 	struct device *dev;
 	struct regmap *regmap;
 	struct gpio_desc *reset_gpio;
-- 
2.25.1

