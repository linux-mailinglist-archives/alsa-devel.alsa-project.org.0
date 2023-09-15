Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF88F7A1D9C
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 13:42:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C6EFDEE;
	Fri, 15 Sep 2023 13:42:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C6EFDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694778177;
	bh=gHKQXhlXpmwvd4kYxW5s3at1ALBR2eYH3m6GCf/yc1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u1SES7lO2H6/pVdzBP+taFz07rQusOAVR2/ZLWdJWnFOZUySAiRjh7IwCJjNPlMUD
	 g4mApLtg32qqzcJHS56PU9Oq6t5cF3EUbS7JaqM4g5SBR91fo7L5mKyZhJCLW3WCNW
	 GRdBQjYKJ/L00ZvNz3aMjOfS0oVNzG54LLv7o8a8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D761F80567; Fri, 15 Sep 2023 13:40:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C2DDF80579;
	Fri, 15 Sep 2023 13:40:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9F15F805B1; Fri, 15 Sep 2023 13:40:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57935F805B6
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 13:40:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57935F805B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CBqMac8f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694778031; x=1726314031;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gHKQXhlXpmwvd4kYxW5s3at1ALBR2eYH3m6GCf/yc1k=;
  b=CBqMac8fAE7aNcgj51GXQCWTnfWIh4wFW7JCurOTjHrC0+iGBWLct02c
   /BA/mAyT5dOguAYepR8yD4jz4pYOMinWXu4rumyxYIDb+ihOgjPZm89Ay
   ryb1sdxAOWlkzLuXJI/138O6pV9aMav7OEMDad5+ZJ9+gv69JOi8gjhCg
   mCxqptsSnYAhWNIjMUTAP+9KWfpdiy/FTjbruExIkwpmCW8xRzvStuROk
   jHq/L7RyQf9caKVQMljSGApRIKhAkP0auxAEZkcMYWVffpbk8RcnALS7f
   YtGgy5x/HyGFbdIXGkPAmUD9bLbrfZZHTtQWCZvCtl7oOCpc+t8Jy7yej
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="358642931"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="358642931"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 04:40:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="721652893"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="721652893"
Received: from brhacker-mobl26.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.34])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 04:40:20 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	guennadi.liakhovetski@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 3/4] ASoC: SOF: ipc4: Add new message type:
 SOF_IPC4_GLB_LOAD_LIBRARY_PREPARE
Date: Fri, 15 Sep 2023 14:40:17 +0300
Message-ID: <20230915114018.1701-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230915114018.1701-1-peter.ujfalusi@linux.intel.com>
References: <20230915114018.1701-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LEGUJ4K6MIHOW7ATI6OHDA3PKJVGEYV3
X-Message-ID-Hash: LEGUJ4K6MIHOW7ATI6OHDA3PKJVGEYV3
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LEGUJ4K6MIHOW7ATI6OHDA3PKJVGEYV3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Intel platforms there is a strict order requirement for the DMA
programming:
DSP side configures the buffer and sets the GEN bit
Host side sets the RUN bit.

In order to follow this flow, a new global message type has been added to
prepare the DSP side of the DMA:

host sends LOAD_LIBRARY_PREPARE with the dma_id
DSP side sets its buffer and sets the GEN bit
Host sets the RUN bit
Host sends LOAD_LIBRARY with dma_id and lib_id
DSP receives the library data.

It is up to the platform code to use the new prepare stage message and how
to handle the reply to it from the firmware, which can indicate that the
message type is not supported/handled.
In this case the kernel should proceed to the LOAD_LIBRARY stage assuming
a single stage library loading:

host sends LOAD_LIBRARY_PREPARE with the dma_id
DSP replies that the message type is not supported/handled
Host acknowledges the return code and sets the RUN bit
Host sends LOAD_LIBRARY with dma_id and lib_id
DSP receives the library data.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
---
 include/sound/sof/ipc4/header.h | 15 +++++++++++----
 sound/soc/sof/ipc4.c            |  1 +
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index 78568abe2673..c58f00ef054a 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -106,12 +106,19 @@ enum sof_ipc4_global_msg {
 	SOF_IPC4_GLB_SAVE_PIPELINE,
 	SOF_IPC4_GLB_RESTORE_PIPELINE,
 
-	/* Loads library (using Code Load or HD/A Host Output DMA) */
+	/*
+	 * library loading
+	 *
+	 * Loads library (using Code Load or HD/A Host Output DMA)
+	 */
 	SOF_IPC4_GLB_LOAD_LIBRARY,
+	/*
+	 * Prepare the host DMA channel for library loading, must be followed by
+	 * a SOF_IPC4_GLB_LOAD_LIBRARY message as the library loading step
+	 */
+	SOF_IPC4_GLB_LOAD_LIBRARY_PREPARE,
 
-	/* 25: RESERVED - do not use */
-
-	SOF_IPC4_GLB_INTERNAL_MESSAGE = 26,
+	SOF_IPC4_GLB_INTERNAL_MESSAGE,
 
 	/* Notification (FW to SW driver) */
 	SOF_IPC4_GLB_NOTIFICATION,
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 24e9c29f3579..e14924048eb5 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -157,6 +157,7 @@ static const char * const ipc4_dbg_glb_msg_type[] = {
 	DBG_IPC4_MSG_TYPE_ENTRY(GLB_SAVE_PIPELINE),
 	DBG_IPC4_MSG_TYPE_ENTRY(GLB_RESTORE_PIPELINE),
 	DBG_IPC4_MSG_TYPE_ENTRY(GLB_LOAD_LIBRARY),
+	DBG_IPC4_MSG_TYPE_ENTRY(GLB_LOAD_LIBRARY_PREPARE),
 	DBG_IPC4_MSG_TYPE_ENTRY(GLB_INTERNAL_MESSAGE),
 	DBG_IPC4_MSG_TYPE_ENTRY(GLB_NOTIFICATION),
 };
-- 
2.42.0

