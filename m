Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F4D9CC17
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 11:03:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9DB51681;
	Mon, 26 Aug 2019 11:02:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9DB51681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566810223;
	bh=JtTTfeDGWh5LoJV2zYVvWWOCKfRACOwYMueRIqY+F20=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KBAwo0pRzrhta8gQKfstl8UDmoB6id9rbH6glI0kIsvAo28FNHtUGPy7nsQs98vuB
	 KhW+9zQbXDF0inkAlx2GQoCRM7YED5DYpfMufVcDKXPKFwizFf0r4gsF7gisbEpPm2
	 HgHvstnjhRU6z8iYA+9km6wiuWVqdOqhY0S65r/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 165FAF80445;
	Mon, 26 Aug 2019 11:01:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D8D7F80390; Mon, 26 Aug 2019 11:01:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23F5DF80376
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 11:01:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23F5DF80376
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x7Q91CiW003570,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV01.realtek.com.tw[172.21.6.18])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x7Q91CiW003570
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Aug 2019 17:01:12 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTITCASV01.realtek.com.tw (172.21.6.18) with Microsoft SMTP Server id
 14.3.468.0; Mon, 26 Aug 2019 17:01:11 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Mon, 26 Aug 2019 17:00:52 +0800
Message-ID: <20190826090052.1875-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Originating-IP: [172.22.102.1]
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, cychiang@google.com, Shuming Fan <shumingf@realtek.com>,
 derek.fang@realtek.com, sathya.prakash.m.r@intel.com, flove@realtek.com
Subject: [alsa-devel] [PATCH 1/2] ASoC: rt1011: add mutex protection to
	set_fmt/set_tdm_slot
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

From: Shuming Fan <shumingf@realtek.com>

The calibration process at booting will reset registers and bypass cache
to make sure the calibration is done.
We add mutex protection to avoid unexpected settings while
the registration process and calibration are interleaved.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1011.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index fa34565a3938..f9235764ad32 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1627,14 +1627,18 @@ static int rt1011_hw_params(struct snd_pcm_substream *substream,
 static int rt1011_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = dai->component;
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
 	unsigned int reg_val = 0, reg_bclk_inv = 0;
+	int ret = 0;
 
+	snd_soc_dapm_mutex_lock(dapm);
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBS_CFS:
 		reg_val |= RT1011_I2S_TDM_MS_S;
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
@@ -1644,7 +1648,7 @@ static int rt1011_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		reg_bclk_inv |= RT1011_TDM_INV_BCLK;
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
 	}
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
@@ -1660,7 +1664,7 @@ static int rt1011_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		reg_val |= RT1011_I2S_TDM_DF_PCM_B;
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
 	}
 
 	switch (dai->id) {
@@ -1675,9 +1679,11 @@ static int rt1011_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		break;
 	default:
 		dev_err(component->dev, "Invalid dai->id: %d\n", dai->id);
-		return -EINVAL;
+		ret = -EINVAL;
 	}
-	return 0;
+
+	snd_soc_dapm_mutex_unlock(dapm);
+	return ret;
 }
 
 static int rt1011_set_component_sysclk(struct snd_soc_component *component,
@@ -1796,8 +1802,12 @@ static int rt1011_set_tdm_slot(struct snd_soc_dai *dai,
 	unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width)
 {
 	struct snd_soc_component *component = dai->component;
+	struct snd_soc_dapm_context *dapm =
+		snd_soc_component_get_dapm(component);
 	unsigned int val = 0, tdm_en = 0;
+	int ret = 0;
 
+	snd_soc_dapm_mutex_lock(dapm);
 	if (rx_mask || tx_mask)
 		tdm_en = RT1011_TDM_I2S_DOCK_EN_1;
 
@@ -1817,7 +1827,7 @@ static int rt1011_set_tdm_slot(struct snd_soc_dai *dai,
 	case 2:
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
 	}
 
 	switch (slot_width) {
@@ -1836,7 +1846,7 @@ static int rt1011_set_tdm_slot(struct snd_soc_dai *dai,
 	case 16:
 		break;
 	default:
-		return -EINVAL;
+		ret = -EINVAL;
 	}
 
 	snd_soc_component_update_bits(component, RT1011_TDM1_SET_1,
@@ -1853,7 +1863,8 @@ static int rt1011_set_tdm_slot(struct snd_soc_dai *dai,
 		RT1011_ADCDAT1_PIN_CONFIG | RT1011_ADCDAT2_PIN_CONFIG,
 		RT1011_ADCDAT1_OUTPUT | RT1011_ADCDAT2_OUTPUT);
 
-	return 0;
+	snd_soc_dapm_mutex_unlock(dapm);
+	return ret;
 }
 
 static int rt1011_probe(struct snd_soc_component *component)
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
