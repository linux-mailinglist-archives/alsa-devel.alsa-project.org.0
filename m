Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F456117CC0
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 01:56:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A308C74C;
	Tue, 10 Dec 2019 01:55:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A308C74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575939371;
	bh=T4x2K4RhuP+FWCrtkbESnqDQwoiTzjan5Q83ANHSx+E=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WkFODDI0duSYGSX75kuzo+xKcl6SVRFot9zVfTkrZY3ywTlOTt36ZChDOi/nsoL4O
	 7th3F7SxC5ZEzJrg0zxFx4Moez6LSNtx3oTg9dLI8MMcNVA/rJHVxqmFhJL6LrsD1v
	 qO1oxUAIHgXXIEZg4bb+ZkGaHee6ttX/tJ/36PJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30C44F8029B;
	Tue, 10 Dec 2019 01:49:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52251F8023E; Tue, 10 Dec 2019 01:49:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 186D8F80254
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 01:49:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 186D8F80254
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 16:49:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,297,1571727600"; d="scan'208";a="215398977"
Received: from sneuhier-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.188.78])
 by orsmga003.jf.intel.com with ESMTP; 09 Dec 2019 16:49:10 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 18:48:54 -0600
Message-Id: <20191210004854.16845-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210004854.16845-1-pierre-louis.bossart@linux.intel.com>
References: <20191210004854.16845-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Amery Song <chao.song@intel.com>, broonie@kernel.org,
 Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 8/8] ASoC: Intel: common: work-around incorrect
	ACPI HID for CML boards
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Amery Song <chao.song@intel.com>

On CML boards with the RT5682 headset codec and RT1011 speaker
amplifier, the platform firmware exposes three ACPI HIDs
(10EC5682, 10EC1011 and MX98357A). The last HID is a mistake in
DSDT tables, which causes the wrong machine driver to be loaded.

This patch changes the key used to identify boards and changes the
order of entries in the table to load the correct machine driver.
The order does matter and should not be modified to work-around this
firmware issue.

Signed-off-by: Amery Song <chao.song@intel.com>
Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-cml-match.c   | 41 +++++++++++--------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index 5d08ae066738..fb9ba8819706 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -9,45 +9,52 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 
-static struct snd_soc_acpi_codecs cml_codecs = {
+static struct snd_soc_acpi_codecs rt1011_spk_codecs = {
 	.num_codecs = 1,
-	.codecs = {"10EC5682"}
+	.codecs = {"10EC1011"}
 };
 
-static struct snd_soc_acpi_codecs cml_spk_codecs = {
+static struct snd_soc_acpi_codecs max98357a_spk_codecs = {
 	.num_codecs = 1,
 	.codecs = {"MX98357A"}
 };
 
+/*
+ * The order of the three entries with .id = "10EC5682" matters
+ * here, because DSDT tables expose an ACPI HID for the MAX98357A
+ * speaker amplifier which is not populated on the board.
+ */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[] = {
 	{
-		.id = "DLGS7219",
-		.drv_name = "cml_da7219_max98357a",
-		.quirk_data = &cml_spk_codecs,
+		.id = "10EC5682",
+		.drv_name = "cml_rt1011_rt5682",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &rt1011_spk_codecs,
 		.sof_fw_filename = "sof-cml.ri",
-		.sof_tplg_filename = "sof-cml-da7219-max98357a.tplg",
+		.sof_tplg_filename = "sof-cml-rt1011-rt5682.tplg",
 	},
 	{
-		.id = "MX98357A",
+		.id = "10EC5682",
 		.drv_name = "sof_rt5682",
-		.quirk_data = &cml_codecs,
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &max98357a_spk_codecs,
 		.sof_fw_filename = "sof-cml.ri",
 		.sof_tplg_filename = "sof-cml-rt5682-max98357a.tplg",
 	},
-	{
-		.id = "10EC1011",
-		.drv_name = "cml_rt1011_rt5682",
-		.quirk_data = &cml_codecs,
-		.sof_fw_filename = "sof-cml.ri",
-		.sof_tplg_filename = "sof-cml-rt1011-rt5682.tplg",
-	},
 	{
 		.id = "10EC5682",
 		.drv_name = "sof_rt5682",
 		.sof_fw_filename = "sof-cml.ri",
 		.sof_tplg_filename = "sof-cml-rt5682.tplg",
 	},
-
+	{
+		.id = "DLGS7219",
+		.drv_name = "cml_da7219_max98357a",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &max98357a_spk_codecs,
+		.sof_fw_filename = "sof-cml.ri",
+		.sof_tplg_filename = "sof-cml-da7219-max98357a.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_cml_machines);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
