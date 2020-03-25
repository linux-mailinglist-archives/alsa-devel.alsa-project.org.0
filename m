Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3CB193398
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 23:10:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4F16168A;
	Wed, 25 Mar 2020 23:09:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4F16168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585174224;
	bh=pdb2HhFeiDl9eOWbhUfs3qJGLA0oeYEpGglziGO4a8M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TPfpQYkrvly4Tuq9RL8w7ANXgFkN4m0RqnetsRryy2jjoxBE0Esxi+VnvxTkEwJbH
	 rxnaY/FaZ200517YCo6m8hr+4bA7mNf/SMrLKYGVcMf0Z++qgjYB0cHnCd7+ozn4GY
	 0J4fcdbDKX7/mLY/k3PWKB2dshISrJeB9rlzEQ2M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CB75F800EF;
	Wed, 25 Mar 2020 23:08:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F5D5F8011E; Wed, 25 Mar 2020 23:07:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C59DF8011E
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 23:07:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C59DF8011E
IronPort-SDR: 2uQpYSp+4xvN83+atZOuLkptG7LynpJVM/HhXDW8YXST113QV/Y1yNQU3RLeyQvN/mk9CgJ41Q
 LlCZ7aVqzG2Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 15:07:50 -0700
IronPort-SDR: wKMkflxYKGnMWf1KtKA00DdG0Uai9FDbgp1Uyp6AeHmJ2BFC4FLIiv3ZkxrbV4aXEPadZUVJlU
 fNpCv98/zMyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,306,1580803200"; d="scan'208";a="238634741"
Received: from abeljans.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.233.195])
 by fmsmga007.fm.intel.com with ESMTP; 25 Mar 2020 15:07:49 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ASoC: Intel: soc-acpi: update topology and driver name
 for SoundWire platforms
Date: Wed, 25 Mar 2020 17:07:43 -0500
Message-Id: <20200325220746.29601-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200325220746.29601-1-pierre-louis.bossart@linux.intel.com>
References: <20200325220746.29601-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
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

From: Rander Wang <rander.wang@intel.com>

Update topology and reflect change to unified machine driver for SoundWire.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-cml-match.c   | 24 ++++++++++++++++---
 .../intel/common/soc-acpi-intel-icl-match.c   |  6 ++---
 .../intel/common/soc-acpi-intel-tgl-match.c   |  6 ++---
 3 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index 3525da79c68a..bcedec6c6117 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -80,6 +80,23 @@ static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
 	.group_id = 1,
 };
 
+static const struct snd_soc_acpi_adr_device rt700_1_adr[] = {
+	{
+		.adr = 0x000110025D070000,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+	}
+};
+
+static const struct snd_soc_acpi_link_adr cml_rvp[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt700_1_adr),
+		.adr_d = rt700_1_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 	{
 		.adr = 0x000010025D071100,
@@ -175,7 +192,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_sdw_machines[] = {
 	{
 		.link_mask = 0xF, /* 4 active links required */
 		.links = cml_3_in_1_default,
-		.drv_name = "sdw_rt711_rt1308_rt715",
+		.drv_name = "sof_sdw",
 		.sof_fw_filename = "sof-cml.ri",
 		.sof_tplg_filename = "sof-cml-rt711-rt1308-rt715.tplg",
 	},
@@ -187,13 +204,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_sdw_machines[] = {
 		 */
 		.link_mask = 0xF,
 		.links = cml_3_in_1_mono_amp,
-		.drv_name = "sdw_rt711_rt1308_rt715",
+		.drv_name = "sof_sdw",
 		.sof_fw_filename = "sof-cml.ri",
 		.sof_tplg_filename = "sof-cml-rt711-rt1308-mono-rt715.tplg",
 	},
 	{
 		.link_mask = 0x2, /* RT700 connected on Link1 */
-		.drv_name = "sdw_rt700",
+		.links = cml_rvp,
+		.drv_name = "sof_sdw",
 		.sof_fw_filename = "sof-cml.ri",
 		.sof_tplg_filename = "sof-cml-rt700.tplg",
 	},
diff --git a/sound/soc/intel/common/soc-acpi-intel-icl-match.c b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
index a05fc083829e..ef8500349f2f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-icl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
@@ -166,21 +166,21 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_icl_sdw_machines[] = {
 	{
 		.link_mask = 0xF, /* 4 active links required */
 		.links = icl_3_in_1_default,
-		.drv_name = "sdw_rt711_rt1308_rt715",
+		.drv_name = "sof_sdw",
 		.sof_fw_filename = "sof-icl.ri",
 		.sof_tplg_filename = "sof-icl-rt711-rt1308-rt715.tplg",
 	},
 	{
 		.link_mask = 0xB, /* 3 active links required */
 		.links = icl_3_in_1_mono_amp,
-		.drv_name = "sdw_rt711_rt1308_rt715",
+		.drv_name = "sof_sdw",
 		.sof_fw_filename = "sof-icl.ri",
 		.sof_tplg_filename = "sof-icl-rt711-rt1308-rt715-mono.tplg",
 	},
 	{
 		.link_mask = 0x1, /* rt700 connected on link0 */
 		.links = icl_rvp,
-		.drv_name = "sdw_rt700",
+		.drv_name = "sof_sdw",
 		.sof_fw_filename = "sof-icl.ri",
 		.sof_tplg_filename = "sof-icl-rt700.tplg",
 	},
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 3153b44f9053..db360c9a8e5b 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -87,11 +87,11 @@ static struct snd_soc_acpi_codecs tgl_max98373_amp = {
 struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
 	{
 		.id = "10EC1308",
-		.drv_name = "rt711_rt1308",
+		.drv_name = "sof_sdw",
 		.link_mask = 0x1, /* RT711 on SoundWire link0 */
 		.links = tgl_i2s_rt1308,
 		.sof_fw_filename = "sof-tgl.ri",
-		.sof_tplg_filename = "sof-tgl-rt711-rt1308.tplg",
+		.sof_tplg_filename = "sof-tgl-rt711-i2s-rt1308.tplg",
 	},
 	{
 		.id = "10EC5682",
@@ -118,7 +118,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_sdw_machines[] = {
 	{
 		.link_mask = 0x3, /* rt711 on link 0 and 2 rt1308s on link 1 */
 		.links = tgl_rvp,
-		.drv_name = "sdw_rt711_rt1308_rt715",
+		.drv_name = "sof_sdw",
 		.sof_fw_filename = "sof-tgl.ri",
 		.sof_tplg_filename = "sof-tgl-rt711-rt1308.tplg",
 	},
-- 
2.20.1

