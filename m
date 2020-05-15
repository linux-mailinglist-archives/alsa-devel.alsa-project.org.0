Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4C81D4FD8
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 16:03:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A38FA1607;
	Fri, 15 May 2020 16:02:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A38FA1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589551394;
	bh=TJAayxupbpQYqp5S5DAiYfvtO2zlYGcV9KIZut84aoE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oYhNjxEANxM90+4cedv97ObUOheO4IekEjQj+IK0aZSFcA6KTBDeLylSiuxwpOWr9
	 TevMvG0l0vsv/P6hCaOvlGUyvvTxvIfMx4yN2Va3ERUpuQJENbHW9W9D03zuDVr66W
	 y6eOiHeGf9mQHYMhZ4eRQvlk0AJi/Z1wq3TlumUQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37AFFF80299;
	Fri, 15 May 2020 16:00:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92303F8028F; Fri, 15 May 2020 16:00:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A1F0F80254
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 16:00:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A1F0F80254
IronPort-SDR: xZUf4ULhDpEv7h+lvX/xXJ/imDsV+r7103gWLucYVDiN7uVXslL/M+Qw6/6Ka779dLrZOOJahe
 mXgpvMzNXhyQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 07:00:29 -0700
IronPort-SDR: biaoOxSBPW4y6hvyf5r9VJKiwpO6r02dEEh2j5ypLqKBqazpvUsEehvDCz9x9RSovZWZ7kRVTm
 E4+rrEKTK0Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,395,1583222400"; d="scan'208";a="266611048"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga006.jf.intel.com with ESMTP; 15 May 2020 07:00:27 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/8] ASoC: SOF: add a power_down_notify method
Date: Fri, 15 May 2020 16:59:52 +0300
Message-Id: <20200515135958.17511-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200515135958.17511-1-kai.vehmanen@linux.intel.com>
References: <20200515135958.17511-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Marcin Rajwa <marcin.rajwa@linux.intel.com>, daniel.baluta@nxp.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

From: Marcin Rajwa <marcin.rajwa@linux.intel.com>

This patch adds a snd_sof_dsp_power_down_notify() method which aims to
prepare the DSP for the upcoming power down.
This new function make use of SOF_IPC_PM_CTX_SAVE message.

Signed-off-by: Marcin Rajwa <marcin.rajwa@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/pm.c       | 9 +++++++++
 sound/soc/sof/sof-priv.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 119e4d644ef4..5e804a7728f5 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -256,6 +256,15 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 	return ret;
 }
 
+int snd_sof_dsp_power_down_notify(struct snd_sof_dev *sdev)
+{
+	/* Notify DSP of upcoming power down */
+	if (sof_ops(sdev)->remove)
+		return sof_send_pm_ctx_ipc(sdev, SOF_IPC_PM_CTX_SAVE);
+
+	return 0;
+}
+
 int snd_sof_runtime_suspend(struct device *dev)
 {
 	return sof_suspend(dev, true);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index a34dbae9f971..3ed39b887214 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -453,6 +453,7 @@ int snd_sof_runtime_resume(struct device *dev);
 int snd_sof_runtime_idle(struct device *dev);
 int snd_sof_resume(struct device *dev);
 int snd_sof_suspend(struct device *dev);
+int snd_sof_dsp_power_down_notify(struct snd_sof_dev *sdev);
 int snd_sof_prepare(struct device *dev);
 void snd_sof_complete(struct device *dev);
 
-- 
2.26.0

