Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F97334CD
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 18:21:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73A041684;
	Mon,  3 Jun 2019 18:20:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73A041684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559578905;
	bh=c65aoSF/jVMEWS6fy5XcRjw9FiSfUn89XSbPK6pSDpI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iMUn2JafUz8exBhCWRcOKWJwEUQD+brFCwRsg4CtVTtYTRaXwmVTvh+7fjB8BsIoh
	 ak1/ch2n/h28Mlgfq6xBbHnLE1taM0Rhc1zf9IRiW8OI4+oYrPI9cyVc534GxGITX1
	 uYJbi9KSB13WQUqx/7uVkkIdawXfMUKvQj6CO02A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D2F9F89733;
	Mon,  3 Jun 2019 18:18:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BAAEF896CE; Mon,  3 Jun 2019 18:18:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 737B6F896CE
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 18:18:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 737B6F896CE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 09:18:27 -0700
X-ExtLoop1: 1
Received: from chiannaa-mobl6.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.97.98])
 by orsmga008.jf.intel.com with ESMTP; 03 Jun 2019 09:18:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  3 Jun 2019 11:18:13 -0500
Message-Id: <20190603161821.7486-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190603161821.7486-1-pierre-louis.bossart@linux.intel.com>
References: <20190603161821.7486-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/9] ASoC: SOF: uapi: mirror firmware changes
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

We missed these two definitions for GDB support and component
notifications, they are defined for the SOF firmware. Since they are
not used by the kernel so far, we can still add them without any ABI
change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/header.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
index ccb6a004b37b..0aeb2c8ad6fd 100644
--- a/include/sound/sof/header.h
+++ b/include/sound/sof/header.h
@@ -48,6 +48,7 @@
 #define SOF_IPC_FW_READY			SOF_GLB_TYPE(0x7U)
 #define SOF_IPC_GLB_DAI_MSG			SOF_GLB_TYPE(0x8U)
 #define SOF_IPC_GLB_TRACE_MSG			SOF_GLB_TYPE(0x9U)
+#define SOF_IPC_GLB_GDB_DEBUG                   SOF_GLB_TYPE(0xAU)
 
 /*
  * DSP Command Message Types
@@ -78,6 +79,7 @@
 #define SOF_IPC_COMP_GET_VALUE			SOF_CMD_TYPE(0x002)
 #define SOF_IPC_COMP_SET_DATA			SOF_CMD_TYPE(0x003)
 #define SOF_IPC_COMP_GET_DATA			SOF_CMD_TYPE(0x004)
+#define SOF_IPC_COMP_NOTIFICATION		SOF_CMD_TYPE(0x005)
 
 /* DAI messages */
 #define SOF_IPC_DAI_CONFIG			SOF_CMD_TYPE(0x001)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
