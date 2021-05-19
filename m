Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA942388C1A
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 12:53:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41B01167C;
	Wed, 19 May 2021 12:52:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41B01167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621421583;
	bh=bHk0TRGCIe8ah9IbWKNOCz5WNUTu7v3xCZwfWNzTb/w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ooZIbU/Q7qzM2VF5pgTnThHMIi9JtqIAgiI/R23iA/qxeF1/9qe3lQdHgosERSRZy
	 B+9BS1cKRI2sndbMkmo3/msskP05rNLdoDR5Rz16kdkPo9jAVyMQ2l7kQjflZ/MLsQ
	 OGwy8TRjyPXbGekjvSKRa0CXNmkMnnjtB4lH82g0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48DD1F804AE;
	Wed, 19 May 2021 12:50:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 464C5F8042F; Wed, 19 May 2021 12:49:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE8C4F80153
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 12:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE8C4F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="Tvd1e2g+"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1621421397; x=1652957397;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bHk0TRGCIe8ah9IbWKNOCz5WNUTu7v3xCZwfWNzTb/w=;
 b=Tvd1e2g+p0WMf1fNagu+XiTZl2ycMrzVD6vHbhxXwbIGtkZ2QkRVN4+p
 ofVpOav1USJjEySliHzEaspWfuvhebJFRyP4jHbCI9jS1FEYwWPrfSLBB
 3PMpRBMlep0YGWxQQkjl9yl6b2dfTjFyzWSH8tPrO5qwY3ILAFnxr5OEr
 Y87dJ1PYzAFNyNyQmx26CtrxEAD5sk5G8ni2UApTopa68NPz8/TW2r5uj
 wkfYfuXeQzlkTBtodxvpoz+D32vTuDKG8P5korXiiOSN9mDrYCmiTCQUD
 uBAE9mMxuKYjcT9uZPE4Nz49V1xa//IeroyrqdMaC5G4Egi5pvxcMtmBX A==;
IronPort-SDR: cljuQcxyhS5vwA61XVnvbHMXU8VmFpRkdEknuqUwJ3cH8c/IsPYCiRB8o1Lz9DL2UsnoEzQaMT
 i/+j1+nBmI/UVRuqtBpWROZu5hGXt0nPXIG3GaD82IYk6doSMosskjSrU7Jv3IT520xm2f/0OL
 +JHYAtfslAKvzB1LPuGx3mds5o3vLIMv8C1lJ1K5mNDHZbdbZI4uS3/Bz8XKQlBTyrFpamWvNC
 EGSzky41De+g2YrQikYvCoJvGDEaLg9fj2c5h+ZUYJ2cMUBRYsBeOfMNw70fzMWgJ3dEQ3U3/H
 FVQ=
X-IronPort-AV: E=Sophos;i="5.82,312,1613458800"; d="scan'208";a="128651266"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 May 2021 03:49:55 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 03:49:52 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 19 May 2021 03:49:48 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 4/6] ALSA: pcm: Create function for snd_pcm_runtime
 initialization
Date: Wed, 19 May 2021 13:48:40 +0300
Message-ID: <20210519104842.977895-5-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210519104842.977895-1-codrin.ciubotariu@microchip.com>
References: <20210519104842.977895-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: lars@metafoo.de, kuninori.morimoto.gx@renesas.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org,
 joe@perches.com, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Cristian.Birsan@microchip.com, nicolas.ferre@microchip.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Group the setting of snd_pcm_runtime members in a separate function. This
allows for code reutilization. Also, check for substream->ops before
substream->ops->copy_user .

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 include/sound/pcm.h     |   2 +
 sound/core/pcm_native.c | 108 ++++++++++++++++++++++------------------
 2 files changed, 61 insertions(+), 49 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 2907ed2b937f..8e6bd4525c02 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -576,6 +576,8 @@ static inline int snd_pcm_suspend_all(struct snd_pcm *pcm)
 int snd_pcm_kernel_ioctl(struct snd_pcm_substream *substream, unsigned int cmd, void *arg);
 struct snd_pcm_runtime *snd_pcm_runtime_alloc(void);
 void snd_pcm_runtime_free(struct snd_pcm_runtime *runtime);
+void snd_pcm_runtime_set(struct snd_pcm_substream *substream,
+			 struct snd_pcm_hw_params *params);
 int snd_pcm_open_substream(struct snd_pcm *pcm, int stream, struct file *file,
 			   struct snd_pcm_substream **rsubstream);
 void snd_pcm_release_substream(struct snd_pcm_substream *substream);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index cb0164d55593..5b0e7ae2b1e7 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -658,13 +658,69 @@ static int snd_pcm_hw_params_choose(struct snd_pcm_substream *pcm,
 	return 0;
 }
 
+void snd_pcm_runtime_set(struct snd_pcm_substream *substream,
+			 struct snd_pcm_hw_params *params)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	unsigned int bits;
+	snd_pcm_uframes_t frames;
+
+	runtime->access = params_access(params);
+	runtime->format = params_format(params);
+	runtime->subformat = params_subformat(params);
+	runtime->channels = params_channels(params);
+	runtime->rate = params_rate(params);
+	runtime->period_size = params_period_size(params);
+	runtime->periods = params_periods(params);
+	runtime->buffer_size = params_buffer_size(params);
+	runtime->info = params->info;
+	runtime->rate_num = params->rate_num;
+	runtime->rate_den = params->rate_den;
+	runtime->no_period_wakeup =
+			(params->info & SNDRV_PCM_INFO_NO_PERIOD_WAKEUP) &&
+			(params->flags & SNDRV_PCM_HW_PARAMS_NO_PERIOD_WAKEUP);
+
+	bits = snd_pcm_format_physical_width(runtime->format);
+	runtime->sample_bits = bits;
+	bits *= runtime->channels;
+	runtime->frame_bits = bits;
+	frames = 1;
+	while (bits % 8 != 0) {
+		bits *= 2;
+		frames *= 2;
+	}
+	runtime->byte_align = bits / 8;
+	runtime->min_align = frames;
+
+	/* Default sw params */
+	runtime->tstamp_mode = SNDRV_PCM_TSTAMP_NONE;
+	runtime->period_step = 1;
+	runtime->control->avail_min = runtime->period_size;
+	runtime->start_threshold = 1;
+	runtime->stop_threshold = runtime->buffer_size;
+	runtime->silence_threshold = 0;
+	runtime->silence_size = 0;
+	runtime->boundary = runtime->buffer_size;
+	while (runtime->boundary * 2 <= LONG_MAX - runtime->buffer_size)
+		runtime->boundary *= 2;
+
+	/* clear the buffer for avoiding possible kernel info leaks */
+	if (runtime->dma_area &&
+	    !(substream->ops && substream->ops->copy_user)) {
+		size_t size = runtime->dma_bytes;
+
+		if (runtime->info & SNDRV_PCM_INFO_MMAP)
+			size = PAGE_ALIGN(size);
+		memset(runtime->dma_area, 0, size);
+	}
+}
+EXPORT_SYMBOL(snd_pcm_runtime_set);
+
 static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
 	struct snd_pcm_runtime *runtime;
 	int err, usecs;
-	unsigned int bits;
-	snd_pcm_uframes_t frames;
 
 	if (PCM_RUNTIME_CHECK(substream))
 		return -ENXIO;
@@ -715,53 +771,7 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 			goto _error;
 	}
 
-	runtime->access = params_access(params);
-	runtime->format = params_format(params);
-	runtime->subformat = params_subformat(params);
-	runtime->channels = params_channels(params);
-	runtime->rate = params_rate(params);
-	runtime->period_size = params_period_size(params);
-	runtime->periods = params_periods(params);
-	runtime->buffer_size = params_buffer_size(params);
-	runtime->info = params->info;
-	runtime->rate_num = params->rate_num;
-	runtime->rate_den = params->rate_den;
-	runtime->no_period_wakeup =
-			(params->info & SNDRV_PCM_INFO_NO_PERIOD_WAKEUP) &&
-			(params->flags & SNDRV_PCM_HW_PARAMS_NO_PERIOD_WAKEUP);
-
-	bits = snd_pcm_format_physical_width(runtime->format);
-	runtime->sample_bits = bits;
-	bits *= runtime->channels;
-	runtime->frame_bits = bits;
-	frames = 1;
-	while (bits % 8 != 0) {
-		bits *= 2;
-		frames *= 2;
-	}
-	runtime->byte_align = bits / 8;
-	runtime->min_align = frames;
-
-	/* Default sw params */
-	runtime->tstamp_mode = SNDRV_PCM_TSTAMP_NONE;
-	runtime->period_step = 1;
-	runtime->control->avail_min = runtime->period_size;
-	runtime->start_threshold = 1;
-	runtime->stop_threshold = runtime->buffer_size;
-	runtime->silence_threshold = 0;
-	runtime->silence_size = 0;
-	runtime->boundary = runtime->buffer_size;
-	while (runtime->boundary * 2 <= LONG_MAX - runtime->buffer_size)
-		runtime->boundary *= 2;
-
-	/* clear the buffer for avoiding possible kernel info leaks */
-	if (runtime->dma_area && !substream->ops->copy_user) {
-		size_t size = runtime->dma_bytes;
-
-		if (runtime->info & SNDRV_PCM_INFO_MMAP)
-			size = PAGE_ALIGN(size);
-		memset(runtime->dma_area, 0, size);
-	}
+	snd_pcm_runtime_set(substream, params);
 
 	snd_pcm_timer_resolution_change(substream);
 	snd_pcm_set_state(substream, SNDRV_PCM_STATE_SETUP);
-- 
2.27.0

