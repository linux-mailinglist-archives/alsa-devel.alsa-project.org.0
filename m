Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E49C6613415
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 11:56:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 871DC1676;
	Mon, 31 Oct 2022 11:55:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 871DC1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667213801;
	bh=tpwB/FfhPbC6L6MFuGKcGxXHmU7maKz3p8c0jeTSlcA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O5MQQgPbozFQDaJqVpZHj6+5D0Bn+5WTBvHq6+R2MgaN+Bye18ibXo7eiPnNohx7e
	 FQCtXqnOAGqwqqXYX9on2KZfxFlHXCnuBmCn2F9nbJKx87F7HcJ3c2zr7UKZsVWFk5
	 YOncJdxSCS1tiv20BCgrvDJi8GygSmTVq5jdXhqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39E6BF802E8;
	Mon, 31 Oct 2022 11:54:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB8FAF80570; Mon, 31 Oct 2022 11:54:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15FB2F802E8
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 11:54:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15FB2F802E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="e2CFVGkK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667213673; x=1698749673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tpwB/FfhPbC6L6MFuGKcGxXHmU7maKz3p8c0jeTSlcA=;
 b=e2CFVGkKI+0oN3Jhvj65MiGcQtGdExuIEx/oL9ZgExCgdYRZpPO7BdNf
 1ly7D0MbT5HUL9H3RQ909KYfy4kgEWpgv2D3RO/68lte/pN2myTZG/+U8
 DDKi02TP3l6d4aPgyji3Bo3jJsQWcj9HVystgPTj9Bw4swGNvUIi7qiWr
 ASxfAqZ5P84u6xmLWLp5vAfZ8AVlENx3byjje49SBkmdrCv7/aBxDcCwA
 iDfQhFRZU2Sc0ZhUmvClo5oMjRcMkbKfrGapbwSd/gLr/nuYJsadYUuXh
 dxJkKz8qAIL3j2ACb0J60rdhrAn3WU8BpD9kYXhtfeRaxfjkE6Y9SiJJf w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="308868477"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="308868477"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 03:51:28 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="633488080"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="633488080"
Received: from vbhutani-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.13.109])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 03:51:26 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	jyri.sarha@intel.com
Subject: [PATCH 4/5] ASoC: SOF: client: Add sof_client_ipc4_find_module()
 function
Date: Mon, 31 Oct 2022 12:51:40 +0200
Message-Id: <20221031105141.19037-5-peter.ujfalusi@linux.intel.com>
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

Add sof_client_ipc4_find_module() for calling
sof_ipc4_find_module_by_uuid() in sof client code.

Signed-off-by: Jyri Sarha <jyri.sarha@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-client.c | 15 +++++++++++++++
 sound/soc/sof/sof-client.h |  4 ++++
 2 files changed, 19 insertions(+)

diff --git a/sound/soc/sof/sof-client.c b/sound/soc/sof/sof-client.c
index 158d2114af45..9017f0864cdd 100644
--- a/sound/soc/sof/sof-client.c
+++ b/sound/soc/sof/sof-client.c
@@ -16,6 +16,7 @@
 #include "ops.h"
 #include "sof-client.h"
 #include "sof-priv.h"
+#include "ipc4-priv.h"
 
 /**
  * struct sof_ipc_event_entry - IPC client event description
@@ -284,6 +285,20 @@ int sof_client_ipc_set_get_data(struct sof_client_dev *cdev, void *ipc_msg,
 }
 EXPORT_SYMBOL_NS_GPL(sof_client_ipc_set_get_data, SND_SOC_SOF_CLIENT);
 
+#ifdef CONFIG_SND_SOC_SOF_INTEL_IPC4
+struct sof_ipc4_fw_module *sof_client_ipc4_find_module(struct sof_client_dev *c, const guid_t *uuid)
+{
+	struct snd_sof_dev *sdev = c->sdev;
+
+	if (sdev->pdata->ipc_type == SOF_INTEL_IPC4)
+		return sof_ipc4_find_module_by_uuid(sdev, uuid);
+	dev_err(sdev->dev, "Only supported with IPC4\n");
+
+	return NULL;
+}
+EXPORT_SYMBOL_NS_GPL(sof_client_ipc4_find_module, SND_SOC_SOF_CLIENT);
+#endif
+
 int sof_suspend_clients(struct snd_sof_dev *sdev, pm_message_t state)
 {
 	struct auxiliary_driver *adrv;
diff --git a/sound/soc/sof/sof-client.h b/sound/soc/sof/sof-client.h
index 136edc3744aa..2589714eaa91 100644
--- a/sound/soc/sof/sof-client.h
+++ b/sound/soc/sof/sof-client.h
@@ -13,6 +13,8 @@ struct sof_ipc_cmd_hdr;
 struct snd_sof_dev;
 struct dentry;
 
+struct sof_ipc4_fw_module;
+
 /**
  * struct sof_client_dev - SOF client device
  * @auxdev:	auxiliary device
@@ -40,6 +42,8 @@ int sof_client_ipc_tx_message(struct sof_client_dev *cdev, void *ipc_msg,
 int sof_client_ipc_set_get_data(struct sof_client_dev *cdev, void *ipc_msg,
 				bool set);
 
+struct sof_ipc4_fw_module *sof_client_ipc4_find_module(struct sof_client_dev *c, const guid_t *u);
+
 struct dentry *sof_client_get_debugfs_root(struct sof_client_dev *cdev);
 struct device *sof_client_get_dma_dev(struct sof_client_dev *cdev);
 const struct sof_ipc_fw_version *sof_client_get_fw_version(struct sof_client_dev *cdev);
-- 
2.38.1

