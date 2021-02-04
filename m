Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BFC30FE83
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 21:37:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41D3E1673;
	Thu,  4 Feb 2021 21:36:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41D3E1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612471024;
	bh=jHsTqHEkH3Nr+JePjyXG3BOtMUUn36FCp9wzW8EZ1Io=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tSeLKRv/2gLJBELDHzyUHDJYIagchXw+h5KMXMskoggwiQXujwGQxb6su3CL5P3K5
	 vZey4cIaLCKE0WwARi57i3Uj+vXT3DC/k85VjcsFcBkIQg2SQKUx2pR7tF/o8QDAQ+
	 Srra/jlKUJuXiOeszDdfEQQDGu8u/sTfSIvrfUE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F98AF802DB;
	Thu,  4 Feb 2021 21:34:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B5B7F8025C; Thu,  4 Feb 2021 21:33:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2F2BF8021C
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 21:33:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2F2BF8021C
IronPort-SDR: NjMELbRhB8QtxgNrjNFyKIt2Xyh0ZAOrHEIsXRG6acIjJnQv2QS9rDtgm5Wb4jIFlT3qajlSmv
 ya3iF9YWJQVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="181472473"
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="181472473"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:33:43 -0800
IronPort-SDR: 3+DovbtSSMxx5FVrOkic/i8surJ9IMBHaCVIxMvRf1s/SHzF+IACnzTEpizCXlQmgdn0tTFq/q
 88qHhu1ENubQ==
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="483700302"
Received: from jdasilva-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.66.22])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 12:33:42 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/14] ASoC: Intel: sof_sdw: reorganize quirks by generation
Date: Thu,  4 Feb 2021 14:33:02 -0600
Message-Id: <20210204203312.27112-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204203312.27112-1-pierre-louis.bossart@linux.intel.com>
References: <20210204203312.27112-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

