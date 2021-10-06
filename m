Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C462423C2D
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 13:11:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDFB5167E;
	Wed,  6 Oct 2021 13:10:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDFB5167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633518698;
	bh=YhTLjc9qAGWgmqM6ToCz6CAD45fqj/0H9Gf65biM7/s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MSZuH0e/by9OvNLOvk2aiNdafLzZ/lS8+9eBSdfalji2wrnl8HHhXbeaHo/rVLHQ3
	 AhuTpIoaVfG84Alqcyk1lN18EbExBXyYO/MB+qOmcq6rw3PJHeE83Pldt14/t6rC7P
	 cv7t1II7m0+w4Ljcf78B5rneOuiS8NYAQoCtvXzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A1CFF80537;
	Wed,  6 Oct 2021 13:07:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC26DF80535; Wed,  6 Oct 2021 13:07:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9465DF8051B
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 13:07:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9465DF8051B
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="223366475"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="223366475"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:07:13 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="439081145"
Received: from byurovit-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.39.239])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:07:10 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 13/19] ASoC: SOF: ops: Force DSP panic dumps to be printed
Date: Wed,  6 Oct 2021 14:06:39 +0300
Message-Id: <20211006110645.26679-14-peter.ujfalusi@linux.intel.com>
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

If a DSP panic happens we want to see the dumps.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ops.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sof/ops.c b/sound/soc/sof/ops.c
index 11ecebd07907..160b88a2d59f 100644
--- a/sound/soc/sof/ops.c
+++ b/sound/soc/sof/ops.c
@@ -157,6 +157,9 @@ void snd_sof_dsp_panic(struct snd_sof_dev *sdev, u32 offset)
 		dev_dbg(sdev->dev, "panic: dsp_oops_offset %zu offset %d\n",
 			sdev->dsp_oops_offset, offset);
 
+	/* We want to see the DSP panic! */
+	sdev->dbg_dump_printed = false;
+
 	snd_sof_dsp_dbg_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX);
 	snd_sof_trace_notify_for_error(sdev);
 }
-- 
2.33.0

