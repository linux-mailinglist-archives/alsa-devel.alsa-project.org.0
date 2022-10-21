Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A78607CFB
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 18:56:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A520E986D;
	Fri, 21 Oct 2022 18:55:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A520E986D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666371381;
	bh=zGNX26wRGMW8PmMgKc1z3oI9pC4j8a9LejcTjW3Mykg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MchHGCI9oldTc8fp3LaEJdsJ8FvfYV9lgsCbWa8HWlJi0WXYdh2KehSDZBex8YDTv
	 o9SMTdAiDkHFjZ8hX+guHxoV8YivxB/EDHY1O7TA+i1IPruZDqYB5aTNNYNZnJqgFL
	 fvNoFqpsfDc25AtnS2F1WoiLgiOKpIegok8487YM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6BDBF8059F;
	Fri, 21 Oct 2022 18:53:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E41BF80589; Fri, 21 Oct 2022 18:53:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A2A0F80558
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 18:53:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A2A0F80558
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ETL3DvzL"
Received: by mail-wr1-x435.google.com with SMTP id b4so5957485wrs.1
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 09:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XRksJXQbYrRhqCpyqmwfEWWPK1xGzs4Mo3xZYXwQ8qI=;
 b=ETL3DvzLayvhN6lct9pEKhf6AIC3RMKL/sYqgiaYuuG9Atl2eKXV0r5PI/h9+pcPft
 r9gJEdYSK5QnUBSQs1NwQvvN6oNNoyxdpgdBUeUzIU/ukzeDlU5aPXICNGTNwammybIV
 3Up5iqGnJjua6H1XOjOTv0Z7qI8wGJNtL9AWalLj9ab4DN34tGovnHHcBDpYUbzRx4wl
 yAvTecuj/qkIojyqPlhYdszabqpNX6EG1g63Mps3CBIGvftvb7KVjjcfejrgXw4MimlG
 f0T1DKtGhcHv1HzAcVRel6VOT6puEwhJK+oH7VbvA41Jqf6vqmRRpQWvZjx/hZfmg1Pk
 wJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XRksJXQbYrRhqCpyqmwfEWWPK1xGzs4Mo3xZYXwQ8qI=;
 b=eyi4wNAINlfpSgFdWGs9oH8cAp288bW9GEYWSYsIrURhMHw3FJNVkA/sTloK1EBntW
 vFBN/mr2SnyQSIVssGe/AuXMiUJglByHNk6k0dtoSmiz1AwO37DXY/gpB+e2rYOrdUrK
 6bMZbzSWgKLErb5NWGRSwj7ZvYU1onw0phlLQfBmeqnhxyFFm11tToxQvSuB8sFyRNR8
 Mtl9dZ9kdxII22wx0JpqHAtHD0GDVDWsKJ5BNSWHUXNyc9rsIt6XpRSst76aBo/A5nVW
 k1WAT/euLkO230GeCSdJkzfnShNtajeWm56fgnlIRfmrm+WMqYBTcTLuIp5dwIySOAMV
 z2pQ==
X-Gm-Message-State: ACrzQf1hPR1mZubqqW32p8DXHy0loTnGgsdPEv9MQ+lpQUODvM7loLx4
 3614sQ8OoBlCfE9OdMmC86I0ow==
X-Google-Smtp-Source: AMsMyM7lTEHiQfxkq0ZgHPC1DDe7y/jGkoigCe5EYJENVZe4TpeuSH+8y+q7nIzs9nkd9GrBRL/wOw==
X-Received: by 2002:a5d:5084:0:b0:22e:2f15:b521 with SMTP id
 a4-20020a5d5084000000b0022e2f15b521mr13612358wrt.271.1666371195376; 
 Fri, 21 Oct 2022 09:53:15 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a5d400e000000b0022ae401e9e0sm19541773wrp.78.2022.10.21.09.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 09:53:14 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 8/9] ASoC: qdsp6: audioreach: add support for MFC Module
Date: Fri, 21 Oct 2022 17:52:06 +0100
Message-Id: <20221021165207.13220-9-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20221021165207.13220-1-srinivas.kandagatla@linaro.org>
References: <20221021165207.13220-1-srinivas.kandagatla@linaro.org>
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

Add support to enable and configure Media Format Converter (MFC) Module.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 53 ++++++++++++++++++++++++++++++-
 sound/soc/qcom/qdsp6/audioreach.h |  1 +
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index be7068742fe4..1338b99f37e1 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -159,6 +159,8 @@ struct apm_module_hw_ep_mf_cfg {
 
 #define APM_HW_EP_CFG_PSIZE ALIGN(sizeof(struct apm_module_hw_ep_mf_cfg), 8)
 
+#define APM_MFC_CFG_PSIZE(p, n) ALIGN(struct_size(p, channel_mapping, n), 4)
+
 struct apm_module_frame_size_factor_cfg {
 	struct apm_module_param_data param_data;
 	uint32_t frame_size_factor;
@@ -729,6 +731,53 @@ static int audioreach_sal_set_media_format(struct q6apm_graph *graph,
 	return rc;
 }
 
+static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
+					   struct audioreach_module *module,
+					   struct audioreach_module_config *cfg)
+{
+	struct apm_module_param_data *param_data;
+	struct param_id_mfc_media_format *media_format;
+	uint32_t num_channels = cfg->num_channels;
+	int payload_size;
+	struct gpr_pkt *pkt;
+	int rc;
+	void *p;
+
+	payload_size = APM_MFC_CFG_PSIZE(media_format, num_channels) +
+		APM_MODULE_PARAM_DATA_SIZE;
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
+	param_data->param_id = PARAM_ID_MFC_OUTPUT_MEDIA_FORMAT;
+	param_data->param_size = APM_MFC_CFG_PSIZE(media_format, num_channels);
+	p = p + APM_MODULE_PARAM_DATA_SIZE;
+	media_format = p;
+
+	media_format->sample_rate = cfg->sample_rate;
+	media_format->bit_width = cfg->bit_width;
+	media_format->num_channels = cfg->num_channels;
+
+	if (num_channels == 1) {
+		media_format->channel_mapping[0] = PCM_CHANNEL_L;
+	} else if (num_channels == 2) {
+		media_format->channel_mapping[0] = PCM_CHANNEL_L;
+		media_format->channel_mapping[1] = PCM_CHANNEL_R;
+	}
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
@@ -1054,7 +1103,9 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
 		if (!rc)
 			rc = audioreach_sal_limiter_enable(graph, module, true);
 		break;
-
+	case MODULE_ID_MFC:
+		rc = audioreach_mfc_set_media_format(graph, module, cfg);
+		break;
 	default:
 		rc = 0;
 	}
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index f2b51d8fc718..707dfbdbc156 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -16,6 +16,7 @@ struct q6apm_graph;
 #define MODULE_ID_PCM_ENC		0x07001004
 #define MODULE_ID_PCM_DEC		0x07001005
 #define MODULE_ID_SAL			0x07001010
+#define MODULE_ID_MFC			0x07001015
 #define MODULE_ID_CODEC_DMA_SINK	0x07001023
 #define MODULE_ID_CODEC_DMA_SOURCE	0x07001024
 #define MODULE_ID_I2S_SINK		0x0700100A
-- 
2.21.0

