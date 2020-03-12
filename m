Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 145B41833D3
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 15:54:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF9F61737;
	Thu, 12 Mar 2020 15:53:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF9F61737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584024841;
	bh=r42gI+C3gHbq36IerjFijj+kBdhUVsdh64o3hccgThI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jADbtuJEHk9ifBFwv60cgT1hCltJE+kjKMh7InuH4g/TCOg28GQ+4vto+J7HQxaGk
	 q2X1h2Dl668Wnusy+9EISfk46l1H6cWhRFE/k0sch41FX9rMwJxDzvnRrC7VutOhGb
	 6bTG8r3gSGJgkMle29AStSUeYl3PnrzkNg4ddHg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40EA4F80367;
	Thu, 12 Mar 2020 15:45:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63883F80323; Thu, 12 Mar 2020 15:45:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3B26F802A2;
 Thu, 12 Mar 2020 15:44:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3B26F802A2
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 07:44:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; d="scan'208";a="443957710"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.40.3])
 by fmsmga006.fm.intel.com with ESMTP; 12 Mar 2020 07:44:50 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/14] vhost: add an SOF DSP driver
Date: Thu, 12 Mar 2020 15:44:26 +0100
Message-Id: <20200312144429.17959-12-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312144429.17959-1-guennadi.liakhovetski@linux.intel.com>
References: <20200312144429.17959-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
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

The SOF DSP vhost driver consists of two parts: a sound and a vhost
part. This patch implements the vhost part of the driver. It handles
QEMU communication with the vhost misc device and virtual queues to
any VirtIO guests.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 drivers/vhost/Kconfig  |   7 +
 drivers/vhost/Makefile |   5 +
 drivers/vhost/dsp.c    | 728 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 740 insertions(+)
 create mode 100644 drivers/vhost/dsp.c

diff --git a/drivers/vhost/Kconfig b/drivers/vhost/Kconfig
index 3d03ccb..b9f3071 100644
--- a/drivers/vhost/Kconfig
+++ b/drivers/vhost/Kconfig
@@ -34,6 +34,13 @@ config VHOST_VSOCK
 	To compile this driver as a module, choose M here: the module will be called
 	vhost_vsock.
 
+config VHOST_SOF
+	bool "Vhost SOF driver"
+	default n
+	---help---
+	  SOF vhost VirtIO driver. It exports the same IPC interface, as the
+	  one, used for DSP communication, to Linux VirtIO guests.
+
 config VHOST
 	tristate
 	---help---
diff --git a/drivers/vhost/Makefile b/drivers/vhost/Makefile
index 6c6df24..1914561 100644
--- a/drivers/vhost/Makefile
+++ b/drivers/vhost/Makefile
@@ -10,4 +10,9 @@ vhost_vsock-y := vsock.o
 
 obj-$(CONFIG_VHOST_RING) += vringh.o
 
+ifdef CONFIG_VHOST_SOF
+obj-$(CONFIG_SND_SOC_SOF) += vhost_sof.o
+vhost_sof-y := dsp.o
+endif
+
 obj-$(CONFIG_VHOST)	+= vhost.o
diff --git a/drivers/vhost/dsp.c b/drivers/vhost/dsp.c
new file mode 100644
index 00000000..205ae8c
--- /dev/null
+++ b/drivers/vhost/dsp.c
@@ -0,0 +1,728 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Copyright(c) 2019-2020 Intel Corporation. All rights reserved.
+ *
+ * Author: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
+ *
+ * vhost-SOF VirtIO interface
+ */
+
+#include <linux/bitmap.h>
+#include <linux/compat.h>
+#include <linux/file.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/vhost.h>
+#include <linux/workqueue.h>
+
+#include <sound/sof/stream.h>
+#include <sound/sof/virtio.h>
+
+#include "vhost.h"
+
+#define VHOST_DSP_FEATURES VHOST_FEATURES
+#define VHOST_DSP_BATCH 64
+#define VHOST_DSP_WEIGHT 0x80000
+#define VHOST_DSP_PKT_WEIGHT 256
+
+struct vhost_dsp_virtqueue {
+	struct vhost_virtqueue vq;
+};
+
+struct snd_sof_dev;
+
+struct dsp_sof_client;
+struct vhost_dsp {
+	struct vhost_dev dev;
+	struct vhost_dsp_virtqueue vqs[SOF_VIRTIO_NUM_OF_VQS];
+	struct vhost_work work;
+	struct vhost_virtqueue *vq_p[SOF_VIRTIO_NUM_OF_VQS];
+
+	bool active;
+
+	spinlock_t posn_lock;		/* Protects posn_list */
+	struct list_head posn_list;
+	struct list_head posn_buf_list;
+
+	u8 ipc_buf[SOF_IPC_MSG_MAX_SIZE];
+	u8 reply_buf[SOF_IPC_MSG_MAX_SIZE];
+
+	union {
+		struct dsp_sof_data_req data_req;
+		struct dsp_sof_data_resp data_resp;
+	};
+
+	struct dsp_sof_client *snd;
+};
+
+/* A stream position message, waiting to be sent to a guest */
+struct vhost_dsp_posn {
+	struct list_head list;
+	struct sof_ipc_stream_posn posn;
+};
+
+/* A guest buffer, waiting to be filled with a stream position message */
+struct vhost_dsp_iovec {
+	struct list_head list;
+	int head;
+};
+
+/* A guest is booting */
+static int vhost_dsp_activate(struct vhost_dsp *dsp)
+{
+	unsigned int i;
+	int ret = 0;
+
+	mutex_lock(&dsp->dev.mutex);
+
+	/* Wait until all the VirtQueues have been initialised */
+	if (!dsp->active) {
+		for (i = 0; i < ARRAY_SIZE(dsp->vqs); i++) {
+			struct vhost_virtqueue *vq = &dsp->vqs[i].vq;
+
+			/* .private_data is required != NULL */
+			vq->private_data = dsp->vqs + i;
+			/* needed for re-initialisation upon guest reboot */
+			ret = vhost_vq_init_access(vq);
+			if (ret)
+				vq_err(vq,
+				       "%s(): error %d initialising vq #%d\n",
+				       __func__, ret, i);
+		}
+		if (!ret)
+			dsp->active = true;
+	}
+
+	mutex_unlock(&dsp->dev.mutex);
+
+	return ret;
+}
+
+/* A guest is powered off or reset */
+static void vhost_dsp_deactivate(struct vhost_dsp *dsp)
+{
+	unsigned int i;
+
+	mutex_lock(&dsp->dev.mutex);
+
+	if (dsp->active) {
+		struct vhost_dsp_iovec *buf, *next;
+		unsigned long flags;
+
+		dsp->active = false;
+
+		spin_lock_irqsave(&dsp->posn_lock, flags);
+		list_for_each_entry_safe(buf, next, &dsp->posn_buf_list, list) {
+			list_del(&buf->list);
+			kfree(buf);
+		}
+		spin_unlock_irqrestore(&dsp->posn_lock, flags);
+
+		/* signal, that we're inactive */
+		for (i = 0; i < ARRAY_SIZE(dsp->vqs); i++)
+			dsp->vqs[i].vq.private_data = NULL;
+	}
+
+	mutex_unlock(&dsp->dev.mutex);
+}
+
+/* No special features at the moment */
+static int vhost_dsp_set_features(struct vhost_dsp *dsp, u64 features)
+{
+	struct vhost_virtqueue *vq;
+	unsigned int i;
+
+	if (features & ~VHOST_DSP_FEATURES)
+		return -EOPNOTSUPP;
+
+	mutex_lock(&dsp->dev.mutex);
+
+	if ((features & (1 << VHOST_F_LOG_ALL)) &&
+	    !vhost_log_access_ok(&dsp->dev)) {
+		mutex_unlock(&dsp->dev.mutex);
+		return -EFAULT;
+	}
+
+	for (i = 0; i < SOF_VIRTIO_NUM_OF_VQS; i++) {
+		vq = &dsp->vqs[i].vq;
+
+		mutex_lock(&vq->mutex);
+		vq->acked_features = features;
+		mutex_unlock(&vq->mutex);
+	}
+
+	mutex_unlock(&dsp->dev.mutex);
+
+	return 0;
+}
+
+/* .ioctl(): we only use VHOST_SET_RUNNING in a not-default way */
+static long vhost_dsp_ioctl(struct file *filp, unsigned int ioctl,
+			    unsigned long arg)
+{
+	struct vhost_dsp *dsp = filp->private_data;
+	void __user *argp = (void __user *)arg;
+	struct vhost_dsp_topology tplg;
+	u64 __user *featurep = argp;
+	u64 features;
+	int start;
+	long ret;
+
+	switch (ioctl) {
+	case VHOST_GET_FEATURES:
+		features = VHOST_DSP_FEATURES;
+		if (copy_to_user(featurep, &features, sizeof features))
+			return -EFAULT;
+		return 0;
+	case VHOST_SET_FEATURES:
+		if (copy_from_user(&features, featurep, sizeof features))
+			return -EFAULT;
+		return vhost_dsp_set_features(dsp, features);
+	case VHOST_GET_BACKEND_FEATURES:
+		features = 0;
+		if (copy_to_user(featurep, &features, sizeof(features)))
+			return -EFAULT;
+		return 0;
+	case VHOST_SET_BACKEND_FEATURES:
+		if (copy_from_user(&features, featurep, sizeof(features)))
+			return -EFAULT;
+		if (features)
+			return -EOPNOTSUPP;
+		return 0;
+	case VHOST_RESET_OWNER:
+		mutex_lock(&dsp->dev.mutex);
+		ret = vhost_dev_check_owner(&dsp->dev);
+		if (!ret) {
+			struct vhost_umem *umem = vhost_dev_reset_owner_prepare();
+			if (!umem) {
+				ret = -ENOMEM;
+			} else {
+				vhost_dev_stop(&dsp->dev);
+				vhost_dev_reset_owner(&dsp->dev, umem);
+			}
+		}
+		mutex_unlock(&dsp->dev.mutex);
+		return ret;
+	case VHOST_SET_OWNER:
+		mutex_lock(&dsp->dev.mutex);
+		ret = vhost_dev_set_owner(&dsp->dev);
+		mutex_unlock(&dsp->dev.mutex);
+		return ret;
+	case VHOST_SET_RUNNING:
+		if (copy_from_user(&start, argp, sizeof(start)))
+			return -EFAULT;
+
+		if (start)
+			return vhost_dsp_activate(dsp);
+
+		vhost_dsp_deactivate(dsp);
+		return 0;
+	case VHOST_DSP_SET_GUEST_TPLG:
+		if (copy_from_user(&tplg, argp, sizeof(tplg)))
+			return -EFAULT;
+		return dsp_sof_set_tplg(dsp->snd, &tplg);
+	}
+
+	mutex_lock(&dsp->dev.mutex);
+	ret = vhost_dev_ioctl(&dsp->dev, ioctl, argp);
+	if (ret == -ENOIOCTLCMD)
+		ret = vhost_vring_ioctl(&dsp->dev, ioctl, argp);
+	mutex_unlock(&dsp->dev.mutex);
+
+	return ret;
+}
+
+#ifdef CONFIG_COMPAT
+static long vhost_dsp_compat_ioctl(struct file *filp, unsigned int ioctl,
+				   unsigned long arg)
+{
+	return vhost_dsp_ioctl(filp, ioctl, (unsigned long)compat_ptr(arg));
+}
+#endif
+
+static ssize_t vhost_dsp_chr_read_iter(struct kiocb *iocb, struct iov_iter *to)
+{
+	struct file *filp = iocb->ki_filp;
+	struct vhost_dsp *dsp = filp->private_data;
+	struct vhost_dev *dev = &dsp->dev;
+	int noblock = filp->f_flags & O_NONBLOCK;
+
+	return vhost_chr_read_iter(dev, to, noblock);
+}
+
+static ssize_t vhost_dsp_chr_write_iter(struct kiocb *iocb,
+					struct iov_iter *from)
+{
+	struct file *filp = iocb->ki_filp;
+	struct vhost_dsp *dsp = filp->private_data;
+	struct vhost_dev *dev = &dsp->dev;
+
+	return vhost_chr_write_iter(dev, from);
+}
+
+static __poll_t vhost_dsp_chr_poll(struct file *filp, poll_table *wait)
+{
+	struct vhost_dsp *dsp = filp->private_data;
+	struct vhost_dev *dev = &dsp->dev;
+
+	return vhost_chr_poll(filp, dev, wait);
+}
+
+/* IPC message from a guest */
+static void handle_ipc_cmd_kick(struct vhost_work *work)
+{
+	struct vhost_virtqueue *vq = container_of(work, struct vhost_virtqueue,
+						  poll.work);
+	struct vhost_dsp *dsp = container_of(vq->dev, struct vhost_dsp, dev);
+	int vq_idx = SOF_VIRTIO_IPC_CMD_VQ;
+	size_t total_len = 0;
+
+	/* IPC message from the guest */
+	mutex_lock(&vq->mutex);
+
+	/* notifications must be disabled while handling the queue */
+	vhost_disable_notify(&dsp->dev, vq);
+
+	for (;;) {
+		struct iov_iter iov_iter;
+		size_t len, nbytes;
+		unsigned int out, in, i;
+		size_t iov_offset, iov_count;
+		/* IPC command from FE to DSP */
+		int head = vhost_get_vq_desc(vq, vq->iov, ARRAY_SIZE(vq->iov),
+					     &out, &in, NULL, NULL), ret;
+		if (head < 0)
+			break;
+
+		/* Nothing new?  Wait for eventfd to tell us they refilled. */
+		if (head == vq->num) {
+			if (unlikely(vhost_enable_notify(&dsp->dev, vq))) {
+				vhost_disable_notify(&dsp->dev, vq);
+				continue;
+			}
+			break;
+		}
+
+		if (in != out)
+			/* We expect in == out and usually == 1 */
+			continue;
+
+		iov_offset = out;
+		iov_count = out;
+
+		for (i = 0; i < iov_count; i++) {
+			struct sof_ipc_reply *rhdr = (struct sof_ipc_reply *)dsp->reply_buf;
+			size_t to_copy;
+
+			len = vq->iov[i].iov_len;
+
+			if (len > sizeof(dsp->ipc_buf)) {
+				vq_err(vq,
+				       "%s(): head %d out %d in %d len %zd\n",
+				       __func__, head, out, in, len);
+				continue;
+			}
+
+			total_len += len;
+
+			iov_iter_init(&iov_iter, WRITE, vq->iov + i, 1, len);
+
+			nbytes = copy_from_iter(dsp->ipc_buf, len, &iov_iter);
+			if (nbytes != len) {
+				vq_err(vq, "Expected %zu bytes for IPC, got %zu bytes\n",
+				       len, nbytes);
+				continue;
+			}
+
+			/* Process the IPC payload */
+			ret = dsp_sof_ipc_fwd(dsp->snd, vq_idx, dsp->ipc_buf,
+					      dsp->reply_buf, len,
+					      vq->iov[iov_offset + i].iov_len);
+			if (ret < 0) {
+				struct sof_ipc_cmd_hdr *hdr =
+					(struct sof_ipc_cmd_hdr *)dsp->ipc_buf;
+				vq_err(vq,
+				       "%s(): IPC 0x%x failed with error %d\n",
+				       __func__, hdr->cmd, ret);
+			}
+
+			to_copy = min_t(size_t, sizeof(dsp->reply_buf),
+					rhdr->hdr.size);
+
+			iov_iter_init(&iov_iter, READ, vq->iov + iov_offset + i,
+				      1, to_copy);
+			if (copy_to_iter(dsp->reply_buf, to_copy, &iov_iter) > 0)
+				/* Return any response */
+				vhost_add_used_and_signal(vq->dev, vq, head, to_copy);
+		}
+	}
+
+	mutex_unlock(&vq->mutex);
+}
+
+/* Try to send a position update buffer to the guest */
+static void vhost_dsp_fill_posn_vqbuf(struct vhost_dsp *dsp)
+{
+	struct vhost_virtqueue *vq = &dsp->vqs[SOF_VIRTIO_POSN_VQ].vq;
+	struct iov_iter iov_iter;
+	struct vhost_dsp_iovec *buf;
+	struct vhost_dsp_posn *entry;
+	unsigned long flags;
+
+	spin_lock_irqsave(&dsp->posn_lock, flags);
+
+	if (list_empty(&dsp->posn_list)) {
+		/*
+		 * This is the normal path, when called from
+		 * handle_posn_kick(): usually at that time we don't have a
+		 * position update waiting yet
+		 */
+		spin_unlock_irqrestore(&dsp->posn_lock, flags);
+		return;
+	}
+
+	if (list_empty(&dsp->posn_buf_list)) {
+		vq_err(vq, "%s(): no vq descriptors\n", __func__);
+		spin_unlock_irqrestore(&dsp->posn_lock, flags);
+		return;
+	}
+
+	buf = list_first_entry(&dsp->posn_buf_list,
+			       struct vhost_dsp_iovec, list);
+	list_del(&buf->list);
+
+	entry = list_first_entry(&dsp->posn_list,
+				 struct vhost_dsp_posn, list);
+	list_del(&entry->list);
+
+	spin_unlock_irqrestore(&dsp->posn_lock, flags);
+
+	/* Take the lock and send the buffer */
+	mutex_lock(&vq->mutex);
+	iov_iter_init(&iov_iter, READ, vq->iov, 1, sizeof(entry->posn));
+	if (copy_to_iter(&entry->posn, sizeof(entry->posn), &iov_iter) > 0)
+		/*
+		 * Actually the last parameter for vhost_add_used_and_signal()
+		 * should be "sizeof(*posn)," but that didn't work
+		 */
+		vhost_add_used_and_signal(vq->dev, vq, buf->head, 0);
+	mutex_unlock(&vq->mutex);
+
+	kfree(buf);
+	kfree(entry);
+}
+
+/* Handle kick on the data VirtQ */
+static void handle_data_kick(struct vhost_work *work)
+{
+	struct vhost_virtqueue *vq = container_of(work, struct vhost_virtqueue,
+						  poll.work);
+	struct vhost_dsp *dsp = container_of(vq->dev, struct vhost_dsp, dev);
+
+	mutex_lock(&vq->mutex);
+
+	vhost_disable_notify(&dsp->dev, vq);
+
+	for (;;) {
+		struct iov_iter iov_iter;
+		unsigned int out, in, i;
+		int head = vhost_get_vq_desc(vq, vq->iov, ARRAY_SIZE(vq->iov),
+					     &out, &in, NULL, NULL);
+		if (head < 0)
+			break;
+
+		/* Nothing new?  Wait for eventfd to tell us they refilled. */
+		if (head == vq->num) {
+			if (unlikely(vhost_enable_notify(&dsp->dev, vq))) {
+				vhost_disable_notify(&dsp->dev, vq);
+				continue;
+			}
+			break;
+		}
+
+		if (in != out)
+			/* We expect in == out and usually == 1 */
+			continue;
+
+		for (i = 0; i < out; i++) {
+			u8 _req[HDR_SIZE_REQ];
+			u8 _resp[HDR_SIZE_RESP];
+			struct dsp_sof_data_resp *resp;
+			struct dsp_sof_data_req *req;
+			size_t to_copy, nbytes, len = vq->iov[i].iov_len;
+			int ret;
+
+			if (len > sizeof(dsp->data_req) || len < HDR_SIZE_REQ) {
+				vq_err(vq,
+				       "%s(): head %d out %d in %d len %zd\n",
+				       __func__, head, out, in, len);
+				continue;
+			}
+
+			iov_iter_init(&iov_iter, WRITE, vq->iov + i, 1, len);
+
+			if (len > HDR_SIZE_REQ) {
+				/* playback */
+				req = &dsp->data_req;
+				resp = (struct dsp_sof_data_resp *)_resp;
+			} else {
+				/* capture */
+				req = (struct dsp_sof_data_req *)_req;
+				resp = &dsp->data_resp;
+			}
+
+			nbytes = copy_from_iter(req, len, &iov_iter);
+			if (nbytes != len) {
+				vq_err(vq, "Expected %zu bytes for IPC, got %zu bytes\n",
+				       len, nbytes);
+				continue;
+			}
+
+			/* Copy data to or from the audio buffer */
+			ret = dsp_sof_stream_data(dsp->snd, req, resp);
+			if (ret < 0) {
+				vq_err(vq, "Error %d copying data\n", ret);
+				continue;
+			}
+
+			to_copy = resp->size + HDR_SIZE_RESP;
+
+			iov_iter_init(&iov_iter, READ, vq->iov + out + i,
+				      1, to_copy);
+			if (copy_to_iter(resp, to_copy, &iov_iter) > 0)
+				vhost_add_used_and_signal(vq->dev, vq, head, to_copy);
+		}
+	}
+
+	mutex_unlock(&vq->mutex);
+}
+
+/* A new position update buffer from the guest */
+static void handle_posn_kick(struct vhost_work *work)
+{
+	struct vhost_virtqueue *vq = container_of(work, struct vhost_virtqueue,
+						  poll.work);
+	struct vhost_dsp *dsp = container_of(vq->dev, struct vhost_dsp, dev);
+	struct vhost_dsp_iovec *buf;
+	unsigned int out, in;
+	unsigned long flags;
+	bool free = true, enable = true;
+
+	/* Queue the buffer for future position updates from the DSP */
+	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
+	if (!buf)
+		return;
+
+	mutex_lock(&vq->mutex);
+
+	vhost_disable_notify(&dsp->dev, vq);
+
+	for (;;) {
+		/* A posn descriptor should have 1 "in" and 0 "out" buffers */
+		buf->head = vhost_get_vq_desc(vq, vq->iov, ARRAY_SIZE(vq->iov),
+					      &out, &in, NULL, NULL);
+
+		if (buf->head < 0) {
+			vq_err(vq, "%s(): no vq descriptors: %d\n",
+			       __func__, buf->head);
+			break;
+		}
+
+		if (buf->head == vq->num) {
+			if (unlikely(vhost_enable_notify(&dsp->dev, vq))) {
+				vhost_disable_notify(&dsp->dev, vq);
+				continue;
+			}
+			enable = false;
+			break;
+		}
+
+		if (unlikely(out))
+			vq_err(vq,
+			       "%s(): position update has %d outgoing buffers!\n",
+			       __func__, out);
+
+		if (unlikely(vq->iov[out].iov_len !=
+			     sizeof(struct sof_ipc_stream_posn)))
+			vq_err(vq, "%s(): position update has wrong size %d!\n",
+			       __func__, out);
+
+		if (!in) {
+			/* This queue should only contain "in" buffers */
+			vq_err(vq, "%s(): no input buffers!\n", __func__);
+			break;
+		}
+
+		spin_lock_irqsave(&dsp->posn_lock, flags);
+		list_add_tail(&buf->list, &dsp->posn_buf_list);
+		spin_unlock_irqrestore(&dsp->posn_lock, flags);
+
+		free = false;
+		break;
+	}
+
+	if (enable)
+		vhost_enable_notify(&dsp->dev, vq);
+
+	mutex_unlock(&vq->mutex);
+
+	if (free)
+		kfree(buf);
+	else
+		/* Try to send immediately if a position update is pending */
+		vhost_dsp_fill_posn_vqbuf(dsp);
+}
+
+static void vhost_dsp_posn_work(struct vhost_work *work)
+{
+	struct vhost_dsp *dsp = container_of(work, struct vhost_dsp, work);
+
+	/*
+	 * If there is an available VQ buffer, notify immediately. This is the
+	 * normal case, since the guest pre-queues position update VQ buffers.
+	 */
+	vhost_dsp_fill_posn_vqbuf(dsp);
+}
+
+static int vhost_dsp_open(struct inode *inode, struct file *filp)
+{
+	struct miscdevice *misc = filp->private_data;
+	struct snd_sof_dev *sdev = dev_get_drvdata(misc->parent);
+	struct vhost_dsp *dsp = kvmalloc(sizeof(*dsp),
+					 GFP_KERNEL | __GFP_RETRY_MAYFAIL);
+	unsigned int i;
+
+	if (!dsp)
+		return -ENOMEM;
+
+	dsp->snd = dsp_sof_client_add(sdev, dsp);
+	if (!dsp->snd) {
+		kvfree(dsp);
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(dsp->vq_p); i++)
+		dsp->vq_p[i] = &dsp->vqs[i].vq;
+
+	dsp->vqs[SOF_VIRTIO_IPC_CMD_VQ].vq.handle_kick = handle_ipc_cmd_kick;
+	dsp->vqs[SOF_VIRTIO_POSN_VQ].vq.handle_kick = handle_posn_kick;
+	dsp->vqs[SOF_VIRTIO_DATA_VQ].vq.handle_kick = handle_data_kick;
+	/*
+	 * TODO: do we ever want to support multiple guest machines per DSP, if
+	 * not, we might as well perform all allocations when registering the
+	 * misc device.
+	 */
+	INIT_LIST_HEAD(&dsp->posn_list);
+	INIT_LIST_HEAD(&dsp->posn_buf_list);
+	spin_lock_init(&dsp->posn_lock);
+	dsp->active = false;
+	vhost_work_init(&dsp->work, vhost_dsp_posn_work);
+
+	vhost_dev_init(&dsp->dev, dsp->vq_p, SOF_VIRTIO_NUM_OF_VQS,
+		       UIO_MAXIOV + VHOST_DSP_BATCH,
+		       VHOST_DSP_PKT_WEIGHT, VHOST_DSP_WEIGHT);
+
+	/* Overwrite file private data */
+	filp->private_data = dsp;
+
+	return 0;
+}
+
+/*
+ * The device is closed by QEMU when the client driver is unloaded or the guest
+ * is shut down
+ */
+static int vhost_dsp_release(struct inode *inode, struct file *filp)
+{
+	struct vhost_dsp *dsp = filp->private_data;
+
+	vhost_work_flush(&dsp->dev, &dsp->work);
+	vhost_dev_cleanup(&dsp->dev);
+	vhost_poll_flush(&dsp->vqs[SOF_VIRTIO_POSN_VQ].vq.poll);
+	vhost_poll_flush(&dsp->vqs[SOF_VIRTIO_IPC_CMD_VQ].vq.poll);
+	vhost_poll_flush(&dsp->vqs[SOF_VIRTIO_DATA_VQ].vq.poll);
+
+	dsp_sof_client_release(dsp->snd);
+
+	kvfree(dsp);
+
+	return 0;
+}
+
+static const struct file_operations vhost_dsp_fops = {
+	.owner          = THIS_MODULE,
+	.release        = vhost_dsp_release,
+	.read_iter      = vhost_dsp_chr_read_iter,
+	.write_iter     = vhost_dsp_chr_write_iter,
+	.poll           = vhost_dsp_chr_poll,
+	.unlocked_ioctl = vhost_dsp_ioctl,
+#ifdef CONFIG_COMPAT
+	.compat_ioctl   = vhost_dsp_compat_ioctl,
+#endif
+	.open           = vhost_dsp_open,
+	.llseek		= noop_llseek,
+};
+
+static struct miscdevice vhost_dsp_misc = {
+	.minor = MISC_DYNAMIC_MINOR,
+	.name = "vhost-dsp",
+	.fops = &vhost_dsp_fops,
+};
+
+/* Always called from an interrupt thread context */
+static int dsp_sof_update_posn(struct vhost_dsp *dsp,
+			       struct sof_ipc_stream_posn *posn)
+{
+	struct vhost_dsp_posn *entry;
+
+	if (!dsp->active)
+		return 0;
+
+	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
+	if (!entry)
+		return -ENOMEM;
+
+	memcpy(&entry->posn, posn, sizeof(entry->posn));
+
+	/*
+	 * Save the position update msg and send it when a vq buffer becomes
+	 * available.
+	 */
+	spin_lock_irq(&dsp->posn_lock);
+	list_add_tail(&entry->list, &dsp->posn_list);
+	spin_unlock_irq(&dsp->posn_lock);
+
+	/* posn update for guest */
+	vhost_work_queue(&dsp->dev, &dsp->work);
+
+	return 0;
+}
+
+static struct sof_vhost_ops vhost_dsp_ops = {
+	.update_posn = dsp_sof_update_posn,
+};
+
+static int __init dsp_sof_init(void)
+{
+	vhost_dsp_misc.parent = dsp_sof_dev_init(&vhost_dsp_ops);
+	if (!vhost_dsp_misc.parent)
+		return -ENODEV;
+
+	return misc_register(&vhost_dsp_misc);
+}
+
+static void __exit dsp_sof_exit(void)
+{
+	misc_deregister(&vhost_dsp_misc);
+}
+
+module_init(dsp_sof_init);
+module_exit(dsp_sof_exit);
+
+MODULE_VERSION("0.9");
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_AUTHOR("Guennadi Liakhovetski");
+MODULE_DESCRIPTION("Host kernel accelerator for virtio sound");
-- 
1.9.3

