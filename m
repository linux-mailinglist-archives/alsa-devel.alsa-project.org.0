Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B048B3BA7
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:34:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F92721B6;
	Fri, 26 Apr 2024 17:33:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F92721B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145645;
	bh=S7RONIxFeXwe67F6fo0qfGrsfEGqrrUtec1UUThnSXQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=STNLqNx+XxHBh+mVvajBe6QlDZT77qTs70iW1mVrqSIU6PRLHNsm9yeE+nFWzNQKr
	 UtgB7cl9s+kfO8HKgzmscwCbW/9fvPUw+K2IyzEYcaOgPit72mg9EFdY/QVHUIjN+C
	 0oBnBkYZKwp1VdphELy9WVGQP4ypk7VMrlwvjLBo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A0D8F8068C; Fri, 26 Apr 2024 17:30:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3275F80686;
	Fri, 26 Apr 2024 17:30:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F620F8060F; Fri, 26 Apr 2024 17:30:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 123F5F805AB
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:29:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 123F5F805AB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=l9xA25CG
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41b7a26326eso8175945e9.3
        for <alsa-devel@alsa-project.org>;
 Fri, 26 Apr 2024 08:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714145398;
 x=1714750198; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bQrmumSWoqJQMi/l6xj2yc8RNYXdlpvWVWdoITuaG8=;
        b=l9xA25CG4ybOWVIXlzRgSrexw1HKs+4dKJ3bLhdDD2b3QlH0wBYi+69OAr+oObvZmh
         tdSNiV8hIUE1aOXM2ekVvY4Znerb9R/ONfqQfcmNhSxQvPuyV5hNmpJ9D0oEWqRZ/AmN
         mlFhNbHvl0v4c8RkXameBYT+dhrgXc2rK8GNkJQhPpf4RnrNjLEy2G8fksS/U0wvyCUk
         LV8SsMTj9keFeYoox9mLcg7Z/sRmWcIDF7nlCfFBgUWE2Y/QQXybK5mhOocErkkvIdAz
         nQnGOPNMjQ1tdeoC6dEHzDVH8tt5t4E++GgGeeSSLgSAXLs/zeCPcxzKCCcj/N489mgT
         SjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714145398; x=1714750198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4bQrmumSWoqJQMi/l6xj2yc8RNYXdlpvWVWdoITuaG8=;
        b=r//CEGjG4H8r2tgnhNKvCgWlt7Tq+x2jCQxisVMtJRHJfMhGzosGff3gXFF++NXCug
         4M7yOwbewwBC53+jIA9Osr4zj6lMGNG5Sx8FZhfaeo218+nQ7Tlne6LwzIEfswOYKl4c
         IkvcJO982REcHRhyQw/kDgEaA6hXODXcRlGV4ae9pxEiwjZQr4+rTjGfnib62LDJYJYU
         ZEyLTqT0KNiFXOOYZrFClIgHOBVjCEmSI3+cqG4cYGrAdqs9fPgi+Px25Rn3Het8XmSR
         WoRrFADI/UtQ7k8ycXzATkHm88tQ5+FKR9mWrSs4dkUDA7oCibfkKbajosi7LV8iXbwv
         YFNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8u7aPTgZJzqow30TpRS8JFYngddIlFonu+ytz0s8lNXKJ7ehMUbaQGXOUIDSVqIpUEFis+YW7bZWUDiVakIPEiGXcgE+rygz6Mvw=
X-Gm-Message-State: AOJu0YwHMasNZpWlm+m81+28x7McUf9asJtLr9EHPqTLxWe1jepw3L12
	cKB48h2OYceaZ8/PQ+pflq91iPRytatfqwnKawFXmBLBRV/AkWp6YuLpT/kA7Xo=
X-Google-Smtp-Source: 
 AGHT+IHMerJdt74ThT9W2AwuFt/nqHhB935A349L3A9erdfLScSRYmjfvTF+QLgGqsuEAmQiV3l5MA==
X-Received: by 2002:a05:600c:4f11:b0:419:87ab:f6db with SMTP id
 l17-20020a05600c4f1100b0041987abf6dbmr2369314wmq.23.1714145398045;
        Fri, 26 Apr 2024 08:29:58 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1926:f73e:8b99:1c0a])
        by smtp.googlemail.com with ESMTPSA id
 i13-20020a05600c354d00b00419fba938d8sm22628687wmq.27.2024.04.26.08.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 08:29:57 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 4/4] ASoC: meson: axg-tdm: add continuous clock support
Date: Fri, 26 Apr 2024 17:29:41 +0200
Message-ID: <20240426152946.3078805-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240426152946.3078805-1-jbrunet@baylibre.com>
References: <20240426152946.3078805-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7XPIC2LN7ZPGKBCOSU3V42UK6SBNILIS
X-Message-ID-Hash: 7XPIC2LN7ZPGKBCOSU3V42UK6SBNILIS
X-MailFrom: jbrunet@baylibre.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7XPIC2LN7ZPGKBCOSU3V42UK6SBNILIS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some devices may need the clocks running, even while paused.
Add support for this use case.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-tdm-formatter.c | 40 +++++++++++++++++++++++++++++
 sound/soc/meson/axg-tdm-interface.c | 16 +++++++++++-
 sound/soc/meson/axg-tdm.h           |  5 ++++
 3 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
index 63333a2b0a9c..a6579efd3775 100644
--- a/sound/soc/meson/axg-tdm-formatter.c
+++ b/sound/soc/meson/axg-tdm-formatter.c
@@ -392,6 +392,46 @@ void axg_tdm_stream_free(struct axg_tdm_stream *ts)
 }
 EXPORT_SYMBOL_GPL(axg_tdm_stream_free);
 
+int axg_tdm_stream_set_cont_clocks(struct axg_tdm_stream *ts,
+				   unsigned int fmt)
+{
+	int ret = 0;
+
+	if (fmt & SND_SOC_DAIFMT_CONT) {
+		/* Clock are already enabled - skipping */
+		if (ts->clk_enabled)
+			return 0;
+
+		ret = clk_prepare_enable(ts->iface->mclk);
+		if (ret)
+			return ret;
+
+		ret = clk_prepare_enable(ts->iface->sclk);
+		if (ret)
+			goto err_sclk;
+
+		ret = clk_prepare_enable(ts->iface->lrclk);
+		if (ret)
+			goto err_lrclk;
+
+		ts->clk_enabled = true;
+		return 0;
+	}
+
+	/* Clocks are already disabled - skipping */
+	if (!ts->clk_enabled)
+		return 0;
+
+	clk_disable_unprepare(ts->iface->lrclk);
+err_lrclk:
+	clk_disable_unprepare(ts->iface->sclk);
+err_sclk:
+	clk_disable_unprepare(ts->iface->mclk);
+	ts->clk_enabled = false;
+	return ret;
+}
+EXPORT_SYMBOL_GPL(axg_tdm_stream_set_cont_clocks);
+
 MODULE_DESCRIPTION("Amlogic AXG TDM formatter driver");
 MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index 8bf3735dedaa..62057c71f742 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -309,6 +309,7 @@ static int axg_tdm_iface_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *dai)
 {
 	struct axg_tdm_iface *iface = snd_soc_dai_get_drvdata(dai);
+	struct axg_tdm_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
 	int ret;
 
 	switch (iface->fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
@@ -346,7 +347,19 @@ static int axg_tdm_iface_hw_params(struct snd_pcm_substream *substream,
 			return ret;
 	}
 
-	return 0;
+	ret = axg_tdm_stream_set_cont_clocks(ts, iface->fmt);
+	if (ret)
+		dev_err(dai->dev, "failed to apply continuous clock setting\n");
+
+	return ret;
+}
+
+static int axg_tdm_iface_hw_free(struct snd_pcm_substream *substream,
+				 struct snd_soc_dai *dai)
+{
+	struct axg_tdm_stream *ts = snd_soc_dai_get_dma_data(dai, substream);
+
+	return axg_tdm_stream_set_cont_clocks(ts, 0);
 }
 
 static int axg_tdm_iface_trigger(struct snd_pcm_substream *substream,
@@ -417,6 +430,7 @@ static const struct snd_soc_dai_ops axg_tdm_iface_ops = {
 	.set_fmt	= axg_tdm_iface_set_fmt,
 	.startup	= axg_tdm_iface_startup,
 	.hw_params	= axg_tdm_iface_hw_params,
+	.hw_free	= axg_tdm_iface_hw_free,
 	.trigger	= axg_tdm_iface_trigger,
 };
 
diff --git a/sound/soc/meson/axg-tdm.h b/sound/soc/meson/axg-tdm.h
index 42f7470b9a7f..daaca10fec9e 100644
--- a/sound/soc/meson/axg-tdm.h
+++ b/sound/soc/meson/axg-tdm.h
@@ -58,12 +58,17 @@ struct axg_tdm_stream {
 	unsigned int physical_width;
 	u32 *mask;
 	bool ready;
+
+	/* For continuous clock tracking */
+	bool clk_enabled;
 };
 
 struct axg_tdm_stream *axg_tdm_stream_alloc(struct axg_tdm_iface *iface);
 void axg_tdm_stream_free(struct axg_tdm_stream *ts);
 int axg_tdm_stream_start(struct axg_tdm_stream *ts);
 void axg_tdm_stream_stop(struct axg_tdm_stream *ts);
+int axg_tdm_stream_set_cont_clocks(struct axg_tdm_stream *ts,
+				   unsigned int fmt);
 
 static inline int axg_tdm_stream_reset(struct axg_tdm_stream *ts)
 {
-- 
2.43.0

