Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 282C23143DA
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 00:35:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C389716C1;
	Tue,  9 Feb 2021 00:34:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C389716C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612827344;
	bh=jHsTqHEkH3Nr+JePjyXG3BOtMUUn36FCp9wzW8EZ1Io=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lv16c/3t+Ej0esGMA0mFPlR/sjAsfkepb4UtjCb1ICykFDsoOMmHdHMYayCitoIC/
	 9e123ul/UYeDyKhmeswJT4TIGdB3QlcRV6gMoQlBEU2l+lG+OTjLXxPXX+nAIWobnG
	 2Q0gwjaIqi4GWFKtB5Th/d1fOMLZy9k/IV5/OeoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64B68F802A0;
	Tue,  9 Feb 2021 00:34:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD8BAF8026C; Tue,  9 Feb 2021 00:33:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34440F80165
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 00:33:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34440F80165
IronPort-SDR: 4fm8dDELhcM17BTEMkLb2Ss3s2JDC8Jewhr6/bIfrh70qyrb/9yhqM+LNdZSDqzUwejJ6P5Nhm
 TIDms8b2J1FA==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="168923491"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="168923491"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:33:51 -0800
IronPort-SDR: lBAuoUW82ZvRuwZdWRFmbjz0Gm9W7ygoifYN4LFNXAQMEPGCdc4jibc62JaQGK3FseK+0xDNFm
 LqzXZ5nhZNrQ==
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="374741323"
Received: from pmane-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.145.183])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:33:50 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 01/11] ASoC: Intel: sof_sdw: reorganize quirks by generation
Date: Mon,  8 Feb 2021 17:33:26 -0600
Message-Id: <20210208233336.59449-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208233336.59449-1-pierre-louis.bossart@linux.intel.com>
References: <20210208233336.59449-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
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

The quirk table is a mess, let's reorganize it by generation before
making sure that the quirks are consistent for each generation.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 73 +++++++++++++++++---------------
 1 file changed, 38 insertions(+), 35 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 152ea166eeae..8bd1d6c84f19 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -48,37 +48,14 @@ static int sof_sdw_quirk_cb(const struct dmi_system_id *id)
 }
 
 static const struct dmi_system_id sof_sdw_quirk_table[] = {
+	/* CometLake devices */
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
-			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A32")
-		},
-		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					SOF_RT711_JD_SRC_JD2 |
-					SOF_RT715_DAI_ID_FIX |
-					SOF_SDW_FOUR_SPK),
-	},
-	{
-		.callback = sof_sdw_quirk_cb,
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
-			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A3E")
-		},
-		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					SOF_RT711_JD_SRC_JD2 |
-					SOF_RT715_DAI_ID_FIX),
-	},
-	{
-		.callback = sof_sdw_quirk_cb,
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
-			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A5E")
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "CometLake Client"),
 		},
-		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
-					SOF_RT711_JD_SRC_JD2 |
-					SOF_RT715_DAI_ID_FIX |
-					SOF_SDW_FOUR_SPK),
+		.driver_data = (void *)SOF_SDW_PCH_DMIC,
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -109,7 +86,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					SOF_RT715_DAI_ID_FIX |
 					SOF_SDW_FOUR_SPK),
 	},
-		{
+	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
@@ -119,6 +96,16 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					SOF_RT715_DAI_ID_FIX |
 					SOF_SDW_FOUR_SPK),
 	},
+	/* IceLake devices */
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Ice Lake Client"),
+		},
+		.driver_data = (void *)SOF_SDW_PCH_DMIC,
+	},
+	/* TigerLake devices */
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
@@ -133,18 +120,23 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Ice Lake Client"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A3E")
 		},
-		.driver_data = (void *)SOF_SDW_PCH_DMIC,
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					SOF_RT711_JD_SRC_JD2 |
+					SOF_RT715_DAI_ID_FIX),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "CometLake Client"),
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A5E")
 		},
-		.driver_data = (void *)SOF_SDW_PCH_DMIC,
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					SOF_RT711_JD_SRC_JD2 |
+					SOF_RT715_DAI_ID_FIX |
+					SOF_SDW_FOUR_SPK),
 	},
 	{
 		.callback = sof_sdw_quirk_cb,
@@ -164,7 +156,18 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI | SOF_SDW_PCH_DMIC |
 					SOF_SDW_FOUR_SPK),
 	},
-
+	/* TigerLake-SDCA devices */
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0A32")
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					SOF_RT711_JD_SRC_JD2 |
+					SOF_RT715_DAI_ID_FIX |
+					SOF_SDW_FOUR_SPK),
+	},
 	{}
 };
 
-- 
2.25.1

