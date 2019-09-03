Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3334FA711B
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2019 18:55:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 875C1168D;
	Tue,  3 Sep 2019 18:54:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 875C1168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567529729;
	bh=4LlH5ugQ2pqX78vCuXTvU6OwE7ISDiBsQ9xcMcbcLFw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HLLA6QEf4p5dYeqAzbBVUlBb/JXMU4lHH/qQKVEzNKX6x0gmS517OOMwI/IFWpf3S
	 WE8DN+R8gCUclcqYQbcuooF5WexlJx+TxlqZ+18fu3BQQ0BEL4JOBBxGnt6IDZdHGh
	 TLHXLseMm6wGhDmcGbRbpQznYHT0LKSoePKpPR+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7E9EF8045F;
	Tue,  3 Sep 2019 18:53:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21029F804A9; Tue,  3 Sep 2019 18:53:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from www1102.sakura.ne.jp (www1102.sakura.ne.jp [219.94.129.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50058F80228
 for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2019 18:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50058F80228
Received: from fsav109.sakura.ne.jp (fsav109.sakura.ne.jp [27.133.134.236])
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x83GrQTW037049;
 Wed, 4 Sep 2019 01:53:26 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
Received: from www1102.sakura.ne.jp (219.94.129.142)
 by fsav109.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav109.sakura.ne.jp);
 Wed, 04 Sep 2019 01:53:25 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav109.sakura.ne.jp)
Received: from localhost.localdomain (118.153.231.153.ap.dti.ne.jp
 [153.231.153.118]) (authenticated bits=0)
 by www1102.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x83GrNwk037038
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Wed, 4 Sep 2019 01:53:25 +0900 (JST)
 (envelope-from katsuhiro@katsuster.net)
From: Katsuhiro Suzuki <katsuhiro@katsuster.net>
To: Mark Brown <broonie@kernel.org>, David Yang <yangxiaohua@everest-semi.com>,
 Daniel Drake <drake@endlessm.com>, Hans de Goede <hdegoede@redhat.com>
Date: Wed,  4 Sep 2019 01:53:19 +0900
Message-Id: <20190903165322.20791-1-katsuhiro@katsuster.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Cc: Katsuhiro Suzuki <katsuhiro@katsuster.net>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v3 1/4] ASoC: es8316: judge PCM rate at later
	timing
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

This patch change the judge timing about playing/capturing PCM rate.

Original code set constraints list of PCM rate limits at set_sysclk.
This strategy works well if system is using fixed rate clock.

But some boards and SoC (such as RockPro64 and RockChip I2S) has
connected SoC MCLK out to ES8316 MCLK in. In this case, SoC side I2S
will choose suitable frequency of MCLK such as fs * mclk-fs when
user starts playing or capturing.

Bad scenario as follows (mclk-fs = 256):
  - Initialize sysclk by correct value (Ex. 12.288MHz)
    - ES8316 set constraints of PCM rate by sysclk
      48kHz (1/256), 32kHz (1/384), 30.720kHz (1/400),
      24kHz (1/512), 16kHz (1/768), 12kHz (1/1024)
  - Play 48kHz sound, it's acceptable
  - Sysclk is not changed

  - Play 32kHz sound, it's acceptable
  - Set sysclk by 8.192MHz (= fs * mclk-fs = 32k * 256)
    - ES8316 set constraints of PCM rate by sysclk
      32kHz (1/256), 21.33kHz (1/384), 20.48kHz (1/400),
      16kHz (1/512), 10.66kHz (1/768), 8kHz (1/1024)

  - Play 48kHz again, but it's NOT acceptable because constraints
    list does not allow 48kHz

Root cause of this strange behavior is changing constraints list at
set_sysclk timing. It seems that is too early to determine. So this
patch does not use constraints list and check PCM rate limit more
later timing at hw_params.

Signed-off-by: Katsuhiro Suzuki <katsuhiro@katsuster.net>
---
 sound/soc/codecs/es8316.c | 37 +++++++++++++++----------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index ed2959dbe1fb..229808fa627c 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -363,27 +363,12 @@ static int es8316_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct es8316_priv *es8316 = snd_soc_component_get_drvdata(component);
-	int i;
-	int count = 0;
 
 	es8316->sysclk = freq;
 
 	if (freq == 0)
 		return 0;
 
-	/* Limit supported sample rates to ones that can be autodetected
-	 * by the codec running in slave mode.
-	 */
-	for (i = 0; i < NR_SUPPORTED_MCLK_LRCK_RATIOS; i++) {
-		const unsigned int ratio = supported_mclk_lrck_ratios[i];
-
-		if (freq % ratio == 0)
-			es8316->allowed_rates[count++] = freq / ratio;
-	}
-
-	es8316->sysclk_constraints.list = es8316->allowed_rates;
-	es8316->sysclk_constraints.count = count;
-
 	return 0;
 }
 
@@ -449,13 +434,6 @@ static int es8316_pcm_startup(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	/* The set of sample rates that can be supported depends on the
-	 * MCLK supplied to the CODEC.
-	 */
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
-				   SNDRV_PCM_HW_PARAM_RATE,
-				   &es8316->sysclk_constraints);
-
 	return 0;
 }
 
@@ -466,12 +444,27 @@ static int es8316_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_component *component = dai->component;
 	struct es8316_priv *es8316 = snd_soc_component_get_drvdata(component);
 	u8 wordlen = 0;
+	int i;
 
 	if (!es8316->sysclk) {
 		dev_err(component->dev, "No MCLK configured\n");
 		return -EINVAL;
 	}
 
+	/* Limit supported sample rates to ones that can be autodetected
+	 * by the codec running in slave mode.
+	 */
+	for (i = 0; i < NR_SUPPORTED_MCLK_LRCK_RATIOS; i++) {
+		const unsigned int ratio = supported_mclk_lrck_ratios[i];
+
+		if (es8316->sysclk % ratio != 0)
+			continue;
+		if (es8316->sysclk / ratio == params_rate(params))
+			break;
+	}
+	if (i == NR_SUPPORTED_MCLK_LRCK_RATIOS)
+		return -EINVAL;
+
 	switch (params_format(params)) {
 	case SNDRV_PCM_FORMAT_S16_LE:
 		wordlen = ES8316_SERDATA2_LEN_16;
-- 
2.23.0.rc1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
