Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 569BA669D85
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 17:20:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6ADB65EB;
	Fri, 13 Jan 2023 17:19:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6ADB65EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673626808;
	bh=gR3lFRuixolSVgSLsxswUCJzS4/2DJJ0wiJyBOY5QgU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nOI0PGu6BMQVyY1QWHh1QyT9Tq1l438zH8n/13HlY/5BHOgZnPs8Bzwc5Jy2OvCpA
	 6phFJChvaK4EnrYFgaa06dx1+38GjI2o/G0wH25s2WLnHsGaO+mLF4CMBV4flCkdsy
	 jioc/Zz2EJWY9Iqeb1bk1DIcBmvDdbmvyBgyauxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF173F80544;
	Fri, 13 Jan 2023 17:18:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 706D8F8053D; Fri, 13 Jan 2023 17:18:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 555C0F8019B
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 17:18:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 555C0F8019B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FTSNl92I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673626734; x=1705162734;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gR3lFRuixolSVgSLsxswUCJzS4/2DJJ0wiJyBOY5QgU=;
 b=FTSNl92Iw414m+rQxG1bJPshJ5P9dK7caM1X6PchCP8MvOMUlMSOXW54
 nJ5q5R1EI/EsWRNOvBftkJ8CPn7qHWrkHUY9OeWYZ1pnCmU41ulFo/yPk
 AyCXhgrRS7dQExLUE/Uk92YEmXKl69a3kIea6PQdWXv2IS6X4ziI2kGDX
 uRGLqd7fZMQQrcVYMyVP56p3qveXJ3Y5LqbvsFVjvOuhoEKT2GP+j1ik/
 sK/mUA1djPkM5N+YDsyw46Y+GdYEsHkU5E2y8GRshAxu2TkcTxTsN/LWi
 CfLMCDZwr8EN6fQ3I2C47GTcXMpWho5/ektgQs2V/MMErRvDdHyzJeQUF g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="324087603"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="324087603"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 08:18:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="690547439"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="690547439"
Received: from rjmaskel-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.128])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 08:18:48 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 3/3] ASoC: SOF: sof-audio: skip prepare/unprepare if swidget
 is NULL
Date: Fri, 13 Jan 2023 18:18:42 +0200
Message-Id: <20230113161842.22059-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113161842.22059-1-peter.ujfalusi@linux.intel.com>
References: <20230113161842.22059-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Skip preparing/unpreparing widgets if the swidget pointer is NULL. This
will be true in the case of virtual widgets in topology that were added
for reusing the legacy HDA machine driver with SOF.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 721de96fdb83..5c878788dedb 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -274,7 +274,7 @@ sof_unprepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widg
 	struct snd_soc_dapm_path *p;
 
 	/* skip if the widget is in use or if it is already unprepared */
-	if (!swidget->prepared || swidget->use_count > 0)
+	if (!swidget || !swidget->prepared || swidget->use_count > 0)
 		goto sink_unprepare;
 
 	widget_ops = tplg_ops ? tplg_ops->widget : NULL;
@@ -311,7 +311,7 @@ sof_prepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget
 	if (!widget_ops)
 		return 0;
 
-	if (!widget_ops[widget->id].ipc_prepare || swidget->prepared)
+	if (!swidget || !widget_ops[widget->id].ipc_prepare || swidget->prepared)
 		goto sink_prepare;
 
 	/* prepare the source widget */
-- 
2.39.0

