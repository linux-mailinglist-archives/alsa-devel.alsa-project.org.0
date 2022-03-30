Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF2B4EC237
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:59:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ECB61856;
	Wed, 30 Mar 2022 13:58:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ECB61856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641567;
	bh=kKgbNHwddUiwkQ0fNo9UvyNztXfEeCzHFDRq0uA6vRs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ljxQHeNEw5H4QuFZLGc9EPv/V9kabxzUfoHmH+R0M4lKqA2kuAlrVdT3l7pDFbSNr
	 Xj4SswcJ6zNjqST2PYgXsfRSzln6foGo3E+EUsnjvM4KK5hhsaM09HqQIlIafb555M
	 HWhdnER0RC1xcG7yAgyjbKbUK3ZLlTagezeosnfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E71A0F805F6;
	Wed, 30 Mar 2022 13:50:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96C5BF80604; Wed, 30 Mar 2022 13:50:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B85C0F805FC
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:49:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B85C0F805FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vE9YiXW7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F252761618;
 Wed, 30 Mar 2022 11:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E65C36AE5;
 Wed, 30 Mar 2022 11:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640991;
 bh=kKgbNHwddUiwkQ0fNo9UvyNztXfEeCzHFDRq0uA6vRs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vE9YiXW7AU+0t1SnmbF3n/Tk8Uw4P9RgYtXcV96ONXlzfqGJPD8GpArJT+0Cr+SS9
 +jvmamRn5y1MuWyxxxTPDhtccxh+u2pi+RmsEPVpCWddDi5PpwyOSPaB+w1r+QcKAj
 Wk6hfDYsCJrqqLVEMCUJtFj8Iv+dZG6TY4F4uFHHl1Rn6NQGvkY7Fq5vv2/EszIRKt
 biyika6r75vSLyru/n8ixeITD6M68etG7WnJnSQa/uV4Qywo3yXFr4VfMXWAGAo1B3
 VZP24hg4mpaIeQ471RQJ9G/wBeQqD3qyik3NDpyJKS3p9GrM+idnfPh6gcPhtmwTIl
 mul9pVX6jiEFQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 51/59] ASoC: Intel: soc-acpi: add more ACPI HIDs
 for ES83x6 devices
Date: Wed, 30 Mar 2022 07:48:23 -0400
Message-Id: <20220330114831.1670235-51-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114831.1670235-1-sashal@kernel.org>
References: <20220330114831.1670235-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 anthony tonitch <d.tonitch@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 1cedb6eabf0f2dd8285d3bb0ce1abd2369529084 ]

We only saw ESSX8336 so far, but now with reports of 'ESSX8326' we
need to expand to a full list. Let's reuse the 'snd_soc_acpi_codecs'
structure to store the information.

Note that ES8326 will need a dedicated codec driver, but the plan is
to use the same machine driver for all Everest Audio devices.

Reported-by: anthony tonitch <d.tonitch@gmail.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Link: https://lore.kernel.org/r/20220308192610.392950-9-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/common/soc-acpi-intel-bxt-match.c | 7 ++++++-
 sound/soc/intel/common/soc-acpi-intel-cml-match.c | 7 ++++++-
 sound/soc/intel/common/soc-acpi-intel-glk-match.c | 7 ++++++-
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c | 7 ++++++-
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c | 7 ++++++-
 5 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-bxt-match.c b/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
index 342d34052204..04a92e74d99b 100644
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
@@ -83,7 +88,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_bxt_machines[] = {
 		.sof_tplg_filename = "sof-apl-tdf8532.tplg",
 	},
 	{
-		.id = "ESSX8336",
+		.comp_ids = &essx_83x6,
 		.drv_name = "sof-essx8336",
 		.sof_fw_filename = "sof-apl.ri",
 		.sof_tplg_filename = "sof-apl-es8336.tplg",
diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index 4eebc79d4b48..14395833d89e 100644
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
@@ -82,7 +87,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[] = {
 		.sof_tplg_filename = "sof-cml-da7219-max98390.tplg",
 	},
 	{
-		.id = "ESSX8336",
+		.comp_ids = &essx_83x6,
 		.drv_name = "sof-essx8336",
 		.sof_fw_filename = "sof-cml.ri",
 		.sof_tplg_filename = "sof-cml-es8336.tplg",
diff --git a/sound/soc/intel/common/soc-acpi-intel-glk-match.c b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
index 8492b7e2a945..7aa6a870d5a5 100644
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
@@ -58,7 +63,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_glk_machines[] = {
 		.sof_tplg_filename = "sof-glk-cs42l42.tplg",
 	},
 	{
-		.id = "ESSX8336",
+		.comp_ids = &essx_83x6,
 		.drv_name = "sof-essx8336",
 		.sof_fw_filename = "sof-glk.ri",
 		.sof_tplg_filename = "sof-glk-es8336.tplg",
diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
index 278ec196da7b..9d0d0e1437a4 100644
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
@@ -87,7 +92,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 		.sof_tplg_filename = "sof-jsl-cs42l42-mx98360a.tplg",
 	},
 	{
-		.id = "ESSX8336",
+		.comp_ids = &essx_83x6,
 		.drv_name = "sof-essx8336",
 		.sof_fw_filename = "sof-jsl.ri",
 		.sof_tplg_filename = "sof-jsl-es8336.tplg",
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index da31bb3cca17..e2658bca6931 100644
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
@@ -389,7 +394,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
 		.sof_tplg_filename = "sof-tgl-rt1011-rt5682.tplg",
 	},
 	{
-		.id = "ESSX8336",
+		.comp_ids = &essx_83x6,
 		.drv_name = "sof-essx8336",
 		.sof_fw_filename = "sof-tgl.ri",
 		.sof_tplg_filename = "sof-tgl-es8336.tplg",
-- 
2.34.1

