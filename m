Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B11540BFF2
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 08:57:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A353F182D;
	Wed, 15 Sep 2021 08:57:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A353F182D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631689077;
	bh=2KNt9+Fm8rBl/BQnTVYA9ppPBJRJYe9eYslmeT+nP4Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t/ZeFQW4L+NLI5hxkejZSrBMMH4xvvG1r9cUod0RSRYp+AJRuN/qk1lQgF2byGc5W
	 Jqq9DLlI4j/QQBe/By0JGSRBIuhViIEhWyZY+rw1hhUX8VCNinR+xTro1vZeuTwatO
	 INmXPZ4HEPZQ7SHof/QMn0cOP5rzLI/cRzqVaWco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C2E2F804EC;
	Wed, 15 Sep 2021 08:56:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66C0EF804EB; Wed, 15 Sep 2021 08:56:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5215F80132
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 08:55:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5215F80132
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="221901789"
X-IronPort-AV: E=Sophos;i="5.85,294,1624345200"; d="scan'208";a="221901789"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 23:55:50 -0700
X-IronPort-AV: E=Sophos;i="5.85,294,1624345200"; d="scan'208";a="544604236"
Received: from msavu-mobl1.ti.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.216.36])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2021 23:55:48 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 2/2] ASoC: SOF: Drop resindex_dma_base, dma_engine,
 dma_size from sof_dev_desc
Date: Wed, 15 Sep 2021 09:55:41 +0300
Message-Id: <20210915065541.1178-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915065541.1178-1-peter.ujfalusi@linux.intel.com>
References: <20210915065541.1178-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 daniel.baluta@nxp.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

resindex_dma_base, dma_engine and dma_size is unused, remove them.
There is no hint in the comments how this supposed to be used, when the
need arises it can be added back.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/sof.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 6a1cd8e783d8..23b374311d16 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -74,11 +74,6 @@ struct sof_dev_desc {
 	int resindex_pcicfg_base;
 	int resindex_imr_base;
 	int irqindex_host_ipc;
-	int resindex_dma_base;
-
-	/* DMA only valid when resindex_dma_base != -1*/
-	int dma_engine;
-	int dma_size;
 
 	/* IPC timeouts in ms */
 	int ipc_timeout;
-- 
2.33.0

