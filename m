Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB4223A84E
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Aug 2020 16:22:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 828661678;
	Mon,  3 Aug 2020 16:21:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 828661678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596464542;
	bh=wmZlqZjBCObpUBM+P04gEBWf/mAv+EledPh9jR2EmAs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g5Q9FmURNKjJ81uD4MtRIzFrkGdpiKp/xJacLHQ3KWHFxMMWLYz1eTah+O/tWrU/R
	 TjvsxUZHV0R+EZ8Bi4S+oIS+Iu43aK5xEB9rB6VLAqjTa9jvfzi+hPckUduM6S6nBL
	 xB80CmhXXcVaXg6P/ZzVtVChiWZ/kc3UslYaki94=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 154B3F802DB;
	Mon,  3 Aug 2020 16:19:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D174F802C3; Mon,  3 Aug 2020 16:19:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73A2FF80234
 for <alsa-devel@alsa-project.org>; Mon,  3 Aug 2020 16:18:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73A2FF80234
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EED45B6B6;
 Mon,  3 Aug 2020 14:19:06 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 5/5] ASoC: tegra: tegra210_i2s: Fix compile warning with
 CONFIG_PM=n
Date: Mon,  3 Aug 2020 16:18:50 +0200
Message-Id: <20200803141850.23713-6-tiwai@suse.de>
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
  sound/soc/tegra/tegra210_i2s.c:167:12: warning: 'tegra210_i2s_runtime_suspend' defined but not used [-Wunused-function]
  sound/soc/tegra/tegra210_i2s.c:179:12: warning: 'tegra210_i2s_runtime_resume' defined but not used [-Wunused-function]

Fixes: c0bfa98349d1 ("ASoC: tegra: Add Tegra210 based I2S driver")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/tegra/tegra210_i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index 722092181583..a383bd5c51cd 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -164,7 +164,7 @@ static int tegra210_i2s_init(struct snd_soc_dapm_widget *w,
 	return tegra210_i2s_sw_reset(compnt, is_playback);
 }
 
-static int tegra210_i2s_runtime_suspend(struct device *dev)
+static int __maybe_unused tegra210_i2s_runtime_suspend(struct device *dev)
 {
 	struct tegra210_i2s *i2s = dev_get_drvdata(dev);
 
@@ -176,7 +176,7 @@ static int tegra210_i2s_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int tegra210_i2s_runtime_resume(struct device *dev)
+static int __maybe_unused tegra210_i2s_runtime_resume(struct device *dev)
 {
 	struct tegra210_i2s *i2s = dev_get_drvdata(dev);
 	int err;
-- 
2.16.4

