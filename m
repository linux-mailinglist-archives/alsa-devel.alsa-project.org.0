Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A5944BF8
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 21:17:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 017E6189A;
	Thu, 13 Jun 2019 21:16:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 017E6189A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560453432;
	bh=NOjT78+1pBYIrHOpAuMqVSpDpYsb15ypPraVhH1waug=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Rg8H3RRV4UnLV3pCWSxo3jzfO+zUyR5kVyEbpk2jY7qb/8a9lgzbQ0mZrgHnUKQAw
	 OcC5D4OReSbiiOLJgKQ/El1HbgngtcTUXiIQA6Yg3Oom7ONeRCEaAzZZx3R5ytg1qo
	 KqA2MeZwbdZbMW3jQ1/iQtm/Wdv511lQvVctiGXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28356F89783;
	Thu, 13 Jun 2019 21:06:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3171FF89761; Thu, 13 Jun 2019 21:06:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F645F89766
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 21:06:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F645F89766
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="AIzYmtFm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=zyKQSEzlBjtL0QUvgSCigZKyES14fmoQwjdOX3AzRe0=; b=AIzYmtFmd9vK
 WVM5zmnC/q+JAvh51VOXqRyl227Zr/UtNJOtMa0/ZiJ+6ZdNfTUtic+8FTVPVVGgLaICw4rLPYiIA
 UUN98yaz3RfWDkFrZ9CCg8tqSdkykxJwOI/CNSJ+vGfNHJuU6KAxTP8GyfOYyWWJtuC0fVx/keP1E
 JPNNg=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hbV30-0005Rs-UU; Thu, 13 Jun 2019 19:06:06 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 69A68440046; Thu, 13 Jun 2019 20:06:06 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20190612165705.1858-5-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190613190606.69A68440046@finisterre.sirena.org.uk>
Date: Thu, 13 Jun 2019 20:06:06 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: ignore unrecoverable CTX_SAVE IPC
	errors at suspend" to the asoc tree
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

   ASoC: SOF: ignore unrecoverable CTX_SAVE IPC errors at suspend

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From e2eba551d2f4226400a6bb7871fef439ad1318dd Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Wed, 12 Jun 2019 11:57:04 -0500
Subject: [PATCH] ASoC: SOF: ignore unrecoverable CTX_SAVE IPC errors at
 suspend

As part of the suspend flow, a context save IPC message is
sent to the firmware before powering down the DSP. If errors
are met, the suspend flow is aborted with current code.

Change the behaviour such that if firmware returns -EBUSY or
-EAGAIN, return the error codes to PM core as before. The device
is left in active state in this case.

If other errors are reported, print a warning but do not block the
suspend flow. As per interface specification, no valid error can be
returned in this scenario. If the hardware has hit a fatal error and
is not able to respond successfully, best recovery method is to
proceed with suspend and power off the DSP.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/pm.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 8ef1d51025d8..b7843f02ef67 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -343,11 +343,20 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 #endif
 	/* notify DSP of upcoming power down */
 	ret = sof_send_pm_ipc(sdev, SOF_IPC_PM_CTX_SAVE);
-	if (ret < 0) {
+	if (ret == -EBUSY || ret == -EAGAIN) {
+		/*
+		 * runtime PM has logic to handle -EBUSY/-EAGAIN so
+		 * pass these errors up
+		 */
 		dev_err(sdev->dev,
 			"error: ctx_save ipc error during suspend %d\n",
 			ret);
 		return ret;
+	} else if (ret < 0) {
+		/* FW in unexpected state, continue to power down */
+		dev_warn(sdev->dev,
+			 "ctx_save ipc error %d, proceeding with suspend\n",
+			 ret);
 	}
 
 	/* power down all DSP cores */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
