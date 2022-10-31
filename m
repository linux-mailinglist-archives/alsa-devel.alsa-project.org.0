Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 065AE613412
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 11:56:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 758AE1669;
	Mon, 31 Oct 2022 11:55:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 758AE1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667213772;
	bh=ssgRJ5P9zURiUYoRFEW3Do8w/ciyrYFvDPm+HkQ52sU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ByiEVupOy7sUB9sWPBRqd69ol3KIJWo6JayQwzTRl/7JI+oj39zwacaK1K0iQJbuY
	 ivH4ueOEjVRIBhIV8rv5qtW25pkyTNWp88LFI6wmbvhGP4DXsSVDJPgiu+Z2JxK02F
	 h3PAWQbS5upeuXSMD65lcTZw7znh5qVvImwie4uU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A41CF80558;
	Mon, 31 Oct 2022 11:54:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DDB3F80557; Mon, 31 Oct 2022 11:54:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40E71F8032B
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 11:54:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40E71F8032B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="B1vhK8hz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667213671; x=1698749671;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ssgRJ5P9zURiUYoRFEW3Do8w/ciyrYFvDPm+HkQ52sU=;
 b=B1vhK8hzgHzmFkoa5Czk7eW+DDMKtTTixGc2lpt/ZBN6oCRzITecZUfw
 qbtyASYVlKFpCK65xuGCIeAP9FfEOkVZiOpIZdC+yDsrctbTY0gQAnQEf
 OehnWcY25H+R6hNVqSJ9w6uc06LqaLXAr9XdJRjshVnCnec5QTx/azfOW
 4xLTMlu3F1oqu97CqihAxrOtPIcHM+uJ2MCoGva+iuUZzYFWREiWOTb9a
 Kliy6ZSWLih7+2d8LcQghunCAoGc4/MJRFlke8CbvvbVrSou6JhsF1bAS
 GcOaD/PAiJh2WJwjYlUJcSuD0Do57DnVCCvB6YfN8xSTYKNISDUzAhV2T A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="308868466"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="308868466"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 03:51:26 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="633488053"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="633488053"
Received: from vbhutani-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.13.109])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 03:51:23 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	jyri.sarha@intel.com
Subject: [PATCH 3/5] ASoC: SOF: client: Add sof_client_ipc_set_get_data()
Date: Mon, 31 Oct 2022 12:51:39 +0200
Message-Id: <20221031105141.19037-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221031105141.19037-1-peter.ujfalusi@linux.intel.com>
References: <20221031105141.19037-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
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

From: Jyri Sarha <jyri.sarha@intel.com>

No need to duplicate set_get_data msg handling in clients.

Signed-off-by: Jyri Sarha <jyri.sarha@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc.c        |  8 ++++++++
 sound/soc/sof/sof-client.c | 19 +++++++++++++++++++
 sound/soc/sof/sof-client.h |  2 ++
 sound/soc/sof/sof-priv.h   |  2 ++
 4 files changed, 31 insertions(+)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 30781e808a02..b53abc923026 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -84,6 +84,14 @@ int sof_ipc_tx_message(struct snd_sof_ipc *ipc, void *msg_data, size_t msg_bytes
 }
 EXPORT_SYMBOL(sof_ipc_tx_message);
 
+/* IPC set or get data from host to DSP */
+int sof_ipc_set_get_data(struct snd_sof_ipc *ipc, void *msg_data,
+			 size_t msg_bytes, bool set)
+{
+	return ipc->ops->set_get_data(ipc->sdev, msg_data, msg_bytes, set);
+}
+EXPORT_SYMBOL(sof_ipc_set_get_data);
+
 /*
  * send IPC message from host to DSP without modifying the DSP state.
  * This will be used for IPC's that can be handled by the DSP
diff --git a/sound/soc/sof/sof-client.c b/sound/soc/sof/sof-client.c
index 125aa2137195..158d2114af45 100644
--- a/sound/soc/sof/sof-client.c
+++ b/sound/soc/sof/sof-client.c
@@ -265,6 +265,25 @@ int sof_client_ipc_tx_message(struct sof_client_dev *cdev, void *ipc_msg,
 }
 EXPORT_SYMBOL_NS_GPL(sof_client_ipc_tx_message, SND_SOC_SOF_CLIENT);
 
+int sof_client_ipc_set_get_data(struct sof_client_dev *cdev, void *ipc_msg,
+				bool set)
+{
+	if (cdev->sdev->pdata->ipc_type == SOF_IPC) {
+		struct sof_ipc_cmd_hdr *hdr = ipc_msg;
+
+		return sof_ipc_set_get_data(cdev->sdev->ipc, ipc_msg, hdr->size,
+					    set);
+	} else if (cdev->sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
+		struct sof_ipc4_msg *msg = ipc_msg;
+
+		return sof_ipc_set_get_data(cdev->sdev->ipc, ipc_msg,
+					    msg->data_size, set);
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_NS_GPL(sof_client_ipc_set_get_data, SND_SOC_SOF_CLIENT);
+
 int sof_suspend_clients(struct snd_sof_dev *sdev, pm_message_t state)
 {
 	struct auxiliary_driver *adrv;
diff --git a/sound/soc/sof/sof-client.h b/sound/soc/sof/sof-client.h
index 46b215d9200f..136edc3744aa 100644
--- a/sound/soc/sof/sof-client.h
+++ b/sound/soc/sof/sof-client.h
@@ -37,6 +37,8 @@ struct sof_client_dev {
 
 int sof_client_ipc_tx_message(struct sof_client_dev *cdev, void *ipc_msg,
 			      void *reply_data, size_t reply_bytes);
+int sof_client_ipc_set_get_data(struct sof_client_dev *cdev, void *ipc_msg,
+				bool set);
 
 struct dentry *sof_client_get_debugfs_root(struct sof_client_dev *cdev);
 struct device *sof_client_get_dma_dev(struct sof_client_dev *cdev);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 876e6fdbef4f..eb1192dbdfb6 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -680,6 +680,8 @@ static inline void snd_sof_ipc_msgs_rx(struct snd_sof_dev *sdev)
 }
 int sof_ipc_tx_message(struct snd_sof_ipc *ipc, void *msg_data, size_t msg_bytes,
 		       void *reply_data, size_t reply_bytes);
+int sof_ipc_set_get_data(struct snd_sof_ipc *ipc, void *msg_data,
+			 size_t msg_bytes, bool set);
 int sof_ipc_tx_message_no_pm(struct snd_sof_ipc *ipc, void *msg_data, size_t msg_bytes,
 			     void *reply_data, size_t reply_bytes);
 int sof_ipc_send_msg(struct snd_sof_dev *sdev, void *msg_data, size_t msg_bytes,
-- 
2.38.1

