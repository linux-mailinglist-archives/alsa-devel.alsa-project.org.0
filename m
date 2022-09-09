Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FEE5B369B
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 13:45:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 750B31691;
	Fri,  9 Sep 2022 13:44:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 750B31691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662723916;
	bh=SmRMdBYeUJbZosPCd22riuiiwsvKPoGEMlwPMCxroNw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p6kUzWhWchAs4331/bUw69xYUUnRktJ0jid+iK0RMBTU4Mi4C+Khc7x5vDOap+2Z6
	 RKd0civ5T2r8duXwLPLYgo2XxKBFOcsnRxPWkv7TuKVE1HM8pLy8IYnJgz++Dt67zk
	 xYDBSiBnGiDdk26rN3SODeTM2EHrAn/oCF6C6Daw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F8A4F804B4;
	Fri,  9 Sep 2022 13:43:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB463F804AE; Fri,  9 Sep 2022 13:43:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3F90F80105
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 13:43:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3F90F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="j95XmoCd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662723823; x=1694259823;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SmRMdBYeUJbZosPCd22riuiiwsvKPoGEMlwPMCxroNw=;
 b=j95XmoCdHoxFoqPs6fmjlHXQnYeIO2+q2o9byw64/IYdRwdMWUYjRCj/
 6xprq/0G5+jwg7/qrEHtsV2SMuDCXuci+Ko3A/d804pVrusRcYJYrwoDF
 wYsGuq/uqsxu5Ihvvw6aYPn8KBfmpBfcXPhHWU0UN1BWjrkagduENkVSd
 mfD10W/TFucxE3n8iVClGKKy3NolVTTSDTt7n48aZbS4UJVDe4EarCz8R
 JTiFIWBR1Elo8NWQ7Wi/JdTHGOV6j5o3vFiVILhr9/x6uaA/zRPuJl6iW
 aS6pTpm+u6xqjYnpt8W7dRtG0+8YvpFLuhe6npU7AOzq015Fx+EjYO9qr w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="359180084"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="359180084"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 04:43:33 -0700
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="683613822"
Received: from desharpe-mobl1.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.0.89])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 04:43:31 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 1/7] ASoC: SOF: ipc4: Only print LOG BUFFER update message
 info if requested
Date: Fri,  9 Sep 2022 14:43:26 +0300
Message-Id: <20220909114332.31393-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220909114332.31393-1-peter.ujfalusi@linux.intel.com>
References: <20220909114332.31393-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
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

Do not print messages when the SOF_DBG_PRINT_DMA_POSITION_UPDATE_LOGS flag
is not set to reduce the amount of prints when the tracing is used.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 432b812bdf9c..1c51938ce43b 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -205,6 +205,11 @@ static void sof_ipc4_log_header(struct device *dev, u8 *text, struct sof_ipc4_ms
 			/* Notification message */
 			u32 notif = SOF_IPC4_NOTIFICATION_TYPE_GET(msg->primary);
 
+			/* Do not print log buffer notification if not desired */
+			if (notif == SOF_IPC4_NOTIFY_LOG_BUFFER_STATUS &&
+			    !sof_debug_check_flag(SOF_DBG_PRINT_DMA_POSITION_UPDATE_LOGS))
+				return;
+
 			if (notif < SOF_IPC4_NOTIFY_TYPE_LAST)
 				str2 = ipc4_dbg_notification_type[notif];
 			if (!str2)
@@ -234,6 +239,13 @@ static void sof_ipc4_log_header(struct device *dev, u8 *text, struct sof_ipc4_ms
 static void sof_ipc4_log_header(struct device *dev, u8 *text, struct sof_ipc4_msg *msg,
 				bool data_size_valid)
 {
+	/* Do not print log buffer notification if not desired */
+	if (!sof_debug_check_flag(SOF_DBG_PRINT_DMA_POSITION_UPDATE_LOGS) &&
+	    !SOF_IPC4_MSG_IS_MODULE_MSG(msg->primary) &&
+	    SOF_IPC4_MSG_TYPE_GET(msg->primary) == SOF_IPC4_GLB_NOTIFICATION &&
+	    SOF_IPC4_NOTIFICATION_TYPE_GET(msg->primary) == SOF_IPC4_NOTIFY_LOG_BUFFER_STATUS)
+		return;
+
 	if (data_size_valid && msg->data_size)
 		dev_dbg(dev, "%s: %#x|%#x [data size: %zu]\n", text,
 			msg->primary, msg->extension, msg->data_size);
-- 
2.37.3

