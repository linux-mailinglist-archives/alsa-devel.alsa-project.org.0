Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 041577351DA
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 12:20:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 169ECDEF;
	Mon, 19 Jun 2023 12:19:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 169ECDEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687170005;
	bh=1wG9oaFB0ZgT3N7t9fD/4jjb64PRlUrm5rda6Qwqsc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d95oz+r2ajlof/he2IHl48/HFZ8EADvXp7Ipw6GRh1HL4aqQsKmTNZeiPYW7q5aBx
	 4lMNCShRRq8WLEAbJsnrjPuFTrHSlaouy7dKmQwtzkO5PYZ1+U2h/NwtT9pATOttsN
	 0STsAfw023g6QO52jd8WqW+a1oNCdrfHKaCr66EY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 644AFF805C5; Mon, 19 Jun 2023 12:17:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C756DF805BE;
	Mon, 19 Jun 2023 12:17:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C1D4F80570; Mon, 19 Jun 2023 12:17:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 033AFF80529
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 12:17:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 033AFF80529
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=K87vDtXv
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-311167ba376so2970997f8f.1
        for <alsa-devel@alsa-project.org>;
 Mon, 19 Jun 2023 03:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687169826; x=1689761826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8UTtnacXFhkaa2mZeZWdPy27iLwDS43g1aootOIyr7w=;
        b=K87vDtXv1eApSrwu3I7xQDm3u1Xqm2uvm5TTdetvU9fpgYbcAw18SzhP+k3w6A7ehq
         VsMgqHUtgycoZiBOnvgitT79/FSrmWKXF6GB3KbMfE8GSrBWQkCWEMOG/9hYBpPNMWSi
         yWU+XpXNexfvy+J6B9a/oSWUhj1SswnjnryJ2zaO1qhmoGwwsxCLpyALFRfDq/4jj+5z
         a3eEhXpa5/xfEUlLSRY001BzVVLTkkKLvNwSybF8nSzzIeGdxb16PSU9hW6fsbB7FtSb
         xasA+lzimf/4XUvvcPmnwpslGFGSPMKw7deCO/mpwH9mHySOlBe6S59tj9e+tbYRD3F+
         WuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687169826; x=1689761826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UTtnacXFhkaa2mZeZWdPy27iLwDS43g1aootOIyr7w=;
        b=djFX+NBMUdIZ2/sl5h+TfrHzGyANnQgembVf3b5RMn03TGiAJ8cJqmg5o6Z8cHKtBL
         mn3PpDNnN3VQSFnyIHJKAinX5jG/0HEK39wyaoSPk9zLl1FmkZtDImq0dGxtqC5j6dBh
         06P4dl71dS6qHIGqN6z71QTo6FOohqVJzCDrKh/fn5xbP4ypX89KWUjOp+G/xBlSVSpl
         VWWF3yS5eb9wcY9XA4Eg0xu6rzcrW4/yNrdAaIAJfOC/KvltL8Bgr9krJQOVFO25r+1V
         OfYWDrqdtmGXhEmjqMAkVZSBMoJFd7jkDrcxv/7XAJ0jMWAGGjdgm4A0TXnDCxZeJ3CD
         s/Nw==
X-Gm-Message-State: AC+VfDzKQm1RmQmehgwSCINz7s4F1NFC7F3Smm2vVqrIEGTE4Mf5gdyG
	LrFLdjZubA1qv2shurfDhaIMPA==
X-Google-Smtp-Source: 
 ACHHUZ5E4xdZH3LDu1+ktZXx7Nhw6BKYaUfDOR8Ml82SrAN2yOWWW1tsgOhPdcuh7JRa5nTu0H/26Q==
X-Received: by 2002:a5d:698f:0:b0:30a:d459:8f72 with SMTP id
 g15-20020a5d698f000000b0030ad4598f72mr7394877wru.60.1687169826500;
        Mon, 19 Jun 2023 03:17:06 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 c2-20020a5d5282000000b002fae7408544sm31146922wrv.108.2023.06.19.03.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 03:17:05 -0700 (PDT)
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
Subject: [PATCH v3 09/11] ASoC: q6dsp: q6apm-dai: Add trigger/pointer compress
 DAI callbacks
Date: Mon, 19 Jun 2023 11:16:51 +0100
Message-Id: <20230619101653.9750-10-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230619101653.9750-1-srinivas.kandagatla@linaro.org>
References: <20230619101653.9750-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: R3KRZHSKKB7U6LQMYPR5L5FZZFWK36SA
X-Message-ID-Hash: R3KRZHSKKB7U6LQMYPR5L5FZZFWK36SA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R3KRZHSKKB7U6LQMYPR5L5FZZFWK36SA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add q6apm trigger and pointer compress DAI callbacks to support
compress offload playback.

Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

