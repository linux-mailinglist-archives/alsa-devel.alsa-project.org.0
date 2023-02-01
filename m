Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB1768692E
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 15:57:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F058783A;
	Wed,  1 Feb 2023 15:56:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F058783A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675263448;
	bh=I+CSt8LudURWbgk/XmMy6IeLJDKH6Qq62Lv1F5S3ZDw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=a2qGF4SfZt1ckceWX1iSXPiHfsCGtlR+UbbZ0Gjir2mYGERUndTVNCKK7BPJ6/P2W
	 Rvwms3BY5a9HtZkMd+nG+y9qRnofISirCjOw9pIjyzKOCwQVdxZCqIspxJ04YljSQL
	 +HOf/f0AUhS1OAT0Zgp+dcglo0bW/E2WkkzC6Pts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4782FF805B0;
	Wed,  1 Feb 2023 15:53:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2711F8045D; Wed,  1 Feb 2023 14:52:14 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B9A1F80246
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 14:52:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B9A1F80246
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=NZRbt7Lb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1675259530; x=1706795530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A1Kzs9T8+TOhd4iry5lc3Lb6N7RtLVEdrCFgO+0yH94=;
 b=NZRbt7LbuGOXHudaeDNSg7jdZAZUXaTTxKXgX8SsAvblCrmRl03Vvf+O
 8bJFVAIjFdtHCl9pApqhBq/ERAa/7qN85HBYw1G2S/kwak7oXAG2RCgzV
 Fd9Dq3jHY2cqFJ2U4H8Uwca5nyS5G0bj8ZdQDEbwxdCOLy8pp98oav2ef s=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Feb 2023 05:52:09 -0800
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
 by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 05:52:08 -0800
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 1 Feb 2023 05:52:03 -0800
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: <krzysztof.kozlowski+dt@linaro.org>, <agross@kernel.org>,
 <andersson@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <robh+dt@kernel.org>, <quic_plai@quicinc.com>, <bgoswami@quicinc.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>,
 <konrad.dybcio@linaro.org>
Subject: [PATCH 07/14] ASoC: q6dsp: q6apm-dai: Add async compress write support
Date: Wed, 1 Feb 2023 19:19:40 +0530
Message-ID: <20230201134947.1638197-8-quic_mohs@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201134947.1638197-1-quic_mohs@quicinc.com>
References: <20230201134947.1638197-1-quic_mohs@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

Add async compress write API to send the compressed audio data packet
to ADSP. 

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 38 +++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  2 ++
 sound/soc/qcom/qdsp6/q6apm-dai.c  |  7 +++++
 sound/soc/qcom/qdsp6/q6apm.c      | 46 +++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6apm.h      |  3 ++
 5 files changed, 96 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index e84ccbacc0f7..7c45c36e9156 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -240,6 +240,44 @@ void *audioreach_alloc_pkt(int payload_size, uint32_t opcode, uint32_t token,
 }
 EXPORT_SYMBOL_GPL(audioreach_alloc_pkt);
 
+static void __audioreach_update_pkt(struct gpr_pkt *pkt, int payload_size, uint32_t opcode,
+				    uint32_t token, uint32_t src_port, uint32_t dest_port,
+				    bool has_cmd_hdr)
+{
+	int pkt_size = GPR_HDR_SIZE + payload_size;
+	void *p;
+
+	if (has_cmd_hdr)
+		pkt_size += APM_CMD_HDR_SIZE;
+
+	p = pkt;
+	pkt->hdr.version = GPR_PKT_VER;
+	pkt->hdr.hdr_size = GPR_PKT_HEADER_WORD_SIZE;
+	pkt->hdr.pkt_size = pkt_size;
+	pkt->hdr.dest_port = dest_port;
+	pkt->hdr.src_port = src_port;
+
+	pkt->hdr.dest_domain = GPR_DOMAIN_ID_ADSP;
+	pkt->hdr.src_domain = GPR_DOMAIN_ID_APPS;
+	pkt->hdr.token = token;
+	pkt->hdr.opcode = opcode;
+
+	if (has_cmd_hdr) {
+		struct apm_cmd_header *cmd_header;
+
+		p = p + GPR_HDR_SIZE;
+		cmd_header = p;
+		cmd_header->payload_size = payload_size;
+	}
+}
+
+void audioreach_update_pkt(struct gpr_pkt *pkt, int payload_size, uint32_t opcode, uint32_t token,
+			   uint32_t src_port, uint32_t dest_port)
+{
+	__audioreach_update_pkt(pkt, payload_size, opcode, token, src_port, dest_port, false);
+}
+EXPORT_SYMBOL_GPL(audioreach_update_pkt);
+
 void *audioreach_alloc_apm_pkt(int pkt_size, uint32_t opcode, uint32_t token, uint32_t src_port)
 {
 	return __audioreach_alloc_pkt(pkt_size, opcode, token, src_port, APM_MODULE_INSTANCE_ID,
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 0faaf75115fd..044994ca4811 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -788,4 +788,6 @@ int audioreach_remove_trailing_silence(struct q6apm *apm, struct audioreach_modu
 				uint32_t trailing_samples);
 int audioreach_compr_set_param(struct q6apm_graph *graph, struct audioreach_module_config *mcfg);
 int audioreach_set_real_module_id(struct q6apm *apm, struct audioreach_module *module, uint32_t id);
+void audioreach_update_pkt(struct gpr_pkt *pkt, int payload_size, uint32_t opcode,
+			   uint32_t token, uint32_t src_port, uint32_t dest_port);
 #endif /* __AUDIOREACH_H__ */
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 8f5d744b3365..e621e31294a1 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -38,8 +38,10 @@ enum stream_state {
 struct q6apm_dai_rtd {
 	struct snd_pcm_substream *substream;
 	struct snd_compr_stream *cstream;
+	struct snd_codec codec;
 	struct snd_compr_params codec_param;
 	struct snd_dma_buffer dma_buffer;
+	spinlock_t lock;
 	phys_addr_t phys;
 	unsigned int pcm_size;
 	unsigned int pcm_count;
@@ -51,8 +53,13 @@ struct q6apm_dai_rtd {
 	uint16_t bits_per_sample;
 	uint16_t source; /* Encoding source bit mask */
 	uint16_t session_id;
+	bool next_track;
 	enum stream_state state;
 	struct q6apm_graph *graph;
+	uint32_t initial_samples_drop;
+	uint32_t trailing_samples_drop;
+	uint32_t next_track_stream_id;
+	bool notify_on_drain;
 };
 
 struct q6apm_dai_data {
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 811d86bdc092..1a6c7108bae0 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -25,6 +25,8 @@ struct apm_graph_mgmt_cmd {
 	uint32_t sub_graph_id_list[];
 } __packed;
 
+struct gpr_pkt *pkt;
+
 #define APM_GRAPH_MGMT_PSIZE(p, n) ALIGN(struct_size(p, sub_graph_id_list, n), 8)
 
 struct q6apm *g_apm;
@@ -457,6 +459,45 @@ int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 }
 EXPORT_SYMBOL_GPL(q6apm_write_async);
 
+int q6apm_write_async_compr(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
+		      uint32_t lsw_ts, uint32_t wflags)
+{
+	struct apm_data_cmd_wr_sh_mem_ep_data_buffer_v2 *write_buffer;
+	struct audio_buffer *ab;
+
+	int rc, iid;
+
+	iid = q6apm_graph_get_rx_shmem_module_iid(graph);
+
+	audioreach_update_pkt(pkt, sizeof(*write_buffer), DATA_CMD_WR_SH_MEM_EP_DATA_BUFFER_V2,
+			      graph->rx_data.dsp_buf | (len << APM_WRITE_TOKEN_LEN_SHIFT),
+			      graph->port->id, iid);
+
+	write_buffer = (void *)pkt + GPR_HDR_SIZE;
+
+	ab = &graph->rx_data.buf[graph->rx_data.dsp_buf];
+
+	write_buffer->buf_addr_lsw = lower_32_bits(ab->phys);
+	write_buffer->buf_addr_msw = upper_32_bits(ab->phys);
+	write_buffer->buf_size = len;
+	write_buffer->timestamp_lsw = lsw_ts;
+	write_buffer->timestamp_msw = msw_ts;
+	write_buffer->mem_map_handle = graph->rx_data.mem_map_handle;
+	write_buffer->flags = wflags;
+
+	graph->rx_data.dsp_buf++;
+
+	if (graph->rx_data.dsp_buf >= graph->rx_data.num_periods)
+		graph->rx_data.dsp_buf = 0;
+
+	rc = gpr_send_port_pkt(graph->port, pkt);
+
+	memset(pkt, 0, sizeof(write_buffer) + GPR_HDR_SIZE);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(q6apm_write_async_compr);
+
 int q6apm_read(struct q6apm_graph *graph)
 {
 	struct data_cmd_rd_sh_mem_ep_data_buffer_v2 *read_buffer;
@@ -724,6 +765,11 @@ static int apm_probe(gpr_device_t *gdev)
 
 	dev_set_drvdata(dev, apm);
 
+	pkt = devm_kzalloc(dev, sizeof(struct apm_data_cmd_wr_sh_mem_ep_data_buffer_v2) +
+			   GPR_HDR_SIZE, GFP_KERNEL);
+	if (!pkt)
+		return -ENOMEM;
+
 	mutex_init(&apm->lock);
 	apm->dev = dev;
 	apm->gdev = gdev;
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 87d67faf5f1a..630c2bca0f06 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -45,6 +45,7 @@
 #define APM_WRITE_TOKEN_LEN_SHIFT              16
 
 #define APM_MAX_SESSIONS			8
+#define APM_LAST_BUFFER_FLAG			BIT(30)
 
 struct q6apm {
 	struct device *dev;
@@ -128,6 +129,8 @@ int q6apm_send_eos_nowait(struct q6apm_graph *graph);
 int q6apm_read(struct q6apm_graph *graph);
 int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 		      uint32_t lsw_ts, uint32_t wflags);
+int q6apm_write_async_compr(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
+			    uint32_t lsw_ts, uint32_t wflags);
 
 /* Memory Map related */
 int q6apm_map_memory_regions(struct q6apm_graph *graph,
-- 
2.25.1

