Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4DD5BE985
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 17:03:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07F5315C3;
	Tue, 20 Sep 2022 17:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07F5315C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663686200;
	bh=2+GDO6vJeCL5xBorvgv+dMk374mDsFWNdWpN8wASQFU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gj/8JkfSU1NyZ3CXP+iNM7HDhPIf6aNdaxO4GSkBVR8puWY1o1qQ8+7u7qFyKyVW7
	 GoKmic8Vp6Alg5D4JQtfd15L3RApz4jnSgxSSpqHLMuZiPDS2XJyWyOuAv+sgjq0+1
	 1L/61CkXX7mnVoTxjgvS6Z6BgkLknWL+rZtKHPKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44553F8053A;
	Tue, 20 Sep 2022 17:01:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6E33F800F2; Tue, 20 Sep 2022 17:01:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02783F80171
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 17:01:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02783F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lRIU1dED"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663686094; x=1695222094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2+GDO6vJeCL5xBorvgv+dMk374mDsFWNdWpN8wASQFU=;
 b=lRIU1dEDUrk1gBLvD9S5gPf2CW82DxQoWi0rUoprGVG091OAAZB4Hl+F
 cOJKrsluttNXGRBoMJIKjdEN1dfQNtGWsCDla4rDGhdYU0yjF6R8zjGne
 CYUXRNxj24++omoc6SJcVZZUECr8JiTxwGeVknOvvejy5OsTfMTq+cqhV
 mveayx2nRchclG9S87JFPKsCHHKl37LlKQIVyzw2hzXnK4dmDXGkxuHjK
 uQlZ892joYuMtI/MnLIfkP0z2ReJ4/gXYebPd1D4TELhr3fYVReuNTTNR
 PNbDh3aLRGA6mgMUHVhpliDfGJ+yh1Ub36/ApA2w9GKQcce1inyOo39mm Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="280097343"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="280097343"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 08:01:30 -0700
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="687443697"
Received: from atcamara-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.209.87])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 08:01:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ASoC: SOF: clear prepare state when widget is unprepared
Date: Tue, 20 Sep 2022 17:01:06 +0200
Message-Id: <20220920150107.2090695-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920150107.2090695-1-pierre-louis.bossart@linux.intel.com>
References: <20220920150107.2090695-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Rander Wang <rander.wang@intel.com>

Playback can't work after the first try sometimes. The reason is that
some widgets don't have ipc_unprepare ops and driver will jump
to sink_prepare so miss to set prepare state to false. Next
time these widgets will not be prepared and it will result to
error with different format of audio file since the last setting
is not applicable.

This patch makes sure that widget prepare state will be cleared
to false when it is unprepared.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index a3d3dd7a00375..71cea83889fb0 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -271,14 +271,16 @@ sof_unprepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widg
 	struct snd_sof_widget *swidget = widget->dobj.private;
 	struct snd_soc_dapm_path *p;
 
-	if (!widget_ops[widget->id].ipc_unprepare || !swidget->prepared)
-		goto sink_unprepare;
+	/* it is already unprepared */
+	if (!swidget->prepared)
+		return;
+
+	if (widget_ops[widget->id].ipc_unprepare)
+		/* unprepare the source widget */
+		widget_ops[widget->id].ipc_unprepare(swidget);
 
-	/* unprepare the source widget */
-	widget_ops[widget->id].ipc_unprepare(swidget);
 	swidget->prepared = false;
 
-sink_unprepare:
 	/* unprepare all widgets in the sink paths */
 	snd_soc_dapm_widget_for_each_sink_path(widget, p) {
 		if (!p->walking && p->sink->dobj.private) {
-- 
2.34.1

