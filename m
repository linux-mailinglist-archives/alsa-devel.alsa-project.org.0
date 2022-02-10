Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ED04B1151
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 16:08:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A99311933;
	Thu, 10 Feb 2022 16:07:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A99311933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644505722;
	bh=avB9gfF1dQpf9ouXWAEoycsyJSGtDd8lbJbB9o+Q0FQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JQr88zatNuKZu98CBB4S0BYNz4r+w/ObqyFsA1jNffLusphPY2A3+glcN3RDHoZsg
	 ny/Wjhmz4wUDATnYaQATpyYZzc4408HyajlKhE/Qnik0KofsIcr5rBrRiXGbuckk0u
	 j0ufkcNXqpjl0/r+37IwuJndgqYYil8KGaTZ1JOg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25A64F80539;
	Thu, 10 Feb 2022 16:05:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A816F8052F; Thu, 10 Feb 2022 16:05:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFB81F80520
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 16:05:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFB81F80520
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YU/J8aRq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644505551; x=1676041551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=avB9gfF1dQpf9ouXWAEoycsyJSGtDd8lbJbB9o+Q0FQ=;
 b=YU/J8aRqX0fLeFGJlj4vwVej4pIITid9I9l2p47Gu+sGqtwAoKJnE1PO
 SD4zZ4sWwIsS6ok+cVM5LIfEX2ZckcgUTqPaDxZyZJwOVLfkU7+n7SB6R
 uReryzGDc1XqF0ITvoqcEOUjudvgHwn/f+4/Y/6fAQc6s+wLW7rH8zqYe
 42AFsoZw5Vg4hYMAHlT4cf9JZ/d8wH5FmXlehpnEqPikJKHeTGX2Jy29/
 KBhekNvCCGQxX9AV1A2sNIx10Arc/j+dmAilgN7wuP0CRail7EhJyHdO0
 BTjQ76kjVjGRz9Naxjz/i2D0ssOqyaxw47ACm9rtx5lgV8ZUqOcF/CagF A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="249715034"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="249715034"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 07:05:49 -0800
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="500422667"
Received: from barabano-mobl.ccr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.41.18])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 07:05:46 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com
Subject: [PATCH v2 6/9] ASoC: SOF: sof-client: Add support for clients not
 managed by pm framework
Date: Thu, 10 Feb 2022 17:05:22 +0200
Message-Id: <20220210150525.30756-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220210150525.30756-1-peter.ujfalusi@linux.intel.com>
References: <20220210150525.30756-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, fred.oh@linux.intel.com, daniel.baluta@nxp.com
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

Some SOF client can be of 'passive' type, meaning that they do not handle
PM framework callbacks by themselves but rely on the auxiliary driver's
suspend and resume callbacks to be notified about the core's suspend or
resume event.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/pm.c         | 13 ++++++++++-
 sound/soc/sof/sof-client.c | 46 ++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-priv.h   | 12 ++++++++++
 3 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 197a88695fef..7300ecadabd9 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -167,6 +167,9 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 		return ret;
 	}
 
+	/* Notify clients not managed by pm framework about core resume */
+	sof_resume_clients(sdev);
+
 	/* notify DSP of system resume */
 	ret = sof_send_pm_ctx_ipc(sdev, SOF_IPC_PM_CTX_RESTORE);
 	if (ret < 0)
@@ -180,6 +183,7 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 static int sof_suspend(struct device *dev, bool runtime_suspend)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	pm_message_t pm_state;
 	u32 target_state = 0;
 	int ret;
 
@@ -205,16 +209,23 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 	}
 
 	target_state = snd_sof_dsp_power_target(sdev);
+	pm_state.event = target_state;
 
 	/* Skip to platform-specific suspend if DSP is entering D0 */
-	if (target_state == SOF_DSP_PM_D0)
+	if (target_state == SOF_DSP_PM_D0) {
+		/* Notify clients not managed by pm framework about core suspend */
+		sof_suspend_clients(sdev, pm_state);
 		goto suspend;
+	}
 
 	sof_tear_down_pipelines(sdev, false);
 
 	/* release trace */
 	snd_sof_release_trace(sdev);
 
+	/* Notify clients not managed by pm framework about core suspend */
+	sof_suspend_clients(sdev, pm_state);
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_ENABLE_DEBUGFS_CACHE)
 	/* cache debugfs contents during runtime suspend */
 	if (runtime_suspend)
diff --git a/sound/soc/sof/sof-client.c b/sound/soc/sof/sof-client.c
index 6f747d051b59..932bdea49c24 100644
--- a/sound/soc/sof/sof-client.c
+++ b/sound/soc/sof/sof-client.c
@@ -169,6 +169,52 @@ int sof_client_ipc_tx_message(struct sof_client_dev *cdev, void *ipc_msg,
 }
 EXPORT_SYMBOL_NS_GPL(sof_client_ipc_tx_message, SND_SOC_SOF_CLIENT);
 
+int sof_suspend_clients(struct snd_sof_dev *sdev, pm_message_t state)
+{
+	struct auxiliary_driver *adrv;
+	struct sof_client_dev *cdev;
+
+	mutex_lock(&sdev->ipc_client_mutex);
+
+	list_for_each_entry(cdev, &sdev->ipc_client_list, list) {
+		/* Skip devices without loaded driver */
+		if (!cdev->auxdev.dev.driver)
+			continue;
+
+		adrv = to_auxiliary_drv(cdev->auxdev.dev.driver);
+		if (adrv->suspend)
+			adrv->suspend(&cdev->auxdev, state);
+	}
+
+	mutex_unlock(&sdev->ipc_client_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sof_suspend_clients, SND_SOC_SOF_CLIENT);
+
+int sof_resume_clients(struct snd_sof_dev *sdev)
+{
+	struct auxiliary_driver *adrv;
+	struct sof_client_dev *cdev;
+
+	mutex_lock(&sdev->ipc_client_mutex);
+
+	list_for_each_entry(cdev, &sdev->ipc_client_list, list) {
+		/* Skip devices without loaded driver */
+		if (!cdev->auxdev.dev.driver)
+			continue;
+
+		adrv = to_auxiliary_drv(cdev->auxdev.dev.driver);
+		if (adrv->resume)
+			adrv->resume(&cdev->auxdev);
+	}
+
+	mutex_unlock(&sdev->ipc_client_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(sof_resume_clients, SND_SOC_SOF_CLIENT);
+
 struct dentry *sof_client_get_debugfs_root(struct sof_client_dev *cdev)
 {
 	return cdev->sdev->debugfs_root;
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index f641833f3ff9..39bbba5aeab2 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -653,6 +653,8 @@ int sof_register_clients(struct snd_sof_dev *sdev);
 void sof_unregister_clients(struct snd_sof_dev *sdev);
 void sof_client_ipc_rx_dispatcher(struct snd_sof_dev *sdev, void *msg_buf);
 void sof_client_fw_state_dispatcher(struct snd_sof_dev *sdev);
+int sof_suspend_clients(struct snd_sof_dev *sdev, pm_message_t state);
+int sof_resume_clients(struct snd_sof_dev *sdev);
 #else /* CONFIG_SND_SOC_SOF_CLIENT */
 static inline int sof_client_dev_register(struct snd_sof_dev *sdev, const char *name,
 					  u32 id, const void *data, size_t size)
@@ -681,6 +683,16 @@ static inline void sof_client_ipc_rx_dispatcher(struct snd_sof_dev *sdev, void *
 static inline void sof_client_fw_state_dispatcher(struct snd_sof_dev *sdev)
 {
 }
+
+static inline int sof_suspend_clients(struct snd_sof_dev *sdev, pm_message_t state)
+{
+	return 0;
+}
+
+static inline int sof_resume_clients(struct snd_sof_dev *sdev)
+{
+	return 0;
+}
 #endif /* CONFIG_SND_SOC_SOF_CLIENT */
 
 #endif
-- 
2.35.1

