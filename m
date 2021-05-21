Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A3A38CA8C
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 18:03:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D43E616BD;
	Fri, 21 May 2021 18:02:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D43E616BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621613017;
	bh=HNRRmYnaIxK3RXvhVtRukWmQRs1d3CBVriDT5nwayjk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LRexbF7qupWtzo0uCnuMSTFBbEKpnvWG+mbtHEaexyzq30TF8DdOwdSEwRQcGat/8
	 VlSZZsTzQWMyScLrICwbbXdRcYhFxndsSTUBa0Fuyb0mKApRtrf7wCcJiPHo1CWB0N
	 AH7SVc5bWMYkKTFNADo0GTp/rMXlNZKg6hDR9H8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86A1BF80259;
	Fri, 21 May 2021 18:02:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E5F3F80258; Fri, 21 May 2021 18:02:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB39CF800E5
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 18:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB39CF800E5
IronPort-SDR: 0hp8etg4aTq0sonx8G5ui71K7UaF4k02NWLj7/R721HTjDy5syUqAd4HUNf6fNZ7YxakNaPymd
 h+NjKbavOzgg==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="198430680"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="198430680"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 09:01:31 -0700
IronPort-SDR: 0WdU+Dux96kJoPPoXVYevJObJJLECdhO0hsbfrQHswnokXja/jW5W1ZGW7N8xUiwjcHxdvpRcL
 oOHEfDg/8EdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="468543223"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by FMSMGA003.fm.intel.com with ESMTP; 21 May 2021 09:01:23 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/2] ASoC: Intel: common: Add entries for sdw codecs in ADL
 match table
Date: Fri, 21 May 2021 18:56:31 +0300
Message-Id: <20210521155632.3736393-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com,
 Jie Yang <yang.jie@linux.intel.com>, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, Bard Liao <bard.liao@intel.com>,
 yung-chuan.liao@linux.intel.com,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>

RT5682 and Max98373 are added with SDW0,SDW2 links respectively.

Signed-off-by: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-adl-match.c   | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 39ac6d52106f..22c465f1d5d8 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -223,6 +223,30 @@ static const struct snd_soc_acpi_link_adr adl_sdw_rt1316_link2_rt714_link0[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_adr_device mx8373_2_adr[] = {
+	{
+		.adr = 0x000223019F837300ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "Left"
+	},
+	{
+		.adr = 0x000227019F837300ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "Right"
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt5682_0_adr[] = {
+	{
+		.adr = 0x000021025D568200ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt5682"
+	}
+};
+
 static const struct snd_soc_acpi_link_adr adl_rvp[] = {
 	{
 		.mask = BIT(0),
@@ -232,6 +256,20 @@ static const struct snd_soc_acpi_link_adr adl_rvp[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr adl_chromebook_base[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt5682_0_adr),
+		.adr_d = rt5682_0_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(mx8373_2_adr),
+		.adr_d = mx8373_2_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_codecs adl_max98373_amp = {
 	.num_codecs = 1,
 	.codecs = {"MX98373"}
@@ -295,6 +333,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-adl-rt711.tplg",
 	},
+	{
+		.link_mask = 0x5, /* rt5682 on link0 & 2xmax98373 on link 2 */
+		.links = adl_chromebook_base,
+		.drv_name = "sof_sdw",
+		.sof_fw_filename = "sof-adl.ri",
+		.sof_tplg_filename = "sof-adl-sdw-max98373-rt5682.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_adl_sdw_machines);

base-commit: aa736700f42fa0813e286ca2f9274ffaa25163b9
-- 
2.31.0

