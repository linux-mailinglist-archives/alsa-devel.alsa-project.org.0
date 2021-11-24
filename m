Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC33E45CEC3
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 22:09:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 327831714;
	Wed, 24 Nov 2021 22:08:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 327831714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637788142;
	bh=JEra3hZbiiinltoohENIBzij2WjTbkVHoWZnS4nGEJ0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W6rMTlQUJ30O2mLxrKOmq31utYEgHRrfSuptKQ6IxBkXw7Lv/O5Il7IktUcQ6IG44
	 qPBEFRYQ7CIU1v9id+USGzhxTEWAmGKjNdIsDWWCNPa6CzKrymmBcvfw6KYkERjokZ
	 IZVnRprJk4VpqvD44nHaVjt7IajhMrF57wPAYq78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CB74F80212;
	Wed, 24 Nov 2021 22:07:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6DD6F80087; Wed, 24 Nov 2021 22:07:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF5F4F80087
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 22:07:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF5F4F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IvaqaftG"
Received: by mail-wr1-x431.google.com with SMTP id b12so6771970wrh.4
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 13:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d0JcHrS7rw6PdBZ7/HfgOLWu1/etSoOgbibJUUNb29U=;
 b=IvaqaftGqGnaQmJOuJxs+JXXu84+4qZwObmBV1wM5y7nSK2aIDqKGuTYxsjPaheCih
 ISODKxDugG3uazJWeJLCEMHB+RRpRUxI1T2W3uB41tKolO0Sp4NVA4PpCkjLIqUVMqw4
 QY5cOFWQQSZsv5tN4Ean7QsGu4KS7nu9xAU2OPj1oghbwEpu8Za3cEM6ItVEeulu0Z40
 NfMt2uVWM0vxu5VxwXgEmzcc8HD2fdvOZTuPv08j9t7rf1K70Y35IxUZ87ECx1OH5UhK
 QX77dcsjSnSse++WXfoycLTnUj6yl6XUifHFrC6gTSXiBPKnkYGvKH3gbs7B2KUTCjaT
 w74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d0JcHrS7rw6PdBZ7/HfgOLWu1/etSoOgbibJUUNb29U=;
 b=teIXppYxwumcWvb+00nSaLVIGd2RUwfPK3QTwpI9RNudiSN7JBVt9IEwdt+QtJuQhG
 o+ts7EZgw7QIr99Lsh/SmAg2ZuclKvvyRmFHwJVbbWD61DIQLhp2A8t6Lco79g6oBwXx
 KDwE3k0FF98kU1frLdylRm0GuJzGbudefQlByiRkOZOkLh5Ah8qkTYtA/UHfg3g5ubR4
 DyJx8KmFJe7KLIPoTcdQ8YHrdnc+ALeUutrmzKmB/8oR+ddZTlGxLcie94+8hpqn0IL/
 FXnfziBBxYHsYZKCsNYSuUH5zykkPyTKQ6p+dCuYUKaOTs1Cwkm5jMZsHA2Onj71IVtb
 Asew==
X-Gm-Message-State: AOAM531GoRq/ced3KxZY62mZupIWV6yDtYCKUBnBoqUHZvdKkNnBoTE5
 7ZEqozTSQ8bq1azFkm1k7ds=
X-Google-Smtp-Source: ABdhPJz+Ekiy9CMWyUTEC6BHBxlgNLP061y7vlYho7gG71cQT7b6wRZULUlzffYP12V3cXPPwJHlSg==
X-Received: by 2002:a5d:45c4:: with SMTP id b4mr34041wrs.222.1637788043676;
 Wed, 24 Nov 2021 13:07:23 -0800 (PST)
Received: from localhost.localdomain (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id p8sm906195wrx.25.2021.11.24.13.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 13:07:23 -0800 (PST)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] ASoC: rockchip: i2s_tdm: Dup static DAI template
Date: Wed, 24 Nov 2021 22:06:55 +0100
Message-Id: <20211124210655.288108-1-frattaroli.nicolas@gmail.com>
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
 sound/soc/rockchip/rockchip_i2s_tdm.c | 42 +++++++++++++++------------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 17b9b287853a..e9ddbbf4563e 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1312,22 +1312,17 @@ static const struct of_device_id rockchip_i2s_tdm_match[] = {
 
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
-		       SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S24_LE |
-		       SNDRV_PCM_FMTBIT_S32_LE);
+	SNDRV_PCM_FMTBIT_S20_3LE | SNDRV_PCM_FMTBIT_S24_LE |
+	SNDRV_PCM_FMTBIT_S32_LE);
 	struct device_node *node = i2s_tdm->dev->of_node;
 
 	of_property_for_each_string(node, "dma-names", dma_names, dma_name) {
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

