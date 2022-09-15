Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAD35B9B1B
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 14:42:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 948A718B3;
	Thu, 15 Sep 2022 14:41:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 948A718B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663245723;
	bh=SJ9Uh8Uzdcz2DNWFS1pSSz4MkniXAvkBld06TOnZW0c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KQ/RyvKqUV/MMwURimxZHf+azKOAjzdDZiUTB/xC5PBTs21yya+pqTSEd3F2rRqSV
	 wyJxivYFSRLVWQ9yfs6GL4Klgr6hF/xWVLAC7uAGynHVjhnRgSgmFbbHB6aYf0gx+t
	 TaM854zjb7jQPtw/kP8ZCdLsYR4ns6CV5q75pWi0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A886F80571;
	Thu, 15 Sep 2022 14:39:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF3FFF80563; Thu, 15 Sep 2022 14:39:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 482E3F80495
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 14:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 482E3F80495
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lVZiZSfP"
Received: by mail-wm1-x32d.google.com with SMTP id
 bg5-20020a05600c3c8500b003a7b6ae4eb2so17632842wmb.4
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 05:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=/rwIpVMtqg6E5+Qn4IKE9HpHCiGyTi0zfy7IdHUtvvk=;
 b=lVZiZSfPUnZTZe4T+QPQHIt2UCK4rxq70unUHgC+V2ogXC9S/NpvPeFv/+Eu3QcaTJ
 lNkLgF6gT6dt/FZD/rrkC584Q01Rv8iasK7DeP3gwX8kUq2/GJUzLJp7c7mrzjU/FzHu
 5Zb6ygtY3heZUtB4FS3x9r8QE23BGFgKTOf0i6bBnLz1jVVv4H0gkgqQ0exHpiATPoF3
 j6ESTP5arrJPZ1e5IQxIwmCBwJP9h0yMnaxqZOzsZFrNkJrrPvbV/jJmeBn/Ly2upxRw
 PtKV6+10LCMkgX6HnYa3gJEWx/h7a2L29jXwruh8Yj0OEydN8w+IAusglbgndopiEakj
 oj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=/rwIpVMtqg6E5+Qn4IKE9HpHCiGyTi0zfy7IdHUtvvk=;
 b=Pc7wOrubZmbYT3PmxMMwBNEa8IxGV55uLe7jffw8m0VMOO/SqBjq+m/DyCu1u81VHY
 vhFusfk7QdabJuKmZ8YfOFe/dTZdFveRA7Z5DasNv9nBKKN1sMsfkc4o5KTp84K+8H5D
 Evt7+eYK02E5NpusdS0jXuKQ6eIOB47z6zITIB5fD7AuPL0DS7Elh42JPOZ4W8ygVFrK
 UUix7PJBTwxiLA2ocbqdKmm6ppzyUUB9Dgr1SdxZPuYXJ3v3VTsgbA6wx/0SV98/k0m/
 008tCQnmrSouQ6m3EfhI4PNJSO03yy9IYXWF1U6MSgFJ8jAuNlSLMU+aXsBmKRwXFZJY
 xeiA==
X-Gm-Message-State: ACgBeo0SEdLi8pnYsMydmxpJkI3cBQqhrqnUNlAa4zFf3HjClLm3a9PU
 JFmq/3r2OCqPg34pKrqgDcqYIQ==
X-Google-Smtp-Source: AA6agR6QJ+PCohDiIPSRYrwnsSPaz6Rql5/97iUsJufNhKd9qLCZw4pJfGzN9o5UhzYdu29AlT/UPg==
X-Received: by 2002:a05:600c:41c3:b0:3b4:9668:655a with SMTP id
 t3-20020a05600c41c300b003b49668655amr6533300wmh.36.1663245539635; 
 Thu, 15 Sep 2022 05:38:59 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 bg13-20020a05600c3c8d00b003a5f4fccd4asm3112559wmb.35.2022.09.15.05.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 05:38:58 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 8/9] ASoC: qdsp6: audioreach: add support for MFC Module
Date: Thu, 15 Sep 2022 13:38:36 +0100
Message-Id: <20220915123837.11591-9-srinivas.kandagatla@linaro.org>
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

Add support to enable and configure Media Format Converter (MFC) Module.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 53 ++++++++++++++++++++++++++++++-
 sound/soc/qcom/qdsp6/audioreach.h |  1 +
 2 files changed, 53 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 168bc3020b74..05b58239cab6 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -159,6 +159,8 @@ struct apm_module_hw_ep_mf_cfg {
 
 #define APM_HW_EP_CFG_PSIZE ALIGN(sizeof(struct apm_module_hw_ep_mf_cfg), 8)
 
+#define APM_MFC_CFG_PSIZE(p, n) ALIGN(struct_size(p, channel_mapping, n), 4)
+
 struct apm_module_frame_size_factor_cfg {
 	struct apm_module_param_data param_data;
 	uint32_t frame_size_factor;
@@ -727,6 +729,53 @@ static int audioreach_sal_set_media_format(struct q6apm_graph *graph,
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
@@ -1051,7 +1100,9 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
 		audioreach_sal_set_media_format(graph, module, cfg);
 		audioreach_sal_limiter_enable(graph, module, true);
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

