Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C892F4EAF
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 16:31:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 297681724;
	Wed, 13 Jan 2021 16:30:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 297681724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610551881;
	bh=pxIpkIPeorWTGF/icU/h8nuM+MlpHpmQrgi2fKLiSlY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AC5A082zYZdk72foWh3YjDHZof2gPjiRe5HCXl5WTxgK4PaqPzgmnjRCiCpyrj4yO
	 TJ/1/jCgN4KIKAvmzeNhHn5dFgsBYlB/ZQ3qUSXfSkfOXGUmyChJemFB9nl25tU6en
	 dCiEFjJDb7euv+e8t6FuKcLCtxjJ4ES9gA+b1Mrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0938F8026B;
	Wed, 13 Jan 2021 16:29:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F808F8014D; Wed, 13 Jan 2021 16:29:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B38F7F8014D
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 16:29:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B38F7F8014D
IronPort-SDR: ktpphoPQjKa/CAGdatE40hySonVIKEAX4PA4dKEgwMsYx1sV3Mk0zQ53qcAEen5jVyxA7MwhGl
 qlp38skYXJ4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="175640154"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="175640154"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 07:29:23 -0800
IronPort-SDR: 01gq9RViEm6ryhFeXpm2O3/7h/E9SYcXc6kJ1lxAQwfxis4xEwhqFxS2ekhlNyxqq9rqsZbXyA
 RYVwN//503ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="569445117"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga006.fm.intel.com with ESMTP; 13 Jan 2021 07:29:21 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/4] ASoC: SOF: add .shutdown() callback to snd_sof_dsp_ops
Date: Wed, 13 Jan 2021 17:26:14 +0200
Message-Id: <20210113152617.4048541-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, Keyon Jie <yang.jie@linux.intel.com>,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 Bard Liao <bard.liao@intel.com>
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

From: Keyon Jie <yang.jie@linux.intel.com>

Add .shutdown() callback to the struct snd_sof_dsp_ops, for
doing platform specific actions at shutdown.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ops.h      | 8 ++++++++
 sound/soc/sof/sof-priv.h | 4 +++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 4c1f9daaa6e8..f0c9ca8820d2 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -37,6 +37,14 @@ static inline int snd_sof_remove(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static inline int snd_sof_shutdown(struct snd_sof_dev *sdev)
+{
+	if (sof_ops(sdev)->shutdown)
+		return sof_ops(sdev)->shutdown(sdev);
+
+	return 0;
+}
+
 /* control */
 
 /*
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 28d19fa30614..682c4b6d01ef 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -98,9 +98,10 @@ struct snd_sof_pdata;
  */
 struct snd_sof_dsp_ops {
 
-	/* probe and remove */
+	/* probe/remove/shutdown */
 	int (*probe)(struct snd_sof_dev *sof_dev); /* mandatory */
 	int (*remove)(struct snd_sof_dev *sof_dev); /* optional */
+	int (*shutdown)(struct snd_sof_dev *sof_dev); /* optional */
 
 	/* DSP core boot / reset */
 	int (*run)(struct snd_sof_dev *sof_dev); /* mandatory */
@@ -462,6 +463,7 @@ struct snd_sof_dev {
 
 int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data);
 int snd_sof_device_remove(struct device *dev);
+int snd_sof_device_shutdown(struct device *dev);
 
 int snd_sof_runtime_suspend(struct device *dev);
 int snd_sof_runtime_resume(struct device *dev);
-- 
2.29.2

