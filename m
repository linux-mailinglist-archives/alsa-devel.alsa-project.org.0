Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9B96ADDE7
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 12:48:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A36E91444;
	Tue,  7 Mar 2023 12:47:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A36E91444
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678189719;
	bh=JlJ5aUR6sZ6sHH4//Ptppet+3L2ZFYTBPHQYQR5HLTc=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rB9vNXzTomFnl8p6LCOIZc1H/yamLIBwDAM2ODjczYiURcGhNOYI6wfP5EJdARL+f
	 23d9UDyiKB/geW2YG/f1XnuzX9jQOpkeaD952kRYQdZXoThXcfPgsE4HwokSHxO55n
	 UYObNcFyM45FvwPTc7K+0ccsDR+afBzEe0EVOHpA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B006F800C9;
	Tue,  7 Mar 2023 12:47:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC123F80431; Tue,  7 Mar 2023 12:47:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1D2F1F8051B
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 12:47:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D2F1F8051B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LdZ1bPDx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678189663; x=1709725663;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JlJ5aUR6sZ6sHH4//Ptppet+3L2ZFYTBPHQYQR5HLTc=;
  b=LdZ1bPDx2UIPXNUiUoADGRJPciCg/7S/e8vXTWwDKesz2U/7X8NvTGVH
   KwGSfeGBc53J8p+9Ny8oa/1b/F7qRxQ+vs+ns/YK9++tIN4ylonPOyf7u
   nRd7O1CUGlgvftlUqG8RAtipiA1xrXyNrnwTdh9jHveTnrxXSP3rtmAJ0
   dOb0k815GOQ5s3e0FETokdPEekvfPtzUm9ENFtfh80y4nxc9p2uBTsOur
   dO5sbdn+BNh7tJWU1KsFVNamKFyGuYywv1jsyiTmXjmk1PjjjOC5oLQ5F
   F5/kfVrtxP16OdOpcRERdVuICuhmab3g8xRSv5n9t/TjrqvVVLInDQPdW
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="363455410"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="363455410"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:47:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="678908628"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="678908628"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:47:23 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: sof-audio: add support for setting up topology
 loopback routes
Date: Tue,  7 Mar 2023 13:47:45 +0200
Message-Id: <20230307114745.4800-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7IUGWPJ2KTNP333CQYMXRBA2L43RJOGK
X-Message-ID-Hash: 7IUGWPJ2KTNP333CQYMXRBA2L43RJOGK
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com,
 chao.song@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7IUGWPJ2KTNP333CQYMXRBA2L43RJOGK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chao Song <chao.song@linux.intel.com>

During route setup, playback stream routes are setup by going through
sink path, capture stream routes are set up by going through source path.
This is not sufficient to handle loopback cases between pipelines
configured with different directions, e.g. a sidetone or an amplifier
feedback connected to a speaker protection module. So, add the logic to
handle such routes between widgets that aren't in the list of DAPM widgets
associated with the same PCM.

Link: https://github.com/thesofproject/linux/issues/4042

Suggested-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 61 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 6de388a8d0b8..4f12e137ff63 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -280,9 +280,11 @@ int sof_route_setup(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *wsourc
 static int sof_setup_pipeline_connections(struct snd_sof_dev *sdev,
 					  struct snd_soc_dapm_widget_list *list, int dir)
 {
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	struct snd_soc_dapm_widget *widget;
+	struct snd_sof_route *sroute;
 	struct snd_soc_dapm_path *p;
-	int ret;
+	int ret = 0;
 	int i;
 
 	/*
@@ -325,6 +327,63 @@ static int sof_setup_pipeline_connections(struct snd_sof_dev *sdev,
 		}
 	}
 
+	/*
+	 * The above loop handles connections between widgets that belong to the DAPM widget list.
+	 * This is not sufficient to handle loopback cases between pipelines configured with
+	 * different directions, e.g. a sidetone or an amplifier feedback connected to a speaker
+	 * protection module.
+	 */
+	list_for_each_entry(sroute, &sdev->route_list, list) {
+		bool src_widget_in_dapm_list, sink_widget_in_dapm_list;
+		struct snd_sof_widget *swidget;
+
+		if (sroute->setup)
+			continue;
+
+		src_widget_in_dapm_list = widget_in_list(list, sroute->src_widget->widget);
+		sink_widget_in_dapm_list = widget_in_list(list, sroute->sink_widget->widget);
+
+		/*
+		 * if both source and sink are in the DAPM list, the route must already have been
+		 * set up above. And if neither are in the DAPM list, the route shouldn't be
+		 * handled now.
+		 */
+		if (src_widget_in_dapm_list == sink_widget_in_dapm_list)
+			continue;
+
+		/*
+		 * At this point either the source widget or the sink widget is in the DAPM list
+		 * with a route that might need to be set up. Check the use_count of the widget
+		 * that is not in the DAPM list to confirm if it is in use currently before setting
+		 * up the route.
+		 */
+		if (src_widget_in_dapm_list)
+			swidget = sroute->sink_widget;
+		else
+			swidget = sroute->src_widget;
+
+		mutex_lock(&swidget->setup_mutex);
+		if (!swidget->use_count) {
+			mutex_unlock(&swidget->setup_mutex);
+			continue;
+		}
+
+		if (tplg_ops && tplg_ops->route_setup) {
+			/*
+			 * this route will get freed when either the source widget or the sink
+			 * widget is freed during hw_free
+			 */
+			ret = tplg_ops->route_setup(sdev, sroute);
+			if (!ret)
+				sroute->setup = true;
+		}
+
+		mutex_unlock(&swidget->setup_mutex);
+
+		if (ret < 0)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.39.2

