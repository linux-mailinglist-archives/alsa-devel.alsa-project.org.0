Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7278686929
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 15:56:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35EA0E10;
	Wed,  1 Feb 2023 15:56:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35EA0E10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675263416;
	bh=zkQXFBr7RQAlXwCNvI+tNEdh5udRzY+tZJNyrixPgmQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kxmCxfYyfZk+gVOkj2sS6eVLLlxiW6foeHNQFglsqhsDOzu1mQEQa0xOppTuPLygv
	 6sdsNz1DR+9FqSutXwOMLxzNWFR6sPnd1HN0IWmbkLMOxSBL5cBLrRJEdRiq3N5po3
	 5mv/u0BTyO8bqpE6W9OARsT972vkNfP9oU8SJJXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38DB5F805AA;
	Wed,  1 Feb 2023 15:52:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22C90F8045D; Wed,  1 Feb 2023 14:52:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16E04F8032B
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 14:51:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16E04F8032B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=mimpPL5L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1675259519; x=1706795519;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V7EmJUdAxv6/nKFaKh+7o2Yn5gFfRK96nWW8cz9JF/8=;
 b=mimpPL5LP/XzYY3zFY4xwvoZbPiVzLt/FsZidsQ2MbTviPszwAZMXXnF
 ghCYr5Yn7tnZuJCyKujV02RrvlsoBxIbz1Uv7TOYBbf+c0N/Js2fAkFcA
 CeRDr186wV0YqYObWt/4U255wsoFWxNg0d6x64K8y9ZF28Loj4ulqmVR4 s=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Feb 2023 05:51:57 -0800
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 05:51:57 -0800
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 1 Feb 2023 05:51:51 -0800
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: <krzysztof.kozlowski+dt@linaro.org>, <agross@kernel.org>,
 <andersson@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <robh+dt@kernel.org>, <quic_plai@quicinc.com>, <bgoswami@quicinc.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>,
 <konrad.dybcio@linaro.org>
Subject: [PATCH 05/14] ASoC: q6dsp: audioreach: Add support to set compress
 params
Date: Wed, 1 Feb 2023 19:19:38 +0530
Message-ID: <20230201134947.1638197-6-quic_mohs@quicinc.com>
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

Add function for setting compress params to set the next track
parameters during gapless playback.

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 51 +++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  1 +
 sound/soc/qcom/qdsp6/q6apm-dai.c  |  1 +
 3 files changed, 53 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index a11bab69a676..a87df09d187f 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1314,3 +1314,54 @@ int audioreach_enable_module(struct q6apm *apm, struct audioreach_module *module
 	return audioreach_send_u32_param(apm, module, PARAM_ID_MODULE_ENABLE, en);
 }
 EXPORT_SYMBOL_GPL(audioreach_enable_module);
+
+int audioreach_compr_set_param(struct q6apm_graph *graph, struct audioreach_module_config *mcfg)
+{
+	struct media_format *header;
+	struct gpr_pkt *pkt;
+	struct payload_media_fmt_pcm *cfg;
+	uint32_t num_channels = mcfg->num_channels;
+	int iid, payload_size, rc;
+	void *p;
+
+	payload_size = sizeof(struct apm_sh_module_media_fmt_cmd);
+
+	iid = q6apm_graph_get_rx_shmem_module_iid(graph);
+	pkt = audioreach_alloc_cmd_pkt(payload_size, DATA_CMD_WR_SH_MEM_EP_MEDIA_FORMAT,
+			0, graph->port->id, iid);
+
+	if (IS_ERR(pkt))
+		return -ENOMEM;
+
+	p = (void *)pkt + GPR_HDR_SIZE;
+	header = p;
+
+	if (mcfg->fmt == SND_AUDIOCODEC_PCM) {
+		header->data_format = DATA_FORMAT_FIXED_POINT;
+		header->fmt_id =  MEDIA_FMT_ID_PCM;
+		header->payload_size = sizeof(*cfg);
+
+		p = p + sizeof(*header);
+		cfg = p;
+		cfg->sample_rate = mcfg->sample_rate;
+		cfg->bit_width = mcfg->bit_width;
+		cfg->alignment = PCM_LSB_ALIGNED;
+		cfg->bits_per_sample = mcfg->bit_width;
+		cfg->q_factor = mcfg->bit_width - 1;
+		cfg->endianness = PCM_LITTLE_ENDIAN;
+		cfg->num_channels = mcfg->num_channels;
+
+		if (mcfg->num_channels == 1)
+			cfg->channel_mapping[0] =  PCM_CHANNEL_L;
+		else if (num_channels == 2) {
+			cfg->channel_mapping[0] =  PCM_CHANNEL_L;
+			cfg->channel_mapping[1] =  PCM_CHANNEL_R;
+		}
+	}
+
+	rc = gpr_send_port_pkt(graph->port, pkt);
+	kfree(pkt);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(audioreach_compr_set_param);
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 76dea97773cc..4c4bdff45cf1 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -786,4 +786,5 @@ int audioreach_remove_initial_silence(struct q6apm *apm, struct audioreach_modul
 				uint32_t initial_samples);
 int audioreach_remove_trailing_silence(struct q6apm *apm, struct audioreach_module *module,
 				uint32_t trailing_samples);
+int audioreach_compr_set_param(struct q6apm_graph *graph, struct audioreach_module_config *mcfg);
 #endif /* __AUDIOREACH_H__ */
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index ee59ef36b85a..8f5d744b3365 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -146,6 +146,7 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 	cfg.sample_rate = runtime->rate;
 	cfg.num_channels = runtime->channels;
 	cfg.bit_width = prtd->bits_per_sample;
+	cfg.fmt = SND_AUDIOCODEC_PCM;
 
 	if (prtd->state) {
 		/* clear the previous setup if any  */
-- 
2.25.1

