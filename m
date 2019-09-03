Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F7BA712A
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2019 18:57:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64E5E169F;
	Tue,  3 Sep 2019 18:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64E5E169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567529835;
	bh=TEZqTKkHOn/0ErawKU0DILN1IjE/KsNkm289vkwUtQE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t7+EDUNJU4zZBtqwamNTBdsiCtWqZGfN4yClb7NCo7GBm7o9IOrKt7rNXFTyO0xW9
	 1y5jqKFcrqdg1hFC5/l9lO/CYmYERB0hGd2pcNyoA3kwokgm9bkfSZGDk/CnDb/jvA
	 dA1vSPr9aP1sdwNIDvEsQOKdAsZl8Dwfmgkv4IMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5645CF805FD;
	Tue,  3 Sep 2019 18:53:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 490E0F805F9; Tue,  3 Sep 2019 18:53:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from www1102.sakura.ne.jp (www1102.sakura.ne.jp [219.94.129.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E1CDF8011E
 for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2019 18:53:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E1CDF8011E
Received: from fsav401.sakura.ne.jp (fsav401.sakura.ne.jp [133.242.250.100])
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x83GrQRs037055;
 Wed, 4 Sep 2019 01:53:26 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
Received: from www1102.sakura.ne.jp (219.94.129.142)
 by fsav401.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav401.sakura.ne.jp);
 Wed, 04 Sep 2019 01:53:26 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav401.sakura.ne.jp)
Received: from localhost.localdomain (118.153.231.153.ap.dti.ne.jp
 [153.231.153.118]) (authenticated bits=0)
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x83GrNwm037038
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Wed, 4 Sep 2019 01:53:26 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
From: Katsuhiro Suzuki <katsuhiro@katsuster.net>
To: Mark Brown <broonie@kernel.org>, David Yang <yangxiaohua@everest-semi.com>,
 Daniel Drake <drake@endlessm.com>, Hans de Goede <hdegoede@redhat.com>
Date: Wed,  4 Sep 2019 01:53:21 +0900
Message-Id: <20190903165322.20791-3-katsuhiro@katsuster.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190903165322.20791-1-katsuhiro@katsuster.net>
References: <20190903165322.20791-1-katsuhiro@katsuster.net>
MIME-Version: 1.0
Cc: Katsuhiro Suzuki <katsuhiro@katsuster.net>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v3 3/4] ASoC: es8316: support fixed clock rate
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch supports some type of machine drivers that use fixed clock
rate. After applied this patch, sysclk == 0 means there is no
constraint of sound rate and other values will set constraints which
is derived by sysclk setting.

Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>

---

Changes from v2:
  - Newly added
---
 sound/soc/codecs/es8316.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index ab41f2c056bd..bf390bc64177 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -432,20 +432,6 @@ static int es8316_set_dai_fmt(struct snd_soc_dai *codec_dai,
 	return 0;
 }
 
-static int es8316_pcm_startup(struct snd_pcm_substream *substream,
-			      struct snd_soc_dai *dai)
-{
-	struct snd_soc_component *component = dai->component;
-	struct es8316_priv *es8316 = snd_soc_component_get_drvdata(component);
-
-	if (es8316->sysclk == 0) {
-		dev_err(component->dev, "No sysclk provided\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static int es8316_pcm_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
@@ -455,17 +441,16 @@ static int es8316_pcm_hw_params(struct snd_pcm_substream *substream,
 	u8 wordlen = 0;
 	int i;
 
-	if (!es8316->sysclk) {
-		dev_err(component->dev, "No MCLK configured\n");
-		return -EINVAL;
-	}
-
 	/* Limit supported sample rates to ones that can be autodetected
 	 * by the codec running in slave mode.
 	 */
 	for (i = 0; i < NR_SUPPORTED_MCLK_LRCK_RATIOS; i++) {
 		const unsigned int ratio = supported_mclk_lrck_ratios[i];
 
+		/* Accept any rates if sysclk is 0. */
+		if (es8316->sysclk == 0)
+			break;
+
 		if (es8316->sysclk % ratio != 0)
 			continue;
 		if (es8316->sysclk / ratio == params_rate(params))
@@ -509,7 +494,6 @@ static int es8316_mute(struct snd_soc_dai *dai, int mute)
 			SNDRV_PCM_FMTBIT_S24_LE)
 
 static const struct snd_soc_dai_ops es8316_ops = {
-	.startup = es8316_pcm_startup,
 	.hw_params = es8316_pcm_hw_params,
 	.set_fmt = es8316_set_dai_fmt,
 	.set_sysclk = es8316_set_dai_sysclk,
-- 
2.23.0.rc1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
