Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C249669D84
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 17:19:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1D3C6769;
	Fri, 13 Jan 2023 17:19:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1D3C6769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673626797;
	bh=RO2DxJpWKcs/biap7pUL0Svq85+wGUUs0mLIBKz6Tig=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Xw0Gw0kQ7bI8PgAZINhhgOWcvmKKUHzEB0XqKV0YQUlHmrohJnnT8Hc9qMkcYdlji
	 mkbs8FKhzG5fX8fvVzSFv+fgwzzZY57Y1UXoQOgyFiMq+js521CSob5TAR2w1f1puC
	 xxctaErN3e871QiF2QcigCkmoFcBkrsUmiFkdMO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02F1FF8019B;
	Fri, 13 Jan 2023 17:18:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5FA4F80539; Fri, 13 Jan 2023 17:18:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9860F803DC
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 17:18:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9860F803DC
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hjF720O8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673626733; x=1705162733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RO2DxJpWKcs/biap7pUL0Svq85+wGUUs0mLIBKz6Tig=;
 b=hjF720O8bh4Sl/65g/j5xnwu4nfrjEDQBdXJ/UG7LqvECYzBSAeI85jx
 /xdASOIGDMV4x+tnILcnJlMG6IFPNWOdyVAFAC7TTkaPT8uaScJvMpIdZ
 iyaNhiir6jnWbesIVA8sRdQN3OW+H9GDce4RmPN6lJZWH7WdDJILg9tK8
 cY1Krp4Vc6XV/rD+Lx4JiPhPw9CmgQjRPwXqayJakjL0fWqWWyRBM/4Xt
 qcg8U2ik6AvmbL/3g72NKz/HCLUxFIltV/TKOO13cZi/4QmjPwUEO8QKU
 HbYUYKd3VnqcLYA9eV9UAh8tcCSn1PwayVYZ4N97/0eb1ZFVwWJf9QcSj g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="324087588"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="324087588"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 08:18:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="690547430"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="690547430"
Received: from rjmaskel-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.128])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 08:18:45 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 2/3] ASoC: SOF: sof-audio: keep prepare/unprepare widgets in
 sink path
Date: Fri, 13 Jan 2023 18:18:41 +0200
Message-Id: <20230113161842.22059-3-peter.ujfalusi@linux.intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The existing code return when a widget doesn't need to
prepare/unprepare. This will prevent widgets in the sink path from being
prepared/unprepared.

Link: https://github.com/thesofproject/linux/issues/4021
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 068501ed7951..721de96fdb83 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -273,9 +273,9 @@ sof_unprepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widg
 	const struct sof_ipc_tplg_widget_ops *widget_ops;
 	struct snd_soc_dapm_path *p;
 
-	/* return if the widget is in use or if it is already unprepared */
+	/* skip if the widget is in use or if it is already unprepared */
 	if (!swidget->prepared || swidget->use_count > 0)
-		return;
+		goto sink_unprepare;
 
 	widget_ops = tplg_ops ? tplg_ops->widget : NULL;
 	if (widget_ops && widget_ops[widget->id].ipc_unprepare)
@@ -284,6 +284,7 @@ sof_unprepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widg
 
 	swidget->prepared = false;
 
+sink_unprepare:
 	/* unprepare all widgets in the sink paths */
 	snd_soc_dapm_widget_for_each_sink_path(widget, p) {
 		if (!p->walking && p->sink->dobj.private) {
-- 
2.39.0

