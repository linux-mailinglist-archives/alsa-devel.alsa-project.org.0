Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6F6252481
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 01:56:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9D0216D5;
	Wed, 26 Aug 2020 01:55:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9D0216D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598399808;
	bh=QsGvW3+uzWGcI4FQHsIlR76zXbcG4EOeaj/558SMshc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BnSIKwYE40iif76xyEbUiqa6A7ZejbF9GIMHcGZF4HXPAd4szB2EIoySWNvlEad5d
	 giQQf5DVBW5MQR3yQjGMeQjyKHQ2effPocVtrGq0ZOsbofA8DR+vrr8V1Mf8tA42ER
	 WgOgbK+oALA9HNJWf+9VIFg0Vv+Cdz0LjSMEWVPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56AF6F802F9;
	Wed, 26 Aug 2020 01:51:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57CBDF80143; Wed, 26 Aug 2020 01:51:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47CC9F80143
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 01:51:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47CC9F80143
IronPort-SDR: t3OpWspYPtLyNCV68FYvVGTEGTnwG6f7D+M8nB23qsW6bA9HgN1tqKuoz92+EHJ4ny/A5HxZus
 tFmcGSOU3Jkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="157253467"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="157253467"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 16:51:00 -0700
IronPort-SDR: 6smXEDgdv92oiciRzem7rLlmGa+zccFVmsXXUUXqokJrqCs3BVO8r3Ojm67A2K33HzAsX7xhcX
 qvT1VEyn87BQ==
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="443819006"
Received: from cdurvasu-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.209.42.42])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 16:51:00 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/7] ASoC: SOF: imx: Replace sdev->private with
 sdev->pdata->hw_pdata
Date: Tue, 25 Aug 2020 16:50:39 -0700
Message-Id: <20200825235040.1586478-7-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200825235040.1586478-1-ranjani.sridharan@linux.intel.com>
References: <20200825235040.1586478-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Daniel Baluta <daniel.baluta@gmail.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Iulian Olaru <iulianolaru249@yahoo.com>
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

From: Iulian Olaru <iulianolaru249@yahoo.com>

The correct way to save private data is to use sdev->pdata->hw_pdata.
Removed superfluous type-casts.

Signed-off-by: Iulian Olaru <iulianolaru249@yahoo.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/imx/imx8.c  | 10 +++++-----
 sound/soc/sof/imx/imx8m.c |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index bc0628c7b88c..325bf59e27c1 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -126,7 +126,7 @@ static struct imx_dsp_ops dsp_ops = {
 
 static int imx8_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 {
-	struct imx8_priv *priv = (struct imx8_priv *)sdev->private;
+	struct imx8_priv *priv = sdev->pdata->hw_pdata;
 
 	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
 			  msg->msg_size);
@@ -140,7 +140,7 @@ static int imx8_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
  */
 static int imx8x_run(struct snd_sof_dev *sdev)
 {
-	struct imx8_priv *dsp_priv = (struct imx8_priv *)sdev->private;
+	struct imx8_priv *dsp_priv = sdev->pdata->hw_pdata;
 	int ret;
 
 	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
@@ -180,7 +180,7 @@ static int imx8x_run(struct snd_sof_dev *sdev)
 
 static int imx8_run(struct snd_sof_dev *sdev)
 {
-	struct imx8_priv *dsp_priv = (struct imx8_priv *)sdev->private;
+	struct imx8_priv *dsp_priv = sdev->pdata->hw_pdata;
 	int ret;
 
 	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
@@ -213,7 +213,7 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 	if (!priv)
 		return -ENOMEM;
 
-	sdev->private = priv;
+	sdev->pdata->hw_pdata = priv;
 	priv->dev = sdev->dev;
 	priv->sdev = sdev;
 
@@ -339,7 +339,7 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 
 static int imx8_remove(struct snd_sof_dev *sdev)
 {
-	struct imx8_priv *priv = (struct imx8_priv *)sdev->private;
+	struct imx8_priv *priv = sdev->pdata->hw_pdata;
 	int i;
 
 	platform_device_unregister(priv->ipc_dev);
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 86320941fcee..c4f1ca939068 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -99,7 +99,7 @@ static struct imx_dsp_ops imx8m_dsp_ops = {
 
 static int imx8m_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 {
-	struct imx8m_priv *priv = (struct imx8m_priv *)sdev->private;
+	struct imx8m_priv *priv = sdev->pdata->hw_pdata;
 
 	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
 			  msg->msg_size);
@@ -133,7 +133,7 @@ static int imx8m_probe(struct snd_sof_dev *sdev)
 	if (!priv)
 		return -ENOMEM;
 
-	sdev->private = priv;
+	sdev->pdata->hw_pdata = priv;
 	priv->dev = sdev->dev;
 	priv->sdev = sdev;
 
@@ -209,7 +209,7 @@ static int imx8m_probe(struct snd_sof_dev *sdev)
 
 static int imx8m_remove(struct snd_sof_dev *sdev)
 {
-	struct imx8m_priv *priv = (struct imx8m_priv *)sdev->private;
+	struct imx8m_priv *priv = sdev->pdata->hw_pdata;
 
 	platform_device_unregister(priv->ipc_dev);
 
-- 
2.25.1

