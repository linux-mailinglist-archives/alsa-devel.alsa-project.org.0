Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEB468692D
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 15:57:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F39AAEA;
	Wed,  1 Feb 2023 15:56:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F39AAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675263431;
	bh=Z+fQqCo6svskVju7BYdoSbcJ7JIGMbdlmMue1uibi3M=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=srj0hVBvD138TQ6FT1bSdIV6ASDHZI99T1WDmETNWUDyu4KDMavGTrsNUhuskwXXz
	 1knCu+aX/O/YGC1yyDPvIi/YymX7w7arojqXQ4FF9zE5zsXO363ehszaHPML8r4Rgt
	 yN+RuUVjx+DKfQTBiFTlb0ZPy4/8iau7I/YxoWzs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3CFAF805AD;
	Wed,  1 Feb 2023 15:52:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A228F80423; Wed,  1 Feb 2023 14:52:09 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 886FEF80155
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 14:52:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 886FEF80155
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=Yq9h45EO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1675259527; x=1706795527;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cBi3BvKRnXTZgu2O0Zhf99/PEr4TAL6EjVv9z1gkLTQ=;
 b=Yq9h45EOMuxdb37CP7HWD0ZGx3j3lvBYKI/B+toXYxjVOxQJnIOQNwzl
 jmJvroMDrtUKAVi4AUskq/+aNib7G350mEsHR8iScV//JmbQNKgLtl6ux
 z+tHKZ6TkxLx7toHDQgQo3HKkFs8vbqlW1exsPCRvHS0sL/Vv76msOngM s=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Feb 2023 05:52:04 -0800
X-QCInternal: smtphost
Received: from nalasex01b.na.qualcomm.com ([10.47.209.197])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2023 05:52:04 -0800
Received: from hu-mohs-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 1 Feb 2023 05:51:57 -0800
From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: <krzysztof.kozlowski+dt@linaro.org>, <agross@kernel.org>,
 <andersson@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <robh+dt@kernel.org>, <quic_plai@quicinc.com>, <bgoswami@quicinc.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>,
 <konrad.dybcio@linaro.org>
Subject: [PATCH 06/14] ASoC: q6dsp: audioreach: Add support for sending real
 module ID to ADSP
Date: Wed, 1 Feb 2023 19:19:39 +0530
Message-ID: <20230201134947.1638197-7-quic_mohs@quicinc.com>
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

Add support for sending the placeholder real module ID to ADSP
for enabling compressed playback. 

Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c |  6 ++++++
 sound/soc/qcom/qdsp6/audioreach.h |  1 +
 sound/soc/qcom/qdsp6/q6apm.c      | 29 +++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6apm.h      |  1 +
 4 files changed, 37 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index a87df09d187f..e84ccbacc0f7 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -1315,6 +1315,12 @@ int audioreach_enable_module(struct q6apm *apm, struct audioreach_module *module
 }
 EXPORT_SYMBOL_GPL(audioreach_enable_module);
 
+int audioreach_set_real_module_id(struct q6apm *apm, struct audioreach_module *module, uint32_t id)
+{
+	return audioreach_send_u32_param(apm, module, PARAM_ID_REAL_MODULE_ID, id);
+}
+EXPORT_SYMBOL_GPL(audioreach_set_real_module_id);
+
 int audioreach_compr_set_param(struct q6apm_graph *graph, struct audioreach_module_config *mcfg)
 {
 	struct media_format *header;
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 4c4bdff45cf1..0faaf75115fd 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -787,4 +787,5 @@ int audioreach_remove_initial_silence(struct q6apm *apm, struct audioreach_modul
 int audioreach_remove_trailing_silence(struct q6apm *apm, struct audioreach_module *module,
 				uint32_t trailing_samples);
 int audioreach_compr_set_param(struct q6apm_graph *graph, struct audioreach_module_config *mcfg);
+int audioreach_set_real_module_id(struct q6apm *apm, struct audioreach_module *module, uint32_t id);
 #endif /* __AUDIOREACH_H__ */
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 78c1a7c13348..811d86bdc092 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -336,6 +336,35 @@ int q6apm_enable_compress_module(struct device *dev, struct q6apm_graph *graph,
 }
 EXPORT_SYMBOL_GPL(q6apm_enable_compress_module);
 
+int q6apm_set_real_module_id(struct device *dev, struct q6apm_graph *graph,
+			     uint32_t codec_id)
+{
+	struct q6apm *apm = dev_get_drvdata(dev->parent);
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
+	return audioreach_set_real_module_id(apm, module, module_id);
+}
+EXPORT_SYMBOL_GPL(q6apm_set_real_module_id);
+
 int q6apm_graph_media_format_pcm(struct q6apm_graph *graph, struct audioreach_module_config *cfg)
 {
 	struct audioreach_graph_info *info = graph->info;
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 08b64f78c750..87d67faf5f1a 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -150,4 +150,5 @@ bool q6apm_is_adsp_ready(void);
 int q6apm_enable_compress_module(struct device *dev, struct q6apm_graph *graph, bool en);
 int q6apm_remove_initial_silence(struct device *dev, struct q6apm_graph *graph, uint32_t samples);
 int q6apm_remove_trailing_silence(struct device *dev, struct q6apm_graph *graph, uint32_t samples);
+int q6apm_set_real_module_id(struct device *dev, struct q6apm_graph *graph, uint32_t codec_id);
 #endif /* __APM_GRAPH_ */
-- 
2.25.1

