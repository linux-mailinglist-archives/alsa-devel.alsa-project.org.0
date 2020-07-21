Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9AE22869D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 19:02:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3898D1667;
	Tue, 21 Jul 2020 19:02:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3898D1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595350977;
	bh=xhLor8CYJrgNP5t1vjU3+SfxOeWL7tn5m6G8kkRfHvQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AqWrOTM+Tu4qTspt3HGgczYzXAoe+ebYzJT6wFvxdLh27mRoyOgsPdBUEqvTA9CmD
	 hM/7oKZDpuOjN4MWsAmTuV8vOiS0gzqgzIiRqNF9vhnWfM5x49jbTHQI8LwO67kz6O
	 2GwhxT4BUsgE7AmgNNhrQHyzmL65ZJGnYnkwKN+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CF51F800CE;
	Tue, 21 Jul 2020 19:00:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B494FF802DB; Tue, 21 Jul 2020 19:00:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEF93F80268
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 19:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEF93F80268
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rGgImTH6"
Received: by mail-wm1-x342.google.com with SMTP id c80so3545339wme.0
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 10:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZOraVd74qzG1/9gtwasj7hNZRlKbVxl3mVRj5ZSF7Dw=;
 b=rGgImTH6cRW3JnhKIdeBbGCqvYhutbzFSz7mlRlsdNbijsdwAga1FeJyh4NCPezpJP
 w3E0eicyoEm4KyHIDU7BT17bprfX97UBJ7cZoZboy8dxVYTHW4B3YPI/b4zNtjijmThJ
 TnYB1luKSwCroAcp/7ifYGxWOP8Zy0L/0eycR5j5p5AqWdOLx002RpjAq9Q+CXe5oN+E
 gfcbJ6D4xy0hmDwFyNdjATtWz5U+x9qARq0vEwWu+oB6Qas0dcNOejAO2Pczk0W22uEY
 PdToiMO/G89MgtVzzrLyyVLVlwz0DNLexhNvsvC/2xvnqwus7c/TUH+NH7LbIZVLVnIt
 Izkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZOraVd74qzG1/9gtwasj7hNZRlKbVxl3mVRj5ZSF7Dw=;
 b=OVOLhha8P2ED9C1muAKo5IYiv6ZOrIQicIOwwANmpTezmDojwv3DnUnYYLZwCodlRO
 2Q0XXkixzyf+BqZtlmVpxXhE6BWcRMJzUdF2PtLGlzzmf6Fm53xn8bxLRrIjOgvXMdcr
 F4WsN55ElKJ5Ui3W8WNgUM5eRK98jjLK/yLjicALtebAihkjad0T1TP9tZsEhUb9gay6
 MPzH3GFJtEcI7o6bwR/VQY/BV19pkV/FDo18ZA/+2AmBQCAxFsteEQOyF7AZYEIm4ozn
 2xGq7dAtOX/lHLp4X8iV5EzwAx6oe3QpBKqiKOtE0s8DjBwtCLL+d69yTZxUUuevQCFI
 0e0w==
X-Gm-Message-State: AOAM532LLCxRF+Hhhjjfdg43RIyr7ZX43PwykARMh3uBZLBUJ0cxoldm
 gVLL18h61CDR+DN7S63h7gJPwF6c1xU=
X-Google-Smtp-Source: ABdhPJyanh2NBymOjVnC1OieVwWUIGSxUVOyeKt8tkHvdgFZRJPKcaXzfWkcjFu5fSmyt990bVvV4g==
X-Received: by 2002:a1c:e382:: with SMTP id a124mr491428wmh.11.1595350817574; 
 Tue, 21 Jul 2020 10:00:17 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id h11sm15526327wrb.68.2020.07.21.10.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 10:00:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [RFC PATCH v2 4/6] ASoC: compress: add
 snd_soc_dai_compr_set_codec_params()
Date: Tue, 21 Jul 2020 18:00:05 +0100
Message-Id: <20200721170007.4554-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200721170007.4554-1-srinivas.kandagatla@linaro.org>
References: <20200721170007.4554-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, vkoul@kernel.org,
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

Add corresponding ASoC changes to support gapless playback of tracks
which have different codec profile with or without same decoder.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 include/sound/soc-component.h |  3 +++
 include/sound/soc-dai.h       |  5 +++++
 sound/soc/soc-compress.c      | 30 ++++++++++++++++++++++++++++++
 sound/soc/soc-dai.c           | 14 ++++++++++++++
 4 files changed, 52 insertions(+)

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

