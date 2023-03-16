Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D09D6BD30B
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 16:13:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1805510FA;
	Thu, 16 Mar 2023 16:12:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1805510FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678979606;
	bh=ub34HTQI/h7rlotj9KpDW2eqmUlgtKJOLRvI8bFKqBE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k/EWsZWD5l4OoIUAH12Ni1WAh67P2XdLZY8Zu3+FZKs4Zjk57qSKohUN68HUYgyQq
	 rUeJ2gOdr1q+QCmBNMsG0ZuW0atDDBf0JFFYa7qyAkmvtlFObhlUYt3cxz3S15ee7O
	 0ljbjcizxFxg+7IrNo+p2zx0yH3/83zmIa+GgeMU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F410F80533;
	Thu, 16 Mar 2023 16:11:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BE46F80529; Thu, 16 Mar 2023 16:11:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 574DAF80423
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 16:11:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 574DAF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cq4hDWlU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678979497; x=1710515497;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ub34HTQI/h7rlotj9KpDW2eqmUlgtKJOLRvI8bFKqBE=;
  b=cq4hDWlUvA/C8skFZoOfSPMU1CemZE9CIFHIR6dTn91PWoOEiN6iuQDd
   1oYCkV/2jUOBZnDwrJzo5NBFWoL+gCarZ3IJDElFR68gEis7xYweaZcaJ
   7UvUaCc+VgwexH0lPg+cE7DrCPACs8OD063+gsQGTqSk5ma6Rkit5q5aH
   CxWU7PVR3ie62u9NuewxPevhqfjaIvD0KLoN05VzDj4kLOzoQ71Jh4y0O
   hlY/cw1wv5q6xOabQWZeV/Uh1iuIFQAqeX7rTSyJ47b9Yux51O7w/qR2F
   SIe9hpLQwY0eNMyMzJ0BHCmVl+tcabtOq7kQFENyu9/SHsI1kNwzzZL3e
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="335501564"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400";
   d="scan'208";a="335501564"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 08:11:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="823286480"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400";
   d="scan'208";a="823286480"
Received: from raberjix-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.62.186])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 08:11:13 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 1/6] ASoC: SOF: ipc4-topology: Move the kcontrol module_id
 update to helper
Date: Thu, 16 Mar 2023 17:11:32 +0200
Message-Id: <20230316151137.7598-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316151137.7598-1-peter.ujfalusi@linux.intel.com>
References: <20230316151137.7598-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F7664NOWKVQT5X5TLLBUPYBCQAGM6YVY
X-Message-ID-Hash: F7664NOWKVQT5X5TLLBUPYBCQAGM6YVY
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 libin.yang@intel.com, yung-chuan.liao@linux.intel.com,
 chao.song@linux.intel.com, jaska.uimonen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F7664NOWKVQT5X5TLLBUPYBCQAGM6YVY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Introduce a helper function to update the message template for a kcontrol
associated with a widget.

In this way the helper can be re-used by other components later.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index e7b3bdc95dd7..c00df3956c02 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -320,6 +320,24 @@ static int sof_ipc4_widget_setup_msg(struct snd_sof_widget *swidget, struct sof_
 	return 0;
 }
 
+static void sof_ipc4_widget_update_kcontrol_module_id(struct snd_sof_widget *swidget)
+{
+	struct snd_soc_component *scomp = swidget->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct sof_ipc4_fw_module *fw_module = swidget->module_info;
+	struct snd_sof_control *scontrol;
+
+	/* update module ID for all kcontrols for this widget */
+	list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
+		if (scontrol->comp_id == swidget->comp_id) {
+			struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
+			struct sof_ipc4_msg *msg = &cdata->msg;
+
+			msg->primary |= fw_module->man4_module_entry.id;
+		}
+	}
+}
+
 static int sof_ipc4_widget_setup_pcm(struct snd_sof_widget *swidget)
 {
 	struct sof_ipc4_available_audio_format *available_fmt;
@@ -627,9 +645,6 @@ static int sof_ipc4_widget_setup_comp_pipeline(struct snd_sof_widget *swidget)
 static int sof_ipc4_widget_setup_comp_pga(struct snd_sof_widget *swidget)
 {
 	struct snd_soc_component *scomp = swidget->scomp;
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	struct sof_ipc4_fw_module *fw_module;
-	struct snd_sof_control *scontrol;
 	struct sof_ipc4_gain *gain;
 	int ret;
 
@@ -662,16 +677,7 @@ static int sof_ipc4_widget_setup_comp_pga(struct snd_sof_widget *swidget)
 	if (ret)
 		goto err;
 
-	fw_module = swidget->module_info;
-
-	/* update module ID for all kcontrols for this widget */
-	list_for_each_entry(scontrol, &sdev->kcontrol_list, list)
-		if (scontrol->comp_id == swidget->comp_id) {
-			struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
-			struct sof_ipc4_msg *msg = &cdata->msg;
-
-			msg->primary |= fw_module->man4_module_entry.id;
-		}
+	sof_ipc4_widget_update_kcontrol_module_id(swidget);
 
 	return 0;
 err:
-- 
2.39.2

