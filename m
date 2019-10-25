Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FB0E56AB
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Oct 2019 00:51:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2210418D5;
	Sat, 26 Oct 2019 00:50:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2210418D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572043886;
	bh=fPAnw5LkysC7r9w5H1JqM4z9mT6RRmhjscv+pep+8Co=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ILD0lAUGZU/ztRgRtn7knCJDm1jIDDKiByWAMA1awfQPUzVNEHL1ti8DjNfPcal4x
	 z7rZImmodTqYqGXv0h1aZ+cCTml6+tMIWAaQ3RXPrpimoJBblCTmzFFhGNOwqlHKzy
	 H7f4K7BaY8i3Upur7t9NsbT6IJEAuzjzkw+n4LJ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E58F2F8070D;
	Sat, 26 Oct 2019 00:42:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9D20F80633; Sat, 26 Oct 2019 00:41:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F376AF802A0
 for <alsa-devel@alsa-project.org>; Sat, 26 Oct 2019 00:41:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F376AF802A0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 15:41:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,230,1569308400"; d="scan'208";a="210458209"
Received: from archagam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.139.180])
 by fmsmga001.fm.intel.com with ESMTP; 25 Oct 2019 15:41:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 25 Oct 2019 17:41:08 -0500
Message-Id: <20191025224122.7718-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
References: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 12/26] ASoC: SOF: PM: rename sof_send_pm_ipc to
	sof_send_pm_ctx_ipc
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Keyon Jie <yang.jie@linux.intel.com>

The helper sof_send_pm_ipc() is only suitable for context save/restore
IPCs' sending, so rename it to sof_send_pm_ctx_ipc here.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 81e623dfc7e5..ac900fb3379e 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -197,7 +197,7 @@ static int sof_restore_pipelines(struct snd_sof_dev *sdev)
 	return ret;
 }
 
-static int sof_send_pm_ipc(struct snd_sof_dev *sdev, int cmd)
+static int sof_send_pm_ctx_ipc(struct snd_sof_dev *sdev, int cmd)
 {
 	struct sof_ipc_pm_ctx pm_ctx;
 	struct sof_ipc_reply reply;
@@ -320,7 +320,7 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 	}
 
 	/* notify DSP of system resume */
-	ret = sof_send_pm_ipc(sdev, SOF_IPC_PM_CTX_RESTORE);
+	ret = sof_send_pm_ctx_ipc(sdev, SOF_IPC_PM_CTX_RESTORE);
 	if (ret < 0)
 		dev_err(sdev->dev,
 			"error: ctx_restore ipc error during resume %d\n",
@@ -361,7 +361,7 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 		sof_cache_debugfs(sdev);
 #endif
 	/* notify DSP of upcoming power down */
-	ret = sof_send_pm_ipc(sdev, SOF_IPC_PM_CTX_SAVE);
+	ret = sof_send_pm_ctx_ipc(sdev, SOF_IPC_PM_CTX_SAVE);
 	if (ret == -EBUSY || ret == -EAGAIN) {
 		/*
 		 * runtime PM has logic to handle -EBUSY/-EAGAIN so
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
