Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B478F200
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:21:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94EBD165D;
	Thu, 15 Aug 2019 19:20:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94EBD165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565889701;
	bh=T86h57vmDhcDq7qS6n7V/paaR518p5WUGoOjRcTbMWA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=X5J2P/I89y8/SFxd6WtLTNVhdacTRRiFWtJZYDmQZOxNRbMMpC1CW7lneZx2lx2NP
	 yNwaSFzyhKsZvZYbLouckw0GEVIHyzrhXlKlVXO3BsS0s1Co+uyishvM96v6jNtL5+
	 7vurytWQX29Jo1kx+Gfrg/Vx6BlX7hEMc0XBNiYQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43004F805F5;
	Thu, 15 Aug 2019 19:15:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86946F80676; Thu, 15 Aug 2019 19:14:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f98.google.com (mail-wm1-f98.google.com
 [209.85.128.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D404F80290
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D404F80290
Received: by mail-wm1-f98.google.com with SMTP id e8so1421129wme.1
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=0TX8qGwrDOtYI2E7kbPp/fvCS9U5b1EEWOJqkqDiViw=;
 b=LgBciRC3YLnzQHosJFjs6MFb9DdDqkxBLkdxRBPuFarYmzCzsEPFVSWqzcME4rgtHu
 mMoAm3H/WfA4rC9mZ6ihAEg0PYG7O8SedBsMAWWXsQfP6tfqTNwonT7FAMQG+F0ZlrnH
 Hpw4CA9/jH0U6kTcMbT8Qcu+KcGA2/NGR8fT63IH3wDmXson03OMVOBJDiSn1xdR4zqG
 /c/eqerKK0QI7nlxW4GXNwiY36J9QOw5VdwaaUZLAGkLIDCaQFn9jbuhU7TZD4FpiMTp
 sl9qWCHFBcuITIpoAguFt9bxGIvsFjlQQaOmtZPAeuZoIHOe7WQpdjDt4SLAuV0cSPrT
 w9TA==
X-Gm-Message-State: APjAAAW9LzEoFA8PycWHN4w4/AxvVu5woai3fSUIp5e1ArWv1NubqDOK
 O+a+Fe6Qpx91IsZ7GrdcDJMAYhLjzhQ/cUDSMYDoqOeESs4xIo9hR5bDnZXSLM9iNA==
X-Google-Smtp-Source: APXvYqxkxhGT51ib2E03xeTLmbCNJDDVw8Q0mm6m7ETPPey0FLGHvnjYmLTUYC5Df+dm+RkZqcBUAvdyAW+9
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr3699353wmh.63.1565889263158;
 Thu, 15 Aug 2019 10:14:23 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id m1sm7698wmi.6.2019.08.15.10.14.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:23 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKQ-00051B-QQ; Thu, 15 Aug 2019 17:14:22 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 30D1F2742BC7; Thu, 15 Aug 2019 18:14:22 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20190813104532.16669-1-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171422.30D1F2742BC7@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:22 +0100 (BST)
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, ckeepax@opensource.cirrus.com,
 kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: core: Move pcm_mutex up to card level
	from snd_soc_pcm_runtime" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: core: Move pcm_mutex up to card level from snd_soc_pcm_runtime

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 72b745e3ad65deac94ea4eb83262c52ba3ffdb5b Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Tue, 13 Aug 2019 13:45:32 +0300
Subject: [PATCH] ASoC: core: Move pcm_mutex up to card level from
 snd_soc_pcm_runtime

The pcm_mutex is used to prevent concurrent execution of snd_pcm_ops
callbacks. This works fine most of the cases but it can not handle setups
when the same DAI is used by different rtd, for example:
pcm3168a have two DAIs: one for Playback and one for Capture.
If the codec is connected to a single CPU DAI we need to have two dai_link
to support both playback and capture.

In this case the snd_pcm_ops callbacks can be executed in parallel causing
unexpected races in DAI drivers.

By moving the pcm_mutex up to card level this can be solved
while - hopefully - not breaking other setups.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190813104532.16669-1-peter.ujfalusi@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h      |  6 +++--
 sound/soc/soc-compress.c | 48 ++++++++++++++++++++--------------------
 sound/soc/soc-core.c     |  2 +-
 sound/soc/soc-pcm.c      | 36 +++++++++++++++---------------
 4 files changed, 47 insertions(+), 45 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index b1fe5ebea257..5c841c2ee814 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -988,6 +988,10 @@ struct snd_soc_card {
 	struct mutex mutex;
 	struct mutex dapm_mutex;
 
+	/* Mutex for PCM operations */
+	struct mutex pcm_mutex;
+	enum snd_soc_pcm_subclass pcm_subclass;
+
 	spinlock_t dpcm_lock;
 
 	bool instantiated;
@@ -1116,8 +1120,6 @@ struct snd_soc_pcm_runtime {
 	struct device *dev;
 	struct snd_soc_card *card;
 	struct snd_soc_dai_link *dai_link;
-	struct mutex pcm_mutex;
-	enum snd_soc_pcm_subclass pcm_subclass;
 	struct snd_pcm_ops ops;
 
 	unsigned int params_select; /* currently selected param for dai link */
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 289211069a1e..9e54d8ae6d2c 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -80,7 +80,7 @@ static int soc_compr_open(struct snd_compr_stream *cstream)
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	int ret;
 
-	mutex_lock_nested(&rtd->pcm_mutex, rtd->pcm_subclass);
+	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
 	if (cpu_dai->driver->cops && cpu_dai->driver->cops->startup) {
 		ret = cpu_dai->driver->cops->startup(cstream, cpu_dai);
@@ -108,7 +108,7 @@ static int soc_compr_open(struct snd_compr_stream *cstream)
 
 	snd_soc_runtime_activate(rtd, cstream->direction);
 
-	mutex_unlock(&rtd->pcm_mutex);
+	mutex_unlock(&rtd->card->pcm_mutex);
 
 	return 0;
 
@@ -118,7 +118,7 @@ static int soc_compr_open(struct snd_compr_stream *cstream)
 	if (cpu_dai->driver->cops && cpu_dai->driver->cops->shutdown)
 		cpu_dai->driver->cops->shutdown(cstream, cpu_dai);
 out:
-	mutex_unlock(&rtd->pcm_mutex);
+	mutex_unlock(&rtd->card->pcm_mutex);
 	return ret;
 }
 
@@ -224,7 +224,7 @@ static void close_delayed_work(struct work_struct *work)
 			container_of(work, struct snd_soc_pcm_runtime, delayed_work.work);
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
 
-	mutex_lock_nested(&rtd->pcm_mutex, rtd->pcm_subclass);
+	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
 	dev_dbg(rtd->dev,
 		"Compress ASoC: pop wq checking: %s status: %s waiting: %s\n",
@@ -239,7 +239,7 @@ static void close_delayed_work(struct work_struct *work)
 					  SND_SOC_DAPM_STREAM_STOP);
 	}
 
-	mutex_unlock(&rtd->pcm_mutex);
+	mutex_unlock(&rtd->card->pcm_mutex);
 }
 
 static int soc_compr_free(struct snd_compr_stream *cstream)
@@ -249,7 +249,7 @@ static int soc_compr_free(struct snd_compr_stream *cstream)
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
 	int stream;
 
-	mutex_lock_nested(&rtd->pcm_mutex, rtd->pcm_subclass);
+	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
 	if (cstream->direction == SND_COMPRESS_PLAYBACK)
 		stream = SNDRV_PCM_STREAM_PLAYBACK;
@@ -292,7 +292,7 @@ static int soc_compr_free(struct snd_compr_stream *cstream)
 					  SND_SOC_DAPM_STREAM_STOP);
 	}
 
-	mutex_unlock(&rtd->pcm_mutex);
+	mutex_unlock(&rtd->card->pcm_mutex);
 	return 0;
 }
 
@@ -375,7 +375,7 @@ static int soc_compr_trigger(struct snd_compr_stream *cstream, int cmd)
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	int ret;
 
-	mutex_lock_nested(&rtd->pcm_mutex, rtd->pcm_subclass);
+	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
 	ret = soc_compr_components_trigger(cstream, cmd);
 	if (ret < 0)
@@ -394,7 +394,7 @@ static int soc_compr_trigger(struct snd_compr_stream *cstream, int cmd)
 	}
 
 out:
-	mutex_unlock(&rtd->pcm_mutex);
+	mutex_unlock(&rtd->card->pcm_mutex);
 	return ret;
 }
 
@@ -480,7 +480,7 @@ static int soc_compr_set_params(struct snd_compr_stream *cstream,
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	int ret;
 
-	mutex_lock_nested(&rtd->pcm_mutex, rtd->pcm_subclass);
+	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
 	/*
 	 * First we call set_params for the CPU DAI, then the component
@@ -514,14 +514,14 @@ static int soc_compr_set_params(struct snd_compr_stream *cstream,
 
 	/* cancel any delayed stream shutdown that is pending */
 	rtd->pop_wait = 0;
-	mutex_unlock(&rtd->pcm_mutex);
+	mutex_unlock(&rtd->card->pcm_mutex);
 
 	cancel_delayed_work_sync(&rtd->delayed_work);
 
 	return 0;
 
 err:
-	mutex_unlock(&rtd->pcm_mutex);
+	mutex_unlock(&rtd->card->pcm_mutex);
 	return ret;
 }
 
@@ -593,7 +593,7 @@ static int soc_compr_get_params(struct snd_compr_stream *cstream,
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	int ret = 0;
 
-	mutex_lock_nested(&rtd->pcm_mutex, rtd->pcm_subclass);
+	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
 	if (cpu_dai->driver->cops && cpu_dai->driver->cops->get_params) {
 		ret = cpu_dai->driver->cops->get_params(cstream, params, cpu_dai);
@@ -613,7 +613,7 @@ static int soc_compr_get_params(struct snd_compr_stream *cstream,
 	}
 
 err:
-	mutex_unlock(&rtd->pcm_mutex);
+	mutex_unlock(&rtd->card->pcm_mutex);
 	return ret;
 }
 
@@ -625,7 +625,7 @@ static int soc_compr_get_caps(struct snd_compr_stream *cstream,
 	struct snd_soc_rtdcom_list *rtdcom;
 	int ret = 0;
 
-	mutex_lock_nested(&rtd->pcm_mutex, rtd->pcm_subclass);
+	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
 	for_each_rtdcom(rtd, rtdcom) {
 		component = rtdcom->component;
@@ -638,7 +638,7 @@ static int soc_compr_get_caps(struct snd_compr_stream *cstream,
 		break;
 	}
 
-	mutex_unlock(&rtd->pcm_mutex);
+	mutex_unlock(&rtd->card->pcm_mutex);
 	return ret;
 }
 
@@ -650,7 +650,7 @@ static int soc_compr_get_codec_caps(struct snd_compr_stream *cstream,
 	struct snd_soc_rtdcom_list *rtdcom;
 	int ret = 0;
 
-	mutex_lock_nested(&rtd->pcm_mutex, rtd->pcm_subclass);
+	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
 	for_each_rtdcom(rtd, rtdcom) {
 		component = rtdcom->component;
@@ -664,7 +664,7 @@ static int soc_compr_get_codec_caps(struct snd_compr_stream *cstream,
 		break;
 	}
 
-	mutex_unlock(&rtd->pcm_mutex);
+	mutex_unlock(&rtd->card->pcm_mutex);
 	return ret;
 }
 
@@ -676,7 +676,7 @@ static int soc_compr_ack(struct snd_compr_stream *cstream, size_t bytes)
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	int ret = 0;
 
-	mutex_lock_nested(&rtd->pcm_mutex, rtd->pcm_subclass);
+	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
 	if (cpu_dai->driver->cops && cpu_dai->driver->cops->ack) {
 		ret = cpu_dai->driver->cops->ack(cstream, bytes, cpu_dai);
@@ -697,7 +697,7 @@ static int soc_compr_ack(struct snd_compr_stream *cstream, size_t bytes)
 	}
 
 err:
-	mutex_unlock(&rtd->pcm_mutex);
+	mutex_unlock(&rtd->card->pcm_mutex);
 	return ret;
 }
 
@@ -710,7 +710,7 @@ static int soc_compr_pointer(struct snd_compr_stream *cstream,
 	int ret = 0;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 
-	mutex_lock_nested(&rtd->pcm_mutex, rtd->pcm_subclass);
+	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
 	if (cpu_dai->driver->cops && cpu_dai->driver->cops->pointer)
 		cpu_dai->driver->cops->pointer(cstream, tstamp, cpu_dai);
@@ -726,7 +726,7 @@ static int soc_compr_pointer(struct snd_compr_stream *cstream,
 		break;
 	}
 
-	mutex_unlock(&rtd->pcm_mutex);
+	mutex_unlock(&rtd->card->pcm_mutex);
 	return ret;
 }
 
@@ -738,7 +738,7 @@ static int soc_compr_copy(struct snd_compr_stream *cstream,
 	struct snd_soc_rtdcom_list *rtdcom;
 	int ret = 0;
 
-	mutex_lock_nested(&rtd->pcm_mutex, rtd->pcm_subclass);
+	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
 	for_each_rtdcom(rtd, rtdcom) {
 		component = rtdcom->component;
@@ -751,7 +751,7 @@ static int soc_compr_copy(struct snd_compr_stream *cstream,
 		break;
 	}
 
-	mutex_unlock(&rtd->pcm_mutex);
+	mutex_unlock(&rtd->card->pcm_mutex);
 	return ret;
 }
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index abe2f47cee6e..b3f820fb53e6 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1360,7 +1360,6 @@ static int soc_post_component_init(struct snd_soc_pcm_runtime *rtd,
 	rtd->dev->groups = soc_dev_attr_groups;
 	dev_set_name(rtd->dev, "%s", name);
 	dev_set_drvdata(rtd->dev, rtd);
-	mutex_init(&rtd->pcm_mutex);
 	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].be_clients);
 	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].be_clients);
 	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].fe_clients);
@@ -2383,6 +2382,7 @@ int snd_soc_register_card(struct snd_soc_card *card)
 	card->instantiated = 0;
 	mutex_init(&card->mutex);
 	mutex_init(&card->dapm_mutex);
+	mutex_init(&card->pcm_mutex);
 	spin_lock_init(&card->dpcm_lock);
 
 	return snd_soc_bind_card(card);
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index da657c8179cc..e163dde5eab1 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -36,7 +36,7 @@
  * Increments the active count for all the DAIs and components attached to a PCM
  * runtime. Should typically be called when a stream is opened.
  *
- * Must be called with the rtd->pcm_mutex being held
+ * Must be called with the rtd->card->pcm_mutex being held
  */
 void snd_soc_runtime_activate(struct snd_soc_pcm_runtime *rtd, int stream)
 {
@@ -44,7 +44,7 @@ void snd_soc_runtime_activate(struct snd_soc_pcm_runtime *rtd, int stream)
 	struct snd_soc_dai *codec_dai;
 	int i;
 
-	lockdep_assert_held(&rtd->pcm_mutex);
+	lockdep_assert_held(&rtd->card->pcm_mutex);
 
 	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		cpu_dai->playback_active++;
@@ -72,7 +72,7 @@ void snd_soc_runtime_activate(struct snd_soc_pcm_runtime *rtd, int stream)
  * Decrements the active count for all the DAIs and components attached to a PCM
  * runtime. Should typically be called when a stream is closed.
  *
- * Must be called with the rtd->pcm_mutex being held
+ * Must be called with the rtd->card->pcm_mutex being held
  */
 void snd_soc_runtime_deactivate(struct snd_soc_pcm_runtime *rtd, int stream)
 {
@@ -80,7 +80,7 @@ void snd_soc_runtime_deactivate(struct snd_soc_pcm_runtime *rtd, int stream)
 	struct snd_soc_dai *codec_dai;
 	int i;
 
-	lockdep_assert_held(&rtd->pcm_mutex);
+	lockdep_assert_held(&rtd->card->pcm_mutex);
 
 	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		cpu_dai->playback_active--;
@@ -506,7 +506,7 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 		pm_runtime_get_sync(component->dev);
 	}
 
-	mutex_lock_nested(&rtd->pcm_mutex, rtd->pcm_subclass);
+	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
 	/* startup the audio subsystem */
 	ret = snd_soc_dai_startup(cpu_dai, substream);
@@ -604,7 +604,7 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 
 	snd_soc_runtime_activate(rtd, substream->stream);
 
-	mutex_unlock(&rtd->pcm_mutex);
+	mutex_unlock(&rtd->card->pcm_mutex);
 	return 0;
 
 config_err:
@@ -623,7 +623,7 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 
 	snd_soc_dai_shutdown(cpu_dai, substream);
 out:
-	mutex_unlock(&rtd->pcm_mutex);
+	mutex_unlock(&rtd->card->pcm_mutex);
 
 	for_each_rtdcom(rtd, rtdcom) {
 		component = rtdcom->component;
@@ -653,7 +653,7 @@ static void close_delayed_work(struct work_struct *work)
 			container_of(work, struct snd_soc_pcm_runtime, delayed_work.work);
 	struct snd_soc_dai *codec_dai = rtd->codec_dais[0];
 
-	mutex_lock_nested(&rtd->pcm_mutex, rtd->pcm_subclass);
+	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
 	dev_dbg(rtd->dev, "ASoC: pop wq checking: %s status: %s waiting: %s\n",
 		 codec_dai->driver->playback.stream_name,
@@ -667,7 +667,7 @@ static void close_delayed_work(struct work_struct *work)
 					  SND_SOC_DAPM_STREAM_STOP);
 	}
 
-	mutex_unlock(&rtd->pcm_mutex);
+	mutex_unlock(&rtd->card->pcm_mutex);
 }
 
 static void codec2codec_close_delayed_work(struct work_struct *work)
@@ -694,7 +694,7 @@ static int soc_pcm_close(struct snd_pcm_substream *substream)
 	struct snd_soc_dai *codec_dai;
 	int i;
 
-	mutex_lock_nested(&rtd->pcm_mutex, rtd->pcm_subclass);
+	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
 	snd_soc_runtime_deactivate(rtd, substream->stream);
 
@@ -738,7 +738,7 @@ static int soc_pcm_close(struct snd_pcm_substream *substream)
 					  SND_SOC_DAPM_STREAM_STOP);
 	}
 
-	mutex_unlock(&rtd->pcm_mutex);
+	mutex_unlock(&rtd->card->pcm_mutex);
 
 	for_each_rtdcom(rtd, rtdcom) {
 		component = rtdcom->component;
@@ -771,7 +771,7 @@ static int soc_pcm_prepare(struct snd_pcm_substream *substream)
 	struct snd_soc_dai *codec_dai;
 	int i, ret = 0;
 
-	mutex_lock_nested(&rtd->pcm_mutex, rtd->pcm_subclass);
+	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
 	if (rtd->dai_link->ops->prepare) {
 		ret = rtd->dai_link->ops->prepare(substream);
@@ -826,7 +826,7 @@ static int soc_pcm_prepare(struct snd_pcm_substream *substream)
 	snd_soc_dai_digital_mute(cpu_dai, 0, substream->stream);
 
 out:
-	mutex_unlock(&rtd->pcm_mutex);
+	mutex_unlock(&rtd->card->pcm_mutex);
 	return ret;
 }
 
@@ -876,7 +876,7 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_dai *codec_dai;
 	int i, ret = 0;
 
-	mutex_lock_nested(&rtd->pcm_mutex, rtd->pcm_subclass);
+	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 	if (rtd->dai_link->ops->hw_params) {
 		ret = rtd->dai_link->ops->hw_params(substream, params);
 		if (ret < 0) {
@@ -962,7 +962,7 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
         if (ret)
 		goto component_err;
 out:
-	mutex_unlock(&rtd->pcm_mutex);
+	mutex_unlock(&rtd->card->pcm_mutex);
 	return ret;
 
 component_err:
@@ -986,7 +986,7 @@ static int soc_pcm_hw_params(struct snd_pcm_substream *substream,
 	if (rtd->dai_link->ops->hw_free)
 		rtd->dai_link->ops->hw_free(substream);
 
-	mutex_unlock(&rtd->pcm_mutex);
+	mutex_unlock(&rtd->card->pcm_mutex);
 	return ret;
 }
 
@@ -1001,7 +1001,7 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 	bool playback = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	int i;
 
-	mutex_lock_nested(&rtd->pcm_mutex, rtd->pcm_subclass);
+	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
 	/* clear the corresponding DAIs parameters when going to be inactive */
 	if (cpu_dai->active == 1) {
@@ -1043,7 +1043,7 @@ static int soc_pcm_hw_free(struct snd_pcm_substream *substream)
 
 	snd_soc_dai_hw_free(cpu_dai, substream);
 
-	mutex_unlock(&rtd->pcm_mutex);
+	mutex_unlock(&rtd->card->pcm_mutex);
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
