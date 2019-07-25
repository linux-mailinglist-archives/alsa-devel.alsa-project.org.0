Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D527550E
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 19:04:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8A8A1EFE;
	Thu, 25 Jul 2019 19:03:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8A8A1EFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564074256;
	bh=tJjel2zkJxT/HEyLZFy+emjA3ETwpTQQ42ZnFtCQ5t8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dr21rsVL6xo00byBokJViMvu6x5770hIJs3v2UA8H9sb1WjWQ8Yh/eFWdE6beGgsl
	 o7FMwYT4dhALTi4oWJPrRK9+5jFsZhqul4AS+58YPVBJZN409fYs4pcGoLdoOKHYes
	 r2JD9gnalkRZ3JYOtBUgEWCSfLuMojSFw4XIPMC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A8F3F804CC;
	Thu, 25 Jul 2019 19:00:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62544F80481; Thu, 25 Jul 2019 19:00:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECAADF80392
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 18:59:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECAADF80392
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="dzjJNvq7"
Received: by mail-wr1-x444.google.com with SMTP id f9so51508374wre.12
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 09:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZSaABRSxmdPUIlgGnW2e+CGetJdVeG6KV5A9m/NM03Q=;
 b=dzjJNvq7xJTWyXkFVbIaJLjqZBZoU8ZqdT/QCMdQPbuJsEia8N4AjHH78SYDIQU/MF
 SE3D5rq72pKncku4roeMltpWj1HtoMrqQExGA9l/OLQrjzQSCOZtLQfjLYLzl51m+0xS
 3sw1Fy+4OfjzyaOVMeQG4tcxFmsfPZNwitZYidiZtbQXEeSBxYGe4eRDxWDYqyeREeO9
 2wZKTH81vMLCcOTF+aDJwx9/t02mvMe+3tm4AXN1U3z/r2/CscTu6HotbuaVp6x5x+0l
 vYuvLlI/PjAaD+IrADHxVH5rHmxz/Qiq8cBtSkr4OhXxDHLlByhqVuU5Llzhx0X4VtrO
 GoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZSaABRSxmdPUIlgGnW2e+CGetJdVeG6KV5A9m/NM03Q=;
 b=RcmMVUbdG85Uff3PveDAAWPWfpZ+NgryLCCH3ZJRkAvqKZYCnZeduw69AeGHTuyqLv
 az5E2izMeFGac5k8XoX5I+O+Ery4O9+faLG0mJ2QvxKvIzjqV9w2JMv2tgnQxQOLMYuc
 o8OfeXzZTnssW+vymVPks0YzgzOs1zZcAeg5C3o5sQHHrVDdhpewByoid87jdev7XqwU
 B8VDOxRa5AECGTtzheEF9YCahG/Tz8EwUwMWU1/qkddXTAoDB50mccFzGyIhZusws9iR
 EEp8BHWCBBYXdyoyaE0lSWtJuvMk+cI9/+/8z2KbWx8y0QK0EiPXuKNxtRCIgH2x2DcR
 izQw==
X-Gm-Message-State: APjAAAU5os/CoJYLYQLveOB4zbpH8Hp86/McZSt5jjKRNdYEBKfzwZQ6
 2TX1vVb20ZTzJ2rBT1bPioynXA==
X-Google-Smtp-Source: APXvYqzRG6Az+MgGqxxEBAb5E5EGfhL+MFHK/+8S7Iq7P68KOK5tPCMXEIL5dt32F7Ydq6A6BwLZGA==
X-Received: by 2002:a5d:4484:: with SMTP id j4mr95779961wrq.143.1564073996455; 
 Thu, 25 Jul 2019 09:59:56 -0700 (PDT)
Received: from starbuck.baylibre.local (uluru.liltaz.com. [163.172.81.188])
 by smtp.googlemail.com with ESMTPSA id q10sm53627199wrf.32.2019.07.25.09.59.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 09:59:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Thu, 25 Jul 2019 18:59:47 +0200
Message-Id: <20190725165949.29699-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190725165949.29699-1-jbrunet@baylibre.com>
References: <20190725165949.29699-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH v2 4/6] ASoC: create pcm for codec2codec links
	as well
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
