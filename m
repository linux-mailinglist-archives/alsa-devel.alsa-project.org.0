Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B46B66BE5F
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 13:57:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D924655CF;
	Mon, 16 Jan 2023 13:56:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D924655CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673873822;
	bh=WFquwwFVMN2ae04YFDIUmWwVy7blUoA+Z8vZhG09mtk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FVUz5qYLv8Ee18l7yThJgsSOnjRJ76RhlefCow4FSHXjogR0lw1xa+BRmxZXeLqzL
	 jnhUM/dj9fGV2Vf1J4ZPGu6pbQ9nbaLhal5MNaC2NNkIWN4PAK7+3PPaUI+eZ3+Wb6
	 arKUF46COZa68UVzCgrK95cGCZkXZEbETqlD3uF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD563F80240;
	Mon, 16 Jan 2023 13:56:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 491A6F804A9; Mon, 16 Jan 2023 13:55:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E92AF80495
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 13:55:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E92AF80495
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XRHTcuKd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673873715; x=1705409715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WFquwwFVMN2ae04YFDIUmWwVy7blUoA+Z8vZhG09mtk=;
 b=XRHTcuKdKsSoioRO6vWZWAj5rIv04bxxeIBtMcWrsN+WOV+facAMT+oX
 h32vdE9IVtP1FeBVIhWvEVtc2ZffbRl4s/2kEF5yvNUJlGB0d7DybtrMX
 WJhkDq8sjOmPz04EjN+ymnY4jOSUEnnSUBGrKPfsoH2Bih3id2CEduaXs
 zSuPfbJns0N3YEF7dacQd2isHP5s8T6M7G1C9dOkpsxDJM/yzqaeXSjRt
 h8h/7TCYTbVAIjgZCRqzUx+n2f8smR7kMv0YxeYxPHYUUdEmgTnA7cbH9
 UZGnN+KhlwRAmu6czPqiMv1rnLG/87F+zhR4c9ndJhO4/Jw6fBBiQHSFI A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="325720857"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="325720857"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 04:55:10 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="660972435"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="660972435"
Received: from mmclough-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.13.59])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 04:55:07 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 2/3] ASoC: SOF: sof-audio: skip prepare/unprepare if
 swidget is NULL
Date: Mon, 16 Jan 2023 14:55:05 +0200
Message-Id: <20230116125506.27989-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116125506.27989-1-peter.ujfalusi@linux.intel.com>
References: <20230116125506.27989-1-peter.ujfalusi@linux.intel.com>
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

Fixes: 9862dcf70245 ("ASoC: SOF: don't unprepare widget used other pipelines")
Cc: <stable@vger.kernel.org> # 6.1
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 068501ed7951..739afb8df590 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -274,7 +274,7 @@ sof_unprepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widg
 	struct snd_soc_dapm_path *p;
 
 	/* return if the widget is in use or if it is already unprepared */
-	if (!swidget->prepared || swidget->use_count > 0)
+	if (!swidget || !swidget->prepared || swidget->use_count > 0)
 		return;
 
 	widget_ops = tplg_ops ? tplg_ops->widget : NULL;
@@ -310,7 +310,7 @@ sof_prepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget
 	if (!widget_ops)
 		return 0;
 
-	if (!widget_ops[widget->id].ipc_prepare || swidget->prepared)
+	if (!swidget || !widget_ops[widget->id].ipc_prepare || swidget->prepared)
 		goto sink_prepare;
 
 	/* prepare the source widget */
-- 
2.39.0

