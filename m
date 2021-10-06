Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EBB423C00
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 13:08:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F68915E2;
	Wed,  6 Oct 2021 13:08:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F68915E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633518537;
	bh=ABq1gnndob6kMqLLF4MVU+yy/BlqDC5W1o/yN5MLG7A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TG7Px7DI+Y5VYkCloPCwLek+NRj8Ue7dXa5axgZ2DTrjBYafY4sQEZsl9tKZoiSEE
	 NgJujP/Jio03Zuxhrxp5u9T/k2HlVCRsAdlR9yTOgFGi+2wmdfOl7Y5WdplT1FsCBV
	 IusgJ2MgGvzftp+VSm2rOkvP3wmM0EEmDGrN53ts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9B88F80240;
	Wed,  6 Oct 2021 13:07:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AFBEF804EB; Wed,  6 Oct 2021 13:06:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 965CEF80240
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 13:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 965CEF80240
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="223366431"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="223366431"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:06:45 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="439080949"
Received: from byurovit-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.39.239])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:06:43 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 02/19] ASoC: SOF: debug: Swap the dsp_dump and ipc_dump
 sequence for fw_exception
Date: Wed,  6 Oct 2021 14:06:28 +0300
Message-Id: <20211006110645.26679-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006110645.26679-1-peter.ujfalusi@linux.intel.com>
References: <20211006110645.26679-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
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

snd_sof_dsp_panic() only prints dsp_dump followed by flushing the DMA trace
buffer.

To retain similar 'sequence' first do an ipc_dump then the dsp_dump and
finally flush the trace buffer in case of fw_exception.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index f37ea1956406..3b85e0484411 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -832,8 +832,8 @@ void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev)
 	}
 
 	/* dump vital information to the logs */
-	snd_sof_dsp_dbg_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX);
 	snd_sof_ipc_dump(sdev);
+	snd_sof_dsp_dbg_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX);
 	snd_sof_trace_notify_for_error(sdev);
 }
 EXPORT_SYMBOL(snd_sof_handle_fw_exception);
-- 
2.33.0

