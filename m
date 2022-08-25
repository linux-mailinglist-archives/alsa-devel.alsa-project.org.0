Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 536DA5A137E
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 16:24:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E70C61635;
	Thu, 25 Aug 2022 16:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E70C61635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661437471;
	bh=b5f6X0ithoOg3SQ4sZCmhgRue16RFk9R884I7efXspo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qVoqU2MoBS3mSG44+50767piJ/93sej82ybu4X4CUbjE6H7u+KtBcYleX8DkOBvX5
	 w5GI/PQRSLSnF2uB83oUU/EgBhjgrq00K8Dm9OARfPkCT+GUFnuu1/1n147GWMG48T
	 XCW+s7YyH5siJj71nOvru65v0IMg1E+9/Tg8fnkc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A455AF8052D;
	Thu, 25 Aug 2022 16:22:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E6CBF80529; Thu, 25 Aug 2022 16:22:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 246B6F8025A
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 16:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 246B6F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="SYyOmV2P"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1661437362; bh=5RGgH1AcjF5BtsgHx+ZoU5Me0+YKLfaL9/ywuzhYSio=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=SYyOmV2P5l7WMaWO/z5fBxhZuxZpcmFDcNLB/3Vj+yLexFc/x98roK9dYw4NbNWIk
 xxyWH6utfs7iE0IF6RTOGYSJiRlkcdXdhbRAibmKNDYsAPYZ+i+HNgBwvVGubkmCv7
 koH8M+uW3wkHWwmy55xkqXtbs/dHDBE6JV2hOPRM=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: tas2562: Fix mute/unmute
Date: Thu, 25 Aug 2022 16:22:26 +0200
Message-Id: <20220825142226.80929-3-povik+lin@cutebit.org>
In-Reply-To: <20220825142226.80929-1-povik+lin@cutebit.org>
References: <20220825142226.80929-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>, navada@ti.com,
 linux-kernel@vger.kernel.org, asyrus@ti.com, shenghao-ding@ti.com,
 raphael-xu@ti.com, =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
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
the sequence of calls. Without this fix, one permanently mutes an
ongoing stream by toggling the associated speaker pin control.

(This mirrors commit 1e5907bcb3a3 ("ASoC: tas2770: Fix handling of
mute/unmute") which was a fix to the tas2770 driver.)

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 sound/soc/codecs/tas2562.c | 55 ++++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 26 deletions(-)

diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index 2b0cdb6d1600..66149055aba9 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -54,6 +54,8 @@ struct tas2562_data {
 	int i_sense_slot;
 	int volume_lvl;
 	int model_id;
+	bool dac_powered;
+	bool unmuted;
 };
 
 enum tas256x_model {
@@ -351,30 +353,43 @@ static int tas2562_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
+static int tas2562_update_pwr_ctrl(struct tas2562_data *tas2562)
+{
+	struct snd_soc_component *component = tas2562->component;
+	unsigned int val;
+	int ret;
+
+	if (tas2562->dac_powered)
+		val = tas2562->unmuted ?
+			TAS2562_ACTIVE : TAS2562_MUTE;
+	else
+		val = TAS2562_SHUTDOWN;
+
+	ret = snd_soc_component_update_bits(component, TAS2562_PWR_CTRL,
+					    TAS2562_MODE_MASK, val);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 static int tas2562_mute(struct snd_soc_dai *dai, int mute, int direction)
 {
-	struct snd_soc_component *component = dai->component;
+	struct tas2562_data *tas2562 = snd_soc_component_get_drvdata(dai->component);
 
-	return snd_soc_component_update_bits(component, TAS2562_PWR_CTRL,
-					     TAS2562_MODE_MASK,
-					     mute ? TAS2562_MUTE : 0);
+	tas2562->unmuted = !mute;
+	return tas2562_update_pwr_ctrl(tas2562);
 }
 
 static int tas2562_codec_probe(struct snd_soc_component *component)
 {
 	struct tas2562_data *tas2562 = snd_soc_component_get_drvdata(component);
-	int ret;
 
 	tas2562->component = component;
 
 	if (tas2562->sdz_gpio)
 		gpiod_set_value_cansleep(tas2562->sdz_gpio, 1);
 
-	ret = snd_soc_component_update_bits(component, TAS2562_PWR_CTRL,
-					    TAS2562_MODE_MASK, TAS2562_MUTE);
-	if (ret < 0)
-		return ret;
-
 	return 0;
 }
 
@@ -428,30 +443,18 @@ static int tas2562_dac_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		ret = snd_soc_component_update_bits(component,
-			TAS2562_PWR_CTRL,
-			TAS2562_MODE_MASK,
-			TAS2562_MUTE);
-		if (ret)
-			goto end;
+		tas2562->dac_powered = true;
+		ret = tas2562_update_pwr_ctrl(tas2562);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
-		ret = snd_soc_component_update_bits(component,
-			TAS2562_PWR_CTRL,
-			TAS2562_MODE_MASK,
-			TAS2562_SHUTDOWN);
-		if (ret)
-			goto end;
+		tas2562->dac_powered = false;
+		ret = tas2562_update_pwr_ctrl(tas2562);
 		break;
 	default:
 		dev_err(tas2562->dev, "Not supported evevt\n");
 		return -EINVAL;
 	}
 
-end:
-	if (ret < 0)
-		return ret;
-
 	return 0;
 }
 
-- 
2.33.0

