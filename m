Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5DB296818
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Oct 2020 02:38:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 807EE1809;
	Fri, 23 Oct 2020 02:37:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 807EE1809
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603413480;
	bh=PC1iLDwgt1iu8B2noFYpoO2T9s97yzMUOO0ww8yFalA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U13Np+FIX5Iu9efwzHa52qqf163PgHE/ykgqi1o6MyB13XJC2RiBd3O6FKbOdVV61
	 jZ4elGAphIpUzbP6OuFiPPnP8MxD1+yA0KNM1jUivQlNpUxWC0SwK8BKP/sgZ818Z2
	 b0qgV4CCHImIEL4mDMQsyjsbXd5ULYqGZlLqo5Pw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C2FEF8049C;
	Fri, 23 Oct 2020 02:35:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 594E0F804CA; Fri, 23 Oct 2020 02:35:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DA7AF804AB
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 02:35:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DA7AF804AB
IronPort-SDR: JbSEYP7MYph2N2gSdG5DqpSOApZjwF513wnkI8j29jPuFOJSVaXDFdRg/opqgPvyu4GZy/CTIw
 gz8dJLIUXJsA==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="165020485"
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="165020485"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 17:35:25 -0700
IronPort-SDR: OTeiAXI1PaLWopJs+ay0MQ1U8VXU8WDVreh8x0jGpz4jL73ZAIqFBKK8Hvljt6XKW5esYGZEPv
 y13NwTARxp8Q==
X-IronPort-AV: E=Sophos;i="5.77,404,1596524400"; d="scan'208";a="302505801"
Received: from dmert-dev.jf.intel.com ([10.166.241.5])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2020 17:35:24 -0700
From: Dave Ertman <david.m.ertman@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 04/10] ASoC: SOF: ops: Add ops for client registration
Date: Thu, 22 Oct 2020 17:33:32 -0700
Message-Id: <20201023003338.1285642-5-david.m.ertman@intel.com>
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

Add new ops for registering/unregistering clients based
on DSP capabilities and/or DT information.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Dave Ertman <david.m.ertman@intel.com>
---
 sound/soc/sof/core.c     | 10 ++++++++++
 sound/soc/sof/ops.h      | 14 ++++++++++++++
 sound/soc/sof/sof-priv.h |  4 ++++
 3 files changed, 28 insertions(+)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 72a97219395f..ddb9a12d5aac 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -246,8 +246,17 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 	if (plat_data->sof_probe_complete)
 		plat_data->sof_probe_complete(sdev->dev);
 
+	/* If registering certain clients fails, unregister the previously registered clients. */
+	ret = snd_sof_register_clients(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to register clients %d\n", ret);
+		goto client_reg_err;
+	}
+
 	return 0;
 
+client_reg_err:
+	snd_sof_unregister_clients(sdev);
 fw_trace_err:
 	snd_sof_free_trace(sdev);
 fw_run_err:
@@ -356,6 +365,7 @@ int snd_sof_device_remove(struct device *dev)
 			dev_warn(dev, "error: %d failed to prepare DSP for device removal",
 				 ret);
 
+		snd_sof_unregister_clients(sdev);
 		snd_sof_fw_unload(sdev);
 		snd_sof_ipc_free(sdev);
 		snd_sof_free_debug(sdev);
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index b21632f5511a..00370f8bcd75 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -470,6 +470,20 @@ snd_sof_set_mach_params(const struct snd_soc_acpi_mach *mach,
 		sof_ops(sdev)->set_mach_params(mach, dev);
 }
 
+static inline int snd_sof_register_clients(struct snd_sof_dev *sdev)
+{
+	if (sof_ops(sdev) && sof_ops(sdev)->register_clients)
+		return sof_ops(sdev)->register_clients(sdev);
+
+	return 0;
+}
+
+static inline void snd_sof_unregister_clients(struct snd_sof_dev *sdev)
+{
+	if (sof_ops(sdev) && sof_ops(sdev)->unregister_clients)
+		sof_ops(sdev)->unregister_clients(sdev);
+}
+
 static inline const struct snd_sof_dsp_ops
 *sof_get_ops(const struct sof_dev_desc *d,
 	     const struct sof_ops_table mach_ops[], int asize)
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index dceac73b858f..cca239c09d0e 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -252,6 +252,10 @@ struct snd_sof_dsp_ops {
 	void (*set_mach_params)(const struct snd_soc_acpi_mach *mach,
 				struct device *dev); /* optional */
 
+	/* client ops */
+	int (*register_clients)(struct snd_sof_dev *sdev); /* optional */
+	void (*unregister_clients)(struct snd_sof_dev *sdev); /* optional */
+
 	/* DAI ops */
 	struct snd_soc_dai_driver *drv;
 	int num_drv;
-- 
2.26.2

