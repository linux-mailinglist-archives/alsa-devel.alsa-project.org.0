Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA605868A0
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 20:19:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7EA6542;
	Thu,  8 Aug 2019 20:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7EA6542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565288382;
	bh=VUu4IFBDt4y9E3ugVnf1jG0ZphJ0cw5LuLCPMK4fPZQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DL1zZdJAY7169yCsg0lPaY8yxZ5wkaYtjD+CPtNK37mI5FZM+WNDQPcHLdnnmg5Tb
	 HITbD4AwJ2c024dkE1v3J1Frp8satef3i7QFaKzCEHI7sVPsvg2l9RZCs4f5FZ8quK
	 Mc1BfS4HRY3OhhU/M3Ax9ZCbSmJq+XIj89Z2+v6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3A67F805F5;
	Thu,  8 Aug 2019 20:16:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11293F805A1; Thu,  8 Aug 2019 20:16:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E776F803F3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 20:16:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E776F803F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 11:16:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,362,1559545200"; d="scan'208";a="177396974"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 08 Aug 2019 11:16:14 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu,  8 Aug 2019 20:15:49 +0200
Message-Id: <20190808181549.12521-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190808181549.12521-1-cezary.rojewski@intel.com>
References: <20190808181549.12521-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH v5 2/2] ASoC: Intel: Skylake: large_config_get
	overhaul
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

LARGE_CONFIG_GET is mainly used to retrieve requested module parameters
but it may also carry TX payload with them. Update its implementation to
account for both TX and RX data.
First reply.header carries total payload size within data_off_sizefield.
Make use of reply.header to realloc returned buffer with correct size.

Failure of IPC request is permissive - error-payload may be returned, an
informative data why GET for given param failed - and thus function
should not collapse before entire processing is finished. Caller is
responsible for checking returned payload and bytes parameters.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-messages.c |  3 ++-
 sound/soc/intel/skylake/skl-sst-ipc.c  | 25 ++++++++++++++++++++-----
 sound/soc/intel/skylake/skl-sst-ipc.h  |  3 ++-
 3 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-messages.c b/sound/soc/intel/skylake/skl-messages.c
index e8cc710f092b..84f0e6f58eb5 100644
--- a/sound/soc/intel/skylake/skl-messages.c
+++ b/sound/soc/intel/skylake/skl-messages.c
@@ -1379,11 +1379,12 @@ int skl_get_module_params(struct skl_dev *skl, u32 *params, int size,
 			  u32 param_id, struct skl_module_cfg *mcfg)
 {
 	struct skl_ipc_large_config_msg msg;
+	size_t bytes = size;
 
 	msg.module_id = mcfg->id.module_id;
 	msg.instance_id = mcfg->id.pvt_id;
 	msg.param_data_size = size;
 	msg.large_param_id = param_id;
 
-	return skl_ipc_get_large_config(&skl->ipc, &msg, params);
+	return skl_ipc_get_large_config(&skl->ipc, &msg, &params, &bytes);
 }
diff --git a/sound/soc/intel/skylake/skl-sst-ipc.c b/sound/soc/intel/skylake/skl-sst-ipc.c
index 196c80dadb1f..667cdddc289f 100644
--- a/sound/soc/intel/skylake/skl-sst-ipc.c
+++ b/sound/soc/intel/skylake/skl-sst-ipc.c
@@ -969,12 +969,18 @@ int skl_ipc_set_large_config(struct sst_generic_ipc *ipc,
 EXPORT_SYMBOL_GPL(skl_ipc_set_large_config);
 
 int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
-		struct skl_ipc_large_config_msg *msg, u32 *param)
+		struct skl_ipc_large_config_msg *msg,
+		u32 **payload, size_t *bytes)
 {
 	struct skl_ipc_header header = {0};
-	struct sst_ipc_message request = {0}, reply = {0};
+	struct sst_ipc_message request, reply = {0};
+	unsigned int *buf;
 	int ret;
 
+	reply.data = kzalloc(SKL_ADSP_W1_SZ, GFP_KERNEL);
+	if (!reply.data)
+		return -ENOMEM;
+
 	header.primary = IPC_MSG_TARGET(IPC_MOD_MSG);
 	header.primary |= IPC_MSG_DIR(IPC_MSG_REQUEST);
 	header.primary |= IPC_GLB_TYPE(IPC_MOD_LARGE_CONFIG_GET);
@@ -986,13 +992,22 @@ int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
 	header.extension |= IPC_FINAL_BLOCK(1);
 	header.extension |= IPC_INITIAL_BLOCK(1);
 
-	request.header = *(u64 *)(&header);
-	reply.data = param;
-	reply.size = msg->param_data_size;
+	request.header = *(u64 *)&header;
+	request.data = *payload;
+	request.size = *bytes;
+	reply.size = SKL_ADSP_W1_SZ;
+
 	ret = sst_ipc_tx_message_wait(ipc, request, &reply);
 	if (ret < 0)
 		dev_err(ipc->dev, "ipc: get large config fail, err: %d\n", ret);
 
+	reply.size = (reply.header >> 32) & IPC_DATA_OFFSET_SZ_MASK;
+	buf = krealloc(reply.data, reply.size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+	*payload = buf;
+	*bytes = reply.size;
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(skl_ipc_get_large_config);
diff --git a/sound/soc/intel/skylake/skl-sst-ipc.h b/sound/soc/intel/skylake/skl-sst-ipc.h
index 93af08cf41d2..08ac31778325 100644
--- a/sound/soc/intel/skylake/skl-sst-ipc.h
+++ b/sound/soc/intel/skylake/skl-sst-ipc.h
@@ -139,7 +139,8 @@ int skl_ipc_set_large_config(struct sst_generic_ipc *ipc,
 		struct skl_ipc_large_config_msg *msg, u32 *param);
 
 int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
-		struct skl_ipc_large_config_msg *msg, u32 *param);
+		struct skl_ipc_large_config_msg *msg,
+		u32 **payload, size_t *bytes);
 
 int skl_sst_ipc_load_library(struct sst_generic_ipc *ipc,
 			u8 dma_id, u8 table_id, bool wait);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
