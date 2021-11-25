Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B97D345D679
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 09:50:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FBB2184E;
	Thu, 25 Nov 2021 09:49:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FBB2184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637830236;
	bh=W3MxNXHinMQ/PhzrP1BmRA1oVFs+Gj0wnAc7QEHdRSc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tanAgCOHszFTyVz1DePKMz8kZjvXNGwrB53YQYA2EIrOzebUSP1q6BiZXjmVKL+yH
	 KMhhtW+EnD/CyIWlonrixrx3wMH5rJBOyTTHFLW9HlSRhqMiWXJVhIvCeaKoSzG+9J
	 P9QOv/HC50nrmeSJhAuy7F9c9bjoqeCyWhtZUhoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D36B4F80087;
	Thu, 25 Nov 2021 09:49:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BB6DF8049E; Thu, 25 Nov 2021 09:49:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEA4FF8007E
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 09:49:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEA4FF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AKRvG4+U"
Received: by mail-wr1-x429.google.com with SMTP id c4so9924981wrd.9
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 00:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZXv6Jzb5SFH68Jd64JT8apKFHuvDqOPlffO+TYcXQtY=;
 b=AKRvG4+UulX55UiCC4Ng2Y9uoNqhfPYcCi3MxdkcQcSh9t2XdvQPlFSiYo7kp9KOaA
 vvb9cO7nAW/USZk/WGRayw38aBwAtKryDbHIfbAfBKmOJB5g2CJqGRIYkj1ko/tGe1am
 q2WwM62+cu5GHhCqmBAW7GA9DMz5MW0iUG4XS+rS3CavVHe0AeuEvbBZqva7pFMw5mYm
 IkN0DAs3yNwJCjSKSxSr3k/fo2k0qxZFPij0x0JRfMbxBsAyDAZWEX5c/OW323+9di+Q
 ZKJNGOoi41yRwO4rksbjNqAISCbmVllXH5uenpiYsupVL3EIvm4uaZz1WCHZraadHmsD
 O2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZXv6Jzb5SFH68Jd64JT8apKFHuvDqOPlffO+TYcXQtY=;
 b=IpatZDy0k0Bem4JywBEVkEMwm/u9xG7ZA8UNwLlV81wzSwMN5PiIgMsO6E0TLNYATv
 Otm6qCfBJoE4zZz5Xc0/lV23ViTIxWoX5L5L+nIrm+7DK+QU5nVPM9MX1DQBCjLU9NpE
 4WnIJi2F28irH/Fh3Mk5X/JBzVAYSGPgQEVBgm/UyGNVmyUsNkC64h667ZH+hEcplPEo
 gpsFvtDC1j3kyXEWOiAAa12D623e3pP+XcKnxRHxxGFZMA9sw1wWQqY8Z+iAovmpibSy
 RQfMKS+A3x4Eydd/iq/dWe97AD3qBjXiXJvejruIQIEtVy7f+RgR+seLMS2OPkpR00qZ
 dxmA==
X-Gm-Message-State: AOAM532jcLnShBChphDCUzU8G+5Q4k0KRLvghk9DhsBK6LKZ2GZgs4IL
 iwDwb8P9hXKjXv21OOCRx68=
X-Google-Smtp-Source: ABdhPJwTZldI+270r7Sfhiuta0uUF9IWR/ikPaEuYdnjLEVCqRPB6BDiHGPszf3aY+c1uwUzTakBDw==
X-Received: by 2002:a5d:64ea:: with SMTP id g10mr4866677wri.242.1637830149421; 
 Thu, 25 Nov 2021 00:49:09 -0800 (PST)
Received: from localhost.localdomain (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id m1sm2290568wme.39.2021.11.25.00.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 00:49:08 -0800 (PST)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v3] ASoC: rockchip: i2s_tdm: Dup static DAI template
Date: Thu, 25 Nov 2021 09:48:59 +0100
Message-Id: <20211125084900.417102-1-frattaroli.nicolas@gmail.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Previously, the DAI template was used directly, which lead to
fun bugs such as "why is my channels_max changing?" when one
instantiated more than one i2s_tdm IP block in a device tree.

This change makes it so that we instead duplicate the template
struct, and then use that.

Fixes: 081068fd6414 ("ASoC: rockchip: add support for i2s-tdm controller")
Signed-off-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
---

Changes in v3:
 - constify the i2s_tdm_dai struct
 - remove remaining direct i2s_tdm_dai uses
 - move symmetric_rate setting to _init_dai
 - store pointer to dai struct in rk_i2s_tdm_dev struct

Changes in v2:
 - remove accidental whitespace changes

 sound/soc/rockchip/rockchip_i2s_tdm.c | 52 ++++++++++++++++-----------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 17b9b287853a..5f9cb5c4c7f0 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -95,6 +95,7 @@ struct rk_i2s_tdm_dev {
 	spinlock_t lock; /* xfer lock */
 	bool has_playback;
 	bool has_capture;
+	struct snd_soc_dai_driver *dai;
 };
 
 static int to_ch_num(unsigned int val)
@@ -1310,19 +1311,14 @@ static const struct of_device_id rockchip_i2s_tdm_match[] = {
 	{},
 };
 
-static struct snd_soc_dai_driver i2s_tdm_dai = {
+static const struct snd_soc_dai_driver i2s_tdm_dai = {
 	.probe = rockchip_i2s_tdm_dai_probe,
-	.playback = {
-		.stream_name  = "Playback",
-	},
-	.capture = {
-		.stream_name  = "Capture",
-	},
 	.ops = &rockchip_i2s_tdm_dai_ops,
 };
 
-static void rockchip_i2s_tdm_init_dai(struct rk_i2s_tdm_dev *i2s_tdm)
+static int rockchip_i2s_tdm_init_dai(struct rk_i2s_tdm_dev *i2s_tdm)
 {
+	struct snd_soc_dai_driver *dai;
 	struct property *dma_names;
 	const char *dma_name;
 	u64 formats = (SNDRV_PCM_FMTBIT_S8 | SNDRV_PCM_FMTBIT_S16_LE |
@@ -1337,19 +1333,33 @@ static void rockchip_i2s_tdm_init_dai(struct rk_i2s_tdm_dev *i2s_tdm)
 			i2s_tdm->has_capture = true;
 	}
 
+	dai = devm_kmemdup(i2s_tdm->dev, &i2s_tdm_dai,
+			   sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
 	if (i2s_tdm->has_playback) {
-		i2s_tdm_dai.playback.channels_min = 2;
-		i2s_tdm_dai.playback.channels_max = 8;
-		i2s_tdm_dai.playback.rates = SNDRV_PCM_RATE_8000_192000;
-		i2s_tdm_dai.playback.formats = formats;
+		dai->playback.stream_name  = "Playback";
+		dai->playback.channels_min = 2;
+		dai->playback.channels_max = 8;
+		dai->playback.rates = SNDRV_PCM_RATE_8000_192000;
+		dai->playback.formats = formats;
 	}
 
 	if (i2s_tdm->has_capture) {
-		i2s_tdm_dai.capture.channels_min = 2;
-		i2s_tdm_dai.capture.channels_max = 8;
-		i2s_tdm_dai.capture.rates = SNDRV_PCM_RATE_8000_192000;
-		i2s_tdm_dai.capture.formats = formats;
+		dai->capture.stream_name  = "Capture";
+		dai->capture.channels_min = 2;
+		dai->capture.channels_max = 8;
+		dai->capture.rates = SNDRV_PCM_RATE_8000_192000;
+		dai->capture.formats = formats;
 	}
+
+	if (i2s_tdm->clk_trcm != TRCM_TXRX)
+		dai->symmetric_rate = 1;
+
+	i2s_tdm->dai = dai;
+
+	return 0;
 }
 
 static int rockchip_i2s_tdm_path_check(struct rk_i2s_tdm_dev *i2s_tdm,
@@ -1541,8 +1551,6 @@ static int rockchip_i2s_tdm_probe(struct platform_device *pdev)
 	spin_lock_init(&i2s_tdm->lock);
 	i2s_tdm->soc_data = (struct rk_i2s_soc_data *)of_id->data;
 
-	rockchip_i2s_tdm_init_dai(i2s_tdm);
-
 	i2s_tdm->frame_width = 64;
 
 	i2s_tdm->clk_trcm = TRCM_TXRX;
@@ -1555,8 +1563,10 @@ static int rockchip_i2s_tdm_probe(struct platform_device *pdev)
 		}
 		i2s_tdm->clk_trcm = TRCM_RX;
 	}
-	if (i2s_tdm->clk_trcm != TRCM_TXRX)
-		i2s_tdm_dai.symmetric_rate = 1;
+
+	ret = rockchip_i2s_tdm_init_dai(i2s_tdm);
+	if (ret)
+		return ret;
 
 	i2s_tdm->grf = syscon_regmap_lookup_by_phandle(node, "rockchip,grf");
 	if (IS_ERR(i2s_tdm->grf))
@@ -1678,7 +1688,7 @@ static int rockchip_i2s_tdm_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &rockchip_i2s_tdm_component,
-					      &i2s_tdm_dai, 1);
+					      i2s_tdm->dai, 1);
 
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register DAI\n");
-- 
2.34.0

