Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7542B57432A
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:32:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1872818C2;
	Thu, 14 Jul 2022 06:31:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1872818C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657773127;
	bh=MThhBE+OgevlSZDjVIJEd6z5DpIYHMc9RCE/7PEP6cQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CrtZUHCL1YLX3dfC7VM0saklETo3ljOCtCz2XzEI12q6HYzhSCBYX8jcPqt1Evmpj
	 f+sePFSr7IA0Jzshg7pPHaJFU2XDPAAIPv8pQ1lfVZZAsBw35FX+4TVtRMvRGzglJy
	 LLNtMfEwcK0LgO5psL3sQ++LSgDiPXhOGCoJ/goc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4ECDF80611;
	Thu, 14 Jul 2022 06:24:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C35CF80611; Thu, 14 Jul 2022 06:24:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FC77F80557
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 06:24:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FC77F80557
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Mk+gyclt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9886461E97;
 Thu, 14 Jul 2022 04:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6884AC34115;
 Thu, 14 Jul 2022 04:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772683;
 bh=MThhBE+OgevlSZDjVIJEd6z5DpIYHMc9RCE/7PEP6cQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Mk+gycltGEvRZ6KF8xr1eEpES+NMEif2Qa4SaqwsWipC1So80M9jjyDyX9NrZsYTf
 h/dwK0+LDXiGmm5/005u04fZxFfFK7Cs4/kmav25wBFutmPzOkNM8LpkQ+BnZiMJwG
 6bwpn/5AA9p+oNk+52RfEgdXgoo7POI4IeU2DWzF0Dhkoff/S11OOM0n7aJDXv1JWO
 PPHrtVO3B0I2pmFQmwUCpr0LTa/QYWFDDM4//EkCGBw14j9rJIP/3GJosWm5WhuNf3
 c6gCVgcsDGJwq+4Z1E7ohhdoBHehBvaWgMGzXjXv1vY4Y2m2R+qFYR6JZnvhZzL9My
 9EXLC1bq/DVRg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 05/28] ASoC: Intel: sof_sdw: handle errors on
 card registration
Date: Thu, 14 Jul 2022 00:24:06 -0400
Message-Id: <20220714042429.281816-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042429.281816-1-sashal@kernel.org>
References: <20220714042429.281816-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, cezary.rojewski@intel.com,
 kai.vehmanen@linux.intel.com, peter.ujfalusi@linux.intel.com, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 gongjun.song@intel.com, Rander Wang <rander.wang@intel.com>,
 liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, ranjani.sridharan@linux.intel.com,
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

[ Upstream commit fe154c4ff376bc31041c6441958a08243df09c99 ]

If the card registration fails, typically because of deferred probes,
the device properties added for headset codecs are not removed, which
leads to kernel oopses in driver bind/unbind tests.

We already clean-up the device properties when the card is removed,
this code can be moved as a helper and called upon card registration
errors.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20220606203752.144159-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_sdw.c | 51 ++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 0bf3e56e1d58..abe39a0ef14b 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1323,6 +1323,33 @@ static struct snd_soc_card card_sof_sdw = {
 	.late_probe = sof_sdw_card_late_probe,
 };
 
+static void mc_dailink_exit_loop(struct snd_soc_card *card)
+{
+	struct snd_soc_dai_link *link;
+	int ret;
+	int i, j;
+
+	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++) {
+		if (!codec_info_list[i].exit)
+			continue;
+		/*
+		 * We don't need to call .exit function if there is no matched
+		 * dai link found.
+		 */
+		for_each_card_prelinks(card, j, link) {
+			if (!strcmp(link->codecs[0].dai_name,
+				    codec_info_list[i].dai_name)) {
+				ret = codec_info_list[i].exit(card, link);
+				if (ret)
+					dev_warn(card->dev,
+						 "codec exit failed %d\n",
+						 ret);
+				break;
+			}
+		}
+	}
+}
+
 static int mc_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &card_sof_sdw;
@@ -1387,6 +1414,7 @@ static int mc_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
 		dev_err(card->dev, "snd_soc_register_card failed %d\n", ret);
+		mc_dailink_exit_loop(card);
 		return ret;
 	}
 
@@ -1398,29 +1426,8 @@ static int mc_probe(struct platform_device *pdev)
 static int mc_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct snd_soc_dai_link *link;
-	int ret;
-	int i, j;
 
-	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++) {
-		if (!codec_info_list[i].exit)
-			continue;
-		/*
-		 * We don't need to call .exit function if there is no matched
-		 * dai link found.
-		 */
-		for_each_card_prelinks(card, j, link) {
-			if (!strcmp(link->codecs[0].dai_name,
-				    codec_info_list[i].dai_name)) {
-				ret = codec_info_list[i].exit(card, link);
-				if (ret)
-					dev_warn(&pdev->dev,
-						 "codec exit failed %d\n",
-						 ret);
-				break;
-			}
-		}
-	}
+	mc_dailink_exit_loop(card);
 
 	return 0;
 }
-- 
2.35.1

