Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE82CFF48
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 18:52:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C47F1674;
	Tue,  8 Oct 2019 18:51:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C47F1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570553558;
	bh=cn0GcRNOKHUgWFF8mYvVjSdASAZZAVZgUUpO81CQd04=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u8OwhBCTcCtsyBl/So/u++D2tyoCH/aEL9aUDwiYHna1L2RItezIFB6UfAe6b0nMz
	 ikPiW1V+/7gHqF6epQhU75gmfeZP84GClqPjSztH42Vead68fMdis7IBQZKToaXcVs
	 3GPOmu3CErgG5z0jlDKNQm7KsdMESZxzuEf1etg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B13D6F8067C;
	Tue,  8 Oct 2019 18:45:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B113F8060D; Tue,  8 Oct 2019 18:45:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89FC5F805FC
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 18:44:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89FC5F805FC
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Oct 2019 09:44:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,270,1566889200"; d="scan'208";a="218338340"
Received: from kwwong-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.251.150.53])
 by fmsmga004.fm.intel.com with ESMTP; 08 Oct 2019 09:44:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue,  8 Oct 2019 11:44:42 -0500
Message-Id: <20191008164443.1358-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008164443.1358-1-pierre-louis.bossart@linux.intel.com>
References: <20191008164443.1358-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 8/9] AsoC: SOF: refactor control load code
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Jaska Uimonen <jaska.uimonen@linux.intel.com>

Move code around to enable token parsing in control load.

Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 314 +++++++++++++++++++--------------------
 1 file changed, 157 insertions(+), 157 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index edfb5f1458b7..3f598c18a5da 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -432,163 +432,6 @@ static enum sof_comp_type find_process_comp_type(enum sof_ipc_process_type type)
 	return SOF_COMP_NONE;
 }
 
-/*
- * Standard Kcontrols.
- */
-
-static int sof_control_load_volume(struct snd_soc_component *scomp,
-				   struct snd_sof_control *scontrol,
-				   struct snd_kcontrol_new *kc,
-				   struct snd_soc_tplg_ctl_hdr *hdr)
-{
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	struct snd_soc_tplg_mixer_control *mc =
-		container_of(hdr, struct snd_soc_tplg_mixer_control, hdr);
-	struct sof_ipc_ctrl_data *cdata;
-	int tlv[TLV_ITEMS];
-	unsigned int i;
-	int ret;
-
-	/* validate topology data */
-	if (le32_to_cpu(mc->num_channels) > SND_SOC_TPLG_MAX_CHAN)
-		return -EINVAL;
-
-	/* init the volume get/put data */
-	scontrol->size = struct_size(scontrol->control_data, chanv,
-				     le32_to_cpu(mc->num_channels));
-	scontrol->control_data = kzalloc(scontrol->size, GFP_KERNEL);
-	if (!scontrol->control_data)
-		return -ENOMEM;
-
-	scontrol->comp_id = sdev->next_comp_id;
-	scontrol->min_volume_step = le32_to_cpu(mc->min);
-	scontrol->max_volume_step = le32_to_cpu(mc->max);
-	scontrol->num_channels = le32_to_cpu(mc->num_channels);
-
-	/* set cmd for mixer control */
-	if (le32_to_cpu(mc->max) == 1) {
-		scontrol->cmd = SOF_CTRL_CMD_SWITCH;
-		goto out;
-	}
-
-	scontrol->cmd = SOF_CTRL_CMD_VOLUME;
-
-	/* extract tlv data */
-	if (get_tlv_data(kc->tlv.p, tlv) < 0) {
-		dev_err(sdev->dev, "error: invalid TLV data\n");
-		return -EINVAL;
-	}
-
-	/* set up volume table */
-	ret = set_up_volume_table(scontrol, tlv, le32_to_cpu(mc->max) + 1);
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: setting up volume table\n");
-		return ret;
-	}
-
-	/* set default volume values to 0dB in control */
-	cdata = scontrol->control_data;
-	for (i = 0; i < scontrol->num_channels; i++) {
-		cdata->chanv[i].channel = i;
-		cdata->chanv[i].value = VOL_ZERO_DB;
-	}
-
-out:
-	dev_dbg(sdev->dev, "tplg: load kcontrol index %d chans %d\n",
-		scontrol->comp_id, scontrol->num_channels);
-
-	return 0;
-}
-
-static int sof_control_load_enum(struct snd_soc_component *scomp,
-				 struct snd_sof_control *scontrol,
-				 struct snd_kcontrol_new *kc,
-				 struct snd_soc_tplg_ctl_hdr *hdr)
-{
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	struct snd_soc_tplg_enum_control *ec =
-		container_of(hdr, struct snd_soc_tplg_enum_control, hdr);
-
-	/* validate topology data */
-	if (le32_to_cpu(ec->num_channels) > SND_SOC_TPLG_MAX_CHAN)
-		return -EINVAL;
-
-	/* init the enum get/put data */
-	scontrol->size = struct_size(scontrol->control_data, chanv,
-				     le32_to_cpu(ec->num_channels));
-	scontrol->control_data = kzalloc(scontrol->size, GFP_KERNEL);
-	if (!scontrol->control_data)
-		return -ENOMEM;
-
-	scontrol->comp_id = sdev->next_comp_id;
-	scontrol->num_channels = le32_to_cpu(ec->num_channels);
-
-	scontrol->cmd = SOF_CTRL_CMD_ENUM;
-
-	dev_dbg(sdev->dev, "tplg: load kcontrol index %d chans %d comp_id %d\n",
-		scontrol->comp_id, scontrol->num_channels, scontrol->comp_id);
-
-	return 0;
-}
-
-static int sof_control_load_bytes(struct snd_soc_component *scomp,
-				  struct snd_sof_control *scontrol,
-				  struct snd_kcontrol_new *kc,
-				  struct snd_soc_tplg_ctl_hdr *hdr)
-{
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	struct sof_ipc_ctrl_data *cdata;
-	struct snd_soc_tplg_bytes_control *control =
-		container_of(hdr, struct snd_soc_tplg_bytes_control, hdr);
-	struct soc_bytes_ext *sbe = (struct soc_bytes_ext *)kc->private_value;
-	int max_size = sbe->max;
-
-	if (le32_to_cpu(control->priv.size) > max_size) {
-		dev_err(sdev->dev, "err: bytes data size %d exceeds max %d.\n",
-			control->priv.size, max_size);
-		return -EINVAL;
-	}
-
-	/* init the get/put bytes data */
-	scontrol->size = sizeof(struct sof_ipc_ctrl_data) +
-		le32_to_cpu(control->priv.size);
-	scontrol->control_data = kzalloc(max_size, GFP_KERNEL);
-	cdata = scontrol->control_data;
-	if (!scontrol->control_data)
-		return -ENOMEM;
-
-	scontrol->comp_id = sdev->next_comp_id;
-	scontrol->cmd = SOF_CTRL_CMD_BINARY;
-
-	dev_dbg(sdev->dev, "tplg: load kcontrol index %d chans %d\n",
-		scontrol->comp_id, scontrol->num_channels);
-
-	if (le32_to_cpu(control->priv.size) > 0) {
-		memcpy(cdata->data, control->priv.data,
-		       le32_to_cpu(control->priv.size));
-
-		if (cdata->data->magic != SOF_ABI_MAGIC) {
-			dev_err(sdev->dev, "error: Wrong ABI magic 0x%08x.\n",
-				cdata->data->magic);
-			return -EINVAL;
-		}
-		if (SOF_ABI_VERSION_INCOMPATIBLE(SOF_ABI_VERSION,
-						 cdata->data->abi)) {
-			dev_err(sdev->dev,
-				"error: Incompatible ABI version 0x%08x.\n",
-				cdata->data->abi);
-			return -EINVAL;
-		}
-		if (cdata->data->size + sizeof(const struct sof_abi_hdr) !=
-		    le32_to_cpu(control->priv.size)) {
-			dev_err(sdev->dev,
-				"error: Conflict in bytes vs. priv size.\n");
-			return -EINVAL;
-		}
-	}
-	return 0;
-}
-
 /*
  * Topology Token Parsing.
  * New tokens should be added to headers and parsing tables below.
@@ -1046,6 +889,163 @@ static void sof_dbg_comp_config(struct snd_soc_component *scomp,
 		config->frame_fmt);
 }
 
+/*
+ * Standard Kcontrols.
+ */
+
+static int sof_control_load_volume(struct snd_soc_component *scomp,
+				   struct snd_sof_control *scontrol,
+				   struct snd_kcontrol_new *kc,
+				   struct snd_soc_tplg_ctl_hdr *hdr)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct snd_soc_tplg_mixer_control *mc =
+		container_of(hdr, struct snd_soc_tplg_mixer_control, hdr);
+	struct sof_ipc_ctrl_data *cdata;
+	int tlv[TLV_ITEMS];
+	unsigned int i;
+	int ret;
+
+	/* validate topology data */
+	if (le32_to_cpu(mc->num_channels) > SND_SOC_TPLG_MAX_CHAN)
+		return -EINVAL;
+
+	/* init the volume get/put data */
+	scontrol->size = struct_size(scontrol->control_data, chanv,
+				     le32_to_cpu(mc->num_channels));
+	scontrol->control_data = kzalloc(scontrol->size, GFP_KERNEL);
+	if (!scontrol->control_data)
+		return -ENOMEM;
+
+	scontrol->comp_id = sdev->next_comp_id;
+	scontrol->min_volume_step = le32_to_cpu(mc->min);
+	scontrol->max_volume_step = le32_to_cpu(mc->max);
+	scontrol->num_channels = le32_to_cpu(mc->num_channels);
+
+	/* set cmd for mixer control */
+	if (le32_to_cpu(mc->max) == 1) {
+		scontrol->cmd = SOF_CTRL_CMD_SWITCH;
+		goto out;
+	}
+
+	scontrol->cmd = SOF_CTRL_CMD_VOLUME;
+
+	/* extract tlv data */
+	if (get_tlv_data(kc->tlv.p, tlv) < 0) {
+		dev_err(sdev->dev, "error: invalid TLV data\n");
+		return -EINVAL;
+	}
+
+	/* set up volume table */
+	ret = set_up_volume_table(scontrol, tlv, le32_to_cpu(mc->max) + 1);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: setting up volume table\n");
+		return ret;
+	}
+
+	/* set default volume values to 0dB in control */
+	cdata = scontrol->control_data;
+	for (i = 0; i < scontrol->num_channels; i++) {
+		cdata->chanv[i].channel = i;
+		cdata->chanv[i].value = VOL_ZERO_DB;
+	}
+
+out:
+	dev_dbg(sdev->dev, "tplg: load kcontrol index %d chans %d\n",
+		scontrol->comp_id, scontrol->num_channels);
+
+	return 0;
+}
+
+static int sof_control_load_enum(struct snd_soc_component *scomp,
+				 struct snd_sof_control *scontrol,
+				 struct snd_kcontrol_new *kc,
+				 struct snd_soc_tplg_ctl_hdr *hdr)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct snd_soc_tplg_enum_control *ec =
+		container_of(hdr, struct snd_soc_tplg_enum_control, hdr);
+
+	/* validate topology data */
+	if (le32_to_cpu(ec->num_channels) > SND_SOC_TPLG_MAX_CHAN)
+		return -EINVAL;
+
+	/* init the enum get/put data */
+	scontrol->size = struct_size(scontrol->control_data, chanv,
+				     le32_to_cpu(ec->num_channels));
+	scontrol->control_data = kzalloc(scontrol->size, GFP_KERNEL);
+	if (!scontrol->control_data)
+		return -ENOMEM;
+
+	scontrol->comp_id = sdev->next_comp_id;
+	scontrol->num_channels = le32_to_cpu(ec->num_channels);
+
+	scontrol->cmd = SOF_CTRL_CMD_ENUM;
+
+	dev_dbg(sdev->dev, "tplg: load kcontrol index %d chans %d comp_id %d\n",
+		scontrol->comp_id, scontrol->num_channels, scontrol->comp_id);
+
+	return 0;
+}
+
+static int sof_control_load_bytes(struct snd_soc_component *scomp,
+				  struct snd_sof_control *scontrol,
+				  struct snd_kcontrol_new *kc,
+				  struct snd_soc_tplg_ctl_hdr *hdr)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct sof_ipc_ctrl_data *cdata;
+	struct snd_soc_tplg_bytes_control *control =
+		container_of(hdr, struct snd_soc_tplg_bytes_control, hdr);
+	struct soc_bytes_ext *sbe = (struct soc_bytes_ext *)kc->private_value;
+	int max_size = sbe->max;
+
+	if (le32_to_cpu(control->priv.size) > max_size) {
+		dev_err(sdev->dev, "err: bytes data size %d exceeds max %d.\n",
+			control->priv.size, max_size);
+		return -EINVAL;
+	}
+
+	/* init the get/put bytes data */
+	scontrol->size = sizeof(struct sof_ipc_ctrl_data) +
+		le32_to_cpu(control->priv.size);
+	scontrol->control_data = kzalloc(max_size, GFP_KERNEL);
+	cdata = scontrol->control_data;
+	if (!scontrol->control_data)
+		return -ENOMEM;
+
+	scontrol->comp_id = sdev->next_comp_id;
+	scontrol->cmd = SOF_CTRL_CMD_BINARY;
+
+	dev_dbg(sdev->dev, "tplg: load kcontrol index %d chans %d\n",
+		scontrol->comp_id, scontrol->num_channels);
+
+	if (le32_to_cpu(control->priv.size) > 0) {
+		memcpy(cdata->data, control->priv.data,
+		       le32_to_cpu(control->priv.size));
+
+		if (cdata->data->magic != SOF_ABI_MAGIC) {
+			dev_err(sdev->dev, "error: Wrong ABI magic 0x%08x.\n",
+				cdata->data->magic);
+			return -EINVAL;
+		}
+		if (SOF_ABI_VERSION_INCOMPATIBLE(SOF_ABI_VERSION,
+						 cdata->data->abi)) {
+			dev_err(sdev->dev,
+				"error: Incompatible ABI version 0x%08x.\n",
+				cdata->data->abi);
+			return -EINVAL;
+		}
+		if (cdata->data->size + sizeof(const struct sof_abi_hdr) !=
+		    le32_to_cpu(control->priv.size)) {
+			dev_err(sdev->dev,
+				"error: Conflict in bytes vs. priv size.\n");
+			return -EINVAL;
+		}
+	}
+	return 0;
+}
+
 /* external kcontrol init - used for any driver specific init */
 static int sof_control_load(struct snd_soc_component *scomp, int index,
 			    struct snd_kcontrol_new *kc,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
