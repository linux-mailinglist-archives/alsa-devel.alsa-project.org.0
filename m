Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C3F29681D
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Oct 2020 02:39:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A71FA181E;
	Fri, 23 Oct 2020 02:38:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A71FA181E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603413589;
	bh=P1xTBOS764nKqmDBPxArUv1iQYfxcMsQ4ZttDq5qOmk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ufj83tZ4GtVkrDg1Xop9begrImwfEI9H2yIa95qB4cbz+lu/DyKlj2Whx9CJY8j9e
	 ohIpyHrvPURZ2Ix65nakS8ASRVl4nK6s2FhMLeFAvb+yRHiXY7zNzyRV5YnYY5hjtU
	 /YHTxnVyQHtiQP9/WDcVI3w3bsTsMpc4o57uRg0Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10455F804EB;
	Fri, 23 Oct 2020 02:35:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 564C1F804AD; Fri, 23 Oct 2020 02:35:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CA4DF804A9
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 02:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CA4DF804A9
IronPort-SDR: vN/5B+Ciio7Zf6pUbejzwg6cYRfseeu1xeAGIiwhxD4vyEyipegRsGfX1RjORLojhyhbYMmBNR
 5QeMN54RIX4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="165020489"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="165020489"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 17:35:27 -0700
IronPort-SDR: i7OEA259GyUOowfHePBXVGXg7D8v4EvdiKvZDDeFM1HCojofUBOP9qDO9exRdoVIqiOSHj57M/
 yRuuNOmljpgw==
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="302505820"
Received: from dmert-dev.jf.intel.com ([10.166.241.5])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 17:35:26 -0700
From: Dave Ertman <david.m.ertman@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 07/10] ASoC: SOF: sof-client: Add client APIs to access
 probes ops
Date: Thu, 22 Oct 2020 17:33:35 -0700
Message-Id: <20201023003338.1285642-8-david.m.ertman@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023003338.1285642-1-david.m.ertman@intel.com>
References: <20201023003338.1285642-1-david.m.ertman@intel.com>
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

