Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FDD7A1D92
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 13:41:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3DD1AE9;
	Fri, 15 Sep 2023 13:40:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3DD1AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694778072;
	bh=gHKQXhlXpmwvd4kYxW5s3at1ALBR2eYH3m6GCf/yc1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o7I30o+FofizzQym7GJNREIBwJY/dBx2PTRM+N3t8faixOu1ILxjT14dgCgDOsZsJ
	 F7m1lBwsmNxek//cYSLsb+90T0lnEJxbDJTYFvZp9Ltw8vbpThaxZLBlVY2Xq7CZPa
	 d/S2KcLpSbOG6/X2EDbSORye4ti2kaSmZqqEkwhw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBF3BF80551; Fri, 15 Sep 2023 13:39:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B8F6F80551;
	Fri, 15 Sep 2023 13:39:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A41EF8047D; Fri, 15 Sep 2023 13:39:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A89D4F80246
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 13:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A89D4F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lZgotgku
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694777960; x=1726313960;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gHKQXhlXpmwvd4kYxW5s3at1ALBR2eYH3m6GCf/yc1k=;
  b=lZgotgkuUyoaQSOzy/zveqwjzArXLUbNaCSl4lFSA6+r3oLMsFW9wfrX
   husAvXmPf0HvReRyimCx6H4G6d0q+f09USVfnsO80I6yRxi1hAAahQtHT
   eRGMxZ/qmgNgYjSm7FnT8XsZFVQ5e1agrmuG3HlGMAAhZ5JiQnaQrkImM
   nwO3q71Gqi2qnObNqfX4+jVud5wZg5jQfHJBjhSsWSrnXjkqGn8yZ89FR
   rVrSxviqZkI0O1cD3aOqP6GUqp0BcU5eryPsP9ul6lYtRIHFDdIoBYfG4
   /SrPVqdLA0Q+WxR6MadKURVwayB3F3MuZAdsU9s7hfGQyTRyLUPFu6fwL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="465591003"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="465591003"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 04:39:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="918629493"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="918629493"
Received: from brhacker-mobl26.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.34])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 04:39:12 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	guennadi.liakhovetski@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 2/3] ASoC: SOF: ipc4: Add new message type:
 SOF_IPC4_GLB_LOAD_LIBRARY_PREPARE
Date: Fri, 15 Sep 2023 14:39:11 +0300
Message-ID: <20230915113912.1405-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230915113912.1405-1-peter.ujfalusi@linux.intel.com>
References: <20230915113912.1405-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SYZQ4QIMFWRU2X2P4Y6ARCPFFVPUZVHU
X-Message-ID-Hash: SYZQ4QIMFWRU2X2P4Y6ARCPFFVPUZVHU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SYZQ4QIMFWRU2X2P4Y6ARCPFFVPUZVHU/>
List-Archive: <>
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

