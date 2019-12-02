Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D6210F2F1
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2019 23:50:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C177165F;
	Mon,  2 Dec 2019 23:49:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C177165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575327004;
	bh=+HzUpsaB9c4lcaDQeTx3ZGqu873s575jmAmwTiUYhLw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YyRJqGKyv2fev8KbEEoLO3/P2gP817VQwQJYGP2e8/DsCWqYzFXbPzhQXK3YGuPiY
	 Mo5LYIHEjGLnOV2SkhNQqBCywNX4E1WC8+NgtW0WL5aOTj3sLLKlVo+VzLg9QfT8gi
	 YOqaA62ojPItW5llKHNWRvaP57iKSODV2Pam1eew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A56EF80090;
	Mon,  2 Dec 2019 23:48:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29FF3F80214; Mon,  2 Dec 2019 23:48:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E352F800F0
 for <alsa-devel@alsa-project.org>; Mon,  2 Dec 2019 23:48:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E352F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="fZSxDRD4"
Received: by mail-pg1-x542.google.com with SMTP id k25so513046pgt.7
 for <alsa-devel@alsa-project.org>; Mon, 02 Dec 2019 14:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eAzv8oAY9ssrGep4PtlHwMdCwbhIuD55XVnZjwMy1pE=;
 b=fZSxDRD4nL2WTj06rijnYzi7ObPI0Bka78kF27r5tpJcrQPiIEISLySwLengO5Jys6
 svMq7zPaJ1QlqMJbTPivW19mSrrxoeRrb3HoD426oRHQeQRz4CqhKqaLVys3RcaxFGtQ
 0p8FR6uXIhWaEzp2zb1b9usnxco/USVJ/QUg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eAzv8oAY9ssrGep4PtlHwMdCwbhIuD55XVnZjwMy1pE=;
 b=U1neuhBOfcTYFeoqwOZkjE9lZl5h/lui8gAQmwBnN2d+KhSqUaw6mKC2lFNpOZ4ive
 PXPJiXcaeb7HS+Bs9b8Jd1XasaZIm4MnftRs/eNY8+poYxZvKkjvJEAjPCY+FwIh7q40
 /AAdWQQXHP0VorLBZ/G4YrSUpzk47+0qPEx7eUTFJgA7/T3kyiroUbuZ8Ts4Y5a7qmks
 AfSf2RDV+7S2YCH5HSzhl1fFHm3oJqwB43HjRhdSZ45b9wwrZtkBLPrjUN+qsYA4IM7Z
 HEDU3EXjt/lxlsLgGLPV55AR0J3zvJyLmWjb8SJ5zk63x69x1NuFgQCqcS+IZErP3JH8
 R/aA==
X-Gm-Message-State: APjAAAV8iasd42GkSNe4uyrEea83k+bDHOadZgSRytjHDrxzXNaTMBQ0
 iJEd6yNYx8PJq7RYWz6WSy22yugYpQ==
X-Google-Smtp-Source: APXvYqwJGr+2tWmZPmwJtcbX/lY02xB98+Bfx8CSJ2C9/xx0htaGAjXeOLRTQN3Bs1uKg1Ck/8U1Uw==
X-Received: by 2002:a63:c0a:: with SMTP id b10mr1758918pgl.168.1575326892078; 
 Mon, 02 Dec 2019 14:48:12 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id z7sm559693pfk.41.2019.12.02.14.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2019 14:48:11 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Mon,  2 Dec 2019 14:47:52 -0800
Message-Id: <20191202224752.52039-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH] ASoC: core: Init pcm runtime work early to
	avoid warnings
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

There are cases where we fail before we reach soc_new_pcm which would
init the workqueue. When we fail we attempt to flush the queue which
generates warnings from the workqueue subsystem when we have not inited
the queue. Solution is to use a proxy function to get around this issue.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Cc: Takashi Iwai <tiwai@suse.de>
---
 include/sound/soc.h  |  1 +
 sound/soc/soc-core.c | 10 ++++++++++
 sound/soc/soc-pcm.c  | 11 ++++-------
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index c28a1ed5e8df9..2628967998264 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1150,6 +1150,7 @@ struct snd_soc_pcm_runtime {
 	unsigned int num_codecs;
 
 	struct delayed_work delayed_work;
+	void (*close_delayed_work_func)(struct snd_soc_pcm_runtime *rtd);
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs_dpcm_root;
 #endif
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 062653ab03a37..0e2e628302f1d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -435,6 +435,15 @@ static void soc_free_pcm_runtime(struct snd_soc_pcm_runtime *rtd)
 	device_unregister(rtd->dev);
 }
 
+static void close_delayed_work(struct work_struct *work) {
+	struct snd_soc_pcm_runtime *rtd =
+			container_of(work, struct snd_soc_pcm_runtime,
+				     delayed_work.work);
+
+	if (rtd->close_delayed_work_func)
+		rtd->close_delayed_work_func(rtd);
+}
+
 static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
@@ -470,6 +479,7 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 
 	rtd->dev = dev;
 	dev_set_drvdata(dev, rtd);
+	INIT_DELAYED_WORK(&rtd->delayed_work, close_delayed_work);
 
 	/*
 	 * for rtd->codec_dais
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 01eb8700c3de5..b78f6ff2b1d3f 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -637,10 +637,8 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
  * This is to ensure there are no pops or clicks in between any music tracks
  * due to DAPM power cycling.
  */
-static void close_delayed_work(struct work_struct *work)
+static void close_delayed_work(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_pcm_runtime *rtd =
-			container_of(work, struct snd_soc_pcm_runtime, delayed_work.work);
 	struct snd_soc_dai *codec_dai = rtd->codec_dais[0];
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
@@ -660,7 +658,7 @@ static void close_delayed_work(struct work_struct *work)
 	mutex_unlock(&rtd->card->pcm_mutex);
 }
 
-static void codec2codec_close_delayed_work(struct work_struct *work)
+static void codec2codec_close_delayed_work(struct snd_soc_pcm_runtime *rtd)
 {
 	/*
 	 * Currently nothing to do for c2c links
@@ -2974,10 +2972,9 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 
 	/* DAPM dai link stream work */
 	if (rtd->dai_link->params)
-		INIT_DELAYED_WORK(&rtd->delayed_work,
-				  codec2codec_close_delayed_work);
+		rtd->close_delayed_work_func = codec2codec_close_delayed_work;
 	else
-		INIT_DELAYED_WORK(&rtd->delayed_work, close_delayed_work);
+		rtd->close_delayed_work_func = close_delayed_work;
 
 	pcm->nonatomic = rtd->dai_link->nonatomic;
 	rtd->pcm = pcm;
-- 
2.24.0.393.g34dc348eaf-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
