Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8BD89FC28
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Apr 2024 17:56:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6946722AA;
	Wed, 10 Apr 2024 17:56:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6946722AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712764594;
	bh=nI5H5Oi7NfxlOQLWFliwvxz12AjodVIonU7PNCClEZg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=prijxtrvVf2VVni/KEwj5T7MOWPFNwSD8UkV5cFgH2q+NJdgRr7xdpvFBXbUYa0L2
	 ULXVTufdUzPUC7SHHr+QFB5cXOmqmVGHNpaUqERRDX0XDpsKVC5mor0k6dESXl3ziC
	 n6K0mLcrPahzuRKAM6+JKWEiHcKI2IQZWRwBnG/E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C147FF80692; Wed, 10 Apr 2024 17:54:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CD43F80694;
	Wed, 10 Apr 2024 17:54:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03AEAF80571; Wed, 10 Apr 2024 17:52:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2B18F805AE
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 17:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2B18F805AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=He+VdkiE
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 43A5ji5A028164;
	Wed, 10 Apr 2024 10:52:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=/OqTZZjRkAbMo+sRpjQI0cVTC8ltQ+LaMd+cRPBtkcc=; b=
	He+VdkiESTZ0xBnvviCaiiDKRiOoWBHb+hzA1ynsUUlIQpEd8UpBhlzmN2Zoh3CI
	uVFicabse0oKBZb6Btp3p1GV2SPffd1o750SlvjhBqRS6ZP1HU7AzrRdukhzjNma
	4louQT3LaIxIIR/gc7dBJ25AV0SsIYERG9ns8yhoyduuAvZ8VUOoRPbUFnYCSg7J
	5IGcg7GcOpLs5qiL33Z5G7GazobGMYXWY0pIhIsStHaIMGv/VGnaDIjNEQjdT4Ta
	JCdxD0fr2lfdAnSQtpLR1wNYujcZwzm9+clZ87w2NCtqUS0I6GcgoK3vApU8UdqS
	ckG7B0U4amL3XSSyUU6eNw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3xb3sxn6f9-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 10:52:42 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 10 Apr
 2024 16:52:26 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9
 via Frontend Transport; Wed, 10 Apr 2024 16:52:26 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (SHANCC79D24.ad.cirrus.com
 [198.61.64.86])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 18C0D82024A;
	Wed, 10 Apr 2024 15:52:26 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 4/7] ALSA: hda: cs35l41: Update DSP1RX5/6 Sources for DSP
 config
Date: Wed, 10 Apr 2024 16:52:20 +0100
Message-ID: <20240410155223.7164-5-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410155223.7164-1-sbinding@opensource.cirrus.com>
References: <20240410155223.7164-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 1cmClrWHnpaT4L94SeprS0MgHElY3jpD
X-Proofpoint-GUID: 1cmClrWHnpaT4L94SeprS0MgHElY3jpD
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 4RE25XPB663KVDUO2PPVY55HQRJX5AUW
X-Message-ID-Hash: 4RE25XPB663KVDUO2PPVY55HQRJX5AUW
X-MailFrom: prvs=1830201b57=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4RE25XPB663KVDUO2PPVY55HQRJX5AUW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Currently, all PC systems are set to use VBSTMON for DSP1RX5_SRC,
however, this is required only for external boost systems.
Internal boost systems require VPMON instead of VBSTMON to be the
input to DSP1RX5_SRC.
All systems require DSP1RX6_SRC to be set to VBSTMON.
Also fix incorrect comment for DACPCM1_SRC to use DSP1TX1.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index c2a8e4361eef..875285201bbc 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -102,7 +102,7 @@ static const struct reg_sequence cs35l41_hda_config_dsp[] = {
 	{ CS35L41_SP_HIZ_CTRL,		0x00000003 }, // Hi-Z unused/disabled
 	{ CS35L41_SP_TX_WL,		0x00000018 }, // 24 cycles/slot
 	{ CS35L41_SP_RX_WL,		0x00000018 }, // 24 cycles/slot
-	{ CS35L41_DAC_PCM1_SRC,		0x00000032 }, // DACPCM1_SRC = ERR_VOL
+	{ CS35L41_DAC_PCM1_SRC,		0x00000032 }, // DACPCM1_SRC = DSP1TX1
 	{ CS35L41_ASP_TX1_SRC,		0x00000018 }, // ASPTX1 SRC = VMON
 	{ CS35L41_ASP_TX2_SRC,		0x00000019 }, // ASPTX2 SRC = IMON
 	{ CS35L41_ASP_TX3_SRC,		0x00000028 }, // ASPTX3 SRC = VPMON
@@ -111,7 +111,7 @@ static const struct reg_sequence cs35l41_hda_config_dsp[] = {
 	{ CS35L41_DSP1_RX2_SRC,		0x00000008 }, // DSP1RX2 SRC = ASPRX1
 	{ CS35L41_DSP1_RX3_SRC,         0x00000018 }, // DSP1RX3 SRC = VMON
 	{ CS35L41_DSP1_RX4_SRC,         0x00000019 }, // DSP1RX4 SRC = IMON
-	{ CS35L41_DSP1_RX5_SRC,         0x00000029 }, // DSP1RX5 SRC = VBSTMON
+	{ CS35L41_DSP1_RX6_SRC,         0x00000029 }, // DSP1RX6 SRC = VBSTMON
 };
 
 static const struct reg_sequence cs35l41_hda_unmute[] = {
@@ -693,6 +693,10 @@ static void cs35l41_hda_play_start(struct device *dev)
 	if (cs35l41->cs_dsp.running) {
 		regmap_multi_reg_write(reg, cs35l41_hda_config_dsp,
 				       ARRAY_SIZE(cs35l41_hda_config_dsp));
+		if (cs35l41->hw_cfg.bst_type == CS35L41_INT_BOOST)
+			regmap_write(reg, CS35L41_DSP1_RX5_SRC, CS35L41_INPUT_SRC_VPMON);
+		else
+			regmap_write(reg, CS35L41_DSP1_RX5_SRC, CS35L41_INPUT_SRC_VBSTMON);
 		regmap_update_bits(reg, CS35L41_PWR_CTRL2,
 				   CS35L41_VMON_EN_MASK | CS35L41_IMON_EN_MASK,
 				   1 << CS35L41_VMON_EN_SHIFT | 1 << CS35L41_IMON_EN_SHIFT);
-- 
2.34.1

