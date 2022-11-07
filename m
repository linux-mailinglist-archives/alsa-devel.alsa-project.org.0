Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2462B61EE29
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 10:05:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A79F2822;
	Mon,  7 Nov 2022 10:04:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A79F2822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667811912;
	bh=wzcadR9LYAZH8hRy9PL/sijlwCn6gSnkuD0BoN2O3IY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dnrh/BMPzQCQEgJPAUbvEhs/WlY8yOLs4RROjrMAP8iZOtd2GogoK3z7tQrrcN29g
	 bQy7Y2nPDKJ2L7ziQznL7et2NXI0KWa4rRGbPIphsaFhEofF7Zup21YbENiMhuzErR
	 gnSCiIXIrmskRdEqlSIZp+lhxUJstuihP3rYeAa4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CDF7F804BD;
	Mon,  7 Nov 2022 10:04:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A05ADF8025A; Mon,  7 Nov 2022 10:04:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 308A0F800EC
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 10:04:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 308A0F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="C9mekZUN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667811850; x=1699347850;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wzcadR9LYAZH8hRy9PL/sijlwCn6gSnkuD0BoN2O3IY=;
 b=C9mekZUNM6o8D2fggGf0xhQeCrmJnBBuFF3wOKhRDOy3Knln6yREACDM
 VONN3cL7Tr2qpronx61cFxJPsLyhJVUltjDDAOaisivTBXi8JRWKxYUkh
 9MS2AAheT7YkF3dCP5A/eV78vEkP/lDQrqmwYUyJyKTbUZnALm4rBfoN9
 y0HbO1Ds5zLfjYzZeJaFRkgwiSI6oz1zE1g3Ddgk2GB9Hu/4IqmH1iSTT
 7LuEbrqULoO+6JGgkHiBLcBJ5Ca1tZ2+Khb4aLA8omNz7SYMzeutf1oMl
 yO/3u3wYmFRimOa062j6SRiUJ/nZ5IJdFiF7XAMDFI7JGCwJT8jtnFCDe w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="311498691"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="311498691"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 01:04:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="741412431"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="741412431"
Received: from akharade-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.14.37])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 01:04:04 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: topology: No need to assign core ID if token
 parsing failed
Date: Mon,  7 Nov 2022 11:04:33 +0200
Message-Id: <20221107090433.5146-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.1
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

Move the return value check before attempting to assign the core ID to the
swidget since we are going to fail the sof_widget_ready() and free up
swidget anyways.

Fixes: 909dadf21aae ("ASoC: SOF: topology: Make DAI widget parsing IPC agnostic")

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/topology.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 38855dd60617..6a0e7f3b5023 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1344,16 +1344,6 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		break;
 	}
 
-	if (sof_debug_check_flag(SOF_DBG_DISABLE_MULTICORE)) {
-		swidget->core = SOF_DSP_PRIMARY_CORE;
-	} else {
-		int core = sof_get_token_value(SOF_TKN_COMP_CORE_ID, swidget->tuples,
-					       swidget->num_tuples);
-
-		if (core >= 0)
-			swidget->core = core;
-	}
-
 	/* check token parsing reply */
 	if (ret < 0) {
 		dev_err(scomp->dev,
@@ -1365,6 +1355,16 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		return ret;
 	}
 
+	if (sof_debug_check_flag(SOF_DBG_DISABLE_MULTICORE)) {
+		swidget->core = SOF_DSP_PRIMARY_CORE;
+	} else {
+		int core = sof_get_token_value(SOF_TKN_COMP_CORE_ID, swidget->tuples,
+					       swidget->num_tuples);
+
+		if (core >= 0)
+			swidget->core = core;
+	}
+
 	/* bind widget to external event */
 	if (tw->event_type) {
 		if (widget_ops[w->id].bind_event) {
-- 
2.38.1

