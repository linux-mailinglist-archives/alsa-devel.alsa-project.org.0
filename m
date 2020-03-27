Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 626ED195A16
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 16:42:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02B181681;
	Fri, 27 Mar 2020 16:41:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02B181681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585323738;
	bh=1LanByFtZo5PsajtE2FDgpY64JbTYbwnLVB7dlcPFZo=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mMoNRRgKvNMwCtw/tra0h3UTUUcszW4bJjtrQGlCplx0JLMqox+VwLaivbQyXLo5j
	 ArZdoesMTPeiTpJXFlbShjEX4DdeOr/EHrrBlSMGVi/GE5GFqXM8dt2cloWLDJkQMm
	 zALxo8YzRRTQ813dkYtE1GzBRfzvTZLFoHTkfZ3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4537FF8031A;
	Fri, 27 Mar 2020 16:34:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC9F8F80306; Fri, 27 Mar 2020 16:34:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 21FF7F80303
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:34:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21FF7F80303
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AF7F1FB;
 Fri, 27 Mar 2020 08:34:21 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B15D23F71F;
 Fri, 27 Mar 2020 08:34:20 -0700 (PDT)
Date: Fri, 27 Mar 2020 15:34:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Applied "ASoC: soc-acpi: expand description of _ADR-based devices" to
 the asoc tree
In-Reply-To: <20200325215027.28716-2-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200325215027.28716-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

The patch

   ASoC: soc-acpi: expand description of _ADR-based devices

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 004bd4163104e4d8b6c1433b31ead10a69c69845 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Wed, 25 Mar 2020 16:50:17 -0500
Subject: [PATCH] ASoC: soc-acpi: expand description of _ADR-based devices

For SoundWire, we need to know if endpoints needs to be 'aggregated'
(MIPI parlance, meaning logically grouped), e.g. when two speaker
amplifiers need to be handled as a single logical output.

We don't necessarily have the information at the firmware (BIOS)
level, so add a notion of endpoints and specify if a device/endpoint
is part of a group, with a position.

This may be expanded in future solutions, for now only provide a group
and position information.

Since we modify the header file, change all existing upstream tables
as well to avoid breaking compilation/bisect.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200325215027.28716-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-acpi.h                      | 39 ++++++--
 .../intel/common/soc-acpi-intel-cml-match.c   | 87 +++++++++++++----
 .../intel/common/soc-acpi-intel-icl-match.c   | 97 +++++++++++++++----
 .../intel/common/soc-acpi-intel-tgl-match.c   | 49 ++++++++--
 4 files changed, 221 insertions(+), 51 deletions(-)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index a217a87cae86..392e953d561e 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -75,18 +75,45 @@ struct snd_soc_acpi_mach_params {
 };
 
 /**
- * snd_soc_acpi_link_adr: ACPI-based list of _ADR, with a variable
- * number of devices per link
- *
+ * snd_soc_acpi_endpoint - endpoint descriptor
+ * @num: endpoint number (mandatory, unique per device)
+ * @aggregated: 0 (independent) or 1 (logically grouped)
+ * @group_position: zero-based order (only when @aggregated is 1)
+ * @group_id: platform-unique group identifier (only when @aggregrated is 1)
+ */
+struct snd_soc_acpi_endpoint {
+	u8 num;
+	u8 aggregated;
+	u8 group_position;
+	u8 group_id;
+};
+
+/**
+ * snd_soc_acpi_adr_device - descriptor for _ADR-enumerated device
+ * @adr: 64 bit ACPI _ADR value
+ * @num_endpoints: number of endpoints for this device
+ * @endpoints: array of endpoints
+ */
+struct snd_soc_acpi_adr_device {
+	const u64 adr;
+	const u8 num_endpoints;
+	const struct snd_soc_acpi_endpoint *endpoints;
+};
+
+/**
+ * snd_soc_acpi_link_adr - ACPI-based list of _ADR enumerated devices
  * @mask: one bit set indicates the link this list applies to
- * @num_adr: ARRAY_SIZE of adr
- * @adr: array of _ADR (represented as u64).
+ * @num_adr: ARRAY_SIZE of devices
+ * @adr_d: array of devices
+ *
+ * The number of devices per link can be more than 1, e.g. in SoundWire
+ * multi-drop configurations.
  */
 
 struct snd_soc_acpi_link_adr {
 	const u32 mask;
 	const u32 num_adr;
-	const u64 *adr;
+	const struct snd_soc_acpi_adr_device *adr_d;
 };
 
 /**
diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index f55634c4c2e8..3525da79c68a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -59,42 +59,95 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[] = {
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_cml_machines);
 
-static const u64 rt711_0_adr[] = {
-	0x000010025D071100
+static const struct snd_soc_acpi_endpoint single_endpoint = {
+	.num = 0,
+	.aggregated = 0,
+	.group_position = 0,
+	.group_id = 0,
 };
 
-static const u64 rt1308_1_adr[] = {
-	0x000110025D130800
+static const struct snd_soc_acpi_endpoint spk_l_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 0,
+	.group_id = 1,
 };
 
-static const u64 rt1308_2_adr[] = {
-	0x000210025D130800
+static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 1,
+	.group_id = 1,
 };
 
-static const u64 rt715_3_adr[] = {
-	0x000310025D071500
+static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
+	{
+		.adr = 0x000010025D071100,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1308_1_adr[] = {
+	{
+		.adr = 0x000110025D130800,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1308_2_adr[] = {
+	{
+		.adr = 0x000210025D130800,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
+	{
+		.adr = 0x000110025D130800,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1308_2_group1_adr[] = {
+	{
+		.adr = 0x000210025D130800,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt715_3_adr[] = {
+	{
+		.adr = 0x000310025D071500,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+	}
 };
 
 static const struct snd_soc_acpi_link_adr cml_3_in_1_default[] = {
 	{
 		.mask = BIT(0),
 		.num_adr = ARRAY_SIZE(rt711_0_adr),
-		.adr = rt711_0_adr,
+		.adr_d = rt711_0_adr,
 	},
 	{
 		.mask = BIT(1),
-		.num_adr = ARRAY_SIZE(rt1308_1_adr),
-		.adr = rt1308_1_adr,
+		.num_adr = ARRAY_SIZE(rt1308_1_group1_adr),
+		.adr_d = rt1308_1_group1_adr,
 	},
 	{
 		.mask = BIT(2),
-		.num_adr = ARRAY_SIZE(rt1308_2_adr),
-		.adr = rt1308_2_adr,
+		.num_adr = ARRAY_SIZE(rt1308_2_group1_adr),
+		.adr_d = rt1308_2_group1_adr,
 	},
 	{
 		.mask = BIT(3),
 		.num_adr = ARRAY_SIZE(rt715_3_adr),
-		.adr = rt715_3_adr,
+		.adr_d = rt715_3_adr,
 	},
 	{}
 };
@@ -103,17 +156,17 @@ static const struct snd_soc_acpi_link_adr cml_3_in_1_mono_amp[] = {
 	{
 		.mask = BIT(0),
 		.num_adr = ARRAY_SIZE(rt711_0_adr),
-		.adr = rt711_0_adr,
+		.adr_d = rt711_0_adr,
 	},
 	{
 		.mask = BIT(1),
 		.num_adr = ARRAY_SIZE(rt1308_1_adr),
-		.adr = rt1308_1_adr,
+		.adr_d = rt1308_1_adr,
 	},
 	{
 		.mask = BIT(3),
 		.num_adr = ARRAY_SIZE(rt715_3_adr),
-		.adr = rt715_3_adr,
+		.adr_d = rt715_3_adr,
 	},
 	{}
 };
diff --git a/sound/soc/intel/common/soc-acpi-intel-icl-match.c b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
index 752733013d54..a05fc083829e 100644
--- a/sound/soc/intel/common/soc-acpi-intel-icl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
@@ -33,55 +33,112 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_icl_machines[] = {
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_icl_machines);
 
-static const u64 rt700_0_adr[] = {
-	0x000010025D070000
+static const struct snd_soc_acpi_endpoint single_endpoint = {
+	.num = 0,
+	.aggregated = 0,
+	.group_position = 0,
+	.group_id = 0,
+};
+
+static const struct snd_soc_acpi_endpoint spk_l_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 0,
+	.group_id = 1,
+};
+
+static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 1,
+	.group_id = 1,
+};
+
+static const struct snd_soc_acpi_adr_device rt700_0_adr[] = {
+	{
+		.adr = 0x000010025D070000,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+	}
 };
 
 static const struct snd_soc_acpi_link_adr icl_rvp[] = {
 	{
 		.mask = BIT(0),
 		.num_adr = ARRAY_SIZE(rt700_0_adr),
-		.adr = rt700_0_adr,
+		.adr_d = rt700_0_adr,
 	},
 	{}
 };
 
-static const u64 rt711_0_adr[] = {
-	0x000010025D071100
+static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
+	{
+		.adr = 0x000010025D071100,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1308_1_adr[] = {
+	{
+		.adr = 0x000110025D130800,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+	}
 };
 
-static const u64 rt1308_1_adr[] = {
-	0x000110025D130800
+static const struct snd_soc_acpi_adr_device rt1308_2_adr[] = {
+	{
+		.adr = 0x000210025D130800,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+	}
 };
 
-static const u64 rt1308_2_adr[] = {
-	0x000210025D130800
+static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
+	{
+		.adr = 0x000110025D130800,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+	}
 };
 
-static const u64 rt715_3_adr[] = {
-	0x000310025D071500
+static const struct snd_soc_acpi_adr_device rt1308_2_group1_adr[] = {
+	{
+		.adr = 0x000210025D130800,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt715_3_adr[] = {
+	{
+		.adr = 0x000310025D071500,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+	}
 };
 
 static const struct snd_soc_acpi_link_adr icl_3_in_1_default[] = {
 	{
 		.mask = BIT(0),
 		.num_adr = ARRAY_SIZE(rt711_0_adr),
-		.adr = rt711_0_adr,
+		.adr_d = rt711_0_adr,
 	},
 	{
 		.mask = BIT(1),
-		.num_adr = ARRAY_SIZE(rt1308_1_adr),
-		.adr = rt1308_1_adr,
+		.num_adr = ARRAY_SIZE(rt1308_1_group1_adr),
+		.adr_d = rt1308_1_group1_adr,
 	},
 	{
 		.mask = BIT(2),
-		.num_adr = ARRAY_SIZE(rt1308_2_adr),
-		.adr = rt1308_2_adr,
+		.num_adr = ARRAY_SIZE(rt1308_2_group1_adr),
+		.adr_d = rt1308_2_group1_adr,
 	},
 	{
 		.mask = BIT(3),
 		.num_adr = ARRAY_SIZE(rt715_3_adr),
-		.adr = rt715_3_adr,
+		.adr_d = rt715_3_adr,
 	},
 	{}
 };
@@ -90,17 +147,17 @@ static const struct snd_soc_acpi_link_adr icl_3_in_1_mono_amp[] = {
 	{
 		.mask = BIT(0),
 		.num_adr = ARRAY_SIZE(rt711_0_adr),
-		.adr = rt711_0_adr,
+		.adr_d = rt711_0_adr,
 	},
 	{
 		.mask = BIT(1),
 		.num_adr = ARRAY_SIZE(rt1308_1_adr),
-		.adr = rt1308_1_adr,
+		.adr_d = rt1308_1_adr,
 	},
 	{
 		.mask = BIT(3),
 		.num_adr = ARRAY_SIZE(rt715_3_adr),
-		.adr = rt715_3_adr,
+		.adr_d = rt715_3_adr,
 	},
 	{}
 };
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index c15eae402b18..3153b44f9053 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -14,20 +14,53 @@ static struct snd_soc_acpi_codecs tgl_codecs = {
 	.codecs = {"MX98357A"}
 };
 
-static const u64 rt711_0_adr[] = {
-	0x000010025D071100
+static const struct snd_soc_acpi_endpoint single_endpoint = {
+	.num = 0,
+	.aggregated = 0,
+	.group_position = 0,
+	.group_id = 0,
 };
 
-static const u64 rt1308_1_adr[] = {
-	0x000120025D130800,
-	0x000122025D130800
+static const struct snd_soc_acpi_endpoint spk_l_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 0,
+	.group_id = 1,
+};
+
+static const struct snd_soc_acpi_endpoint spk_r_endpoint = {
+	.num = 0,
+	.aggregated = 1,
+	.group_position = 1,
+	.group_id = 1,
+};
+
+static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
+	{
+		.adr = 0x000010025D071100,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+	}
+};
+
+static const struct snd_soc_acpi_adr_device rt1308_1_adr[] = {
+	{
+		.adr = 0x000120025D130800,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+	},
+	{
+		.adr = 0x000122025D130800,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+	}
 };
 
 static const struct snd_soc_acpi_link_adr tgl_i2s_rt1308[] = {
 	{
 		.mask = BIT(0),
 		.num_adr = ARRAY_SIZE(rt711_0_adr),
-		.adr = rt711_0_adr,
+		.adr_d = rt711_0_adr,
 	},
 	{}
 };
@@ -36,12 +69,12 @@ static const struct snd_soc_acpi_link_adr tgl_rvp[] = {
 	{
 		.mask = BIT(0),
 		.num_adr = ARRAY_SIZE(rt711_0_adr),
-		.adr = rt711_0_adr,
+		.adr_d = rt711_0_adr,
 	},
 	{
 		.mask = BIT(1),
 		.num_adr = ARRAY_SIZE(rt1308_1_adr),
-		.adr = rt1308_1_adr,
+		.adr_d = rt1308_1_adr,
 	},
 	{}
 };
-- 
2.20.1

