Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3C4228696
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 19:01:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F428166E;
	Tue, 21 Jul 2020 19:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F428166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595350876;
	bh=YMnAksjozOvtrXHj901rcOAgbXaE3yeQCEv80kWAZN0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f9WnS4nPsqvJA65f8k2j/fSgnjeK70mLW64fxmK8fI31SsysN/I1JoMf5UL9T7v3k
	 OR9VJIihKc78PKjKCHG2+oH6p33vn3LMGMxNQQpavSo1Ppd+emEbTwA5SJu8Ms5rZ5
	 GMngWwKCNB0N10dMFeTA9cdo5vnr4yBpHWEE07xs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 902DAF8028B;
	Tue, 21 Jul 2020 19:00:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1F25F8028D; Tue, 21 Jul 2020 19:00:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86ECBF80087
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 19:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86ECBF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="TZagcxsv"
Received: by mail-wm1-x343.google.com with SMTP id q15so3530951wmj.2
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4rU3b/gziRzoNApIuUQOhBISC1QXxPCmKcl+VrCyHfM=;
 b=TZagcxsvvNWcs1yVY+CL7AodCrhUI/pwmVvVHQ9kkofoOakLyDuKZtIFEtBtRO9dgP
 cJOjbRXbeXx9+8Xw9m64/gA039nNk9U6Z7cX1Qc/HXOypUPEvFYyhVhAlekkTaH0l9St
 8sFwOc6zbcKRy/fkJWbpQBFZBAzBoQY9Lo/X9CrMfcyShVCa7tCF5Ynnu/Mat1fss7WX
 Cbc8tUPGjA3a0HkOX2kamp+Ljuea6rSkwUmvQxJSGV0qbDoQ3yfzT26J0YKaKQvi3dkh
 2sXJ2sE/kryAhEghs/yRO58y13MmX424/RNqLBodl/gijjcF9h+QncDOikOoeAJ0dDuF
 mcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4rU3b/gziRzoNApIuUQOhBISC1QXxPCmKcl+VrCyHfM=;
 b=Tomf6xL8F7NM8xwrbzTUwuTdWdQwI1s1oSbB+8Hh9V2E/54NrsVoog9psuzWSV9eyZ
 sgLf76XQqZ8W2j9aAKFbmWI1x4XiTs61worWGA0mWM9RHc9n0LE33A/dG1FnRxww74fz
 eLrCf9ki2QGKIQWxiP48a2jl0q7jzIwrawvUj9ljtDecz9B6rYqVKy1cY3sKoRQ7vRrH
 swlZ2LL6j4020oYpJOLXMhdJr1rRcVG2qygJx+awbsd7CPe9GwCnDTZhyTDVCjo2EZ8B
 avTyxZHw9PsCRb3IV0gdEePuKlB7RVIAFXImELrIRnfFO59TmtBZICv0OZyVwwkuavZ1
 iITg==
X-Gm-Message-State: AOAM533CWopxScXYwa+QZoUlugKvT9o0l5U8Bf7K1tDRNoLqBBwKOXWM
 W22yXX1WmtOJt9L1hv5g7l0Rhw==
X-Google-Smtp-Source: ABdhPJx0378L3JEh/bfdLm1mDah0uO18+EojpgndTJjXLnsvs9BnTrzTyeSkmbdU9xwu4rDx2IOyBg==
X-Received: by 2002:a1c:7d56:: with SMTP id y83mr5150904wmc.154.1595350814996; 
 Tue, 21 Jul 2020 10:00:14 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id h11sm15526327wrb.68.2020.07.21.10.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 10:00:14 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [RFC PATCH v2 2/6] ALSA: compress: add new ioctl for setting codec
 parameters
Date: Tue, 21 Jul 2020 18:00:03 +0100
Message-Id: <20200721170007.4554-3-srinivas.kandagatla@linaro.org>
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

For gapless playback it is possible that each track can have different
codec profile with same decoder, for example we have WMA album,
we may have different tracks as WMA v9, WMA v10 and so on

Or if DSP's like QDSP have abililty to switch decoders on single stream
for each track, then this call could be used to set new codec parameters.

Existing code does not allow to change this profile while doing gapless
playback.

This patch adds new SNDRV_COMPRESS_SET_CODEC_PARAMS IOCTL to allow
userspace to set this new parameters required for new codec profile.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../sound/designs/compress-offload.rst        |  6 ++++
 include/sound/compress_driver.h               |  5 +++
 include/uapi/sound/compress_offload.h         |  1 +
 sound/core/compress_offload.c                 | 34 +++++++++++++++++++
 4 files changed, 46 insertions(+)

diff --git a/Documentation/sound/designs/compress-offload.rst b/Documentation/sound/designs/compress-offload.rst
index 935f325dbc77..305ccc7bfdd9 100644
--- a/Documentation/sound/designs/compress-offload.rst
+++ b/Documentation/sound/designs/compress-offload.rst
@@ -128,6 +128,12 @@ set_params
   cases decoders will ignore other fields, while encoders will strictly
   comply to the settings
 
+set_codec_params
+  This routine is very much simillar to set_params but exculding stream
+  information. Only codec related information is set as part of this.
+  It is used in gapless playback where its required to change decoder
+  or its parameters for next track. This is optional.
+
 get_params
   This routines returns the actual settings used by the DSP. Changes to
   the settings should remain the exception.
diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
index 70cbc5095e72..d9c00bcfce9b 100644
--- a/include/sound/compress_driver.h
+++ b/include/sound/compress_driver.h
@@ -93,6 +93,9 @@ struct snd_compr_stream {
  * @set_params: Sets the compressed stream parameters, mandatory
  * This can be called in during stream creation only to set codec params
  * and the stream properties
+ * @set_codec_params: Sets the compressed stream codec parameters, Optional
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
index af5824113246..184722643c97 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -590,6 +590,37 @@ static int snd_compress_check_input(struct snd_compr_params *params)
 
 }
 
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
+
+out:
+	kfree(params);
+	return retval;
+}
+
 static int
 snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
 {
@@ -973,6 +1004,9 @@ static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
 	case _IOC_NR(SNDRV_COMPRESS_GET_PARAMS):
 		retval = snd_compr_get_params(stream, arg);
 		break;
+	case _IOC_NR(SNDRV_COMPRESS_SET_CODEC_PARAMS):
+		retval = snd_compr_set_codec_params(stream, arg);
+		break;
 	case _IOC_NR(SNDRV_COMPRESS_SET_METADATA):
 		retval = snd_compr_set_metadata(stream, arg);
 		break;
-- 
2.21.0

