Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84809733E6
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 18:28:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19DF885D;
	Wed, 24 Jul 2019 18:28:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19DF885D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563985735;
	bh=tJjel2zkJxT/HEyLZFy+emjA3ETwpTQQ42ZnFtCQ5t8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jt7Y7moAWMCCaiXgN82fw81mbMAjQmmK0o2rEBQzhKnZgQceBpKL/hVIuhgxrT5jR
	 +cotSzoX7xYF7xqOG9RwmDXWf7Eg749VQm3LFMSs0DmK8SCJJbXMrGaVqlYzzHeRm8
	 EIhIE9SLE3YnGsP30LlLY4W6qaASn2dyFStkEBrk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0E6DF80519;
	Wed, 24 Jul 2019 18:24:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63CF5F804FF; Wed, 24 Jul 2019 18:24:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 928D7F803D1
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 18:24:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 928D7F803D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="0pshrWOR"
Received: by mail-wr1-x443.google.com with SMTP id n9so47740572wru.0
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 09:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZSaABRSxmdPUIlgGnW2e+CGetJdVeG6KV5A9m/NM03Q=;
 b=0pshrWORbtR9bwGpPO/MJfAdOn47cpmS7uHac8G6OKoOKp2ZPIni0pWdFjRnSmwsJf
 W6BdvldykF0q8NBQvlSe/iRUgyDrBKncnSgKIziL/9tRU60SwhO2eyi6FoLTjyFFz9px
 vq7W3LDd7u0bkk/5pt8Dm69MPaEjimSoSWColk3ocsvSAfkwSbMgQBtE4r+O2Umi2o6Y
 k+nL159AfkGDIoB0+EoO9XgUxV/t3tHYp7BWUhb22rj2U7GUO+lYhk1tyHx3/kB//XED
 JRkpaIhqP375b6vvq55uSwqVGpAtICIP8Q0mRBH2kY0+wPkycv7lWs10T0WKC2ZYEs0Q
 cqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZSaABRSxmdPUIlgGnW2e+CGetJdVeG6KV5A9m/NM03Q=;
 b=a+s9lExyv2O4wysAY+L21SfxznawyFXrc1iHHXQy9WLrzNoIxq5wU4YT+vuIfJ6NCz
 duTpAaXzIvpgRi8Gb0giKCk6lHRJ1xJT0Iehs53HmMljqdNCm2CSmxdZNXKbTpCfon9b
 1EjBeet1neNOqHU8te046LpU+6KhmTgMbhO53pe6k3D/fDfvOCMstzInLuAlCVJ6xcL/
 NWM6NssIp4ecq690OK2bpupV9qNoqatUalKt/Tu5biD2yvwQao5bAA0sWxC7ukV+u+mf
 eGOFhERzNZYDLxVj+f+E4fnVlcGEQPwOq0PPoASoUk6wSrF+Jb6ILH8rjE6mQUd66Xwt
 01cw==
X-Gm-Message-State: APjAAAWE1E3hAtpEVBOLpMqnKuk71XwofPpMxacchLoEVDENSnsGqZDr
 K5HKcHr5eXD11P8MEeD62Qs6xA==
X-Google-Smtp-Source: APXvYqxS3+s9PV/UD5cbznvDYuzkayLSYR2XQOJ7T6bOblKvnaCksJxG1/j1hQYeSoEZr3oOFC0kmg==
X-Received: by 2002:adf:e843:: with SMTP id d3mr40668799wrn.249.1563985453480; 
 Wed, 24 Jul 2019 09:24:13 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id f70sm55688960wme.22.2019.07.24.09.24.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 09:24:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Wed, 24 Jul 2019 18:24:03 +0200
Message-Id: <20190724162405.6574-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190724162405.6574-1-jbrunet@baylibre.com>
References: <20190724162405.6574-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 4/6] ASoC: create pcm for codec2codec links as
	well
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

At the moment, codec to codec links uses an ephemeral variable for
the struct snd_pcm_substream. Also the struct snd_soc_pcm_runtime
does not have real struct snd_pcm.

This might a problem if the functions used by a codec on codec to
codec link expect these structures to exist, and keep on existing
during the life of the codec.

For example, it is the case of the hdmi-codec, which uses
snd_pcm_add_chmap_ctls(). For the controls to works, the pcm and
substream must to exist.

This change is first step, it create pcm (and substreams) for codec
to codec links, in the same way as dpcm backend links.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-core.c | 42 ++++++++++++------------------------------
 sound/soc/soc-pcm.c  | 35 ++++++++++++++++++++++++++++++++---
 2 files changed, 44 insertions(+), 33 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 7ecfe641ca46..9e8eb93c8a3f 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -447,16 +447,6 @@ static void snd_soc_flush_all_delayed_work(struct snd_soc_card *card)
 		flush_delayed_work(&rtd->delayed_work);
 }
 
-static void codec2codec_close_delayed_work(struct work_struct *work)
-{
-	/*
-	 * Currently nothing to do for c2c links
-	 * Since c2c links are internal nodes in the DAPM graph and
-	 * don't interface with the outside world or application layer
-	 * we don't have to do any special handling on close.
-	 */
-}
-
 #ifdef CONFIG_PM_SLEEP
 /* powers down audio subsystem for suspend */
 int snd_soc_suspend(struct device *dev)
@@ -1552,27 +1542,19 @@ static int soc_probe_link_dais(struct snd_soc_card *card,
 		return ret;
 	}
 
-	if (!dai_link->params) {
-		/* create the pcm */
-		ret = soc_new_pcm(rtd, num);
-		if (ret < 0) {
-			dev_err(card->dev, "ASoC: can't create pcm %s :%d\n",
-				dai_link->stream_name, ret);
-			return ret;
-		}
-		ret = soc_link_dai_pcm_new(&cpu_dai, 1, rtd);
-		if (ret < 0)
-			return ret;
-		ret = soc_link_dai_pcm_new(rtd->codec_dais,
-					   rtd->num_codecs, rtd);
-		if (ret < 0)
-			return ret;
-	} else {
-		INIT_DELAYED_WORK(&rtd->delayed_work,
-				  codec2codec_close_delayed_work);
+	/* create the pcm */
+	ret = soc_new_pcm(rtd, num);
+	if (ret < 0) {
+		dev_err(card->dev, "ASoC: can't create pcm %s :%d\n",
+			dai_link->stream_name, ret);
+		return ret;
 	}
-
-	return 0;
+	ret = soc_link_dai_pcm_new(&cpu_dai, 1, rtd);
+	if (ret < 0)
+		return ret;
+	ret = soc_link_dai_pcm_new(rtd->codec_dais,
+				   rtd->num_codecs, rtd);
+	return ret;
 }
 
 static int soc_bind_aux_dev(struct snd_soc_card *card, int num)
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index fabeac164a6c..30264bc592f6 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -678,6 +678,16 @@ static void close_delayed_work(struct work_struct *work)
 	mutex_unlock(&rtd->pcm_mutex);
 }
 
+static void codec2codec_close_delayed_work(struct work_struct *work)
+{
+	/*
+	 * Currently nothing to do for c2c links
+	 * Since c2c links are internal nodes in the DAPM graph and
+	 * don't interface with the outside world or application layer
+	 * we don't have to do any special handling on close.
+	 */
+}
+
 /*
  * Called by ALSA when a PCM substream is closed. Private data can be
  * freed here. The cpu DAI, codec DAI, machine and components are also
@@ -3011,6 +3021,12 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 		playback = rtd->dai_link->dpcm_playback;
 		capture = rtd->dai_link->dpcm_capture;
 	} else {
+		/* Adapt stream for codec2codec links */
+		struct snd_soc_pcm_stream *cpu_capture = rtd->dai_link->params ?
+			&cpu_dai->driver->playback : &cpu_dai->driver->capture;
+		struct snd_soc_pcm_stream *cpu_playback = rtd->dai_link->params ?
+			&cpu_dai->driver->capture : &cpu_dai->driver->playback;
+
 		for_each_rtd_codec_dai(rtd, i, codec_dai) {
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
 			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK))
@@ -3019,6 +3035,9 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 			    snd_soc_dai_stream_valid(cpu_dai,   SNDRV_PCM_STREAM_CAPTURE))
 				capture = 1;
 		}
+
+		capture = capture && cpu_capture->channels_min;
+		playback = playback && cpu_playback->channels_min;
 	}
 
 	if (rtd->dai_link->playback_only) {
@@ -3032,7 +3051,13 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	}
 
 	/* create the PCM */
-	if (rtd->dai_link->no_pcm) {
+	if (rtd->dai_link->params) {
+		snprintf(new_name, sizeof(new_name), "codec2codec(%s)",
+			 rtd->dai_link->stream_name);
+
+		ret = snd_pcm_new_internal(rtd->card->snd_card, new_name, num,
+					   playback, capture, &pcm);
+	} else if (rtd->dai_link->no_pcm) {
 		snprintf(new_name, sizeof(new_name), "(%s)",
 			rtd->dai_link->stream_name);
 
@@ -3059,13 +3084,17 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	dev_dbg(rtd->card->dev, "ASoC: registered pcm #%d %s\n",num, new_name);
 
 	/* DAPM dai link stream work */
-	INIT_DELAYED_WORK(&rtd->delayed_work, close_delayed_work);
+	if (rtd->dai_link->params)
+		INIT_DELAYED_WORK(&rtd->delayed_work,
+				  codec2codec_close_delayed_work);
+	else
+		INIT_DELAYED_WORK(&rtd->delayed_work, close_delayed_work);
 
 	pcm->nonatomic = rtd->dai_link->nonatomic;
 	rtd->pcm = pcm;
 	pcm->private_data = rtd;
 
-	if (rtd->dai_link->no_pcm) {
+	if (rtd->dai_link->no_pcm || rtd->dai_link->params) {
 		if (playback)
 			pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->private_data = rtd;
 		if (capture)
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
