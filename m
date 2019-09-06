Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4B8AC10F
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 21:57:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 016AE846;
	Fri,  6 Sep 2019 21:56:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 016AE846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567799862;
	bh=34o/pYdwCOTkO2NtMRLpg/gn57bUxCXkOzn3ICOW8Ig=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=doug086NDMj6rE4U/N1zJon3RheZBM6Eep5uwLseYwDpiYhDp4YCT75WAl+Tsy+7v
	 iuAXfAAbxHFefwxlDOx9lEGyk62RRYvSQCEeuNUJwcVT/CzwvxP388d4muk66aJqta
	 JIBrK81ntqmZs5UI54Yb1+UpbBPcLEhO7Fj0TwMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED7BBF80720;
	Fri,  6 Sep 2019 21:48:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 869F8F8070C; Fri,  6 Sep 2019 21:48:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5BACF806E9
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 21:48:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5BACF806E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="aMDbX4rg"
Received: by mail-pf1-x443.google.com with SMTP id b13so5199400pfo.8
 for <alsa-devel@alsa-project.org>; Fri, 06 Sep 2019 12:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ivA4BmllxkGqd9dbObaLfF3lVYJE+SjIVnNG77bpZeg=;
 b=aMDbX4rgzCOyBjxScfXsvhyHQReDoA+lq4/mAi4pvImTNF7E7BjUnE3OhjBE9b3ZUa
 3DafviMV1xGK7UHinH9Z23+h3zqnPdbUIin0waj1HE6pI77tdI11LKo8aYx/xAMM7UjK
 /Sr2m8iJBDTWjBXmswcRJVvrOCNcQv7LK11BQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ivA4BmllxkGqd9dbObaLfF3lVYJE+SjIVnNG77bpZeg=;
 b=oAAaxoFVh/YnKMHrnWdplG3Mot/+p6yz/Yw75x8+/ZGnXKqqbcO41La3q/aahpsU0R
 BfbHAFySI0cdX4wpyGajBt+QWj8/cKBoeNRyNoMxXP5IMb9Cb/V6YoWiTs00JIQZ2cKa
 k+IU/kzHrvvZ/kAmyfcu77wU5YG8hiDM5TqPbAwhLOtSzrEFt1j4sCjG7PBPvcJx3jhx
 unOKRvMnZBeSQNKdbJd5Etzu5Qh7USU5holXvVzsHNEffWtll+1Snf8lDUESKVEHL6RL
 2m7xej7yTfnE6W6AtIy9/ng7HO2YACWJzYSTGttsEGmsZMPzcoemU1yCK4lkpcVqJgDA
 CApg==
X-Gm-Message-State: APjAAAVlAKprFgZPJwN6U0F8/OT2NSDlEqAobkoNWIHfiTj8oV1txp6/
 /3HcuSPR51GOvLxuKCn0VG8pFd0mOA==
X-Google-Smtp-Source: APXvYqw6eKDHG0YCSas+eYCTLTMjGt53QILBW6UKA8KDtCpOWsCyy6Z/oatwXkW2vZlLhYuvI5g2Kg==
X-Received: by 2002:aa7:8c01:: with SMTP id c1mr12890764pfd.224.1567799302074; 
 Fri, 06 Sep 2019 12:48:22 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id x125sm3663741pfb.93.2019.09.06.12.48.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2019 12:48:21 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri,  6 Sep 2019 12:46:34 -0700
Message-Id: <20190906194636.217881-13-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190906194636.217881-1-cujomalainey@chromium.org>
References: <20190906194636.217881-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [RFC 12/15] ASoC: rt5677: Transfer one period at a
	time over SPI
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

From: Ben Zhang <benzh@chromium.org>

Rewrite the ring buffer transfer functions to copy one period
at a time then call snd_pcm_period_elapsed(). This reduces the
latency of transferring the initial ~2sec of audio after hotword
detect since audio samples are available for userspace earlier.

Signed-off-by: Ben Zhang <benzh@chromium.org>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677-spi.c | 91 +++++++++++++++++++++++------------
 1 file changed, 60 insertions(+), 31 deletions(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 25d75a803cb5..b9b0f646127d 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -51,7 +51,8 @@
 #define RT5677_BUF_BYTES_TOTAL		0x20000
 #define RT5677_MIC_BUF_ADDR		0x60030000
 #define RT5677_MODEL_ADDR		0x5FFC9800
-#define RT5677_MIC_BUF_BYTES		(RT5677_BUF_BYTES_TOTAL - sizeof(u32))
+#define RT5677_MIC_BUF_BYTES		((u32)(RT5677_BUF_BYTES_TOTAL - \
+					sizeof(u32)))
 #define RT5677_MIC_BUF_FIRST_READ_SIZE	0x10000
 
 static struct spi_device *g_spi;
@@ -205,15 +206,15 @@ static int rt5677_spi_mic_write_offset(u32 *mic_write_offset)
 }
 
 /*
- * Copy a block of audio samples from the DSP mic buffer to the dma_area of
- * the pcm runtime. The receiving buffer may wrap around.
+ * Copy one contiguous block of audio samples from the DSP mic buffer to the
+ * dma_area of the pcm runtime. The receiving buffer may wrap around.
  * @begin: start offset of the block to copy, in bytes.
  * @end:   offset of the first byte after the block to copy, must be greater
  *         than or equal to begin.
  *
  * Return: Zero if successful, or a negative error code on failure.
  */
-static int rt5677_spi_append_data(struct rt5677_dsp *rt5677_dsp,
+static int rt5677_spi_copy_block(struct rt5677_dsp *rt5677_dsp,
 		u32 begin, u32 end)
 {
 	struct snd_pcm_runtime *runtime = rt5677_dsp->substream->runtime;
@@ -269,6 +270,38 @@ static int rt5677_spi_append_data(struct rt5677_dsp *rt5677_dsp,
 	return ret;
 }
 
+/*
+ * Copy a given amount of audio samples from the DSP mic buffer starting at
+ * mic_read_offset, to the dma_area of the pcm runtime. The source buffer may
+ * wrap around. mic_read_offset is updated after successful copy.
+ * @amount: amount of samples to copy, in bytes.
+ *
+ * Return: Zero if successful, or a negative error code on failure.
+ */
+static int rt5677_spi_copy(struct rt5677_dsp *rt5677_dsp, u32 amount)
+{
+	int ret = 0;
+	u32 target;
+
+	if (amount == 0)
+		return ret;
+
+	target = rt5677_dsp->mic_read_offset + amount;
+	/* Copy the first chunk in DSP's mic buffer */
+	ret |= rt5677_spi_copy_block(rt5677_dsp, rt5677_dsp->mic_read_offset,
+			min(target, RT5677_MIC_BUF_BYTES));
+
+	if (target >= RT5677_MIC_BUF_BYTES) {
+		/* Wrap around, copy the second chunk */
+		target -= RT5677_MIC_BUF_BYTES;
+		ret |= rt5677_spi_copy_block(rt5677_dsp, 0, target);
+	}
+
+	if (!ret)
+		rt5677_dsp->mic_read_offset = target;
+	return ret;
+}
+
 /*
  * A delayed work that streams audio samples from the DSP mic buffer to the
  * dma_area of the pcm runtime via SPI.
@@ -279,7 +312,7 @@ static void rt5677_spi_copy_work(struct work_struct *work)
 		container_of(work, struct rt5677_dsp, copy_work.work);
 	struct snd_pcm_runtime *runtime;
 	u32 mic_write_offset;
-	size_t bytes_copied, period_bytes;
+	size_t new_bytes, copy_bytes, period_bytes;
 	int ret = 0;
 
 	/* Ensure runtime->dma_area buffer does not go away while copying. */
@@ -312,35 +345,31 @@ static void rt5677_spi_copy_work(struct work_struct *work)
 					RT5677_MIC_BUF_FIRST_READ_SIZE;
 	}
 
-	/* Copy all new samples from DSP's mic buffer to dma_area */
-	bytes_copied = 0;
-	if (rt5677_dsp->mic_read_offset < mic_write_offset) {
-		/* One chunk in DSP's mic buffer */
-		ret |= rt5677_spi_append_data(rt5677_dsp,
-				rt5677_dsp->mic_read_offset, mic_write_offset);
-		bytes_copied = mic_write_offset - rt5677_dsp->mic_read_offset;
-	} else if (rt5677_dsp->mic_read_offset > mic_write_offset) {
-		/* Wrap around, two chunks in DSP's mic buffer */
-		ret |= rt5677_spi_append_data(rt5677_dsp,
-				rt5677_dsp->mic_read_offset,
-				RT5677_MIC_BUF_BYTES);
-		ret |= rt5677_spi_append_data(rt5677_dsp, 0, mic_write_offset);
-		bytes_copied = RT5677_MIC_BUF_BYTES -
-				rt5677_dsp->mic_read_offset + mic_write_offset;
-	}
-	if (ret) {
-		dev_err(rt5677_dsp->dev, "Copy failed %d\n", ret);
-		goto done;
-	}
+	/* Calculate the amount of new samples in bytes */
+	if (rt5677_dsp->mic_read_offset <= mic_write_offset)
+		new_bytes = mic_write_offset - rt5677_dsp->mic_read_offset;
+	else
+		new_bytes = RT5677_MIC_BUF_BYTES + mic_write_offset
+				- rt5677_dsp->mic_read_offset;
 
-	rt5677_dsp->mic_read_offset = mic_write_offset;
-	rt5677_dsp->avail_bytes += bytes_copied;
+	/* Copy all new samples from DSP mic buffer, one period at a time */
 	period_bytes = snd_pcm_lib_period_bytes(rt5677_dsp->substream);
-
-	if (rt5677_dsp->avail_bytes >= period_bytes) {
-		snd_pcm_period_elapsed(rt5677_dsp->substream);
-		rt5677_dsp->avail_bytes = 0;
+	while (new_bytes) {
+		copy_bytes = min(new_bytes, period_bytes
+				- rt5677_dsp->avail_bytes);
+		ret = rt5677_spi_copy(rt5677_dsp, copy_bytes);
+		if (ret) {
+			dev_err(rt5677_dsp->dev, "Copy failed %d\n", ret);
+			goto done;
+		}
+		rt5677_dsp->avail_bytes += copy_bytes;
+		if (rt5677_dsp->avail_bytes >= period_bytes) {
+			snd_pcm_period_elapsed(rt5677_dsp->substream);
+			rt5677_dsp->avail_bytes = 0;
+		}
+		new_bytes -= copy_bytes;
 	}
+
 	/* TODO benzh: use better delay time based on period_bytes */
 	schedule_delayed_work(&rt5677_dsp->copy_work, msecs_to_jiffies(5));
 done:
-- 
2.23.0.187.g17f5b7556c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
