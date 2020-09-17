Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AF226D9C4
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 13:02:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AB501671;
	Thu, 17 Sep 2020 13:02:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AB501671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600340575;
	bh=9MayRoqi7yFKWMIEI8RqvUi6OUGd4x9XRKTRE0LiKU8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hqlCFYrjUqdYcVIyCgZji1gDz8VnOa00fes9acDrqSCsQUpZpdNsL2B3N5KJx6alF
	 9fxGRTpIMpGpGZf/yJF3GphFosgo6PjmnDiltUuO/hLJJO8xeFqvXBxhISizJeSe5p
	 36JlC3mg7b1sEJ4RCdF1d1Srjv25BntGSOpnxORE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAD60F802F8;
	Thu, 17 Sep 2020 12:58:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6DCAF802DD; Thu, 17 Sep 2020 12:58:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 624DDF800E8
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 12:58:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 624DDF800E8
IronPort-SDR: Lpbi96bmVsQnP4QUGQYN+d9qM89zKu2ZzggL0efv4aDpONSz2YxDMsRqW0Zxhab5j4KP7RfxMf
 Q3P+2zb+XmcQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="157075359"
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="157075359"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 03:58:13 -0700
IronPort-SDR: iTUzxgGAt5zUuwEtwgQN5CGC8+QkMBuUpd3csi7n4glypYNCWwE6NCT4WTelCy2z599Qv1dEZr
 vSeavlrMnwMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="320177345"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 17 Sep 2020 03:58:11 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 5/8] ASoC: SOF: (cosmetic) remove redundant "ret" variable uses
Date: Thu, 17 Sep 2020 13:56:30 +0300
Message-Id: <20200917105633.2579047-6-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200917105633.2579047-1-kai.vehmanen@linux.intel.com>
References: <20200917105633.2579047-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com
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

From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

In some cases no "ret" variable is even needed, those functions always
return 0 anyway, in other cases "ret" initialisation is redundant.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/control.c  | 22 +++++++---------------
 sound/soc/sof/topology.c | 24 +++++++++++-------------
 2 files changed, 18 insertions(+), 28 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 5419c93badd2..63ead9ebc4c6 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -221,7 +221,6 @@ int snd_sof_bytes_get(struct snd_kcontrol *kcontrol,
 	struct sof_ipc_ctrl_data *cdata = scontrol->control_data;
 	struct sof_abi_hdr *data = cdata->data;
 	size_t size;
-	int ret = 0;
 
 	if (be->max > sizeof(ucontrol->value.bytes.data)) {
 		dev_err_ratelimited(scomp->dev,
@@ -235,15 +234,13 @@ int snd_sof_bytes_get(struct snd_kcontrol *kcontrol,
 		dev_err_ratelimited(scomp->dev,
 				    "error: DSP sent %zu bytes max is %d\n",
 				    size, be->max);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	/* copy back to kcontrol */
 	memcpy(ucontrol->value.bytes.data, data, size);
 
-out:
-	return ret;
+	return 0;
 }
 
 int snd_sof_bytes_put(struct snd_kcontrol *kcontrol,
@@ -424,7 +421,6 @@ int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_tlv __user *tlvd =
 		(struct snd_ctl_tlv __user *)binary_data;
 	int data_size;
-	int ret = 0;
 
 	/*
 	 * Decrement the limit by ext bytes header size to
@@ -443,20 +439,16 @@ int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 	if (data_size > be->max) {
 		dev_err_ratelimited(scomp->dev, "error: user data size %d exceeds max size %d.\n",
 				    data_size, be->max);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	header.numid = scontrol->cmd;
 	header.length = data_size;
-	if (copy_to_user(tlvd, &header, sizeof(const struct snd_ctl_tlv))) {
-		ret = -EFAULT;
-		goto out;
-	}
+	if (copy_to_user(tlvd, &header, sizeof(const struct snd_ctl_tlv)))
+		return -EFAULT;
 
 	if (copy_to_user(tlvd->tlv, cdata->data, data_size))
-		ret = -EFAULT;
+		return -EFAULT;
 
-out:
-	return ret;
+	return 0;
 }
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index d5efac3af5c2..fa85a22b5880 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -63,7 +63,7 @@ static int ipc_pcm_params(struct snd_sof_widget *swidget, int dir)
 	struct sof_ipc_pcm_params pcm;
 	struct snd_pcm_hw_params *params;
 	struct snd_sof_pcm *spcm;
-	int ret = 0;
+	int ret;
 
 	memset(&pcm, 0, sizeof(pcm));
 
@@ -121,7 +121,7 @@ static int ipc_trigger(struct snd_sof_widget *swidget, int cmd)
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct sof_ipc_stream stream;
 	struct sof_ipc_reply reply;
-	int ret = 0;
+	int ret;
 
 	/* set IPC stream params */
 	stream.hdr.size = sizeof(stream);
@@ -1033,7 +1033,7 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 	struct sof_ipc_ctrl_data *cdata;
 	int tlv[TLV_ITEMS];
 	unsigned int i;
-	int ret = 0;
+	int ret;
 
 	/* validate topology data */
 	if (le32_to_cpu(mc->num_channels) > SND_SOC_TPLG_MAX_CHAN) {
@@ -1098,7 +1098,7 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
 	dev_dbg(scomp->dev, "tplg: load kcontrol index %d chans %d\n",
 		scontrol->comp_id, scontrol->num_channels);
 
-	return ret;
+	return 0;
 
 out_free_table:
 	if (le32_to_cpu(mc->max) > 1)
@@ -1151,7 +1151,7 @@ static int sof_control_load_bytes(struct snd_soc_component *scomp,
 		container_of(hdr, struct snd_soc_tplg_bytes_control, hdr);
 	struct soc_bytes_ext *sbe = (struct soc_bytes_ext *)kc->private_value;
 	int max_size = sbe->max;
-	int ret = 0;
+	int ret;
 
 	/* init the get/put bytes data */
 	scontrol->size = sizeof(struct sof_ipc_ctrl_data) +
@@ -1204,7 +1204,7 @@ static int sof_control_load_bytes(struct snd_soc_component *scomp,
 		}
 	}
 
-	return ret;
+	return 0;
 
 out_free:
 	kfree(scontrol->control_data);
@@ -1223,7 +1223,7 @@ static int sof_control_load(struct snd_soc_component *scomp, int index,
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_dobj *dobj;
 	struct snd_sof_control *scontrol;
-	int ret = -EINVAL;
+	int ret;
 
 	dev_dbg(scomp->dev, "tplg: load control type %d name : %s\n",
 		hdr->type, hdr->name);
@@ -1276,7 +1276,7 @@ static int sof_control_load(struct snd_soc_component *scomp, int index,
 
 	dobj->private = scontrol;
 	list_add(&scontrol->list, &sdev->kcontrol_list);
-	return ret;
+	return 0;
 }
 
 static int sof_control_unload(struct snd_soc_component *scomp,
@@ -2659,7 +2659,7 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
 	struct snd_soc_tplg_private *private = &pcm->priv;
 	struct snd_sof_pcm *spcm;
 	int stream;
-	int ret = 0;
+	int ret;
 
 	/* nothing to do for BEs atm */
 	if (!pcm)
@@ -3350,7 +3350,6 @@ static int sof_link_hda_unload(struct snd_sof_dev *sdev,
 			       struct snd_soc_dai_link *link)
 {
 	struct snd_soc_dai *dai;
-	int ret = 0;
 
 	dai = snd_soc_find_dai(link->cpus);
 	if (!dai) {
@@ -3359,7 +3358,7 @@ static int sof_link_hda_unload(struct snd_sof_dev *sdev,
 		return -EINVAL;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int sof_link_unload(struct snd_soc_component *scomp,
@@ -3492,7 +3491,6 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 	    sink_swidget->id != snd_soc_dapm_buffer) {
 		dev_dbg(scomp->dev, "warning: neither Linked source component %s nor sink component %s is of buffer type, ignoring link\n",
 			route->source, route->sink);
-		ret = 0;
 		goto err;
 	} else {
 		ret = sof_ipc_tx_message(sdev->ipc,
@@ -3526,7 +3524,7 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 		/* add route to route list */
 		list_add(&sroute->list, &sdev->route_list);
 
-		return ret;
+		return 0;
 	}
 
 err:
-- 
2.27.0

