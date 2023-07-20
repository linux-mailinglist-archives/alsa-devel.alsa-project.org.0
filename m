Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DFB75B01F
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 15:35:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E18A87F4;
	Thu, 20 Jul 2023 15:34:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E18A87F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689860100;
	bh=JsqpwRhiFFtLVNabz3wLhVcikUOJn4jU34y5fTRkv7w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QRLt6z9N6PhTlQi1+37mfB+tX16NQl2E5pa1++sdXOUXQxswHcUF8aOHAvj5v3MXC
	 CNY1+0Ew3ZrlG2M8J/VkLjQrAV5sirly4sirIIXNJDdDn4kLuZPbM+mKZtX3/Z10lZ
	 J9FDwRvFbbAa6hSuZXAGPGJvCNCE+pMguYtlsdm8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D66F1F805B5; Thu, 20 Jul 2023 15:32:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33D9EF805B5;
	Thu, 20 Jul 2023 15:32:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39C6FF805A1; Thu, 20 Jul 2023 15:32:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E19EF80527
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 15:32:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E19EF80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=csSq7RS9
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36K6Acqd016432;
	Thu, 20 Jul 2023 08:32:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=SouSdl0krn87qnxGImLLbDeHt3AjI3/2rWOxCps/3Ts=; b=
	csSq7RS949aMbRTm92yJE/lh1RQ6faqHP0AXFhsOUbKuMQ8icvCpKr6BpeYf5b2N
	lvba1gzac5gr+Iz2vAYi5X8OzNzN0ue9yRruoLs2a/PTzYwRY28sArnG6HwF9bVO
	1NVfgVYlWkXp7Zb+7cXfFJKlFd8zsZoC4Q6KOOfdIv65FTsgx+nXLOHbcjud110z
	KnYEdc1IulsGdbn3yhUZmFHX/pUILMz3zolIciTkBWHprk+9eGbzWG9oK4D2SdSH
	lxmmx50FOZQnU0qSjZuudAfDq+MSwbQjC8P4iq6MhB3+UTi/jS0UBE7jjd6kPuin
	JMEU3LWB+wX1nf8MedWZvQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3rus6gx5mr-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 08:32:13 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 20 Jul
 2023 14:32:12 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Thu, 20 Jul 2023 14:32:12 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.219])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E76A53563;
	Thu, 20 Jul 2023 13:32:11 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v1 11/11] ALSA: hda: cs35l41: Ensure amp is only unmuted
 during playback
Date: Thu, 20 Jul 2023 14:31:47 +0100
Message-ID: <20230720133147.1294337-12-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720133147.1294337-1-sbinding@opensource.cirrus.com>
References: <20230720133147.1294337-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: o6pVmOxNJF9GblLfmDxfvyfRPM7p9JtK
X-Proofpoint-GUID: o6pVmOxNJF9GblLfmDxfvyfRPM7p9JtK
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: PDNLEONJA7O64L77UJ7KASPS3J3QVAG4
X-Message-ID-Hash: PDNLEONJA7O64L77UJ7KASPS3J3QVAG4
X-MailFrom: prvs=25651755c6=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PDNLEONJA7O64L77UJ7KASPS3J3QVAG4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently we only mute after playback has finished, and unmute
prior to setting global enable. To prevent any possible pops
and clicks, mute at probe, and then only unmute after global
enable is set.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 175378cdf9dfa..98feb5ccd5866 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -58,8 +58,6 @@ static const struct reg_sequence cs35l41_hda_config[] = {
 	{ CS35L41_DSP1_RX3_SRC,         0x00000018 }, // DSP1RX3 SRC = VMON
 	{ CS35L41_DSP1_RX4_SRC,         0x00000019 }, // DSP1RX4 SRC = IMON
 	{ CS35L41_DSP1_RX5_SRC,         0x00000020 }, // DSP1RX5 SRC = ERRVOL
-	{ CS35L41_AMP_DIG_VOL_CTRL,	0x00008000 }, // AMP_HPF_PCM_EN = 1, AMP_VOL_PCM  0.0 dB
-	{ CS35L41_AMP_GAIN_CTRL,	0x00000084 }, // AMP_GAIN_PCM 4.5 dB
 };
 
 static const struct reg_sequence cs35l41_hda_config_dsp[] = {
@@ -82,6 +80,14 @@ static const struct reg_sequence cs35l41_hda_config_dsp[] = {
 	{ CS35L41_DSP1_RX3_SRC,         0x00000018 }, // DSP1RX3 SRC = VMON
 	{ CS35L41_DSP1_RX4_SRC,         0x00000019 }, // DSP1RX4 SRC = IMON
 	{ CS35L41_DSP1_RX5_SRC,         0x00000029 }, // DSP1RX5 SRC = VBSTMON
+};
+
+static const struct reg_sequence cs35l41_hda_unmute[] = {
+	{ CS35L41_AMP_DIG_VOL_CTRL,	0x00008000 }, // AMP_HPF_PCM_EN = 1, AMP_VOL_PCM  0.0 dB
+	{ CS35L41_AMP_GAIN_CTRL,	0x00000084 }, // AMP_GAIN_PCM 4.5 dB
+};
+
+static const struct reg_sequence cs35l41_hda_unmute_dsp[] = {
 	{ CS35L41_AMP_DIG_VOL_CTRL,	0x00008000 }, // AMP_HPF_PCM_EN = 1, AMP_VOL_PCM  0.0 dB
 	{ CS35L41_AMP_GAIN_CTRL,	0x00000233 }, // AMP_GAIN_PCM = 17.5dB AMP_GAIN_PDM = 19.5dB
 };
@@ -522,6 +528,13 @@ static void cs35l41_hda_play_done(struct device *dev)
 
 	cs35l41_global_enable(dev, reg, cs35l41->hw_cfg.bst_type, 1, NULL,
 			      cs35l41->firmware_running);
+	if (cs35l41->firmware_running) {
+		regmap_multi_reg_write(reg, cs35l41_hda_unmute_dsp,
+				       ARRAY_SIZE(cs35l41_hda_unmute_dsp));
+	} else {
+		regmap_multi_reg_write(reg, cs35l41_hda_unmute,
+				       ARRAY_SIZE(cs35l41_hda_unmute));
+	}
 }
 
 static void cs35l41_hda_pause_start(struct device *dev)
@@ -1616,6 +1629,11 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 	if (ret)
 		goto err;
 
+	ret = regmap_multi_reg_write(cs35l41->regmap, cs35l41_hda_mute,
+				     ARRAY_SIZE(cs35l41_hda_mute));
+	if (ret)
+		goto err;
+
 	INIT_WORK(&cs35l41->fw_load_work, cs35l41_fw_load_work);
 	mutex_init(&cs35l41->fw_mutex);
 
-- 
2.34.1

