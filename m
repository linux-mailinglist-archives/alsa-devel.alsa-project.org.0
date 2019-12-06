Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE0A114F21
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Dec 2019 11:37:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2F76169F;
	Fri,  6 Dec 2019 11:36:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2F76169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575628659;
	bh=rBoZD88SA1/OJdT+mLaTfLFTbsKIxrqoP/Lht9wxb+c=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DJIHQOHbpAxvW+b8dLSEQLPWKH6D6eWdOzpUwJlT7QjiSfCFvGJIn0tz9O7gX27eX
	 lDfQYJoGYbV6d9HlsjEhfMxyWd1lxporTxi/iVd26hjZpHc9fFqtFmPuEyDrozTTJW
	 whyyQvWXeSmvnh8AChLjZmD/CYUMUfW3Uo+x8L5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 302C3F80217;
	Fri,  6 Dec 2019 11:36:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77D40F80135; Fri,  6 Dec 2019 11:35:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AA2EF80135
 for <alsa-devel@alsa-project.org>; Fri,  6 Dec 2019 11:35:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AA2EF80135
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="oZC+Mg3x"
Received: by mail-wr1-x444.google.com with SMTP id q10so7166267wrm.11
 for <alsa-devel@alsa-project.org>; Fri, 06 Dec 2019 02:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2P76kSoNDGNNbqOJn2kSGms/jkHQIG00/8B7zZ9IAWc=;
 b=oZC+Mg3xodxXWHIkXMzl5MjCHXgHGP4BTZlEj8wbkkQKrb/xTAZz2TcgxnPz/8M8Ap
 SEVGG0mDu5DnWf8GLyFVlv6oV5oWGyAdn89M1wQTHdjQ0aBd0UHL8VE6vlwJu9lIrQsI
 IHEs5lBcbWtd66Zi1dpKu6KPBp8rTTQyW/0LSAUEUts5pg5tJQ3SJryqgWnpN0xxKaNY
 8awbJssV2Vk6/v9/6qOjuAPxok8m1mCzS66eaw5hBVwaHJNYSnntdObS/5Op3AiyHbSu
 4DPDUt5Bw+Dcqzr7sya9ODOXyLswtKpQIvCxPTS8lkAZfIPF5WWNJp9urxJbiuJRQGhS
 q8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2P76kSoNDGNNbqOJn2kSGms/jkHQIG00/8B7zZ9IAWc=;
 b=BaLsY8ZE1yaF+sJC2LMwBkkpo9tRKIxBQET7H64GsfhhFRJJG8SvZKnBXhBRTy0Kjt
 4uGlOfpm7Rj+W362yeLOjXG8nSSumaRDJjf0MMmccBZuyN5tBT9fMAqLJ6HkfQpOBbx5
 jFO34GkZSx5gEcj6n7pCt0/W1juu8Nern1m/3FKAd5dOTc8+vcyaA4AWys5Z3YlYD2O3
 IgyAVRgaB+UbjH14aZ/aHKP+c//rGgojXviXgMWti8FlZ6JT9UnCUttK6eZcK3pPJxJR
 bNpRX2+p5/p/12tRj3ZbUxZnCwhv381LW8JLL0NCha5AKNKVyYUU0RdzlqJTNlMJJZGc
 wUrg==
X-Gm-Message-State: APjAAAVeVZ/+m1Y6V5muFXtboLXrJdvx/nROV0Mvr8LEuS97ZL2DVBrr
 1uK7r9TzVr5fLqrTaDXn43C/Iw==
X-Google-Smtp-Source: APXvYqzpCEq7FRqzkGxefVAfwg3KvzY5JopYcmnzxXZT1FNThv71oz7fGU1opXocQjbae72vvyU62Q==
X-Received: by 2002:a5d:404b:: with SMTP id w11mr15822520wrp.171.1575628551056; 
 Fri, 06 Dec 2019 02:35:51 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id n14sm2164013wmk.0.2019.12.06.02.35.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2019 02:35:50 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Fri,  6 Dec 2019 11:35:42 +0100
Message-Id: <20191206103542.485224-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH v2] ASoC: hdmi-codec: re-introduce mutex
	locking again
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

The dai codec needs to ensure that on one dai is used at any time.
This is currently protected by bit atomic operation. With this change,
it done with a mutex instead.

This change is not about functionality or efficiency. It is done with
the hope that it help maintainability in the future.

Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/hdmi-codec.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index f8b5b960e597..543363102d03 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -274,7 +274,8 @@ struct hdmi_codec_priv {
 	uint8_t eld[MAX_ELD_BYTES];
 	struct snd_pcm_chmap *chmap_info;
 	unsigned int chmap_idx;
-	unsigned long busy;
+	struct mutex lock;
+	bool busy;
 	struct snd_soc_jack *jack;
 	unsigned int jack_status;
 };
@@ -390,9 +391,10 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
 	int ret = 0;
 
-	ret = test_and_set_bit(0, &hcp->busy);
-	if (ret) {
+	mutex_lock(&hcp->lock);
+	if (hcp->busy) {
 		dev_err(dai->dev, "Only one simultaneous stream supported!\n");
+		mutex_unlock(&hcp->lock);
 		return -EINVAL;
 	}
 
@@ -405,21 +407,21 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 	if (hcp->hcd.ops->get_eld) {
 		ret = hcp->hcd.ops->get_eld(dai->dev->parent, hcp->hcd.data,
 					    hcp->eld, sizeof(hcp->eld));
+		if (ret)
+			goto err;
+
+		ret = snd_pcm_hw_constraint_eld(substream->runtime, hcp->eld);
+		if (ret)
+			goto err;
 
-		if (!ret) {
-			ret = snd_pcm_hw_constraint_eld(substream->runtime,
-							hcp->eld);
-			if (ret)
-				goto err;
-		}
 		/* Select chmap supported */
 		hdmi_codec_eld_chmap(hcp);
 	}
-	return 0;
+
+	hcp->busy = true;
 
 err:
-	/* Release the exclusive lock on error */
-	clear_bit(0, &hcp->busy);
+	mutex_unlock(&hcp->lock);
 	return ret;
 }
 
@@ -431,7 +433,9 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
 	hcp->hcd.ops->audio_shutdown(dai->dev->parent, hcp->hcd.data);
 
-	clear_bit(0, &hcp->busy);
+	mutex_lock(&hcp->lock);
+	hcp->busy = false;
+	mutex_unlock(&hcp->lock);
 }
 
 static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
@@ -811,6 +815,8 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	hcp->hcd = *hcd;
+	mutex_init(&hcp->lock);
+
 	daidrv = devm_kcalloc(dev, dai_count, sizeof(*daidrv), GFP_KERNEL);
 	if (!daidrv)
 		return -ENOMEM;
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
