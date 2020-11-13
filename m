Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC512B2066
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Nov 2020 17:27:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE63D1891;
	Fri, 13 Nov 2020 17:26:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE63D1891
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605284824;
	bh=P1xTBOS764nKqmDBPxArUv1iQYfxcMsQ4ZttDq5qOmk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AZbqLqwP8vmzIX1yaEVrU5sl3piTh71pbpgIHoWK5T/1bGjzZSBzEpy7i5ynVRZ/J
	 rQUxA6uu7C17+/agNwDbrk4jy9za9/f9SNVws6ccNES4dPiPuU1rmYYufEHAcatYXO
	 04zSQNO4r9Qc54obcD/gddBmgk9Yxl4kk9T4SA9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E8C3F8051E;
	Fri, 13 Nov 2020 17:22:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E47A6F804E6; Fri, 13 Nov 2020 17:22:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E942AF8020C
 for <alsa-devel@alsa-project.org>; Fri, 13 Nov 2020 17:21:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E942AF8020C
IronPort-SDR: xgPevPL1Y0k+Bkg2ULXDCOrIQ1evxoizDkudf+3vMtVHR9+dOHz5KAdzKOAyT6ZbaSPDMeIRuE
 cPg7LTC8LocQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9804"; a="150344706"
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; d="scan'208";a="150344706"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 08:21:45 -0800
IronPort-SDR: 4RHrIKzeTtC9smTY4rikHb9IM8vl9ZrJ0o9dnyfOq1CvKGq9tglypgPw8MaA7MiWq0SKoketWU
 ZgONovKtoS2Q==
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; d="scan'208";a="366767251"
Received: from dmert-dev.jf.intel.com ([10.166.241.5])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 08:21:45 -0800
From: Dave Ertman <david.m.ertman@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 07/10] ASoC: SOF: sof-client: Add client APIs to access
 probes ops
Date: Fri, 13 Nov 2020 08:18:56 -0800
Message-Id: <20201113161859.1775473-8-david.m.ertman@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201113161859.1775473-1-david.m.ertman@intel.com>
References: <20201113161859.1775473-1-david.m.ertman@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: parav@mellanox.com, tiwai@suse.de, netdev@vger.kernel.org,
 leonro@nvidia.com, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, fred.oh@linux.intel.com,
 linux-rdma@vger.kernel.org, dledford@redhat.com, broonie@kernel.org,
 jgg@nvidia.com, gregkh@linuxfoundation.org, kuba@kernel.org,
 dan.j.williams@intel.com, shiraz.saleem@intel.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org, kiran.patil@intel.com
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add client APIs to invoke the platform-specific DSP probes
ops. Also, add a new API to get the SOF core device pointer
which will be used for DMA buffer allocation.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Tested-by: Fred Oh <fred.oh@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Dave Ertman <david.m.ertman@intel.com>
---
 sound/soc/sof/sof-client.c | 55 ++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-client.h | 25 +++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/sound/soc/sof/sof-client.c b/sound/soc/sof/sof-client.c
index dd75a0ba4c28..838aaa5ea179 100644
--- a/sound/soc/sof/sof-client.c
+++ b/sound/soc/sof/sof-client.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
+#include "ops.h"
 #include "sof-client.h"
 #include "sof-priv.h"
 
@@ -112,4 +113,58 @@ struct dentry *sof_client_get_debugfs_root(struct sof_client_dev *cdev)
 }
 EXPORT_SYMBOL_NS_GPL(sof_client_get_debugfs_root, SND_SOC_SOF_CLIENT);
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES_CLIENT)
+int sof_client_probe_compr_assign(struct sof_client_dev *cdev,
+				  struct snd_compr_stream *cstream,
+				  struct snd_soc_dai *dai)
+{
+	return snd_sof_probe_compr_assign(cdev->sdev, cstream, dai);
+}
+EXPORT_SYMBOL_NS_GPL(sof_client_probe_compr_assign, SND_SOC_SOF_CLIENT);
+
+int sof_client_probe_compr_free(struct sof_client_dev *cdev,
+				struct snd_compr_stream *cstream,
+				struct snd_soc_dai *dai)
+{
+	return snd_sof_probe_compr_free(cdev->sdev, cstream, dai);
+}
+EXPORT_SYMBOL_NS_GPL(sof_client_probe_compr_free, SND_SOC_SOF_CLIENT);
+
+int sof_client_probe_compr_set_params(struct sof_client_dev *cdev,
+				      struct snd_compr_stream *cstream,
+				      struct snd_compr_params *params,
+				      struct snd_soc_dai *dai)
+{
+	return snd_sof_probe_compr_set_params(cdev->sdev, cstream, params, dai);
+}
+EXPORT_SYMBOL_NS_GPL(sof_client_probe_compr_set_params, SND_SOC_SOF_CLIENT);
+
+int sof_client_probe_compr_trigger(struct sof_client_dev *cdev,
+				   struct snd_compr_stream *cstream, int cmd,
+				   struct snd_soc_dai *dai)
+{
+	return snd_sof_probe_compr_trigger(cdev->sdev, cstream, cmd, dai);
+}
+EXPORT_SYMBOL_NS_GPL(sof_client_probe_compr_trigger, SND_SOC_SOF_CLIENT);
+
+int sof_client_probe_compr_pointer(struct sof_client_dev *cdev,
+				   struct snd_compr_stream *cstream,
+				   struct snd_compr_tstamp *tstamp,
+				   struct snd_soc_dai *dai)
+{
+	return snd_sof_probe_compr_pointer(cdev->sdev, cstream, tstamp, dai);
+}
+EXPORT_SYMBOL_NS_GPL(sof_client_probe_compr_pointer, SND_SOC_SOF_CLIENT);
+#endif
+
+/*
+ * DMA buffer alloc fails when using the client device. Use the SOF core device instead.
+ * This will be needed for clients other than the probes client device as well.
+ */
+struct device *sof_client_get_dma_dev(struct sof_client_dev *cdev)
+{
+	return cdev->sdev->dev;
+}
+EXPORT_SYMBOL_NS_GPL(sof_client_get_dma_dev, SND_SOC_SOF_CLIENT);
+
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/sof/sof-client.h b/sound/soc/sof/sof-client.h
index 429282df9f65..be80053068c9 100644
--- a/sound/soc/sof/sof-client.h
+++ b/sound/soc/sof/sof-client.h
@@ -7,6 +7,10 @@
 #include <linux/device.h>
 #include <linux/idr.h>
 #include <linux/list.h>
+#include <sound/compress_offload.h>
+#include <sound/compress_driver.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
 
 #define SOF_CLIENT_PROBE_TIMEOUT_MS 2000
 
@@ -50,6 +54,27 @@ int sof_client_ipc_tx_message(struct sof_client_dev *cdev, u32 header, void *msg
 			      size_t msg_bytes, void *reply_data, size_t reply_bytes);
 
 struct dentry *sof_client_get_debugfs_root(struct sof_client_dev *cdev);
+struct device *sof_client_get_dma_dev(struct sof_client_dev *cdev);
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES_CLIENT)
+int sof_client_probe_compr_assign(struct sof_client_dev *cdev,
+				  struct snd_compr_stream *cstream,
+				  struct snd_soc_dai *dai);
+int sof_client_probe_compr_free(struct sof_client_dev *cdev,
+				struct snd_compr_stream *cstream,
+				struct snd_soc_dai *dai);
+int sof_client_probe_compr_set_params(struct sof_client_dev *cdev,
+				      struct snd_compr_stream *cstream,
+				      struct snd_compr_params *params,
+				      struct snd_soc_dai *dai);
+int sof_client_probe_compr_trigger(struct sof_client_dev *cdev,
+				   struct snd_compr_stream *cstream, int cmd,
+				   struct snd_soc_dai *dai);
+int sof_client_probe_compr_pointer(struct sof_client_dev *cdev,
+				   struct snd_compr_stream *cstream,
+				   struct snd_compr_tstamp *tstamp,
+				   struct snd_soc_dai *dai);
+#endif
 
 /**
  * module_sof_client_driver() - Helper macro for registering an SOF Client
-- 
2.26.2

