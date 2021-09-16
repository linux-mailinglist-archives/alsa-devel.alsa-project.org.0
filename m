Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD1740D77C
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 12:34:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1CE7187A;
	Thu, 16 Sep 2021 12:33:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1CE7187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631788448;
	bh=wjCtM4uVrP24/Rq+/zc3Bgz3Fs7uEdGtmBQjj9xj9ew=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bw/bPFikWjEOnA52hp725LJVSLg6SqszK8egcBWIoKuuBCClD3F5dJ4epws7xbsPM
	 ImCY4MkS76VYZVz3G5BYGukGvmitXt0AwXe3BSw2mo3TMt96h+V4VDT4VKE09kFDXx
	 LlpFX3klKcDTkGQIHF/MmTw0oMh80iWardmpST5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB285F804B0;
	Thu, 16 Sep 2021 12:32:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21280F804B0; Thu, 16 Sep 2021 12:32:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47997F80117
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 12:32:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47997F80117
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="202031849"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="202031849"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 03:32:17 -0700
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="545473514"
Received: from gkapusti-mobl.ccr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.35.152])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 03:32:15 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 1/6] ASoC: SOF: ipc: Add probe message logging to
 ipc_log_header()
Date: Thu, 16 Sep 2021 13:32:06 +0300
Message-Id: <20210916103211.1573-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916103211.1573-1-peter.ujfalusi@linux.intel.com>
References: <20210916103211.1573-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

Probe related messages are missing from the logging, for example the
PROBE_INIT would show up as:

ipc tx: 0xc0010000: unknown GLB command
ipc tx succeeded: 0xc0010000: unknown GLB command

Add code to handle  the probe messages to have human readable output

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index a4fe007a0e4d..32c139631f11 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -192,6 +192,29 @@ static void ipc_log_header(struct device *dev, u8 *text, u32 cmd)
 			str2 = "unknown type"; break;
 		}
 		break;
+	case SOF_IPC_GLB_PROBE:
+		str = "GLB_PROBE";
+		switch (type) {
+		case SOF_IPC_PROBE_INIT:
+			str2 = "INIT"; break;
+		case SOF_IPC_PROBE_DEINIT:
+			str2 = "DEINIT"; break;
+		case SOF_IPC_PROBE_DMA_ADD:
+			str2 = "DMA_ADD"; break;
+		case SOF_IPC_PROBE_DMA_INFO:
+			str2 = "DMA_INFO"; break;
+		case SOF_IPC_PROBE_DMA_REMOVE:
+			str2 = "DMA_REMOVE"; break;
+		case SOF_IPC_PROBE_POINT_ADD:
+			str2 = "POINT_ADD"; break;
+		case SOF_IPC_PROBE_POINT_INFO:
+			str2 = "POINT_INFO"; break;
+		case SOF_IPC_PROBE_POINT_REMOVE:
+			str2 = "POINT_REMOVE"; break;
+		default:
+			str2 = "unknown type"; break;
+		}
+		break;
 	default:
 		str = "unknown GLB command"; break;
 	}
-- 
2.33.0

