Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EC87351E6
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 12:21:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E51F0DF6;
	Mon, 19 Jun 2023 12:20:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E51F0DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687170064;
	bh=HVV8Cm9b1Ag9wj0CaHNprRsi2fRjovJbKt1XlGg9raM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IJBpILJxn0fmOIWyvsH7JGlXrojOstQOMBf8SKnO6VnOnePQT8vJUvsVVANXsh6PR
	 WUO/vhPYklnuXBapb9D+ov/EjDcVoAT3lB88W8NIPRsOK6trgQlr3RrwpUwG056vp4
	 MPOC6O8SXO4PrexoUTQ1kL121GXxeWTPIt2WNbUg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7536EF805F5; Mon, 19 Jun 2023 12:17:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB6AFF805EE;
	Mon, 19 Jun 2023 12:17:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E59FF8057E; Mon, 19 Jun 2023 12:17:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8AF01F80551
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 12:17:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AF01F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QDdlGZ1a
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-31109cd8d8cso2967200f8f.2
        for <alsa-devel@alsa-project.org>;
 Mon, 19 Jun 2023 03:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687169824; x=1689761824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMcEeKE/zt6hoVJVRWuQqq+48i5b+sqdr7X7eIAAcGg=;
        b=QDdlGZ1aLNOvrp+Kp76+3dNFfPuDAD7U4F+Ntjz4V6auxuVtZVZm3cqdvhGqEYMEp4
         N70dxOuyIG0/CAWdC1epI10DAbqIb6UcDPPauJVaRS5+LnWUCnIzdJli5z6OeMdzAyVp
         rhVgXHkvNdh/2Sr0Hv0WwvHKeGAGTtPZ0kOmPTu8ku83aMbhJTexKQMtlNQZiPhRX+mW
         qTIK5Sgy8SvACZB8OFkHDjeZ2ypI8I6nU6bLFyi+7svuvAzZQbyYdev0N31s1ajuafR+
         hMbig0G8q/Eo0CaXjBJyj8Gm0PAfcVkJjcOMjVoyo3cTWK0bdTxdEvplFEVVYp4Fx0d8
         PkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687169824; x=1689761824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMcEeKE/zt6hoVJVRWuQqq+48i5b+sqdr7X7eIAAcGg=;
        b=YsijiaYJ0j4RjSrmudXGInFNreR2gmqj+vDrRzFr4IESEvRKRMcR9rWlZ0PtxTU6D2
         +ElBAi0EM7eohR7QOMGHmWjQAQPB+m5eRqK3GkpoZlIl7xk3Hye32nV1DMwmQqE+Ymc8
         DBquh6erXupmrfU2XKf3rzcv3ejDTrlGdwz4J8nIsHM96K20xqLRHZA6qSa8JHsmr89L
         ys5HeNDHdFnkleFzAdpnsWwrFtj1j0sEo4xNbh0RrpYfv4GdgIG+3stTCfWw0fT7Mq63
         T6NYvfptpLLuOBzsuofkjZJ69SYjm/mthN1ijvY5N2h2mOrMKmwM8vEwhLBC5NRZQNxD
         D5fQ==
X-Gm-Message-State: AC+VfDwvmrs8F9AfIsuYOGA+z1hen9ooohfDJ1Ec7e1z0fCmZmGajj0m
	kAKdPjpcNkNZH4Jne8oHpd9QOA==
X-Google-Smtp-Source: 
 ACHHUZ4xptSZCqArQdHo4ETHPsMwGa11iEWiGEWbrCSQCS4eIneS6KOqCdUhqKZQz3n5Oo6jK1rUNw==
X-Received: by 2002:a5d:63c5:0:b0:30f:cf93:4bb8 with SMTP id
 c5-20020a5d63c5000000b0030fcf934bb8mr6601009wrw.57.1687169824292;
        Mon, 19 Jun 2023 03:17:04 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 c2-20020a5d5282000000b002fae7408544sm31146922wrv.108.2023.06.19.03.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 03:17:03 -0700 (PDT)
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
Subject: [PATCH v3 07/11] ASoC: q6dsp: q6apm-dai: Add open/free compress DAI
 callbacks
Date: Mon, 19 Jun 2023 11:16:49 +0100
Message-Id: <20230619101653.9750-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230619101653.9750-1-srinivas.kandagatla@linaro.org>
References: <20230619101653.9750-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EZY5RYUDQFFBF7XW6MCGEHOAOHYNOAQR
X-Message-ID-Hash: EZY5RYUDQFFBF7XW6MCGEHOAOHYNOAQR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EZY5RYUDQFFBF7XW6MCGEHOAOHYNOAQR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add q6apm open and free compress DAI callbacks to support compress
offload playback.
Include compress event handler callback also.

Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 136 +++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6apm.h     |   1 +
 2 files changed, 137 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 9fff41ee98eb..32df5db014d3 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -28,6 +28,8 @@
 #define CAPTURE_MIN_PERIOD_SIZE		320
 #define BUFFER_BYTES_MAX (PLAYBACK_MAX_NUM_PERIODS * PLAYBACK_MAX_PERIOD_SIZE)
 #define BUFFER_BYTES_MIN (PLAYBACK_MIN_NUM_PERIODS * PLAYBACK_MIN_PERIOD_SIZE)
+#define COMPR_PLAYBACK_MAX_FRAGMENT_SIZE (128 * 1024)
+#define COMPR_PLAYBACK_MAX_NUM_FRAGMENTS (16 * 4)
 #define SID_MASK_DEFAULT	0xF
 
 enum stream_state {
@@ -55,6 +57,7 @@ struct q6apm_dai_rtd {
 	enum stream_state state;
 	struct q6apm_graph *graph;
 	spinlock_t lock;
+	bool notify_on_drain;
 };
 
 struct q6apm_dai_data {
@@ -132,6 +135,69 @@ static void event_handler(uint32_t opcode, uint32_t token, uint32_t *payload, vo
 	}
 }
 
+static void event_handler_compr(uint32_t opcode, uint32_t token,
+				uint32_t *payload, void *priv)
+{
+	struct q6apm_dai_rtd *prtd = priv;
+	struct snd_compr_stream *substream = prtd->cstream;
+	unsigned long flags;
+	uint32_t wflags = 0;
+	uint64_t avail;
+	uint32_t bytes_written, bytes_to_write;
+	bool is_last_buffer = false;
+
+	switch (opcode) {
+	case APM_CLIENT_EVENT_CMD_EOS_DONE:
+		spin_lock_irqsave(&prtd->lock, flags);
+		if (prtd->notify_on_drain) {
+			snd_compr_drain_notify(prtd->cstream);
+			prtd->notify_on_drain = false;
+		} else {
+			prtd->state = Q6APM_STREAM_STOPPED;
+		}
+		spin_unlock_irqrestore(&prtd->lock, flags);
+		break;
+	case APM_CLIENT_EVENT_DATA_WRITE_DONE:
+		spin_lock_irqsave(&prtd->lock, flags);
+		bytes_written = token >> APM_WRITE_TOKEN_LEN_SHIFT;
+		prtd->copied_total += bytes_written;
+		snd_compr_fragment_elapsed(substream);
+
+		if (prtd->state != Q6APM_STREAM_RUNNING) {
+			spin_unlock_irqrestore(&prtd->lock, flags);
+			break;
+		}
+
+		avail = prtd->bytes_received - prtd->bytes_sent;
+
+		if (avail > prtd->pcm_count) {
+			bytes_to_write = prtd->pcm_count;
+		} else {
+			if (substream->partial_drain || prtd->notify_on_drain)
+				is_last_buffer = true;
+			bytes_to_write = avail;
+		}
+
+		if (bytes_to_write) {
+			if (substream->partial_drain && is_last_buffer)
+				wflags |= APM_LAST_BUFFER_FLAG;
+
+			q6apm_write_async(prtd->graph,
+						bytes_to_write, 0, 0, wflags);
+
+			prtd->bytes_sent += bytes_to_write;
+
+			if (prtd->notify_on_drain && is_last_buffer)
+				audioreach_shared_memory_send_eos(prtd->graph);
+		}
+
+		spin_unlock_irqrestore(&prtd->lock, flags);
+		break;
+	default:
+		break;
+	}
+}
+
 static int q6apm_dai_prepare(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream)
 {
@@ -387,6 +453,75 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
 	return snd_pcm_set_fixed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV, component->dev, size);
 }
 
+static int q6apm_dai_compr_open(struct snd_soc_component *component,
+				struct snd_compr_stream *stream)
+{
+	struct snd_soc_pcm_runtime *rtd = stream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct q6apm_dai_rtd *prtd;
+	struct q6apm_dai_data *pdata;
+	struct device *dev = component->dev;
+	int ret, size;
+	int graph_id;
+
+	graph_id = cpu_dai->driver->id;
+	pdata = snd_soc_component_get_drvdata(component);
+	if (!pdata)
+		return -EINVAL;
+
+	prtd = kzalloc(sizeof(*prtd), GFP_KERNEL);
+	if (prtd == NULL)
+		return -ENOMEM;
+
+	prtd->cstream = stream;
+	prtd->graph = q6apm_graph_open(dev, (q6apm_cb)event_handler_compr, prtd, graph_id);
+	if (IS_ERR(prtd->graph)) {
+		ret = PTR_ERR(prtd->graph);
+		kfree(prtd);
+		return ret;
+	}
+
+	runtime->private_data = prtd;
+	runtime->dma_bytes = BUFFER_BYTES_MAX;
+	size = COMPR_PLAYBACK_MAX_FRAGMENT_SIZE * COMPR_PLAYBACK_MAX_NUM_FRAGMENTS;
+	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, dev, size, &prtd->dma_buffer);
+	if (ret)
+		return ret;
+
+	if (pdata->sid < 0)
+		prtd->phys = prtd->dma_buffer.addr;
+	else
+		prtd->phys = prtd->dma_buffer.addr | (pdata->sid << 32);
+
+	snd_compr_set_runtime_buffer(stream, &prtd->dma_buffer);
+	spin_lock_init(&prtd->lock);
+
+	q6apm_enable_compress_module(dev, prtd->graph, true);
+	return 0;
+}
+
+static int q6apm_dai_compr_free(struct snd_soc_component *component,
+				struct snd_compr_stream *stream)
+{
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct q6apm_dai_rtd *prtd = runtime->private_data;
+
+	q6apm_graph_stop(prtd->graph);
+	q6apm_unmap_memory_regions(prtd->graph, SNDRV_PCM_STREAM_PLAYBACK);
+	q6apm_graph_close(prtd->graph);
+	snd_dma_free_pages(&prtd->dma_buffer);
+	prtd->graph = NULL;
+	kfree(prtd);
+	runtime->private_data = NULL;
+
+	return 0;
+}
+static const struct snd_compress_ops q6apm_dai_compress_ops = {
+	.open		= q6apm_dai_compr_open,
+	.free		= q6apm_dai_compr_free,
+};
+
 static const struct snd_soc_component_driver q6apm_fe_dai_component = {
 	.name		= DRV_NAME,
 	.open		= q6apm_dai_open,
@@ -396,6 +531,7 @@ static const struct snd_soc_component_driver q6apm_fe_dai_component = {
 	.hw_params	= q6apm_dai_hw_params,
 	.pointer	= q6apm_dai_pointer,
 	.trigger	= q6apm_dai_trigger,
+	.compress_ops	= &q6apm_dai_compress_ops,
 };
 
 static int q6apm_dai_probe(struct platform_device *pdev)
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 87d67faf5f1a..d187d88c0a8c 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -45,6 +45,7 @@
 #define APM_WRITE_TOKEN_LEN_SHIFT              16
 
 #define APM_MAX_SESSIONS			8
+#define APM_LAST_BUFFER_FLAG			BIT(30)
 
 struct q6apm {
 	struct device *dev;
-- 
2.21.0

