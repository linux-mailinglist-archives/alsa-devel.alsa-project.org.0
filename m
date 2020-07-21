Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EB7228699
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jul 2020 19:02:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29B8A41;
	Tue, 21 Jul 2020 19:01:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29B8A41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595350942;
	bh=LxhNlFgwErGjD/Okb3KP+IQQpvW9uORXRny2Mwjqjs8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NT9GwtGPn1oZEnuWS1d6tS4LZXKsW4y3GrtnPCuJSytqlCWWbPxcexr7TPMnne6u7
	 +85Frl0UipFK4tnIAqx/dpGOYEYdjteuMYx1n5Rz+S4WZ07o45535NST3Xppl4r0Yv
	 1UDjvjIoEqYUUJbbVtS2/21Sx8eA651pM2uMkg3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B350F802BE;
	Tue, 21 Jul 2020 19:00:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77D37F802C2; Tue, 21 Jul 2020 19:00:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2BF3F8024A
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 19:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2BF3F8024A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="AbnVVS1e"
Received: by mail-wm1-x343.google.com with SMTP id 9so130393wmj.5
 for <alsa-devel@alsa-project.org>; Tue, 21 Jul 2020 10:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cX30zM4NBo9NgJKdwCaDNO5IgDHp7txiav7RhZ1wYnQ=;
 b=AbnVVS1ePUqx9ZPvRol7dMY9NmY2pLxSYSuFxd7YPIgzDHhZ3v8kpF1QZ3NJtL6kIK
 i0Y2uIL8P6oqP1sjFslcqU+M0EmVuj8Rbq6mJWXcOwrA7OHTLIkG5vL0V2q1S6L1g2+O
 G4YFGPSucmloC+6HSvQRDkY3sYdb44fR62hM1u/eLxMTAfkUzXeDTSw+B92btBFVLoNH
 Sj0oZOseF9TALG3GGtnYqm1bneG0Z34Bti25JMNs3oYDo9DpwSj69TRKxNa/fZaPbzOj
 GPnkiOuHr2yLQIiFAVkS2OGDmbMaGnNjQ7ENLTtWXJUZi/aXos7jg0pOzXhnz0x63/nk
 Fnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cX30zM4NBo9NgJKdwCaDNO5IgDHp7txiav7RhZ1wYnQ=;
 b=YBZRoGGjYcyr2OBNGgJigNoaCbRUIKAUpBXvgiHN+0zVI9cV6/FXkjXqXqP8bk3MD8
 JWZnonzvjytyDOS6IP/x7EJZm9RMFeioxvG4NrcUMGSiYMvAQE/+W0HFS7AhOgoPApYF
 uzGR4AYtLhYczjjcAUyzgeIL6clFaavEe2rudkYLzuZkwCG5ivTn1K79aqXMyik3quw1
 PW/Vkgrm3mJHtpwOLsLykRFuZEs4ARivQMlncNfpAcjZoSlGu9vq6Sd0tIKU5MtnWtHl
 U07BO9RWWyV3Z9PuSDLsUcdeF/1x4u4npGK2o18JJ1WuAqNTRm+KrqJ9h+Th64rKgTbV
 7ZbA==
X-Gm-Message-State: AOAM532geZ6TIg/GHE0sXLZjqWOAQAn31SGIqCmuNGg+ndBXloKHDztK
 LGheaspoFfRLsw8TZc52ivQlyg==
X-Google-Smtp-Source: ABdhPJxXHRQU8c3AC4+4CNVvMYSBeNRcIY6fllLgC7+JpgeWNr20AAE6+Lrw5aOotX5A5Ot5n8tUMA==
X-Received: by 2002:a7b:c5c5:: with SMTP id n5mr4872179wmk.103.1595350816319; 
 Tue, 21 Jul 2020 10:00:16 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id h11sm15526327wrb.68.2020.07.21.10.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 10:00:15 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [RFC PATCH v2 3/6] ALSA: compress: add flags to snd_compr_caps to
 expose dsp caps
Date: Tue, 21 Jul 2020 18:00:04 +0100
Message-Id: <20200721170007.4554-4-srinivas.kandagatla@linaro.org>
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

Some of the DSPs like Qualcomm QDSP has ablity to change decoders
dynamically on a single stream, This could be used for features
like Cross Fade or gapless with different codec profile tracks.

Exposing such features in flags variable of compress caps descriptor
would provide userspace more flexibity in usings dsp features.

For now only one flag of switching decoders is added which is used
in subsequent patches.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 include/uapi/sound/compress_offload.h |  7 ++++++-
 sound/core/compress_offload.c         | 20 ++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index c46286113a4b..43c78cdf492c 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -88,6 +88,9 @@ enum snd_compr_direction {
 	SND_COMPRESS_CAPTURE
 };
 
+/* DSP can switch decoder in a single Stream while doing gapless */
+#define SND_COMPR_CAP_FLAGS_DSP_CAN_SWITCH_DECODER	((__u32) 0x00000001)
+
 /**
  * struct snd_compr_caps - caps descriptor
  * @codecs: pointer to array of codecs
@@ -97,6 +100,7 @@ enum snd_compr_direction {
  * @min_fragments: min fragments supported by DSP
  * @max_fragments: max fragments supported by DSP
  * @num_codecs: number of codecs supported
+ * @flags: flags to expose various DSP capabilities
  * @reserved: reserved field
  */
 struct snd_compr_caps {
@@ -107,7 +111,8 @@ struct snd_compr_caps {
 	__u32 min_fragments;
 	__u32 max_fragments;
 	__u32 codecs[MAX_NUM_CODECS];
-	__u32 reserved[11];
+	__u32 flags;
+	__u32 reserved[10];
 } __attribute__((packed, aligned(4)));
 
 /**
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index 184722643c97..abebd5fee2d2 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -590,12 +590,32 @@ static int snd_compress_check_input(struct snd_compr_params *params)
 
 }
 
+static bool snd_compr_can_dsp_switch_decoder(struct snd_compr_stream *stream)
+{
+	struct snd_compr_caps caps;
+
+	if (!stream->ops->get_caps)
+		return false;
+
+	memset(&caps, 0, sizeof(caps));
+	if (stream->ops->get_caps(stream, &caps))
+		return false;
+
+	if (caps.flags & SND_COMPR_CAP_FLAGS_DSP_CAN_SWITCH_DECODER)
+		return true;
+
+	return false;
+}
+
 static int snd_compr_set_codec_params(struct snd_compr_stream *stream,
 				      unsigned long arg)
 {
 	struct snd_codec *params;
 	int retval;
 
+	if (!snd_compr_can_dsp_switch_decoder(stream))
+		return -ENOTSUPP;
+
 	if (!stream->ops->set_codec_params)
 		return -EPERM;
 
-- 
2.21.0

