Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9DE2EEECF
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 09:55:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC8B516BC;
	Fri,  8 Jan 2021 09:54:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC8B516BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610096108;
	bh=2jWceUbZh6MrbsPjW8NMHq/2QwyFs8lI10Ogvkc3Rb8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CEmUCef4BSik1p8FfJANj1RyfXKLHyywZyVsfkVWoI1+BIIrs+rCZjtIJY2sT1d6M
	 nmeq2I7BfOfsl5ry/X996+HW8U0GsN2OYcWVrJtvOx4aKhN1PMz4wiLXKuP5F0MvLj
	 5LkcqTmfAFB/mK3COidbgZ5QPU+3PeiqkEZkJIL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34FE0F80165;
	Fri,  8 Jan 2021 09:53:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD62EF80166; Fri,  8 Jan 2021 09:53:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
 by alsa1.perex.cz (Postfix) with ESMTP id 28664F800FD
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 09:53:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28664F800FD
Received: from localhost.localdomain (unknown [124.16.141.241])
 by APP-01 (Coremail) with SMTP id qwCowADHzxOCHfhf2ImaAQ--.7931S2;
 Fri, 08 Jan 2021 16:53:22 +0800 (CST)
From: Xu Wang <vulab@iscas.ac.cn>
To: support.opensource@diasemi.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: codecs: da*: Remove redundant null check before
 clk_prepare_enable/clk_disable_unprepare
Date: Fri,  8 Jan 2021 08:53:19 +0000
Message-Id: <20210108085319.6912-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: qwCowADHzxOCHfhf2ImaAQ--.7931S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZr1UKFW5ZFWftF4DZrW8Zwb_yoW5ury3pF
 n3trZYq3y7XFWrZrn8Jrs7ZF10grWY9FWUXws2k3W5Xr15AFs2gw1ktr13ZFZ5AF93Crnx
 WrnFqrW0yF97Wa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F
 4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r43MxAI
 w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
 4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
 rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJw
 CI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
 cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5PKs5UUUUU==
X-Originating-IP: [124.16.141.241]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCQoPA102Z2nUrwAAsR
Cc: linux-kernel@vger.kernel.org
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

Because clk_prepare_enable() and clk_disable_unprepare() already checked
NULL clock parameter, so the additional checks are unnecessary, just
remove them.

Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
---
 sound/soc/codecs/da7218.c     | 13 +++++--------
 sound/soc/codecs/da7219-aad.c | 19 ++++++++-----------
 sound/soc/codecs/da7219.c     |  3 +--
 3 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/da7218.c b/sound/soc/codecs/da7218.c
index 2bfafbe9e3dc..324d95e3b48a 100644
--- a/sound/soc/codecs/da7218.c
+++ b/sound/soc/codecs/da7218.c
@@ -2582,12 +2582,10 @@ static int da7218_set_bias_level(struct snd_soc_component *component,
 	case SND_SOC_BIAS_PREPARE:
 		/* Enable MCLK for transition to ON state */
 		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_STANDBY) {
-			if (da7218->mclk) {
-				ret = clk_prepare_enable(da7218->mclk);
-				if (ret) {
-					dev_err(component->dev, "Failed to enable mclk\n");
-					return ret;
-				}
+			ret = clk_prepare_enable(da7218->mclk);
+			if (ret) {
+				dev_err(component->dev, "Failed to enable mclk\n");
+				return ret;
 			}
 		}
 
@@ -2605,8 +2603,7 @@ static int da7218_set_bias_level(struct snd_soc_component *component,
 					    DA7218_LDO_EN_MASK);
 		} else {
 			/* Remove MCLK */
-			if (da7218->mclk)
-				clk_disable_unprepare(da7218->mclk);
+			clk_disable_unprepare(da7218->mclk);
 		}
 		break;
 	case SND_SOC_BIAS_OFF:
diff --git a/sound/soc/codecs/da7219-aad.c b/sound/soc/codecs/da7219-aad.c
index 48081d71c22c..fa61cfc8e50c 100644
--- a/sound/soc/codecs/da7219-aad.c
+++ b/sound/soc/codecs/da7219-aad.c
@@ -123,15 +123,13 @@ static void da7219_aad_hptest_work(struct work_struct *work)
 	mutex_lock(&da7219->pll_lock);
 
 	/* Ensure MCLK is available for HP test procedure */
-	if (da7219->mclk) {
-		ret = clk_prepare_enable(da7219->mclk);
-		if (ret) {
-			dev_err(component->dev, "Failed to enable mclk - %d\n", ret);
-			mutex_unlock(&da7219->pll_lock);
-			mutex_unlock(&da7219->ctrl_lock);
-			snd_soc_dapm_mutex_unlock(dapm);
-			return;
-		}
+	ret = clk_prepare_enable(da7219->mclk);
+	if (ret) {
+		dev_err(component->dev, "Failed to enable mclk - %d\n", ret);
+		mutex_unlock(&da7219->pll_lock);
+		mutex_unlock(&da7219->ctrl_lock);
+		snd_soc_dapm_mutex_unlock(dapm);
+		return;
 	}
 
 	/*
@@ -318,8 +316,7 @@ static void da7219_aad_hptest_work(struct work_struct *work)
 		da7219_set_pll(component, DA7219_SYSCLK_MCLK, 0);
 
 	/* Remove MCLK, if previously enabled */
-	if (da7219->mclk)
-		clk_disable_unprepare(da7219->mclk);
+	clk_disable_unprepare(da7219->mclk);
 
 	mutex_unlock(&da7219->pll_lock);
 	mutex_unlock(&da7219->ctrl_lock);
diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index e9b45daec0ca..50307cc9d640 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -1826,8 +1826,7 @@ static int da7219_set_bias_level(struct snd_soc_component *component,
 
 		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_PREPARE) {
 			/* Remove MCLK */
-			if (da7219->mclk)
-				clk_disable_unprepare(da7219->mclk);
+			clk_disable_unprepare(da7219->mclk);
 		}
 		break;
 	case SND_SOC_BIAS_OFF:
-- 
2.17.1

