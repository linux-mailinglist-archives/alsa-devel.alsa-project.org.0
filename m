Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E8B67E49B
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 13:05:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C6A9EE9;
	Fri, 27 Jan 2023 13:05:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C6A9EE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674821159;
	bh=JlP7tSdET7YNPyTP/iqqIcvig2UOEilz8efwoMaz1CQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MUK0vTIIzChjW9dQPXVhylJl1eEUxwXPkxRyaLUH7+VJl5c51tw5WbBmyFyh2quAZ
	 VvTJ2PUi630HW0qUi+WdUlzP3hzSiPWwwpIwXowfdzmTXK8DxLpzDvpShBTNxL6fWN
	 XDZ5x93ZuimlpUuxVTFow9HP3VcRnGH38GDKSn84=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12038F805C4;
	Fri, 27 Jan 2023 13:01:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 896D0F805B5; Fri, 27 Jan 2023 13:01:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91F93F8057A
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 13:01:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91F93F8057A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dnXwZnL0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674820870; x=1706356870;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JlP7tSdET7YNPyTP/iqqIcvig2UOEilz8efwoMaz1CQ=;
 b=dnXwZnL0uqsX170kcR0n58AfuLsLD3DKx8o986933bWr5u04KknwtoFO
 eXR5CysYzDy0b7B7iiZK7jW5sIS3J0YKQnCMdn0U6laWIigECjRKASTkf
 uA2UlIEQO6JnYokLZJK1U7NFPJBJayNVrqSeQJvYvna2RK0EyQYpvjbnU
 Vz6J1SW6Q9na3oxYbSrKbB+RAEFj+nPqBovR0zXLA5YxcsDrPbFaZUZaX
 aOe75jsxcSRPVQCTx8g6J1udoV3yd0RzYIhTOLK3DTgskFl2uDPvfz8lq
 IvAAA+D5aedgVREohdKse2xYS3iYIoFtVJn91RYh/4Ykb8H38QsfMcSpl g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="327091982"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="327091982"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:01:09 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805782364"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="805782364"
Received: from aaralsto-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.30.130])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:01:06 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 17/18] ASoC: SOF: Protect swidget->use_count with mutex for
 kcontrol access race
Date: Fri, 27 Jan 2023 14:00:30 +0200
Message-Id: <20230127120031.10709-18-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
References: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
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
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The use_count of the swidget is protect by ALSA core PCM locking with the
exception when an associated kcontrol is changed.

It has been observed that a rightly timed kcontrol access during stream
stop can result of an attempt to send a control update to a widget which
has been freed up between the check of the use_count and the message
sending.

We need to protect the entire sof_widget_setup() and sof_widget_free()
execution to make it safe to rely on the use_count.
Move the code under an _unlocked() function and use a mutex to protect
the execution of the functions for concurrency.
On the control path we need to use the lock only for the kcontrol access,
the widget_kcontrol_setup() op is called with the lock already held.

Reported-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc3-control.c  | 46 +++++++++++++++++++++++------------
 sound/soc/sof/ipc3-topology.c |  2 ++
 sound/soc/sof/ipc4-control.c  | 33 +++++++++++++++++--------
 sound/soc/sof/sof-audio.c     | 36 ++++++++++++++++++++++-----
 sound/soc/sof/sof-audio.h     | 11 ++++++++-
 sound/soc/sof/topology.c      |  2 ++
 6 files changed, 97 insertions(+), 33 deletions(-)

diff --git a/sound/soc/sof/ipc3-control.c b/sound/soc/sof/ipc3-control.c
index 3fdc0d854e65..217ac5501a98 100644
--- a/sound/soc/sof/ipc3-control.c
+++ b/sound/soc/sof/ipc3-control.c
@@ -12,7 +12,8 @@
 #include "ipc3-priv.h"
 
 /* IPC set()/get() for kcontrols. */
-static int sof_ipc3_set_get_kcontrol_data(struct snd_sof_control *scontrol, bool set)
+static int sof_ipc3_set_get_kcontrol_data(struct snd_sof_control *scontrol,
+					  bool set, bool lock)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scontrol->scomp);
 	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
@@ -21,6 +22,7 @@ static int sof_ipc3_set_get_kcontrol_data(struct snd_sof_control *scontrol, bool
 	struct snd_sof_widget *swidget;
 	bool widget_found = false;
 	u32 ipc_cmd, msg_bytes;
+	int ret = 0;
 
 	list_for_each_entry(swidget, &sdev->widget_list, list) {
 		if (swidget->comp_id == scontrol->comp_id) {
@@ -35,13 +37,18 @@ static int sof_ipc3_set_get_kcontrol_data(struct snd_sof_control *scontrol, bool
 		return -EINVAL;
 	}
 
+	if (lock)
+		mutex_lock(&swidget->setup_mutex);
+	else
+		lockdep_assert_held(&swidget->setup_mutex);
+
 	/*
-	 * Volatile controls should always be part of static pipelines and the widget use_count
-	 * would always be > 0 in this case. For the others, just return the cached value if the
-	 * widget is not set up.
+	 * Volatile controls should always be part of static pipelines and the
+	 * widget use_count would always be > 0 in this case. For the others,
+	 * just return the cached value if the widget is not set up.
 	 */
 	if (!swidget->use_count)
-		return 0;
+		goto unlock;
 
 	/*
 	 * Select the IPC cmd and the ctrl_type based on the ctrl_cmd and the
@@ -81,13 +88,20 @@ static int sof_ipc3_set_get_kcontrol_data(struct snd_sof_control *scontrol, bool
 			     sizeof(struct sof_abi_hdr);
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
+		goto unlock;
 	}
 
 	cdata->rhdr.hdr.size = msg_bytes;
 	cdata->elems_remaining = 0;
 
-	return iops->set_get_data(sdev, cdata, cdata->rhdr.hdr.size, set);
+	ret = iops->set_get_data(sdev, cdata, cdata->rhdr.hdr.size, set);
+
+unlock:
+	if (lock)
+		mutex_unlock(&swidget->setup_mutex);
+
+	return ret;
 }
 
 static void snd_sof_refresh_control(struct snd_sof_control *scontrol)
@@ -108,7 +122,7 @@ static void snd_sof_refresh_control(struct snd_sof_control *scontrol)
 
 	/* refresh the component data from DSP */
 	scontrol->comp_data_dirty = false;
-	ret = sof_ipc3_set_get_kcontrol_data(scontrol, false);
+	ret = sof_ipc3_set_get_kcontrol_data(scontrol, false, true);
 	if (ret < 0) {
 		dev_err(scomp->dev, "Failed to get control data: %d\n", ret);
 
@@ -156,7 +170,7 @@ static bool sof_ipc3_volume_put(struct snd_sof_control *scontrol,
 
 	/* notify DSP of mixer updates */
 	if (pm_runtime_active(scomp->dev)) {
-		int ret = sof_ipc3_set_get_kcontrol_data(scontrol, true);
+		int ret = sof_ipc3_set_get_kcontrol_data(scontrol, true, true);
 
 		if (ret < 0) {
 			dev_err(scomp->dev, "Failed to set mixer updates for %s\n",
@@ -204,7 +218,7 @@ static bool sof_ipc3_switch_put(struct snd_sof_control *scontrol,
 
 	/* notify DSP of mixer updates */
 	if (pm_runtime_active(scomp->dev)) {
-		int ret = sof_ipc3_set_get_kcontrol_data(scontrol, true);
+		int ret = sof_ipc3_set_get_kcontrol_data(scontrol, true, true);
 
 		if (ret < 0) {
 			dev_err(scomp->dev, "Failed to set mixer updates for %s\n",
@@ -252,7 +266,7 @@ static bool sof_ipc3_enum_put(struct snd_sof_control *scontrol,
 
 	/* notify DSP of enum updates */
 	if (pm_runtime_active(scomp->dev)) {
-		int ret = sof_ipc3_set_get_kcontrol_data(scontrol, true);
+		int ret = sof_ipc3_set_get_kcontrol_data(scontrol, true, true);
 
 		if (ret < 0) {
 			dev_err(scomp->dev, "Failed to set enum updates for %s\n",
@@ -324,7 +338,7 @@ static int sof_ipc3_bytes_put(struct snd_sof_control *scontrol,
 
 	/* notify DSP of byte control updates */
 	if (pm_runtime_active(scomp->dev))
-		return sof_ipc3_set_get_kcontrol_data(scontrol, true);
+		return sof_ipc3_set_get_kcontrol_data(scontrol, true, true);
 
 	return 0;
 }
@@ -438,7 +452,7 @@ static int sof_ipc3_bytes_ext_put(struct snd_sof_control *scontrol,
 
 	/* notify DSP of byte control updates */
 	if (pm_runtime_active(scomp->dev))
-		return sof_ipc3_set_get_kcontrol_data(scontrol, true);
+		return sof_ipc3_set_get_kcontrol_data(scontrol, true, true);
 
 	return 0;
 }
@@ -468,7 +482,7 @@ static int sof_ipc3_bytes_ext_volatile_get(struct snd_sof_control *scontrol,
 	cdata->data->abi = SOF_ABI_VERSION;
 
 	/* get all the component data from DSP */
-	ret = sof_ipc3_set_get_kcontrol_data(scontrol, false);
+	ret = sof_ipc3_set_get_kcontrol_data(scontrol, false, true);
 	if (ret < 0)
 		return ret;
 
@@ -647,7 +661,7 @@ static int sof_ipc3_widget_kcontrol_setup(struct snd_sof_dev *sdev,
 	list_for_each_entry(scontrol, &sdev->kcontrol_list, list)
 		if (scontrol->comp_id == swidget->comp_id) {
 			/* set kcontrol data in DSP */
-			ret = sof_ipc3_set_get_kcontrol_data(scontrol, true);
+			ret = sof_ipc3_set_get_kcontrol_data(scontrol, true, false);
 			if (ret < 0) {
 				dev_err(sdev->dev,
 					"kcontrol %d set up failed for widget %s\n",
@@ -664,7 +678,7 @@ static int sof_ipc3_widget_kcontrol_setup(struct snd_sof_dev *sdev,
 			if (swidget->dynamic_pipeline_widget)
 				continue;
 
-			ret = sof_ipc3_set_get_kcontrol_data(scontrol, false);
+			ret = sof_ipc3_set_get_kcontrol_data(scontrol, false, false);
 			if (ret < 0)
 				dev_warn(sdev->dev,
 					 "kcontrol %d read failed for widget %s\n",
diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 88b9b9507231..dceb78bfe17c 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -2316,7 +2316,9 @@ static int sof_ipc3_tear_down_all_pipelines(struct snd_sof_dev *sdev, bool verif
 		/* Do not free widgets for static pipelines with FW older than SOF2.2 */
 		if (!verify && !swidget->dynamic_pipeline_widget &&
 		    SOF_FW_VER(v->major, v->minor, v->micro) < SOF_FW_VER(2, 2, 0)) {
+			mutex_lock(&swidget->setup_mutex);
 			swidget->use_count = 0;
+			mutex_unlock(&swidget->setup_mutex);
 			if (swidget->spipe)
 				swidget->spipe->complete = 0;
 			continue;
diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index 0d5a578c3496..67bd2233fd9a 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -12,7 +12,8 @@
 #include "ipc4-priv.h"
 #include "ipc4-topology.h"
 
-static int sof_ipc4_set_get_kcontrol_data(struct snd_sof_control *scontrol, bool set)
+static int sof_ipc4_set_get_kcontrol_data(struct snd_sof_control *scontrol,
+					  bool set, bool lock)
 {
 	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
 	struct snd_soc_component *scomp = scontrol->scomp;
@@ -21,6 +22,7 @@ static int sof_ipc4_set_get_kcontrol_data(struct snd_sof_control *scontrol, bool
 	struct sof_ipc4_msg *msg = &cdata->msg;
 	struct snd_sof_widget *swidget;
 	bool widget_found = false;
+	int ret = 0;
 
 	/* find widget associated with the control */
 	list_for_each_entry(swidget, &sdev->widget_list, list) {
@@ -35,23 +37,34 @@ static int sof_ipc4_set_get_kcontrol_data(struct snd_sof_control *scontrol, bool
 		return -ENOENT;
 	}
 
+	if (lock)
+		mutex_lock(&swidget->setup_mutex);
+	else
+		lockdep_assert_held(&swidget->setup_mutex);
+
 	/*
-	 * Volatile controls should always be part of static pipelines and the widget use_count
-	 * would always be > 0 in this case. For the others, just return the cached value if the
-	 * widget is not set up.
+	 * Volatile controls should always be part of static pipelines and the
+	 * widget use_count would always be > 0 in this case. For the others,
+	 * just return the cached value if the widget is not set up.
 	 */
 	if (!swidget->use_count)
-		return 0;
+		goto unlock;
 
 	msg->primary &= ~SOF_IPC4_MOD_INSTANCE_MASK;
 	msg->primary |= SOF_IPC4_MOD_INSTANCE(swidget->instance_id);
 
-	return iops->set_get_data(sdev, msg, msg->data_size, set);
+	ret = iops->set_get_data(sdev, msg, msg->data_size, set);
+
+unlock:
+	if (lock)
+		mutex_unlock(&swidget->setup_mutex);
+
+	return ret;
 }
 
 static int
 sof_ipc4_set_volume_data(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget,
-			 struct snd_sof_control *scontrol)
+			 struct snd_sof_control *scontrol, bool lock)
 {
 	struct sof_ipc4_control_data *cdata = scontrol->ipc_control_data;
 	struct sof_ipc4_gain *gain = swidget->private;
@@ -90,7 +103,7 @@ sof_ipc4_set_volume_data(struct snd_sof_dev *sdev, struct snd_sof_widget *swidge
 		msg->data_ptr = &data;
 		msg->data_size = sizeof(data);
 
-		ret = sof_ipc4_set_get_kcontrol_data(scontrol, true);
+		ret = sof_ipc4_set_get_kcontrol_data(scontrol, true, lock);
 		msg->data_ptr = NULL;
 		msg->data_size = 0;
 		if (ret < 0) {
@@ -145,7 +158,7 @@ static bool sof_ipc4_volume_put(struct snd_sof_control *scontrol,
 		return false;
 	}
 
-	ret = sof_ipc4_set_volume_data(sdev, swidget, scontrol);
+	ret = sof_ipc4_set_volume_data(sdev, swidget, scontrol, true);
 	if (ret < 0)
 		return false;
 
@@ -175,7 +188,7 @@ static int sof_ipc4_widget_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_s
 
 	list_for_each_entry(scontrol, &sdev->kcontrol_list, list)
 		if (scontrol->comp_id == swidget->comp_id) {
-			ret = sof_ipc4_set_volume_data(sdev, swidget, scontrol);
+			ret = sof_ipc4_set_volume_data(sdev, swidget, scontrol, false);
 			if (ret < 0) {
 				dev_err(sdev->dev, "%s: kcontrol %d set up failed for widget %s\n",
 					__func__, scontrol->comp_id, swidget->widget->name);
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 14b4b949d081..760621bfc802 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -28,7 +28,8 @@ static void sof_reset_route_setup_status(struct snd_sof_dev *sdev, struct snd_so
 		}
 }
 
-int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
+static int sof_widget_free_unlocked(struct snd_sof_dev *sdev,
+				    struct snd_sof_widget *swidget)
 {
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	struct snd_sof_widget *pipe_widget;
@@ -70,7 +71,7 @@ int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	 * skip for static pipelines
 	 */
 	if (swidget->dynamic_pipeline_widget && swidget->id != snd_soc_dapm_scheduler) {
-		ret = sof_widget_free(sdev, pipe_widget);
+		ret = sof_widget_free_unlocked(sdev, pipe_widget);
 		if (ret < 0 && !err)
 			err = ret;
 	}
@@ -84,9 +85,21 @@ int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 
 	return err;
 }
+
+int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
+{
+	int ret;
+
+	mutex_lock(&swidget->setup_mutex);
+	ret = sof_widget_free_unlocked(sdev, swidget);
+	mutex_unlock(&swidget->setup_mutex);
+
+	return ret;
+}
 EXPORT_SYMBOL(sof_widget_free);
 
-int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
+static int sof_widget_setup_unlocked(struct snd_sof_dev *sdev,
+				     struct snd_sof_widget *swidget)
 {
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	bool use_count_decremented = false;
@@ -116,7 +129,7 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 			goto use_count_dec;
 		}
 
-		ret = sof_widget_setup(sdev, swidget->spipe->pipe_widget);
+		ret = sof_widget_setup_unlocked(sdev, swidget->spipe->pipe_widget);
 		if (ret < 0)
 			goto use_count_dec;
 	}
@@ -160,19 +173,30 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 
 widget_free:
 	/* widget use_count and core ref_count will both be decremented by sof_widget_free() */
-	sof_widget_free(sdev, swidget);
+	sof_widget_free_unlocked(sdev, swidget);
 	use_count_decremented = true;
 core_put:
 	snd_sof_dsp_core_put(sdev, swidget->core);
 pipe_widget_free:
 	if (swidget->id != snd_soc_dapm_scheduler)
-		sof_widget_free(sdev, swidget->spipe->pipe_widget);
+		sof_widget_free_unlocked(sdev, swidget->spipe->pipe_widget);
 use_count_dec:
 	if (!use_count_decremented)
 		swidget->use_count--;
 
 	return ret;
 }
+
+int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
+{
+	int ret;
+
+	mutex_lock(&swidget->setup_mutex);
+	ret = sof_widget_setup_unlocked(sdev, swidget);
+	mutex_unlock(&swidget->setup_mutex);
+
+	return ret;
+}
 EXPORT_SYMBOL(sof_widget_setup);
 
 int sof_route_setup(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *wsource,
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index f1bbd1adc8b6..b0593b46d477 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -387,7 +387,16 @@ struct snd_sof_widget {
 	 * up in the DSP.
 	 */
 	bool prepared;
-	int use_count; /* use_count will be protected by the PCM mutex held by the core */
+
+	struct mutex setup_mutex; /* to protect the swidget setup and free operations */
+
+	/*
+	 * use_count is protected by the PCM mutex held by the core and the
+	 * setup_mutex against non stream domain races (kcontrol access for
+	 * example)
+	 */
+	int use_count;
+
 	int core;
 	int id; /* id is the DAPM widget type */
 	/*
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 33ca3067262b..e2f8cd9e278e 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1405,6 +1405,8 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	swidget->id = w->id;
 	swidget->pipeline_id = index;
 	swidget->private = NULL;
+	mutex_init(&swidget->setup_mutex);
+
 	ida_init(&swidget->src_queue_ida);
 	ida_init(&swidget->sink_queue_ida);
 
-- 
2.39.1

