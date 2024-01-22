Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2119836789
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 16:16:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5672C74C;
	Mon, 22 Jan 2024 16:16:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5672C74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705936588;
	bh=6XmCCPpxHEphsaXntXsmPtrApERA3bz/DPbaZcP4MAg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RwZJEDbQy4VMI03UecgtVL/wO9wkwpKL7MiQoN7CZ6kxgDRfmAlSuZxPFGlNMs6TK
	 TWoPWW7xE5QKYkG6kOs5yWy470JkibkjGAYTlMfoQMxK3f+t9SNh6KKI9IavfNQl+1
	 4WZCO4TDDJeHDuz4PVNQ/v/6LxeB+HA44Ky4LDgA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04E47F802E8; Mon, 22 Jan 2024 16:15:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 798D7F80494;
	Mon, 22 Jan 2024 16:15:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AD03F8025F; Mon, 22 Jan 2024 16:15:52 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7E407F8020D
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 16:15:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E407F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=UwJJfg8i
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40M6xJUH012194;
	Mon, 22 Jan 2024 09:15:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=l
	7xlyXeBpEure9gmT5jL9MhhiOtAVI/rNE+1KjKKJzo=; b=UwJJfg8iujCJVWxFI
	V1fpjx1UJuRLPnNZeuPjde52SdTGy2TCDRW8WgxHXR3GwC/zkxRbE6eOHjhyE8cn
	Zvppv5gVAcRxU0EJKI9T9LzcJMmnO3we6IGA+r2brOO+dlnjHjUJ1h8cJVkE2HP3
	V/+iohx+578VywY7Z0rRJndEC2S6pl0hZzFJwUm0gJXA4Q6w2Eg7NSoinI1l8VhL
	2kQuS+mFjKR1kot3zEqc2Vco5yVl3W5G1WdsTusn42HWPVgxFkqFNQkwO2Q+8qEJ
	H1yj8JwGGyKurYolc/QQ+AWQeIrIP7iURIba0DesuPlPg4yV++7HNkY5NQ7DV8Mp
	0GXuw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vrbfptnar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 09:15:48 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 22 Jan
 2024 15:15:47 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.40 via Frontend
 Transport; Mon, 22 Jan 2024 15:15:47 +0000
Received: from upx-tgl-008-ubuntu.ad.cirrus.com
 (upx-tgl-008-ubuntu.ad.cirrus.com [198.90.251.167])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B485915B7;
	Mon, 22 Jan 2024 15:15:46 +0000 (UTC)
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
Subject: [PATCH v2] ASoC: Intel: mtl-match: Add cs42l43_l0 cs35l56_l23 for MTL
Date: Mon, 22 Jan 2024 15:15:45 +0000
Message-ID: <20240122151545.69437-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 2Q_tcVVKwx5TDVlSwL2jEHdwImfvkYfQ
X-Proofpoint-GUID: 2Q_tcVVKwx5TDVlSwL2jEHdwImfvkYfQ
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: WFEXUK5ZGILXS4ZDOARSTHLTQONS5F5F
X-Message-ID-Hash: WFEXUK5ZGILXS4ZDOARSTHLTQONS5F5F
X-MailFrom: prvs=87513caafe=mstrozek@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WFEXUK5ZGILXS4ZDOARSTHLTQONS5F5F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
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

