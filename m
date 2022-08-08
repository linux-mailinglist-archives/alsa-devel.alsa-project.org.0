Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A4C58CA41
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Aug 2022 16:15:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1066FAE8;
	Mon,  8 Aug 2022 16:15:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1066FAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659968153;
	bh=NeUx+pSo12xPra5B6qJ2I6DGFGzYl2ySN/qXHG/DyXQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rur63A77StPfr0SYyEqBuzN+3a6yvFw77qwTfmpQfPWow+OQPMaf6m2HWjwBBhbVB
	 +8DHTjuMpjr5FIhNtuWN/CQS0QCvjv/InjY/rEZOrUZUC+YR3Yf/+/CrQXMNZUNnGS
	 jdYBvxT0EYnSaxMMWX/VvG5PoM/MraVe3uAQBLVo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59A64F80552;
	Mon,  8 Aug 2022 16:14:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACDB8F80510; Mon,  8 Aug 2022 16:14:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,RDNS_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88B2CF804B1
 for <alsa-devel@alsa-project.org>; Mon,  8 Aug 2022 16:13:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88B2CF804B1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="GrHmrpuW"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1659968029; bh=Twygo1GqjUrP9qhVckfjeeq1VoZv2+ub4qhDvapf23c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=GrHmrpuW2i2/ft0rjPTmoSjkHqyKouNA8vrAj3KKl/i+zGvkV37Yl0or9Vb65+mUM
 5mdKN8yHVaYSWFooK5LA+uMoujK1AuZbBSIdqQwdXQCKf8RWdv+256NeHbB9OcczWn
 ptqkvWzL3rs2uKf2r5Bz279uDE9Q8/pjfu+e11wY=
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 4/4] ASoC: tas2770: Fix handling of mute/unmute
Date: Mon,  8 Aug 2022 16:12:46 +0200
Message-Id: <20220808141246.5749-5-povik+lin@cutebit.org>
In-Reply-To: <20220808141246.5749-1-povik+lin@cutebit.org>
References: <20220808141246.5749-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>,
 linux-kernel@vger.kernel.org, Frank Shi <shifu0704@thundersoft.com>,
 asahi@lists.linux.dev,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
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

Because the PWR_CTRL field is modeled as the power state of the DAC
widget, and at the same time it is used to implement mute/unmute, we
need some additional book-keeping to have the right end result no matter
the sequence of calls. Without this fix, one can mute an ongoing stream
by toggling a speaker pin control.

Fixes: 1a476abc723e ("tas2770: add tas2770 smart PA kernel driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/tas2770.c | 57 ++++++++++++++++++++------------------
 sound/soc/codecs/tas2770.h |  2 ++
 2 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 10a79f8139be..9ea2aca65e89 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -46,6 +46,26 @@ static void tas2770_reset(struct tas2770_priv *tas2770)
 	usleep_range(1000, 2000);
 }
 
+static int tas2770_update_pwr_ctrl(struct tas2770_priv *tas2770)
+{
+	struct snd_soc_component *component = tas2770->component;
+	unsigned int val;
+	int ret;
+
+	if (tas2770->dac_powered)
+		val = tas2770->unmuted ?
+			TAS2770_PWR_CTRL_ACTIVE : TAS2770_PWR_CTRL_MUTE;
+	else
+		val = TAS2770_PWR_CTRL_SHUTDOWN;
+
+	ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
+					    TAS2770_PWR_CTRL_MASK, val);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 #ifdef CONFIG_PM
 static int tas2770_codec_suspend(struct snd_soc_component *component)
 {
@@ -82,9 +102,7 @@ static int tas2770_codec_resume(struct snd_soc_component *component)
 		gpiod_set_value_cansleep(tas2770->sdz_gpio, 1);
 		usleep_range(1000, 2000);
 	} else {
-		ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
-						    TAS2770_PWR_CTRL_MASK,
-						    TAS2770_PWR_CTRL_ACTIVE);
+		ret = tas2770_update_pwr_ctrl(tas2770);
 		if (ret < 0)
 			return ret;
 	}
@@ -120,24 +138,19 @@ static int tas2770_dac_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
-						    TAS2770_PWR_CTRL_MASK,
-						    TAS2770_PWR_CTRL_MUTE);
+		tas2770->dac_powered = 1;
+		ret = tas2770_update_pwr_ctrl(tas2770);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
-		ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
-						    TAS2770_PWR_CTRL_MASK,
-						    TAS2770_PWR_CTRL_SHUTDOWN);
+		tas2770->dac_powered = 0;
+		ret = tas2770_update_pwr_ctrl(tas2770);
 		break;
 	default:
 		dev_err(tas2770->dev, "Not supported evevt\n");
 		return -EINVAL;
 	}
 
-	if (ret < 0)
-		return ret;
-
-	return 0;
+	return ret;
 }
 
 static const struct snd_kcontrol_new isense_switch =
@@ -171,21 +184,11 @@ static const struct snd_soc_dapm_route tas2770_audio_map[] = {
 static int tas2770_mute(struct snd_soc_dai *dai, int mute, int direction)
 {
 	struct snd_soc_component *component = dai->component;
-	int ret;
-
-	if (mute)
-		ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
-						    TAS2770_PWR_CTRL_MASK,
-						    TAS2770_PWR_CTRL_MUTE);
-	else
-		ret = snd_soc_component_update_bits(component, TAS2770_PWR_CTRL,
-						    TAS2770_PWR_CTRL_MASK,
-						    TAS2770_PWR_CTRL_ACTIVE);
-
-	if (ret < 0)
-		return ret;
+	struct tas2770_priv *tas2770 =
+			snd_soc_component_get_drvdata(component);
 
-	return 0;
+	tas2770->unmuted = !mute;
+	return tas2770_update_pwr_ctrl(tas2770);
 }
 
 static int tas2770_set_bitwidth(struct tas2770_priv *tas2770, int bitwidth)
diff --git a/sound/soc/codecs/tas2770.h b/sound/soc/codecs/tas2770.h
index d51e88d8c338..f75f40781ab1 100644
--- a/sound/soc/codecs/tas2770.h
+++ b/sound/soc/codecs/tas2770.h
@@ -138,6 +138,8 @@ struct tas2770_priv {
 	struct device *dev;
 	int v_sense_slot;
 	int i_sense_slot;
+	bool dac_powered;
+	bool unmuted;
 };
 
 #endif /* __TAS2770__ */
-- 
2.33.0

