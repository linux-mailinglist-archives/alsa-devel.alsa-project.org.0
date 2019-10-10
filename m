Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2134AD2C80
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 16:29:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1A9D1688;
	Thu, 10 Oct 2019 16:28:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1A9D1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570717787;
	bh=3RPCicTEnUlo0FxEB8j0MhzisQxuMnlH2XPuIlA6mTE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Fnvpu0I/uTfSPvnWCx+92C88e9lM0zYvtIFity3MJHlfxv9ZDgxHYNcydydU8OIb8
	 7k3Jv4C/tuWfoz5MeAmCw0BWiG6/pw9gRrovNXOfjjFHqa+N0TsEfrsyW0xhtS9foH
	 04Kv7sN//CbeC/uPYwUG4uYx7bjAix0yH5ND6vSA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 088E5F8068A;
	Thu, 10 Oct 2019 16:22:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B37B3F80447; Thu, 10 Oct 2019 16:22:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 215D5F805FA
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 16:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 215D5F805FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="otTcds4z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Eh/dJ/g5/MHpbsUs/aakrqudygWl36PX93T5HzQdA6U=; b=otTcds4zHN/z
 ThmK63nfdFGBxtftBGvzs4WxsXyP14LTyWtAOOpQixCiCV7vpRBmY30394KpoPz4L+9fQiCZDw2yM
 s9f0iN5Wdv6cIhxGjEBCvLcNn/MBdfYNwtSh1QGvsy/OVyTmlk90wHZrJW5UxWe8U2jo/Sp62lCfn
 Ym4Ow=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iIZKq-0001Zl-6p; Thu, 10 Oct 2019 14:22:32 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id CC795D0003A; Thu, 10 Oct 2019 15:22:31 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jaska Uimonen <jaska.uimonen@linux.intel.com>
In-Reply-To: <20191008164443.1358-9-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191010142231.CC795D0003A@fitzroy.sirena.org.uk>
Date: Thu, 10 Oct 2019 15:22:31 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "AsoC: SOF: refactor control load code" to the
	asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   AsoC: SOF: refactor control load code

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From acf1b71cb693263c7c9373296e872a8fa61a5cf3 Mon Sep 17 00:00:00 2001
From: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Date: Tue, 8 Oct 2019 11:44:42 -0500
Subject: [PATCH] AsoC: SOF: refactor control load code

Move code around to enable token parsing in control load.

Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191008164443.1358-9-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/topology.c | 314 +++++++++++++++++++--------------------
 1 file changed, 157 insertions(+), 157 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index a0b1c38e666b..3918301c573b 100644
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
@@ -1039,6 +882,163 @@ static void sof_dbg_comp_config(struct snd_soc_component *scomp,
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
