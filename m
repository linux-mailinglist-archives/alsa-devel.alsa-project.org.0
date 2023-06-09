Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A1D729D88
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:57:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44EBCE98;
	Fri,  9 Jun 2023 16:56:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44EBCE98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322651;
	bh=2rAbzoA8M0m1zSiadj/O8IO3HWaQMU2Et9W1rvgsAiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eL3118aFIrtQQiWbDb6egOP9YrnJYshxAM8gKDd9LHD87UHJ8TghHgAVbMlPK61+G
	 jQziMQ5KdalAIxL3J4OW/vD3EIQeTtOFyITHk2nIw0wzdqbb1JFXtGKeESsW9mnoiQ
	 npAlPpMOt9uzvz/KIA+EwRFCAkevIG247stFfA/E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10565F805AD; Fri,  9 Jun 2023 16:55:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41A68F8057F;
	Fri,  9 Jun 2023 16:55:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF913F80254; Fri,  9 Jun 2023 16:55:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0CE59F800ED
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 16:55:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CE59F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wGdDdU1W
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f6da07feb2so18480035e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Jun 2023 07:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686322545; x=1688914545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ceveTfOufM41Yk46cZA2HP7pP/eOM7y2Ye/vu65mbBg=;
        b=wGdDdU1WbBehr6YeSjJKJn2UicuWUB0ZAFeXWFhjulmN7L79cudbUKwhzTXhSnQlQT
         5OtYwrDbnPzojxezVf7Nb+lDxIKdUzmoixPSzbd/BE55bL0rHwk0ibyDuDkvrK2+c5yZ
         ogHLqsEysKwz0f8Dw5JxGnyLcRHdHCb81BGP9H8WwEz/Rv/u+2PUMIG91z1HNx9JzjEq
         H3+T6KT7Roh0qPnWvFCrGkkFeyZK7LH0cDSTzbmCkrDLd9N8mPami5oHqSiooVvp1UUz
         8PvZynmeITTUIV0GtWt17uKYjSZKFWT4c8iQxCUWtngcNNwih7RPKHqqTMxhG0KBtsqN
         42jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686322545; x=1688914545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ceveTfOufM41Yk46cZA2HP7pP/eOM7y2Ye/vu65mbBg=;
        b=h/seicz/J1dIKiPrvXcctibgcSd+brJuzOa4k2PcLCHfWsI5QdSIK0lMsM1Xo7TBgA
         w/OEDJC92ovCoTPXkWT5wDnpMYmetgNfdzEg0PU/504xvW4Te5FdDENwJXkqRuYMD48y
         ZmWL4oSD/JNTakrXy6duub8LQ+JIYFAkRT3hzlmmH0gXpxi4ln34pb6WoISu/jl4lxS+
         NmfzmXobX67dFpQaBeWewV9/uZbP+rYAKGSiK5ZAGxrxv6qcZ+rTIl9fi611B9IUVq52
         WxD5x6OJ9qAWCkTHMP62k5GAVJvsyckMm9jTbx6FDA3xOl3cLJp9i4f4TYCgFTFzeBGC
         gleA==
X-Gm-Message-State: AC+VfDxSqbzXjn+2CjeHFS7lmq3wflhP8xoDMW6mMiVOq4cFSYpYovzo
	Fu20kvdgcRtHEVGTFlRyqSVRTPA6onEWGTnMFPo=
X-Google-Smtp-Source: 
 ACHHUZ4+xaJJt8ykggKW0Xc2YkxZCEXG9THMCFctHSJ1eSFC1V4U97xkSNUdkLqQXEYF4N2d4JWOPg==
X-Received: by 2002:a05:600c:2901:b0:3f6:d2c:13f2 with SMTP id
 i1-20020a05600c290100b003f60d2c13f2mr1453507wmd.41.1686322545323;
        Fri, 09 Jun 2023 07:55:45 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0ad500b003f7310a3ffasm2946632wmr.2.2023.06.09.07.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:55:44 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Subject: [PATCH v2 09/11] ASoC: q6dsp: q6apm-dai: Add trigger/pointer compress
 DAI callbacks
Date: Fri,  9 Jun 2023 15:54:05 +0100
Message-Id: <20230609145407.18774-10-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230609145407.18774-1-srinivas.kandagatla@linaro.org>
References: <20230609145407.18774-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U3LBA3ZUNCHF7UIQDS4MJ4IQC3AKBCBZ
X-Message-ID-Hash: U3LBA3ZUNCHF7UIQDS4MJ4IQC3AKBCBZ
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U3LBA3ZUNCHF7UIQDS4MJ4IQC3AKBCBZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add q6apm trigger and pointer compress DAI callbacks to support
compress offload playback.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 67 ++++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6apm.h     |  1 +
 2 files changed, 68 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index d43705bf523a..9543b79ce83d 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -568,11 +568,78 @@ static int q6apm_dai_compr_get_codec_caps(struct snd_soc_component *component,
 
 	return 0;
 }
+
+static int q6apm_dai_compr_pointer(struct snd_soc_component *component,
+				   struct snd_compr_stream *stream,
+				   struct snd_compr_tstamp *tstamp)
+{
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct q6apm_dai_rtd *prtd = runtime->private_data;
+	unsigned long flags;
+
+	spin_lock_irqsave(&prtd->lock, flags);
+	tstamp->copied_total = prtd->copied_total;
+	tstamp->byte_offset = prtd->copied_total % prtd->pcm_size;
+	spin_unlock_irqrestore(&prtd->lock, flags);
+
+	return 0;
+}
+
+static int q6apm_dai_compr_trigger(struct snd_soc_component *component,
+			    struct snd_compr_stream *stream, int cmd)
+{
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct q6apm_dai_rtd *prtd = runtime->private_data;
+	int ret = 0;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, NO_TIMESTAMP);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		break;
+	case SND_COMPR_TRIGGER_NEXT_TRACK:
+		prtd->next_track = true;
+		break;
+	case SND_COMPR_TRIGGER_DRAIN:
+	case SND_COMPR_TRIGGER_PARTIAL_DRAIN:
+		prtd->notify_on_drain = true;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int q6apm_dai_compr_ack(struct snd_soc_component *component, struct snd_compr_stream *stream,
+			size_t count)
+{
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct q6apm_dai_rtd *prtd = runtime->private_data;
+	unsigned long flags;
+
+	spin_lock_irqsave(&prtd->lock, flags);
+	prtd->bytes_received += count;
+	spin_unlock_irqrestore(&prtd->lock, flags);
+
+	return count;
+}
+
 static const struct snd_compress_ops q6apm_dai_compress_ops = {
 	.open		= q6apm_dai_compr_open,
 	.free		= q6apm_dai_compr_free,
 	.get_caps	= q6apm_dai_compr_get_caps,
 	.get_codec_caps	= q6apm_dai_compr_get_codec_caps,
+	.pointer	= q6apm_dai_compr_pointer,
+	.trigger	= q6apm_dai_compr_trigger,
+	.ack		= q6apm_dai_compr_ack,
 };
 
 static const struct snd_soc_component_driver q6apm_fe_dai_component = {
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index d187d88c0a8c..8ee40732ce9e 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -46,6 +46,7 @@
 
 #define APM_MAX_SESSIONS			8
 #define APM_LAST_BUFFER_FLAG			BIT(30)
+#define NO_TIMESTAMP				0xFF00
 
 struct q6apm {
 	struct device *dev;
-- 
2.21.0

