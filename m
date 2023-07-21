Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E0D75CB76
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 17:21:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 807C91FC;
	Fri, 21 Jul 2023 17:20:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 807C91FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689952862;
	bh=JsqpwRhiFFtLVNabz3wLhVcikUOJn4jU34y5fTRkv7w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I2fDAMWXm791VzhjoWv6PfFyxeiHxI0r/XMuAw4R/tpODAfsZaY6uf2Ckuoe2UBJP
	 3oLEDbCS2FnF+cbej7DiYa3svkfOPwrV9twmiipd71H7LB00CgPaw+O8Lb4Hs7lPY6
	 Qk2uz0synWn4G75c6IFSqnLvQwhB+wCpTyAnqP+0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C634F805AB; Fri, 21 Jul 2023 17:18:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E70E9F805AA;
	Fri, 21 Jul 2023 17:18:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6375BF80578; Fri, 21 Jul 2023 17:18:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F911F8047D
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 17:18:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F911F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=JBFOT77w
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36LDls9j007648;
	Fri, 21 Jul 2023 10:18:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=SouSdl0krn87qnxGImLLbDeHt3AjI3/2rWOxCps/3Ts=; b=
	JBFOT77wvEyGBul+425Mr/5xNGlG+DEJ++A7/7isthKS5IWFyaxzst5nbvSS1ZkA
	klW3kVCHrqg5Z/3ee9RQgHIgRXvXuQ2mnxzQ2qvp6ydSXJwvSvT43e5gdfNDextI
	g+MKooWfwGyg5G8yNj0vDWM73H4+yG4cqgwrwqlkieKZ3o9+ouE2XoEDsqoKLDqD
	OpDVoRK2ZvCthoGqeLtIvgSi4CxObJsGTnAZDJNf2pSiy8OaSyI6zaZHyW1ELec4
	h6vIkPF+ACx6hRQJN+vdgjmQDyZTDXMsY4ZI93vum1b1kO0coXK4BEy2bvIk5rFc
	vnSJLhXnJHVqWG17l28j8g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3rus62y8g9-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 10:18:32 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 21 Jul
 2023 16:18:28 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Fri, 21 Jul 2023 16:18:28 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.219])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 43FA13572;
	Fri, 21 Jul 2023 15:18:28 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v2 11/11] ALSA: hda: cs35l41: Ensure amp is only unmuted
 during playback
Date: Fri, 21 Jul 2023 16:18:16 +0100
Message-ID: <20230721151816.2080453-12-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721151816.2080453-1-sbinding@opensource.cirrus.com>
References: <20230721151816.2080453-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: GPi2fnfKoH70Rkb5qb8qmAL5rrPBZ-02
X-Proofpoint-ORIG-GUID: GPi2fnfKoH70Rkb5qb8qmAL5rrPBZ-02
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: CY7G73COY3R4MSFMDIAQCF75ZGYSMG5R
X-Message-ID-Hash: CY7G73COY3R4MSFMDIAQCF75ZGYSMG5R
X-MailFrom: prvs=2566513517=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CY7G73COY3R4MSFMDIAQCF75ZGYSMG5R/>
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

