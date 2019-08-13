Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC4E8B5DE
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 12:47:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2644D1657;
	Tue, 13 Aug 2019 12:46:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2644D1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565693238;
	bh=1T3sb4OGN2xudIhgiciIQoCd7mBvtKFRRZ4naBnl9cQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fh9NHbQbu6c7pTO1WvaHzWp4IfZxy+/PA/Fy9s+S8/YFqQhHIkHgzmTSNAC43EgGu
	 8FLXQ64PiCfQxxcim89V7vmdBoQO8h4RqjR4zQ03ROe1zOh7a4kVP9C6oosR05guBh
	 cEeojjuuN4ZjSgNfTT2rhfVoNscMKvBUZQX7Q5NU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 751EBF8026A;
	Tue, 13 Aug 2019 12:45:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AFD6F8026A; Tue, 13 Aug 2019 12:45:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2689F80120
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 12:45:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2689F80120
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MbDO2D28"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7DAjMKd034476;
 Tue, 13 Aug 2019 05:45:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1565693122;
 bh=AYp6byft0WNl4E26ZBvRbwizVGRtMJgK076iFxXCrXY=;
 h=From:To:CC:Subject:Date;
 b=MbDO2D28KYJhc1aRzvIp0Glm6Fq3/fWJi+ylb3RVT6qa9pvGxB0YkvOdSoKiIrQm0
 ABTDrr0DehqjxLfmsT1N5dQK/Q42g/jJOqJ0QSOROcnh5HetN5LWL44TbG1mob3ct2
 RiNJA2/SoKpEeESXJWwdbPvLwawK5ohhvnAGjiGQ=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7DAjMXi109332
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 13 Aug 2019 05:45:22 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 13
 Aug 2019 05:45:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 13 Aug 2019 05:45:21 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7DAjJGF099305;
 Tue, 13 Aug 2019 05:45:19 -0500
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Tue, 13 Aug 2019 13:45:32 +0300
Message-ID: <20190813104532.16669-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, ckeepax@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] [PATCH] ASoC: core: Move pcm_mutex up to card level
	from snd_soc_pcm_runtime
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
---
Hi,

I have tested the patch on several boards. it fixes the issue with single card
with multiple dai_links where the CPU side (mcasp) is the same.

However I can not test with anything which use DPCM. It would be great if the
patch would gather few tested-by from folks having access to more complicated
setups.

The backround of this patch:
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-August/153864.html

Regards,
Peter

 include/sound/soc.h      |  6 +++--
 sound/soc/soc-compress.c | 48 ++++++++++++++++++++--------------------
 sound/soc/soc-core.c     |  2 +-
 sound/soc/soc-pcm.c      | 36 +++++++++++++++---------------
 4 files changed, 47 insertions(+), 45 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 6ac6481b4882..ec2dbe0ac2aa 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -990,6 +990,10 @@ struct snd_soc_card {
 	struct mutex mutex;
 	struct mutex dapm_mutex;
 
+	/* Mutex for PCM operations */
+	struct mutex pcm_mutex;
+	enum snd_soc_pcm_subclass pcm_subclass;
+
 	spinlock_t dpcm_lock;
 
 	bool instantiated;
@@ -1107,8 +1111,6 @@ struct snd_soc_pcm_runtime {
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
index bb1e9e2c4ff4..7f2064889a23 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1344,7 +1344,6 @@ static int soc_post_component_init(struct snd_soc_pcm_runtime *rtd,
 	rtd->dev->groups = soc_dev_attr_groups;
 	dev_set_name(rtd->dev, "%s", name);
 	dev_set_drvdata(rtd->dev, rtd);
-	mutex_init(&rtd->pcm_mutex);
 	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].be_clients);
 	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].be_clients);
 	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].fe_clients);
@@ -2395,6 +2394,7 @@ int snd_soc_register_card(struct snd_soc_card *card)
 	card->instantiated = 0;
 	mutex_init(&card->mutex);
 	mutex_init(&card->dapm_mutex);
+	mutex_init(&card->pcm_mutex);
 	spin_lock_init(&card->dpcm_lock);
 
 	return snd_soc_bind_card(card);
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 77c986fe08d0..93bb4a347779 100644
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
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
