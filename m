Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A5B4D2175
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 20:29:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D559D1895;
	Tue,  8 Mar 2022 20:28:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D559D1895
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646767769;
	bh=BPRAnuh+l541aSDHdWMkJ+0rN71ZzjLde+JGhn4drp8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GK1ZTvMfaFV8cAGRJwLlrd9l2oHBw1gcXrsL8c1GeE3PcS8ve5RjixHRz9aZXFdTi
	 yUVZR9j+hjuocx6NxUtl3SoS+wQS2TKySKKp/HVOsYh9U6eQ9LYrtRPX/JHeZeI2DG
	 k1fknRey8ePuI3Ly0R0ogIq3ybjILDRxUI1cfzq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 048F5F8051B;
	Tue,  8 Mar 2022 20:26:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAD48F80533; Tue,  8 Mar 2022 20:26:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4FA7F80272
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 20:26:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4FA7F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="l5qZLXhR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646767608; x=1678303608;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BPRAnuh+l541aSDHdWMkJ+0rN71ZzjLde+JGhn4drp8=;
 b=l5qZLXhRpGDBkOYOXjUbJ+1PC6l9eJ9kjeYlEH4g5RGJuNn1E2FqygMr
 MWlTWfRFa3L84UKnmU2q8NjUs42MFx7tOhzTNqlWyuNnBisM3CG0e6CRy
 auyddNLpO12H8Zd+vU3lywWjBbA7uMedk5onOpA3KcrSRU6AOdjUi3QlJ
 qMraiB7fyh5e6P8WOlllQrKKlgZ0lnRzd186MqwkU7gDopiMCO8YO8zBm
 DhAcjGrGnMGaudmE9Wi2qzuGd4EAgqSNg3rxDwTjuVlQ7JRAjT43CYHEc
 8ND/Z7JUPNggTg77CFAMR56U8/O5NhZa3LBrjQnuM422O1ANCRIFvCv/I w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252363703"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252363703"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:44 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="495573957"
Received: from jhaskins-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.53.149])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 11:26:43 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/20] ASoC: Intel: soc-acpi: add more ACPI HIDs for ES83x6
 devices
Date: Tue,  8 Mar 2022 13:25:58 -0600
Message-Id: <20220308192610.392950-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
References: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 anthony tonitch <d.tonitch@gmail.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Huajun Li <huajun.li@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Nikolai Kostrigin <nickel@altlinux.org>, broonie@kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

We only saw ESSX8336 so far, but now with reports of 'ESSX8326' we
need to expand to a full list. Let's reuse the 'snd_soc_acpi_codecs'
structure to store the information.

Note that ES8326 will need a dedicated codec driver, but the plan is
to use the same machine driver for all Everest Audio devices.

Reported-by: anthony tonitch <d.tonitch@gmail.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-bxt-match.c | 7 ++++++-
 sound/soc/intel/common/soc-acpi-intel-cml-match.c | 7 ++++++-
 sound/soc/intel/common/soc-acpi-intel-glk-match.c | 7 ++++++-
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c | 7 ++++++-
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c | 7 ++++++-
 5 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-bxt-match.c b/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
index 0a2d0874dc4f..f99cf6c794dc 100644
--- a/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
@@ -41,6 +41,11 @@ static struct snd_soc_acpi_mach *apl_quirk(void *arg)
 	return mach;
 }
 
+static const struct snd_soc_acpi_codecs essx_83x6 = {
+	.num_codecs = 3,
+	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
+};
+
 static const struct snd_soc_acpi_codecs bxt_codecs = {
 	.num_codecs = 1,
 	.codecs = {"MX98357A"}
@@ -78,7 +83,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_bxt_machines[] = {
 		.sof_tplg_filename = "sof-apl-tdf8532.tplg",
 	},
 	{
-		.id = "ESSX8336",
+		.comp_ids = &essx_83x6,
 		.drv_name = "sof-essx8336",
 		.sof_tplg_filename = "sof-apl-es8336", /* the tplg suffix is added at run time */
 		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index f75fa1b551d7..5eab17820532 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -9,6 +9,11 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 
+static const struct snd_soc_acpi_codecs essx_83x6 = {
+	.num_codecs = 3,
+	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
+};
+
 static const struct snd_soc_acpi_codecs rt1011_spk_codecs = {
 	.num_codecs = 1,
 	.codecs = {"10EC1011"}
@@ -76,7 +81,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[] = {
 		.sof_tplg_filename = "sof-cml-da7219-max98390.tplg",
 	},
 	{
-		.id = "ESSX8336",
+		.comp_ids = &essx_83x6,
 		.drv_name = "sof-essx8336",
 		.sof_tplg_filename = "sof-cml-es8336", /* the tplg suffix is added at run time */
 		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
diff --git a/sound/soc/intel/common/soc-acpi-intel-glk-match.c b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
index d494860b8190..387e73100884 100644
--- a/sound/soc/intel/common/soc-acpi-intel-glk-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
@@ -9,6 +9,11 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 
+static const struct snd_soc_acpi_codecs essx_83x6 = {
+	.num_codecs = 3,
+	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
+};
+
 static const struct snd_soc_acpi_codecs glk_codecs = {
 	.num_codecs = 1,
 	.codecs = {"MX98357A"}
@@ -53,7 +58,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_glk_machines[] = {
 		.sof_tplg_filename = "sof-glk-cs42l42.tplg",
 	},
 	{
-		.id = "ESSX8336",
+		.comp_ids = &essx_83x6,
 		.drv_name = "sof-essx8336",
 		.sof_tplg_filename = "sof-glk-es8336", /* the tplg suffix is added at run time */
 		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
index 53c42a4e1694..b95c4b2cda94 100644
--- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
@@ -9,6 +9,11 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 
+static const struct snd_soc_acpi_codecs essx_83x6 = {
+	.num_codecs = 3,
+	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
+};
+
 static const struct snd_soc_acpi_codecs jsl_7219_98373_codecs = {
 	.num_codecs = 1,
 	.codecs = {"MX98373"}
@@ -81,7 +86,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 		.sof_tplg_filename = "sof-jsl-cs42l42-mx98360a.tplg",
 	},
 	{
-		.id = "ESSX8336",
+		.comp_ids = &essx_83x6,
 		.drv_name = "sof-essx8336",
 		.sof_tplg_filename = "sof-jsl-es8336", /* the tplg suffix is added at run time */
 		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 8bf14295deb0..6edc9b7108cd 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -10,6 +10,11 @@
 #include <sound/soc-acpi-intel-match.h>
 #include "soc-acpi-intel-sdw-mockup-match.h"
 
+static const struct snd_soc_acpi_codecs essx_83x6 = {
+	.num_codecs = 3,
+	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
+};
+
 static const struct snd_soc_acpi_codecs tgl_codecs = {
 	.num_codecs = 1,
 	.codecs = {"MX98357A"}
@@ -391,7 +396,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
 		.sof_tplg_filename = "sof-tgl-rt1011-rt5682.tplg",
 	},
 	{
-		.id = "ESSX8336",
+		.comp_ids = &essx_83x6,
 		.drv_name = "sof-essx8336",
 		.sof_tplg_filename = "sof-tgl-es8336", /* the tplg suffix is added at run time */
 		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
-- 
2.30.2

