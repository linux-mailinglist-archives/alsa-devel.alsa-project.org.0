Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 195D651D929
	for <lists+alsa-devel@lfdr.de>; Fri,  6 May 2022 15:29:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B06011845;
	Fri,  6 May 2022 15:28:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B06011845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651843739;
	bh=/Pdal9RU5tC2GH2TCscjt8n2KqTBGqMIAUIDOy9HIYM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DR8Df/SrcH0IZSAfxdd9jRgZr0dO2SVb6f5gqpbzwYyqsGNcR3LU0JVOJmkkzH/Jv
	 DxEajRCS0kxRUlng0bBpjrsgEDSI2KZuQRg59Yc6Qx9MZ4yCrSW+wnHfnMJu/lpsKk
	 ABpnlu1zn14Q0F7i5RiAbrBEid6yT7uH9UPg19hM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C500F80528;
	Fri,  6 May 2022 15:26:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 203AFF8025C; Fri,  6 May 2022 15:26:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92846F8014B
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 15:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92846F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kXcxE2c3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651843600; x=1683379600;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/Pdal9RU5tC2GH2TCscjt8n2KqTBGqMIAUIDOy9HIYM=;
 b=kXcxE2c3tp0SUpMQY/+84NjVv9zo30VImUCc1pdKyJz/8E21GfiAqZe3
 +AjHCxsOekdRiutnlIKVH5qMtJXL/vQTnOalGXd+19lQn5isuzJAghvD7
 Nh/vKZ188O3j+G99EeZxCPApdLVG0O4v/EXECY2CnYpApoME3CkxmMQoG
 lsvG3tKMTHGU+LEB8ogamV02dROQ1eksM+1JGzJWrUeEhVyXEuVhaCm03
 IOZN9onIg+OEYd2FfX/zeBqaZkxaRB49X8IXXzotuHS+uwFhpv6CY5yoI
 mjqo06WQPs8894IQOC9N5/GAHsUtgbK2xeqo5aqLfSFZalKxO9B7k+3xO g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="293672798"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="293672798"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 06:26:33 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="585971575"
Received: from oelagadx-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.61.230])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 06:26:30 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, yung-chuan.liao@linux.intel.com,
 rander.wang@intel.com
Subject: [PATCH 2/8] ASoC: SOF: ipc-msg-injector: Query the maximum IPC
 payload size
Date: Fri,  6 May 2022 16:26:41 +0300
Message-Id: <20220506132647.18690-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220506132647.18690-1-peter.ujfalusi@linux.intel.com>
References: <20220506132647.18690-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

Instead of using the SOF_IPC_MSG_MAX_SIZE as the maximum payload size for
and IPC message, use the provided API to query it.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/sof-client-ipc-msg-injector.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
index c711981187aa..19bb6212cb56 100644
--- a/sound/soc/sof/sof-client-ipc-msg-injector.c
+++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
@@ -22,6 +22,7 @@
 
 struct sof_msg_inject_priv {
 	struct dentry *dfs_file;
+	size_t max_msg_size;
 
 	void *tx_buffer;
 	void *rx_buffer;
@@ -78,7 +79,7 @@ static ssize_t sof_msg_inject_dfs_write(struct file *file, const char __user *bu
 	if (*ppos)
 		return 0;
 
-	size = simple_write_to_buffer(priv->tx_buffer, SOF_IPC_MSG_MAX_SIZE,
+	size = simple_write_to_buffer(priv->tx_buffer, priv->max_msg_size,
 				      ppos, buffer, count);
 	if (size != count)
 		return size > 0 ? -EFAULT : size;
@@ -90,9 +91,9 @@ static ssize_t sof_msg_inject_dfs_write(struct file *file, const char __user *bu
 	}
 
 	/* send the message */
-	memset(priv->rx_buffer, 0, SOF_IPC_MSG_MAX_SIZE);
+	memset(priv->rx_buffer, 0, priv->max_msg_size);
 	ret = sof_client_ipc_tx_message(cdev, priv->tx_buffer, priv->rx_buffer,
-					SOF_IPC_MSG_MAX_SIZE);
+					priv->max_msg_size);
 	pm_runtime_mark_last_busy(dev);
 	err = pm_runtime_put_autosuspend(dev);
 	if (err < 0)
@@ -135,8 +136,9 @@ static int sof_msg_inject_probe(struct auxiliary_device *auxdev,
 	if (!priv)
 		return -ENOMEM;
 
-	priv->tx_buffer = devm_kmalloc(dev, SOF_IPC_MSG_MAX_SIZE, GFP_KERNEL);
-	priv->rx_buffer = devm_kzalloc(dev, SOF_IPC_MSG_MAX_SIZE, GFP_KERNEL);
+	priv->max_msg_size = sof_client_get_ipc_max_payload_size(cdev);
+	priv->tx_buffer = devm_kmalloc(dev, priv->max_msg_size, GFP_KERNEL);
+	priv->rx_buffer = devm_kzalloc(dev, priv->max_msg_size, GFP_KERNEL);
 	if (!priv->tx_buffer || !priv->rx_buffer)
 		return -ENOMEM;
 
-- 
2.36.0

