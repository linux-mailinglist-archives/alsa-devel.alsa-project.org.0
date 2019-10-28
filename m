Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E955FE745E
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 16:03:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 814EA1F89;
	Mon, 28 Oct 2019 16:02:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 814EA1F89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572275018;
	bh=UkLSWnUaMY3tQJIM5ct6tZ2d+yzmCiZzkaWy04uXtPI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=SX7Gkhgjf7iLLoIIkEmyWoWkwyEkawO71v5u6OMERnb03yHvDQC6kBESsh4QAPTey
	 SSDM95+WBNw2g51yFcBmGqyDrpg5WDmjN9duqL3HDKmzJrk+GzuIUvkbejIWhdknev
	 +wrpUul2qC/vGeEa3XI8uy2vT//qUh7g6LSTTkJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B192F806F7;
	Mon, 28 Oct 2019 15:57:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF4B9F80672; Mon, 28 Oct 2019 15:56:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C5FAF805AE
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:56:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C5FAF805AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="trhnb2J9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=A8PXz5j7o/kpD2Tkjbm77HJ1g7QRZpTiLze4S7LVpPE=; b=trhnb2J9Penq
 o64gUjQ1WjeZjmmWedGm3cG1R+8O52L/P3VyCd/s409dxqCXCAytvyU6sDTwAbcJpzsFVSkcWJcxB
 JcdJE4t4PVzGw3x19v+xHEMA4WTRJyaa7dE5sPH6gCHQJlyREVMW7bNrXaE9UoGiIqrTKSO9GbwWD
 aWJ5U=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iP6Rc-0008P8-0q; Mon, 28 Oct 2019 14:56:32 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 12DDB2741532; Mon, 28 Oct 2019 14:56:30 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20191025224122.7718-18-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191028145630.12DDB2741532@ypsilon.sirena.org.uk>
Date: Mon, 28 Oct 2019 14:56:30 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: PM: add helpers for setting D0
	substate for ADSP" to the asoc tree
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

   ASoC: SOF: PM: add helpers for setting D0 substate for ADSP

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

From 601252869f50af6f5ab377e7f4846d7b09cc66c0 Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Fri, 25 Oct 2019 17:41:13 -0500
Subject: [PATCH] ASoC: SOF: PM: add helpers for setting D0 substate for ADSP

Add snd_sof_set_d0_substate() helper for setting ADSP to a specific D0
substate, it will call into the platform specific implementation, and
update the d0_substate at success.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191025224122.7718-18-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/pm.c       | 17 +++++++++++++++++
 sound/soc/sof/sof-priv.h |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index ac900fb3379e..584241e9734a 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -411,6 +411,23 @@ int snd_sof_runtime_resume(struct device *dev)
 }
 EXPORT_SYMBOL(snd_sof_runtime_resume);
 
+int snd_sof_set_d0_substate(struct snd_sof_dev *sdev,
+			    enum sof_d0_substate d0_substate)
+{
+	int ret;
+
+	/* do platform specific set_state */
+	ret = snd_sof_dsp_set_power_state(sdev, d0_substate);
+	if (ret < 0)
+		return ret;
+
+	/* update dsp D0 sub-state */
+	sdev->d0_substate = d0_substate;
+
+	return 0;
+}
+EXPORT_SYMBOL(snd_sof_set_d0_substate);
+
 int snd_sof_resume(struct device *dev)
 {
 	return sof_resume(dev, false);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 7a21a45d3635..2231c673c678 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -485,6 +485,8 @@ int snd_sof_runtime_resume(struct device *dev);
 int snd_sof_runtime_idle(struct device *dev);
 int snd_sof_resume(struct device *dev);
 int snd_sof_suspend(struct device *dev);
+int snd_sof_set_d0_substate(struct snd_sof_dev *sdev,
+			    enum sof_d0_substate d0_substate);
 
 void snd_sof_new_platform_drv(struct snd_sof_dev *sdev);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
