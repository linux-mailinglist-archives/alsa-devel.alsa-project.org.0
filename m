Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1599A442B72
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Nov 2021 11:13:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4560C16D3;
	Tue,  2 Nov 2021 11:12:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4560C16D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635848005;
	bh=q0T0pudockPHkctCcJNt913VLPeDFMLoNU9HbCyqazc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GgEKmr90ra6f6fN2ouomRvdXTDtL0MH6rX8pV0wma2XY5TRXMS6lqv2qG2R9dY5AN
	 rFSW/88q57DbSFlZPpit5o1QrW8ON3yPE3NDKioYfMQF3eAirMIKmC/3s7ARigF2JX
	 BWc/S6kJv9kpMfuypjoru1lcJzhShnRSlT2YRcSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8095CF8049C;
	Tue,  2 Nov 2021 11:11:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 206C2F8049C; Tue,  2 Nov 2021 11:11:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CA60F80224
 for <alsa-devel@alsa-project.org>; Tue,  2 Nov 2021 11:11:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CA60F80224
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="211278004"
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; d="scan'208";a="211278004"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 03:10:10 -0700
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; d="scan'208";a="500477157"
Received: from asorichi-mobl1.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.44.213])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 03:10:08 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 1/3] ASoC: SOF: IPC: Add new IPC command to free trace DMA
Date: Tue,  2 Nov 2021 12:10:17 +0200
Message-Id: <20211102101019.14037-2-peter.ujfalusi@linux.intel.com>
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

Add a new SOF_IPC_TRACE_DMA_FREE IPC command to stop and free trace DMA
in the FW.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/sof/header.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
index 4c747c52e01b..b97a76bcb655 100644
--- a/include/sound/sof/header.h
+++ b/include/sound/sof/header.h
@@ -119,6 +119,7 @@
 #define SOF_IPC_TRACE_DMA_POSITION		SOF_CMD_TYPE(0x002)
 #define SOF_IPC_TRACE_DMA_PARAMS_EXT		SOF_CMD_TYPE(0x003)
 #define SOF_IPC_TRACE_FILTER_UPDATE		SOF_CMD_TYPE(0x004) /**< ABI3.17 */
+#define SOF_IPC_TRACE_DMA_FREE		SOF_CMD_TYPE(0x005) /**< ABI3.20 */
 
 /* debug */
 #define SOF_IPC_DEBUG_MEM_USAGE			SOF_CMD_TYPE(0x001)
-- 
2.33.1

