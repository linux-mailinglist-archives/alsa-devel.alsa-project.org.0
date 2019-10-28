Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 765FBE746C
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 16:06:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1593D1F83;
	Mon, 28 Oct 2019 16:05:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1593D1F83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572275174;
	bh=fPxLjvJ7MbNcZJPoONL+VK+crOus6CcWCIkzS/u9Aqs=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dP7K263ct+mMiS2jtB3mMDnQw2lKaknWdFKEuAO9vtrVsS0qORqRNO1TDYmsUB82c
	 Gp6x5hzmIvuwkWS3smLqdUgdRORgAnKPzuUbR3SYaluC3JqtSN2zumi2Wo669KcC+p
	 S0Lps+LaAxQgVAU9zWYPMgHNhfbdco6ZPMRHC91Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CCF6F80715;
	Mon, 28 Oct 2019 15:57:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0B8AF8067A; Mon, 28 Oct 2019 15:56:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82CF4F805FD
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:56:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82CF4F805FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="X95b8cBz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=ey/3PiuUPB8d87IF+/fgXCV+i2UoagMGLndzYse3MCQ=; b=X95b8cBzLayQ
 7ENvEuMhMkGAbvOJrK9v2sjw1f17H30+QSx5GCqHfeMeV1jdBp8kzqhLzpsCKmVIIUpeR7UXA1eFt
 zVB1lZ/e30MChMOtJtyvb9zKaLwWoD3bmf8B092Wsef/APEdjkqaxKyGRzu1sPc32AeIm0UCqYJAw
 O23G4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iP6Rc-0008PM-FA; Mon, 28 Oct 2019 14:56:32 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1A05327403EF; Mon, 28 Oct 2019 14:56:31 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20191025224122.7718-13-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191028145631.1A05327403EF@ypsilon.sirena.org.uk>
Date: Mon, 28 Oct 2019 14:56:31 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: PM: rename sof_send_pm_ipc to
	sof_send_pm_ctx_ipc" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: PM: rename sof_send_pm_ipc to sof_send_pm_ctx_ipc

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 7c7eba2402c11137d1fa1d3fb964a2c6fc1ded3e Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Fri, 25 Oct 2019 17:41:08 -0500
Subject: [PATCH] ASoC: SOF: PM: rename sof_send_pm_ipc to sof_send_pm_ctx_ipc

The helper sof_send_pm_ipc() is only suitable for context save/restore
IPCs' sending, so rename it to sof_send_pm_ctx_ipc here.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191025224122.7718-13-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
