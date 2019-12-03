Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E873110383
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 18:32:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD77B84A;
	Tue,  3 Dec 2019 18:31:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD77B84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575394338;
	bh=M0vP4jKh+lCzLZpPRfV0D4LKuO9GBfnITR0ZlqWuBFY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l8xqxLjf2Xt0HsmQDz0F6cAA3Q4APkNh7fiCmwarLH+S/zr9MTDg9mrxpooDcuIIF
	 LOEr+TXI5hudSoID+J0MskwZHbOhhutEScJDDQPgLtiH1rYKkwSDnNK/tU4PVw7bEB
	 o63g/iF6zPLPYRrIRecpVcDuj7B7euR4hda6iWjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3832F80227;
	Tue,  3 Dec 2019 18:30:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 004EFF80228; Tue,  3 Dec 2019 18:30:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADCDDF800F0
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 18:30:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADCDDF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="P1TVpEB2"
Received: by mail-pf1-x444.google.com with SMTP id b19so2194980pfo.2
 for <alsa-devel@alsa-project.org>; Tue, 03 Dec 2019 09:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9uqnxUlfNoehnYhNH+eCXAdIUF2W9l3c/R2CUZ2MCpo=;
 b=P1TVpEB2JCEfzzh6sqVUJNRsazC26h9UMwgo/9MMeeP2315A99PmSYSV5BGMHjHxp/
 42wddpkCITV/Z/WRRkQVB26K0KHNO8esEwWB+UKCQzFAJUx9Gm08q3+/xeHREqIyjlww
 KCK+Rz4PcmCCCQmGpe7DzU6hs4Wzdkw9yHJO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9uqnxUlfNoehnYhNH+eCXAdIUF2W9l3c/R2CUZ2MCpo=;
 b=krnYG2wDfZ9Yb0/838VKKR2l9X2V4zDyxkiMFA/7OxlgB+ITm95Ailz2s5PpYexCRU
 TnTAX0hwN/YLmxT5Ex+5ThlK9eDAjEk99owrB/6tBghYiiuvZLBQ7rsLeSPr/70A/nJh
 bvzTH7lvZwHgYJbz7I6u5FZuv+pGmaBgUTnYx+pQoYK3LqimGa0anDCj96+fb5GezqQr
 kO5e91gzzBYP4LvoMYkGcpuoxUlDCokeLHRn1SisbzgVsdzNGzQ1IVhtFPfRoE5siaM1
 HPK1WtZReWygIlvAP265S9oo3G9xZ89490Awpt5PTfliHkDAwcvjdNdML+24Q59KT0IH
 IL6Q==
X-Gm-Message-State: APjAAAVLs6uCD1TnJCPXNzyp87+PBc588EWhllF6KCYpk5kCmD5AfsLo
 Jefy9c+gr1+ksiYZrLrjsWzTMlqZ1Q==
X-Google-Smtp-Source: APXvYqxxWLz9SdQ7Ty6tR0P3POpvMNZJH2/8Ahd+GPq0aSckEOckFrFGBtI7RrQ9IHqvw7NXG1Fpzg==
X-Received: by 2002:a65:438b:: with SMTP id m11mr6365372pgp.388.1575394223662; 
 Tue, 03 Dec 2019 09:30:23 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id v4sm3569187pjb.24.2019.12.03.09.30.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2019 09:30:21 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Tue,  3 Dec 2019 09:30:07 -0800
Message-Id: <20191203173007.46504-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v2] ASoC: core: Init pcm runtime work early to
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
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 include/sound/soc.h      |  1 +
 sound/soc/soc-compress.c |  6 ++----
 sound/soc/soc-core.c     | 10 ++++++++++
 sound/soc/soc-pcm.c      | 11 ++++-------
 4 files changed, 17 insertions(+), 11 deletions(-)

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
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 61f230324164d..6615ef64c7f55 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -214,10 +214,8 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
  * This is to ensure there are no pops or clicks in between any music tracks
  * due to DAPM power cycling.
  */
-static void close_delayed_work(struct work_struct *work)
+static void close_delayed_work(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_pcm_runtime *rtd =
-			container_of(work, struct snd_soc_pcm_runtime, delayed_work.work);
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
@@ -929,7 +927,7 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 	}
 
 	/* DAPM dai link stream work */
-	INIT_DELAYED_WORK(&rtd->delayed_work, close_delayed_work);
+	rtd->close_delayed_work_func = close_delayed_work;
 
 	rtd->compr = compr;
 	compr->private_data = rtd;
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
