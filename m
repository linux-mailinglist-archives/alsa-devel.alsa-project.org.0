Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4C85BCBBF
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 14:24:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 444911679;
	Mon, 19 Sep 2022 14:23:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 444911679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663590279;
	bh=0aw9qPOHxdJ6SIli7UYXGlRat7MeJcrgwJ3cAhtR010=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GaMKfhjH1qjIpp4Vq5E+6gry0VupkD2NSOjXO6gpq+b3y0BLuK6VBDxiAgZKk10ST
	 nRkjoVkP2UO3opbEBcEcRHa2wzX7+nSsH1CStghZW+UmmtDDHX1SvSEJtYXYqAoNwD
	 yHeFsy558RdUw+T6YXsG9HeVbTzc3mgD2DEtmfEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BE38F80559;
	Mon, 19 Sep 2022 14:22:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73E59F8056F; Mon, 19 Sep 2022 14:22:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8E19F80559
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 14:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8E19F80559
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="iZQLwDzY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663590130; x=1695126130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0aw9qPOHxdJ6SIli7UYXGlRat7MeJcrgwJ3cAhtR010=;
 b=iZQLwDzYNQOirA1jhYs8cZbDu43VJDCqwJf4BCLwZmM4rhkI1lx0jyBU
 yNa54F0/p0J0n+cZ7/U2lvHhaX9Tu3n2uu+J1kZsYNR0V3Qcm3bt+MMIh
 rBl28G35VAAJwpb5zFn2P1SMA00vLSxwhWrBb4HwN8XWqu5h/pdOMr1JK
 pFB645h1HIWYzlZxVN10t/Av0IutvLET9bdy6U1SDnkquqYmLZ5wyuC9v
 Be8muySdNj5RLcPiWxJTIIDsfSmo9pfVMmrQEu9irc/wH84cX4CzsCm3s
 5bjdVbWFLNJL79dNGqo/GtJk6fOkKPLt8Tdvz2hBWiAxuJZe5O8nINh4t A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="325676028"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="325676028"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:22:08 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="620837749"
Received: from amagnus-mobl2.ger.corp.intel.com (HELO pbossart-mobl3.home)
 ([10.249.46.168])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 05:22:04 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/7] ASoC: SOF: replace ipc4-loader dev_vdbg with tracepoints
Date: Mon, 19 Sep 2022 14:21:08 +0200
Message-Id: <20220919122108.43764-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220919122108.43764-1-pierre-louis.bossart@linux.intel.com>
References: <20220919122108.43764-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Noah Klayman <noah.klayman@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Noah Klayman <noah.klayman@intel.com>

This patch replaces dev_vdbg with tracepoints in new ipc4-loader code.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Noah Klayman <noah.klayman@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/trace/events/sof.h  | 17 +++++++++++++++++
 sound/soc/sof/ipc4-loader.c |  7 ++++---
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/include/trace/events/sof.h b/include/trace/events/sof.h
index 03751323aaa84..21c2a1efb9f6e 100644
--- a/include/trace/events/sof.h
+++ b/include/trace/events/sof.h
@@ -98,6 +98,23 @@ TRACE_EVENT(sof_stream_position_ipc_rx,
 	TP_printk("device_name=%s", __get_str(device_name))
 );
 
+TRACE_EVENT(sof_ipc4_fw_config,
+	TP_PROTO(struct snd_sof_dev *sdev, char *key, u32 value),
+	TP_ARGS(sdev, key, value),
+	TP_STRUCT__entry(
+		__string(device_name, dev_name(sdev->dev))
+		__string(key, key)
+		__field(u32, value)
+	),
+	TP_fast_assign(
+		__assign_str(device_name, dev_name(sdev->dev));
+		__assign_str(key, key);
+		__entry->value = value;
+	),
+	TP_printk("device_name=%s key=%s value=%d",
+		  __get_str(device_name), __get_str(key), __entry->value)
+);
+
 #endif /* _TRACE_SOF_H */
 
 /* This part must be outside protection */
diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index c678f05d0ef55..e635ae515fa9f 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -8,6 +8,7 @@
 #include <linux/firmware.h>
 #include <sound/sof/ext_manifest4.h>
 #include <sound/sof/ipc4/header.h>
+#include <trace/events/sof.h>
 #include "ipc4-priv.h"
 #include "sof-audio.h"
 #include "sof-priv.h"
@@ -194,13 +195,13 @@ static int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev)
 				 fw_ver->build);
 			break;
 		case SOF_IPC4_FW_CFG_DL_MAILBOX_BYTES:
-			dev_vdbg(sdev->dev, "DL mailbox size: %u\n", *tuple->value);
+			trace_sof_ipc4_fw_config(sdev, "DL mailbox size", *tuple->value);
 			break;
 		case SOF_IPC4_FW_CFG_UL_MAILBOX_BYTES:
-			dev_vdbg(sdev->dev, "UL mailbox size: %u\n", *tuple->value);
+			trace_sof_ipc4_fw_config(sdev, "UL mailbox size", *tuple->value);
 			break;
 		case SOF_IPC4_FW_CFG_TRACE_LOG_BYTES:
-			dev_vdbg(sdev->dev, "Trace log size: %u\n", *tuple->value);
+			trace_sof_ipc4_fw_config(sdev, "Trace log size", *tuple->value);
 			ipc4_data->mtrace_log_bytes = *tuple->value;
 			break;
 		default:
-- 
2.34.1

