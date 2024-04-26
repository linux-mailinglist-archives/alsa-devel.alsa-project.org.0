Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8C38B3B7C
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:30:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA05F210D;
	Fri, 26 Apr 2024 17:30:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA05F210D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145430;
	bh=EGWzmge88Dt6b6FeIkhkTvyXxuxkbPfnR9TrZnhRxa8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hEaqEYFPJfkTeJ1BjRdS+ClNA/9Wrix8lngwie4frwNG+7zRqYbWcy+zThnMLyz1V
	 6hkfyCbrbatHUTt3oM/9WUK+233h8hJyHa6rLKO+fNiNhh5Szu346yKDU+MTR/36pZ
	 s07KYSAmV7fogMyqYfgZoQT25apCxVD2/eqsPKUE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 116E6F8087B; Fri, 26 Apr 2024 17:26:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30254F8086D;
	Fri, 26 Apr 2024 17:26:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24AC4F80687; Fri, 26 Apr 2024 17:26:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5CEA3F805C3
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:25:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CEA3F805C3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Inxd4fAH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714145152; x=1745681152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EGWzmge88Dt6b6FeIkhkTvyXxuxkbPfnR9TrZnhRxa8=;
  b=Inxd4fAHFvraQdZLvY0eQquM8gZ+jiD35GdB4KxEoZa7qhzFCDaciy6+
   v6bkvWUaf4YKH+eTp6InrjQ1J3cCozEqdzwUF/+FFqVmUDDxWUgaAEPyZ
   CthlRiWQQBFJzN23v9yAVYv7NlkiNBIeYev6szsz3vArL6gZFXh1d+2qS
   1DMmuXKKQWvFKGuU5O5+1XkqdzX+VVuQRG5rB1EqXp0RhM2gZPCLwNhVN
   IIm1D/nbq4dCBEaXCK2oNHGV40XmlasCQHcIFCcuHbHVqjNtzW7QtySmQ
   mXq9jttdGiq1eK80t0tn6zca5m55S39a4Z6iT2A7VJ/5B7Lq6VqfsV7ny
   Q==;
X-CSE-ConnectionGUID: ztgZttqzSFC31p0aXMkyDA==
X-CSE-MsgGUID: O3M6p/sfRhetLGe+ub25pQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21291333"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21291333"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:48 -0700
X-CSE-ConnectionGUID: CEsELYaVR2aggWHN2ZH3Yg==
X-CSE-MsgGUID: JLsWVBG+S2SuA1XpuIIlog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259587"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:25:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 14/23] ASoC: Intel: sof_rt5682: add glk_rt5682_def for glk
 boards
Date: Fri, 26 Apr 2024 10:25:20 -0500
Message-Id: <20240426152529.38345-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152529.38345-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VQFQCFF2HAWI32RQHM53BBFX3WYDCOPJ
X-Message-ID-Hash: VQFQCFF2HAWI32RQHM53BBFX3WYDCOPJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VQFQCFF2HAWI32RQHM53BBFX3WYDCOPJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Add the board config glk_rt5682_def to rt5682 machine driver for all
glk boards using default SSP port allocation (headphone codec on SSP2,
speaker amplifiers on SSP1).

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 48 +++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 1e70ce469650..80ecf31c936a 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -635,6 +635,14 @@ sof_card_dai_links_create(struct device *dev, struct snd_soc_card *card,
 	return 0;
 }
 
+#define GLK_LINK_ORDER	SOF_LINK_ORDER(SOF_LINK_AMP,         \
+					SOF_LINK_CODEC,      \
+					SOF_LINK_DMIC01,     \
+					SOF_LINK_IDISP_HDMI, \
+					SOF_LINK_NONE,       \
+					SOF_LINK_NONE,       \
+					SOF_LINK_NONE)
+
 static int sof_audio_probe(struct platform_device *pdev)
 {
 	struct snd_soc_acpi_mach *mach = pdev->dev.platform_data;
@@ -676,24 +684,34 @@ static int sof_audio_probe(struct platform_device *pdev)
 			ctx->amp_type = CODEC_RT5650;
 	}
 
-	if (ctx->amp_type == CODEC_RT1011 && soc_intel_is_cml()) {
-		/* backward-compatible with existing cml devices */
-		card_name = devm_kstrdup(&pdev->dev, "cml_rt1011_rt5682",
-					 GFP_KERNEL);
-		if (!card_name)
-			return -ENOMEM;
-
-		sof_audio_card_rt5682.name = card_name;
-	}
+	if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
+		ctx->hdmi.idisp_codec = true;
 
 	if (is_legacy_cpu) {
 		ctx->rt5682.is_legacy_cpu = true;
 		ctx->dmic_be_num = 0;
 		/* HDMI is not supported by SOF on Baytrail/CherryTrail */
 		ctx->hdmi_num = 0;
-	} else {
-		if (mach->mach_params.codec_mask & IDISP_CODEC_MASK)
-			ctx->hdmi.idisp_codec = true;
+	} else if (soc_intel_is_glk()) {
+		/* dmic16k not support */
+		ctx->dmic_be_num = 1;
+
+		/* overwrite the DAI link order for GLK boards */
+		ctx->link_order_overwrite = GLK_LINK_ORDER;
+	} else if (soc_intel_is_cml()) {
+		/* backward-compatible with existing devices */
+		switch (ctx->amp_type) {
+		case CODEC_RT1011:
+			card_name = devm_kstrdup(&pdev->dev, "cml_rt1011_rt5682",
+						 GFP_KERNEL);
+			if (!card_name)
+				return -ENOMEM;
+
+			sof_audio_card_rt5682.name = card_name;
+			break;
+		default:
+			break;
+		}
 	}
 
 	/* need to get main clock from pmc */
@@ -768,6 +786,12 @@ static const struct platform_device_id board_ids[] = {
 	{
 		.name = "sof_rt5682",
 	},
+	{
+		.name = "glk_rt5682_def",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_SSP_PORT_CODEC(2) |
+					SOF_SSP_PORT_AMP(1)),
+	},
 	{
 		.name = "cml_rt5682_def",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
-- 
2.40.1

