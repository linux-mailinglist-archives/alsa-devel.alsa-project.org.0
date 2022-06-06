Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D79E953F0F7
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 22:50:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A14D1B3C;
	Mon,  6 Jun 2022 22:49:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A14D1B3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654548627;
	bh=SOmY/AVYwA2iPNcOiSDH5HAH4vcUL2Kmlnk9R21q5IA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K+cnYqx92tsKEwoTTWFpQeyX3yDt3Unm9l83poXs8zhf5K0bgw3a7MFrdaD/0nN9J
	 JNqq5dGHkw8PupbL5/eZwydcTyhtgNAPlPLL7jsvg5kq/otyudCHBPjRA+1/vRXmyo
	 +q0izhHybQdJemOAcY2Hi9pO3IljZyhISZdciQMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89B1FF80536;
	Mon,  6 Jun 2022 22:48:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66F99F80535; Mon,  6 Jun 2022 22:48:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D2CFF80109
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 22:48:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D2CFF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ga62+IGV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654548506; x=1686084506;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SOmY/AVYwA2iPNcOiSDH5HAH4vcUL2Kmlnk9R21q5IA=;
 b=Ga62+IGVzGzMhLHGF7XDKtsiR6P97LZTyldhimvLqp7ti57JxX8UDSzW
 LuLHASYQXaB+OmvOBiccHe8ldfMSI8fApZ1Nku/aWhVw6dwKrXr01+bcU
 shr/tYad3Q9635KzNm2WI+ll3vJoyMxv31l+2zOPK+HscA9qQglvm/x+y
 cYEE46oSHbL341fdyTw6EiJ5a3ZHBD+sXfIW4I/Xbp+RRZpu/nNYfiWfH
 dhMNjJabYS2nviBm+U+iUbGvhRjNMlN/pOrBWUjmTzFgLvEN4vqr79xTw
 PfmKsiLmL4ez5qnDiu2vikAHPmGjdSDbq1GNBSPxrxO9RJzBX6C+dAgAI w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="277173716"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="277173716"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 13:46:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="906739475"
Received: from yantem-mobl9.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.24.154])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 13:46:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: Intel: sof_sdw: allow HDaudio/HDMI disable
Date: Mon,  6 Jun 2022 15:46:22 -0500
Message-Id: <20220606204622.144424-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606204622.144424-1-pierre-louis.bossart@linux.intel.com>
References: <20220606204622.144424-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
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

For tests, it's rather common to disable the HDaudio links and codecs
in the build. Since we already get a codec_mask parameter indicating
that there are no codecs detected, it's straightforward to skip the
HDMI dailink creation and create a card.

Note that when disabling HDMI, a modified topology without HDMI
pipelines needs to be provided as well.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig   |  1 -
 sound/soc/intel/boards/sof_sdw.c | 24 +++++++++++++++---------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index f3873b5bea87e..4b4c1e1e48087 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -660,7 +660,6 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES || COMPILE_TEST
 	depends on SOUNDWIRE
-	depends on SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC
 	select SND_SOC_MAX98373_I2C
 	select SND_SOC_MAX98373_SDW
 	select SND_SOC_RT700_SDW
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index ad826ad82d51a..77af3a7655c44 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1127,10 +1127,14 @@ static int sof_card_dai_links_create(struct device *dev,
 	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
 		codec_info_list[i].amp_num = 0;
 
-	if (sof_sdw_quirk & SOF_SDW_TGL_HDMI)
-		hdmi_num = SOF_TGL_HDMI_COUNT;
-	else
-		hdmi_num = SOF_PRE_TGL_HDMI_COUNT;
+	if (mach_params->codec_mask & IDISP_CODEC_MASK) {
+		ctx->idisp_codec = true;
+
+		if (sof_sdw_quirk & SOF_SDW_TGL_HDMI)
+			hdmi_num = SOF_TGL_HDMI_COUNT;
+		else
+			hdmi_num = SOF_PRE_TGL_HDMI_COUNT;
+	}
 
 	ssp_mask = SOF_SSP_GET_PORT(sof_sdw_quirk);
 	/*
@@ -1150,9 +1154,6 @@ static int sof_card_dai_links_create(struct device *dev,
 		return ret;
 	}
 
-	if (mach_params->codec_mask & IDISP_CODEC_MASK)
-		ctx->idisp_codec = true;
-
 	/* enable dmic01 & dmic16k */
 	dmic_num = (sof_sdw_quirk & SOF_SDW_PCH_DMIC || mach_params->dmic_num) ? 2 : 0;
 	comp_num += dmic_num;
@@ -1375,7 +1376,9 @@ static int sof_card_dai_links_create(struct device *dev,
 
 static int sof_sdw_card_late_probe(struct snd_soc_card *card)
 {
-	int i, ret;
+	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	int ret = 0;
+	int i;
 
 	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++) {
 		if (!codec_info_list[i].late_probe)
@@ -1386,7 +1389,10 @@ static int sof_sdw_card_late_probe(struct snd_soc_card *card)
 			return ret;
 	}
 
-	return sof_sdw_hdmi_card_late_probe(card);
+	if (ctx->idisp_codec)
+		ret = sof_sdw_hdmi_card_late_probe(card);
+
+	return ret;
 }
 
 /* SoC card */
-- 
2.34.1

