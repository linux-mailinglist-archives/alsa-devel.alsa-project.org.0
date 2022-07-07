Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4C456A21C
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jul 2022 14:36:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF5611635;
	Thu,  7 Jul 2022 14:35:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF5611635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657197372;
	bh=CNXKc1141cIxL1CggFk+aekG0XSLbDs/PG7XDdSjcmQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GzM2f185KFMmWSeh33y6ULRssgpYiHsFcxd6bSb/67uWGKM0wgO/qVbgj1cos6xhe
	 QV7fpf/Hqc99Yteyizt1mtEyUrc6T6xDk/vVhP4npXVwYX6cYHRhm+/M//D7spp5Gp
	 JQxIbqMGkJ1YvPYgMR7Ay+Iv3vILNepbYjfRoowU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5879F8058C;
	Thu,  7 Jul 2022 14:32:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F797F80137; Thu,  7 Jul 2022 14:32:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3A0AF80537
 for <alsa-devel@alsa-project.org>; Thu,  7 Jul 2022 14:31:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3A0AF80537
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RXWxHLHF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657197120; x=1688733120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CNXKc1141cIxL1CggFk+aekG0XSLbDs/PG7XDdSjcmQ=;
 b=RXWxHLHFQLwmg2umSfT02FmYDpjv2RoI355MtPCCl2kNGuGN0LAT/l8T
 qzCJNbQnUox6/Sv7Gtu22ha/ezahZ4Dq/ktXpCYdqQF3Ho7EKkE8K7t/e
 oWbNL3r99LSouV+VgNEd4pZ/QAuPE/wg2lo4vkSSAvn26EIRFWgU/2DGU
 JtQq0EMG3UmYE1tB+rWVDVLOCLwVsRMO70ijIDnKgVMRhHVfFxStld8mS
 C3SU1wUVdiKqgsn6/4GVTA6o5allRKXzEd0vD3tjErK3ppTf2eYAeGU3e
 M5P2D3JRv0B8DPAcWuyK1HgM7unVWxI2OstbNrRiV5TbBWPXPNx0oH6tn A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="272805912"
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="272805912"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 05:31:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; d="scan'208";a="593720599"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga002.jf.intel.com with ESMTP; 07 Jul 2022 05:31:56 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 05/12] ASoC: Intel: avs: Shield LARGE_CONFIG_GETs against zero
 payload_size
Date: Thu,  7 Jul 2022 14:41:46 +0200
Message-Id: <20220707124153.1858249-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220707124153.1858249-1-cezary.rojewski@intel.com>
References: <20220707124153.1858249-1-cezary.rojewski@intel.com>
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

Some LARGE_CONFIG_GETs are never expected to return payload of size 0.
Check for such situation and collapse if met.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/messages.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index 3559fb496e0b..9cf621eaec5a 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -474,6 +474,9 @@ int avs_ipc_get_fw_config(struct avs_dev *adev, struct avs_fw_cfg *cfg)
 				       &payload, &payload_size);
 	if (ret)
 		return ret;
+	/* Non-zero payload expected for FIRMWARE_CONFIG. */
+	if (!payload_size)
+		return -EREMOTEIO;
 
 	while (offset < payload_size) {
 		tlv = (struct avs_tlv *)(payload + offset);
@@ -587,6 +590,9 @@ int avs_ipc_get_hw_config(struct avs_dev *adev, struct avs_hw_cfg *cfg)
 				       &payload, &payload_size);
 	if (ret)
 		return ret;
+	/* Non-zero payload expected for HARDWARE_CONFIG. */
+	if (!payload_size)
+		return -EREMOTEIO;
 
 	while (offset < payload_size) {
 		tlv = (struct avs_tlv *)(payload + offset);
@@ -670,6 +676,9 @@ int avs_ipc_get_modules_info(struct avs_dev *adev, struct avs_mods_info **info)
 				       &payload, &payload_size);
 	if (ret)
 		return ret;
+	/* Non-zero payload expected for MODULES_INFO. */
+	if (!payload_size)
+		return -EREMOTEIO;
 
 	*info = (struct avs_mods_info *)payload;
 	return 0;
-- 
2.25.1

