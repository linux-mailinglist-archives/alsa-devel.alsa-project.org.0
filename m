Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 045AD77C3D0
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 01:16:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3357F74C;
	Tue, 15 Aug 2023 01:15:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3357F74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692054972;
	bh=AZp1SKo/99ayEKfU6S/47LOo31HcZUWzgyYR1nTcGSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FHMbpGnYSfeCzNTahuMPxncTmZhKU5qiG2TbZR/5E4RBgNG3R4pWWSOwoe1onzAfQ
	 mfdPSvTsHcWFZVFE3BSpKqb6X/ylrj3cARmgZu7zXYlvcvswpJdy2sCXgMi7dmYOdb
	 8OCnNb0nFndoeseE1efjLVvCyIb7/l/5EpibmT74=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F26B9F80016; Tue, 15 Aug 2023 01:14:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD58AF80016;
	Tue, 15 Aug 2023 01:14:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89C41F80510; Tue, 15 Aug 2023 01:14:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A23EDF801EB
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 01:14:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A23EDF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gj1TAZhg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692054860; x=1723590860;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AZp1SKo/99ayEKfU6S/47LOo31HcZUWzgyYR1nTcGSE=;
  b=gj1TAZhg2iWLWq7jGVSId3dXyFVlWm61SNITHObVu4QT3hDp3mCa4Rja
   Yey2rjTT9mWuDYHZoHhJJjs/H4g4qZOnG8FH3RtzC/8MbXZQsfSllYX9v
   rIXswV1BgQNxsXnRTQeEq4q+sJzYj2a5fIcA2xJVoLOeKmsHLEfJ+fbOc
   Z/ItEj1dTdksZ+oXmvb+bLJhH/f4h59hDlUaWEmlXnmkTvRHkkTmZHVKK
   JuTzjVgTpT8tCexJw4tGinxtAK+OJeP13H3RsXbFlsYj6o13cAPV2xyCr
   LjT8uEz6fgiTQPrM65qErqLjdEXTnR65QMVLW9J681OJVA73h5RvZvCvO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="403136800"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200";
   d="scan'208";a="403136800"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 16:14:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="1064250682"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200";
   d="scan'208";a="1064250682"
Received: from dishasur-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.104.139])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 16:14:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Chao Song <chao.song@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 3/4] ASoC: Intel: soc-acpi: add support for Dell SKU0C87
 devices
Date: Mon, 14 Aug 2023 18:13:57 -0500
Message-Id: <20230814231358.78971-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230814231358.78971-1-pierre-louis.bossart@linux.intel.com>
References: <20230814231358.78971-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: W7LQOMNWCBRHIY5BNZ2BR5NCEBXSXMQZ
X-Message-ID-Hash: W7LQOMNWCBRHIY5BNZ2BR5NCEBXSXMQZ
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W7LQOMNWCBRHIY5BNZ2BR5NCEBXSXMQZ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chao Song <chao.song@linux.intel.com>

This patch adds the acpi match table for Dell SKU0C87
devices, the codec layout is:
    SDW0: RT714 DMIC
    SDW1: RT1318 Speaker
    SDW2: RT1318 Speaker

Note that there is no jack codec on SKU0C87 devices.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index ed9821adc1d9..0304246d2922 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -161,6 +161,33 @@ static const struct snd_soc_acpi_adr_device rt1316_3_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1318_1_group1_adr[] = {
+	{
+		.adr = 0x000130025D131801ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "rt1318-1"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1318_2_group1_adr[] = {
+	{
+		.adr = 0x000232025D131801ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1318-2"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt714_0_adr[] = {
+	{
+		.adr = 0x000030025D071401ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt714"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt714_1_adr[] = {
 	{
 		.adr = 0x000130025D071401ull,
@@ -232,6 +259,25 @@ static const struct snd_soc_acpi_link_adr mtl_3_in_1_sdca[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr mtl_sdw_rt1318_l12_rt714_l0[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1318_1_group1_adr),
+		.adr_d = rt1318_1_group1_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1318_2_group1_adr),
+		.adr_d = rt1318_2_group1_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt714_0_adr),
+		.adr_d = rt714_0_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_adr_device mx8363_2_adr[] = {
 	{
 		.adr = 0x000230019F836300ull,
@@ -298,6 +344,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt712-l0-rt1712-l3.tplg",
 	},
+	{
+		.link_mask = GENMASK(2, 0),
+		.links = mtl_sdw_rt1318_l12_rt714_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-rt1318-l12-rt714-l0.tplg"
+	},
 	{
 		.link_mask = GENMASK(3, 0),
 		.links = mtl_3_in_1_sdca,
-- 
2.39.2

