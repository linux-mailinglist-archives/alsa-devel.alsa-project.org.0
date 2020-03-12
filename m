Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A531183999
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 20:36:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8703016F4;
	Thu, 12 Mar 2020 20:35:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8703016F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584041794;
	bh=K+/N0/VgAU+ZY3LWWahohyL11peMO+LuAQHHIZPluFc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WUwr14FcdXOPDKPtG7GjBUkd0RC2rlUDAIrUmL4l4jh1FpynvClfr7s1teKWke58C
	 TIZPmGcBh6z8WAH9CGuyRa8j9LVqsNE0rNH56TGlgpxEkF39Snv4mgV/1/sNdhUpHq
	 QI8vNciOx5zi+87ZMvA/DctxZ71opFvQ9R1hleUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E48B7F8026F;
	Thu, 12 Mar 2020 20:34:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6E80F8021C; Thu, 12 Mar 2020 20:34:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35DBAF8021C
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 20:34:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35DBAF8021C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 12:34:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; d="scan'208";a="243142472"
Received: from unknown (HELO pbossart-mobl3.amr.corp.intel.com)
 ([10.251.241.169])
 by orsmga003.jf.intel.com with ESMTP; 12 Mar 2020 12:34:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/10] ASoC: soc-acpi: expand description of _ADR-based devices
Date: Thu, 12 Mar 2020 14:33:37 -0500
Message-Id: <20200312193346.3264-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312193346.3264-1-pierre-louis.bossart@linux.intel.com>
References: <20200312193346.3264-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Mac Chiang <mac.chiang@intel.com>, srinivas.kandagatla@linaro.org,
 jank@cadence.com, Amery Song <chao.song@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Pan Xiuli <xiuli.pan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, slawomir.blauciak@intel.com,
 broonie@kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Naveen Manohar <naveen.m@intel.com>, gregkh@linuxfoundation.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, Sathya Prakash M R <sathya.prakash.m.r@intel.com>
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
index 752733013d54..36e2d09cf58c 100644
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
+		.adr_d = rt1308_1_adr,
 	},
 	{
 		.mask = BIT(2),
-		.num_adr = ARRAY_SIZE(rt1308_2_adr),
-		.adr = rt1308_2_adr,
+		.num_adr = ARRAY_SIZE(rt1308_2_group1_adr),
+		.adr_d = rt1308_2_adr,
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
index 5984dd151f3e..885ef4f00385 100644
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

