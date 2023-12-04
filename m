Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B470880358C
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 14:53:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 316FB850;
	Mon,  4 Dec 2023 14:53:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 316FB850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701698030;
	bh=epiSG6enmyIw6GzmxbKtYQcN7bIZnjr2v9DbAR0TM3o=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qrOw6H9mQVR8sav1zjEBjs8dPI/NfXp7Uo9Usr+ADbuJwkmnTRONnW7dvGMlYGDUa
	 GW2pixrlvCayiSvjQBzmsbeAGW/wpChXG0ABtpNE/OchO9W/sxGY1cDkvWBfrTPRwY
	 08+Ld8sVSEqRGjtBYG82dEuUUSi0khXJ062cEeSs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9E99F80578; Mon,  4 Dec 2023 14:53:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CBE4F80571;
	Mon,  4 Dec 2023 14:53:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72D35F8025A; Mon,  4 Dec 2023 14:53:24 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 31864F800E4
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 14:53:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31864F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=LW9cSdPm
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B47ABGq012871;
	Mon, 4 Dec 2023 07:53:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=t
	Hr3GFB2AAZ+8RQEf5NqMNxRghhA7v6HdOduQdJcU38=; b=LW9cSdPm0Jjg0vNdD
	UQPu0Zz/8Vsw4uUVKZMcjxeFwA34087WaNCtKz0Z10iaGTbmBvAhyQ6U+tp6ZZwR
	BT0cxTKi5mqAM/j84mTWPIXg17z3ppR2MVZeBwuBDmKdslqZlfia+f4lhxCcJ5/n
	fBaMCFlpeLX0JaZMByb7Sn8KFDsWaXUBBbIXU7HV+YtsgvBGqWvTv/k67l57KX4I
	IznGu83hAKwN3mZgxrV2ffNvHvoeW+BZdnG+ODqgWmGRmFftonqRuAnFC3w+F9ZO
	jIuAm/Nn9CpWI0y5aCsHjU8AcbUUmmzJtkrxCo9NnwQgkUBJYSFas0RNMzodhV5K
	f90EQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ur2v21wh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 07:53:09 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 4 Dec
 2023 13:53:07 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 4 Dec 2023 13:53:07 +0000
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.82])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 39ADD468;
	Mon,  4 Dec 2023 13:53:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>
CC: <kai.vehmanen@linux.intel.com>, <cezary.rojewski@intel.com>,
        <ranjani.sridharan@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH v2] ASoC: Intel: soc-acpi-intel-tgl-match: add cs42l43 and
 cs56l56 support
Date: Mon, 4 Dec 2023 13:53:07 +0000
Message-ID: <20231204135307.2169282-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: q4qY35oE08cDeYYWgDuMtvu6D8fvmtQT
X-Proofpoint-GUID: q4qY35oE08cDeYYWgDuMtvu6D8fvmtQT
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 2OPDPGNXZMQ3QTFCEGILSJ3BMZN2SBN7
X-Message-ID-Hash: 2OPDPGNXZMQ3QTFCEGILSJ3BMZN2SBN7
X-MailFrom: prvs=7702ab03e0=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2OPDPGNXZMQ3QTFCEGILSJ3BMZN2SBN7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

This is a test configuration for UpExtreme with Cirrus Logic
CS35L56-EIGHT-C board.

The codec layout is configured as:
    - Link3: CS42L43 Jack
    - Link0: 2x CS35L56 Speaker (amps 1 and 2)
    - Link1: 2x CS35L56 Speaker (amps 7 and 8)

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
Changes since V1:
- Changed ALSA prefixes for CS35L56 to 'AMPn'
- Renumbered the CS35L56 prefixes to match the numbering of the
  OUTn speaker sockets on the EIGHT-C board
---
 .../intel/common/soc-acpi-intel-tgl-match.c   | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 5804926c8b56..e5f721ba5ed4 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -41,6 +41,20 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 	.group_id = 1,
 };
 
+static const struct snd_soc_acpi_endpoint spk_2_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 2,
+	.group_id = 1,
+};
+
+static const struct snd_soc_acpi_endpoint spk_3_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 3,
+	.group_id = 1,
+};
+
 static const struct snd_soc_acpi_endpoint rt712_endpoints[] = {
 	{
 		.num = 0,
@@ -400,6 +414,64 @@ static const struct snd_soc_acpi_link_adr tgl_712_only[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_adr_device cs42l43_3_adr[] = {
+	{
+		.adr = 0x00033001FA424301ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "cs42l43"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56_0_adr[] = {
+	{
+		.adr = 0x00003301FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00003201FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_3_endpoint,
+		.name_prefix = "AMP2"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56_1_adr[] = {
+	{
+		.adr = 0x00013701FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP8"
+	},
+	{
+		.adr = 0x00013601FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_2_endpoint,
+		.name_prefix = "AMP7"
+	}
+};
+
+static const struct snd_soc_acpi_link_adr tgl_cs42l43_cs35l56[] = {
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(cs42l43_3_adr),
+		.adr_d = cs42l43_3_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs35l56_0_adr),
+		.adr_d = cs35l56_0_adr,
+	},
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(cs35l56_1_adr),
+		.adr_d = cs35l56_1_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_codecs tgl_max98373_amp = {
 	.num_codecs = 1,
 	.codecs = {"MX98373"}
@@ -494,6 +566,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-tgl-rt715-rt711-rt1308-mono.tplg",
 	},
+	{
+		.link_mask = 0xB,
+		.links = tgl_cs42l43_cs35l56,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-tgl-cs42l43-l3-cs35l56-l01.tplg",
+	},
 	{
 		.link_mask = 0xF, /* 4 active links required */
 		.links = tgl_3_in_1_default,
-- 
2.30.2

