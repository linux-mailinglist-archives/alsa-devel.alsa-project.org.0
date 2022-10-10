Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9555F9E11
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 13:55:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8662292C;
	Mon, 10 Oct 2022 13:54:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8662292C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665402908;
	bh=QCz5bxo15VEkNJsvIJ4sTJx/idRityrxqBRwaMhJiHI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nwYh4RZAXPURiosbCxs/IWTqv9l4MjEQeJWaHhz9TDA1gxjMgRDA1YA+L6+Jb36jm
	 rjmSKpBvGCjdhBi0a+xElY0K3JB4PYFN32SvQ59YkNIK0mtCygGGBnWyNSryJ5uVl0
	 Lm1JG9/Ue2z9+SadgwOQW4MVcnyvRMHWISiarXBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3497BF8055C;
	Mon, 10 Oct 2022 13:52:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69B8FF80579; Mon, 10 Oct 2022 13:51:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7103BF80568
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 13:51:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7103BF80568
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bGUAKprr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665402716; x=1696938716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QCz5bxo15VEkNJsvIJ4sTJx/idRityrxqBRwaMhJiHI=;
 b=bGUAKprrX+im57jOs2Igh8dvEx4Z6WA/RLcjMZ/6+iFAyi58f+pYO4zI
 Omx7k+lEL1ftW6mqNmP6bXI4v3oRFZeDGLVf1jCVzuxswDGJCwpZTaENh
 HM47Zz8cwR3D1tD0uQk8NH3lIX5aXbO6NS3vUbxZQJoFqYD7x7STK3bTU
 aNdZ03/2sKMSuKP9Sxoyw6vzAKKyZw1wKdrPSbhqFm4f9H5sgd6XZEJXk
 FzLBe5WqmpegtLqtdWnzRKZ0mXb3yOLBeIfvOnC9FzkyHC7Sdtd5JcPSj
 3YBc6t9oTyoB6BnKFA4Ca9F0+cmBndyhSUYq2uq4sED0IdJEtJOsHsGVf g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="390513251"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="390513251"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 04:51:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="954889083"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="954889083"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 10 Oct 2022 04:51:53 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 10/15] ASoC: Intel: avs: Do not reuse msg between different
 IPC handlers
Date: Mon, 10 Oct 2022 14:07:44 +0200
Message-Id: <20221010120749.716499-11-cezary.rojewski@intel.com>
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

While LOG_BUFFER_STATUS is a simple notification with only one
meaningful field, same message ptr shall not be reused for two different
handlers.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/apl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/apl.c b/sound/soc/intel/avs/apl.c
index b8e2b23c9f64..7c8ce98eda9d 100644
--- a/sound/soc/intel/avs/apl.c
+++ b/sound/soc/intel/avs/apl.c
@@ -133,12 +133,14 @@ static int apl_coredump(struct avs_dev *adev, union avs_notify_msg *msg)
 	buf = apl_log_payload_addr(addr);
 	memcpy_fromio(&layout, addr, sizeof(layout));
 	if (!apl_is_entry_stackdump(buf + layout.read_ptr)) {
+		union avs_notify_msg lbs_msg = AVS_NOTIFICATION(LOG_BUFFER_STATUS);
+
 		/*
 		 * DSP awaits the remaining logs to be
 		 * gathered before dumping stack
 		 */
-		msg->log.core = msg->ext.coredump.core_id;
-		avs_dsp_op(adev, log_buffer_status, msg);
+		lbs_msg.log.core = msg->ext.coredump.core_id;
+		avs_dsp_op(adev, log_buffer_status, &lbs_msg);
 	}
 
 	pos = dump + AVS_FW_REGS_SIZE;
-- 
2.25.1

