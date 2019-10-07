Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB86CEA47
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Oct 2019 19:12:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCD571671;
	Mon,  7 Oct 2019 19:11:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCD571671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570468316;
	bh=ZVi3DmPHT4Lad+DNiLJER9eWXE6lL0awR9J3plJCbc8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W0r/fHfRuraXIhjE6bALlPxj4fKH9pkz0VUQCpN7+fPaa7Fav3V9MBbk5FbYopbO/
	 aO1xZA3KSKO0fnlS7u96aH8fHHAlkkQVmCXJyobNzSHzM1SUefAaNJpYSyNcmowuuo
	 VWTounJXXUACIp35hYMGgibsG1FRTj8YG96/shx0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07C47F80323;
	Mon,  7 Oct 2019 19:09:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02536F802DF; Mon,  7 Oct 2019 19:09:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02D2CF800BF
 for <alsa-devel@alsa-project.org>; Mon,  7 Oct 2019 19:09:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02D2CF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZzpVKSJO"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97H9HQP034661;
 Mon, 7 Oct 2019 12:09:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1570468157;
 bh=Uj2L0n4bSMjAeSXo6uEKjVpSlKE2402ydacUosjJgTo=;
 h=From:To:CC:Subject:Date;
 b=ZzpVKSJOY1F/PRsf5iTKydJBrQS0AFU3f5fHYCkl+/vIYGcJy5XnpSVqQ1H69+IMO
 i1Bd8faoTrZBaZ3xN6tL/KpYiv6Gg17MoWNVS3Z+mSxQMuZEZMdg7C846Mvisx0+WD
 MPMdjhHXthbJaiyx/6YywOUxbVbhNd+VM3EXBxUs=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97H9GOC067748
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 7 Oct 2019 12:09:17 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 12:09:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 12:09:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97H9GFE005648;
 Mon, 7 Oct 2019 12:09:16 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <shifu0704@thundersoft.com>, <broonie@kernel.org>
Date: Mon, 7 Oct 2019 12:11:55 -0500
Message-ID: <20191007171157.17813-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, navada@ti.com,
 Dan Murphy <dmurphy@ti.com>
Subject: [alsa-devel] [PATCH v2 1/3] ASoC: tas2770: Fix snd_soc_update_bits
	error handling
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

According the documentation for snd_soc_update_bits the API
will return a 1 if the update was successful with a value change,
a 0 if the update was successful with no value change or a negative
if the command just failed.

So the value of return in the driver needs to be checked for being less
then 0 or the caller may indicate failure when the value actually
changed.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v2 - Missed one update_bit return issue.

 sound/soc/codecs/tas2770.c | 46 +++++++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index dbbb21fe0548..361d0bba72b3 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -82,7 +82,8 @@ static int tas2770_codec_suspend(struct snd_soc_component *component)
 		TAS2770_PWR_CTRL,
 		TAS2770_PWR_CTRL_MASK,
 		TAS2770_PWR_CTRL_SHUTDOWN);
-	if (ret)
+
+	if (ret < 0)
 		return ret;
 
 	return 0;
@@ -96,8 +97,9 @@ static int tas2770_codec_resume(struct snd_soc_component *component)
 		TAS2770_PWR_CTRL,
 		TAS2770_PWR_CTRL_MASK,
 		TAS2770_PWR_CTRL_ACTIVE);
-	if (ret)
-		return -EINVAL;
+
+	if (ret < 0)
+		return ret;
 
 	return 0;
 }
@@ -149,7 +151,10 @@ static int tas2770_dac_event(struct snd_soc_dapm_widget *w,
 	}
 
 end:
-	return ret;
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static const struct snd_kcontrol_new isense_switch =
@@ -199,7 +204,10 @@ static int tas2770_mute(struct snd_soc_dai *dai, int mute)
 			TAS2770_PWR_CTRL_MASK,
 			TAS2770_PWR_CTRL_ACTIVE);
 
-	return ret;
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int tas2770_set_bitwidth(struct tas2770_priv *tas2770, int bitwidth)
@@ -252,7 +260,10 @@ static int tas2770_set_bitwidth(struct tas2770_priv *tas2770, int bitwidth)
 		tas2770->i_sense_slot);
 
 end:
-	return ret;
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int tas2770_set_samplerate(struct tas2770_priv *tas2770, int samplerate)
@@ -344,9 +355,11 @@ static int tas2770_set_samplerate(struct tas2770_priv *tas2770, int samplerate)
 	}
 
 end:
-	if (!ret)
-		tas2770->sampling_rate = samplerate;
-	return ret;
+	if (ret < 0)
+		return ret;
+
+	tas2770->sampling_rate = samplerate;
+	return 0;
 }
 
 static int tas2770_hw_params(struct snd_pcm_substream *substream,
@@ -401,7 +414,7 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG1,
 		TAS2770_TDM_CFG_REG1_RX_MASK,
 		asi_cfg_1);
-	if (ret)
+	if (ret < 0)
 		return ret;
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
@@ -426,7 +439,7 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG1,
 		TAS2770_TDM_CFG_REG1_MASK,
 	(tdm_rx_start_slot << TAS2770_TDM_CFG_REG1_51_SHIFT));
-	if (ret)
+	if (ret < 0)
 		return ret;
 
 	value = snd_soc_component_read32(component, TAS2770_TDM_CFG_REG3);
@@ -472,12 +485,12 @@ static int tas2770_set_dai_tdm_slot(struct snd_soc_dai *dai,
 	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG3,
 		TAS2770_TDM_CFG_REG3_30_MASK,
 		(left_slot << TAS2770_TDM_CFG_REG3_30_SHIFT));
-	if (ret)
+	if (ret < 0)
 		return ret;
 	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG3,
 		TAS2770_TDM_CFG_REG3_RXS_MASK,
 	(right_slot << TAS2770_TDM_CFG_REG3_RXS_SHIFT));
-	if (ret)
+	if (ret < 0)
 		return ret;
 
 	switch (slot_width) {
@@ -511,10 +524,11 @@ static int tas2770_set_dai_tdm_slot(struct snd_soc_dai *dai,
 		ret = -EINVAL;
 	}
 
-	if (!ret)
-		tas2770->slot_width = slot_width;
+	if (ret < 0)
+		return ret;
 
-	return ret;
+	tas2770->slot_width = slot_width;
+	return 0;
 }
 
 static struct snd_soc_dai_ops tas2770_dai_ops = {
-- 
2.22.0.214.g8dca754b1e

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
