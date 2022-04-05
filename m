Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E68D34F3CDA
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 19:32:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9701B1866;
	Tue,  5 Apr 2022 19:31:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9701B1866
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649179927;
	bh=3L/4+UqTFnL/4xNLVbxuDikKwQaKO8BHIpda6aB9C0U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=st97Ag5CZSc9cVRWkLsWtTyLvA0+XWiAhj6k0NPZDTpEqhJnsbtSDhXFRpAIretxQ
	 jHvsA31enX7z4uxrjqxf8pxNnGshUjzIlSyXHXm5nytOh3mP4cSGWg+7G0C47vDkW1
	 k0kvelIKHxZtxr4vWRiEXdLMP9LaEISZ4V6YqaSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EA5BF80567;
	Tue,  5 Apr 2022 19:27:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86F1FF8054A; Tue,  5 Apr 2022 19:27:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47F10F80526
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 19:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47F10F80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jxwgpcvV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649179662; x=1680715662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3L/4+UqTFnL/4xNLVbxuDikKwQaKO8BHIpda6aB9C0U=;
 b=jxwgpcvVsSCYftPvjWzhf4GnOoWy+ei2IBO9XK5F6NDd5wq3FCrXomZp
 BBFI3X5xi2vZW/0Pq8SIoYZZYuNX/9WfkbpjEJ+WUswrhbP0cTWp2MggH
 VqVSeDMQ+avOIF6Ii5VMxntYCX8zZGwI+AKar0/6Q2QMaZ4ZTOuyW7bVa
 7c+9R568RJ6g7429VbWyLvKWCOPlr9pVqQ0Q83+gT9FFXCCi0vo7MGgwi
 4Q0X+AgMf/AI4dsvtYyKnJecAPlS9OA7pztTyyZvHbZ/Z2TKK0oS6/JX8
 r5suMuKascS3O/k+q2yqnCsU5D86R80RZ+AdfqHG2oAuUm1vsw2xOs7tp w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="323986781"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="323986781"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:26 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="722141006"
Received: from reginari-mobl7.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.131])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:26 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 13/15] ASoC: SOF: Add widget_kcontrol_setup control ops for
 IPC3
Date: Tue,  5 Apr 2022 10:27:06 -0700
Message-Id: <20220405172708.122168-14-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405172708.122168-1-ranjani.sridharan@linux.intel.com>
References: <20220405172708.122168-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Define and set the widget_kcontrol_setup control IPC ops for IPC3.

The widget_kcontrol_setup callback can be used to set up all
kcontrols associated with the swidget.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc3-control.c | 38 ++++++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-audio.h    |  2 ++
 2 files changed, 40 insertions(+)

diff --git a/sound/soc/sof/ipc3-control.c b/sound/soc/sof/ipc3-control.c
index cdd5ad860a94..4e647142dc2b 100644
--- a/sound/soc/sof/ipc3-control.c
+++ b/sound/soc/sof/ipc3-control.c
@@ -578,6 +578,43 @@ static void sof_ipc3_control_update(struct snd_sof_dev *sdev, void *ipc_control_
 	snd_ctl_notify_one(swidget->scomp->card->snd_card, SNDRV_CTL_EVENT_MASK_VALUE, kc, 0);
 }
 
+static int sof_ipc3_widget_kcontrol_setup(struct snd_sof_dev *sdev,
+					  struct snd_sof_widget *swidget)
+{
+	struct snd_sof_control *scontrol;
+	int ret;
+
+	/* set up all controls for the widget */
+	list_for_each_entry(scontrol, &sdev->kcontrol_list, list)
+		if (scontrol->comp_id == swidget->comp_id) {
+			/* set kcontrol data in DSP */
+			ret = snd_sof_ipc_set_get_comp_data(scontrol, true);
+			if (ret < 0) {
+				dev_err(sdev->dev,
+					"kcontrol %d set up failed for widget %s\n",
+					scontrol->comp_id, swidget->widget->name);
+				return ret;
+			}
+
+			/*
+			 * Read back the data from the DSP for static widgets.
+			 * This is particularly useful for binary kcontrols
+			 * associated with static pipeline widgets to initialize
+			 * the data size to match that in the DSP.
+			 */
+			if (swidget->dynamic_pipeline_widget)
+				continue;
+
+			ret = snd_sof_ipc_set_get_comp_data(scontrol, false);
+			if (ret < 0)
+				dev_warn(sdev->dev,
+					 "kcontrol %d read failed for widget %s\n",
+					 scontrol->comp_id, swidget->widget->name);
+		}
+
+	return 0;
+}
+
 const struct sof_ipc_tplg_control_ops tplg_ipc3_control_ops = {
 	.volume_put = sof_ipc3_volume_put,
 	.volume_get = sof_ipc3_volume_get,
@@ -591,4 +628,5 @@ const struct sof_ipc_tplg_control_ops tplg_ipc3_control_ops = {
 	.bytes_ext_get = sof_ipc3_bytes_ext_get,
 	.bytes_ext_volatile_get = sof_ipc3_bytes_ext_volatile_get,
 	.update = sof_ipc3_control_update,
+	.widget_kcontrol_setup = sof_ipc3_widget_kcontrol_setup,
 };
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 4a8cd7f2a0eb..c85461dbe945 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -86,6 +86,8 @@ struct sof_ipc_tplg_control_ops {
 			     const unsigned int __user *binary_data, unsigned int size);
 	/* update control data based on notification from the DSP */
 	void (*update)(struct snd_sof_dev *sdev, void *ipc_control_message);
+	/* Optional callback to setup kcontrols associated with an swidget */
+	int (*widget_kcontrol_setup)(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget);
 };
 
 /**
-- 
2.25.1

