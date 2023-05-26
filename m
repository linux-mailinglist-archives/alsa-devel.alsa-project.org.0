Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09756712E50
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 22:44:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DB5B200;
	Fri, 26 May 2023 22:43:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DB5B200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685133871;
	bh=UcUy0uuB3gEPn/BnuyVmlNtkS2vacjJLk7N4UF7sLcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qKmGVa4XTudpiRCCQ0GldQ3U56tS71OuiARQICLEapoRYqS9UiBdFgexnXvqqxfkc
	 6Fj3jg6lxnToBZxiuiPiCmNN7uNZCsF8sBCLqn9L9T+xoUJXwX/AGdhrZy4WmvrW2Y
	 Etbc4AncumW6IWQ9ErCcBcbL6M2bBIDWLtXCWKZk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D4A5F80544; Fri, 26 May 2023 22:43:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 356D4F8026A;
	Fri, 26 May 2023 22:43:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11B42F80542; Fri, 26 May 2023 22:43:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2866DF8024E
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 22:42:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2866DF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TT9vXhs5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685133736; x=1716669736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UcUy0uuB3gEPn/BnuyVmlNtkS2vacjJLk7N4UF7sLcY=;
  b=TT9vXhs5Quku7i00ul5h9ModK5YpEiaD0OHWZGfWgCNPVhIPSO8KRBha
   Bw9GtxlyJg5XuiO56kmmpAA0l8+WKEL9V4POvy09I1C6ilqPLiaMrreCn
   k8EsTogW78Ph5To0EJJX/xjrtj4gBBoAZEweoshZbkoPuAK6pK4O4EdBY
   KIlSTqmqc++t+H71gqTH9p4lq5M2jBfappKxGfi9qJVVrehADACKRuRA6
   qDAxYn+Ye5HniJ1lqz0z0wWDp+Iv7+yGuKFp7xdkzSeF+N8avQ8OsjvHn
   JLOxIq5h5BbgQbXWOXg6JnKpKD4sLiOhILEPoOG8ramrmLDGpXqVUQdu3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="333926244"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400";
   d="scan'208";a="333926244"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 13:42:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="699527115"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400";
   d="scan'208";a="699527115"
Received: from bedriarm-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.48.113])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 13:42:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 3/3] ASoC: SOF: Intel: HDA: Limit the number of dai drivers
 for nocodec mode
Date: Fri, 26 May 2023 15:41:49 -0500
Message-Id: <20230526204149.456068-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230526204149.456068-1-pierre-louis.bossart@linux.intel.com>
References: <20230526204149.456068-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HT7UZONDR2E6DG2IXG7DXWHXJN3ZDGYV
X-Message-ID-Hash: HT7UZONDR2E6DG2IXG7DXWHXJN3ZDGYV
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HT7UZONDR2E6DG2IXG7DXWHXJN3ZDGYV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

With a common kernel config for nocodec and codec modes, the number of DAI
drivers will be set to 15 for nocodec as well. So adjust this when set
the machine params for the nocodec mode if the debug flag is set.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 6 +++++-
 sound/soc/sof/intel/hda.h | 4 +++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 3153e21f100a..835c2568dd60 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1562,7 +1562,11 @@ void hda_set_mach_params(struct snd_soc_acpi_mach *mach,
 
 	mach_params = &mach->mach_params;
 	mach_params->platform = dev_name(sdev->dev);
-	mach_params->num_dai_drivers = desc->ops->num_drv;
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_NOCODEC_DEBUG_SUPPORT) &&
+	    sof_debug_check_flag(SOF_DBG_FORCE_NOCODEC))
+		mach_params->num_dai_drivers = SOF_SKL_NUM_DAIS_NOCODEC;
+	else
+		mach_params->num_dai_drivers = desc->ops->num_drv;
 	mach_params->dai_drivers = desc->ops->drv;
 }
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 65832a38bffa..5b3dad2dadf4 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -414,10 +414,12 @@
 	(HDA_DSP_BDL_SIZE / sizeof(struct sof_intel_dsp_bdl))
 
 /* Number of DAIs */
+#define SOF_SKL_NUM_DAIS_NOCODEC	8
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 #define SOF_SKL_NUM_DAIS		15
 #else
-#define SOF_SKL_NUM_DAIS		8
+#define SOF_SKL_NUM_DAIS		SOF_SKL_NUM_DAIS_NOCODEC
 #endif
 
 /* Intel HD Audio SRAM Window 0*/
-- 
2.37.2

