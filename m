Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B2E57426E
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:24:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6490D1767;
	Thu, 14 Jul 2022 06:24:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6490D1767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657772691;
	bh=/yLYH+geq49XNoPjucPvvOS5nstF1WxYkuZ8Nv55o/k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GHCOHWVjDGCqmpPupxGQZ5hQ59KHJQnJWXThD9mt2tTXweIrvGL5riFkW7jgmJQQU
	 vmW/KvteMk7qRmlHAPaOCdj5bCGnA/rdmGT1dSdPeMRXamnw0Y2NNJAcie/VeiN17s
	 h0WkSDk7JiM53XdE1HiVnBHproUuN/xXU8d3b7Ak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 090DEF80564;
	Thu, 14 Jul 2022 06:22:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8270DF80563; Thu, 14 Jul 2022 06:22:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06A31F804AC
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 06:22:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06A31F804AC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eMz+4A+t"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3F7AB61E90;
 Thu, 14 Jul 2022 04:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD409C341CF;
 Thu, 14 Jul 2022 04:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772558;
 bh=/yLYH+geq49XNoPjucPvvOS5nstF1WxYkuZ8Nv55o/k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eMz+4A+tdHtqXjB51ndYNqaoxrg06wvBDdMRg+V/Vcv9MFO8SYGf2Ziug5CvCeFzi
 BPcxQPpK8tAcxJ45FZCFUEAUimx9yL+7HcFZAjKXnib3sz5X27NmzU9kEqAgHivAbB
 jONhtcmLih92YuyWR3lIE7wCkosIXHRJbxQnW2/YHN6gWwR75wSNgoeHKAETMh3RUX
 0GNXSwPqMtEwL/JEf3a1YgatK4uJCPaxIk/1dWQAv8WLiG85Bf2RJ9zfLphtfE+eh4
 Cp5imureJbgxIhe5WGKnOS43/a+hRg1xOJFyjQznwl5+/PXKy5nt0I5dD2DxUI5Odu
 J+TKjVjYcl9MA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 06/41] ASoC: rt711: fix calibrate mutex
 initialization
Date: Thu, 14 Jul 2022 00:21:46 -0400
Message-Id: <20220714042221.281187-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042221.281187-1-sashal@kernel.org>
References: <20220714042221.281187-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, oder_chiou@realtek.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 08bb5dc6ce02374169213cea772b1c297eaf32d5 ]

Follow the same flow as rt711-sdca and initialize all mutexes at probe
time.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20220606203752.144159-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt711-sdw.c | 3 +++
 sound/soc/codecs/rt711.c     | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index f49c94baa37c..4fe68bcf2a7c 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -474,6 +474,9 @@ static int rt711_sdw_remove(struct sdw_slave *slave)
 	if (rt711->first_hw_init)
 		pm_runtime_disable(&slave->dev);
 
+	mutex_destroy(&rt711->calibrate_mutex);
+	mutex_destroy(&rt711->disable_irq_lock);
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index ea25fd58d43a..39f7ded1371e 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -1203,6 +1203,7 @@ int rt711_init(struct device *dev, struct regmap *sdw_regmap,
 	rt711->sdw_regmap = sdw_regmap;
 	rt711->regmap = regmap;
 
+	mutex_init(&rt711->calibrate_mutex);
 	mutex_init(&rt711->disable_irq_lock);
 
 	/*
@@ -1317,7 +1318,6 @@ int rt711_io_init(struct device *dev, struct sdw_slave *slave)
 			rt711_jack_detect_handler);
 		INIT_DELAYED_WORK(&rt711->jack_btn_check_work,
 			rt711_btn_check_handler);
-		mutex_init(&rt711->calibrate_mutex);
 		INIT_WORK(&rt711->calibration_work, rt711_calibration_work);
 		schedule_work(&rt711->calibration_work);
 	}
-- 
2.35.1

