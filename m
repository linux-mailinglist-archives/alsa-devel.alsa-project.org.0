Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6452E45CEE2
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 22:23:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B6C317D8;
	Wed, 24 Nov 2021 22:22:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B6C317D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637789026;
	bh=IeOouXmt/DKxcupQo9/iF6lhErUZ9GLlil7D/P+GD/M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fV2UXvquw0wBobGtJDhJ+qyu5/bisGuEpmyLunUGoFHcPVep7SCX04pQhkBtQ3ALZ
	 yD1n1KcWAfiHyXDEJqkJCxpyB32K7n9HRRGmkHpdtQXYrUbWN0rHhX5ugifFRngA/T
	 xPdgl929elFssNeWjF19Gh9bygo0+OJOOeeyHPDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ABD8F80087;
	Wed, 24 Nov 2021 22:22:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6273CF801F7; Wed, 24 Nov 2021 22:22:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 834D7F8013A
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 22:22:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 834D7F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="a/+Hbgjf"
Received: by mail-wr1-x42e.google.com with SMTP id o13so6793493wrs.12
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 13:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KkTsSIQTgl65Jkq2RbrjmIOlxesXSk6YN9h1ULIzGuo=;
 b=a/+HbgjfC0Xviq8bITaokRT5m8AxPOk5YRgGPtIjhTqCyV0mHnnXD9x5o8QdAPmhvL
 GkmtbZBDsGAeG1eDD/p8IhF7pjGBZdplptRLcaPnLNviqmYG2eWo6W4sHJAHLtoCZzT4
 Z4xc8vtYf9/u9HzTxFPVhGzmnRSkKqvaDqzIDlKsKY3LXOvhssL1RCOEkkY45Dnx/38Q
 POHoc1xVEK/L1Acs4Gn53bN+0uAXcc9iXn0PsSy8rPmh3zdE6cfER8rhl5I+GPmMnvi+
 iLDd6MDNMRkl8CUP9UbeirSLARr/CJmhWGOxeGLfptDnAIrQklRNqtn82Gbs4Ty9MEEr
 DEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KkTsSIQTgl65Jkq2RbrjmIOlxesXSk6YN9h1ULIzGuo=;
 b=CV+87cVZ/w24c1pQ0DUS7x3TUTkpalqm1Wy5RQN1Kxz3HxwkSfH5tFJ4+rZaWazY/a
 gF1zVQLbwd6x8aDGWhPExuO2Q2+DwVEMi7Sj96k/puoEmF2VSHwOqFz0aO9vkSKhZOQW
 j2nzrb1Ht3/QeOTXVDzs+7fqs8gY61QQBTHpoqyAsBwa9qoTxDhNJ7MrC5OqUDXIJvUD
 gIa8OFVui6AN43nNMeLL38N1PFYB2TRSJX3WlD7DsswRID81EJA8/Pujjb41unJK0djE
 ZFD1AZCZE8JRcjB2I/VNGH/UQAWo2TmsgZMz2gNVvrXzNnsWYIziovxc4CI1xURjN7So
 LSPg==
X-Gm-Message-State: AOAM5311HxBjcgCxHKf5OffaX9Ty7kuEg0mzum72VauzigJGpAL7B455
 QXVzDLPbaMsm4J+D7QbVzUM=
X-Google-Smtp-Source: ABdhPJzn4Yi5qwkymBP+9Ssw2nDNuFw2wS/hm5XhbyRb6XKDIQioqPM2bbYzaRaRf/fZCDudlHLcgg==
X-Received: by 2002:adf:a193:: with SMTP id u19mr50196wru.563.1637788936819;
 Wed, 24 Nov 2021 13:22:16 -0800 (PST)
Received: from localhost.localdomain (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id o12sm1466875wrc.85.2021.11.24.13.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 13:22:16 -0800 (PST)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2] ASoC: rockchip: i2s_tdm: Dup static DAI template
Date: Wed, 24 Nov 2021 22:21:45 +0100
Message-Id: <20211124212146.289133-1-frattaroli.nicolas@gmail.com>
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
 sound/soc/rockchip/rockchip_i2s_tdm.c | 38 ++++++++++++++++-----------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 17b9b287853a..4328c10ea830 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1312,17 +1312,12 @@ static const struct of_device_id rockchip_i2s_tdm_match[] = {
 
 static struct snd_soc_dai_driver i2s_tdm_dai = {
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
@@ -1337,19 +1332,28 @@ static void rockchip_i2s_tdm_init_dai(struct rk_i2s_tdm_dev *i2s_tdm)
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
+	return 0;
 }
 
 static int rockchip_i2s_tdm_path_check(struct rk_i2s_tdm_dev *i2s_tdm,
@@ -1541,7 +1545,9 @@ static int rockchip_i2s_tdm_probe(struct platform_device *pdev)
 	spin_lock_init(&i2s_tdm->lock);
 	i2s_tdm->soc_data = (struct rk_i2s_soc_data *)of_id->data;
 
-	rockchip_i2s_tdm_init_dai(i2s_tdm);
+	ret = rockchip_i2s_tdm_init_dai(i2s_tdm);
+	if (ret)
+		return ret;
 
 	i2s_tdm->frame_width = 64;
 
-- 
2.34.0

