Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92105F96F2
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 18:19:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE248167B;
	Tue, 12 Nov 2019 18:19:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE248167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573579195;
	bh=vEIiiOX9uNvhEZSe9IQT9N6YxR9Qqlk1Pqlfn6s0EL8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=i9Om+DEbCqNKItPwPZvT807RsH97Nio/KQ2Dk+KOTu5KXpNNe20XmqlAP55a/HOL7
	 oXlEbmLL9m0QGsSiKojTm9vJMPrYCMa6w5f1ptwWkWFolY6TET0dJQtCVxxBqxUHyJ
	 Hep8hIBBW2uEl/2vcTS61d09O3JLDivjrnzjlA3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C6DBF80612;
	Tue, 12 Nov 2019 18:16:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDA8DF80600; Tue, 12 Nov 2019 18:16:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23D1AF8044C
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 18:16:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23D1AF8044C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="LMUdgxU+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=YfD/0D0q1ioVpB3Cdp1d9yB6I1kiEMo5VzI8L84mW18=; b=LMUdgxU+Fmrp
 F38DRm6VFfpTOmTpS+fKxxy4nNag7yNrlbwaCwcEfc19+fjqtCrglLPfUyu445VqrXT9vbwAUw2ul
 JaghIwSFtSohi3iHkjXGuMqoYS+hBb/dZ2zeorV6nLKkUR425s38cAOrZrsL48c4rGQxLBzuXVv96
 LvOng=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iUZm7-0008Ij-HA; Tue, 12 Nov 2019 17:16:19 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E8ECF27429D2; Tue, 12 Nov 2019 17:16:18 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Dragos Tarcatu <dragos_tarcatu@mentor.com>
In-Reply-To: <20191111222039.19651-1-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191112171618.E8ECF27429D2@ypsilon.sirena.org.uk>
Date: Tue, 12 Nov 2019 17:16:18 +0000 (GMT)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Paul Olaru <paul.olaru@nxp.com>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: topology: free kcontrol memory on
	error" to the asoc tree
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

   ASoC: SOF: topology: free kcontrol memory on error

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

From 1b4efdaf6d6053c8944cee0edba0969dc1be7d4b Mon Sep 17 00:00:00 2001
From: Dragos Tarcatu <dragos_tarcatu@mentor.com>
Date: Mon, 11 Nov 2019 16:20:38 -0600
Subject: [PATCH] ASoC: SOF: topology: free kcontrol memory on error

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
Link: https://lore.kernel.org/r/20191111222039.19651-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
