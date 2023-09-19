Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA627A5DD9
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 11:27:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDC699F6;
	Tue, 19 Sep 2023 11:26:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDC699F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695115621;
	bh=4vKzywkXA0oXrELzgsla8ORK4gD7NW4P0rvHV73zT8Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KNLQmZv57u1YpusH+5fKPjmGiOWg4Clrg/d1mldzN5Tht1jDd5vpD4PLWEAMX6iz5
	 4EbEYFIPUiMbjDAyl1p7qV42qhVJP2+RWQmUKC+OA1ND8VThNt7f+aZ2IcO9rVFlmb
	 su5qqQFm0YteQRz5vpOB6MARmHZoddLK/lzMEOU0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB438F805C1; Tue, 19 Sep 2023 11:24:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1663FF805BA;
	Tue, 19 Sep 2023 11:24:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FCD8F8058C; Tue, 19 Sep 2023 11:24:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99143F8055B
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 11:24:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99143F8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Nfwk7I6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695115464; x=1726651464;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4vKzywkXA0oXrELzgsla8ORK4gD7NW4P0rvHV73zT8Q=;
  b=Nfwk7I6FOw6J8OJShhLnWyDt365WJxPj7xQifp4iKmyeHtrEO85jII0J
   bkqjITJKWf79YIv5o6XkGXhVxaeoeT9UP3Tg08/ovvSjqxy9VRtc+CY5J
   2T6QwAfwrrzgzj8NGvAApdb5q6bG5CPLSVuXvh56VD0hulBQu3q0U/7JQ
   zejgdKY9gzq03QJ+EdTz7yzAlQ+UGybdxP+/ScsjYya76bK6UtBmBI2cP
   mM757OQOVFpBuCRl4IPzVWIFtS2Nm2KhyXHmHEEB+Q4nXyI4i0lUdQ0vm
   PWOAOQPpayQN82XNgtk3WZtRYMsPfwWfRCH0WmtFyxlUKf2jHzIPunWWC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377205234"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="377205234"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:24:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="861460289"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="861460289"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.47.169])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:24:20 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	rander.wang@intel.com,
	guennadi.liakhovetski@linux.intel.com
Subject: [PATCH 5/9] ASoC: SOF: ipc4: add exception node in sof debugfs
 directory
Date: Tue, 19 Sep 2023 12:24:12 +0300
Message-ID: <20230919092416.4137-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919092416.4137-1-peter.ujfalusi@linux.intel.com>
References: <20230919092416.4137-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 45BAIEB3GYTLNCNDJ72JS2CMAWT2RH6T
X-Message-ID-Hash: 45BAIEB3GYTLNCNDJ72JS2CMAWT2RH6T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/45BAIEB3GYTLNCNDJ72JS2CMAWT2RH6T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

The exception node is created when FW is ready and clear to
zero when FW post boot.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 4673c53f6c03..82f2f196c9c2 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -15,6 +15,7 @@
 #include "sof-audio.h"
 #include "ipc4-fw-reg.h"
 #include "ipc4-priv.h"
+#include "ipc4-telemetry.h"
 #include "ops.h"
 
 static const struct sof_ipc4_fw_status {
@@ -598,6 +599,8 @@ static int ipc4_fw_ready(struct snd_sof_dev *sdev, struct sof_ipc4_msg *ipc4_msg
 	sdev->debug_box.offset = snd_sof_dsp_get_window_offset(sdev,
 							SOF_IPC4_DEBUG_WINDOW_IDX);
 
+	sof_ipc4_create_exception_debugfs_node(sdev);
+
 	dev_dbg(sdev->dev, "mailbox upstream 0x%x - size 0x%x\n",
 		inbox_offset, inbox_size);
 	dev_dbg(sdev->dev, "mailbox downstream 0x%x - size 0x%x\n",
-- 
2.42.0

