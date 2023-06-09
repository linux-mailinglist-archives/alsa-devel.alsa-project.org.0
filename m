Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5DB729D79
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:55:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA5BCDF5;
	Fri,  9 Jun 2023 16:54:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA5BCDF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322548;
	bh=Z4aZ7UoieQXmMmJvAM7v7QCJvzDxN0YKXHOpaKVcrXU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kIyb6SGwJzAVJ1M58hXrOi+bhAQCGMlVP5PLq6A244y5imFbXDotksd/0CRfOzL1T
	 KOJrnZ6oYh8elY+NUlFcRRuO5h/++GZM6xktdz2wr8/Xuq0HecnH6jx6y/LR2mwbVr
	 XJ/OCplKRkEifk4IcZtnWwO+vcmdZh+nO36Xh6Dg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA2D2F80579; Fri,  9 Jun 2023 16:54:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4001DF80551;
	Fri,  9 Jun 2023 16:54:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64A03F80494; Fri,  9 Jun 2023 16:54:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CEAADF800ED
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 16:54:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEAADF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Vd0Vf8OB
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f7f4819256so14388085e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Jun 2023 07:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686322465; x=1688914465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xT6jIsaE6umxJp6LYKmlwleIfCNa53LIehUuB1/ryv8=;
        b=Vd0Vf8OBk3PGtxmzsgVG4KAb8TUnZ4cZkGdqyFQPd2LRpjIA1MektKV2tRCWG32Wpn
         ic7pvZymZ/UHYoGO6M1V2I7d3Grr2X8GSdTmwESak18rlmeaVKw2CuJXpW9nDQEEqFjN
         RuvQRXbG6FVfBxsJfrFVKniPlzeAnVkxHpX8t3lRyyuaixfVaLC2bojtgpuRrHiF2FU9
         /AfQPO3ko7eQOLu7XYpwjzBjlDVOC/gjC4fqAhWEgpWaCVkXBm44IUO8nURx2TxI6Wvk
         AH7tqyelW+2h1zk7Kvnsd9fg5RduXVDPiEKVxNAacgYgSsGaYovXDo6BdvG9azXxMb+D
         JajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686322465; x=1688914465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xT6jIsaE6umxJp6LYKmlwleIfCNa53LIehUuB1/ryv8=;
        b=SEPCv4rYKRnO5ReDiZGE19uVD7GPTPah5ARlfRVIkTETRK5Fk6vwgYkNOiYYAhe3gA
         owD6rVjmFQ5mtCvRGWzcNymC98kxd0wubk+S6bkkoPaHvgkGT8G8/Q39dGZvcdxnEpPv
         vESXYXYzOK2Vl2h1VBLFibvYjfZn2BzX2bGi/XrxX9B8/dTFiFb6vVarjIXo2MkrXClX
         u1DJSwYdy8aMoQ7NP/MiFetYj4bm+9739DIVWzU1JUh97DNqYo1uBK7hBv3onkPo2NL+
         utxLmoR9ChWbqNygzyhzpSAcQ7kZwgNx5joluUgAX4Ftk4kstdyA1XwH3QX6/y31E5Yp
         xqOg==
X-Gm-Message-State: AC+VfDw6v4kmJA8CwjlZmz1dRJZW/4rWQvW9noYigPjZ/AjZKOcWzBKZ
	zo2iwz1LuOfvWLXtg9T0ITDtsvmODobP0BmmXdo=
X-Google-Smtp-Source: 
 ACHHUZ6NM+CuWRv9gxLexLQhJhCThjo5KuWFrA2fMwfi0ZS4s5lwkEQbk/XKpw8R0FsppMO3HSGbTQ==
X-Received: by 2002:a1c:ed15:0:b0:3f7:f584:579d with SMTP id
 l21-20020a1ced15000000b003f7f584579dmr1058428wmh.0.1686322465617;
        Fri, 09 Jun 2023 07:54:25 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0ad500b003f7310a3ffasm2946632wmr.2.2023.06.09.07.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:54:24 -0700 (PDT)
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
Subject: [PATCH v2 04/11] ASoC: q6dsp: audioreach: Add placeholder decoder for
 compress playback
Date: Fri,  9 Jun 2023 15:54:00 +0100
Message-Id: <20230609145407.18774-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230609145407.18774-1-srinivas.kandagatla@linaro.org>
References: <20230609145407.18774-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AV3MVXWXWYGT4247FDYY6MP3SHWFCBWX
X-Message-ID-Hash: AV3MVXWXWYGT4247FDYY6MP3SHWFCBWX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AV3MVXWXWYGT4247FDYY6MP3SHWFCBWX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add placeholder decoder graph module for compressed playback feature.

Co-developed-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.h | 14 +++++++
 sound/soc/qcom/qdsp6/q6apm.c      | 65 +++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6apm.h      |  4 ++
 3 files changed, 83 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 18d8d243b06b..c4e03a49ac82 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -15,6 +15,8 @@ struct q6apm_graph;
 #define MODULE_ID_PCM_CNV		0x07001003
 #define MODULE_ID_PCM_ENC		0x07001004
 #define MODULE_ID_PCM_DEC		0x07001005
+#define MODULE_ID_PLACEHOLDER_ENCODER	0x07001008
+#define MODULE_ID_PLACEHOLDER_DECODER	0x07001009
 #define MODULE_ID_SAL			0x07001010
 #define MODULE_ID_MFC			0x07001015
 #define MODULE_ID_CODEC_DMA_SINK	0x07001023
@@ -22,6 +24,9 @@ struct q6apm_graph;
 #define MODULE_ID_I2S_SINK		0x0700100A
 #define MODULE_ID_I2S_SOURCE		0x0700100B
 #define MODULE_ID_DATA_LOGGING		0x0700101A
+#define MODULE_ID_AAC_DEC		0x0700101F
+#define MODULE_ID_FLAC_DEC		0x0700102F
+#define MODULE_ID_MP3_DECODE		0x0700103B
 #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
 
 #define APM_CMD_GET_SPF_STATE		0x01001021
@@ -608,6 +613,15 @@ struct param_id_vol_ctrl_master_gain {
 } __packed;
 
 
+#define PARAM_ID_REMOVE_INITIAL_SILENCE		0x0800114B
+#define PARAM_ID_REMOVE_TRAILING_SILENCE	0x0800115D
+
+#define PARAM_ID_REAL_MODULE_ID	0x0800100B
+
+struct param_id_placeholder_real_module_id {
+	uint32_t real_module_id;
+} __packed;
+
 /* Graph */
 struct audioreach_connection {
 	/* Connections */
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index b07fee8ccac1..7bfac9492ab5 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -298,6 +298,71 @@ int q6apm_unmap_memory_regions(struct q6apm_graph *graph, unsigned int dir)
 }
 EXPORT_SYMBOL_GPL(q6apm_unmap_memory_regions);
 
+int q6apm_remove_initial_silence(struct device *dev, struct q6apm_graph *graph, uint32_t samples)
+{
+	struct audioreach_module *module;
+
+	module = q6apm_find_module_by_mid(graph, MODULE_ID_PLACEHOLDER_DECODER);
+	if (!module)
+		return -ENODEV;
+
+	return audioreach_send_u32_param(graph, module, PARAM_ID_REMOVE_INITIAL_SILENCE, samples);
+}
+EXPORT_SYMBOL_GPL(q6apm_remove_initial_silence);
+
+int q6apm_remove_trailing_silence(struct device *dev, struct q6apm_graph *graph, uint32_t samples)
+{
+	struct audioreach_module *module;
+
+	module = q6apm_find_module_by_mid(graph, MODULE_ID_PLACEHOLDER_DECODER);
+	if (!module)
+		return -ENODEV;
+
+	return audioreach_send_u32_param(graph, module, PARAM_ID_REMOVE_TRAILING_SILENCE, samples);
+}
+EXPORT_SYMBOL_GPL(q6apm_remove_trailing_silence);
+
+int q6apm_enable_compress_module(struct device *dev, struct q6apm_graph *graph, bool en)
+{
+	struct audioreach_module *module;
+
+	module = q6apm_find_module_by_mid(graph, MODULE_ID_PLACEHOLDER_DECODER);
+	if (!module)
+		return -ENODEV;
+
+	return audioreach_send_u32_param(graph, module, PARAM_ID_MODULE_ENABLE, en);
+}
+EXPORT_SYMBOL_GPL(q6apm_enable_compress_module);
+
+int q6apm_set_real_module_id(struct device *dev, struct q6apm_graph *graph,
+			     uint32_t codec_id)
+{
+	struct audioreach_module *module;
+	uint32_t module_id;
+
+	module = q6apm_find_module_by_mid(graph, MODULE_ID_PLACEHOLDER_DECODER);
+	if (!module)
+		return -ENODEV;
+
+	switch (codec_id) {
+	case SND_AUDIOCODEC_MP3:
+		module_id = MODULE_ID_MP3_DECODE;
+		break;
+	case SND_AUDIOCODEC_AAC:
+		module_id = MODULE_ID_AAC_DEC;
+		break;
+	case SND_AUDIOCODEC_FLAC:
+		module_id = MODULE_ID_FLAC_DEC;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return audioreach_send_u32_param(graph, module, PARAM_ID_REAL_MODULE_ID,
+					 module_id);
+}
+EXPORT_SYMBOL_GPL(q6apm_set_real_module_id);
+
 int q6apm_graph_media_format_pcm(struct q6apm_graph *graph, struct audioreach_module_config *cfg)
 {
 	struct audioreach_graph_info *info = graph->info;
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 7005be9b63e3..87d67faf5f1a 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -147,4 +147,8 @@ int q6apm_graph_get_rx_shmem_module_iid(struct q6apm_graph *graph);
 
 bool q6apm_is_adsp_ready(void);
 
+int q6apm_enable_compress_module(struct device *dev, struct q6apm_graph *graph, bool en);
+int q6apm_remove_initial_silence(struct device *dev, struct q6apm_graph *graph, uint32_t samples);
+int q6apm_remove_trailing_silence(struct device *dev, struct q6apm_graph *graph, uint32_t samples);
+int q6apm_set_real_module_id(struct device *dev, struct q6apm_graph *graph, uint32_t codec_id);
 #endif /* __APM_GRAPH_ */
-- 
2.21.0

