Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 303741833D4
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 15:54:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE88B1723;
	Thu, 12 Mar 2020 15:53:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE88B1723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584024882;
	bh=p1A429+iwmt/VdH8gVVzFcXtscVAQIm3c4aWJpTWL/g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r8FKlcxUDSqJMkAlAX0hQI+fJhZpUm8zTYLAMO/KY5EbRu9nXrZ0McQtOuJixHUYu
	 CLtI6QeYm9sqSAXWsLFhqgxz0m6HYLRZGXuGJ+Ijfc4Cu66eZf2v8CoGn2IUeQNBVm
	 n27/GN67gw7NR7BXmw2mNAvaoT8vWDs3TBNvXpFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1F93F80371;
	Thu, 12 Mar 2020 15:45:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9543F80334; Thu, 12 Mar 2020 15:45:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EBE7F8029A;
 Thu, 12 Mar 2020 15:44:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EBE7F8029A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 07:44:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; d="scan'208";a="443957627"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.40.3])
 by fmsmga006.fm.intel.com with ESMTP; 12 Mar 2020 07:44:45 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/14] ASoC: SOF: add a VirtIO DSP driver
Date: Thu, 12 Mar 2020 15:44:24 +0100
Message-Id: <20200312144429.17959-10-guennadi.liakhovetski@linux.intel.com>
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

Add a VirtIO driver, designed to work with the SOF vhost driver. This
driver allows SOF to be used on Virtual Machines (VMs) where the host
is also a Linux system, using the SOF driver natively. This driver
communicates with the host using the VirtIO standard over Virtual
Queues. This version uses 3 Virtual Queues: for control, for data and
for position updates. The control Virtual Queue uses exactly the same
IPC protocol as what is used by the SOF driver natively to
communicate with the DSP.  In the future a zero-copy capability
should be added thus eliminating 2 out of 3 Virtual Queues and only
preserving the control queue.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 include/sound/sof.h             |   4 +
 include/sound/sof/header.h      |   2 +
 include/sound/sof/topology.h    |   1 +
 include/sound/sof/virtio.h      | 129 ++++++
 include/uapi/linux/virtio_ids.h |   1 +
 sound/soc/sof/Kconfig           |   7 +
 sound/soc/sof/Makefile          |   4 +
 sound/soc/sof/core.c            |  29 +-
 sound/soc/sof/ipc.c             |  16 +-
 sound/soc/sof/pcm.c             |   9 +
 sound/soc/sof/sof-priv.h        |  29 ++
 sound/soc/sof/topology.c        |  18 +-
 sound/soc/sof/virtio-fe.c       | 891 ++++++++++++++++++++++++++++++++++++++++
 13 files changed, 1115 insertions(+), 25 deletions(-)
 create mode 100644 include/sound/sof/virtio.h
 create mode 100644 sound/soc/sof/virtio-fe.c

diff --git a/include/sound/sof.h b/include/sound/sof.h
index a0cbca0..2c63d8f 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -17,6 +17,8 @@
 
 struct snd_sof_dsp_ops;
 
+struct sof_vfe;
+
 /*
  * SOF Platform data.
  */
@@ -27,6 +29,8 @@ struct snd_sof_pdata {
 
 	struct device *dev;
 
+	struct sof_vfe *vfe;
+
 	/*
 	 * notification callback used if the hardware initialization
 	 * can take time or is handled in a workqueue. This callback
diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
index 1aaccb5a..49ad3ee 100644
--- a/include/sound/sof/header.h
+++ b/include/sound/sof/header.h
@@ -67,6 +67,8 @@
 #define SOF_IPC_TPLG_PIPE_COMPLETE		SOF_CMD_TYPE(0x013)
 #define SOF_IPC_TPLG_BUFFER_NEW			SOF_CMD_TYPE(0x020)
 #define SOF_IPC_TPLG_BUFFER_FREE		SOF_CMD_TYPE(0x021)
+#define SOF_IPC_TPLG_VFE_GET			SOF_CMD_TYPE(0x030)
+#define SOF_IPC_TPLG_VFE_COMP_ID		SOF_CMD_TYPE(0x031)
 
 /* PM */
 #define SOF_IPC_PM_CTX_SAVE			SOF_CMD_TYPE(0x001)
diff --git a/include/sound/sof/topology.h b/include/sound/sof/topology.h
index 402e025..6de3154 100644
--- a/include/sound/sof/topology.h
+++ b/include/sound/sof/topology.h
@@ -37,6 +37,7 @@ enum sof_comp_type {
 	SOF_COMP_SELECTOR,		/**< channel selector component */
 	SOF_COMP_DEMUX,
 	SOF_COMP_ASRC,		/**< Asynchronous sample rate converter */
+	SOF_COMP_VIRT_CON,	/**< Virtual connection, sent by the VirtIO guest */
 	/* keep FILEREAD/FILEWRITE as the last ones */
 	SOF_COMP_FILEREAD = 10000,	/**< host test based file IO */
 	SOF_COMP_FILEWRITE = 10001,	/**< host test based file IO */
diff --git a/include/sound/sof/virtio.h b/include/sound/sof/virtio.h
new file mode 100644
index 00000000..d7d94da
--- /dev/null
+++ b/include/sound/sof/virtio.h
@@ -0,0 +1,129 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Copyright(c) 2018-2020 Intel Corporation. All rights reserved.
+ *
+ *  Contact Information:
+ *  Author:	Luo Xionghu <xionghu.luo@intel.com>
+ *		Liam Girdwood <liam.r.girdwood@linux.intel.com>
+ *		Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
+ */
+
+#ifndef _SOF_VIRTIO_H
+#define _SOF_VIRTIO_H
+
+#include <sound/sof/header.h>
+
+/*
+ * Currently we define 3 vqs: one for handling of IPC commands, one for
+ * handling of stream position updates, and one for audio data.
+ */
+enum {
+	SOF_VIRTIO_IPC_CMD_VQ,	/* IPC commands and replies */
+	SOF_VIRTIO_POSN_VQ,	/* Stream position updates */
+	SOF_VIRTIO_DATA_VQ,	/* Audio data */
+	/* Keep last */
+	SOF_VIRTIO_NUM_OF_VQS,
+};
+
+/* command messages from FE to BE, trigger/open/hw_params and so on */
+#define SOF_VIRTIO_IPC_CMD_VQ_NAME  "sof-ipc-cmd"
+
+/* the vq to get stream position updates */
+#define SOF_VIRTIO_POSN_VQ_NAME     "sof-position"
+
+/* the vq for audio data */
+#define SOF_VIRTIO_DATA_VQ_NAME  "sof-data"
+
+/**
+ * struct sof_vfe_ipc_tplg_req - request for topology data
+ * @hdr:	the standard SOF IPC header
+ * @offset:	the current offset when transferring a split file
+ */
+struct sof_vfe_ipc_tplg_req {
+	struct sof_ipc_cmd_hdr hdr;
+	size_t offset;
+} __packed;
+
+/**
+ * struct sof_vfe_ipc_tplg_resp - response to a topology file request
+ * @reply:	the standard SOF IPC response header
+ * @data:	the complete topology file
+ *
+ * The topology file is transferred from the host to the guest over a virtual
+ * queue in chunks of SOF_IPC_MSG_MAX_SIZE - sizeof(struct sof_ipc_reply), so
+ * for data transfer the @data array is much smaller than 64KiB. 64KiB is what
+ * is included in struct sof_vfe for permanent storage of the complete file.
+ */
+struct sof_vfe_ipc_tplg_resp {
+	struct sof_ipc_reply reply;
+	/* There exist topology files already larger than 40KiB */
+	uint8_t data[64 * 1024 - sizeof(struct sof_ipc_reply)];
+} __packed;
+
+/**
+ * struct sof_vfe_ipc_power_req - power status change IPC
+ * @hdr:	the standard SOF IPC header
+ * @power:	1: on, 0: off
+ */
+struct sof_vfe_ipc_power_req {
+	struct sof_ipc_cmd_hdr hdr;
+	uint32_t power;
+} __packed;
+
+enum sof_virtio_ipc_reset_status {
+	SOF_VIRTIO_IPC_RESET_NONE,	/* Host hasn't been reset */
+	SOF_VIRTIO_IPC_RESET_DONE,	/* Host has been reset */
+};
+
+/**
+ * struct sof_vfe_ipc_power_resp - response to a power status request
+ * @reply:	the standard SOF IPC response header
+ * @reset_status: enum sof_virtio_ipc_reset_status
+ */
+struct sof_vfe_ipc_power_resp {
+	struct sof_ipc_reply reply;
+	uint32_t reset_status;
+} __packed;
+
+#define SOF_VFE_MAX_DATA_SIZE (16 * 1024)
+
+/**
+ * struct dsp_sof_data_req - Audio data request
+ *
+ * @size:	the size of audio data sent or requested, excluding the header
+ * @offset:	offset in the DMA buffer
+ * @comp_id:	component ID, used to identify the stream
+ * @data:	audio data
+ *
+ * When used during playback, the data array actually contains audio data, when
+ * used for capture, the data part isn't sent.
+ */
+struct dsp_sof_data_req {
+	u32 size;
+	u32 offset;
+	u32 comp_id;
+	/* Only included for playback */
+	u8 data[SOF_VFE_MAX_DATA_SIZE];
+} __packed;
+
+/**
+ * struct dsp_sof_data_resp - Audio data response
+ *
+ * @size:	the size of audio data sent, excluding the header
+ * @error:	response error
+ * @data:	audio data
+ *
+ * When used during capture, the data array actually contains audio data, when
+ * used for playback, the data part isn't sent.
+ */
+struct dsp_sof_data_resp {
+	u32 size;
+	u32 error;
+	/* Only included for capture */
+	u8 data[SOF_VFE_MAX_DATA_SIZE];
+} __packed;
+
+#define HDR_SIZE_REQ offsetof(struct dsp_sof_data_req, data)
+#define HDR_SIZE_RESP offsetof(struct dsp_sof_data_resp, data)
+
+#endif
diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
index 585e07b..0a15aa6 100644
--- a/include/uapi/linux/virtio_ids.h
+++ b/include/uapi/linux/virtio_ids.h
@@ -46,5 +46,6 @@
 #define VIRTIO_ID_IOMMU        23 /* virtio IOMMU */
 #define VIRTIO_ID_FS           26 /* virtio filesystem */
 #define VIRTIO_ID_PMEM         27 /* virtio pmem */
+#define VIRTIO_ID_ADSP         28 /* virtio AudioDSP */
 
 #endif /* _LINUX_VIRTIO_IDS_H */
diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 4dda4b6..e96d8ff 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -96,6 +96,13 @@ config SND_SOC_SOF_STRICT_ABI_CHECKS
 	  If you are not involved in SOF releases and CI development
 	  select "N".
 
+config SND_SOC_SOF_VIRTIO_FE
+	bool "SOF VirtIO guest role"
+	depends on SND_SOC_SOF_NOCODEC_SUPPORT
+	depends on VIRTIO
+	---help---
+	  Enable SOF for a VirtIO based guest configuration.
+
 config SND_SOC_SOF_DEBUG
 	bool "SOF debugging features"
 	help
diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 8eca2f8..b728d09 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -10,6 +10,10 @@ snd-sof-of-objs := sof-of-dev.o
 
 snd-sof-nocodec-objs := nocodec.o
 
+ifdef CONFIG_SND_SOC_SOF_VIRTIO_FE
+snd-sof-objs += virtio-fe.o
+endif
+
 obj-$(CONFIG_SND_SOC_SOF) += snd-sof.o
 obj-$(CONFIG_SND_SOC_SOF_NOCODEC) += snd-sof-nocodec.o
 
diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 42dd72e..d0bf082 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -178,7 +178,8 @@ static int sof_load_and_run_firmware(struct snd_sof_dev *sdev)
 	return 0;
 
 fw_run_err:
-	snd_sof_fw_unload(sdev);
+	if (!sdev->pdata->vfe)
+		snd_sof_fw_unload(sdev);
 
 	return ret;
 }
@@ -228,9 +229,12 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 		goto ipc_err;
 	}
 
-	ret = sof_load_and_run_firmware(sdev);
-	if (ret < 0)
-		goto fw_load_err;
+	/* virtio front-end mode will not touch HW, skip fw loading */
+	if (!plat_data->vfe) {
+		ret = sof_load_and_run_firmware(sdev);
+		if (ret < 0)
+			goto fw_load_err;
+	}
 
 	/* hereafter all FW boot flows are for PM reasons */
 	sdev->first_boot = false;
@@ -264,7 +268,8 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 
 fw_trace_err:
 	snd_sof_free_trace(sdev);
-	snd_sof_fw_unload(sdev);
+	if (!sdev->pdata->vfe)
+		snd_sof_fw_unload(sdev);
 fw_load_err:
 	snd_sof_ipc_free(sdev);
 ipc_err:
@@ -362,10 +367,12 @@ int snd_sof_device_remove(struct device *dev)
 		cancel_work_sync(&sdev->probe_work);
 
 	if (sdev->fw_state > SOF_FW_BOOT_NOT_STARTED) {
-		snd_sof_fw_unload(sdev);
+		if (!pdata->vfe) {
+			snd_sof_fw_unload(sdev);
+			snd_sof_free_trace(sdev);
+		}
 		snd_sof_ipc_free(sdev);
 		snd_sof_free_debug(sdev);
-		snd_sof_free_trace(sdev);
 	}
 
 	/*
@@ -384,9 +391,11 @@ int snd_sof_device_remove(struct device *dev)
 	if (sdev->fw_state > SOF_FW_BOOT_NOT_STARTED)
 		snd_sof_remove(sdev);
 
-	/* release firmware */
-	release_firmware(pdata->fw);
-	pdata->fw = NULL;
+	if (!pdata->vfe) {
+		/* release firmware */
+		release_firmware(pdata->fw);
+		pdata->fw = NULL;
+	}
 
 	return 0;
 }
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index b0b38ca..8f52de0 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -25,18 +25,6 @@
  * IPC message Tx/Rx message handling.
  */
 
-/* SOF generic IPC data */
-struct snd_sof_ipc {
-	struct snd_sof_dev *sdev;
-
-	/* protects messages and the disable flag */
-	struct mutex tx_mutex;
-	/* disables further sending of ipc's */
-	bool disable_ipc_tx;
-
-	struct snd_sof_ipc_msg msg;
-};
-
 struct sof_ipc_ctrl_data_params {
 	size_t msg_bytes;
 	size_t hdr_bytes;
@@ -84,6 +72,10 @@ static void ipc_log_header(struct device *dev, u8 *text, u32 cmd)
 			str2 = "BUFFER_NEW"; break;
 		case SOF_IPC_TPLG_BUFFER_FREE:
 			str2 = "BUFFER_FREE"; break;
+		case SOF_IPC_TPLG_VFE_GET:
+			str2 = "VFE_GET"; break;
+		case SOF_IPC_TPLG_VFE_COMP_ID:
+			str2 = "VFE_COMP_ID"; break;
 		default:
 			str2 = "unknown type"; break;
 		}
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index cd77796..3005315 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -677,6 +677,13 @@ static int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 		return -EINVAL;
 	}
 
+	/* VirtIO guests have no .dai_config, DAIs are configured by the host */
+	if (!dai->dai_config) {
+		dev_dbg(component->dev, "no DAI config for %s!\n",
+			rtd->dai_link->name);
+		return 0;
+	}
+
 	/* read rate and channels from topology */
 	switch (dai->dai_config->type) {
 	case SOF_DAI_INTEL_SSP:
@@ -783,6 +790,8 @@ void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
 	pd->hw_free = sof_pcm_hw_free;
 	pd->trigger = sof_pcm_trigger;
 	pd->pointer = sof_pcm_pointer;
+	if (plat_data->vfe)
+		pd->copy_user = sof_vfe_pcm_copy_user;
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
 	pd->compr_ops = &sof_compressed_ops;
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 9695107..861c91e 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -55,6 +55,9 @@
 	(IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE) || \
 	 IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST))
 
+/* The maximum number of components a virtio user vFE driver can use */
+#define SOF_VIRTIO_MAX_UOS_COMPS	1000
+
 /* DSP power state */
 enum sof_dsp_power_states {
 	SOF_DSP_PM_D0,
@@ -250,6 +253,10 @@ struct snd_sof_dsp_ops {
 	void (*set_mach_params)(const struct snd_soc_acpi_mach *mach,
 				struct device *dev); /* optional */
 
+	/* VirtIO operations */
+	int (*request_topology)(struct snd_sof_dev *sdev,
+				struct firmware *fw); /* optional */
+
 	/* DAI ops */
 	struct snd_soc_dai_driver *drv;
 	int num_drv;
@@ -450,6 +457,18 @@ struct snd_sof_dev {
 	void *private;			/* core does not touch this */
 };
 
+/* SOF generic IPC data */
+struct snd_sof_ipc {
+	struct snd_sof_dev *sdev;
+
+	/* protects messages and the disable flag */
+	struct mutex tx_mutex;
+	/* disables further sending of ipc's */
+	bool disable_ipc_tx;
+
+	struct snd_sof_ipc_msg msg;
+};
+
 /*
  * Device Level.
  */
@@ -531,10 +550,20 @@ void snd_sof_get_status(struct snd_sof_dev *sdev, u32 panic_code,
 int snd_sof_init_trace_ipc(struct snd_sof_dev *sdev);
 void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev);
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_VIRTIO_FE)
+int sof_vfe_pcm_copy_user(struct snd_soc_component *component,
+			  struct snd_pcm_substream *substream, int channel,
+			  unsigned long pos, void __user *buf,
+			  unsigned long bytes);
+#else
+#define sof_vfe_pcm_copy_user NULL
+#endif
+
 /*
  * Platform specific ops.
  */
 extern struct snd_compr_ops sof_compressed_ops;
+extern struct snd_sof_dsp_ops snd_sof_virtio_fe_ops;
 
 /*
  * DSP Architectures.
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 16ee748..e6e435f 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1296,7 +1296,8 @@ static int sof_widget_load_dai(struct snd_soc_component *scomp, int index,
 	comp_dai.comp.hdr.size = sizeof(comp_dai);
 	comp_dai.comp.hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_COMP_NEW;
 	comp_dai.comp.id = swidget->comp_id;
-	comp_dai.comp.type = SOF_COMP_DAI;
+	comp_dai.comp.type = sdev->pdata->vfe ? SOF_COMP_VIRT_CON :
+		SOF_COMP_DAI;
 	comp_dai.comp.pipeline_id = index;
 	comp_dai.config.hdr.size = sizeof(comp_dai.config);
 
@@ -3614,12 +3615,21 @@ static int sof_manifest(struct snd_soc_component *scomp, int index,
 
 int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 {
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct firmware vfe_fw;
 	const struct firmware *fw;
 	int ret;
 
 	dev_dbg(scomp->dev, "loading topology:%s\n", file);
 
-	ret = request_firmware(&fw, file, scomp->dev);
+	/* VirtIO guests request topology from the host */
+	if (sdev->pdata->vfe) {
+		fw = &vfe_fw;
+		ret = sof_ops(sdev)->request_topology(sdev, file, &vfe_fw);
+	} else {
+		ret = request_firmware(&fw, file, sdev->dev);
+	}
+
 	if (ret < 0) {
 		dev_err(scomp->dev, "error: tplg request firmware %s failed err: %d\n",
 			file, ret);
@@ -3635,7 +3645,9 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
 		ret = -EINVAL;
 	}
 
-	release_firmware(fw);
+	if (!sdev->pdata->vfe)
+		release_firmware(fw);
+
 	return ret;
 }
 EXPORT_SYMBOL(snd_sof_load_topology);
diff --git a/sound/soc/sof/virtio-fe.c b/sound/soc/sof/virtio-fe.c
new file mode 100644
index 00000000..aa6da81
--- /dev/null
+++ b/sound/soc/sof/virtio-fe.c
@@ -0,0 +1,891 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Copyright(c) 2017-2020 Intel Corporation. All rights reserved.
+ *
+ * Author:	Libin Yang <libin.yang@intel.com>
+ *		Luo Xionghu <xionghu.luo@intel.com>
+ *		Liam Girdwood <liam.r.girdwood@linux.intel.com>
+ *		Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
+ */
+
+/*
+ * VirtIO Front-End (VFE) driver
+ *
+ * This driver presents a virtualised DSP interface to SOF. It implements an
+ * instance of SOF operations, which instead of providing means of communication
+ * with a physical DSP, communicate with the SOF driver, running in the host OS.
+ * This communication takes place over 3 VirtQueues: control, data, and position
+ * update. The control queue uses the SOF IPC message format, which make it
+ * possible for most messages to be passed 1-to-1 to the physical DSP on the
+ * host. The data and the position update queues should in the future be
+ * replaced with 0-copy buffer sharing.
+ */
+
+#include <linux/completion.h>
+#include <linux/device.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/scatterlist.h>
+#include <linux/virtio.h>
+#include <linux/virtio_config.h>
+#include <linux/virtio_ids.h>
+#include <linux/virtio_ring.h>
+#include <sound/sof.h>
+#include <sound/sof/virtio.h>
+
+#include "ops.h"
+#include "sof-audio.h"
+#include "sof-priv.h"
+
+/* 600ms for VirtQ IPC */
+#define SOF_VFE_DATA_TIMEOUT_MS 600
+
+static const char *const sof_vq_names[SOF_VIRTIO_NUM_OF_VQS] = {
+	SOF_VIRTIO_IPC_CMD_VQ_NAME,
+	SOF_VIRTIO_POSN_VQ_NAME,
+	SOF_VIRTIO_DATA_VQ_NAME,
+};
+
+struct sof_vfe {
+	struct snd_sof_dev *sdev;
+
+	/* IPC cmd from frontend to backend */
+	struct virtqueue *ipc_cmd_vq;
+
+	/* IPC position update from backend to frontend */
+	struct virtqueue *posn_vq;
+
+	/* audio data in both directions */
+	struct virtqueue *data_vq;
+
+	/* position update work */
+	struct work_struct posn_update_work;
+
+	/* current pending cmd message */
+	struct snd_sof_ipc_msg *msg;
+
+	/* current and pending notification */
+	struct snd_sof_ipc_msg *not;
+	struct sof_ipc_stream_posn posn;
+
+	/*
+	 * IPC messages are blocked. "true" if the DSP hasn't been reset and
+	 * therefore we don't have to re-send our topology.
+	 */
+	bool block_ipc;
+	struct sof_vfe_ipc_tplg_resp tplg;
+
+	struct completion completion;
+	spinlock_t vq_lock;
+
+	/* A shared capture / playback virtual queue data buffer */
+	union {
+		struct dsp_sof_data_req data_req;
+		struct dsp_sof_data_resp data_resp;
+	};
+
+	/* Headers, used as a playback response or capture request */
+	union {
+		u8 hdr_req[HDR_SIZE_REQ];
+		u8 hdr_resp[HDR_SIZE_RESP];
+	};
+};
+
+/* Firmware ready IPC. */
+static int sof_vfe_fw_ready(struct snd_sof_dev *sdev, u32 msg_id)
+{
+	return 0;
+};
+
+/* Send IPC to vBE */
+static int sof_vfe_send_msg(struct snd_sof_dev *sdev,
+			    struct snd_sof_ipc_msg *msg)
+{
+	struct sof_vfe *vfe = sdev->pdata->vfe;
+	struct scatterlist sg_out, sg_in;
+	struct scatterlist *sgs[] = {&sg_out, &sg_in};
+	size_t msg_size = msg->msg_size;
+	void *msg_data = msg->msg_data;
+	struct device *dev = sdev->dev;
+	int ret;
+
+	if (vfe->block_ipc) {
+		struct sof_ipc_reply *reply = msg->reply_data;
+
+		reply->error = 0;
+		msg->reply_error = reply->error;
+		/*
+		 * No need to take .ipc_lock: we return > 0, so
+		 * sof_ipc_tx_message_unlocked() won't overwrite .ipc_complete
+		 */
+		msg->ipc_complete = true;
+		wake_up(&msg->waitq);
+
+		return 1;
+	}
+
+	/* Prepare and add 1 SG array for each of request and response */
+	sg_init_one(&sg_out, msg_data, msg_size);
+	sg_init_one(&sg_in, msg->reply_data, msg->reply_size);
+
+	/* Called under spin_lock_irq() in sof_ipc_tx_message_unlocked() */
+	ret = virtqueue_add_sgs(vfe->ipc_cmd_vq, sgs, 1, 1, msg_data,
+				GFP_ATOMIC);
+	if (ret < 0) {
+		dev_err(dev, "error: could not send IPC %d\n", ret);
+		return ret;
+	}
+
+	vfe->msg = msg;
+
+	/* Notify the host */
+	if (!virtqueue_kick(vfe->ipc_cmd_vq)) {
+		dev_err(dev, "error: IPC failed to kick host\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+/* Handle playback or capture data */
+static void sof_vfe_handle_data(struct virtqueue *vq)
+{
+	struct sof_vfe *vfe = vq->vdev->priv;
+
+	complete(&vfe->completion);
+}
+
+/* IPC message sending completed. This means vBE has received the cmd */
+static void sof_vfe_cmd_tx_done(struct virtqueue *vq)
+{
+	struct sof_vfe *vfe = vq->vdev->priv;
+	struct snd_sof_dev *sdev = vfe->sdev;
+
+	do {
+		struct snd_sof_ipc_msg *msg = vfe->msg;
+		struct sof_ipc_reply *reply = msg->reply_data;
+		unsigned int len;
+
+		/* Callbacks must be disabled when reading from a VirtQ */
+		virtqueue_disable_cb(vq);
+
+		spin_lock(&vfe->vq_lock);
+		/*
+		 * virtqueue_get_buf() returns the "token" that was provided to
+		 * virtqueue_add_*() functions
+		 */
+		while (virtqueue_get_buf(vq, &len)) {
+			unsigned long flags;
+			msg->reply_error = reply->error;
+
+			/* Firmware panic? */
+			if (msg->reply_error == -ENODEV)
+				sdev->ipc->disable_ipc_tx = true;
+
+			spin_lock_irqsave(&sdev->ipc_lock, flags);
+			msg->ipc_complete = true;
+			wake_up(&msg->waitq);
+			spin_unlock_irqrestore(&sdev->ipc_lock, flags);
+		}
+		spin_unlock(&vfe->vq_lock);
+	} while (!virtqueue_enable_cb(vq));
+}
+
+/* The high latency version, using VirtQueues */
+static void sof_vfe_posn_update(struct work_struct *work)
+{
+	struct sof_vfe *vfe = container_of(work, struct sof_vfe,
+					   posn_update_work);
+	struct sof_ipc_stream_posn *posn = &vfe->posn;
+	struct virtqueue *vq = vfe->posn_vq;
+	struct snd_sof_dev *sdev = vfe->sdev;
+	struct snd_sof_pcm *spcm;
+	struct scatterlist sg;
+	unsigned int buflen;
+	int direction;
+
+	/* virtio protects against re-entry */
+	while (virtqueue_get_buf(vq, &buflen)) {
+		spcm = snd_sof_find_spcm_comp(sdev->component, posn->comp_id,
+					      &direction);
+		if (!spcm) {
+			dev_err(sdev->dev,
+				"err: period elapsed for unused component %d\n",
+				posn->comp_id);
+		} else {
+			/*
+			 * The position update requirement is valid.
+			 * Let's update the position now.
+			 */
+			memcpy(&spcm->stream[direction].posn, posn, sizeof(*posn));
+			snd_pcm_period_elapsed(spcm->stream[direction].substream);
+		}
+
+		/* kick back the empty posn buffer immediately */
+		sg_init_one(&sg, posn, sizeof(*posn));
+		virtqueue_add_inbuf(vq, &sg, 1, posn, GFP_KERNEL);
+		if (!virtqueue_kick(vq))
+			dev_err(sdev->dev,
+				"error: position update failed to kick host\n");
+	}
+}
+
+/*
+ * handle the position update, receive the posn and send to up layer, then
+ * resend the buffer to BE
+ */
+static void sof_vfe_posn_handle_rx(struct virtqueue *vq)
+{
+	struct sof_vfe *vfe = vq->vdev->priv;
+
+	schedule_work(&vfe->posn_update_work);
+}
+
+static int sof_vfe_register(struct snd_sof_dev *sdev)
+{
+	sdev->pdata->vfe->sdev = sdev;
+	sdev->next_comp_id = SOF_VIRTIO_MAX_UOS_COMPS;
+
+	return 0;
+}
+
+/* Some struct snd_sof_dsp_ops operations are compulsory, but unused by vFE */
+static int sof_vfe_deregister(struct snd_sof_dev *sdev)
+{
+	return 0;
+}
+
+static int sof_vfe_run(struct snd_sof_dev *sdev)
+{
+	return 0;
+}
+
+static void sof_vfe_block_read(struct snd_sof_dev *sdev, u32 bar,
+			       u32 offset, void *dest,
+			       size_t size)
+{
+}
+
+static void sof_vfe_block_write(struct snd_sof_dev *sdev, u32 bar,
+				u32 offset, void *src,
+				size_t size)
+{
+}
+
+static int sof_vfe_load_firmware(struct snd_sof_dev *sdev)
+{
+	return 0;
+}
+
+static void sof_vfe_ipc_msg_data(struct snd_sof_dev *sdev,
+				 struct snd_pcm_substream *substream,
+				 void *p, size_t sz)
+{
+}
+
+static int sof_vfe_ipc_pcm_params(struct snd_sof_dev *sdev,
+				  struct snd_pcm_substream *substream,
+				  const struct sof_ipc_pcm_params_reply *reply)
+{
+	return 0;
+}
+
+static int sof_vfe_sof_runtime_dummy(struct snd_sof_dev *sdev)
+{
+	return 0;
+}
+
+/* Pre-queue a position update buffer. */
+static int sof_vfe_prequeue_position(struct snd_sof_dev *sdev)
+{
+	struct sof_vfe *vfe = sdev->pdata->vfe;
+	struct scatterlist sg_in;
+	int ret;
+
+	sg_init_one(&sg_in, &vfe->posn, sizeof(vfe->posn));
+	/* Only 1 input buffer, no output buffers */
+	ret = virtqueue_add_inbuf(vfe->posn_vq, &sg_in, 1, &vfe->posn,
+				  GFP_KERNEL);
+	if (ret < 0) {
+		dev_err(sdev->dev, "%s(): failed %d to add a buffer\n",
+			__func__, ret);
+		return ret;
+	}
+
+	/* Send the buffer */
+	if (!virtqueue_kick(vfe->posn_vq)) {
+		dev_err(sdev->dev,
+			"error: position update failed to kick host\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int sof_vfe_request_topology(struct snd_sof_dev *sdev,
+				    struct firmware *fw)
+{
+	struct sof_vfe_ipc_tplg_req rq = {
+		.hdr = {
+			.size = sizeof(rq),
+			.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_VFE_GET,
+		},
+	};
+	struct sof_vfe_ipc_tplg_resp *partdata = kmalloc(SOF_IPC_MSG_MAX_SIZE,
+							 GFP_KERNEL);
+	size_t part_size = SOF_IPC_MSG_MAX_SIZE - sizeof(partdata->reply),
+		data_size = 0, to_copy = 0;
+	struct sof_vfe *vfe = sdev->pdata->vfe;
+	struct device *dev = sdev->dev;
+	int ret;
+
+	if (!partdata)
+		return -ENOMEM;
+
+	mutex_lock(&sdev->ipc->tx_mutex);
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev,
+			"Cannot resume VFE sof-audio device. Error %d\n", ret);
+		return ret;
+	}
+
+	do {
+		ret = sof_ipc_tx_message_unlocked(sdev->ipc, rq.hdr.cmd,
+						  &rq, sizeof(rq), partdata,
+						  SOF_IPC_MSG_MAX_SIZE);
+		if (ret < 0)
+			goto free;
+
+		if (partdata->reply.hdr.size <= sizeof(partdata->reply)) {
+			ret = -EINVAL;
+			goto free;
+		}
+
+		if (data_size && data_size - to_copy !=
+		    partdata->reply.hdr.size - sizeof(partdata->reply)) {
+			ret = -EINVAL;
+			goto free;
+		}
+
+		/*
+		 * Size is consistent and decreasing, we're guaranteed to exit
+		 * this loop eventually
+		 */
+		data_size = partdata->reply.hdr.size - sizeof(partdata->reply);
+		to_copy = min_t(size_t, data_size, part_size);
+		memcpy(vfe->tplg.data + rq.offset, partdata->data, to_copy);
+		if (!rq.offset)
+			fw->size = data_size;
+		rq.offset += part_size;
+	} while (data_size > part_size);
+
+	/* Get our first component ID */
+	rq.hdr.cmd = SOF_IPC_GLB_TPLG_MSG | SOF_IPC_TPLG_VFE_COMP_ID;
+	rq.hdr.size = sizeof(rq.hdr);
+	ret = sof_ipc_tx_message_unlocked(sdev->ipc, rq.hdr.cmd,
+					  &rq, rq.hdr.size, partdata,
+					  sizeof(partdata->reply) + sizeof(u32));
+	if (ret < 0)
+		goto free;
+
+	sdev->next_comp_id = *(u32 *)partdata->data;
+
+	fw->data = vfe->tplg.data;
+	fw->pages = NULL;
+
+	ret = sof_vfe_prequeue_position(sdev);
+
+free:
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	mutex_unlock(&sdev->ipc->tx_mutex);
+
+	kfree(partdata);
+
+	return ret;
+}
+
+static unsigned long get_dma_offset(struct snd_pcm_runtime *runtime,
+				    int channel, unsigned long hwoff)
+{
+	return hwoff + channel * (runtime->dma_bytes / runtime->channels);
+}
+
+static int sof_vfe_pcm_read_part(struct snd_sof_dev *sdev,
+				 struct snd_sof_pcm *spcm,
+				 struct snd_pcm_substream *substream,
+				 int channel, unsigned long posn,
+				 void __user *buf, unsigned long chunk_size)
+{
+	struct sof_vfe *vfe = sdev->pdata->vfe;
+	struct dsp_sof_data_resp *data = &vfe->data_resp;
+	struct scatterlist sg_out, sg_in, *sgs[] = {&sg_out, &sg_in};
+	struct dsp_sof_data_req *req = (struct dsp_sof_data_req *)vfe->hdr_req;
+	unsigned int len;
+	int ret;
+
+	/* put response size in request */
+	req->size = chunk_size;
+	req->comp_id = spcm->stream[substream->stream].comp_id;
+	req->offset = get_dma_offset(substream->runtime, channel, posn);
+
+	/* Add input and output buffers */
+	sg_init_one(&sg_out, vfe->hdr_req, sizeof(vfe->hdr_req));
+	sg_init_one(&sg_in, data, chunk_size + HDR_SIZE_RESP);
+
+	ret = virtqueue_add_sgs(vfe->data_vq, sgs, 1, 1, vfe->hdr_req,
+				GFP_KERNEL);
+	if (ret < 0)
+		dev_err(sdev->dev, "error: could not send data %d\n", ret);
+
+	/* Kick the host */
+	if (!virtqueue_kick(vfe->data_vq)) {
+		dev_err(sdev->dev, "error: data failed to kick host\n");
+		return -EIO;
+	}
+
+	ret = wait_for_completion_timeout(&vfe->completion,
+				msecs_to_jiffies(SOF_VFE_DATA_TIMEOUT_MS));
+	if (!ret)
+		return -ETIMEDOUT;
+
+	/* Get a response with disabled callbacks */
+	virtqueue_disable_cb(vfe->data_vq);
+
+	spin_lock(&vfe->vq_lock);
+	virtqueue_get_buf(vfe->data_vq, &len);
+	spin_unlock(&vfe->vq_lock);
+
+	virtqueue_enable_cb(vfe->data_vq);
+
+	if (ret < 0)
+		return ret;
+	if (data->error < 0)
+		return data->error;
+
+	if (copy_to_user(buf, data->data, chunk_size))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int sof_vfe_pcm_write_part(struct snd_sof_dev *sdev,
+				  struct snd_sof_pcm *spcm,
+				  struct snd_pcm_substream *substream,
+				  int channel, unsigned long posn,
+				  void __user *buf, unsigned long chunk_size)
+{
+	struct sof_vfe *vfe = sdev->pdata->vfe;
+	struct dsp_sof_data_req *data = &vfe->data_req;
+	struct scatterlist sg_out, sg_in, *sgs[] = {&sg_out, &sg_in};
+	struct dsp_sof_data_resp *resp = (struct dsp_sof_data_resp *)vfe->hdr_resp;
+	unsigned int len;
+	int ret;
+
+	data->size = chunk_size;
+	data->comp_id = spcm->stream[substream->stream].comp_id;
+	data->offset = get_dma_offset(substream->runtime, channel, posn);
+
+	if (copy_from_user(data->data, buf, chunk_size))
+		return -EFAULT;
+
+	/* Similar to the capture case above */
+	sg_init_one(&sg_out, data, chunk_size + HDR_SIZE_REQ);
+	sg_init_one(&sg_in, vfe->hdr_resp, sizeof(vfe->hdr_resp));
+
+	ret = virtqueue_add_sgs(vfe->data_vq, sgs, 1, 1, vfe->hdr_resp,
+				GFP_KERNEL);
+	if (ret < 0)
+		dev_err(sdev->dev, "error: could not send data %d\n", ret);
+
+	if (!virtqueue_kick(vfe->data_vq)) {
+		dev_err(sdev->dev, "error: data failed to kick host\n");
+		return -EIO;
+	}
+
+	ret = wait_for_completion_timeout(&vfe->completion,
+				msecs_to_jiffies(SOF_VFE_DATA_TIMEOUT_MS));
+	if (!ret)
+		return -ETIMEDOUT;
+
+	virtqueue_disable_cb(vfe->data_vq);
+
+	spin_lock(&vfe->vq_lock);
+	virtqueue_get_buf(vfe->data_vq, &len);
+	spin_unlock(&vfe->vq_lock);
+
+	virtqueue_enable_cb(vfe->data_vq);
+
+	return ret < 0 ? ret : resp->error;
+}
+
+/* The slow version, using VirtQueues for playback and capture data */
+int sof_vfe_pcm_copy_user(struct snd_soc_component *component,
+			  struct snd_pcm_substream *substream, int channel,
+			  unsigned long posn, void __user *buf,
+			  unsigned long bytes)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct snd_sof_pcm *spcm = snd_sof_find_spcm_dai(sdev->component, rtd);
+	unsigned int i, n = (bytes + SOF_VFE_MAX_DATA_SIZE - 1) /
+		SOF_VFE_MAX_DATA_SIZE;
+	int ret = 0;
+
+	if (!spcm || spcm->scomp != sdev->component) {
+		dev_err(sdev->dev, "%s(): invalid SPCM 0x%p!\n", __func__,
+			spcm);
+		return -ENODEV;
+	}
+
+	mutex_lock(&sdev->ipc->tx_mutex);
+
+	for (i = 0; i < n; i++) {
+		size_t n_bytes = i == n - 1 ? bytes % SOF_VFE_MAX_DATA_SIZE :
+			SOF_VFE_MAX_DATA_SIZE;
+
+		reinit_completion(&sdev->pdata->vfe->completion);
+
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			ret = sof_vfe_pcm_write_part(sdev, spcm, substream,
+						channel, posn, buf, n_bytes);
+		else
+			ret = sof_vfe_pcm_read_part(sdev, spcm, substream,
+						channel, posn, buf, n_bytes);
+
+		if (ret < 0)
+			break;
+
+		buf += n_bytes;
+		posn += n_bytes;
+	}
+
+	mutex_unlock(&sdev->ipc->tx_mutex);
+
+	return ret;
+}
+
+#define SOF_VFE_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE | \
+			 SNDRV_PCM_FMTBIT_S32_LE)
+
+struct snd_soc_dai_driver virtio_dai[] = {
+	{
+		.name = "VirtIO DAI",
+		.playback = SOF_DAI_STREAM("playback", 1, 8,
+				SNDRV_PCM_RATE_8000_192000, SOF_VFE_FORMATS),
+		.capture = SOF_DAI_STREAM("capture", 1, 8,
+				SNDRV_PCM_RATE_8000_192000, SOF_VFE_FORMATS),
+	},
+};
+
+static int sof_vfe_pcm_open(struct snd_sof_dev *sdev,
+			    struct snd_pcm_substream *substream)
+{
+	int ret = pm_runtime_get_sync(sdev->dev);
+	if (ret < 0)
+		dev_err(sdev->dev,
+			"Cannot resume VFE sof-audio device. Error %d\n", ret);
+
+	return ret;
+}
+
+static int sof_vfe_pcm_close(struct snd_sof_dev *sdev,
+			     struct snd_pcm_substream *substream)
+{
+	pm_runtime_mark_last_busy(sdev->dev);
+	pm_runtime_put_autosuspend(sdev->dev);
+
+	return 0;
+}
+
+/* virtio fe ops */
+struct snd_sof_dsp_ops snd_sof_vfe_ops = {
+	/* device init */
+	.probe		= sof_vfe_register,
+	.remove		= sof_vfe_deregister,
+
+	/*
+	 * PM: these are never called, they are only needed to prevent core.c
+	 * from disabling runtime PM
+	 */
+	.runtime_suspend = sof_vfe_sof_runtime_dummy,
+	.runtime_resume = sof_vfe_sof_runtime_dummy,
+
+	/* IPC */
+	.send_msg	= sof_vfe_send_msg,
+	.fw_ready	= sof_vfe_fw_ready,
+
+	/* machine driver */
+	.machine_register = sof_machine_register,
+	.machine_unregister = sof_machine_unregister,
+
+	/* DAI drivers */
+	.drv		= virtio_dai,
+	.num_drv	= 1,
+
+	.pcm_open	= sof_vfe_pcm_open,
+	.pcm_close	= sof_vfe_pcm_close,
+
+	.run		= sof_vfe_run,
+	.block_read	= sof_vfe_block_read,
+	.block_write	= sof_vfe_block_write,
+	.load_firmware	= sof_vfe_load_firmware,
+	.ipc_msg_data	= sof_vfe_ipc_msg_data,
+	.ipc_pcm_params	= sof_vfe_ipc_pcm_params,
+
+	.request_topology = sof_vfe_request_topology,
+
+	.hw_info	= SNDRV_PCM_INFO_INTERLEAVED,
+};
+
+static const struct sof_dev_desc virt_desc = {
+	.nocodec_tplg_filename	= "",
+	.default_tplg_path	= "",
+	.resindex_lpe_base	= -1,
+	.resindex_pcicfg_base	= -1,
+	.resindex_imr_base	= -1,
+	.irqindex_host_ipc	= -1,
+	.resindex_dma_base	= -1,
+	.ipc_timeout		= SOF_VFE_DATA_TIMEOUT_MS,
+	.ops			= &snd_sof_vfe_ops,
+};
+
+static void sof_virtio_vfe_init(struct snd_sof_dev *sdev,
+				struct sof_vfe *vfe)
+{
+	/*
+	 * Currently we only support one VM. comp_id from 0 to
+	 * SOF_VIRTIO_MAX_UOS_COMPS - 1 is for the host. Other comp_id numbers
+	 * are for VM1.
+	 * This will be overwritten during topology setup.
+	 */
+	sdev->next_comp_id = SOF_VIRTIO_MAX_UOS_COMPS;
+	vfe->sdev = sdev;
+}
+
+static int sof_vfe_init(struct virtio_device *vdev)
+{
+	struct device *dev = &vdev->dev;
+	struct snd_soc_acpi_mach *mach;
+	struct snd_sof_pdata *sof_pdata;
+	int ret;
+
+	sof_pdata = devm_kzalloc(dev, sizeof(*sof_pdata), GFP_KERNEL);
+	if (!sof_pdata)
+		return -ENOMEM;
+
+	mach = devm_kzalloc(dev, sizeof(*mach), GFP_KERNEL);
+	if (!mach)
+		return -ENOMEM;
+
+	mach->drv_name = "sof-nocodec";
+	mach->mach_params.platform = dev_name(dev);
+	sof_pdata->tplg_filename = virt_desc.nocodec_tplg_filename;
+
+	ret = sof_nocodec_setup(dev, &snd_sof_vfe_ops);
+	if (ret < 0)
+		return ret;
+
+	mach->pdata = &snd_sof_vfe_ops;
+
+	sof_pdata->name = dev_name(&vdev->dev);
+	sof_pdata->machine = mach;
+	sof_pdata->desc = &virt_desc;
+	sof_pdata->dev = dev;
+	sof_pdata->vfe = vdev->priv;
+	sof_pdata->tplg_filename_prefix = virt_desc.default_tplg_path;
+
+	/* allow runtime_pm */
+	pm_runtime_set_autosuspend_delay(dev, SND_SOF_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_enable(dev);
+
+	ret = snd_sof_device_probe(dev, sof_pdata);
+	if (ret < 0) {
+		dev_err(dev, "Cannot register VFE sof-audio device. Error %d\n",
+			ret);
+	} else {
+		sof_virtio_vfe_init(dev_get_drvdata(dev), vdev->priv);
+		dev_dbg(dev, "created VFE machine %s\n",
+			dev_name(&sof_pdata->pdev_mach->dev));
+	}
+
+	return ret;
+}
+
+static int sof_vfe_runtime_suspend(struct device *dev)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	struct sof_vfe_ipc_power_req rq = {
+		.hdr = {
+			.size = sizeof(rq),
+			.cmd = SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_VFE_POWER_STATUS,
+		},
+		.power = 0,
+	};
+	struct sof_vfe_ipc_power_resp resp = {.reply.error = 0};
+
+	return sof_ipc_tx_message(sdev->ipc, rq.hdr.cmd, &rq, sizeof(rq),
+				  &resp, sizeof(resp));
+}
+
+static int sof_vfe_runtime_resume(struct device *dev)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	struct sof_vfe *vfe = sdev->pdata->vfe;
+	struct sof_vfe_ipc_power_req rq = {
+		.hdr = {
+			.size = sizeof(rq),
+			.cmd = SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_VFE_POWER_STATUS,
+		},
+		.power = 1,
+	};
+	struct sof_vfe_ipc_power_resp resp = {.reply.error = 0};
+	int ret = sof_ipc_tx_message(sdev->ipc, rq.hdr.cmd, &rq, sizeof(rq),
+				     &resp, sizeof(resp));
+	if (ret < 0)
+		return ret;
+
+	if (resp.reply.error < 0)
+		return resp.reply.error;
+
+	/*
+	 * We are resuming. Check if the host needs the topology. We could in
+	 * principle skip restoring pipelines completely, but it also does
+	 * certain additional things, e.g. setting an enabled core mask
+	 */
+	vfe->block_ipc = resp.reset_status == SOF_VIRTIO_IPC_RESET_NONE;
+
+	/* restore pipelines */
+	ret = sof_restore_pipelines(sdev->dev);
+	if (ret < 0)
+		dev_err(dev,
+			"error: failed to restore pipeline after resume %d\n",
+			ret);
+
+	/* We're done resuming, from now all IPC have to be sent */
+	vfe->block_ipc = false;
+
+	return ret;
+}
+
+/* Probe and remove. */
+static int sof_vfe_probe(struct virtio_device *vdev)
+{
+	struct virtqueue *vqs[SOF_VIRTIO_NUM_OF_VQS];
+	/* the processing callback number must be the same as the vqueues.*/
+	vq_callback_t *cbs[SOF_VIRTIO_NUM_OF_VQS] = {
+		sof_vfe_cmd_tx_done,
+		sof_vfe_posn_handle_rx,
+		sof_vfe_handle_data,
+	};
+	struct device *dev = &vdev->dev;
+	struct sof_vfe *vfe;
+	int ret;
+
+	/*
+	 * The below two shouldn't be necessary, it's done in
+	 * virtio_pci_modern_probe() by calling dma_set_mask_and_coherent()
+	 */
+
+	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(64));
+	if (ret < 0)
+		ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
+	if (ret < 0)
+		dev_warn(dev, "failed to set DMA mask: %d\n", ret);
+
+	vfe = devm_kzalloc(dev, sizeof(*vfe), GFP_KERNEL);
+	if (!vfe)
+		return -ENOMEM;
+
+	vdev->priv = vfe;
+
+	INIT_WORK(&vfe->posn_update_work, sof_vfe_posn_update);
+	init_completion(&vfe->completion);
+	spin_lock_init(&vfe->vq_lock);
+
+	/* create virt queue for vfe to send/receive IPC message. */
+	ret = virtio_find_vqs(vdev, SOF_VIRTIO_NUM_OF_VQS,
+			      vqs, cbs, sof_vq_names, NULL);
+	if (ret) {
+		dev_err(dev, "error: find vqs fail with %d\n", ret);
+		return ret;
+	}
+
+	/* virtques */
+	vfe->ipc_cmd_vq = vqs[SOF_VIRTIO_IPC_CMD_VQ];
+	vfe->posn_vq = vqs[SOF_VIRTIO_POSN_VQ];
+	vfe->data_vq = vqs[SOF_VIRTIO_DATA_VQ];
+
+	virtio_device_ready(vdev);
+
+	ret = sof_vfe_init(vdev);
+	if (ret < 0)
+		goto free_vqs;
+
+	return 0;
+
+free_vqs:
+	vdev->config->del_vqs(vdev);
+
+	return ret;
+}
+
+static void sof_vfe_remove(struct virtio_device *vdev)
+{
+	/* free virtio resurces and unregister device */
+	struct sof_vfe *vfe = vdev->priv;
+
+	sof_vfe_runtime_suspend(&vdev->dev);
+
+	pm_runtime_disable(&vdev->dev);
+
+	vdev->config->reset(vdev);
+	vdev->config->del_vqs(vdev);
+	cancel_work_sync(&vfe->posn_update_work);
+
+	/* unregister the SOF device */
+	snd_sof_device_remove(&vdev->dev);
+
+	/* Detach the possibly pre-queued position update buffers */
+	virtqueue_detach_unused_buf(vfe->posn_vq);
+}
+
+static void virtaudio_config_changed(struct virtio_device *vdev)
+{
+}
+
+/*
+ * Need to patch QEMU to create a virtio audio device, e.g. per
+ * -device virtio-snd-pci,snd=snd0 where Device ID must be
+ * 0x1040 + VIRTIO_ID_ADSP and Vendor ID = PCI_VENDOR_ID_REDHAT_QUMRANET
+ */
+static const struct virtio_device_id id_table[] = {
+	{VIRTIO_ID_ADSP, VIRTIO_DEV_ANY_ID},
+	{0},
+};
+
+static const struct dev_pm_ops sof_vfe_pm = {
+	SET_RUNTIME_PM_OPS(sof_vfe_runtime_suspend, sof_vfe_runtime_resume,
+			   NULL)
+};
+
+static struct virtio_driver sof_vfe_audio_driver = {
+	.driver = {
+		.name	= KBUILD_MODNAME,
+		.owner	= THIS_MODULE,
+		.pm	= &sof_vfe_pm,
+	},
+	.id_table	= id_table,
+	.probe		= sof_vfe_probe,
+	.remove		= sof_vfe_remove,
+	.config_changed	= virtaudio_config_changed,
+};
+
+module_virtio_driver(sof_vfe_audio_driver);
+
+MODULE_DEVICE_TABLE(virtio, id_table);
-- 
1.9.3

