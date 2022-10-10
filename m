Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 039BE5F9E18
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 13:55:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D4D32933;
	Mon, 10 Oct 2022 13:54:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D4D32933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665402940;
	bh=Kzbz2//MEbFomVYT3Je8Ry2vhVhj4UV2as/D/dMydqQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zibgdlwn5QpiLzMK0fCdv46/VPIXU3J0Ca8I7M+UeLFrmLkJizDjcGGeW3Rlzy+JS
	 NEpiPmgRuu9G7TZkZ/fpN8xAQ7TptkD8rgTT/YUCABfWOVLVdZCZsa8s4oeYOQBE5Y
	 Su+WUv346NeXtHxEkSRSrnKZuHIqOlZZqKZ7r5Ws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90F7FF805B2;
	Mon, 10 Oct 2022 13:52:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F194F805B1; Mon, 10 Oct 2022 13:52:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 692E1F805A8
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 13:51:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 692E1F805A8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RTAAdybq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665402720; x=1696938720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kzbz2//MEbFomVYT3Je8Ry2vhVhj4UV2as/D/dMydqQ=;
 b=RTAAdybqIHQErsleRGIREzXCcoNw/9mH6zk5HgTxWrILE+PIF/rXsru2
 +zwnV/gQuuVSltd+Fxvoo6Endf1dDQWnhEMGgctvTdaY9Ti+w1QtaQCKv
 Q0OcLr97zk7sNyk5mHL99kGCU2FrzrxIGFLpczGOu+Ie/eT9zJpNJgDl4
 +ksSd208KXRFMYYdU2HBE/Q9r9DWLxS8IyAnCv6XVty5Y3BqxkE3gs2D4
 Z0lvkACFnO5Uxsv1h6g/QkWHmYzUTPfcNY1GAfTwyYxriDTnVea7pNvER
 z5FFe+JFQcr2r4BIVmrTYq/xa3auaQ3uhq+A9iZfRC5vQKTB1xqORom2H g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="390513259"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="390513259"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 04:51:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="954889101"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="954889101"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 10 Oct 2022 04:51:57 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 12/15] ASoC: Intel: avs: Do not print IPC error message twice
Date: Mon, 10 Oct 2022 14:07:46 +0200
Message-Id: <20221010120749.716499-13-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010120749.716499-1-cezary.rojewski@intel.com>
References: <20221010120749.716499-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

ENABLE_LOGS and SYSTEM_TIME IPCs call LARGE_CONFIG_SET internally which
dumps an error message in case of an error. There is no need to repeat
the process in the top level handler.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/messages.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index d4bcee1aabcf..6b0fecbf07c3 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -687,20 +687,13 @@ int avs_ipc_get_modules_info(struct avs_dev *adev, struct avs_mods_info **info)
 
 int avs_ipc_set_enable_logs(struct avs_dev *adev, u8 *log_info, size_t size)
 {
-	int ret;
-
-	ret = avs_ipc_set_large_config(adev, AVS_BASEFW_MOD_ID, AVS_BASEFW_INST_ID,
-				       AVS_BASEFW_ENABLE_LOGS, log_info, size);
-	if (ret)
-		dev_err(adev->dev, "enable logs failed: %d\n", ret);
-
-	return ret;
+	return avs_ipc_set_large_config(adev, AVS_BASEFW_MOD_ID, AVS_BASEFW_INST_ID,
+					AVS_BASEFW_ENABLE_LOGS, log_info, size);
 }
 
 int avs_ipc_set_system_time(struct avs_dev *adev)
 {
 	struct avs_sys_time sys_time;
-	int ret;
 	u64 us;
 
 	/* firmware expects UTC time in micro seconds */
@@ -708,12 +701,8 @@ int avs_ipc_set_system_time(struct avs_dev *adev)
 	sys_time.val_l = us & UINT_MAX;
 	sys_time.val_u = us >> 32;
 
-	ret = avs_ipc_set_large_config(adev, AVS_BASEFW_MOD_ID, AVS_BASEFW_INST_ID,
-				       AVS_BASEFW_SYSTEM_TIME, (u8 *)&sys_time, sizeof(sys_time));
-	if (ret)
-		dev_err(adev->dev, "set system time failed: %d\n", ret);
-
-	return ret;
+	return avs_ipc_set_large_config(adev, AVS_BASEFW_MOD_ID, AVS_BASEFW_INST_ID,
+					AVS_BASEFW_SYSTEM_TIME, (u8 *)&sys_time, sizeof(sys_time));
 }
 
 int avs_ipc_copier_set_sink_format(struct avs_dev *adev, u16 module_id,
-- 
2.25.1

