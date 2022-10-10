Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C045F9E19
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 13:55:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3A7B290B;
	Mon, 10 Oct 2022 13:55:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3A7B290B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665402955;
	bh=aS5WA8WlMd5hWmep+lOPzVMTSzxAIOkf840xYz3U/KM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FXMfgBonf78hkJG2um55EsuV+PNyWnDTkuckwHBp1bsePFrVHW+TUen6KjE3bzJzk
	 aDRiUlYBmUPFRtoNQ7FDFc66fpKmsQbDZXRbOqSxxtsqtdbPIdw93lz4N3dvU1K1A6
	 vX53aJ3H8i+cNs85UdF/mav8cAvZtF+TpTX1QLh0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04D0EF805B6;
	Mon, 10 Oct 2022 13:52:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F4CFF805B1; Mon, 10 Oct 2022 13:52:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C37A0F8058C
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 13:51:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C37A0F8058C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="m2CH0kj1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665402720; x=1696938720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aS5WA8WlMd5hWmep+lOPzVMTSzxAIOkf840xYz3U/KM=;
 b=m2CH0kj17AVHjzLZ4gae6FcXynunh1t61aw/ZA9YthXGfpCGv+Z0SbFH
 hXox8gIO/vN68vdTf26Yd4FjQh+JC0Xz4AaPa/GNB4ZCc7ckyy6qfAyTC
 uC7gnlSsintUzbeB3TwkLmqYzo7+b+6zW//UyavjtEayhvzzeLXJBNL20
 wHvGKBE/MIVqiKHaqeUCGxtgRd+oW5/HNZrUtXzypQLvDDxtHd6M6kcpD
 1L8m25bH7yZ7HZH9CReDYxG9NCl9QNmm0jJJNgFrx2/LE8Incmk0uSTQH
 gknHqwVdRDWuX8oFVnzGmXoCDKrXFQ8zWjP4V2fjhRDNogQmX8x6WDoF5 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="390513255"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="390513255"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 04:51:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="954889093"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="954889093"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 10 Oct 2022 04:51:55 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 11/15] ASoC: Intel: avs: Do not treat unsupported IPCs as
 invalid
Date: Mon, 10 Oct 2022 14:07:45 +0200
Message-Id: <20221010120749.716499-12-cezary.rojewski@intel.com>
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

Utilize NOT_SUPPORTED status code to differentiate between unsupported
and invalid requests. Skip over error paths if it is the former that is
communicated by the base firmware.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h      | 4 +++-
 sound/soc/intel/avs/messages.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 92e37722d280..91f78eb11bc1 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -220,8 +220,10 @@ static inline void avs_ipc_err(struct avs_dev *adev, struct avs_ipc_msg *tx,
 	/*
 	 * If IPC channel is blocked e.g.: due to ongoing recovery,
 	 * -EPERM error code is expected and thus it's not an actual error.
+	 *
+	 * Unsupported IPCs are of no harm either.
 	 */
-	if (error == -EPERM)
+	if (error == -EPERM || error == AVS_IPC_NOT_SUPPORTED)
 		dev_dbg(adev->dev, "%s 0x%08x 0x%08x failed: %d\n", name,
 			tx->glb.primary, tx->glb.ext.val, error);
 	else
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index c0f90dba9af8..02b3b7a74783 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -150,6 +150,8 @@ union avs_module_msg {
 	};
 } __packed;
 
+#define AVS_IPC_NOT_SUPPORTED 15
+
 union avs_reply_msg {
 	u64 val;
 	struct {
-- 
2.25.1

