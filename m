Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB77607D05
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 18:56:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91CFDAFE7;
	Fri, 21 Oct 2022 18:55:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91CFDAFE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666371396;
	bh=WDnvCGrsQcHcOrV/3P19BKBZb29SaRlO5Q7Mm3y3CMU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VvDzNWKGERehVTF7PD9ExFSAz97aIwcOR+bTvFldkm+wTYgm01dWXtRng+8zKMXhR
	 x8/y2ZpZE9AfHABZ601xMcAk2j2Wjn6QE37SR8zCeE6nUZj3oTWZgcnIHwiVpYC/+k
	 gTomIYu4moVHV3cJBPgTgzFMIrmEVlWRDIWDiiWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FAC5F805AC;
	Fri, 21 Oct 2022 18:53:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFA06F80588; Fri, 21 Oct 2022 18:53:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51561F80587
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 18:53:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51561F80587
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="v2L7/MLQ"
Received: by mail-wr1-x429.google.com with SMTP id w18so5880251wro.7
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 09:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P38kTBSJr/DRXyh4Je0XkAOEtRTZS4roS95ylRUlbWA=;
 b=v2L7/MLQEM62vRMDJl2OvRagyQDMvI9Nymr91iGl6SCFtRwreusq9eArbalmCitKmw
 +hhaFtS/OnHIn+5Xf6nwDNqdfoUMc7HgHUiF2pUGEE3DwN7QEYkAcxb4cK4TRHIDHee5
 qtcn/Zh7JexBtSjqDnAv3pzmWv3BQM8oepnsMsqkgFsgD7GAXqIIdx6gyUhxyW1yZf0a
 jJ9asdZ03lPN3bVlMf+Jf6yZGUdf3sE3aPcWLKN0O7T8ZGPUQl3+gJSbTImklJ8iGhlu
 wGxVv2oHVoc11MJe/Ebl0h3dBwVu89Zv+HwtG2xPUafiph0CvZLyUJXmP5rEAerNZreA
 6mJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P38kTBSJr/DRXyh4Je0XkAOEtRTZS4roS95ylRUlbWA=;
 b=YTN5wdjVclL4ZdpbKiF7V0Ocu0kbeaff0p5LMZoNO4dO21wWzoXgHfP4COuSRdrjXe
 /f8znvVGJ+tuWaBGGqWuutVUXvuiq4ka/l9gVbEYycclQSXUHUtGpQHc2agKKt/Be3QV
 MEBWrdmbYo6cBR/jck/ZSuRIZGwv385m6spILbgpzwGmzJmcocD4HzAEmb4/uoZIX3w0
 ZQO1MinpG389YPh6aeZ5dO31Mgyh8C+4XYk2u8bceCOcWjdt7+KaQg5TYKi7mB7BKoM1
 95YsVncIbs7hgthkuWH9VpbFmHuCAmVAgqdv8G7pZtjazUZiQAH/q79w2TGdUFFUb4LO
 IRig==
X-Gm-Message-State: ACrzQf1Dw2v3YDy3EboEFUIEQeuHZysE9hKW0F2S3KCpOrBxnZfr+dNI
 1qqO1MJzCr26dP9sgNSZg4QXsg==
X-Google-Smtp-Source: AMsMyM6zQoWParlSxvfB2HUAFHKdeQhoLVug903b1NjXtgJhHefeJargZB0bYfSyjxfnLy/MCiC+Eg==
X-Received: by 2002:a5d:598d:0:b0:230:f238:a485 with SMTP id
 n13-20020a5d598d000000b00230f238a485mr13533983wri.71.1666371196492; 
 Fri, 21 Oct 2022 09:53:16 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a5d400e000000b0022ae401e9e0sm19541773wrp.78.2022.10.21.09.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 09:53:15 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 9/9] ASoC: qdsp6: audioreach: add support to enable module
 command
Date: Fri, 21 Oct 2022 17:52:07 +0100
Message-Id: <20221021165207.13220-10-srinivas.kandagatla@linaro.org>
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

Add support to enable Module command which is required for logging
module to be able to debug.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 40 ++++++++++++++++++++++++++++++-
 sound/soc/qcom/qdsp6/audioreach.h |  5 ++++
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 1338b99f37e1..1e0c918eb576 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -731,6 +731,42 @@ static int audioreach_sal_set_media_format(struct q6apm_graph *graph,
 	return rc;
 }
 
+static int audioreach_module_enable(struct q6apm_graph *graph,
+				    struct audioreach_module *module,
+				    bool enable)
+{
+	struct apm_module_param_data *param_data;
+	struct param_id_module_enable *param;
+	int payload_size;
+	struct gpr_pkt *pkt;
+	int rc;
+	void *p;
+
+	payload_size = sizeof(*param) + APM_MODULE_PARAM_DATA_SIZE;
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
+	param_data->param_id = PARAM_ID_MODULE_ENABLE;
+	param_data->param_size = sizeof(*param);
+	p = p + APM_MODULE_PARAM_DATA_SIZE;
+	param = p;
+
+	param->enable = enable;
+
+	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
 static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 					   struct audioreach_module *module,
 					   struct audioreach_module_config *cfg)
@@ -1077,7 +1113,9 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
 
 	switch (module->module_id) {
 	case MODULE_ID_DATA_LOGGING:
-		rc = audioreach_logging_set_media_format(graph, module);
+		rc = audioreach_module_enable(graph, module, true);
+		if (!rc)
+			rc = audioreach_logging_set_media_format(graph, module);
 		break;
 	case MODULE_ID_PCM_DEC:
 	case MODULE_ID_PCM_ENC:
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 707dfbdbc156..1d1d47d47d40 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -537,6 +537,11 @@ struct payload_media_fmt_pcm {
 	uint8_t channel_mapping[];
 } __packed;
 
+#define PARAM_ID_MODULE_ENABLE			0x08001026
+struct param_id_module_enable {
+	uint32_t enable;
+} __packed;
+
 #define PARAM_ID_CODEC_DMA_INTF_CFG		0x08001063
 
 struct param_id_codec_dma_intf_cfg {
-- 
2.21.0

