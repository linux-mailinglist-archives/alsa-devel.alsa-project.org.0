Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4711E1189F4
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 14:37:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAF761674;
	Tue, 10 Dec 2019 14:36:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAF761674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575985036;
	bh=mTUihdz55D21j0JwbN/cuxcW83iJW6Co56muvH01VMo=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=csqOiMjTwxaoznHvElFmdI++EySApi0OXn7Fm/6rHIj0PH2RcrGzstHyHqKCJn28s
	 xnKVYGNor/N6DFoaqg6/piqXn1F9Ntvk1pNn7mVcVnIWrAKxtvsShj8U16yI+1HYi/
	 QdcoxhGvjleodPOYvPSt0WxUM0Miq1Omd+ABf4G4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91A84F8011E;
	Tue, 10 Dec 2019 14:23:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18D41F8034A; Tue, 10 Dec 2019 14:23:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E5C24F80346
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:23:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5C24F80346
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EEBB11B3;
 Tue, 10 Dec 2019 05:23:25 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 926763F52E;
 Tue, 10 Dec 2019 05:23:24 -0800 (PST)
Date: Tue, 10 Dec 2019 13:23:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Amery Song <chao.song@intel.com>
In-Reply-To: <20191210004854.16845-9-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191210004854.16845-9-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: common: work-around incorrect
	ACPI HID for CML boards" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: Intel: common: work-around incorrect ACPI HID for CML boards

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 4e64ba3fd181b207c00d392b27ed484b89108dce Mon Sep 17 00:00:00 2001
From: Amery Song <chao.song@intel.com>
Date: Mon, 9 Dec 2019 18:48:54 -0600
Subject: [PATCH] ASoC: Intel: common: work-around incorrect ACPI HID for CML
 boards

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
Link: https://lore.kernel.org/r/20191210004854.16845-9-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
