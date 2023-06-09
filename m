Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F19A729D7A
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jun 2023 16:56:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9651E8F;
	Fri,  9 Jun 2023 16:55:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9651E8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686322566;
	bh=swPdvsYTKlEmkM0HgKJRO4O3bGsqf+vXLPLn7l+pdUk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vhoaGrd76XyzB27piNqCv/cTAI7yRqPeSSIjD+sxp1DdLDCJhDyOnbxqgxsoOaAzL
	 E7GPpULLcLEqbKKijcfpQjLhVEEBSLn03gYwY60uHOOU7nBpv5SKMNiACLO4+LWy03
	 G6G9blx5nPsyIvdz0+cqZf7Ir/ET6QYVb4n45LpA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05D1CF805A0; Fri,  9 Jun 2023 16:54:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C23EF8057D;
	Fri,  9 Jun 2023 16:54:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9C42F80290; Fri,  9 Jun 2023 16:54:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5CA94F80551
	for <alsa-devel@alsa-project.org>; Fri,  9 Jun 2023 16:54:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CA94F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TAMGIEEE
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f644dffd71so2421434e87.1
        for <alsa-devel@alsa-project.org>;
 Fri, 09 Jun 2023 07:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686322464; x=1688914464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9JFL8jNKRrHzDOE8BEGRQfXvBY019VxhOr2ufujXe1U=;
        b=TAMGIEEEJ9RK7aLUsa41oSkhZHSOgLJAFbWtA+9s51ls33ee6pMORTpWGF/vZdU2gS
         gX6ctJNYfSr84xx7f1gYCP+NUG0GaOJcKqEj5Rvw5ts48+CHxWDhqnIoouR/pGzWLzfh
         oseIe/J6D7bP/DLWGWniAZ/J4/BVAJ6md/8iTl5EIt8XgMMfcls6MnZI5N3lo2FaW18o
         IFphiRlsuDd1+A8ynDrSUVtFyFjX6Ca4c5sZL0Shih92VJPwyPpnxMtsAgE4SL6yw7IS
         KPe9MK+Bwl8P01Fpfl1j4qph41SFW9MJjKfX6D8uJpgLhMGNTaQsW8+5RyGxS3TgYbAm
         N+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686322464; x=1688914464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JFL8jNKRrHzDOE8BEGRQfXvBY019VxhOr2ufujXe1U=;
        b=jqV8Fh3qez1Cz1rn2rhtDiphqpvorYlMkXPTTTVvIOzuCLe/wojDo7tpA+qBjKBLV6
         4hkgOPE0W2ybFW6evlOL73bxoACqJCvVVy+QzWjY115/F52/afFjIx0kkX4fToXAlg5Q
         AhSqrIjkQ0kBdeJ8MgHeEYqWVtrM3hfSYODz+n9D0H+PVhjpKm7MqoQBAUZE7+4+0omF
         lQjDgOdKsluZrYbn/01m9QUTylWiqfv7fhgmcfcqokDdrx7WJ+z1JXH/W6SpYOM+Jxn4
         0xXjzPCN6EuTaU8wYgxu6Z73hPhgiaKRpFIvSccGzCGvJ24JH4H56s2PVsxVbyd+CQHs
         oonA==
X-Gm-Message-State: AC+VfDxif7l5ax8ZEofFM8lF7ukkOsq/WFcZdTDsOqzg14lIJhPpe6rs
	HLDJzE9dQqE6dDrIM1Yl0tTVUQ==
X-Google-Smtp-Source: 
 ACHHUZ6ugyraOH0v8OYLxzLAY3Eq/p7st4i1LSwVEOuLuJ6w66qloZAfiplZ6C6zy8D5yeLp2D85Tw==
X-Received: by 2002:a05:6512:521:b0:4f4:d41b:f421 with SMTP id
 o1-20020a056512052100b004f4d41bf421mr1328843lfc.33.1686322463902;
        Fri, 09 Jun 2023 07:54:23 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 c21-20020a05600c0ad500b003f7310a3ffasm2946632wmr.2.2023.06.09.07.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:54:21 -0700 (PDT)
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
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 03/11] ASoC: q6dsp: audioreach: add helper function to set
 u32 param
Date: Fri,  9 Jun 2023 15:53:59 +0100
Message-Id: <20230609145407.18774-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230609145407.18774-1-srinivas.kandagatla@linaro.org>
References: <20230609145407.18774-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6VFH2EP5TRFAW4IMWTQLRBL52XUT2AT5
X-Message-ID-Hash: 6VFH2EP5TRFAW4IMWTQLRBL52XUT2AT5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6VFH2EP5TRFAW4IMWTQLRBL52XUT2AT5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some of the Audioreach commands take a u32 value,
ex: PARAM_ID_MODULE_ENABLE.

It makes more sense to provide a helper function so that other new
commands can reuse this.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 100 +++++++-----------------------
 sound/soc/qcom/qdsp6/audioreach.h |   2 +
 2 files changed, 26 insertions(+), 76 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 8d9410dcbd45..0acd4a75d5cd 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -732,33 +732,32 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 	return rc;
 }
 
-static int audioreach_sal_limiter_enable(struct q6apm_graph *graph,
-					 struct audioreach_module *module, bool enable)
+int audioreach_send_u32_param(struct q6apm_graph *graph, struct audioreach_module *module,
+			      uint32_t param_id, uint32_t param_val)
 {
 	struct apm_module_param_data *param_data;
-	struct param_id_sal_limiter_enable *limiter_enable;
-	int payload_size;
 	struct gpr_pkt *pkt;
-	int rc;
+	uint32_t *param;
+	int rc, payload_size;
 	void *p;
 
-	payload_size = sizeof(*limiter_enable) + APM_MODULE_PARAM_DATA_SIZE;
-
-	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
-	if (IS_ERR(pkt))
-		return PTR_ERR(pkt);
+	payload_size = sizeof(uint32_t) + APM_MODULE_PARAM_DATA_SIZE;
+	p = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(p))
+		return -ENOMEM;
 
-	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+	pkt = p;
+	p = p + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
 
 	param_data = p;
 	param_data->module_instance_id = module->instance_id;
 	param_data->error_code = 0;
-	param_data->param_id = PARAM_ID_SAL_LIMITER_ENABLE;
-	param_data->param_size = sizeof(*limiter_enable);
-	p = p + APM_MODULE_PARAM_DATA_SIZE;
-	limiter_enable = p;
+	param_data->param_id = param_id;
+	param_data->param_size = sizeof(uint32_t);
 
-	limiter_enable->enable_lim = enable;
+	p = p + APM_MODULE_PARAM_DATA_SIZE;
+	param = p;
+	*param = param_val;
 
 	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
 
@@ -766,77 +765,26 @@ static int audioreach_sal_limiter_enable(struct q6apm_graph *graph,
 
 	return rc;
 }
+EXPORT_SYMBOL_GPL(audioreach_send_u32_param);
+
+static int audioreach_sal_limiter_enable(struct q6apm_graph *graph,
+					 struct audioreach_module *module, bool enable)
+{
+	return audioreach_send_u32_param(graph, module, PARAM_ID_SAL_LIMITER_ENABLE, enable);
+}
 
 static int audioreach_sal_set_media_format(struct q6apm_graph *graph,
 					   struct audioreach_module *module,
 					   struct audioreach_module_config *cfg)
 {
-	struct apm_module_param_data *param_data;
-	struct param_id_sal_output_config *media_format;
-	int payload_size;
-	struct gpr_pkt *pkt;
-	int rc;
-	void *p;
-
-	payload_size = sizeof(*media_format) + APM_MODULE_PARAM_DATA_SIZE;
-
-	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
-	if (IS_ERR(pkt))
-		return PTR_ERR(pkt);
-
-	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
-
-	param_data = p;
-	param_data->module_instance_id = module->instance_id;
-	param_data->error_code = 0;
-	param_data->param_id = PARAM_ID_SAL_OUTPUT_CFG;
-	param_data->param_size = sizeof(*media_format);
-	p = p + APM_MODULE_PARAM_DATA_SIZE;
-	media_format = p;
-
-	media_format->bits_per_sample = cfg->bit_width;
-
-	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
-
-	kfree(pkt);
-
-	return rc;
+	return audioreach_send_u32_param(graph, module, PARAM_ID_SAL_OUTPUT_CFG,  cfg->bit_width);
 }
 
 static int audioreach_module_enable(struct q6apm_graph *graph,
 				    struct audioreach_module *module,
 				    bool enable)
 {
-	struct apm_module_param_data *param_data;
-	struct param_id_module_enable *param;
-	int payload_size;
-	struct gpr_pkt *pkt;
-	int rc;
-	void *p;
-
-	payload_size = sizeof(*param) + APM_MODULE_PARAM_DATA_SIZE;
-
-	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
-	if (IS_ERR(pkt))
-		return PTR_ERR(pkt);
-
-	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
-
-	param_data = p;
-	param_data->module_instance_id = module->instance_id;
-	param_data->error_code = 0;
-	param_data->param_id = PARAM_ID_MODULE_ENABLE;
-	param_data->param_size = sizeof(*param);
-	p = p + APM_MODULE_PARAM_DATA_SIZE;
-	param = p;
-
-	param->enable = enable;
-
-	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
-
-	kfree(pkt);
-
-	return rc;
+	return audioreach_send_u32_param(graph, module, PARAM_ID_MODULE_ENABLE, enable);
 }
 
 static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 3ebb81cd7cb0..18d8d243b06b 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -752,4 +752,6 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
 int audioreach_shared_memory_send_eos(struct q6apm_graph *graph);
 int audioreach_gain_set_vol_ctrl(struct q6apm *apm,
 				 struct audioreach_module *module, int vol);
+int audioreach_send_u32_param(struct q6apm_graph *graph, struct audioreach_module *module,
+			      uint32_t param_id, uint32_t param_val);
 #endif /* __AUDIOREACH_H__ */
-- 
2.21.0

