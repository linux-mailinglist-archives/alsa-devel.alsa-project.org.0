Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8065F9E60
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 14:09:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A02452996;
	Mon, 10 Oct 2022 14:08:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A02452996
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665403739;
	bh=y30PTgU8msnrWFzBoNM3GWxnpWoJ49lG31Ykkyf5N+k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q1VuVO63krzRbKnA5rf1BPjI0U+rwWEc/x7VwZoZS6vEfrynih8nLOGt6n6YYJLBV
	 BBreSZ3TV07Il58PhpYOLvGQgRgh9wZ95UvBLdTy9MvmBWm8B38MmC6wzwWIGoHgcq
	 xoicTMTEj6AR7ABDwL/4QscdtN5oAdwfLutsIlrs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0540EF805C4;
	Mon, 10 Oct 2022 14:04:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8693BF805BB; Mon, 10 Oct 2022 14:04:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7B0DF8057A
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 14:04:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7B0DF8057A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SoHYNk4W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665403457; x=1696939457;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y30PTgU8msnrWFzBoNM3GWxnpWoJ49lG31Ykkyf5N+k=;
 b=SoHYNk4W1J7FV4iQ16HhMGgOg6QwTL3W5itqEDtO+KHZ0eU2zp3C3HK6
 GZy+akDvHYInDYPCIw7KCit4QgiB2WPuABZTJhgAf4d9PkuHTFi1GnH+J
 5UTJFaqFf4f79nsg6zP63xt/kOldSxSY8QcnqU6eza09lM6pEmwYfZUnQ
 sY3Su+DZQq9ASR3rhgQC2c8x+ymR0x4X6WRQNNnj3J07jULPrISEPzCST
 8S70GKlcYGHeqONOdWL9szbntUQKV+796UlWKuLZvKSI6BQZUjUZxyhzm
 Biz/mqa6wRGwDuwsQxbaV0QQWttlbCtD4OzoA8IegLm3+vnuxSBUQT2zw A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="368346132"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="368346132"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 05:04:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="871078961"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="871078961"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 10 Oct 2022 05:04:13 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 14/15] ASoC: Intel: avs: Simplify log control for SKL
Date: Mon, 10 Oct 2022 14:19:54 +0200
Message-Id: <20221010121955.718168-15-cezary.rojewski@intel.com>
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

Loop only till the actual number of AudioDSP cores, not the value of
mask made from said number.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/skl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/skl.c b/sound/soc/intel/avs/skl.c
index bda5ec7510fe..dc98b5cf900f 100644
--- a/sound/soc/intel/avs/skl.c
+++ b/sound/soc/intel/avs/skl.c
@@ -28,12 +28,12 @@ static int skl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32
 
 	info->core_mask = resource_mask;
 	if (enable)
-		for_each_set_bit(i, &resource_mask, GENMASK(num_cores, 0)) {
+		for_each_set_bit(i, &resource_mask, num_cores) {
 			info->logs_core[i].enable = enable;
 			info->logs_core[i].min_priority = *priorities++;
 		}
 	else
-		for_each_set_bit(i, &resource_mask, GENMASK(num_cores, 0))
+		for_each_set_bit(i, &resource_mask, num_cores)
 			info->logs_core[i].enable = enable;
 
 	ret = avs_ipc_set_enable_logs(adev, (u8 *)info, size);
-- 
2.25.1

