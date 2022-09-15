Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAA05B9B1E
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 14:42:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DF4C1A7C;
	Thu, 15 Sep 2022 14:41:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DF4C1A7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663245748;
	bh=mZmC8p0wggD9E5PyDEy1pPNaFoucWa5M3uzuPcxagHg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gNq8P6skgeASwgl0QjWm4qYH/O1TIv9Q1VjDOe7qtenkplUXHBFSCfHwF8RFND4Ra
	 sBk6zL7ZBEvVyXHOw84avzZ3dHg0kveJbXOT7UldeBpdHCYdJzooJ3lTk5stvFxbDZ
	 FoDEosAyIX+4mJxzKENoXRnTrhFWBLGsTBuxVd28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71676F80580;
	Thu, 15 Sep 2022 14:39:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0EA3BF80571; Thu, 15 Sep 2022 14:39:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D92F7F8053D
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 14:39:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D92F7F8053D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NpEnD4+5"
Received: by mail-wm1-x329.google.com with SMTP id l8so8425967wmi.2
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 05:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=IeAgNZtS8X1tLcgH+uLrT6e6JPredzlWXqw/7cX/H9c=;
 b=NpEnD4+5UvjApkez7BQRb2H/jI+T6RSMCDPJAnkFcvgXSPoETTKktjQDdmNcFHKOu7
 4wZwR0mf9x+JYp5535hBJcYkUgxbr1Fjqll2o8Iz3WrqhfAGa3H1i+HYFrOw/kkKKAtg
 K1TvILDY1H6J7y8oJG+7RNhKJHm5ueTYTl+RW3+OtXg9lRXESR7fj2V2FskBqsppVz/F
 LOXuolIGk5olSXyopf2OwoJt1uzFmu6ywiWuU0RQTsmBhQwpZ3oxDk/yPgyAl5ZCvUHd
 Evf2/6ARERpQn+ZYEbPh7zoMRUQ8pBD/hGEchnASctsbydhzlkJZWORHqCJHjbXE9asX
 roKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=IeAgNZtS8X1tLcgH+uLrT6e6JPredzlWXqw/7cX/H9c=;
 b=dzSgS4ng/fVE0S/E1f3Vxt9/7Z2d2JH2j/HwKZMU4y14amEqEVdaDSVZwxcqiQWAVW
 7XH8ivYtP6su3//rtsQoAc1og/4w1qIfq7iZOhnY6MPbuSd39vhkA1zHv8I3Y19z42dQ
 lBr96FXWAi/rc4RAXc1Zpq2Wf8UHGsdZziUs88g8xeT1W++tbxTPPZ71puImd3eAHCtE
 5MTFr/W+WazlOHV7burQ+axTCFNH+86WqE8qrQzJHyBakixVW1bA8jrrVUOG5oCx6a3t
 mU0jHkoDRcelgsuLRUAnE6hyuSmeUj4YLihnhMxqp7oOiD6YJQWZNiCI70tQM23BYZbs
 Zn2g==
X-Gm-Message-State: ACgBeo3iuST0wnMus0X0b6aA+9tYyAkwcqQff0b3gyt9fNBnfeExezQt
 eICoQlU3PuID0PHZi/eb9nDTBg==
X-Google-Smtp-Source: AA6agR64FpbnVidcThBa1wrEKVXvNGP2DM9m3fJynJiGl7+Y0Kee97YdzuC6a+BOEeZEPauV0G4Nbw==
X-Received: by 2002:a05:600c:4f53:b0:3b4:9aad:7845 with SMTP id
 m19-20020a05600c4f5300b003b49aad7845mr6561451wmq.159.1663245540816; 
 Thu, 15 Sep 2022 05:39:00 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 bg13-20020a05600c3c8d00b003a5f4fccd4asm3112559wmb.35.2022.09.15.05.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 05:39:00 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 9/9] ASoC: qdsp6: audioreach: add support to enable module
 command
Date: Thu, 15 Sep 2022 13:38:37 +0100
Message-Id: <20220915123837.11591-10-srinivas.kandagatla@linaro.org>
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

Add support to enable Module command which is required for logging
module to be able to debug.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 37 +++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  5 +++++
 2 files changed, 42 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 05b58239cab6..e88ace794d4f 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -729,6 +729,42 @@ static int audioreach_sal_set_media_format(struct q6apm_graph *graph,
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
+	param_data->param_size = sizeof (*param);
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
@@ -1075,6 +1111,7 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
 
 	switch (module->module_id) {
 	case MODULE_ID_DATA_LOGGING:
+		audioreach_module_enable(graph, module, true);
 		rc = audioreach_logging_set_media_format(graph, module);
 		break;
 	case MODULE_ID_PCM_DEC:
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

