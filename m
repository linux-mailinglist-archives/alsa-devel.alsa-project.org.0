Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8294B8F241
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:32:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 030351679;
	Thu, 15 Aug 2019 19:31:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 030351679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565890359;
	bh=SUE26OR68fviG58/nNly1dA3jA99AzbDa42oy9Vkkc8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=RFn8QHlqYx96ZmEBLHQ7C7JmR+e5kOVW1iad6O3b2LtPquOoIazczSyDqnedVXDY5
	 C5dmXrT04Q/b9Eo0ldBa6yhHb9qCgwVI9OhXE+pM+umsh03YCutPTWRLqt8cSOanAV
	 J2n++HquhsH52/ynL8hDo63nItPaZJ7dI0cwffqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AD52F8085D;
	Thu, 15 Aug 2019 19:16:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B95E5F8070C; Thu, 15 Aug 2019 19:15:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f98.google.com (mail-wm1-f98.google.com
 [209.85.128.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BE9FF8060D
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BE9FF8060D
Received: by mail-wm1-f98.google.com with SMTP id 10so1879685wmp.3
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=qK+K3lvg5j7KBSfj3mqp/CfZUMLY6IjIIgyqWda7qdY=;
 b=U4VPTvyBxXBHmGrdVj/0I2zFe6SiTAPdANB0uDnXMNjeZcB7lmCdEucX2vO5Sks+X2
 hqff6npEKXEJrHCO2SHA7nX0dyPNAXrH9Ea7QJZ4zcx1a8zDyFSQSkISkljhhd1D3e0Y
 ggZ9Vo4s92IhfOHRFrvf5Td0hdJRGnTZjLLKRFkWJi5adHDcsfOwtybCUcPhIRs72SjG
 X+ZYYfsRf2JeO/nErkJYiPiTSqMWzVSiU4ZQ1VoiEIBGPK1dWpbbpXRSEwdg7iA8ExZW
 +fELHvxpZvHOx2IqCRN0ETDkmv2JEHNx9SQAYnV/5CnIp7qdxOCwDl+mJH1EgeuAzlAz
 zq5w==
X-Gm-Message-State: APjAAAV61rd0ofTu7qrmFpvQu7wJ0Bh3J2tg1OsGi4NJTBGRRxtTD50G
 bCKj9EgkVG4v7iVqgkHxNXgMXB6+aZKEuFhbcSc/KEls2M+JBoonqB02F/lsEXE6MA==
X-Google-Smtp-Source: APXvYqzwc/xYr8huKOghn9vmtQMt/8YLWEaKPN+5vpK0OgbJx4iilw7n+VrgNxOG+/p65MKqhugGqHofkiLa
X-Received: by 2002:a7b:c198:: with SMTP id y24mr3681836wmi.131.1565889268536; 
 Thu, 15 Aug 2019 10:14:28 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id r12sm59823wrw.27.2019.08.15.10.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:28 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKW-00052a-AD; Thu, 15 Aug 2019 17:14:28 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D1B542742BD6; Thu, 15 Aug 2019 18:14:27 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Masanari Iida <standby24x7@gmail.com>
In-Reply-To: <20190813034235.30673-1-standby24x7@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171427.D1B542742BD6@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:27 +0100 (BST)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, peter.ujfalusi@ti.com, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: ti: Fix typos in ti/Kconfig" to the
	asoc tree
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

   ASoC: ti: Fix typos in ti/Kconfig

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From ae3a5901dde2ab136ec0cebda2fccc48e810d2ec Mon Sep 17 00:00:00 2001
From: Masanari Iida <standby24x7@gmail.com>
Date: Tue, 13 Aug 2019 12:42:35 +0900
Subject: [PATCH] ASoC: ti: Fix typos in ti/Kconfig

This patch fixes some spelling typo in Kconfig.

Signed-off-by: Masanari Iida <standby24x7@gmail.com>
Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Link: https://lore.kernel.org/r/20190813034235.30673-1-standby24x7@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
index 2197f3e1eaed..87a9b9dd4e98 100644
--- a/sound/soc/ti/Kconfig
+++ b/sound/soc/ti/Kconfig
@@ -12,7 +12,7 @@ config SND_SOC_TI_SDMA_PCM
 
 comment "Texas Instruments DAI support for:"
 config SND_SOC_DAVINCI_ASP
-	tristate "daVinci Audio Serial Port (ASP) or McBSP suport"
+	tristate "daVinci Audio Serial Port (ASP) or McBSP support"
 	depends on ARCH_DAVINCI || COMPILE_TEST
 	select SND_SOC_TI_EDMA_PCM
 	help
@@ -33,7 +33,7 @@ config SND_SOC_DAVINCI_MCASP
 	  - Keystone devices
 
 config SND_SOC_DAVINCI_VCIF
-	tristate "daVinci Voice Interface (VCIF) suport"
+	tristate "daVinci Voice Interface (VCIF) support"
 	depends on ARCH_DAVINCI || COMPILE_TEST
 	select SND_SOC_TI_EDMA_PCM
 	help
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
