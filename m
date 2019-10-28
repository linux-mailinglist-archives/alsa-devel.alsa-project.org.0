Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E02E7449
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 16:00:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F26D31FA6;
	Mon, 28 Oct 2019 16:00:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F26D31FA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572274858;
	bh=DBy64jGdC377jsbfBssbrJ0YPgsMvZwKwCeLqGOQXoQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=SGO7YlFOCkJp4M+ZpQ8dZOiJBz3OoUYGM86fyByq6QWXRwRa/PRA9/zsSB8mbook1
	 /x0Mz+yzHN1pM4ZmOtNPJy+RcMXd/RpbY8XL5uZzuzCdIz8a12t6fOo6A4Je9As5wn
	 MUX9wOrprvrd7S9MxGoytzfveCDVWxRirovut13A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE1FEF805FC;
	Mon, 28 Oct 2019 15:56:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BF65F8048F; Mon, 28 Oct 2019 15:56:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B947CF8048F
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:56:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B947CF8048F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ONfev3wv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=coTvt0m8DwW3lU6vCTRtq0KOWQqMujuWuKEl3udRygk=; b=ONfev3wvfP2h
 DKDPimJW7rzHcmnY9n+tIzqLYcm8KsYpoMLXY5LghRbxYfSGcuqsfD64Q/FL1GJvUB2wQ94TT3Ly3
 qmAb37oReCXrXSN5lNnfqzXqBtlgggsiwfHiNlusLn7os6N1sT5r7NNb86aYIjrbzrVRLOdRf0L03
 ZEuaE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iP6Rb-0008P6-VI; Mon, 28 Oct 2019 14:56:32 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 40F3C2740409; Mon, 28 Oct 2019 14:56:29 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20191025224122.7718-22-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191028145629.40F3C2740409@ypsilon.sirena.org.uk>
Date: Mon, 28 Oct 2019 14:56:29 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: PM: implement prepare/complete
	callbacks" to the asoc tree
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

   ASoC: SOF: PM: implement prepare/complete callbacks

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

From 0b50b3b1c3bc2a2c9eeab418b3de3e60e0530cf4 Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Fri, 25 Oct 2019 17:41:17 -0500
Subject: [PATCH] ASoC: SOF: PM: implement prepare/complete callbacks

Implement the prepare() and complete() callbacks for power management,
initialize s0_suspend flag at prepare(), and reset it at complete().

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191025224122.7718-22-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/pm.c       | 23 +++++++++++++++++++++++
 sound/soc/sof/sof-priv.h |  2 ++
 2 files changed, 25 insertions(+)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 584241e9734a..99e4e6ffff74 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -439,3 +439,26 @@ int snd_sof_suspend(struct device *dev)
 	return sof_suspend(dev, false);
 }
 EXPORT_SYMBOL(snd_sof_suspend);
+
+int snd_sof_prepare(struct device *dev)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+
+#if defined(CONFIG_ACPI)
+	sdev->s0_suspend = acpi_target_system_state() == ACPI_STATE_S0;
+#else
+	/* will suspend to S3 by default */
+	sdev->s0_suspend = false;
+#endif
+
+	return 0;
+}
+EXPORT_SYMBOL(snd_sof_prepare);
+
+void snd_sof_complete(struct device *dev)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+
+	sdev->s0_suspend = false;
+}
+EXPORT_SYMBOL(snd_sof_complete);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index c2541d020bde..6408ac88a3e5 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -492,6 +492,8 @@ int snd_sof_runtime_resume(struct device *dev);
 int snd_sof_runtime_idle(struct device *dev);
 int snd_sof_resume(struct device *dev);
 int snd_sof_suspend(struct device *dev);
+int snd_sof_prepare(struct device *dev);
+void snd_sof_complete(struct device *dev);
 int snd_sof_set_d0_substate(struct snd_sof_dev *sdev,
 			    enum sof_d0_substate d0_substate);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
