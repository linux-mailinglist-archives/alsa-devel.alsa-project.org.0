Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C425F9E5A
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 14:07:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2196299D;
	Mon, 10 Oct 2022 14:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2196299D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665403663;
	bh=QCz5bxo15VEkNJsvIJ4sTJx/idRityrxqBRwaMhJiHI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JkqOvwSLVQekTi32BEMd8KWonjXZZ1lOU5FtF3icDTFlSMQN4Zb6OTCOoTeb1uM6x
	 YCaoJvo+JYbRHWozLWMByoC7QfqBsRB8R5CqBthQDe/ZAlPt/G6nH40GEn/zAMgqEN
	 V7zuV9cwZ4v0yeMZGzlaYXDjvekfN+vFBT8Sx+9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72C24F80588;
	Mon, 10 Oct 2022 14:04:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BECC9F80571; Mon, 10 Oct 2022 14:04:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2055EF80570
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 14:04:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2055EF80570
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IdYzUZoN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665403449; x=1696939449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QCz5bxo15VEkNJsvIJ4sTJx/idRityrxqBRwaMhJiHI=;
 b=IdYzUZoNvbpkYCsqAMnZPIEt13mJwr3M/TEluYt3JfgZiIDyJXKpXKOH
 llvQiTjQzEBGf9T9TpXf4MXFP2B2yM4lLpdfj8auMk3//AZ80ynyuAKeJ
 TJKqFxWOn3LB3/SmIG7oLX00kNEMNYlSuLZgGFtmOgzPZNgdstABTLcKx
 nNGZMMfiU1tQ4Quyvi20cC8VuSw+cP9KcFR/7dJT9iGh0RWxn4PTA5lpn
 v9MRoP4ERHuiKFsd+3yCo3dmzJJGLVGY8xViJEd/htZ6x4i1Vn2wjNH3k
 RfwZYfnn7nNhaBNlSYrnxy3K1QrygI73JgHxc+lX61/ar3Eow04lPlf/X Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="368346105"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="368346105"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 05:04:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="871078938"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="871078938"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 10 Oct 2022 05:04:05 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 10/15] ASoC: Intel: avs: Do not reuse msg between different
 IPC handlers
Date: Mon, 10 Oct 2022 14:19:50 +0200
Message-Id: <20221010121955.718168-11-cezary.rojewski@intel.com>
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

