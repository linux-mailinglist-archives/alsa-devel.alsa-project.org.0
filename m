Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C370DF82D7
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 23:22:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58A791678;
	Mon, 11 Nov 2019 23:21:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58A791678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573510954;
	bh=X8+dECAn+XycsudHUoQU4fDtoACC99PGUq23qgwreQc=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X852ACquhi+/Ige6WhiW02om7GMV64Oyc8QcxpuLps9oAProumhtmQeV5sJMUqBzJ
	 VTrhUHoU8NinymO+mmv6VH8KgDRyDq5LRKrul8hK6fFngO+YE6oa1uYDg6wWhKT2I8
	 NWwaDafYz7QtRBPf+7TY6BzdpM1cZ0CPaPScdLRw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78738F80518;
	Mon, 11 Nov 2019 23:20:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6BB4EF804FF; Mon, 11 Nov 2019 23:20:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42074F80275
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 23:20:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42074F80275
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Nov 2019 14:20:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,294,1569308400"; d="scan'208";a="207260490"
Received: from kathyche-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.27.186])
 by orsmga006.jf.intel.com with ESMTP; 11 Nov 2019 14:20:41 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 11 Nov 2019 16:20:38 -0600
Message-Id: <20191111222039.19651-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Paul Olaru <paul.olaru@nxp.com>, broonie@kernel.org
Subject: [alsa-devel] [PATCH] ASoC: SOF: topology: free kcontrol memory on
	error
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

From: Dragos Tarcatu <dragos_tarcatu@mentor.com>

The volume and bytes kcontrols are currently not freeing their
memory on initialization failures. When an error occurs, all the
widgets loaded so far are unloaded via sof_widget_unload().
But this only happens for the widgets that got successfully loaded.

Fix that by kfree()-ing the allocated memory on load error.

Fixes: 311ce4fe7637d ("ASoC: SOF: Add support for loading topologies")
Reviewed-by: Paul Olaru <paul.olaru@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Dragos Tarcatu <dragos_tarcatu@mentor.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 67 +++++++++++++++++++++++++++++-----------
 1 file changed, 49 insertions(+), 18 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 6096731e89ce..d82ab981e840 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -942,18 +942,22 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 	struct sof_ipc_ctrl_data *cdata;
 	int tlv[TLV_ITEMS];
 	unsigned int i;
-	int ret;
+	int ret = 0;
 
 	/* validate topology data */
-	if (le32_to_cpu(mc->num_channels) > SND_SOC_TPLG_MAX_CHAN)
-		return -EINVAL;
+	if (le32_to_cpu(mc->num_channels) > SND_SOC_TPLG_MAX_CHAN) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	/* init the volume get/put data */
 	scontrol->size = struct_size(scontrol->control_data, chanv,
 				     le32_to_cpu(mc->num_channels));
 	scontrol->control_data = kzalloc(scontrol->size, GFP_KERNEL);
-	if (!scontrol->control_data)
-		return -ENOMEM;
+	if (!scontrol->control_data) {
+		ret = -ENOMEM;
+		goto out;
+	}
 
 	scontrol->comp_id = sdev->next_comp_id;
 	scontrol->min_volume_step = le32_to_cpu(mc->min);
@@ -963,7 +967,7 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 	/* set cmd for mixer control */
 	if (le32_to_cpu(mc->max) == 1) {
 		scontrol->cmd = SOF_CTRL_CMD_SWITCH;
-		goto out;
+		goto skip;
 	}
 
 	scontrol->cmd = SOF_CTRL_CMD_VOLUME;
@@ -971,14 +975,15 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 	/* extract tlv data */
 	if (get_tlv_data(kc->tlv.p, tlv) < 0) {
 		dev_err(sdev->dev, "error: invalid TLV data\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out_free;
 	}
 
 	/* set up volume table */
 	ret = set_up_volume_table(scontrol, tlv, le32_to_cpu(mc->max) + 1);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: setting up volume table\n");
-		return ret;
+		goto out_free;
 	}
 
 	/* set default volume values to 0dB in control */
@@ -988,7 +993,7 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 		cdata->chanv[i].value = VOL_ZERO_DB;
 	}
 
-out:
+skip:
 	/* set up possible led control from mixer private data */
 	ret = sof_parse_tokens(scomp, &scontrol->led_ctl, led_tokens,
 			       ARRAY_SIZE(led_tokens), mc->priv.array,
@@ -996,13 +1001,21 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 	if (ret != 0) {
 		dev_err(sdev->dev, "error: parse led tokens failed %d\n",
 			le32_to_cpu(mc->priv.size));
-		return ret;
+		goto out_free_table;
 	}
 
 	dev_dbg(sdev->dev, "tplg: load kcontrol index %d chans %d\n",
 		scontrol->comp_id, scontrol->num_channels);
 
-	return 0;
+	return ret;
+
+out_free_table:
+	if (le32_to_cpu(mc->max) > 1)
+		kfree(scontrol->volume_table);
+out_free:
+	kfree(scontrol->control_data);
+out:
+	return ret;
 }
 
 static int sof_control_load_enum(struct snd_soc_component *scomp,
@@ -1047,6 +1060,7 @@ static int sof_control_load_bytes(struct snd_soc_component *scomp,
 		container_of(hdr, struct snd_soc_tplg_bytes_control, hdr);
 	struct soc_bytes_ext *sbe = (struct soc_bytes_ext *)kc->private_value;
 	int max_size = sbe->max;
+	int ret = 0;
 
 	/* init the get/put bytes data */
 	scontrol->size = sizeof(struct sof_ipc_ctrl_data) +
@@ -1055,13 +1069,16 @@ static int sof_control_load_bytes(struct snd_soc_component *scomp,
 	if (scontrol->size > max_size) {
 		dev_err(sdev->dev, "err: bytes data size %d exceeds max %d.\n",
 			scontrol->size, max_size);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out;
 	}
 
 	scontrol->control_data = kzalloc(max_size, GFP_KERNEL);
 	cdata = scontrol->control_data;
-	if (!scontrol->control_data)
-		return -ENOMEM;
+	if (!scontrol->control_data) {
+		ret = -ENOMEM;
+		goto out;
+	}
 
 	scontrol->comp_id = sdev->next_comp_id;
 	scontrol->cmd = SOF_CTRL_CMD_BINARY;
@@ -1076,23 +1093,32 @@ static int sof_control_load_bytes(struct snd_soc_component *scomp,
 		if (cdata->data->magic != SOF_ABI_MAGIC) {
 			dev_err(sdev->dev, "error: Wrong ABI magic 0x%08x.\n",
 				cdata->data->magic);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto out_free;
 		}
 		if (SOF_ABI_VERSION_INCOMPATIBLE(SOF_ABI_VERSION,
 						 cdata->data->abi)) {
 			dev_err(sdev->dev,
 				"error: Incompatible ABI version 0x%08x.\n",
 				cdata->data->abi);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto out_free;
 		}
 		if (cdata->data->size + sizeof(const struct sof_abi_hdr) !=
 		    le32_to_cpu(control->priv.size)) {
 			dev_err(sdev->dev,
 				"error: Conflict in bytes vs. priv size.\n");
-			return -EINVAL;
+			ret = -EINVAL;
+			goto out_free;
 		}
 	}
-	return 0;
+
+	return ret;
+
+out_free:
+	kfree(scontrol->control_data);
+out:
+	return ret;
 }
 
 /* external kcontrol init - used for any driver specific init */
@@ -1150,6 +1176,11 @@ static int sof_control_load(struct snd_soc_component *scomp, int index,
 		return 0;
 	}
 
+	if (ret < 0) {
+		kfree(scontrol);
+		return ret;
+	}
+
 	dobj->private = scontrol;
 	list_add(&scontrol->list, &sdev->kcontrol_list);
 	return ret;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
