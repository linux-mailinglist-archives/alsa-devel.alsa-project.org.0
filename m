Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AABE269B073
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 17:17:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44503F9F;
	Fri, 17 Feb 2023 17:16:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44503F9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676650645;
	bh=IWu+8BdmHzVpIKVS5BpPMQNkiZPzzMjLI3OmE3MkG4c=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HsUayD2FJuHXoFveHyKemwLLGuHWcDr91ZiDny8tH5uz2j2Kop+LBJ4rP6DImlGqw
	 zfqv3+I+pKCvk2tu0xgGES4fMJEtD0mA19spSDgnFsBR70P6EIvdNajlFLTrdHs0Dw
	 68hL7gADnbiynrtOi67Nszsrn7o1RJIS6j50l2n4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23E14F80564;
	Fri, 17 Feb 2023 17:14:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66CE3F80533; Fri, 17 Feb 2023 17:14:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9B79F80171
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 17:14:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9B79F80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=pN5baqNA
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31HFgnU6014021;
	Fri, 17 Feb 2023 10:14:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=BTzjXHS8eGJxhVWLT03TdB551hVigNKYmkSmV3VC72k=;
 b=pN5baqNAzos9zTAUCDG08LxOESwchhnD/w4UVCnBRuwhy+pB7cqipWYf+D22yQBmGrWI
 TleYihdhcks1/3y5JhLNuJ9oVbSiUZT6mau+9q8w9Vx8zOUsGKzScLY8wwhAk4cHdUDg
 ++wM8+5S6kgkEInvBuXunPMnVS8B9Ky7lMwNXwIrQieu/QZls0G2+cj/fjqkmOneBkzE
 neWOKDFM3wdPS7cN0VkjRJbZPmDNLaiZZE9zr8OdHBtArxT8YWjmpnlE97xmFieMrD2Z
 5sVVXEVQP94uCqAN5ByCKFA0UKHQG3QzVlt4xswxT5EkKQ4HN7Bb9P3hcALmLcp+bGXQ 8w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3nrm8wm7t6-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Feb 2023 10:14:13 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Fri, 17 Feb
 2023 10:14:10 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via Frontend
 Transport; Fri, 17 Feb 2023 10:14:10 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DE46745;
	Fri, 17 Feb 2023 16:14:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
        <yung-chuan.liao@linux.intel.com>, <kai.vehmanen@linux.intel.com>
Subject: [PATCH 10/10] ASoC: Intel: soc-acpi: Add CS35L56 Soundwire to TGL
Date: Fri, 17 Feb 2023 16:14:10 +0000
Message-ID: <20230217161410.915202-11-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230217161410.915202-1-rf@opensource.cirrus.com>
References: <20230217161410.915202-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: mqzk6flip_3wcJ6k9Ft6Lz4HKUzCdVT6
X-Proofpoint-ORIG-GUID: mqzk6flip_3wcJ6k9Ft6Lz4HKUzCdVT6
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: EAS3JNHUWQTC3HGG35ZEIBRY6RQ7FG3V
X-Message-ID-Hash: EAS3JNHUWQTC3HGG35ZEIBRY6RQ7FG3V
X-MailFrom: prvs=74127981b7=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EAS3JNHUWQTC3HGG35ZEIBRY6RQ7FG3V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This adds match entries for one or four CS35L56 on SDW0.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 .../intel/common/soc-acpi-intel-tgl-match.c   | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index ef19150e7b2e..dae76c96d9fe 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -414,6 +414,51 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_tgl_machines);
 
+static const struct snd_soc_acpi_adr_device cs35l56_sdw0_adr[] = {
+	{
+		.adr = 0x00003001fa355601,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "AMP1"
+	},
+	{
+		.adr = 0x00003101fa355601,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "AMP2"
+	},
+	{
+		.adr = 0x00003201fa355601,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "AMP3"
+	},
+	{
+		.adr = 0x00003301fa355601,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "AMP4"
+	},
+};
+
+static const struct snd_soc_acpi_link_adr up_extreme_cs35l56_sdw0_one[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = 1,
+		.adr_d = cs35l56_sdw0_adr,
+	},
+	{}
+};
+
+static const struct snd_soc_acpi_link_adr up_extreme_cs35l56_sdw0_four[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = 4,
+		.adr_d = cs35l56_sdw0_adr,
+	},
+	{}
+};
+
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_sdw_machines[] = {
 	/* mockup tests need to be first */
@@ -501,6 +546,18 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-tgl-rt711.tplg",
 	},
+	{
+		.link_mask = BIT(0),
+		.links = up_extreme_cs35l56_sdw0_four,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-tgl-cs35l56-sdw0.tplg"
+	},
+	{
+		.link_mask = BIT(0),
+		.links = up_extreme_cs35l56_sdw0_one,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-tgl-cs35l56-sdw0.tplg"
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_tgl_sdw_machines);
-- 
2.30.2

