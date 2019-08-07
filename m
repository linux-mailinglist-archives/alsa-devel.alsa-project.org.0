Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D348284F31
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 16:53:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B27B165E;
	Wed,  7 Aug 2019 16:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B27B165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565189618;
	bh=ELRUonXAMxotQWdiWspFCZ1JcWaVeBMs1jCjMPe74Aw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aPHKm+oNx9WdS7hIW0tbGDyuhP1pu4cg5aFpHpI4aMYCEtaLd9UpVC1mjNpbFeV1W
	 IXm4R0NgPl/3i4Amu7/wKiZ4KBLTSzQZTw2yQfdKNXCU/PcQBrKXIeuS/w0Gb9d0TZ
	 AiCMAM0Q0H+8ikJwwtcwygTe4isbAYzxo5rmX/qE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77CB8F80483;
	Wed,  7 Aug 2019 16:52:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F7C8F80483; Wed,  7 Aug 2019 16:52:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B73E5F800E4
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 16:52:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B73E5F800E4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 07:52:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,357,1559545200"; d="scan'208";a="182302922"
Received: from knguye7-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.255.81.127])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Aug 2019 07:52:35 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  7 Aug 2019 09:52:27 -0500
Message-Id: <20190807145227.26216-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, Jaska Uimonen <jaska.uimonen@intel.com>, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH] ASoC: SOF: topology: use set_get_data in
	process load
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

From: Jaska Uimonen <jaska.uimonen@intel.com>

Currently when loading sof process components there's a check if binary
control data is associated with it. If found the data is extracted to be
part of component loading and initialization. If binary data exceeds the
ipc max size, loading fails with error as large message support is only
implemented in set_get_data method. So make the process loading use
set_get_data to enable large parameters in component initialization.

Also refactor the process component loading function as it digs out 3
times almost identical information of related controls. This is
redundant, looks ugly and makes it difficult to understand the
mechanism. So make a function out of fetching the control data and use
it in process loading.

Signed-off-by: Jaska Uimonen <jaska.uimonen@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/topology.c | 204 +++++++++++++++++++++++++--------------
 1 file changed, 130 insertions(+), 74 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 12b7d900b9c2..30b5638622dd 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -42,6 +42,13 @@
 /* size of tplg abi in byte */
 #define SOF_TPLG_ABI_SIZE 3
 
+struct sof_widget_data {
+	int ctrl_type;
+	int ipc_cmd;
+	struct sof_abi_hdr *pdata;
+	struct snd_sof_control *control;
+};
+
 /* send pcm params ipc */
 static int ipc_pcm_params(struct snd_sof_widget *swidget, int dir)
 {
@@ -1742,51 +1749,32 @@ static int sof_widget_load_siggen(struct snd_soc_component *scomp, int index,
 	return ret;
 }
 
-static int sof_process_load(struct snd_soc_component *scomp, int index,
-			    struct snd_sof_widget *swidget,
-			    struct snd_soc_tplg_dapm_widget *tw,
-			    struct sof_ipc_comp_reply *r,
-			    int type)
+static size_t sof_get_control_data(struct snd_sof_dev *sdev,
+				   struct snd_soc_dapm_widget *widget,
+				   struct sof_widget_data *wdata)
 {
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	struct snd_soc_tplg_private *private = &tw->priv;
-	struct snd_soc_dapm_widget *widget = swidget->widget;
 	const struct snd_kcontrol_new *kc;
-	struct soc_bytes_ext *sbe;
 	struct soc_mixer_control *sm;
+	struct soc_bytes_ext *sbe;
 	struct soc_enum *se;
-	struct snd_sof_control *scontrol = NULL;
-	struct sof_abi_hdr *pdata = NULL;
-	struct sof_ipc_comp_process *process;
-	size_t ipc_size, ipc_data_size = 0;
-	int ret, i, offset = 0;
-
-	if (type == SOF_COMP_NONE) {
-		dev_err(sdev->dev, "error: invalid process comp type %d\n",
-			type);
-		return -EINVAL;
-	}
+	size_t size = 0;
+	int i;
 
-	/*
-	 * get possible component controls - get size of all pdata,
-	 * then memcpy with headers
-	 */
 	for (i = 0; i < widget->num_kcontrols; i++) {
-
 		kc = &widget->kcontrol_news[i];
 
 		switch (widget->dobj.widget.kcontrol_type) {
 		case SND_SOC_TPLG_TYPE_MIXER:
 			sm = (struct soc_mixer_control *)kc->private_value;
-			scontrol = sm->dobj.private;
+			wdata[i].control = sm->dobj.private;
 			break;
 		case SND_SOC_TPLG_TYPE_BYTES:
 			sbe = (struct soc_bytes_ext *)kc->private_value;
-			scontrol = sbe->dobj.private;
+			wdata[i].control = sbe->dobj.private;
 			break;
 		case SND_SOC_TPLG_TYPE_ENUM:
 			se = (struct soc_enum *)kc->private_value;
-			scontrol = se->dobj.private;
+			wdata[i].control = se->dobj.private;
 			break;
 		default:
 			dev_err(sdev->dev, "error: unknown kcontrol type %d in widget %s\n",
@@ -1795,31 +1783,98 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
 			return -EINVAL;
 		}
 
-		if (!scontrol) {
+		if (!wdata[i].control) {
 			dev_err(sdev->dev, "error: no scontrol for widget %s\n",
 				widget->name);
 			return -EINVAL;
 		}
 
-		/* don't include if no private data */
-		pdata = scontrol->control_data->data;
-		if (!pdata)
-			continue;
+		wdata[i].pdata = wdata[i].control->control_data->data;
+		if (!wdata[i].pdata)
+			return -EINVAL;
 
 		/* make sure data is valid - data can be updated at runtime */
-		if (pdata->magic != SOF_ABI_MAGIC)
-			continue;
+		if (wdata[i].pdata->magic != SOF_ABI_MAGIC)
+			return -EINVAL;
+
+		size += wdata[i].pdata->size;
 
-		ipc_data_size += pdata->size;
+		/* get data type */
+		switch (wdata[i].control->cmd) {
+		case SOF_CTRL_CMD_VOLUME:
+		case SOF_CTRL_CMD_ENUM:
+		case SOF_CTRL_CMD_SWITCH:
+			wdata[i].ipc_cmd = SOF_IPC_COMP_SET_VALUE;
+			wdata[i].ctrl_type = SOF_CTRL_TYPE_VALUE_CHAN_SET;
+			break;
+		case SOF_CTRL_CMD_BINARY:
+			wdata[i].ipc_cmd = SOF_IPC_COMP_SET_DATA;
+			wdata[i].ctrl_type = SOF_CTRL_TYPE_DATA_SET;
+			break;
+		default:
+			break;
+		}
+	}
+
+	return size;
+}
+
+static int sof_process_load(struct snd_soc_component *scomp, int index,
+			    struct snd_sof_widget *swidget,
+			    struct snd_soc_tplg_dapm_widget *tw,
+			    struct sof_ipc_comp_reply *r,
+			    int type)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct snd_soc_dapm_widget *widget = swidget->widget;
+	struct snd_soc_tplg_private *private = &tw->priv;
+	struct sof_ipc_comp_process *process = NULL;
+	struct sof_widget_data *wdata = NULL;
+	size_t ipc_data_size = 0;
+	size_t ipc_size;
+	int offset = 0;
+	int ret = 0;
+	int i;
+
+	if (type == SOF_COMP_NONE) {
+		dev_err(sdev->dev, "error: invalid process comp type %d\n",
+			type);
+		return -EINVAL;
+	}
+
+	/* allocate struct for widget control data sizes and types */
+	if (widget->num_kcontrols) {
+		wdata = kcalloc(widget->num_kcontrols,
+				sizeof(*wdata),
+				GFP_KERNEL);
+
+		if (!wdata)
+			return -ENOMEM;
+
+		/* get possible component controls and get size of all pdata */
+		ipc_data_size = sof_get_control_data(sdev, widget, wdata);
+
+		if (ipc_data_size <= 0) {
+			kfree(wdata);
+			return ipc_data_size;
+		}
 	}
 
 	ipc_size = sizeof(struct sof_ipc_comp_process) +
 		le32_to_cpu(private->size) +
 		ipc_data_size;
 
+	/* we are exceeding max ipc size, config needs to be sent separately */
+	if (ipc_size > SOF_IPC_MSG_MAX_SIZE) {
+		ipc_size -= ipc_data_size;
+		ipc_data_size = 0;
+	}
+
 	process = kzalloc(ipc_size, GFP_KERNEL);
-	if (!process)
+	if (!process) {
+		kfree(wdata);
 		return -ENOMEM;
+	}
 
 	/* configure iir IPC message */
 	process->comp.hdr.size = ipc_size;
@@ -1835,7 +1890,9 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
 	if (ret != 0) {
 		dev_err(sdev->dev, "error: parse process.cfg tokens failed %d\n",
 			le32_to_cpu(private->size));
-		goto err;
+		kfree(wdata);
+		kfree(process);
+		return ret;
 	}
 
 	sof_dbg_comp_config(scomp, &process->config);
@@ -1845,40 +1902,13 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
 	 * get possible component controls - get size of all pdata,
 	 * then memcpy with headers
 	 */
-	for (i = 0; i < widget->num_kcontrols; i++) {
-		kc = &widget->kcontrol_news[i];
-
-		switch (widget->dobj.widget.kcontrol_type) {
-		case SND_SOC_TPLG_TYPE_MIXER:
-			sm = (struct soc_mixer_control *)kc->private_value;
-			scontrol = sm->dobj.private;
-			break;
-		case SND_SOC_TPLG_TYPE_BYTES:
-			sbe = (struct soc_bytes_ext *)kc->private_value;
-			scontrol = sbe->dobj.private;
-			break;
-		case SND_SOC_TPLG_TYPE_ENUM:
-			se = (struct soc_enum *)kc->private_value;
-			scontrol = se->dobj.private;
-			break;
-		default:
-			dev_err(sdev->dev, "error: unknown kcontrol type %d in widget %s\n",
-				widget->dobj.widget.kcontrol_type,
-				widget->name);
-			return -EINVAL;
+	if (ipc_data_size) {
+		for (i = 0; i < widget->num_kcontrols; i++) {
+			memcpy(&process->data + offset,
+			       wdata[i].pdata->data,
+			       wdata[i].pdata->size);
+			offset += wdata[i].pdata->size;
 		}
-
-		/* don't include if no private data */
-		pdata = scontrol->control_data->data;
-		if (!pdata)
-			continue;
-
-		/* make sure data is valid - data can be updated at runtime */
-		if (pdata->magic != SOF_ABI_MAGIC)
-			continue;
-
-		memcpy(&process->data + offset, pdata->data, pdata->size);
-		offset += pdata->size;
 	}
 
 	process->size = ipc_data_size;
@@ -1886,10 +1916,36 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
 
 	ret = sof_ipc_tx_message(sdev->ipc, process->comp.hdr.cmd, process,
 				 ipc_size, r, sizeof(*r));
-	if (ret >= 0)
+
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: create process failed\n");
+		kfree(wdata);
+		kfree(process);
 		return ret;
-err:
-	kfree(process);
+	}
+
+	/* we sent the data in single message so return */
+	if (ipc_data_size) {
+		kfree(wdata);
+		return ret;
+	}
+
+	/* send control data with large message supported method */
+	for (i = 0; i < widget->num_kcontrols; i++) {
+		wdata[i].control->readback_offset = 0;
+		ret = snd_sof_ipc_set_get_comp_data(sdev->ipc, wdata[i].control,
+						    wdata[i].ipc_cmd,
+						    wdata[i].ctrl_type,
+						    wdata[i].control->cmd,
+						    true);
+		if (ret != 0) {
+			dev_err(sdev->dev, "error: send control failed\n");
+			kfree(process);
+			break;
+		}
+	}
+
+	kfree(wdata);
 	return ret;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
