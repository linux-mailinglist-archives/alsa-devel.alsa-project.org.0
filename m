Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3330419D371
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Apr 2020 11:23:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D88DB16AC;
	Fri,  3 Apr 2020 11:22:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D88DB16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585905784;
	bh=w+RoGX5D7zuVqfYS5o7jV0ErsVdif+rEuHmKxFhimTg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BFqGdz/AAnbyra0G5yPNFG/usP2B0aYAYs0ngB6lmTWnOUiAhB9GB+PCXAPkWtaXY
	 zryLl7dBvPUh6/kznMH+0W5q1ms38+FxqR8XY7n4mcQqYp5COWYw2Ilb8/XfEsTrUz
	 xKreKVFookBNKh+ZiAf5t6A9Fyh4ILbFKUsPbeMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30FC7F80360;
	Fri,  3 Apr 2020 11:15:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98445F801A3; Fri,  3 Apr 2020 11:14:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C13ECF8014B;
 Fri,  3 Apr 2020 11:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C13ECF8014B
IronPort-SDR: 5xyosLBCuLIci7S+SJi+dDpcRtMs7ekh+Ogv36waR52VzBVVVfWdLfmN3905I36YsqfK0lXAtf
 3f/v6prMPiqA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 02:14:30 -0700
IronPort-SDR: +iQot4nRt77xmjM4jF6FMx55YjEF2YN/6ZQkpeJoszcujeq0bkCWvJ2auapG7KS2WZAVwK6nNG
 2hljyNXSbLpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,339,1580803200"; d="scan'208";a="451235010"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.36.113])
 by fmsmga006.fm.intel.com with ESMTP; 03 Apr 2020 02:14:28 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 11/12] [RESEND] ASoC: SOF: VirtIO: free guest pipelines
 upon termination
Date: Fri,  3 Apr 2020 11:14:05 +0200
Message-Id: <20200403091406.22381-12-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200403091406.22381-1-guennadi.liakhovetski@linux.intel.com>
References: <20200403091406.22381-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

Currently the SOF driver switches off the DSP every time runtime or
system-wide suspend is entered. After the DSP is turned off, next
time it's turned on, the firmware and topology have to be re-sent to
it.

When a guest SOF instance restarts it sends its topology to the host,
which then forwards it to the DSP. This is correct if the DSP was
suspended during that time and lost the guest's topology. However, if
the DSP stayed active during that entire time, sending duplicate
components to it produces errors. To prevent this from happening this
patch adds freeing of components during guest shut down.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 drivers/vhost/dsp.c        |   3 +
 include/sound/sof/virtio.h |   4 ++
 sound/soc/sof/vhost-be.c   | 155 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 162 insertions(+)

diff --git a/drivers/vhost/dsp.c b/drivers/vhost/dsp.c
index 205ae8c..33e849a 100644
--- a/drivers/vhost/dsp.c
+++ b/drivers/vhost/dsp.c
@@ -114,6 +114,9 @@ static void vhost_dsp_deactivate(struct vhost_dsp *dsp)
 
 		dsp->active = false;
 
+		/* If a VM reboots dsp_sof_client_release() isn't called */
+		dsp_sof_topology_purge(dsp->snd);
+
 		spin_lock_irqsave(&dsp->posn_lock, flags);
 		list_for_each_entry_safe(buf, next, &dsp->posn_buf_list, list) {
 			list_del(&buf->list);
diff --git a/include/sound/sof/virtio.h b/include/sound/sof/virtio.h
index fc98664..80e174e 100644
--- a/include/sound/sof/virtio.h
+++ b/include/sound/sof/virtio.h
@@ -147,6 +147,9 @@ struct dsp_sof_client {
 	struct list_head pipe_conn;
 	/* List of vhost instances on a DSP */
 	struct list_head list;
+	/* List of widgets to free for tear-down */
+	struct list_head comp_list;
+	struct list_head pipe_list;
 
 	/* Component ID range index in the bitmap */
 	unsigned int id;
@@ -177,6 +180,7 @@ int dsp_sof_stream_data(struct dsp_sof_client *client,
 int dsp_sof_ipc_fwd(struct dsp_sof_client *client, int vq_idx,
 		    void *ipc_buf, void *reply_buf,
 		    size_t count, size_t reply_sz);
+void dsp_sof_topology_purge(struct dsp_sof_client *client);
 
 /* The below functions are always referenced, they need dummy counterparts */
 int dsp_sof_update_guest_posn(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/vhost-be.c b/sound/soc/sof/vhost-be.c
index 79d6f8c..1fe1f33 100644
--- a/sound/soc/sof/vhost-be.c
+++ b/sound/soc/sof/vhost-be.c
@@ -43,6 +43,18 @@ struct dsp_pipeline_connect {
 	struct list_head list;
 };
 
+struct dsp_sof_comp_list {
+	struct list_head list;
+	uint32_t comp_id;
+	enum sof_comp_type comp_type;
+};
+
+struct dsp_sof_pipe_list {
+	struct list_head list;
+	uint32_t comp_id;
+	uint32_t pipe_id;
+};
+
 static const char dsp_pcm_name[] = "VHost PCM";
 
 /*
@@ -446,6 +458,75 @@ static int dsp_sof_ipc_comp(struct dsp_sof_client *client,
 		cdata->comp_id >= client->comp_id_end ? -EINVAL : 0;
 }
 
+void dsp_sof_topology_purge(struct dsp_sof_client *client)
+{
+	struct snd_sof_dev *sdev = client->sdev;
+	struct sof_ipc_free fcomp = {
+		.hdr = {
+			.size = sizeof(fcomp),
+		},
+	};
+	struct sof_ipc_reply reply;
+	struct dsp_sof_comp_list *citem, *ctmp;
+	struct dsp_sof_pipe_list *pitem, *ptmp;
+	int ret;
+
+	pm_runtime_get_sync(sdev->dev);
+
+	/* First free all pipelines */
+	list_for_each_entry_safe(pitem, ptmp, &client->pipe_list, list) {
+		fcomp.id = pitem->comp_id;
+		fcomp.hdr.cmd = SOF_IPC_GLB_TPLG_MSG |
+			SOF_IPC_TPLG_PIPE_FREE;
+
+		dev_dbg(sdev->dev, "tplg: unload component ID: %d pipe %u\n",
+			fcomp.id, pitem->pipe_id);
+
+		/* send IPC to the DSP */
+		ret = sof_ipc_tx_message(sdev->ipc,
+					 fcomp.hdr.cmd, &fcomp, sizeof(fcomp),
+					 &reply, sizeof(reply));
+		if (ret < 0)
+			dev_err(sdev->dev, "error: %d unloading component %d\n",
+				ret, fcomp.id);
+
+		list_del(&pitem->list);
+		kfree(pitem);
+	}
+
+	/* Then free all individual components */
+	list_for_each_entry_safe(citem, ctmp, &client->comp_list, list) {
+		fcomp.id = citem->comp_id;
+		switch (citem->comp_type) {
+		case SOF_COMP_BUFFER:
+			fcomp.hdr.cmd = SOF_IPC_GLB_TPLG_MSG |
+				SOF_IPC_TPLG_BUFFER_FREE;
+			break;
+		default:
+			fcomp.hdr.cmd = SOF_IPC_GLB_TPLG_MSG |
+				SOF_IPC_TPLG_COMP_FREE;
+		}
+
+		dev_dbg(sdev->dev, "tplg: unload component ID: %d type %u\n",
+			fcomp.id, citem->comp_type);
+
+		/* send IPC to the DSP */
+		ret = sof_ipc_tx_message(sdev->ipc,
+					 fcomp.hdr.cmd, &fcomp, sizeof(fcomp),
+					 &reply, sizeof(reply));
+		if (ret < 0)
+			dev_err(sdev->dev, "error: %d unloading component %d\n",
+				ret, fcomp.id);
+
+		list_del(&citem->list);
+		kfree(citem);
+	}
+
+	pm_runtime_mark_last_busy(sdev->dev);
+	pm_runtime_put_autosuspend(sdev->dev);
+}
+EXPORT_SYMBOL_GPL(dsp_sof_topology_purge);
+
 /* process PM IPC */
 static int dsp_sof_ipc_pm(struct dsp_sof_client *client, struct sof_ipc_cmd_hdr *hdr,
 			  struct sof_vfe_ipc_power_resp *resp)
@@ -526,6 +607,47 @@ int dsp_sof_add_conn(struct snd_sof_dev *sdev,
 	return 0;
 }
 
+static int dsp_sof_tplg_comp_add(struct dsp_sof_client *client,
+				 struct sof_ipc_comp *comp)
+{
+	struct dsp_sof_comp_list *citem = kmalloc(sizeof(*citem), GFP_KERNEL);
+	if (!citem)
+		return -ENOMEM;
+
+	citem->comp_id = comp->id;
+	citem->comp_type = comp->type;
+
+	dev_dbg(client->sdev->dev, "%s(): adding %p ID %d type %x\n",
+		__func__, citem, comp->id, comp->type);
+	list_add_tail(&citem->list, &client->comp_list);
+
+	return 0;
+}
+
+static int dsp_sof_tplg_pipe_add(struct dsp_sof_client *client,
+				 struct sof_ipc_pipe_new *pipe)
+{
+	struct dsp_sof_pipe_list *pitem = kmalloc(sizeof(*pitem), GFP_KERNEL);
+	if (!pitem)
+		return -ENOMEM;
+
+	pitem->comp_id = pipe->comp_id;
+	pitem->pipe_id = pipe->pipeline_id;
+
+	dev_dbg(client->sdev->dev, "%s(): adding %p ID %d pipe %x\n",
+		__func__, pitem, pipe->comp_id, pipe->pipeline_id);
+	list_add_tail(&pitem->list, &client->pipe_list);
+
+	return 0;
+}
+
+static int dsp_sof_ipc_tplg_buf_new(struct dsp_sof_client *client,
+			struct sof_ipc_cmd_hdr *hdr, struct sof_ipc_reply *rhdr)
+{
+	struct sof_ipc_comp *comp = container_of(hdr, struct sof_ipc_comp, hdr);
+	return dsp_sof_tplg_comp_add(client, comp);
+}
+
 /* Handle some special cases of the "new component" IPC */
 static int dsp_sof_ipc_tplg_comp_new(struct dsp_sof_client *client, int vq_idx,
 			struct sof_ipc_cmd_hdr *hdr, struct sof_ipc_reply *rhdr)
@@ -535,6 +657,7 @@ static int dsp_sof_ipc_tplg_comp_new(struct dsp_sof_client *client, int vq_idx,
 	struct snd_sof_pcm *spcm, *last;
 	struct sof_ipc_comp_host *host;
 	struct dsp_pipeline_connect *conn;
+	int ret;
 
 	if (comp->id < client->comp_id_begin ||
 	    comp->id >= client->comp_id_end)
@@ -595,6 +718,10 @@ static int dsp_sof_ipc_tplg_comp_new(struct dsp_sof_client *client, int vq_idx,
 		break;
 	}
 
+	ret = dsp_sof_tplg_comp_add(client, comp);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
@@ -606,6 +733,9 @@ static int dsp_sof_ipc_tplg_pipe_new(struct dsp_sof_client *client, int vq_idx,
 						struct sof_ipc_pipe_new, hdr);
 	struct snd_sof_dev *sdev = client->sdev;
 	struct dsp_pipeline_connect *conn;
+	int ret = dsp_sof_tplg_pipe_add(client, pipeline);
+	if (ret < 0)
+		return ret;
 
 	list_for_each_entry(conn, &sdev->connector_list, list)
 		if (pipeline->pipeline_id == conn->guest_pipeline_id) {
@@ -723,6 +853,8 @@ static int dsp_sof_ipc_tplg(struct dsp_sof_client *client, int vq_idx,
 	case SOF_IPC_TPLG_COMP_NEW:
 		return dsp_sof_ipc_tplg_comp_new(client, vq_idx, hdr,
 						 reply_buf);
+	case SOF_IPC_TPLG_BUFFER_NEW:
+		return dsp_sof_ipc_tplg_buf_new(client, hdr, reply_buf);
 	case SOF_IPC_TPLG_PIPE_NEW:
 		return dsp_sof_ipc_tplg_pipe_new(client, vq_idx, hdr);
 	case SOF_IPC_TPLG_COMP_CONNECT:
@@ -987,6 +1119,23 @@ int dsp_sof_set_tplg(struct dsp_sof_client *client,
 void dsp_sof_suspend(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pcm *spcm, *next;
+	struct dsp_sof_client *client;
+
+	/* Upon resume we'll rebuild lists */
+	list_for_each_entry(client, &sdev->vbe_list, list) {
+		struct dsp_sof_comp_list *citem, *ctmp;
+		struct dsp_sof_pipe_list *pitem, *ptmp;
+
+		list_for_each_entry_safe(pitem, ptmp, &client->pipe_list, list) {
+			list_del(&pitem->list);
+			kfree(pitem);
+		}
+
+		list_for_each_entry_safe(citem, ctmp, &client->comp_list, list) {
+			list_del(&citem->list);
+			kfree(citem);
+		}
+	}
 
 	list_for_each_entry_safe(spcm, next, &sdev->pcm_list, list)
 		if (!strcmp(dsp_pcm_name, spcm->pcm.pcm_name)) {
@@ -1000,6 +1149,9 @@ void dsp_sof_suspend(struct snd_sof_dev *sdev)
 /* A VM instance has closed the miscdevice */
 void dsp_sof_client_release(struct dsp_sof_client *client)
 {
+	/* If a VM crashes we don't get ioctl(VHOST_SET_RUNNING, 0) from QEMU */
+	dsp_sof_topology_purge(client);
+
 	bitmap_release_region(client->sdev->vfe_mask, client->id, 0);
 
 	list_del(&client->list);
@@ -1024,6 +1176,9 @@ struct dsp_sof_client *dsp_sof_client_add(struct snd_sof_dev *sdev,
 		return NULL;
 	}
 
+	INIT_LIST_HEAD(&client->pipe_list);
+	INIT_LIST_HEAD(&client->comp_list);
+
 	client->sdev = sdev;
 	client->id = id;
 	client->vhost = dsp;
-- 
1.9.3

