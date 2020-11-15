Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFF12B34E9
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Nov 2020 13:23:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A33D17E3;
	Sun, 15 Nov 2020 13:22:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A33D17E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605443018;
	bh=TbWwshVB/eCXJMTGARnsEqq0xYxWS/IPz2pnjs+CSJ8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tTtGQkDEQUQ28aZvjiYWA3/R+ApQeJF0CQ72c6DB5h3/L7S1CEhGWzyGvigHSGNBY
	 MjJ4UNE2RfV3l+cPTixyxBrt1UagIwt5m7p9pmEE+WNNu/btO8nAXJBWzR5GfeWC/w
	 l7v+jkv6J9tGOvxf2GD3BSHuOiwdlo4nKv7BDGfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84129F804BD;
	Sun, 15 Nov 2020 13:21:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2069F804C2; Sun, 15 Nov 2020 13:21:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from host.euro-space.net (host.euro-space.net [87.117.239.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5ADBCF8010A
 for <alsa-devel@alsa-project.org>; Sun, 15 Nov 2020 13:21:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ADBCF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=birdec.com header.i=@birdec.com
 header.b="pHux+tYE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=birdec.com; 
 s=default;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3DS/oTYDN8+O79A+7WTTW5ETsjJABZbWKbWErfdWpPk=; b=pHux+tYEXSyXrGv5uxQqGxJOG7
 ZH+X7KKiRxlSjf0VeeKY39gTpVXxyEqdKAx+YnQua4jb3EsaGf9cUw/gZ/TC5HsVoDDJPZJvWGNUm
 hu3KquzN4Twes0v6k4WQqHNsCdmzi5fCfZWVK2kCdCs4lV6HH7TxkjNGHQjIukVbk5+LT2oummp9S
 EZNIccKc8pyxmNiltif8ZH/xeOwRsNVFA103dcMPyDa5/e19bpUFwvu5jO2fJTYJAdCO+UNddvjjF
 NBFSP9QVuHSZXgmvrb7sFu7ESR2Gl/UJKCCOGaKomf9+86oGgsZ8oxIDKLK/njDq/xdph31KgrbpZ
 74xfu7jw==;
Received: from dynamic-078-054-118-130.78.54.pool.telefonica.de
 ([78.54.118.130]:55232 helo=gentoo0.localdomain)
 by host.euro-space.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <kmarinushkin@birdec.com>)
 id 1keH1k-000338-M0; Sun, 15 Nov 2020 12:21:04 +0000
From: Kirill Marinushkin <kmarinushkin@birdec.com>
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v3 2/4] ASoC: pcm512x: Rearrange operations in `hw_params()`
Date: Sun, 15 Nov 2020 13:23:04 +0100
Message-Id: <20201115122306.18164-3-kmarinushkin@birdec.com>
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

This commit is a preparation for the next patch in the series.
It's goal is to make format check easy-to-move-out. Theoretically, more
butifications are possile in `hw_params()` func, but my intention in this
commit is to keep behaviour unchanged.

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
 sound/soc/codecs/pcm512x.c | 49 +++++++++++++++++++---------------------------
 1 file changed, 20 insertions(+), 29 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index db3dc6a40feb..aa55a477a28f 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -1204,16 +1204,8 @@ static int pcm512x_hw_params(struct snd_pcm_substream *substream,
 
 	switch (pcm512x->fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBS_CFS:
-		ret = regmap_update_bits(pcm512x->regmap,
-					 PCM512x_BCLK_LRCLK_CFG,
-					 PCM512x_BCKP
-					 | PCM512x_BCKO | PCM512x_LRKO,
-					 0);
-		if (ret != 0) {
-			dev_err(component->dev,
-				"Failed to enable slave mode: %d\n", ret);
-			return ret;
-		}
+		clock_output = 0;
+		master_mode = 0;
 
 		ret = regmap_update_bits(pcm512x->regmap, PCM512x_ERROR_DETECT,
 					 PCM512x_DCAS, 0);
@@ -1223,7 +1215,7 @@ static int pcm512x_hw_params(struct snd_pcm_substream *substream,
 				ret);
 			return ret;
 		}
-		return 0;
+		goto skip_pll;
 	case SND_SOC_DAIFMT_CBM_CFM:
 		clock_output = PCM512x_BCKO | PCM512x_LRKO;
 		master_mode = PCM512x_RLRK | PCM512x_RBCK;
@@ -1316,25 +1308,7 @@ static int pcm512x_hw_params(struct snd_pcm_substream *substream,
 			dev_err(component->dev, "Failed to enable pll: %d\n", ret);
 			return ret;
 		}
-	}
-
-	ret = regmap_update_bits(pcm512x->regmap, PCM512x_BCLK_LRCLK_CFG,
-				 PCM512x_BCKP | PCM512x_BCKO | PCM512x_LRKO,
-				 clock_output);
-	if (ret != 0) {
-		dev_err(component->dev, "Failed to enable clock output: %d\n", ret);
-		return ret;
-	}
 
-	ret = regmap_update_bits(pcm512x->regmap, PCM512x_MASTER_MODE,
-				 PCM512x_RLRK | PCM512x_RBCK,
-				 master_mode);
-	if (ret != 0) {
-		dev_err(component->dev, "Failed to enable master mode: %d\n", ret);
-		return ret;
-	}
-
-	if (pcm512x->pll_out) {
 		gpio = PCM512x_G1OE << (pcm512x->pll_out - 1);
 		ret = regmap_update_bits(pcm512x->regmap, PCM512x_GPIO_EN,
 					 gpio, gpio);
@@ -1368,6 +1342,23 @@ static int pcm512x_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
+skip_pll:
+	ret = regmap_update_bits(pcm512x->regmap, PCM512x_BCLK_LRCLK_CFG,
+				 PCM512x_BCKP | PCM512x_BCKO | PCM512x_LRKO,
+				 clock_output);
+	if (ret != 0) {
+		dev_err(component->dev, "Failed to enable clock output: %d\n", ret);
+		return ret;
+	}
+
+	ret = regmap_update_bits(pcm512x->regmap, PCM512x_MASTER_MODE,
+				 PCM512x_RLRK | PCM512x_RBCK,
+				 master_mode);
+	if (ret != 0) {
+		dev_err(component->dev, "Failed to enable master mode: %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
-- 
2.13.6

