Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB7245313A
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 12:49:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26BE216A6;
	Tue, 16 Nov 2021 12:48:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26BE216A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637063382;
	bh=E0st9HDBZ1yABUYSVCQi9mbK+8UvuUpYxo6sDm+ZBkQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bnt3FHSTq8YH5VGs5sp9a6pyqMnEXRVYigAeuYETw4e6zvwXZAR0rZPH2mCprjubV
	 Bmk5hO87sy8gbnu1luf6HWNHQw4+eYT5et++2yVA/tZ2pma9TlrghPLdj0Rvl82baG
	 1APWxc6V+UsEivK2LsW/aqYGtXQIrA6Koy4dp0Sc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E7C8F80506;
	Tue, 16 Nov 2021 12:47:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04137F804F3; Tue, 16 Nov 2021 12:47:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA86EF80423
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 12:47:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA86EF80423
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="WUl8g/+E"
Received: by mail-wm1-x32e.google.com with SMTP id
 az33-20020a05600c602100b00333472fef04so1687144wmb.5
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 03:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NY/9dxs1i7rzBFDDSa3S8h83sIZhyo69SFWrCR0SPuA=;
 b=WUl8g/+E00PsKiG7QBlLCp/qM10iKn0xkuoPHdydZnmVP4G+cAH22m9NrBNEE1hkcy
 cm/pC00h9jtMnUFIs+vlZxOaJa5glJo8poeYFfERL/Ez89kRXUr3C2aXqBmTNQFd+Pyb
 LOy6DgLPIhgfocWcBiVbZSEd8Zf/tZyY4ekYm3FFMwoDbuVl202kQt20oYNYb8571Dk/
 VkR3or1rPpknP5JsnC1UkvQFabxcPJynKB7diA0uaGAoEyILH4V2S3Zuhsmk9unGYPUd
 CfvTsfmidvWDbq2ugBH6wOi8gyqp4Dq6kIIYSo0rU+IKlU+RvMmNNHcG38WJy9006fn6
 wpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NY/9dxs1i7rzBFDDSa3S8h83sIZhyo69SFWrCR0SPuA=;
 b=dJtgbgZA93TmUPTAKVW3WleBGgzjPKsCiZbpLgU7iOlSaWoZ2ZknLUDF8CbhIkSFwN
 Y21ZAMDo6qtqbtWsCmECKY/owbYOnuds0NVU7m0l6SHoGjCXANNDMYQoIIPVawMQQhNi
 qGkMFFyVgT9cWeJ+8x2PsdxyYHzL+jGiVYysfVObchzUyYPMe5nXh1rgplrDaqMg6ug4
 0VsWDCMV8ig+g5dBpkmdZ4VQypIPI9UfQ2KEpbNrmhYBar7qEWQj3W8PB28gSXDXOnD1
 NJkZyGmhKwZEWnSUiW6N7f+GI80pgzyn7HiEeQFMiKvOMgrTs5mp/GqKJYde6nAN+33t
 5qqg==
X-Gm-Message-State: AOAM5333mi7lFVyLjc8Zm9yP4FG5zwTO05w+7QUjxmZHYFuk4Hy2u64O
 8A8yoV+nsWDz/YFYwHE+t/V+VKXoF1dbzw==
X-Google-Smtp-Source: ABdhPJxHibETHkgJR8cvzZpEuoIqQBlFDRYkoc9Cd58qbXLnYG8VSTdBdDMml5cXJUXlbjxz/+zWRg==
X-Received: by 2002:a7b:c7cd:: with SMTP id z13mr65615271wmk.172.1637063260576; 
 Tue, 16 Nov 2021 03:47:40 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id l8sm2260523wmc.40.2021.11.16.03.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 03:47:40 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/5] ASoC: qdsp6: qdsp6: q6prm: handle clk disable correctly
Date: Tue, 16 Nov 2021 11:47:17 +0000
Message-Id: <20211116114721.12517-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211116114721.12517-1-srinivas.kandagatla@linaro.org>
References: <20211116114721.12517-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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

Q6PRM clks need to be disabled using PRM_CMD_RELEASE_HW_RSC dsp command
rather then using PRM_CMD_RSP_REQUEST_HW_RSC cmd with rate set to zero.

DSP will throw errors if we try to disable the clock using existing code.

Fix this by properly handling the clk release.

Fixes: 9a0e5d6fb16f ("ASoC: qdsp6: audioreach: add q6prm support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.h |  4 +++
 sound/soc/qcom/qdsp6/q6prm.c      | 53 +++++++++++++++++++++++++++++--
 2 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 4f693a2660b5..3ee8bfcd0121 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -550,6 +550,10 @@ struct audio_hw_clk_cfg {
 	uint32_t clock_root;
 } __packed;
 
+struct audio_hw_clk_rel_cfg {
+	uint32_t clock_id;
+} __packed;
+
 #define PARAM_ID_HW_EP_POWER_MODE_CFG	0x8001176
 #define AR_HW_EP_POWER_MODE_0	0 /* default */
 #define AR_HW_EP_POWER_MODE_1	1 /* XO Shutdown allowed */
diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
index 82c40f2d4e1d..cda33ded29be 100644
--- a/sound/soc/qcom/qdsp6/q6prm.c
+++ b/sound/soc/qcom/qdsp6/q6prm.c
@@ -42,6 +42,12 @@ struct prm_cmd_request_rsc {
 	struct audio_hw_clk_cfg clock_id;
 } __packed;
 
+struct prm_cmd_release_rsc {
+	struct apm_module_param_data param_data;
+	uint32_t num_clk_id;
+	struct audio_hw_clk_rel_cfg clock_id;
+} __packed;
+
 static int q6prm_send_cmd_sync(struct q6prm *prm, struct gpr_pkt *pkt, uint32_t rsp_opcode)
 {
 	return audioreach_send_cmd_sync(prm->dev, prm->gdev, &prm->result, &prm->lock,
@@ -102,8 +108,8 @@ int q6prm_unvote_lpass_core_hw(struct device *dev, uint32_t hw_block_id, uint32_
 }
 EXPORT_SYMBOL_GPL(q6prm_unvote_lpass_core_hw);
 
-int q6prm_set_lpass_clock(struct device *dev, int clk_id, int clk_attr, int clk_root,
-			  unsigned int freq)
+static int q6prm_request_lpass_clock(struct device *dev, int clk_id, int clk_attr, int clk_root,
+				     unsigned int freq)
 {
 	struct q6prm *prm = dev_get_drvdata(dev->parent);
 	struct apm_module_param_data *param_data;
@@ -138,6 +144,49 @@ int q6prm_set_lpass_clock(struct device *dev, int clk_id, int clk_attr, int clk_
 
 	return rc;
 }
+
+static int q6prm_release_lpass_clock(struct device *dev, int clk_id, int clk_attr, int clk_root,
+			  unsigned int freq)
+{
+	struct q6prm *prm = dev_get_drvdata(dev->parent);
+	struct apm_module_param_data *param_data;
+	struct prm_cmd_release_rsc *rel;
+	gpr_device_t *gdev = prm->gdev;
+	struct gpr_pkt *pkt;
+	int rc;
+
+	pkt = audioreach_alloc_cmd_pkt(sizeof(*rel), PRM_CMD_RELEASE_HW_RSC, 0, gdev->svc.id,
+				       GPR_PRM_MODULE_IID);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	rel = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	param_data = &rel->param_data;
+
+	param_data->module_instance_id = GPR_PRM_MODULE_IID;
+	param_data->error_code = 0;
+	param_data->param_id = PARAM_ID_RSC_AUDIO_HW_CLK;
+	param_data->param_size = sizeof(*rel) - APM_MODULE_PARAM_DATA_SIZE;
+
+	rel->num_clk_id = 1;
+	rel->clock_id.clock_id = clk_id;
+
+	rc = q6prm_send_cmd_sync(prm, pkt, PRM_CMD_RSP_RELEASE_HW_RSC);
+
+	kfree(pkt);
+
+	return rc;
+}
+
+int q6prm_set_lpass_clock(struct device *dev, int clk_id, int clk_attr, int clk_root,
+			  unsigned int freq)
+{
+	if (freq)
+		return q6prm_request_lpass_clock(dev, clk_id, clk_attr, clk_attr, freq);
+
+	return q6prm_release_lpass_clock(dev, clk_id, clk_attr, clk_attr, freq);
+}
 EXPORT_SYMBOL_GPL(q6prm_set_lpass_clock);
 
 static int prm_callback(struct gpr_resp_pkt *data, void *priv, int op)
-- 
2.21.0

