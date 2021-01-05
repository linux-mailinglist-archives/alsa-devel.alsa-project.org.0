Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 079BB2EAF89
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 17:01:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 882F216B8;
	Tue,  5 Jan 2021 17:00:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 882F216B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609862493;
	bh=DG+0KpnUmJ3JIFG2/iCCLICGV1fbwokFnR5EI1QuFbE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IaVEMhU2x6bGMUqOXxzwdpzbJWrh7SQdQeoUJirEqP2xvhL2h6f4T8I21oMii6Wq+
	 VDZBcSeIcZYLsbzFY4AisGW+GFeT2rWD9f6PWpqnK4RLtu/sOieK/ac9n3RC+uhiJD
	 XcklQPzrDSQbUILNIHcUq3VrRceMYmILsEbsiwpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E336EF800FD;
	Tue,  5 Jan 2021 16:59:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AC25F801F5; Tue,  5 Jan 2021 16:59:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A9B7F8015B
 for <alsa-devel@alsa-project.org>; Tue,  5 Jan 2021 16:59:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A9B7F8015B
IronPort-SDR: ftlBu/ybJ1Lj1eXgWSensxrkig4ckF3iWDOm+aNmnqWpwSWKsLmVsFeYU41uFoSOBZ1bQ4wpG2
 bXNwjD9ypTuw==
X-IronPort-AV: E=McAfee;i="6000,8403,9855"; a="241210636"
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="241210636"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2021 07:59:42 -0800
IronPort-SDR: 8FFJx94PSRc4FF+6BpVzj704fly8VhJR3r+PBrH5nd6VLQ6wW115BkIf89H80DFCAjy3qv3S3M
 RNa/54bPPOiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,477,1599548400"; d="scan'208";a="462342757"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2021 07:59:41 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: add mutex to protect the dsp_power_state access
Date: Tue,  5 Jan 2021 17:56:40 +0200
Message-Id: <20210105155640.3725238-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, Keyon Jie <yang.jie@linux.intel.com>,
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

There could be more than one thread read/write the dsp_power_state
simultaneously (e.g. hda_dsp_d0i3_work and sof_ipc_tx_message), add a
mutex power_state_access to make sure the access to it is mutually
exclusive.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/core.c     |  1 +
 sound/soc/sof/ops.h      | 11 ++++++++---
 sound/soc/sof/sof-priv.h |  2 ++
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index adc7c37145d6..2b85ef5d6092 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -316,6 +316,7 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 	INIT_LIST_HEAD(&sdev->route_list);
 	spin_lock_init(&sdev->ipc_lock);
 	spin_lock_init(&sdev->hw_lock);
+	mutex_init(&sdev->power_state_access);
 
 	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
 		INIT_WORK(&sdev->probe_work, sof_probe_work);
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 95e748b36903..4c1f9daaa6e8 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -208,11 +208,16 @@ static inline int
 snd_sof_dsp_set_power_state(struct snd_sof_dev *sdev,
 			    const struct sof_dsp_power_state *target_state)
 {
+	int ret = 0;
+
+	mutex_lock(&sdev->power_state_access);
+
 	if (sof_ops(sdev)->set_power_state)
-		return sof_ops(sdev)->set_power_state(sdev, target_state);
+		ret = sof_ops(sdev)->set_power_state(sdev, target_state);
 
-	/* D0 substate is not supported, do nothing here. */
-	return 0;
+	mutex_unlock(&sdev->power_state_access);
+
+	return ret;
 }
 
 /* debug */
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 68da8f797403..28d19fa30614 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -375,6 +375,8 @@ struct snd_sof_dev {
 
 	/* current DSP power state */
 	struct sof_dsp_power_state dsp_power_state;
+	/* mutex to protect the dsp_power_state access */
+	struct mutex power_state_access;
 
 	/* Intended power target of system suspend */
 	enum sof_system_suspend_state system_suspend_target;
-- 
2.29.2

