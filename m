Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D712966BE6B
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 13:57:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1A7555D8;
	Mon, 16 Jan 2023 13:56:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1A7555D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673873844;
	bh=twLQontJ+Plz38KfwUnCkRp+XvV02RX/QuCgG6s9mXg=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CXn2A/YtnQvujzMI4t6exVje7GuSihJhwvqa33UogRMuYyv6x8B4FdK/rqGtcCKUD
	 Ae9xa68bZRBMY0GfFbzBzkF0KgAntV27ZFFgJWKVWGcGUsbq8INOsPBv1g4PTK2GH/
	 SD19OiMwMPsvRn86540yhO+J7wVHags5nJnL1CGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4931BF8053A;
	Mon, 16 Jan 2023 13:56:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B10C8F8053C; Mon, 16 Jan 2023 13:56:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C3FDF804BC
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 13:55:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C3FDF804BC
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=emwZdcJ5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673873716; x=1705409716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=twLQontJ+Plz38KfwUnCkRp+XvV02RX/QuCgG6s9mXg=;
 b=emwZdcJ51SA83hDhykPF1S3WGAn9zVG9uBJoZB7Huv7UOA8gVyUT3d47
 lVZ1Uj60AB2ThLXoaU0irgJnb/Mh9G5h8C2E/VA+W+RQUZ9WTu1XcVU0p
 cVEKhXNjlsHwuDoTdHsUq0UC/yDLAaG6+hAUZy0opnzERLz+VpimpFut6
 1ENpFZEHA9WAcj8390rQOC7iU5pmUrxdIhVmIudnrVrGigN5kGP15wG55
 CC58SS/XS3fIOqGesgbT3zWVLGgo2Q4MgRDxjja+d2tq2qdnrWg3Gyurj
 lARhwR6aI11cB8QpaUA3uQfAEI7lFi+m+Qc/4sEEB6OgC0OoFYlWtEVfD w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="325720871"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="325720871"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 04:55:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10591"; a="660972445"
X-IronPort-AV: E=Sophos;i="5.97,221,1669104000"; d="scan'208";a="660972445"
Received: from mmclough-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.13.59])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2023 04:55:10 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 3/3] ASoC: SOF: sof-audio: keep prepare/unprepare widgets
 in sink path
Date: Mon, 16 Jan 2023 14:55:06 +0200
Message-Id: <20230116125506.27989-4-peter.ujfalusi@linux.intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The existing code return when a widget doesn't need to
prepare/unprepare. This will prevent widgets in the sink path from being
prepared/unprepared.

Cc: <stable@vger.kernel.org> # 6.1
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
index 739afb8df590..5c878788dedb 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -273,9 +273,9 @@ sof_unprepare_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widg
 	const struct sof_ipc_tplg_widget_ops *widget_ops;
 	struct snd_soc_dapm_path *p;
 
-	/* return if the widget is in use or if it is already unprepared */
+	/* skip if the widget is in use or if it is already unprepared */
 	if (!swidget || !swidget->prepared || swidget->use_count > 0)
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

