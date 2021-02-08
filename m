Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F5C3143E4
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 00:36:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D1AF16B0;
	Tue,  9 Feb 2021 00:35:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D1AF16B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612827394;
	bh=s7T2uP1axKzXEAq7Gq0dOYHeNhq9vMmLhEye7aY5BNk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iJs4VWvywy60Ak6JdlDyvlC0MeZAK5z2n1AEm4LWX8cXIsOCbfTpUelMmTIa5Rmto
	 qO9PnYkTYr5TMaQ2O0Msa5qCK3POiXvsPJnWJT20Tapss5SMdqqDFIndP2P2Oqxvch
	 gEt7RDzFLuz6kBdSr8uwF1FM0bNDQlx6oyJZZkuc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B78FF802E0;
	Tue,  9 Feb 2021 00:34:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AAAFF80290; Tue,  9 Feb 2021 00:34:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3935DF8022D
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 00:33:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3935DF8022D
IronPort-SDR: Wfti7Z4DMNoIh6wOS2IZOra/GTmNlGL7c0qeptSRo9ciwE38SdQK5LuCxLT+RBUYJ79J/W23kL
 OWtaB1Z4n+wA==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="168923497"
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="168923497"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:33:52 -0800
IronPort-SDR: mMUOHXMcAxneVuLbF4DvN/WxjTV4JIUSpFZWy8SrMXESRFoCwQCB7mwgT77LCSb6zadJGrpduy
 9t7MRHKk6Huw==
X-IronPort-AV: E=Sophos;i="5.81,163,1610438400"; d="scan'208";a="374741332"
Received: from pmane-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.209.145.183])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 15:33:52 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 03/11] ASoC: Intel: sof_sdw: add quirk for HP Spectre x360
 convertible
Date: Mon,  8 Feb 2021 17:33:28 -0600
Message-Id: <20210208233336.59449-4-pierre-louis.bossart@linux.intel.com>
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

This set of devices has SoundWire support along with DMICs.
The DMI information was provided by users for 3 separate skus.

BugLink: https://github.com/thesofproject/linux/issues/2700
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 99c0e4b12d1c..0e83db947a57 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -159,6 +159,22 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					SOF_SDW_PCH_DMIC |
 					SOF_SDW_FOUR_SPK),
 	},
+	{
+		/*
+		 * this entry covers multiple HP SKUs. The family name
+		 * does not seem robust enough, so we use a partial
+		 * match that ignores the product name suffix
+		 * (e.g. 15-eb1xxx, 14t-ea000 or 13-aw2xxx)
+		 */
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP Spectre x360 Convertible"),
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					SOF_SDW_PCH_DMIC |
+					SOF_RT711_JD_SRC_JD2),
+	},
 	/* TigerLake-SDCA devices */
 	{
 		.callback = sof_sdw_quirk_cb,
-- 
2.25.1

