Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 558E3442B74
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Nov 2021 11:13:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A131716E6;
	Tue,  2 Nov 2021 11:12:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A131716E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635848028;
	bh=RNfV7VCFvbPhYBiG94EUUMniaiCIdifhG9Al/QOx5yM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aszqAdbltHgjEZunQ9sNIUgpsEqMS8mMEppk4rxuGKEEtGLgXXrQ5yCRj6ixN/Yk5
	 l/lEvzO1ktLOejTiOEcZweV3k8W/4rpvgoJIqdkkGE32WVGSCtKr85ImWFEiSjIxUq
	 7hHFrXGZ3FNelvcSRaPyd1xMBDfsWO9YdWcgHvTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BB31F804EC;
	Tue,  2 Nov 2021 11:11:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93987F804EB; Tue,  2 Nov 2021 11:11:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F3B8F8025F
 for <alsa-devel@alsa-project.org>; Tue,  2 Nov 2021 11:11:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F3B8F8025F
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="211278019"
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; d="scan'208";a="211278019"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 03:10:13 -0700
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; d="scan'208";a="500477166"
Received: from asorichi-mobl1.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.44.213])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 03:10:10 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 2/3] ASoC: SOF: IPC: update ipc_log_header()
Date: Tue,  2 Nov 2021 12:10:18 +0200
Message-Id: <20211102101019.14037-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102101019.14037-1-peter.ujfalusi@linux.intel.com>
References: <20211102101019.14037-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Parse all the trace DMA IPC commands in ipc_log_header().

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index e6c53c6c470e..a4036d0b3d3a 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -173,7 +173,22 @@ static void ipc_log_header(struct device *dev, u8 *text, u32 cmd)
 		}
 		break;
 	case SOF_IPC_GLB_TRACE_MSG:
-		str = "GLB_TRACE_MSG"; break;
+		str = "GLB_TRACE_MSG";
+		switch (type) {
+		case SOF_IPC_TRACE_DMA_PARAMS:
+			str2 = "DMA_PARAMS"; break;
+		case SOF_IPC_TRACE_DMA_POSITION:
+			str2 = "DMA_POSITION"; break;
+		case SOF_IPC_TRACE_DMA_PARAMS_EXT:
+			str2 = "DMA_PARAMS_EXT"; break;
+		case SOF_IPC_TRACE_FILTER_UPDATE:
+			str2 = "FILTER_UPDATE"; break;
+		case SOF_IPC_TRACE_DMA_FREE:
+			str2 = "DMA_FREE"; break;
+		default:
+			str2 = "unknown type"; break;
+		}
+		break;
 	case SOF_IPC_GLB_TEST_MSG:
 		str = "GLB_TEST_MSG";
 		switch (type) {
-- 
2.33.1

