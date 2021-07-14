Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEFE3C87D0
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 17:36:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B4C616A4;
	Wed, 14 Jul 2021 17:35:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B4C616A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626276989;
	bh=ww/EX8RXH9W+zhoP6YIUSPux/01iIOUwJDYiL2ap+90=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MB4faOS9ZBekjHTze9mKpM2lmz0JX62296jQRuBj3dzAQiRYh4Jfkdd53BtbucHlX
	 gP93hLSH9Fm0wnsKY+Xt2btq4EgrI581Zq6/d2ILJN1Zf95F+tEHLJODnkDTPAQz7k
	 9H79ktdArsf9NN8CpYhKSzpvHYcu+5cKDA80Iw94=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FBA3F80517;
	Wed, 14 Jul 2021 17:31:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97812F8053B; Wed, 14 Jul 2021 17:31:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C45C1F8051A
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 17:31:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C45C1F8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LiBvy+mq"
Received: by mail-wr1-x435.google.com with SMTP id t5so3706661wrw.12
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 08:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Lp0zZwDjM0o67Qr8IPD9fZg8MpkDEKyh4GA3N2Mu00=;
 b=LiBvy+mqpa9juYGqFMgrRvy5qkizs2Cp8TjMp41i3uDErqMjPTy02avYokshjxleW6
 bc1hwBPPYIsfV7pBtWCoifHgQ9FfYoUO9hOq0l8TJo1HQt6OLIla5X1ML3tpEgt5BcO6
 sSjVsVgBrpyBXn1mEIC6umg5vFMMYI2b5+3gX6BWw9YW26HcONQruouX0g8FTfeeXx/6
 VY8TWQYizMW/apMc0EjejQ9rpreX5Y606+0mEus2tAg2M13x0xZsplXFX/VcgWZCN0iX
 7SCDdx/Prl/ngUI36WoeotLi+1Npj2/9pMlwmnVrVW8q5v9+sW6+zgAIafvkW/QXFCFf
 8kLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Lp0zZwDjM0o67Qr8IPD9fZg8MpkDEKyh4GA3N2Mu00=;
 b=CaRoMoW48sd455fAaS7Ed5Gq+6UbXYY41dxUHBY+rLAHnmcyKo6Nktl+FB3OrpnQNi
 /WLITsS3Pbu9zZHl3scj8nFTTmDghYSQpahZFNM5weJ9VDCeeYv8MDhXF9rtM5urw1Kg
 s+2qm06PHdLzGWKi4YFvlke4ayGdQO6UhGCFnZsn1nSIZCCYpuXoqkzluYoQG7IU7QAu
 btbPBMBAf0uLURE0a/W5LUp8cRzjjH+5vVPWRU7/aXCno6UTX5Cp61pZYQ3V3bV2goHn
 3rfxIY4mB0DIz3oQxyE1SRen4x6JwQRiWBcJlSHaljqlMpaR6VOc/otzjKp4GRKFAOA1
 p0VA==
X-Gm-Message-State: AOAM532LU+Mx4v1xamWicFL2ZycObRKKN7olXGPqL6P/BfU48bSnQbdJ
 fGgEZ7BHPKGHMcsAhUDeC33nIg==
X-Google-Smtp-Source: ABdhPJx/imkJrMeCLBPiFq0W4NwN7lyBr8ae7Q2NqE/UHdM21l0TfgWsssg77d8a1oibt5anw4hltw==
X-Received: by 2002:adf:facf:: with SMTP id a15mr13666345wrs.39.1626276676193; 
 Wed, 14 Jul 2021 08:31:16 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id y6sm2465174wma.48.2021.07.14.08.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:31:15 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: bjorn.andersson@linaro.org,
	broonie@kernel.org,
	robh@kernel.org
Subject: [PATCH v2 14/16] ASoC: qcom: audioreach: add volume ctrl module
 support
Date: Wed, 14 Jul 2021 16:30:37 +0100
Message-Id: <20210714153039.28373-15-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
References: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, tiwai@suse.de,
 plai@codeaurora.org, linux-kernel@vger.kernel.org
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

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/audioreach/audioreach.c | 34 ++++++++++++++++++++++++++
 sound/soc/qcom/audioreach/audioreach.h |  8 ++++++
 2 files changed, 42 insertions(+)

diff --git a/sound/soc/qcom/audioreach/audioreach.c b/sound/soc/qcom/audioreach/audioreach.c
index 1839d872fd5f..5a50eede4496 100644
--- a/sound/soc/qcom/audioreach/audioreach.c
+++ b/sound/soc/qcom/audioreach/audioreach.c
@@ -928,6 +928,40 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 	return rc;
 }
 
+int audioreach_gain_set_vol_ctrl(struct q6apm *apm, struct audioreach_module
+				 *module, int vol)
+{
+	struct apm_module_param_data *param_data;
+	struct param_id_vol_ctrl_master_gain *cfg;
+	int rc, payload_size;
+	struct gpr_pkt *pkt;
+	void *p;
+
+	payload_size = sizeof(*cfg) + APM_MODULE_PARAM_DATA_SIZE;
+	p = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(p))
+		return -ENOMEM;
+
+	pkt = p;
+	p = p + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	param_data = p;
+	param_data->module_instance_id = module->instance_id;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_VOL_CTRL_MASTER_GAIN;
+	param_data->param_size = payload_size - APM_MODULE_PARAM_DATA_SIZE;
+
+	p = p + APM_MODULE_PARAM_DATA_SIZE;
+	cfg = p;
+	cfg->master_gain =  vol;
+	rc = q6apm_send_cmd_sync(apm, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(audioreach_gain_set_vol_ctrl);
+
 static int audioreach_gain_set(struct q6apm_graph *graph,
 			 struct audioreach_module *module)
 {
diff --git a/sound/soc/qcom/audioreach/audioreach.h b/sound/soc/qcom/audioreach/audioreach.h
index 6279ddc3c5ce..2c6d5f4e66b4 100644
--- a/sound/soc/qcom/audioreach/audioreach.h
+++ b/sound/soc/qcom/audioreach/audioreach.h
@@ -536,6 +536,14 @@ struct param_id_hw_ep_dma_data_align {
 	uint32_t dma_data_align;
 } __packed;
 
+#define PARAM_ID_VOL_CTRL_MASTER_GAIN	0x08001035
+#define VOL_CTRL_DEFAULT_GAIN		0x2000
+struct param_id_vol_ctrl_master_gain {
+	uint16_t master_gain;
+	uint16_t reserved;
+} __packed;
+
+
 /* Graph */
 struct audioreach_connection {
 	/* Connections */
-- 
2.21.0

