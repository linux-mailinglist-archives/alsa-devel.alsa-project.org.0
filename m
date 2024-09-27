Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D47988042
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2024 10:24:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58DFBDE5;
	Fri, 27 Sep 2024 10:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58DFBDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727425468;
	bh=1/MpVD+7+dOCpQgXs3U4X3eSEUe5h3A8K/qR3gDuJRU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=gDGQviQAOKW+de8J8hkfKVKHg7l4cssalyc1UEKwvtkTJdAWidI/+dInDD/BlxBfs
	 9FDLNgAO2YE7orFMZ6/GOX6HXT0PyDDZYZdsVzdKZ+9wxULCzPwweyYOzd6nxYLXnW
	 bMRbACnUFuc4Wlp5Qz+g9vAgB4p6kNVdKk70xGjU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 411EAF805E6; Fri, 27 Sep 2024 10:23:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08197F805E7;
	Fri, 27 Sep 2024 10:23:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7453F802DB; Fri, 27 Sep 2024 10:23:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 22989F80107
	for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2024 10:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22989F80107
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6814A1A1B60;
	Fri, 27 Sep 2024 10:23:14 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 379251A1B45;
	Fri, 27 Sep 2024 10:23:14 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id ED3DA183DC02;
	Fri, 27 Sep 2024 16:23:12 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ASoC: fsl_micfil: Add mclk enable flag
Date: Fri, 27 Sep 2024 16:00:30 +0800
Message-Id: <1727424031-19551-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1727424031-19551-1-git-send-email-shengjiu.wang@nxp.com>
References: <1727424031-19551-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: TP64IJSXMFJIRFYQXMIQSRAWTC5TIADO
X-Message-ID-Hash: TP64IJSXMFJIRFYQXMIQSRAWTC5TIADO
X-MailFrom: shengjiu.wang@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TP64IJSXMFJIRFYQXMIQSRAWTC5TIADO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Previously the mclk is enabled in probe() stage, which
is not necessary. Move mclk enablement to hw_params()
and mclk disablement to hw_free() will be more efficient.
'mclk_flag' is used for this case.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index c347cb3a4712..6ecf46e9ac4c 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -58,6 +58,7 @@ struct fsl_micfil {
 	int vad_detected;
 	struct fsl_micfil_verid verid;
 	struct fsl_micfil_param param;
+	bool mclk_flag;  /* mclk enable flag */
 };
 
 struct fsl_micfil_soc_data {
@@ -693,7 +694,6 @@ static int fsl_micfil_reparent_rootclk(struct fsl_micfil *micfil, unsigned int s
 	clk = micfil->mclk;
 
 	/* Disable clock first, for it was enabled by pm_runtime */
-	clk_disable_unprepare(clk);
 	fsl_asoc_reparent_pll_clocks(dev, clk, micfil->pll8k_clk,
 				     micfil->pll11k_clk, ratio);
 	ret = clk_prepare_enable(clk);
@@ -730,6 +730,8 @@ static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 	if (ret)
 		return ret;
 
+	micfil->mclk_flag = true;
+
 	ret = clk_set_rate(micfil->mclk, rate * clk_div * osr * 8);
 	if (ret)
 		return ret;
@@ -764,6 +766,17 @@ static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int fsl_micfil_hw_free(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	struct fsl_micfil *micfil = snd_soc_dai_get_drvdata(dai);
+
+	clk_disable_unprepare(micfil->mclk);
+	micfil->mclk_flag = false;
+
+	return 0;
+}
+
 static int fsl_micfil_dai_probe(struct snd_soc_dai *cpu_dai)
 {
 	struct fsl_micfil *micfil = dev_get_drvdata(cpu_dai->dev);
@@ -806,6 +819,7 @@ static const struct snd_soc_dai_ops fsl_micfil_dai_ops = {
 	.startup	= fsl_micfil_startup,
 	.trigger	= fsl_micfil_trigger,
 	.hw_params	= fsl_micfil_hw_params,
+	.hw_free	= fsl_micfil_hw_free,
 };
 
 static struct snd_soc_dai_driver fsl_micfil_dai = {
@@ -1279,7 +1293,8 @@ static int fsl_micfil_runtime_suspend(struct device *dev)
 
 	regcache_cache_only(micfil->regmap, true);
 
-	clk_disable_unprepare(micfil->mclk);
+	if (micfil->mclk_flag)
+		clk_disable_unprepare(micfil->mclk);
 	clk_disable_unprepare(micfil->busclk);
 
 	return 0;
@@ -1294,10 +1309,12 @@ static int fsl_micfil_runtime_resume(struct device *dev)
 	if (ret < 0)
 		return ret;
 
-	ret = clk_prepare_enable(micfil->mclk);
-	if (ret < 0) {
-		clk_disable_unprepare(micfil->busclk);
-		return ret;
+	if (micfil->mclk_flag) {
+		ret = clk_prepare_enable(micfil->mclk);
+		if (ret < 0) {
+			clk_disable_unprepare(micfil->busclk);
+			return ret;
+		}
 	}
 
 	regcache_cache_only(micfil->regmap, false);
-- 
2.34.1

