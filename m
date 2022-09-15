Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7005B9B14
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 14:41:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AC2E1A44;
	Thu, 15 Sep 2022 14:40:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AC2E1A44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663245688;
	bh=V5bumPW+jboeRMGtIeZf0W6+roAzSFRJKsP1l5XT9lE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=omaJV9qRHtY0hI/X7ClvS8i40jdvqrOYEgkcxcuYht4hvhpoe6W8psZGF9l3uE9cD
	 J6W8Dmpd95psQ+s92nUWj0gasnCSNoJks5wWDleObl4r3saydg/mOLmxBPrUtshIxw
	 ZPZL4DpdNe+9Ny0s8SCM325SSkLQGpjah4tpzFIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C0A3F8055B;
	Thu, 15 Sep 2022 14:39:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 438A5F8054A; Thu, 15 Sep 2022 14:39:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1F6BF80533
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 14:38:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1F6BF80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="YMFknw/g"
Received: by mail-wm1-x32b.google.com with SMTP id
 az24-20020a05600c601800b003a842e4983cso13746552wmb.0
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 05:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=kAZv18kXUCWvtykG7jA+P3fmOwgdcns1b4nN2opdgaY=;
 b=YMFknw/gQEtWbcY+cioCGHrSwKgqjFxxHJwyAqoumz4tOkxkqnUddkpsA7CAIzwlrN
 4/awiX3hVFI7KsTyhb1dFB0ePEqgPiE6Z5mavLAfOrnu8QqUkoceZVVOUIyvqplAfkcZ
 Y4DjTbc246HdSWob43dnvAF/83xlSK0/zdlxLRGOb2LE+nbVH95Pj/IILTtsYj2849+N
 eCtmMpSAROPRhmqlfZtcAxFjv2/WstYnhUW6U60ZMKitRT3sAJb7vgPaGv0wF3+kPaV6
 yJp4oAhOwtwvPjypl+OnbRhau0lasiDEReesQTxqufJz0lFYrlZ3MRog/qaswFlzDhpl
 RMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=kAZv18kXUCWvtykG7jA+P3fmOwgdcns1b4nN2opdgaY=;
 b=xU6iqDJRFy1X1+dQ9gSiTyDexG+aPO/8cJROumRlQi9EMZFcaAlHhW0Zy7wj2Ayo0Y
 phqGLriLFjbz6hvbnsds3wPPdWliTm+yMPZ8JHUEtN3Qh0cEaCzIR4k2+QsrQr7h2iWE
 3Is5LOhHpSwZexFhwDOsaL+2UdNz0Z/cT60DVmWgPYzQ9QbuJNVgY+4DO5pefyUo4JoQ
 X6zijxOvoS8z+ycwCEb/ENh4N+TMffDM1XvWkB2JrnwM7W26OFqsJQ6oKioIb8U5c+0B
 q+AChhBUXMeb7s6R9TB7nEYHc48uoY+A9kFArFZRGRQIFx1rgum1AL3RBnG14q3Kdd6a
 R1Xg==
X-Gm-Message-State: ACgBeo0ZWPkhNFaU/ofk+Rfy4sCxTP9EXow6qklWvWQ52BUvKcSzmrIy
 qStJEXj8OcCogzq/aXjlsQPW2w==
X-Google-Smtp-Source: AA6agR51zM7l4hwR8w1N1Qc0v/BpSnm9BXj7bIPvQC+ORcdIgdiz0yE/u3RyjnyeQ7ftseSMyCQf1g==
X-Received: by 2002:a1c:f217:0:b0:3a6:61f2:a9c2 with SMTP id
 s23-20020a1cf217000000b003a661f2a9c2mr6600625wmc.88.1663245538291; 
 Thu, 15 Sep 2022 05:38:58 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 bg13-20020a05600c3c8d00b003a5f4fccd4asm3112559wmb.35.2022.09.15.05.38.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 05:38:57 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 7/9] ASoC: qdsp6: audioreach: add support to enable SAL Module
Date: Thu, 15 Sep 2022 13:38:35 +0100
Message-Id: <20220915123837.11591-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220915123837.11591-1-srinivas.kandagatla@linaro.org>
References: <20220915123837.11591-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bgoswami@quicinc.com, linux-kernel@vger.kernel.org
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

Add support to Simple Accumulator-Limiter module.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 76 +++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h | 11 +++++
 2 files changed, 87 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 37f1408f6f6f..168bc3020b74 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -656,6 +656,77 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 	return rc;
 }
 
+static int audioreach_sal_limiter_enable(struct q6apm_graph *graph,
+					 struct audioreach_module *module, bool enable)
+{
+	struct apm_module_param_data *param_data;
+	struct param_id_sal_limiter_enable *limiter_enable;
+	int payload_size;
+	struct gpr_pkt *pkt;
+	int rc;
+	void *p;
+
+	payload_size = sizeof(*limiter_enable) + APM_MODULE_PARAM_DATA_SIZE;
+
+	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	param_data = p;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_SAL_LIMITER_ENABLE;
+	param_data->param_size = sizeof (*limiter_enable);
+	p = p + APM_MODULE_PARAM_DATA_SIZE;
+	limiter_enable = p;
+
+	limiter_enable->enable_lim = enable;
+
+	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
+static int audioreach_sal_set_media_format(struct q6apm_graph *graph,
+					   struct audioreach_module *module,
+					   struct audioreach_module_config *cfg)
+{
+	struct apm_module_param_data *param_data;
+	struct param_id_sal_output_config *media_format;
+	int payload_size;
+	struct gpr_pkt *pkt;
+	int rc;
+	void *p;
+
+	payload_size = sizeof(*media_format) + APM_MODULE_PARAM_DATA_SIZE;
+
+	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	param_data = p;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_SAL_OUTPUT_CFG;
+	param_data->param_size = sizeof (*media_format);
+	p = p + APM_MODULE_PARAM_DATA_SIZE;
+	media_format = p;
+
+	media_format->bits_per_sample = cfg->bit_width;
+
+	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
 static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
 					   struct audioreach_module *module,
 					   struct audioreach_module_config *cfg)
@@ -976,6 +1047,11 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
 	case MODULE_ID_CODEC_DMA_SOURCE:
 		rc = audioreach_codec_dma_set_media_format(graph, module, cfg);
 		break;
+	case MODULE_ID_SAL:
+		audioreach_sal_set_media_format(graph, module, cfg);
+		audioreach_sal_limiter_enable(graph, module, true);
+		break;
+
 	default:
 		rc = 0;
 	}
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index df5026b646c1..f2b51d8fc718 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -15,6 +15,7 @@ struct q6apm_graph;
 #define MODULE_ID_PCM_CNV		0x07001003
 #define MODULE_ID_PCM_ENC		0x07001004
 #define MODULE_ID_PCM_DEC		0x07001005
+#define MODULE_ID_SAL			0x07001010
 #define MODULE_ID_CODEC_DMA_SINK	0x07001023
 #define MODULE_ID_CODEC_DMA_SOURCE	0x07001024
 #define MODULE_ID_I2S_SINK		0x0700100A
@@ -499,6 +500,16 @@ struct data_logging_config {
 	uint32_t mode;
 } __packed;
 
+#define PARAM_ID_SAL_OUTPUT_CFG			0x08001016
+struct param_id_sal_output_config {
+	uint32_t bits_per_sample;
+} __packed;
+
+#define PARAM_ID_SAL_LIMITER_ENABLE		0x0800101E
+struct param_id_sal_limiter_enable {
+	uint32_t enable_lim;
+} __packed;
+
 #define PARAM_ID_MFC_OUTPUT_MEDIA_FORMAT	0x08001024
 
 struct param_id_mfc_media_format {
-- 
2.21.0

