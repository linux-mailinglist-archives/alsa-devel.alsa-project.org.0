Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0172C1B1CB
	for <lists+alsa-devel@lfdr.de>; Mon, 13 May 2019 10:20:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E5CA16C5;
	Mon, 13 May 2019 10:20:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E5CA16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557735654;
	bh=e//fdyw95jx4hWNfA2tBgOYuEy5J7pK4o9ki+7L3kFU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ts8SxwHWqUGSFcEoJ01xvmZgIUXfiBHvwA+8H+NVSJhvTm1lIrttDvZnFLiuiBVZF
	 iR9al2klmduCAYPCNRR3dr+Yh1ErvQgvWYYJjj9dlY9eWBgfDfbRCi98xSNCihzL1f
	 oNJnxqhZYkDKP6iTY73mbIU7h6sbIQoIuKT2P3eY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD89CF8968A;
	Mon, 13 May 2019 10:19:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5347F89684; Mon, 13 May 2019 10:19:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE191F80733
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 10:19:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE191F80733
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="19wbZ9g4"
Received: by mail-wr1-x443.google.com with SMTP id d12so14092672wrm.8
 for <alsa-devel@alsa-project.org>; Mon, 13 May 2019 01:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fUi0ZGwdStuY0eVRYd5ldGSSn5HdKxs5p/Z/yyYivTw=;
 b=19wbZ9g46sLKbeiPuUn11Sf+oj1WEgyw3x02jpEOfdMoHk27ztwm0HIkmsn3bInU5J
 eprXbmiXOBvogz+3QhC3HHNgt61Uk4vo3vJDQrCasZG9z0KT2tyiawjCAYI9zMdrY0Ew
 Lqws+TlEHrQ9dTEGblkJpOApAWL2qwkfhYOQmBUF1rjywGqbYBcMbkmo4tcK69bLgpM+
 YkazkWzpRsxLieBr+vB5cLlNDAJr82+OCzsNY1kOuSFPNE+oieA4tKRY0CCzBYbcYNvA
 CadWec3B2ct4eGoe/SnHPYEc120RviRN4dxFzYGRnwehbQjnlIjqibS50pGKe8iupjd2
 oIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fUi0ZGwdStuY0eVRYd5ldGSSn5HdKxs5p/Z/yyYivTw=;
 b=Wn3Fst/0jH5F8Apg3llPk+pl543ndmOPV8hP9KYD2NS18kwHHU0qNb7ivIZ8jv1a/t
 yIIfbGOXvoUZkdszZc6Eg8R98fioVSOQdTRzb6rPyIzKCLC/bAc3FJjT1CqU2qeiCQHZ
 Bwzm1uzhzf7nJdI1oZdEvHJ+qconpupC1E4s5AapPVedswi058um4LWcGyEv5nM5QsJi
 WaJzKUlzmItHc0GT18/ZdIM4ltngIjSIl/7lI4v8E6Do9Jz57KjdBlfY7KRNFsJ0BqS5
 tlRJ+aMbo/IdaQatl8Ga7VukkdqdWOi0uP0Cowg+HmvHBdUKobVo7WFxqA/nJzXUvq5q
 M6PA==
X-Gm-Message-State: APjAAAVQjQyP8KtUqj6iPbXsimJM9V623foYNLslO1fRzw0LsrEUVWKy
 Q2ihlfR3fRpTiskDN0CPnvp0uA==
X-Google-Smtp-Source: APXvYqwLdalQYeISU9E+Q5WyRnBHVc3VJxFENzGQ3xLaSxs7jEwkM78H29YxFKjqcUY+auodvZ1x2Q==
X-Received: by 2002:adf:eac6:: with SMTP id o6mr7825518wrn.222.1557735543746; 
 Mon, 13 May 2019 01:19:03 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id x4sm1594859wrn.41.2019.05.13.01.19.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 01:19:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Mon, 13 May 2019 10:18:47 +0200
Message-Id: <20190513081847.31140-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH] ASoC: hdmi-codec: re-introduce mutex locking
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

Replace the bit atomic operations by a mutex to ensure only one dai
at a time is active on the hdmi codec.

This is a follow up on change:
3fcf94ef4d41 ("ASoC: hdmi-codec: remove reference to the current substream")

Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/hdmi-codec.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 90a892766625..6a0cc8d7e141 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -281,7 +281,7 @@ struct hdmi_codec_priv {
 	uint8_t eld[MAX_ELD_BYTES];
 	struct snd_pcm_chmap *chmap_info;
 	unsigned int chmap_idx;
-	unsigned long busy;
+	struct mutex lock;
 };
 
 static const struct snd_soc_dapm_widget hdmi_widgets[] = {
@@ -395,8 +395,8 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
 	int ret = 0;
 
-	ret = test_and_set_bit(0, &hcp->busy);
-	if (ret) {
+	ret = mutex_trylock(&hcp->lock);
+	if (!ret) {
 		dev_err(dai->dev, "Only one simultaneous stream supported!\n");
 		return -EINVAL;
 	}
@@ -424,7 +424,7 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 
 err:
 	/* Release the exclusive lock on error */
-	clear_bit(0, &hcp->busy);
+	mutex_unlock(&hcp->lock);
 	return ret;
 }
 
@@ -436,7 +436,7 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
 	hcp->hcd.ops->audio_shutdown(dai->dev->parent, hcp->hcd.data);
 
-	clear_bit(0, &hcp->busy);
+	mutex_unlock(&hcp->lock);
 }
 
 static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
@@ -773,6 +773,8 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	hcp->hcd = *hcd;
+	mutex_init(&hcp->lock);
+
 	daidrv = devm_kcalloc(dev, dai_count, sizeof(*daidrv), GFP_KERNEL);
 	if (!daidrv)
 		return -ENOMEM;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
