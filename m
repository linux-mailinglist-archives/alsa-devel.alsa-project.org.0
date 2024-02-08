Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B453284E5D8
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 18:01:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 325F3DF6;
	Thu,  8 Feb 2024 18:01:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 325F3DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707411687;
	bh=V92CfbYk61vu8Lu87qyGidx+d8Y00Or+SdwAb6vYum4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d2yKCiPYzzVnZ0g/GmyfgfWBcfTWatwHx/l+DoH7Eha15xi0/SBpuvoQy8yRrArM6
	 +W+DEEWCjUmbQ9F8rmJDzr7FgykfxohYC5aQSvQRO0lrtawSGQfap+g3QpiwX1wm6G
	 Xw+6vnN2wCfHbdjV5Jl6QsBY6lHEo63WoxWZSsac=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB386F80C74; Thu,  8 Feb 2024 17:57:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF17EF80C57;
	Thu,  8 Feb 2024 17:57:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73C81F8067C; Thu,  8 Feb 2024 17:56:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D95ACF805F2
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 17:56:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D95ACF805F2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=P9DNw5g6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411375; x=1738947375;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=V92CfbYk61vu8Lu87qyGidx+d8Y00Or+SdwAb6vYum4=;
  b=P9DNw5g6FW3+bQplLolG/IirtmA+hYudWU9dLgBwGMCWC1U9WppdojUT
   yVF8bWaYpYmoInBpq3bVUmT+mZqfgHkava2SWmBIWNUYdu85PjldZclkq
   4ZXAWTNo/sWjHiwIwaMN1mSyPZnh9ShmmzfZXIEGdGrv+TcPF1EJY2hqy
   sVcvrVHIlz5nZLkFg5zkmvr0lSW6Uj8LyEpzhtjzc++U5KzIY9WcHAFKd
   9wxmqdeVIU3xC7KZbHJGxO/F4kqf3tdZxboejncirXNvgd9/CSHp8qkhh
   WPuMdcG/9olBXsGpahUByohAgyDwI/FLUbDSKE8tf1jkkbtSmDoPJyqpn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675421"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="395675421"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="1690269"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:04 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	mosomate <mosomate@gmail.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 19/24] ASoC: Intel: common: DMI remap for rebranded Intel NUC
 M15 (LAPRC710) laptops
Date: Thu,  8 Feb 2024 10:55:40 -0600
Message-Id: <20240208165545.93811-20-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: N6G4ZLEZWTCGLZ56U2JRQRYIIYA5A6FP
X-Message-ID-Hash: N6G4ZLEZWTCGLZ56U2JRQRYIIYA5A6FP
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N6G4ZLEZWTCGLZ56U2JRQRYIIYA5A6FP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: mosomate <mosomate@gmail.com>

Added DMI quirk to handle the rebranded variants of Intel NUC M15
(LAPRC710) laptops. The DMI matching is based on motherboard
attributes.

Link: https://github.com/thesofproject/linux/issues/4218
Signed-off-by: Máté Mosonyi <mosomate@gmail.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/dmi-quirks.c   |  8 ++++++++
 sound/soc/intel/boards/sof_sdw.c | 11 +++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 9ebdd0cd0b1c..91ab97a456fa 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -130,6 +130,14 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 		},
 		.driver_data = (void *)intel_rooks_county,
 	},
+	{
+		/* quirk used for NUC15 LAPRC710 skew */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPRC710"),
+		},
+		.driver_data = (void *)intel_rooks_county,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 801cfe9c4dd3..e4b9f4d1ec06 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -236,6 +236,17 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 					SOF_SDW_PCH_DMIC |
 					RT711_JD2_100K),
 	},
+	{
+		/* NUC15 LAPRC710 skews */
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Intel Corporation"),
+			DMI_MATCH(DMI_BOARD_NAME, "LAPRC710"),
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
+					SOF_SDW_PCH_DMIC |
+					RT711_JD2_100K),
+	},
 	/* TigerLake-SDCA devices */
 	{
 		.callback = sof_sdw_quirk_cb,
-- 
2.40.1

