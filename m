Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 003DF510539
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 19:21:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BAE518CF;
	Tue, 26 Apr 2022 19:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BAE518CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650993660;
	bh=jAEt/GTuRp/ujPuvv18LQoose9kd1V8mLb+LGWnMNMc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HN/NLSOn1s2OMAXygA21ywCYGwGKWQpkw6Oheg7LmON3/B7lnmA/pk75n3VRWiEbN
	 p5j+6j4RcauQ/S6bP4D5IHGO2K9RTEJbM9SIE552rDI7wXcV2oRxAnKj0SZxZLV+Yi
	 7HEzqrRAmZnIGbLDSSxhDrJx3k4MbHKds2/1bPlQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32792F8052E;
	Tue, 26 Apr 2022 19:18:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91D12F80516; Tue, 26 Apr 2022 19:17:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21D0AF80171
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 19:17:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21D0AF80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="A/x7Atpt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650993475; x=1682529475;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jAEt/GTuRp/ujPuvv18LQoose9kd1V8mLb+LGWnMNMc=;
 b=A/x7AtptZ9vGZ0Dn+1dS2ixSUjcpG4QdORCAzV8XHpAMsaNXzTgOZLSH
 ASZGVaWywgXJb8QkLrqFbh5s4zF2fKTPrkH1QzTinVBZlQcAYj/1NzXyM
 zYxP4Ym49YkqLdBjMlGNL8Mxhwg9mhAUI6JCiM52gvIEMYXjTV0R5ZdgZ
 oZVlhqXvSJhrYBmJSlVUGDiN0WEzvz3ZX2JeeUkFSR+seU2UDhO3yuMT6
 J5ADS3HP18an+ctT7Qf69kot+qQPBxW5plv9iWtWD8C5zF/LPbovXDmG/
 Szaj1UemuVsAMJBnmld8hd8f0Z2ZM10uXTWwyT2wCvuhizWLyHD9PInSs w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="326150582"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="326150582"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:17:48 -0700
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="558431187"
Received: from shashinx-mobl.gar.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.0.53])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:17:48 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/11] ASoC: SOF: Add a new op to set up volume table
Date: Tue, 26 Apr 2022 10:17:33 -0700
Message-Id: <20220426171743.171061-2-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426171743.171061-1-ranjani.sridharan@linux.intel.com>
References: <20220426171743.171061-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

Add a new op set_up_volume_table for control IPC ops. Define and set
the op for IPC3.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc3-control.c | 18 ++++++++++++++++++
 sound/soc/sof/sof-audio.h    |  6 ++++++
 sound/soc/sof/topology.c     | 26 +++++++++++---------------
 3 files changed, 35 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sof/ipc3-control.c b/sound/soc/sof/ipc3-control.c
index cde9e481f7f2..bea26e73a741 100644
--- a/sound/soc/sof/ipc3-control.c
+++ b/sound/soc/sof/ipc3-control.c
@@ -694,6 +694,23 @@ static int sof_ipc3_widget_kcontrol_setup(struct snd_sof_dev *sdev,
 	return 0;
 }
 
+static int
+sof_ipc3_set_up_volume_table(struct snd_sof_control *scontrol, int tlv[SOF_TLV_ITEMS], int size)
+{
+	int i;
+
+	/* init the volume table */
+	scontrol->volume_table = kcalloc(size, sizeof(u32), GFP_KERNEL);
+	if (!scontrol->volume_table)
+		return -ENOMEM;
+
+	/* populate the volume table */
+	for (i = 0; i < size ; i++)
+		scontrol->volume_table[i] = vol_compute_gain(i, tlv);
+
+	return 0;
+}
+
 const struct sof_ipc_tplg_control_ops tplg_ipc3_control_ops = {
 	.volume_put = sof_ipc3_volume_put,
 	.volume_get = sof_ipc3_volume_get,
@@ -708,4 +725,5 @@ const struct sof_ipc_tplg_control_ops tplg_ipc3_control_ops = {
 	.bytes_ext_volatile_get = sof_ipc3_bytes_ext_volatile_get,
 	.update = sof_ipc3_control_update,
 	.widget_kcontrol_setup = sof_ipc3_widget_kcontrol_setup,
+	.set_up_volume_table = sof_ipc3_set_up_volume_table,
 };
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index a0af7c421fd9..e254b22ea8a9 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -39,6 +39,8 @@
  */
 #define VOLUME_FWL	16
 
+#define SOF_TLV_ITEMS 3
+
 struct snd_sof_widget;
 struct snd_sof_route;
 struct snd_sof_control;
@@ -88,6 +90,9 @@ struct sof_ipc_tplg_control_ops {
 	void (*update)(struct snd_sof_dev *sdev, void *ipc_control_message);
 	/* Optional callback to setup kcontrols associated with an swidget */
 	int (*widget_kcontrol_setup)(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget);
+	/* mandatory callback to set up volume table for volume kcontrols */
+	int (*set_up_volume_table)(struct snd_sof_control *scontrol, int tlv[SOF_TLV_ITEMS],
+				   int size);
 };
 
 /**
@@ -464,4 +469,5 @@ int sof_update_ipc_object(struct snd_soc_component *scomp, void *object, enum so
 			  size_t object_size, int token_instance_num);
 int sof_pcm_setup_connected_widgets(struct snd_sof_dev *sdev, struct snd_soc_pcm_runtime *rtd,
 				    struct snd_sof_pcm *spcm, int dir);
+u32 vol_compute_gain(u32 value, int *tlv);
 #endif
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 5e959f8c4cb9..739f343010fc 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -32,7 +32,6 @@
 #define VOL_HALF_DB_STEP	50
 
 /* TLV data items */
-#define TLV_ITEMS	3
 #define TLV_MIN		0
 #define TLV_STEP	1
 #define TLV_MUTE	2
@@ -134,7 +133,7 @@ int sof_update_ipc_object(struct snd_soc_component *scomp, void *object, enum so
 	return 0;
 }
 
-static inline int get_tlv_data(const int *p, int tlv[TLV_ITEMS])
+static inline int get_tlv_data(const int *p, int tlv[SOF_TLV_ITEMS])
 {
 	/* we only support dB scale TLV type at the moment */
 	if ((int)p[SNDRV_CTL_TLVO_TYPE] != SNDRV_CTL_TLVT_DB_SCALE)
@@ -224,7 +223,7 @@ static u32 vol_pow32(u32 a, int exp, u32 fwl)
  * Function to calculate volume gain from TLV data.
  * This function can only handle gain steps that are multiples of 0.5 dB
  */
-static u32 vol_compute_gain(u32 value, int *tlv)
+u32 vol_compute_gain(u32 value, int *tlv)
 {
 	int dB_gain;
 	u32 linear_gain;
@@ -263,20 +262,17 @@ static u32 vol_compute_gain(u32 value, int *tlv)
  * "size" specifies the number of entries in the table
  */
 static int set_up_volume_table(struct snd_sof_control *scontrol,
-			       int tlv[TLV_ITEMS], int size)
+			       int tlv[SOF_TLV_ITEMS], int size)
 {
-	int j;
-
-	/* init the volume table */
-	scontrol->volume_table = kcalloc(size, sizeof(u32), GFP_KERNEL);
-	if (!scontrol->volume_table)
-		return -ENOMEM;
+	struct snd_soc_component *scomp = scontrol->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
 
-	/* populate the volume table */
-	for (j = 0; j < size ; j++)
-		scontrol->volume_table[j] = vol_compute_gain(j, tlv);
+	if (tplg_ops->control->set_up_volume_table)
+		return tplg_ops->control->set_up_volume_table(scontrol, tlv, size);
 
-	return 0;
+	dev_err(scomp->dev, "Mandatory op %s not set\n", __func__);
+	return -EINVAL;
 }
 
 struct sof_dai_types {
@@ -772,7 +768,7 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_mixer_control *mc =
 		container_of(hdr, struct snd_soc_tplg_mixer_control, hdr);
-	int tlv[TLV_ITEMS];
+	int tlv[SOF_TLV_ITEMS];
 	unsigned int mask;
 	int ret;
 
-- 
2.25.1

