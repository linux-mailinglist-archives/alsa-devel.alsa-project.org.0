Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC0843BF9E
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 04:22:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A40B16D5;
	Wed, 27 Oct 2021 04:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A40B16D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635301336;
	bh=9XlCJo4ceFwGo5Z0fC/yIJAIacJKNxZS4a4codlJI5g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gszrw95zF5iDRT2/lxxp6VV5M7BoKIeeLXQHHvdquFjiKrK7eFHedIGzGDsfijuQg
	 cLSOqq/XURTBrGRH0W9WyddoZlfpLShArUOxQzIMC1Xr3QzMlJzOdl4sWdBhKVLWYq
	 Lyw0ihzWWpDjOIy4w0tEbtRutCvSDrkZRCS5c7v0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34425F80507;
	Wed, 27 Oct 2021 04:19:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B392F804F1; Wed, 27 Oct 2021 04:19:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70D14F8032B
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 04:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70D14F8032B
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="217229410"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="217229410"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 19:18:49 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800"; d="scan'208";a="486446305"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 19:18:47 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 06/10] ASoC: intel: sof_sdw: move DMIC link id overwrite to
 create_sdw_dailink
Date: Wed, 27 Oct 2021 10:18:20 +0800
Message-Id: <20211027021824.24776-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211027021824.24776-1-yung-chuan.liao@linux.intel.com>
References: <20211027021824.24776-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 bard.liao@intel.com
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

We can apply the fixed dai link id for DMICs in create_sdw_dailink().
No need to set it in each DMIC's callback.
The fixed dai link id is not only for rt715 and rt715-sdca, but for all
DMICs, therefore we remove the SOF_RT715_DAI_ID_FIX check as well.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c            | 8 ++++++++
 sound/soc/intel/boards/sof_sdw_rt715.c      | 7 -------
 sound/soc/intel/boards/sof_sdw_rt715_sdca.c | 7 -------
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index db4f16613baf..3fb600083225 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -915,6 +915,14 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 	    *link_id < SDW_AMP_DAI_ID)
 		*link_id = SDW_AMP_DAI_ID;
 
+	/*
+	 * DAI ID is fixed at SDW_DMIC_DAI_ID for MICs to
+	 * keep sdw DMIC and HDMI setting static in UCM
+	 */
+	if (codec_info_list[codec_index].codec_type == SOF_SDW_CODEC_TYPE_MIC &&
+	    *link_id < SDW_DMIC_DAI_ID)
+		*link_id = SDW_DMIC_DAI_ID;
+
 	cpu_dai_index = *cpu_id;
 	for_each_pcm_streams(stream) {
 		char *name, *cpu_name;
diff --git a/sound/soc/intel/boards/sof_sdw_rt715.c b/sound/soc/intel/boards/sof_sdw_rt715.c
index c8af3780cbc3..7c068dc6b9cf 100644
--- a/sound/soc/intel/boards/sof_sdw_rt715.c
+++ b/sound/soc/intel/boards/sof_sdw_rt715.c
@@ -30,13 +30,6 @@ int sof_sdw_rt715_init(struct snd_soc_card *card,
 		       struct sof_sdw_codec_info *info,
 		       bool playback)
 {
-	/*
-	 * DAI ID is fixed at SDW_DMIC_DAI_ID for 715 to
-	 * keep sdw DMIC and HDMI setting static in UCM
-	 */
-	if (sof_sdw_quirk & SOF_RT715_DAI_ID_FIX)
-		dai_links->id = SDW_DMIC_DAI_ID;
-
 	dai_links->init = rt715_rtd_init;
 
 	return 0;
diff --git a/sound/soc/intel/boards/sof_sdw_rt715_sdca.c b/sound/soc/intel/boards/sof_sdw_rt715_sdca.c
index 85d3d8c355cc..ca0cf3db2e4d 100644
--- a/sound/soc/intel/boards/sof_sdw_rt715_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt715_sdca.c
@@ -30,13 +30,6 @@ int sof_sdw_rt715_sdca_init(struct snd_soc_card *card,
 			    struct sof_sdw_codec_info *info,
 			    bool playback)
 {
-	/*
-	 * DAI ID is fixed at SDW_DMIC_DAI_ID for 715-SDCA to
-	 * keep sdw DMIC and HDMI setting static in UCM
-	 */
-	if (sof_sdw_quirk & SOF_RT715_DAI_ID_FIX)
-		dai_links->id = SDW_DMIC_DAI_ID;
-
 	dai_links->init = rt715_sdca_rtd_init;
 
 	return 0;
-- 
2.17.1

