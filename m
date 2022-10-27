Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DB260F52E
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 12:30:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 060BA31D0;
	Thu, 27 Oct 2022 12:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 060BA31D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666866646;
	bh=WDnvCGrsQcHcOrV/3P19BKBZb29SaRlO5Q7Mm3y3CMU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b7xVypjUjIqKj/WOasmr6LrQarExPSQuI2BDgISKbPrtOv9zpDqq3TWDpToT7llpG
	 cX04xtGD+5KsMpr/63b2DMgeD7BYicG+nKuQ9YMEDR/aqY6+uOWjAHeUTqUqJAYcvD
	 N4dl2o7w0BQ/CY2mK+Pjfbxv8ctCSYvciIQNAcOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFB03F80587;
	Thu, 27 Oct 2022 12:28:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6F83F80570; Thu, 27 Oct 2022 12:27:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2518F80095
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 12:27:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2518F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ILJoWb3X"
Received: by mail-wr1-x431.google.com with SMTP id a14so1395858wru.5
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 03:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P38kTBSJr/DRXyh4Je0XkAOEtRTZS4roS95ylRUlbWA=;
 b=ILJoWb3XrEu77ZuGCBs0pipPfO4HGPcyLw4RSiRRZTtUO8SCysUSQExzlcDrTMIRvN
 cBb/7EBQclQbY0zrEv8j2I7E8PiPYHot7xwsKOOLha0kgM4OGpvJNZX/a/Bywk3iAGDq
 tiNgZJe/5heYhar822aPNtv4gneYYhPVFkUpLzNE02gv0IiOTV6YfhMHsZtnXsawmqJj
 Gekwk2Dr72DN8aRhqRrIln6/ekwlGOsmNGRspkG9AVr1XVz52NqnswULcIvM7d9N7a5L
 2wpww+JO5VccrA/sXkL/b5jdTiw4as9PKSPi1tCh9N8Y03eBbXgTg5IatcSelIrWtx/+
 8RIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P38kTBSJr/DRXyh4Je0XkAOEtRTZS4roS95ylRUlbWA=;
 b=bG4XYaxVXg1tTCbGRASVjMYu7um2z+9Y08G+sa9IuM5fS71eEYoxCS9ZrqSJYuOiA8
 f8O5bmfG0J7sQIFi7yNabVD0NPC5O8IQ2CqjroqHwz2Ps86JKeNv0VpjXXVo+pAGpN/2
 gsLmFwxSlVnUh7Y5Svk7eiBNAzqawUZf0GPb75snI6nV++yKK7G5NSFFTSiPjbdjGINn
 pQoqH0bMj0/CtVwLUxd/MWSnvOy7xu4XfcUsXqk70kj4kGT1TNm9Oj94qvt0gvOb+OE9
 YtvjotJ2n6krUHaSvgI/Z14EqKw03TbDuXP9894l5Z/02rKp4c3ym38ULY64dz7fVphK
 h+rw==
X-Gm-Message-State: ACrzQf2q+Hw4+kES9liTsS+scQbbgDHCNnZCkrSkQg30OAdBifqL7ggZ
 Xga6/4YR0x4Ezccjo6L4KtJ5fQ==
X-Google-Smtp-Source: AMsMyM6n1kCTi8daTd2SVcuEjyzVj6ZAP/A2zOOB2oE7t372oUSp1ruGQ0IjsqMc53/pKEuRKijVQQ==
X-Received: by 2002:a05:6000:1b0e:b0:236:5c9e:7110 with SMTP id
 f14-20020a0560001b0e00b002365c9e7110mr18891472wrz.650.1666866470678; 
 Thu, 27 Oct 2022 03:27:50 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 fc7-20020a05600c524700b003b505d26776sm5088674wmb.5.2022.10.27.03.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 03:27:50 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 9/9] ASoC: qdsp6: audioreach: add support to enable module
 command
Date: Thu, 27 Oct 2022 11:27:10 +0100
Message-Id: <20221027102710.21407-10-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20221027102710.21407-1-srinivas.kandagatla@linaro.org>
References: <20221027102710.21407-1-srinivas.kandagatla@linaro.org>
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

