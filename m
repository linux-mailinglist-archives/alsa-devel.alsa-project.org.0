Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70747E204E
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 18:15:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EE641681;
	Wed, 23 Oct 2019 18:14:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EE641681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571847338;
	bh=aGoHRY7AdHvf5DPQaW5vVWWjfm7//naH/Z7ygojr7fQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KIcmRwTOxY3RuZ+35zwioXZosOnFEeO4gLE6No8yOv4P8Ocd87q9NKwIRkGYHcNtz
	 Ef5rqg2vn/lFcKY+eOU8SWOcSWW4tp4zTY81Yvr3FeqxBwzof/AJSw9hFQMPqX+iJF
	 6AHfljGi9/UCbA1sujoGQJ7G8QZ+dl5j2/h37Bvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 826A2F80611;
	Wed, 23 Oct 2019 18:12:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DAB6F80368; Wed, 23 Oct 2019 18:12:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBF66F80321
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 18:12:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBF66F80321
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="YlDpVbEY"
Received: by mail-wr1-x441.google.com with SMTP id z9so22726344wrl.11
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 09:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jku1smTEPHhN+cvKCtL6fmKpwQiYDnStnysLN3jZh3k=;
 b=YlDpVbEY99OVN3O7AhHeZrOjLm2qsRLfbFJi27v0f4JnEnOTvZAQulErlq8Nlj1kNe
 cDoLIFstWwUieFXb4Lu+DTBmbpQCN+6fXRk3jXwLqKCaSvPHaRxPoydTedDsseb7lYEJ
 Kjd3h8A5C/2L3DqQe6S1b9jFVFMX9w+VyobSD9zi0sa03QZGpFbKpLceATsPeo26SSS/
 W5lAFCgVvP2GFX+J1mWRu7MskCqrFS9n8ppb7q8VBsMkijs9GJKKecGtyJWApYNLPFK9
 xennvVzeF3L5sWOFNgqMdtc8L0RiLeq9ictajHb+4QiKFt9SftOsfUi1isgT+6j8ye49
 S2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jku1smTEPHhN+cvKCtL6fmKpwQiYDnStnysLN3jZh3k=;
 b=RN9tl5jRxMcvwPnq064+8Bwd4cHFLqTMyx3zajNTLf12JhsTYyegFc6Mz8AX5+I2Pv
 WCoAH5OcgP+tClnFsX1rI5OhJhhTwEAAHZxOU05z4PtVk4FR3kZ8MIe6JLsE9D3ck4/m
 DzpHFgTcYB291MkvfzclzM4KYjHPIByohmEbjiKYUYTjLymUWHri/AWkkfh+aHvs5B+C
 kGO55jum0qaoCAfexmJrvUBSHQf+dXgKbfj402DssdHqFDHBCWMRR71fvblfcfMfjveV
 X8/kJdisPQyvbNDEiSo+sCIwllv7us4cmEH8BPm4El4Ng7txHI9iCcoyDe8ZEwAhpUMT
 F4tg==
X-Gm-Message-State: APjAAAWInAY58Pug/vUFp3OanF8jc1XFmKFbFe0HGFRVryWWMHgiKHv9
 W/2Ti2bMZ2xdcT7AtKAIZ8Wu+Q==
X-Google-Smtp-Source: APXvYqwJZmJTgYaqzR7EpYV47FoagkgViQqCyt9VJfAZEwIu5Pi0cWnYVEpA+myXiZVbuNZ9XnrLPw==
X-Received: by 2002:a5d:4f91:: with SMTP id d17mr9372180wru.184.1571847133523; 
 Wed, 23 Oct 2019 09:12:13 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id x7sm30240578wrg.63.2019.10.23.09.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 09:12:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Wed, 23 Oct 2019 18:12:03 +0200
Message-Id: <20191023161203.28955-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191023161203.28955-1-jbrunet@baylibre.com>
References: <20191023161203.28955-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: alsa-devel@alsa-project.org, Russell King <rmk+kernel@armlinux.org.uk>,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 2/2] ASoC: hdmi-codec: re-introduce mutex
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

Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/hdmi-codec.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index f8b5b960e597..56f6373d7927 100644
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
@@ -390,12 +391,15 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
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
 
+	hcp->busy = true;
+
 	if (hcp->hcd.ops->audio_startup) {
 		ret = hcp->hcd.ops->audio_startup(dai->dev->parent, hcp->hcd.data);
 		if (ret)
@@ -415,11 +419,12 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 		/* Select chmap supported */
 		hdmi_codec_eld_chmap(hcp);
 	}
-	return 0;
 
 err:
-	/* Release the exclusive lock on error */
-	clear_bit(0, &hcp->busy);
+	if (ret)
+		hcp->busy = false;
+
+	mutex_unlock(&hcp->lock);
 	return ret;
 }
 
@@ -431,7 +436,9 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
 	hcp->hcd.ops->audio_shutdown(dai->dev->parent, hcp->hcd.data);
 
-	clear_bit(0, &hcp->busy);
+	mutex_lock(&hcp->lock);
+	hcp->busy = false;
+	mutex_unlock(&hcp->lock);
 }
 
 static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
@@ -811,6 +818,8 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	hcp->hcd = *hcd;
+	mutex_init(&hcp->lock);
+
 	daidrv = devm_kcalloc(dev, dai_count, sizeof(*daidrv), GFP_KERNEL);
 	if (!daidrv)
 		return -ENOMEM;
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
