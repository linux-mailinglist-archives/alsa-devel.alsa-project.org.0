Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5A5193322
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 22:55:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63F27166D;
	Wed, 25 Mar 2020 22:54:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63F27166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585173345;
	bh=X6ufsvhXy/ySzcDm3h6OxNrkjILI/NjiuqxqGFl8X4Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OnmIV5FLTWdkvMt9YC55V8xADWygGUcIVbZPvywRmPdeXMJEJd3d8D8zOdZAED3NV
	 zSe4mkJ+BZVUV0Oo/5eRZM42RCe+xMYSnUt2fWMRNEq0eyV71aXhr9j1ss6UBAvlUf
	 /kzyZ/VTNn5lOEwZyOnysH5MsfLQs70tL5GVvdr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39A84F802E7;
	Wed, 25 Mar 2020 22:50:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98317F802A0; Wed, 25 Mar 2020 22:50:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 470C5F80147
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 22:50:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 470C5F80147
IronPort-SDR: VZHEWF5K/ip2Iz/k/kIcthOTIit2ubB/tCTvC1aQ6T5otyjFqK+qFcmpgn5uhp5VNi9h98v/7M
 a6dzVmfECJ5A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 14:50:37 -0700
IronPort-SDR: Rpd73vbGyH+Y4+U5HBDVoUaxY4EngMPkPqugEEcnX5zeftC1vTlJexSHBG4ag9mgh6RsQxMjWT
 wsICHlUhi1bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,305,1580803200"; d="scan'208";a="265666149"
Received: from abeljans.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.233.195])
 by orsmga002.jf.intel.com with ESMTP; 25 Mar 2020 14:50:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 01/11] ASoC: soc-acpi: expand description of _ADR-based
 devices
Date: Wed, 25 Mar 2020 16:50:17 -0500
Message-Id: <20200325215027.28716-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200325215027.28716-1-pierre-louis.bossart@linux.intel.com>
References: <20200325215027.28716-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

