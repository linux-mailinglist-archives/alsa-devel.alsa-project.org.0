Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC892752F6
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Sep 2020 10:09:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCC531738;
	Wed, 23 Sep 2020 10:08:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCC531738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600848589;
	bh=JZdNWiAtwsXi8M7Ue1N47z3h8VysgdrY1/k9zFgBbyU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I3C30qf4Wqi8KKxRRUG7Wim2iriMpSZh67naZMUtkc4l6VDutk6WHkI/Qs+LyKE9U
	 bhu4C3fK7XZgjhPRJn202hJi4VlXbnCmP8fz3gA7QsiXCu0/UFa3RiasNRyEATGzKI
	 xccD7QJOG3c/zH5NHYnOy5l2v7HrSxOrZWzuL0Kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D6A6F802DD;
	Wed, 23 Sep 2020 10:07:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA503F80171; Wed, 23 Sep 2020 10:07:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AFEE6F80162
 for <alsa-devel@alsa-project.org>; Wed, 23 Sep 2020 10:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AFEE6F80162
IronPort-SDR: VAiL2mKr/zu/37utfKkmCK3xGPbqJN+XrSimeNCu30MwPprhcs8p19sYxKQDyaVQkzkwohKHK2
 OEdty6Ah6TGw==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="158178509"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="158178509"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 01:07:08 -0700
IronPort-SDR: L2G8DibxHtyqTdur0lm3+ZbG/oMPrFyjCRtJiBOMC08Rj3xdjGObGC9O2vW5/Y7xezbBddvPN2
 q460ltN4RyKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="335371226"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004.fm.intel.com with ESMTP; 23 Sep 2020 01:07:06 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 3/6] ASoC: Intel: add codec name prefix to ACPI machine
 description
Date: Wed, 23 Sep 2020 11:05:11 +0300
Message-Id: <20200923080514.3242858-4-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200923080514.3242858-1-kai.vehmanen@linux.intel.com>
References: <20200923080514.3242858-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The current SOF machine driver adds a name prefix for each codec,
mainly to differentiate ALSA controls for left and right amplifiers.

This is a good idea, but the machine driver duplicates some of the
information that already exists in ACPI descriptors, so add those
prefixes there. Follow-up patches will make use of the information
encoded in these tables and remove duplication.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/soc-acpi.h                          |  2 ++
 sound/soc/intel/common/soc-acpi-intel-cml-match.c | 10 ++++++++++
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c |  1 +
 sound/soc/intel/common/soc-acpi-intel-icl-match.c |  6 ++++++
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c | 14 ++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index b77b05c413a3..b16a844d16ef 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -93,11 +93,13 @@ struct snd_soc_acpi_endpoint {
  * @adr: 64 bit ACPI _ADR value
  * @num_endpoints: number of endpoints for this device
  * @endpoints: array of endpoints
+ * @name_prefix: string used for codec controls
  */
 struct snd_soc_acpi_adr_device {
 	const u64 adr;
 	const u8 num_endpoints;
 	const struct snd_soc_acpi_endpoint *endpoints;
+	const char *name_prefix;
 };
 
 /**
diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index ec01884ef93d..26dde88bb227 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -98,6 +98,7 @@ static const struct snd_soc_acpi_adr_device rt700_1_adr[] = {
 		.adr = 0x000110025D070000,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
+		.name_prefix = "rt700"
 	}
 };
 
@@ -115,6 +116,7 @@ static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 		.adr = 0x000020025D071100,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
+		.name_prefix = "rt711"
 	}
 };
 
@@ -123,6 +125,7 @@ static const struct snd_soc_acpi_adr_device rt1308_1_single_adr[] = {
 		.adr = 0x000120025D130800,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
+		.name_prefix = "rt1308-1"
 	}
 };
 
@@ -131,6 +134,7 @@ static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
 		.adr = 0x000120025D130800,
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
+		.name_prefix = "rt1308-1"
 	}
 };
 
@@ -139,6 +143,7 @@ static const struct snd_soc_acpi_adr_device rt1308_2_group1_adr[] = {
 		.adr = 0x000220025D130800,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1308-2"
 	}
 };
 
@@ -147,6 +152,7 @@ static const struct snd_soc_acpi_adr_device rt715_3_adr[] = {
 		.adr = 0x000320025D071500,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
+		.name_prefix = "rt715"
 	}
 };
 
@@ -155,6 +161,7 @@ static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 		.adr = 0x000030025D071101,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
+		.name_prefix = "rt711"
 	}
 };
 
@@ -163,6 +170,7 @@ static const struct snd_soc_acpi_adr_device rt1316_1_group1_adr[] = {
 		.adr = 0x000131025D131601, /* unique ID is set for some reason */
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
+		.name_prefix = "rt1316-1"
 	}
 };
 
@@ -171,6 +179,7 @@ static const struct snd_soc_acpi_adr_device rt1316_2_group1_adr[] = {
 		.adr = 0x000230025D131601,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1316-2"
 	}
 };
 
@@ -179,6 +188,7 @@ static const struct snd_soc_acpi_adr_device rt714_3_adr[] = {
 		.adr = 0x000330025D071401,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
+		.name_prefix = "rt714"
 	}
 };
 
diff --git a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
index 7d61e0da808b..b80f032a8b76 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
@@ -39,6 +39,7 @@ static const struct snd_soc_acpi_adr_device rt5682_2_adr[] = {
 		.adr = 0x000220025D568200,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
+		.name_prefix = "rt5682"
 	}
 };
 
diff --git a/sound/soc/intel/common/soc-acpi-intel-icl-match.c b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
index ebe13197410f..9a529a785288 100644
--- a/sound/soc/intel/common/soc-acpi-intel-icl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
@@ -59,6 +59,7 @@ static const struct snd_soc_acpi_adr_device rt700_0_adr[] = {
 		.adr = 0x000010025D070000,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
+		.name_prefix = "rt700"
 	}
 };
 
@@ -76,6 +77,7 @@ static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 		.adr = 0x000020025D071100,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
+		.name_prefix = "rt711"
 	}
 };
 
@@ -84,6 +86,7 @@ static const struct snd_soc_acpi_adr_device rt1308_1_adr[] = {
 		.adr = 0x000120025D130800,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
+		.name_prefix = "rt1308-1"
 	}
 };
 
@@ -92,6 +95,7 @@ static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
 		.adr = 0x000120025D130800,
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
+		.name_prefix = "rt1308-1"
 	}
 };
 
@@ -100,6 +104,7 @@ static const struct snd_soc_acpi_adr_device rt1308_2_group1_adr[] = {
 		.adr = 0x000220025D130800,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1308-2"
 	}
 };
 
@@ -108,6 +113,7 @@ static const struct snd_soc_acpi_adr_device rt715_3_adr[] = {
 		.adr = 0x000320025D071500,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
+		.name_prefix = "rt715"
 	}
 };
 
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 6816847bee40..76f4eaf684b0 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -40,6 +40,7 @@ static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
 		.adr = 0x000020025D071100,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
+		.name_prefix = "rt711"
 	}
 };
 
@@ -48,11 +49,13 @@ static const struct snd_soc_acpi_adr_device rt1308_1_dual_adr[] = {
 		.adr = 0x000120025D130800,
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
+		.name_prefix = "rt1308-1"
 	},
 	{
 		.adr = 0x000122025D130800,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1308-2"
 	}
 };
 
@@ -61,6 +64,7 @@ static const struct snd_soc_acpi_adr_device rt1308_1_single_adr[] = {
 		.adr = 0x000120025D130800,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
+		.name_prefix = "rt1308-1"
 	}
 };
 
@@ -69,6 +73,7 @@ static const struct snd_soc_acpi_adr_device rt1308_1_group1_adr[] = {
 		.adr = 0x000120025D130800,
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
+		.name_prefix = "rt1308-1"
 	}
 };
 
@@ -77,6 +82,7 @@ static const struct snd_soc_acpi_adr_device rt1308_2_group1_adr[] = {
 		.adr = 0x000220025D130800,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1308-2"
 	}
 };
 
@@ -85,6 +91,7 @@ static const struct snd_soc_acpi_adr_device rt715_3_adr[] = {
 		.adr = 0x000320025D071500,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
+		.name_prefix = "rt715"
 	}
 };
 
@@ -93,11 +100,13 @@ static const struct snd_soc_acpi_adr_device mx8373_1_adr[] = {
 		.adr = 0x000123019F837300,
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
+		.name_prefix = "Right"
 	},
 	{
 		.adr = 0x000127019F837300,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
+		.name_prefix = "Left"
 	}
 };
 
@@ -106,6 +115,7 @@ static const struct snd_soc_acpi_adr_device rt5682_0_adr[] = {
 		.adr = 0x000021025D568200,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
+		.name_prefix = "rt5682"
 	}
 };
 
@@ -114,6 +124,7 @@ static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 		.adr = 0x000030025D071101,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
+		.name_prefix = "rt711"
 	}
 };
 
@@ -122,6 +133,7 @@ static const struct snd_soc_acpi_adr_device rt1316_1_group1_adr[] = {
 		.adr = 0x000131025D131601, /* unique ID is set for some reason */
 		.num_endpoints = 1,
 		.endpoints = &spk_l_endpoint,
+		.name_prefix = "rt1316-1"
 	}
 };
 
@@ -130,6 +142,7 @@ static const struct snd_soc_acpi_adr_device rt1316_2_group1_adr[] = {
 		.adr = 0x000230025D131601,
 		.num_endpoints = 1,
 		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1316-2"
 	}
 };
 
@@ -138,6 +151,7 @@ static const struct snd_soc_acpi_adr_device rt714_3_adr[] = {
 		.adr = 0x000330025D071401,
 		.num_endpoints = 1,
 		.endpoints = &single_endpoint,
+		.name_prefix = "rt714"
 	}
 };
 
-- 
2.27.0

