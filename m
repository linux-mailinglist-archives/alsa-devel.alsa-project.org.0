Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1C7838D7D
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jan 2024 12:33:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BE5C846;
	Tue, 23 Jan 2024 12:33:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BE5C846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706009623;
	bh=twtRZ2kll5KW9N9kkXciaYDPMJ1u2zhZUwcgEU9uU8o=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MyqUO9vp1lu+CxVXK5tMNy4hfivaJ+CL/03cv+I7M/QBdmqm69gGrCXOddl7WNIaC
	 5/sYuxoyJwfTILHnJXQwjmp8JK+pBX7Wlb+ryV+ZQnnXviKJxk3S1+OfePy7zTkrbO
	 V72WZk2GpYf9RKiIn67t4LQ7oqcFDzcAcPytAUwA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31A61F8056F; Tue, 23 Jan 2024 12:33:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AF81F8057D;
	Tue, 23 Jan 2024 12:33:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F88AF8028D; Tue, 23 Jan 2024 12:33:06 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D8F31F800C1
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 12:32:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8F31F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=E35gdN8p
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40N79viZ014543;
	Tue, 23 Jan 2024 05:32:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=4
	T+B66DEuygAYHn9hCMdllptWsqq7spVdej7e0tRy2M=; b=E35gdN8pWEmx9gHs8
	lvLUYhxMqWBzgplu1+9LdNkLAGPvfhMO0Ik7tF15yjBaDvhqmz5AKLwFSnqKeoPf
	DLO6QYJKQjqcNRsI53M3qyfNleTyYCvgmj7vCCKRGU1KI0y8JzIFOvo8oLr8b8Lp
	TaNujfzpKHa6Qy2uviedcgYStPgyHEaUGm/mRBStMLu2DCtHvA6H0qqX037Wh+23
	8AgusId4rVzQpwjAIIiCrCeGVzBit+j4GohmIXBg86XNlr2KE6jNAdfAQKVbdzNB
	wwufnkUCQN4avlVK0oYOFtC7lZ3Ns3yYqeDR2EH2j+w9ZFN6NUkqfhC2zoJ2mnhz
	H4FFA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vrbfpv08h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jan 2024 05:32:50 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 23 Jan
 2024 11:32:48 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Tue, 23 Jan 2024 11:32:48 +0000
Received: from upx-tgl-008-ubuntu.ad.cirrus.com
 (upx-tgl-008-ubuntu.ad.cirrus.com [198.90.251.167])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 5642D820246;
	Tue, 23 Jan 2024 11:32:48 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: Cezary Rojewski <cezary.rojewski@intel.com>,
        Liam Girdwood
	<lgirdwood@gmail.com>,
        Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>,
        Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen
	<kai.vehmanen@linux.intel.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Maciej Strozek
	<mstrozek@opensource.cirrus.com>
Subject: [PATCH v3] ASoC: Intel: mtl-match: Add cs42l43_l0 cs35l56_l23 for MTL
Date: Tue, 23 Jan 2024 11:32:46 +0000
Message-ID: <20240123113246.75539-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: mPrvXXtcJcK4-aJCKt1zKhfeVQHatr58
X-Proofpoint-GUID: mPrvXXtcJcK4-aJCKt1zKhfeVQHatr58
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: KNUATJJG7UMD6CARVTMP7K4NVIUI5C7L
X-Message-ID-Hash: KNUATJJG7UMD6CARVTMP7K4NVIUI5C7L
X-MailFrom: prvs=8752699952=mstrozek@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KNUATJJG7UMD6CARVTMP7K4NVIUI5C7L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The layout is configured as:
- Link0: CS42L43 Jack and mics (2ch)
- Link2: 2x CS35L56 Speaker (amps 3 and 4, right)
- Link3: 2x CS35L56 Speaker (amps 1 and 2, left)

Corresponding SOF topology:
https://github.com/thesofproject/sof/pull/8773

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
v2 -> v3: added layout description and link to required SOF topology
v1 -> v2: swapped AMP3 and AMP4 prefixes

 .../intel/common/soc-acpi-intel-mtl-match.c   | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index feb12c6c85d1..23eaf47b3f24 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -377,6 +377,37 @@ static const struct snd_soc_acpi_adr_device cs35l56_2_adr[] = {
 	}
 };

+static const struct snd_soc_acpi_adr_device cs35l56_2_r_adr[] = {
+	{
+		.adr = 0x00023201FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "AMP3"
+	},
+	{
+		.adr = 0x00023301FA355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_3_endpoint,
+		.name_prefix = "AMP4"
+	}
+
+};
+
+static const struct snd_soc_acpi_adr_device cs35l56_3_l_adr[] = {
+	{
+		.adr = 0x00033001fa355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00033101fa355601ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_2_endpoint,
+		.name_prefix = "AMP2"
+	}
+};
+
 static const struct snd_soc_acpi_link_adr rt5682_link2_max98373_link0[] = {
 	/* Expected order: jack -> amp */
 	{
@@ -554,6 +585,26 @@ static const struct snd_soc_acpi_link_adr mtl_cs42l43_cs35l56[] = {
 	{}
 };

+static const struct snd_soc_acpi_link_adr cs42l43_link0_cs35l56_link2_link3[] = {
+	/* Expected order: jack -> amp */
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(cs42l43_0_adr),
+		.adr_d = cs42l43_0_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(cs35l56_2_r_adr),
+		.adr_d = cs35l56_2_r_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(cs35l56_3_l_adr),
+		.adr_d = cs35l56_3_l_adr,
+	},
+	{}
+};
+
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 	/* mockup tests need to be first */
@@ -599,6 +650,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt1318-l12-rt714-l0.tplg"
 	},
+	{
+		.link_mask = BIT(0) | BIT(2) | BIT(3),
+		.links = cs42l43_link0_cs35l56_link2_link3,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-cs42l43-l0-cs35l56-l23.tplg",
+	},
 	{
 		.link_mask = GENMASK(2, 0),
 		.links = mtl_cs42l43_cs35l56,
--
2.34.1

