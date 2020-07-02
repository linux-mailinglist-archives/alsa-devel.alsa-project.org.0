Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9E52121E3
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 13:13:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FCBC16E4;
	Thu,  2 Jul 2020 13:12:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FCBC16E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593688401;
	bh=LwJ78hsdddN5e0yUr5H0LRA57jLTLyMt4r4gf8B9Ab4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kv/rFPN6pQOx5bgPOZVcP/rnp6+fR2MgGADdOh0zNetrDE1Du5FWNWLpbjLvhcW+Q
	 OC2FVoW5OS59wM8wcozJpMDiFuqdqA7tQ22knkfFPOaQGZSc17WlY0CAp5Irnhvw9H
	 qyNuq4RqnUH5hRCm6AA7BE7e4bnVhJxR9SSjE+GI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69F34F800C1;
	Thu,  2 Jul 2020 13:11:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B4AAF8022D; Thu,  2 Jul 2020 13:11:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5981F80134
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 13:11:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5981F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="yRnF/Wv4"
Received: by mail-wr1-x443.google.com with SMTP id z15so16416477wrl.8
 for <alsa-devel@alsa-project.org>; Thu, 02 Jul 2020 04:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nLcMYFjK2Mqk6sa9STwGNahU8gUOiBKyhyhKpNx5RCk=;
 b=yRnF/Wv4aNROFV4Enx2JD9ld3bfFtQjXtHqsFnXnL1TXProw3IjCOTNur3E01wXR32
 wuLE/5XkxDaiDFtpxgqd+Zw07T4sc7oUtTPAbjBH+Bq7kliSPWpiHkCL5n/U/fv4pR9P
 YZTfla/9XR4cjmqRuVCu65aDkKo2ZyxGcgzSANurMQ5G15fcZmrGmVSkNH0aG9jpPgNy
 M4ojVgTvmmqIoxz8slTPgPVioVncno2LKU/iF2jVAggD6F/3R2tO+UlKPFguFxOTysOC
 4V1+4jvGa7FiWGMNXfS5rK9ymlmdTKJd+BwuJSwMet0QuyvnO2PFiVed/EaJt6l5JXFr
 LbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nLcMYFjK2Mqk6sa9STwGNahU8gUOiBKyhyhKpNx5RCk=;
 b=VWnI4taGB+dCeWjyNbk85zTAg9wYgnosZhl81oqToFJeudleYX45q5Z3jzckp8BBSp
 6GPvKEHqsJndf8xjPnDG6+9O7y7r/niZ/+KnO7hfo09sUywMSIdIJNutnmMLseVra8A9
 RFqbZ8HNJORaNKe0kPjQKHBJfwBDRyXD+Ei5RawsZruI5MpvyH8CQo9QFK/15TZhR0GP
 5QR+BOyY/m1+GbQC5WmQfqSuU/kGakI+j23ypCH8QQ8qNcbdX14KbEBsZXp9Toe1gusv
 4qVsmfB1NEdF7sf41U6Y+TDe1Z599E/HYi5XsVJXK3TrV79AIoX9TS7oObgryuEV4W5Y
 e6Zg==
X-Gm-Message-State: AOAM530H+b+3+E/PQpHzdEdi4jeM/VAbdKA8uyHUrKpMUyNy/LWLYsqO
 WvWZsjFtuIYeNDS0X+L1UrCBuQ==
X-Google-Smtp-Source: ABdhPJx7r1YY7c/spG+XRYvMbNqHYb3MKBGWcT/vr7200rSOLM0hv1yy0T3E0RP7FPM4sMSKJNbAug==
X-Received: by 2002:a5d:4e8e:: with SMTP id e14mr29504972wru.134.1593688288645; 
 Thu, 02 Jul 2020 04:11:28 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id l190sm10122008wml.12.2020.07.02.04.11.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 04:11:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: [RFC PATCH] ALSA: compress: add support to change codec profile in
 gapless playback
Date: Thu,  2 Jul 2020 12:11:14 +0100
Message-Id: <20200702111114.32217-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

For gapless playback its possible that each track can have different
codec profile with same decoder, for example we have WMA album,
we may have different tracks as WMA v9, WMA v10 and so on

Existing code does not allow to change this profile while doing gapless
playback.

This patch adds new SNDRV_COMPRESS_SET_CODEC_PARAMS IOCTL to allow
userspace to set this new parameters required for new codec profile.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 include/sound/compress_driver.h       |  5 +++
 include/sound/soc-component.h         |  3 ++
 include/sound/soc-dai.h               |  5 +++
 include/uapi/sound/compress_offload.h |  1 +
 sound/core/compress_offload.c         | 54 ++++++++++++++++++++++++---
 sound/soc/soc-compress.c              | 30 +++++++++++++++
 sound/soc/soc-dai.c                   | 14 +++++++
 7 files changed, 106 insertions(+), 6 deletions(-)

diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
index 70cbc5095e72..8d23351f7ad7 100644
--- a/include/sound/compress_driver.h
+++ b/include/sound/compress_driver.h
@@ -93,6 +93,9 @@ struct snd_compr_stream {
  * @set_params: Sets the compressed stream parameters, mandatory
  * This can be called in during stream creation only to set codec params
  * and the stream properties
+ * @set_codec_params: Sets the compressed stream codec parameters, mandatory
+ * This can be called in during gapless next track codec change only to set
+ * codec params
  * @get_params: retrieve the codec parameters, mandatory
  * @set_metadata: Set the metadata values for a stream
  * @get_metadata: retrieves the requested metadata values from stream
@@ -112,6 +115,8 @@ struct snd_compr_ops {
 	int (*free)(struct snd_compr_stream *stream);
 	int (*set_params)(struct snd_compr_stream *stream,
 			struct snd_compr_params *params);
+	int (*set_codec_params)(struct snd_compr_stream *stream,
+			struct snd_codec *params);
 	int (*get_params)(struct snd_compr_stream *stream,
 			struct snd_codec *params);
 	int (*set_metadata)(struct snd_compr_stream *stream,
diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 5663891148e3..1e69c54ed0b9 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -36,6 +36,9 @@ struct snd_compress_ops {
 	int (*get_params)(struct snd_soc_component *component,
 			  struct snd_compr_stream *stream,
 			  struct snd_codec *params);
+	int (*set_codec_params)(struct snd_soc_component *component,
+			  struct snd_compr_stream *stream,
+			  struct snd_codec *params);
 	int (*set_metadata)(struct snd_soc_component *component,
 			    struct snd_compr_stream *stream,
 			    struct snd_compr_metadata *metadata);
diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 212257e84fac..526794ee555b 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -192,6 +192,9 @@ int snd_soc_dai_compr_trigger(struct snd_soc_dai *dai,
 int snd_soc_dai_compr_set_params(struct snd_soc_dai *dai,
 				 struct snd_compr_stream *cstream,
 				 struct snd_compr_params *params);
+int snd_soc_dai_compr_set_codec_params(struct snd_soc_dai *dai,
+				 struct snd_compr_stream *cstream,
+				 struct snd_codec *codec);
 int snd_soc_dai_compr_get_params(struct snd_soc_dai *dai,
 				 struct snd_compr_stream *cstream,
 				 struct snd_codec *params);
@@ -292,6 +295,8 @@ struct snd_soc_cdai_ops {
 			struct snd_soc_dai *);
 	int (*set_params)(struct snd_compr_stream *,
 			struct snd_compr_params *, struct snd_soc_dai *);
+	int (*set_codec_params)(struct snd_compr_stream *,
+			struct snd_codec *, struct snd_soc_dai *);
 	int (*get_params)(struct snd_compr_stream *,
 			struct snd_codec *, struct snd_soc_dai *);
 	int (*set_metadata)(struct snd_compr_stream *,
diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index 7184265c0b0d..c46286113a4b 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -172,6 +172,7 @@ struct snd_compr_metadata {
 						 struct snd_compr_metadata)
 #define SNDRV_COMPRESS_GET_METADATA	_IOWR('C', 0x15,\
 						 struct snd_compr_metadata)
+#define SNDRV_COMPRESS_SET_CODEC_PARAMS	_IOW('C', 0x16, struct snd_codec)
 #define SNDRV_COMPRESS_TSTAMP		_IOR('C', 0x20, struct snd_compr_tstamp)
 #define SNDRV_COMPRESS_AVAIL		_IOR('C', 0x21, struct snd_compr_avail)
 #define SNDRV_COMPRESS_PAUSE		_IO('C', 0x30)
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 0e53f6f31916..1c4b2cf450a0 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -566,6 +566,18 @@ static int snd_compr_allocate_buffer(struct snd_compr_stream *stream,
 	return 0;
 }
 
+static int snd_compress_check_codec_params(struct snd_codec *codec)
+{
+	/* now codec parameters */
+	if (codec->id == 0 || codec->id > SND_AUDIOCODEC_MAX)
+		return -EINVAL;
+
+	if (codec->ch_in == 0 || codec->ch_out == 0)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int snd_compress_check_input(struct snd_compr_params *params)
 {
 	/* first let's check the buffer parameter's */
@@ -574,14 +586,41 @@ static int snd_compress_check_input(struct snd_compr_params *params)
 	    params->buffer.fragments == 0)
 		return -EINVAL;
 
-	/* now codec parameters */
-	if (params->codec.id == 0 || params->codec.id > SND_AUDIOCODEC_MAX)
-		return -EINVAL;
+	return snd_compress_check_codec_params(&params->codec);
 
-	if (params->codec.ch_in == 0 || params->codec.ch_out == 0)
-		return -EINVAL;
+}
 
-	return 0;
+static int snd_compr_set_codec_params(struct snd_compr_stream *stream,
+				      unsigned long arg)
+{
+	struct snd_codec *params;
+	int retval;
+
+	if (!stream->ops->set_codec_params)
+		return -EPERM;
+
+	if (stream->runtime->state != SNDRV_PCM_STATE_RUNNING)
+		return -EPERM;
+
+	/* codec params can be only set when next track has been signalled */
+	if (stream->next_track == false)
+		return -EPERM;
+
+	params = memdup_user((void __user *)arg, sizeof(*params));
+	if (IS_ERR(params))
+		return PTR_ERR(params);
+
+	retval = snd_compress_check_codec_params(params);
+	if (retval)
+		goto out;
+
+	retval = stream->ops->set_codec_params(stream, params);
+	if (retval)
+		goto out;
+
+out:
+	kfree(params);
+	return retval;
 }
 
 static int
@@ -964,6 +1003,9 @@ static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
 	case _IOC_NR(SNDRV_COMPRESS_SET_PARAMS):
 		retval = snd_compr_set_params(stream, arg);
 		break;
+	case _IOC_NR(SNDRV_COMPRESS_SET_CODEC_PARAMS):
+		retval = snd_compr_set_codec_params(stream, arg);
+		break;
 	case _IOC_NR(SNDRV_COMPRESS_GET_PARAMS):
 		retval = snd_compr_get_params(stream, arg);
 		break;
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 4984b6a2c370..e549e0197aca 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -518,6 +518,34 @@ static int soc_compr_set_params_fe(struct snd_compr_stream *cstream,
 	return ret;
 }
 
+static int soc_compr_set_codec_params(struct snd_compr_stream *cstream,
+				      struct snd_codec *codec)
+{
+	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
+	struct snd_soc_component *component;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	int i, ret;
+
+	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+
+	ret = snd_soc_dai_compr_set_codec_params(cpu_dai, cstream, codec);
+	if (ret < 0)
+		goto err;
+
+	for_each_rtd_components(rtd, i, component) {
+		if (!component->driver->compress_ops ||
+		    !component->driver->compress_ops->set_codec_params)
+			continue;
+
+		ret = component->driver->compress_ops->set_codec_params(component, cstream,
+								     codec);
+		break;
+	}
+err:
+	mutex_unlock(&rtd->card->pcm_mutex);
+	return ret;
+}
+
 static int soc_compr_get_params(struct snd_compr_stream *cstream,
 				struct snd_codec *params)
 {
@@ -728,6 +756,7 @@ static struct snd_compr_ops soc_compr_ops = {
 	.open		= soc_compr_open,
 	.free		= soc_compr_free,
 	.set_params	= soc_compr_set_params,
+	.set_codec_params = soc_compr_set_codec_params,
 	.set_metadata   = soc_compr_set_metadata,
 	.get_metadata	= soc_compr_get_metadata,
 	.get_params	= soc_compr_get_params,
@@ -744,6 +773,7 @@ static struct snd_compr_ops soc_compr_dyn_ops = {
 	.free		= soc_compr_free_fe,
 	.set_params	= soc_compr_set_params_fe,
 	.get_params	= soc_compr_get_params,
+	.set_codec_params = soc_compr_set_codec_params,
 	.set_metadata   = soc_compr_set_metadata,
 	.get_metadata	= soc_compr_get_metadata,
 	.trigger	= soc_compr_trigger_fe,
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index b05e18b63a1c..06481d0278b8 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -594,6 +594,20 @@ int snd_soc_dai_compr_get_params(struct snd_soc_dai *dai,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_compr_get_params);
 
+int snd_soc_dai_compr_set_codec_params(struct snd_soc_dai *dai,
+					struct snd_compr_stream *cstream,
+					struct snd_codec *codec)
+{	int ret = 0;
+
+	if (dai->driver->cops &&
+	    dai->driver->cops->set_codec_params)
+		ret = dai->driver->cops->set_codec_params(cstream, codec, dai);
+
+	return soc_dai_ret(dai, ret);
+
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_compr_set_codec_params);
+
 int snd_soc_dai_compr_ack(struct snd_soc_dai *dai,
 			  struct snd_compr_stream *cstream,
 			  size_t bytes)
-- 
2.21.0

