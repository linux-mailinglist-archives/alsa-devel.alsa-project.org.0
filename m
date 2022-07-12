Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DFB5719E7
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 14:25:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15C33169B;
	Tue, 12 Jul 2022 14:24:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15C33169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657628714;
	bh=yftBh4Zn0heBid2RbwTCb4swAoo2TXf5ztlFFKI6uSo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kioKXKwLQogIbfTuFYLBlOoYw9rRICk5fxHxq1I7U8CafGA61mzUiST77CksM0560
	 0g90TEDoZ1LAC3xuynLv/JW4pV9A+OkZQp3A08PgouQEfT/wooRseUmwfjy6IYtbck
	 z5Cyc1iePr6hKpd/v+uJz8mCWbm2wT+Luvfepj7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7C08F80548;
	Tue, 12 Jul 2022 14:23:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C488F80543; Tue, 12 Jul 2022 14:23:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E955F80246
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 14:23:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E955F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RaaFwgMC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657628599; x=1689164599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yftBh4Zn0heBid2RbwTCb4swAoo2TXf5ztlFFKI6uSo=;
 b=RaaFwgMCXCaMPZbO8p0iwEps9gjWRqOrK61ntynwa3JDZgJym7lH27Ue
 vAZ8wj+Y2Qpqc8S4ku62C1BIpL0SlJykHPcmOQY/HFiWSUdyLPjjifUX5
 ZauDjKxRMan2C1fAyrHzGDtiwb1GOWACwTqB8K+VDYgaqEZYwR8xkN3YN
 ROKSj9JWh1kwROlkETqmFfWwSH7/IfyneOD7Sm7VZcrd54JRcEH/fxjxI
 m7iozvDg24GFI+jVHJ3+YeG2iKWWOtgVxUFcntP5T8XL/u6O2kSC6j6wR
 Fp7QhIbnaE3w0T6DMm9wwKIXZAq/cVeaoihBQYFEHLnXMZXXXhSQd/7/m w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="284945779"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="284945779"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 05:23:18 -0700
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="922178917"
Received: from ahedstro-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.254.175])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 05:23:16 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 3/3] ASoC: SOF: Intel: mtl: Do not process IPC reply before
 firmware boot
Date: Tue, 12 Jul 2022 15:23:57 +0300
Message-Id: <20220712122357.31282-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220712122357.31282-1-peter.ujfalusi@linux.intel.com>
References: <20220712122357.31282-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

It is not yet clear, but it is possible to create a firmware so broken
that it will send a reply message before a FW_READY message (it is not
yet clear if FW_READY will arrive later).
Since the reply_data is allocated only after the FW_READY message, this
will lead to a NULL pointer dereference if not filtered out.

Reported-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/mtl.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 3a043589c12b..a5e244ea0688 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -512,17 +512,23 @@ static irqreturn_t mtl_ipc_irq_thread(int irq, void *context)
 		 */
 		if (primary & SOF_IPC4_MSG_DIR_MASK) {
 			/* Reply received */
-			struct sof_ipc4_msg *data = sdev->ipc->msg.reply_data;
+			if (likely(sdev->fw_state == SOF_FW_BOOT_COMPLETE)) {
+				struct sof_ipc4_msg *data = sdev->ipc->msg.reply_data;
 
-			data->primary = primary;
-			data->extension = extension;
+				data->primary = primary;
+				data->extension = extension;
 
-			spin_lock_irq(&sdev->ipc_lock);
+				spin_lock_irq(&sdev->ipc_lock);
 
-			snd_sof_ipc_get_reply(sdev);
-			snd_sof_ipc_reply(sdev, data->primary);
+				snd_sof_ipc_get_reply(sdev);
+				snd_sof_ipc_reply(sdev, data->primary);
 
-			spin_unlock_irq(&sdev->ipc_lock);
+				spin_unlock_irq(&sdev->ipc_lock);
+			} else {
+				dev_dbg_ratelimited(sdev->dev,
+						    "IPC reply before FW_READY: %#x|%#x\n",
+						    primary, extension);
+			}
 		} else {
 			/* Notification received */
 			notification_data.primary = primary;
-- 
2.37.0

