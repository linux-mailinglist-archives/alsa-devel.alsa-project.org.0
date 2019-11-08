Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C810F5E4E
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Nov 2019 10:50:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94EA316A8;
	Sat,  9 Nov 2019 10:49:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94EA316A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573293038;
	bh=0ZiQlFwEZOuXLZbYOH+SD9Q6ax200MdE1m4IyyiBFXE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kqpgjOL+LGng8mQfl2C8WGPB1M7olShEAlq9CjAevldfY75DsqCN0kSh2BnD/aEk5
	 zh2B6y2N3HbM9dNCVxgdlEJ2e03igqoMGo/coD9w5AJmUZlsR9sOmSvjM6zO9fOcBB
	 hhvN9ycQi0Fl6Gv9Z3vFx3tv/WO8s1+HIYYpmPBY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FB88F80671;
	Sat,  9 Nov 2019 10:44:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C9A1F8048D; Fri,  8 Nov 2019 18:49:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57A79F803D0
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 18:48:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57A79F803D0
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 0430B29134E
Received: by jupiter.universe (Postfix, from userid 1000)
 id 0408E4800A5; Fri,  8 Nov 2019 18:48:54 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Date: Fri,  8 Nov 2019 18:48:43 +0100
Message-Id: <20191108174843.11227-6-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191108174843.11227-1-sebastian.reichel@collabora.com>
References: <20191108174843.11227-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 09 Nov 2019 10:43:39 +0100
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com
Subject: [alsa-devel] [PATCHv1 5/5] ASoC: da7213: add default clock handling
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

This adds default clock/PLL configuration to the driver
for usage with generic drivers like simple-card for usage
with a fixed rate clock.

Upstreaming this requires a good way to disable the automatic
clock handling for systems doing it manually to avoid breaking
existing setups.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 sound/soc/codecs/da7213.c | 34 +++++++++++++++++++++++++++++++++-
 sound/soc/codecs/da7213.h |  1 +
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 197609691525..a4ed382ddfc7 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -1163,6 +1163,8 @@ static int da7213_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
+	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
+	int freq = 0;
 	u8 dai_ctrl = 0;
 	u8 fs;
 
@@ -1188,38 +1190,54 @@ static int da7213_hw_params(struct snd_pcm_substream *substream,
 	switch (params_rate(params)) {
 	case 8000:
 		fs = DA7213_SR_8000;
+		freq = DA7213_PLL_FREQ_OUT_98304000;
 		break;
 	case 11025:
 		fs = DA7213_SR_11025;
+		freq = DA7213_PLL_FREQ_OUT_90316800;
 		break;
 	case 12000:
 		fs = DA7213_SR_12000;
+		freq = DA7213_PLL_FREQ_OUT_98304000;
 		break;
 	case 16000:
 		fs = DA7213_SR_16000;
+		freq = DA7213_PLL_FREQ_OUT_98304000;
 		break;
 	case 22050:
 		fs = DA7213_SR_22050;
+		freq = DA7213_PLL_FREQ_OUT_90316800;
 		break;
 	case 32000:
 		fs = DA7213_SR_32000;
+		freq = DA7213_PLL_FREQ_OUT_98304000;
 		break;
 	case 44100:
 		fs = DA7213_SR_44100;
+		freq = DA7213_PLL_FREQ_OUT_90316800;
 		break;
 	case 48000:
 		fs = DA7213_SR_48000;
+		freq = DA7213_PLL_FREQ_OUT_98304000;
 		break;
 	case 88200:
 		fs = DA7213_SR_88200;
+		freq = DA7213_PLL_FREQ_OUT_90316800;
 		break;
 	case 96000:
 		fs = DA7213_SR_96000;
+		freq = DA7213_PLL_FREQ_OUT_98304000;
 		break;
 	default:
 		return -EINVAL;
 	}
 
+	/* setup PLL */
+	if (da7213->fixed_clk_auto) {
+		snd_soc_component_set_pll(component, 0, DA7213_SYSCLK_PLL,
+					  da7213->mclk_rate, freq);
+	}
+
 	snd_soc_component_update_bits(component, DA7213_DAI_CTRL, DA7213_DAI_WORD_LENGTH_MASK,
 			    dai_ctrl);
 	snd_soc_component_write(component, DA7213_SR, fs);
@@ -1700,10 +1718,10 @@ static struct da7213_platform_data
 	return pdata;
 }
 
-
 static int da7213_probe(struct snd_soc_component *component)
 {
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	pm_runtime_get_sync(component->dev);
 
@@ -1836,6 +1854,20 @@ static int da7213_probe(struct snd_soc_component *component)
 			return PTR_ERR(da7213->mclk);
 		else
 			da7213->mclk = NULL;
+	} else {
+		/* Store clock rate for fixed clocks for automatic PLL setup */
+		ret = clk_prepare_enable(da7213->mclk);
+		if (ret) {
+			dev_err(component->dev, "Failed to enable mclk\n");
+			return ret;
+		}
+
+		da7213->mclk_rate = clk_get_rate(da7213->mclk);
+
+		clk_disable_unprepare(da7213->mclk);
+
+		/* assume fixed clock until set_sysclk() is being called */
+		da7213->fixed_clk_auto = true;
 	}
 
 	return 0;
diff --git a/sound/soc/codecs/da7213.h b/sound/soc/codecs/da7213.h
index 97a250ea39e6..00aca0126cdb 100644
--- a/sound/soc/codecs/da7213.h
+++ b/sound/soc/codecs/da7213.h
@@ -532,6 +532,7 @@ struct da7213_priv {
 	bool master;
 	bool alc_calib_auto;
 	bool alc_en;
+	bool fixed_clk_auto;
 	struct da7213_platform_data *pdata;
 };
 
-- 
2.24.0.rc1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
