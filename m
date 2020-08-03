Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E7023A855
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 16:23:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 702541670;
	Mon,  3 Aug 2020 16:22:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 702541670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596464608;
	bh=C3xPIeI/8xLEr3Ocgl4onvX6I/p53BfgcXHRasZINw4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mb7M/NBqtPXO+1Nvv/ujtfqDPm1EPguBGBaKnVKJB5htj+jwu+xpPa/Al8FGcwKfO
	 7L+VTCZ4tsICIVhnIC44TE3Yz8jQhLS2aTg4hglBnemu55uCdYpQYZhKWJGpYmy4Tq
	 M6JBBYW8oKhIjusBdSHIFZnlZmsS2FXBtYlbGc5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FBA9F802E7;
	Mon,  3 Aug 2020 16:19:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98A0CF80218; Mon,  3 Aug 2020 16:19:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02780F80249
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 16:18:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02780F80249
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D410FB69D;
 Mon,  3 Aug 2020 14:19:06 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/5] ASoC: tegra: tegra210_ahub: Fix compile warning with
 CONFIG_PM=n
Date: Mon,  3 Aug 2020 16:18:48 +0200
Message-Id: <20200803141850.23713-4-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200803141850.23713-1-tiwai@suse.de>
References: <20200803141850.23713-1-tiwai@suse.de>
Cc: Sameer Pujar <spujar@nvidia.com>, alsa-devel@alsa-project.org
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

Fix trivial compile warnings wrt unused functions by adding
__maybe_unused prefix:
  sound/soc/tegra/tegra210_ahub.c:567:12: warning: 'tegra_ahub_runtime_suspend' defined but not used [-Wunused-function]
  sound/soc/tegra/tegra210_ahub.c:579:12: warning: 'tegra_ahub_runtime_resume' defined but not used [-Wunused-function]

Fixes: 16e1bcc2caf4 ("ASoC: tegra: Add Tegra210 based AHUB driver")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/tegra/tegra210_ahub.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index 5123a96fdde8..66287a7c9865 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -564,7 +564,7 @@ static const struct of_device_id tegra_ahub_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_ahub_of_match);
 
-static int tegra_ahub_runtime_suspend(struct device *dev)
+static int __maybe_unused tegra_ahub_runtime_suspend(struct device *dev)
 {
 	struct tegra_ahub *ahub = dev_get_drvdata(dev);
 
@@ -576,7 +576,7 @@ static int tegra_ahub_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra_ahub_runtime_resume(struct device *dev)
+static int __maybe_unused tegra_ahub_runtime_resume(struct device *dev)
 {
 	struct tegra_ahub *ahub = dev_get_drvdata(dev);
 	int err;
-- 
2.16.4

