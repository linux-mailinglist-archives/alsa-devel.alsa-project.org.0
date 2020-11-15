Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9012B34E8
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Nov 2020 13:23:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC1BA17BC;
	Sun, 15 Nov 2020 13:22:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC1BA17BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605443008;
	bh=A/LKYMT78kI6ssWNW1Rn2ISW4LY0Z5B598/DbAXTPEA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QQ4Qd6TbgRRpMSa+jNsXLxMEEqLNL+YDEr1xNo8i+iGYaE1fwG1nbET3YXelsJR9m
	 eHXN+BbTsxiFSOtFlXiSW+9g3BVTVJOeluZhLiFksL5mrITVMeX7qIabCCRironiSH
	 DjQG6PwJW2bn3oqiPiHyc0X/9JjoYIGj0G9wkeuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45097F80271;
	Sun, 15 Nov 2020 13:21:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F701F804BC; Sun, 15 Nov 2020 13:21:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from host.euro-space.net (host.euro-space.net [87.117.239.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C37DFF8020B
 for <alsa-devel@alsa-project.org>; Sun, 15 Nov 2020 13:21:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C37DFF8020B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=birdec.com header.i=@birdec.com
 header.b="YRz0lGti"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=birdec.com; 
 s=default;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lSKGQVXPSHX0skNYBLYzXitfSJXzhSyFEZz78vGIj8M=; b=YRz0lGti8eka6i7JgfTMSIYkKe
 9+yixpkRZyF4M/h+MoYLz5//t0dElTrYoO/M6mLO+ufl4A3CqZQCO8gxvRhheLSXZ3ZiSsU0rh9Nq
 oAftNz5cv/umAOk0rup651Ix79iZkoTttO2KcRFuM2O4NFtLpqNwuav9OLBqRCjoAoj4ZX1cf0oPv
 WuSDpiddyNz5G1sYBcLky9wJTvJeIFhRyjpsAiUt+7iv31Td0Ju8gZ3uu/RMXkv4cX4H+LTNaPVaQ
 fftCYiI2GqHLUHEwZyHgeKO+1fs282BHEFI5c+ij5H0ceM3fv0N9o6CiDkDKaZPNHxCcobCp7R2xy
 xBTnw+ZQ==;
Received: from dynamic-078-054-118-130.78.54.pool.telefonica.de
 ([78.54.118.130]:55232 helo=gentoo0.localdomain)
 by host.euro-space.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <kmarinushkin@birdec.com>)
 id 1keH1m-000338-72; Sun, 15 Nov 2020 12:21:06 +0000
From: Kirill Marinushkin <kmarinushkin@birdec.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v3 3/4] ASoC: pcm512x: Move format check into `set_fmt()`
Date: Sun, 15 Nov 2020 13:23:05 +0100
Message-Id: <20201115122306.18164-4-kmarinushkin@birdec.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20201115122306.18164-1-kmarinushkin@birdec.com>
References: <20201115122306.18164-1-kmarinushkin@birdec.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - host.euro-space.net
X-AntiAbuse: Original Domain - alsa-project.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - birdec.com
X-Get-Message-Sender-Via: host.euro-space.net: authenticated_id:
 kmarinushkin@birdec.com
X-Authenticated-Sender: host.euro-space.net: kmarinushkin@birdec.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: Matthias Reichl <hias@horus.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.com>
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

I would like to describe the reasoning by quoting Peter Ujfalusi
<peter.ujfalusi@ti.com> from his review of this patch series v1 [1]:

> When you bind a link you will use set_fmt for the two sides to see if
> they can agree, that both can support what has been asked.
>
> The pcm512x driver just saves the fmt and say back to that card:
> whatever, I'm fine with it. But runtime during hw_params it can fail due
> to unsupported bus format, which it actually acked to be ok.
>
> This is the difference.
>
> Sure, some device have constraint based on the fmt towards the hw_params
> and it is perfectly OK to do such a checks and rejections or build
> rules/constraints based on fmt, but failing hw_params just because
> set_fmt did not checked that the bus format is not even supported is not
> a nice thing to do.

[1] https://patchwork.kernel.org/project/alsa-devel/patch/
    20201109212133.25869-1-kmarinushkin@birdec.com/

Signed-off-by: Kirill Marinushkin <kmarinushkin@birdec.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Matthias Reichl <hias@horus.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
---
 sound/soc/codecs/pcm512x.c | 55 +++++++++++++++++++++++++---------------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index aa55a477a28f..22ef77955a28 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -1168,8 +1168,6 @@ static int pcm512x_hw_params(struct snd_pcm_substream *substream,
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 	int alen;
 	int gpio;
-	int clock_output;
-	int master_mode;
 	int ret;
 
 	dev_dbg(component->dev, "hw_params %u Hz, %u channels\n",
@@ -1202,11 +1200,8 @@ static int pcm512x_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	switch (pcm512x->fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
-		clock_output = 0;
-		master_mode = 0;
-
+	if ((pcm512x->fmt & SND_SOC_DAIFMT_MASTER_MASK) ==
+	    SND_SOC_DAIFMT_CBS_CFS) {
 		ret = regmap_update_bits(pcm512x->regmap, PCM512x_ERROR_DETECT,
 					 PCM512x_DCAS, 0);
 		if (ret != 0) {
@@ -1216,16 +1211,6 @@ static int pcm512x_hw_params(struct snd_pcm_substream *substream,
 			return ret;
 		}
 		goto skip_pll;
-	case SND_SOC_DAIFMT_CBM_CFM:
-		clock_output = PCM512x_BCKO | PCM512x_LRKO;
-		master_mode = PCM512x_RLRK | PCM512x_RBCK;
-		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
-		clock_output = PCM512x_BCKO;
-		master_mode = PCM512x_RBCK;
-		break;
-	default:
-		return -EINVAL;
 	}
 
 	if (pcm512x->pll_out) {
@@ -1343,6 +1328,34 @@ static int pcm512x_hw_params(struct snd_pcm_substream *substream,
 	}
 
 skip_pll:
+	return 0;
+}
+
+static int pcm512x_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = dai->component;
+	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
+	int clock_output;
+	int master_mode;
+	int ret;
+
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBS_CFS:
+		clock_output = 0;
+		master_mode = 0;
+		break;
+	case SND_SOC_DAIFMT_CBM_CFM:
+		clock_output = PCM512x_BCKO | PCM512x_LRKO;
+		master_mode = PCM512x_RLRK | PCM512x_RBCK;
+		break;
+	case SND_SOC_DAIFMT_CBM_CFS:
+		clock_output = PCM512x_BCKO;
+		master_mode = PCM512x_RBCK;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	ret = regmap_update_bits(pcm512x->regmap, PCM512x_BCLK_LRCLK_CFG,
 				 PCM512x_BCKP | PCM512x_BCKO | PCM512x_LRKO,
 				 clock_output);
@@ -1359,14 +1372,6 @@ static int pcm512x_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
-	return 0;
-}
-
-static int pcm512x_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
-{
-	struct snd_soc_component *component = dai->component;
-	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
-
 	pcm512x->fmt = fmt;
 
 	return 0;
-- 
2.13.6

