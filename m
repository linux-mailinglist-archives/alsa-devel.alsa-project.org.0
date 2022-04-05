Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2006F4F3CCF
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 19:29:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDB72181F;
	Tue,  5 Apr 2022 19:28:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDB72181F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649179772;
	bh=SdciIs33RsemgIjjsXoWXuj7GwOuXxj+elaxSgooilg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GBAAzBIlzctYqEOQJHHZZ7v10LqrOntjZHvTZgfeeTa57XolKUe+rmUztKw/SHRbG
	 LJk9s33SsnoVMBs41776AOEDXb/RLRv4dlVmgmZmOrPfG0kWGnYgtlUX2KIaz7kbAL
	 l/hKPKkXOPn19LKhBjRcmpfPs2OefaVlN4j8fo9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42D6AF8052F;
	Tue,  5 Apr 2022 19:27:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7F3FF80527; Tue,  5 Apr 2022 19:27:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23950F8016E
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 19:27:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23950F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dMr8D3Yk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649179655; x=1680715655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SdciIs33RsemgIjjsXoWXuj7GwOuXxj+elaxSgooilg=;
 b=dMr8D3Yk2OjljjylRU8f0WkqJUFgan+RmEHGeYOf+CFv3q7tm96IMQY2
 oH/2f7+5oMqtDp/owbzljDqskBVjiNTUwkVoOcMfWL3huXJIXeIjlUL5Z
 gUeTffELbzUDie6mdRGrAdfKX27EWRLW1bjn3cc7ZL1nZcNFNUJQxpq64
 D8koxrSQf76n9x4Rlk+i+JA9LujkhU/voTjUsWJT5JEU/mxIejIr9TD9B
 fL35gMQ1SqP0avDQcl39hIiyeC/t2EUobgnJveE2fMDbsAqErKqDSxGN/
 t3Yz/X7YptlkYvT78PkgGinorJylzuhMTVWZkNJXMFlw3YNnQOji3Ihyp Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="323986737"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="323986737"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="722140967"
Received: from reginari-mobl7.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.131])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:23 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/15] ASoC: SOF: ipc3: Implement the set_get_data IPC ops
Date: Tue,  5 Apr 2022 10:26:58 -0700
Message-Id: <20220405172708.122168-6-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405172708.122168-1-ranjani.sridharan@linux.intel.com>
References: <20220405172708.122168-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.de,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Add the implementation for the set_get_data callback for handling large
data set and get.

The set_get_data() in IPC3 can be used only for component messages. The
function expects the caller to prepare the message behind the data pointer
for sending/receiving data. The callback only implements the needed code
to be able to split up a message if needed for transfer.

The set_get_data ops is based on the existing
snd_sof_ipc_set_get_comp_data() and sof_set_get_large_ctrl_data() but made
it generic entry point.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc3.c | 103 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index 6b59d4d0727f..9aa263b4af0a 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -7,6 +7,8 @@
 //
 //
 
+#include <sound/sof/stream.h>
+#include <sound/sof/control.h>
 #include "sof-priv.h"
 #include "ipc3-ops.h"
 #include "ops.h"
@@ -316,6 +318,106 @@ static int sof_ipc3_tx_msg(struct snd_sof_dev *sdev, void *msg_data, size_t msg_
 	return ret;
 }
 
+static int sof_ipc3_set_get_data(struct snd_sof_dev *sdev, void *data, size_t data_bytes,
+				 bool set)
+{
+	size_t msg_bytes, hdr_bytes, payload_size, send_bytes;
+	struct sof_ipc_ctrl_data *cdata = data;
+	struct sof_ipc_ctrl_data *cdata_chunk;
+	struct snd_sof_ipc *ipc = sdev->ipc;
+	size_t offset = 0;
+	u8 *src, *dst;
+	u32 num_msg;
+	int ret = 0;
+	int i;
+
+	if (!cdata || data_bytes < sizeof(*cdata))
+		return -EINVAL;
+
+	if ((cdata->rhdr.hdr.cmd & SOF_GLB_TYPE_MASK) != SOF_IPC_GLB_COMP_MSG) {
+		dev_err(sdev->dev, "%s: Not supported message type of %#x\n",
+			__func__, cdata->rhdr.hdr.cmd);
+		return -EINVAL;
+	}
+
+	/* send normal size ipc in one part */
+	if (cdata->rhdr.hdr.size <= ipc->max_payload_size)
+		return sof_ipc3_tx_msg(sdev, cdata, cdata->rhdr.hdr.size,
+				       cdata, cdata->rhdr.hdr.size, false);
+
+	cdata_chunk = kzalloc(ipc->max_payload_size, GFP_KERNEL);
+	if (!cdata_chunk)
+		return -ENOMEM;
+
+	switch (cdata->type) {
+	case SOF_CTRL_TYPE_VALUE_CHAN_GET:
+	case SOF_CTRL_TYPE_VALUE_CHAN_SET:
+		hdr_bytes = sizeof(struct sof_ipc_ctrl_data);
+		if (set) {
+			src = (u8 *)cdata->chanv;
+			dst = (u8 *)cdata_chunk->chanv;
+		} else {
+			src = (u8 *)cdata_chunk->chanv;
+			dst = (u8 *)cdata->chanv;
+		}
+		break;
+	case SOF_CTRL_TYPE_DATA_GET:
+	case SOF_CTRL_TYPE_DATA_SET:
+		hdr_bytes = sizeof(struct sof_ipc_ctrl_data) + sizeof(struct sof_abi_hdr);
+		if (set) {
+			src = (u8 *)cdata->data->data;
+			dst = (u8 *)cdata_chunk->data->data;
+		} else {
+			src = (u8 *)cdata_chunk->data->data;
+			dst = (u8 *)cdata->data->data;
+		}
+		break;
+	default:
+		kfree(cdata_chunk);
+		return -EINVAL;
+	}
+
+	msg_bytes = cdata->rhdr.hdr.size - hdr_bytes;
+	payload_size = ipc->max_payload_size - hdr_bytes;
+	num_msg = DIV_ROUND_UP(msg_bytes, payload_size);
+
+	/* copy the header data */
+	memcpy(cdata_chunk, cdata, hdr_bytes);
+
+	/* Serialise IPC TX */
+	mutex_lock(&sdev->ipc->tx_mutex);
+
+	/* copy the payload data in a loop */
+	for (i = 0; i < num_msg; i++) {
+		send_bytes = min(msg_bytes, payload_size);
+		cdata_chunk->num_elems = send_bytes;
+		cdata_chunk->rhdr.hdr.size = hdr_bytes + send_bytes;
+		cdata_chunk->msg_index = i;
+		msg_bytes -= send_bytes;
+		cdata_chunk->elems_remaining = msg_bytes;
+
+		if (set)
+			memcpy(dst, src + offset, send_bytes);
+
+		ret = ipc3_tx_msg_unlocked(sdev->ipc,
+					   cdata_chunk, cdata_chunk->rhdr.hdr.size,
+					   cdata_chunk, cdata_chunk->rhdr.hdr.size);
+		if (ret < 0)
+			break;
+
+		if (!set)
+			memcpy(dst + offset, src, send_bytes);
+
+		offset += payload_size;
+	}
+
+	mutex_unlock(&sdev->ipc->tx_mutex);
+
+	kfree(cdata_chunk);
+
+	return ret;
+}
+
 static int sof_ipc3_ctx_ipc(struct snd_sof_dev *sdev, int cmd)
 {
 	struct sof_ipc_pm_ctx pm_ctx = {
@@ -350,4 +452,5 @@ const struct sof_ipc_ops ipc3_ops = {
 	.pcm = &ipc3_pcm_ops,
 
 	.tx_msg = sof_ipc3_tx_msg,
+	.set_get_data = sof_ipc3_set_get_data,
 };
-- 
2.25.1

