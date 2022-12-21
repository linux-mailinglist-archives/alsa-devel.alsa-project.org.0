Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 524F0652F72
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 11:27:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDE4916D3;
	Wed, 21 Dec 2022 11:26:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDE4916D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671618434;
	bh=FemnrSIr5m/y7PA4n37KO9Ox4XayijfvYhz7dRKwGdE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gTRlK2/DC1I8IzimUu3A5EUzNZe4MI8eAZ2cUEVQTStV8FfD6F4O0rB+7BvY1tpOJ
	 uUErfVjZslDVlRBJ9Jh9atX06c6yoazBngBt66GJLQwMM5rmrwyEfyBUpiu24Wm/zg
	 96yYoqYHGkfQ4ePLlPj4HotsuidAKv+lRVtFbQJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91B06F80568;
	Wed, 21 Dec 2022 11:24:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F043F8047B; Wed, 21 Dec 2022 11:23:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F09FF80022
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 11:23:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F09FF80022
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jUo8W1u/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671618225; x=1703154225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FemnrSIr5m/y7PA4n37KO9Ox4XayijfvYhz7dRKwGdE=;
 b=jUo8W1u/8/J3PWgxtvcSFSPcKa4R64+3/EgBYzI+2+9v3to76ueSHuNK
 2IcsY51TAp3rbyqhRLnM2qajFpu66ldZ17VSkLPlWXOTpc5twU/Vdzxtf
 c5UvfBc8OEDbwtFXtcvAUKvxUct2eULgIsuiSIXupbUIXc91tDO2yRwWC
 QWPl2HxrpSP1XAWBKqeZHVZoqx3mQrwSqb53OQt04hccHR6sMsf3hD0Hp
 vIPNF+cBQ6b5YbySBg/LBeybkrMMXWOeTDU8z/QKoZv/NcnpMLYvHE6fb
 LK1J5KjZJnuVut/5vWUHPfD/JQwGP7oQcf1LMv6VNnsSHi9AiG1oNNpMT g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="406078667"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="406078667"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:23:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="681984334"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="681984334"
Received: from cofearra-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.20.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:23:41 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 08/11] ASoC: SOF: pm: Extend the optionality of IPC ops to IPC
 as well
Date: Wed, 21 Dec 2022 12:23:25 +0200
Message-Id: <20221221102328.9635-9-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221102328.9635-1-peter.ujfalusi@linux.intel.com>
References: <20221221102328.9635-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The IPC ops are optional, but they require that the ops struct is to be
allocated with all callbacks set to NULL.

Update the code to extend the optionality to:
sdev->ipc == NULL
sdev->ipc->ops == NULL
sdev->ipc->ops->[pm/tplg] == NULL (treated optional for pm currently)
sdev->ipc->ops->[pm/tplg]->ops == NULL (treated optional currently)

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/pm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index df740be645e8..e7fce9e4a0d2 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -73,8 +73,8 @@ static void sof_cache_debugfs(struct snd_sof_dev *sdev)
 static int sof_resume(struct device *dev, bool runtime_resume)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
-	const struct sof_ipc_pm_ops *pm_ops = sdev->ipc->ops->pm;
-	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_pm_ops *pm_ops = sof_ipc_get_ops(sdev, pm);
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	u32 old_state = sdev->dsp_power_state.state;
 	int ret;
 
@@ -155,7 +155,7 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 	}
 
 	/* restore pipelines */
-	if (tplg_ops->set_up_all_pipelines) {
+	if (tplg_ops && tplg_ops->set_up_all_pipelines) {
 		ret = tplg_ops->set_up_all_pipelines(sdev, false);
 		if (ret < 0) {
 			dev_err(sdev->dev, "Failed to restore pipeline after resume %d\n", ret);
@@ -179,8 +179,8 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 static int sof_suspend(struct device *dev, bool runtime_suspend)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
-	const struct sof_ipc_pm_ops *pm_ops = sdev->ipc->ops->pm;
-	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_pm_ops *pm_ops = sof_ipc_get_ops(sdev, pm);
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	pm_message_t pm_state;
 	u32 target_state = 0;
 	int ret;
@@ -277,7 +277,7 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 
 int snd_sof_dsp_power_down_notify(struct snd_sof_dev *sdev)
 {
-	const struct sof_ipc_pm_ops *pm_ops = sdev->ipc->ops->pm;
+	const struct sof_ipc_pm_ops *pm_ops = sof_ipc_get_ops(sdev, pm);
 
 	/* Notify DSP of upcoming power down */
 	if (sof_ops(sdev)->remove && pm_ops && pm_ops->ctx_save)
-- 
2.39.0

