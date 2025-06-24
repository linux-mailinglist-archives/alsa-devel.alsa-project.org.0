Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0201AEB8D9
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 15:27:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76CE4601D5;
	Fri, 27 Jun 2025 15:27:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76CE4601D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751030833;
	bh=nxa3PYsW5o+v8bg44bRchymZgJvbA1YySSHeKd9Iwao=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VA0cNUVsdyWIwZytkLidZO/0p8P3dCekmz6LccfspDllHlYLQKHvQqREO4RNGNCEq
	 0RhqRlhnZSAMZ/S5u4FE/ieEerFg4hbUnu3l7Gw6Kb4/yoUxI/AvrxFl/uV2y5nmpq
	 awsu7u9TKfsjcwO/i3iu9CWyTDugdWgwgmCy/Dqs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B9A6F807CA; Fri, 27 Jun 2025 15:23:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C1A0F807D1;
	Fri, 27 Jun 2025 15:23:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73575F804CF; Tue, 24 Jun 2025 17:38:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1ED9CF8026D
	for <alsa-devel@alsa-project.org>; Tue, 24 Jun 2025 17:38:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ED9CF8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=lVGJlRTf
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OFc6Ke1904457;
	Tue, 24 Jun 2025 10:38:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750779486;
	bh=IL0UbWjx4pPSayogeWKWnaFYfqNTkvm+cXMiKv5fADM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lVGJlRTfkIKC5TWCO5ZyIvY1hN+YZzzayFqK69exRwG8bxkG8ln8QQ9mZSqDCzoPm
	 xDiB51Y7yg0F8/HfqgejVkfbD7hBxtYkE89Gogm0ozEayaSeLcfW3cIAWAzot+FZ8y
	 Th/vNnuzf0+zN5AurcxXZuc6aJ2426qHY1NL3z1w=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OFc6c51671305
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 10:38:06 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 10:38:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 10:38:05 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com [10.82.30.14]
 (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OFboxn1744431;
	Tue, 24 Jun 2025 10:38:03 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <tiwai@suse.de>,
        <alsa-devel@alsa-project.org>, <baojun.xu@ti.com>,
        <shenghao-ding@ti.com>, <liam.r.girdwood@intel.com>, <navada@ti.com>,
        <v-hampiholi@ti.com>, <niranjan.hy@ti.com>
Subject: [PATCH v2 3/4] Asoc: pcm6240: remove support for taac5x1x family
Date: Tue, 24 Jun 2025 21:07:41 +0530
Message-ID: <20250624153742.1507-4-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20250624153742.1507-1-niranjan.hy@ti.com>
References: <20250624153742.1507-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QCVMXYFMR57CXYTAAYY7SQJ4VV2PQYUK
X-Message-ID-Hash: QCVMXYFMR57CXYTAAYY7SQJ4VV2PQYUK
X-Mailman-Approved-At: Fri, 27 Jun 2025 13:23:54 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QCVMXYFMR57CXYTAAYY7SQJ4VV2PQYUK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tac5x1x codec driver suporrts tac5x1x family which includes
the following ADCs and DACs. So removed the duplicate entries
in the pcm6240 i2c driver.

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 sound/soc/codecs/pcm6240.c | 124 +------------------------------------
 sound/soc/codecs/pcm6240.h |   4 --
 2 files changed, 3 insertions(+), 125 deletions(-)

diff --git a/sound/soc/codecs/pcm6240.c b/sound/soc/codecs/pcm6240.c
index 75af12231d1d..bbf3eb18bf54 100644
--- a/sound/soc/codecs/pcm6240.c
+++ b/sound/soc/codecs/pcm6240.c
@@ -44,10 +44,6 @@ static const struct i2c_device_id pcmdevice_i2c_id[] = {
 	{ "pcmd3140", PCMD3140 },
 	{ "pcmd3180", PCMD3180 },
 	{ "pcmd512x", PCMD512X },
-	{ "taa5212",  TAA5212  },
-	{ "taa5412",  TAA5412  },
-	{ "tad5212",  TAD5212  },
-	{ "tad5412",  TAD5412  },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, pcmdevice_i2c_id);
@@ -442,60 +438,6 @@ static const struct pcmdevice_mixer_control pcmd3180_fine_gain_ctl[] = {
 	}
 };
 
-static const struct pcmdevice_mixer_control taa5412_digi_vol_ctl[] = {
-	{
-		.shift = 0,
-		.reg = TAA5412_REG_CH1_DIGITAL_VOLUME,
-		.max = 0xff,
-		.invert = 0,
-	},
-	{
-		.shift = 0,
-		.reg = TAA5412_REG_CH2_DIGITAL_VOLUME,
-		.max = 0xff,
-		.invert = 0,
-	},
-	{
-		.shift = 0,
-		.reg = TAA5412_REG_CH3_DIGITAL_VOLUME,
-		.max = 0xff,
-		.invert = 0,
-	},
-	{
-		.shift = 0,
-		.reg = TAA5412_REG_CH4_DIGITAL_VOLUME,
-		.max = 0xff,
-		.invert = 0,
-	}
-};
-
-static const struct pcmdevice_mixer_control taa5412_fine_gain_ctl[] = {
-	{
-		.shift = 4,
-		.reg = TAA5412_REG_CH1_FINE_GAIN,
-		.max = 0xf,
-		.invert = 0,
-	},
-	{
-		.shift = 4,
-		.reg = TAA5412_REG_CH2_FINE_GAIN,
-		.max = 0xf,
-		.invert = 0,
-	},
-	{
-		.shift = 4,
-		.reg = TAA5412_REG_CH3_FINE_GAIN,
-		.max = 0xf,
-		.invert = 4,
-	},
-	{
-		.shift = 0,
-		.reg = TAA5412_REG_CH4_FINE_GAIN,
-		.max = 0xf,
-		.invert = 4,
-	}
-};
-
 static const DECLARE_TLV_DB_MINMAX_MUTE(pcmd3140_dig_gain_tlv,
 	-10000, 2700);
 static const DECLARE_TLV_DB_MINMAX_MUTE(pcm1690_fine_dig_gain_tlv,
@@ -512,7 +454,7 @@ static const DECLARE_TLV_DB_MINMAX_MUTE(pcm6260_fgain_tlv,
 static const DECLARE_TLV_DB_LINEAR(pcm6260_chgain_tlv, 0, 4200);
 static const DECLARE_TLV_DB_MINMAX_MUTE(taa5412_dig_vol_tlv,
 	-8050, 4700);
-static const DECLARE_TLV_DB_LINEAR(taa5412_fine_gain_tlv,
+static const DECLARE_TLV_DB_LINEAR(pcmd31x0_fine_gain_tlv,
 	-80, 70);
 
 static int pcmdev_change_dev(struct pcmdevice_priv *pcm_priv,
@@ -981,7 +923,7 @@ static const struct pcmdev_ctrl_info pcmdev_gain_ctl_info[][2] = {
 	// PCMD3140
 	{
 		{
-			.gain = taa5412_fine_gain_tlv,
+			.gain = pcmd31x0_fine_gain_tlv,
 			.pcmdev_ctrl = pcmd3140_fine_gain_ctl,
 			.ctrl_array_size = ARRAY_SIZE(pcmd3140_fine_gain_ctl),
 			.get = pcmdevice_get_volsw,
@@ -1000,7 +942,7 @@ static const struct pcmdev_ctrl_info pcmdev_gain_ctl_info[][2] = {
 	// PCMD3180
 	{
 		{
-			.gain = taa5412_fine_gain_tlv,
+			.gain = pcmd31x0_fine_gain_tlv,
 			.pcmdev_ctrl = pcmd3180_fine_gain_ctl,
 			.ctrl_array_size = ARRAY_SIZE(pcmd3180_fine_gain_ctl),
 			.get = pcmdevice_get_volsw,
@@ -1025,62 +967,6 @@ static const struct pcmdev_ctrl_info pcmdev_gain_ctl_info[][2] = {
 			.ctrl_array_size = 0,
 		},
 	},
-	// TAA5212
-	{
-		{
-			.gain = taa5412_fine_gain_tlv,
-			.pcmdev_ctrl = taa5412_fine_gain_ctl,
-			.ctrl_array_size = ARRAY_SIZE(taa5412_fine_gain_ctl),
-			.get = pcmdevice_get_volsw,
-			.put = pcmdevice_put_volsw,
-			.pcmdev_ctrl_name_id = 2,
-		},
-		{
-			.gain = taa5412_dig_vol_tlv,
-			.pcmdev_ctrl = taa5412_digi_vol_ctl,
-			.ctrl_array_size = ARRAY_SIZE(taa5412_digi_vol_ctl),
-			.get = pcmdevice_get_volsw,
-			.put = pcmdevice_put_volsw,
-			.pcmdev_ctrl_name_id = 1,
-		},
-	},
-	// TAA5412
-	{
-		{
-			.gain = taa5412_fine_gain_tlv,
-			.pcmdev_ctrl = taa5412_fine_gain_ctl,
-			.ctrl_array_size = ARRAY_SIZE(taa5412_fine_gain_ctl),
-			.get = pcmdevice_get_volsw,
-			.put = pcmdevice_put_volsw,
-			.pcmdev_ctrl_name_id = 2,
-		},
-		{
-			.gain = taa5412_dig_vol_tlv,
-			.pcmdev_ctrl = taa5412_digi_vol_ctl,
-			.ctrl_array_size = ARRAY_SIZE(taa5412_digi_vol_ctl),
-			.get = pcmdevice_get_volsw,
-			.put = pcmdevice_put_volsw,
-			.pcmdev_ctrl_name_id = 1,
-		},
-	},
-	// TAD5212
-	{
-		{
-			.ctrl_array_size = 0,
-		},
-		{
-			.ctrl_array_size = 0,
-		},
-	},
-	// TAD5412
-	{
-		{
-			.ctrl_array_size = 0,
-		},
-		{
-			.ctrl_array_size = 0,
-		},
-	},
 };
 
 static int pcmdev_dev_bulk_write(struct pcmdevice_priv *pcm_dev,
@@ -2002,10 +1888,6 @@ static const struct of_device_id pcmdevice_of_match[] = {
 	{ .compatible = "ti,pcmd3140" },
 	{ .compatible = "ti,pcmd3180" },
 	{ .compatible = "ti,pcmd512x" },
-	{ .compatible = "ti,taa5212"  },
-	{ .compatible = "ti,taa5412"  },
-	{ .compatible = "ti,tad5212"  },
-	{ .compatible = "ti,tad5412"  },
 	{},
 };
 MODULE_DEVICE_TABLE(of, pcmdevice_of_match);
diff --git a/sound/soc/codecs/pcm6240.h b/sound/soc/codecs/pcm6240.h
index 2d8f9e798139..86b1ef734a3d 100644
--- a/sound/soc/codecs/pcm6240.h
+++ b/sound/soc/codecs/pcm6240.h
@@ -33,10 +33,6 @@ enum pcm_device {
 	PCMD3140,
 	PCMD3180,
 	PCMD512X,
-	TAA5212,
-	TAA5412,
-	TAD5212,
-	TAD5412,
 	MAX_DEVICE,
 };
 
-- 
2.45.2

