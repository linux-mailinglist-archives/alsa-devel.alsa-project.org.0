Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A205F9E5B
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 14:07:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0599D1753;
	Mon, 10 Oct 2022 14:07:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0599D1753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665403674;
	bh=Kzbz2//MEbFomVYT3Je8Ry2vhVhj4UV2as/D/dMydqQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CjOyl925KT3/YJaoTxtPdE8ipZv/31ThjQ2fKO6aW+yIwN25+y34J3ElY0XNzGGUx
	 VUbZK/vfhAWBs7elci2tD6CNGvzFrLnVPaTvlyV8jfYfQVnkcWXyC48XT7jpheR+CY
	 O9iY3pzidb+/AWTmlsTPMQTqHcjDMdFDM9SG6HLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1E1FF804E5;
	Mon, 10 Oct 2022 14:04:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A1DEF805AC; Mon, 10 Oct 2022 14:04:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 596B5F80588
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 14:04:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 596B5F80588
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="H5LQ/miQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665403454; x=1696939454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kzbz2//MEbFomVYT3Je8Ry2vhVhj4UV2as/D/dMydqQ=;
 b=H5LQ/miQ+lpmphvQtg1zUiKiWmrF2tYVadDy1N+0rNiV0iy4MSVXcfjQ
 HwNSjxr225CHI4ZhkoRrMlYZScTMckanZNDiAKhX/45ppi0xi6QPklSJo
 IaogV3sc0u2gzuF1b6zA95UsWqRLh4czGejB/0r6bkCB7vAh2BvYbgToY
 NppItEKppf7sDLt9YnJs3GMtIDoXJPmOgkT/4ZK6MFhWeSRyis8Tkj1le
 9PZEvK/Wd+GAJiDUUqEK0EA3ifFM4dMB5xOgALk5vsxYMpRN08xzlUtYl
 pSiCrJ1Iz6qp1/dBNAooXk4/63bdvitMNVHX4CmdoGkA6M+egp6hBkj+E w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="368346119"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="368346119"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 05:04:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="871078947"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="871078947"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 10 Oct 2022 05:04:09 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 12/15] ASoC: Intel: avs: Do not print IPC error message
 twice
Date: Mon, 10 Oct 2022 14:19:52 +0200
Message-Id: <20221010121955.718168-13-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010121955.718168-1-cezary.rojewski@intel.com>
References: <20221010121955.718168-1-cezary.rojewski@intel.com>
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

