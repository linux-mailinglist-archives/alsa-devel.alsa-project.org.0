Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B20520336
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 19:05:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C22318ED;
	Mon,  9 May 2022 19:04:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C22318ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652115949;
	bh=bfDJdYMeVvIeKwWHDaSaTzZNTKf2+FbXAYA7FO9f42A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GS3xMhe2we8lpNm23rOvhK4r8p3AjZG4AVu13pfrMEto7YvA7Grj42puiLn4+ZHVt
	 tRMdsdPBGCzf2+J614+kXiZ5/56PlLtmui0R4+YDI9e4WN3BYcoKwAjG083jCc6+XO
	 YsrXL0PQITHoawA2D/KWl9Hfmm8k4Mh8JBHNBwNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F391F80269;
	Mon,  9 May 2022 19:04:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5E96F8025D; Mon,  9 May 2022 19:04:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D748FF8011C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 19:04:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D748FF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="V+M9+1jW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652115883; x=1683651883;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bfDJdYMeVvIeKwWHDaSaTzZNTKf2+FbXAYA7FO9f42A=;
 b=V+M9+1jWmtGVr9hPs5+DnVaO8oTm6zti5Dtk/rgVbIMd2aFmgjnH4Ndo
 zASV0mq89zcWcNDErDS+R3du2ITffzwhOSvXJIbUGbzsSqUvVDKznRZ8F
 WvS2j/Lh6IhFu+2eiwnrCgqbe1sYzlPsPQNzYOfO/IhqdtRgXSSMuAvW/
 JXvOUKLxAe2TPe1wSyWZy8kiWCKD8loJEK+7kZocXfBMC/1InaqxLipQw
 NiqhcETsANxLGIBSWplDMcaTrhBXkqG8qMhvM/M5QwTZF6qBFbVNus/dX
 rqRQ/C5Jk5PLKNVHIzkZzF/0ZRzCfbIFK1hhGodb3sf/hEJ8xwIkAlRm1 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="249011659"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="249011659"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 10:04:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="565177994"
Received: from mkarkhan-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.61.140])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 10:04:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: ipc: introduce cont_update_posn in
 sof_ipc_stream_params struct
Date: Mon,  9 May 2022 12:04:25 -0500
Message-Id: <20220509170425.54640-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, YC Hung <yc.hung@mediatek.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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

From: YC Hung <yc.hung@mediatek.com>

The host stream position is updated when no_stream_position is set as 0.
However current implementation updates host stream position only when
report data is larger than or equal to host period size which is decided
by the period size of host side. It maybe cause host stream position
update not in time. Therefore this patch introduces another field
"cont_update_posn", a boolean value aimed to update host stream position
continuously and based on period size of pipeline. It can get better
precise when need to update host stream position from firmware.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: YC Hung <yc.hung@mediatek.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/stream.h   | 3 ++-
 include/uapi/sound/sof/abi.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/sound/sof/stream.h b/include/sound/sof/stream.h
index 58a0d49977d63..1db3bbc3e65d4 100644
--- a/include/sound/sof/stream.h
+++ b/include/sound/sof/stream.h
@@ -85,8 +85,9 @@ struct sof_ipc_stream_params {
 
 	uint32_t host_period_bytes;
 	uint16_t no_stream_position; /**< 1 means don't send stream position */
+	uint8_t cont_update_posn; /**< 1 means continuous update stream position */
 
-	uint16_t reserved[3];
+	uint8_t reserved[5];
 	uint16_t chmap[SOF_IPC_MAX_CHANNELS];	/**< channel map - SOF_CHMAP_ */
 } __packed;
 
diff --git a/include/uapi/sound/sof/abi.h b/include/uapi/sound/sof/abi.h
index b87e46684623b..0e7dccdc25fdd 100644
--- a/include/uapi/sound/sof/abi.h
+++ b/include/uapi/sound/sof/abi.h
@@ -26,7 +26,7 @@
 
 /* SOF ABI version major, minor and patch numbers */
 #define SOF_ABI_MAJOR 3
-#define SOF_ABI_MINOR 20
+#define SOF_ABI_MINOR 21
 #define SOF_ABI_PATCH 0
 
 /* SOF ABI version number. Format within 32bit word is MMmmmppp */
-- 
2.30.2

