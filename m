Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A370B68692F
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 15:57:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC472DF4;
	Wed,  1 Feb 2023 15:56:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC472DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675263463;
	bh=iyk2h6l3cRxVK1KLOnuN5bNkfA/DqWzJELoPuJNMDo4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=k8MiRObBmAPBWSRHrM/ipG2OzY+cWwbFpnA8GMRw56N+U/woBtZK43nR4gOEbbY1k
	 fauScV9H6epDaxa354An3YdADj3lA2I2qVDWtebZ0awabiEKOgk3COv9rRT7gQbDHJ
	 AAq5eh/AJstrPBDQXLsQmPddvxXaMWy4KjmjAc3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1DBBF805B6;
	Wed,  1 Feb 2023 15:53:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26DFAF80423; Wed,  1 Feb 2023 14:52:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98BBDF80155
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 14:52:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98BBDF80155
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=pcsHAQVW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1675259538; x=1706795538;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fTwWJ183TkLfIctrUFOAo5UbjiefjUCSyezVXnAaA1I=;
 b=pcsHAQVWs26+4ZOgpbJu72cew2nXMJENlSdBK0fQw/4LfjB7fBNpvwiJ
 AEGPma6r8StSxe1b1gSptfcWb4Fqfcu+CXkPuwUaCo7PTUhnRzF8wGZAb
 UQ14Cz+gj/MjQmGmUuUWvHoeLAekhcZKWOJMwBhPd2VTjCiJCNYtPocfg E=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Feb 2023 05:52:14 -0800
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 05:52:14 -0800
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 1 Feb 2023 05:52:08 -0800
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: <krzysztof.kozlowski+dt@linaro.org>, <agross@kernel.org>,
 <andersson@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <robh+dt@kernel.org>, <quic_plai@quicinc.com>, <bgoswami@quicinc.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>,
 <konrad.dybcio@linaro.org>
Subject: [PATCH 08/14] ASoC: q6dsp: q6apm-dai: Add open/free compress DAI
 callbacks
Date: Wed, 1 Feb 2023 19:19:41 +0530
Message-ID: <20230201134947.1638197-9-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201134947.1638197-1-quic_mohs@quicinc.com>
References: <20230201134947.1638197-1-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-Mailman-Approved-At: Wed, 01 Feb 2023 15:52:51 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add q6apm open and free compress DAI callbacks to support compress
offload playback.
Include compress event handler callback also.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 135 +++++++++++++++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index e621e31294a1..fd134c268189 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -27,6 +27,8 @@
 #define CAPTURE_MIN_PERIOD_SIZE		320
 #define BUFFER_BYTES_MAX (PLAYBACK_MAX_NUM_PERIODS * PLAYBACK_MAX_PERIOD_SIZE)
 #define BUFFER_BYTES_MIN (PLAYBACK_MIN_NUM_PERIODS * PLAYBACK_MIN_PERIOD_SIZE)
+#define COMPR_PLAYBACK_MAX_FRAGMENT_SIZE (128 * 1024)
+#define COMPR_PLAYBACK_MAX_NUM_FRAGMENTS (16 * 4)
 #define SID_MASK_DEFAULT	0xF
 
 enum stream_state {
@@ -130,6 +132,69 @@ static void event_handler(uint32_t opcode, uint32_t token, uint32_t *payload, vo
 	}
 }
 
+void event_handler_compr(uint32_t opcode, uint32_t token,
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
+			q6apm_write_async_compr(prtd->graph,
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
@@ -378,6 +443,75 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
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
@@ -387,6 +521,7 @@ static const struct snd_soc_component_driver q6apm_fe_dai_component = {
 	.hw_params	= q6apm_dai_hw_params,
 	.pointer	= q6apm_dai_pointer,
 	.trigger	= q6apm_dai_trigger,
+	.compress_ops	= &q6apm_dai_compress_ops,
 };
 
 static int q6apm_dai_probe(struct platform_device *pdev)
-- 
2.25.1

