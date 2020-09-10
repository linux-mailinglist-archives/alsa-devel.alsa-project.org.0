Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DA42643D1
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 12:23:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E836C1695;
	Thu, 10 Sep 2020 12:22:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E836C1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599733427;
	bh=sahX/gXkktSxk1p2DRXtU1ADazk+H8jvKQQOsnbd/Bs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G3rSXT6gKlXIzOhOJd83fkfsXvPSo+HpgsnqKXAG7hJ2LXj3xGzgr7rEtPsFSBZIr
	 vc0Uis9Ixl9Ip4YJcYw9XJWY+BL7OhfYRTJlkYQqySELmTBdHlln50wzVHMYyorAY+
	 VuraBepZsFF0EsVuQ1rt9oeg88XBUOgbQ15vzxG0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09C98F80306;
	Thu, 10 Sep 2020 12:18:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4EDAF802E1; Thu, 10 Sep 2020 12:18:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73C02F802C4
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 12:17:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73C02F802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Q4nRiOk7"
Received: by mail-wr1-x444.google.com with SMTP id s12so6043919wrw.11
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 03:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8bRTU8pthtdc5exifPcJ/72rhAqstkkv8aWsmQdcsLQ=;
 b=Q4nRiOk7rNVQQICvXsEmCDU8Qxq/zPCgyRrf06DwYIHZKFAmyYgiS3BzZ/ESKS3Z8O
 YzE5DtWIZUGRyzq975KU79P3ATuuchvWakwtMAqeRx1fGLwrMt5IKj88rVEeucI7AUm+
 B3qXareBx+AU2M8hZhyLq3un6jP/aNYfZe1/3nXXgMaJlzDLH/2Q9WwxVMqd/NMrPMgE
 vNOgSWwg32URHGdU93NjvqQ52ZMGUePoDRNMVHXMgWmmIltDGD+Bo+qoZK188WfA9x3R
 7VIlT3GTEafHD4Ht5KSD2SZI5WvRLRMT7RBS1YUAw0dPdljpbLQiPkH+JIWQzVGkdFvE
 ZrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8bRTU8pthtdc5exifPcJ/72rhAqstkkv8aWsmQdcsLQ=;
 b=ilHbY2C2s2MsA9px0s0BbJfp3aRp5j/PJYNZKFO5RMYG9Ithjk89T/1BcqDxeFGcQQ
 tVUgTqPlUklAGyO0DC/Om1ls6w+b5EOUoDHJB9R3FBXy/oyjXpXx9JUyrLlxsy4zZjQ8
 9uwUIUq73iFrMe4CEPM/PfNRmdTlxpVCdJR5MfYYdOpI+yV7374JiJxJd1snfx3dLhEB
 SjKUWpDIQw30YQ/Oq3VeAZpYyfFEQsf5KrLWnfg9dQ/qa/nFnAz41+pFGx/xbgE08j8D
 xRIDCHGm1aDrec0VfN4CGVq6wA9vRzhTjL8lG1L65PATrCQH7Ct+uVctmxoEzdIcunpX
 rgOQ==
X-Gm-Message-State: AOAM533+6eSLoPsY5f36YB5ws3yPttnAqgdOOaOfI+hthmM8xoKwTpvI
 u1YSDDAeiBN+kGJXQQf7cBDv2g==
X-Google-Smtp-Source: ABdhPJz56AXyfzVlQkiaiwc+AGSB3xOkP7QpWQR8eayAG/RxewXIeyNeQbO7sjiqnCkNG6Vmt0hiJw==
X-Received: by 2002:a5d:5261:: with SMTP id l1mr8184447wrc.193.1599733076251; 
 Thu, 10 Sep 2020 03:17:56 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id m4sm8851731wro.18.2020.09.10.03.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 03:17:55 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 7/8] ASoC: q6dsp: q6afe: add codec lpass clocks
Date: Thu, 10 Sep 2020 11:17:31 +0100
Message-Id: <20200910101732.23484-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200910101732.23484-1-srinivas.kandagatla@linaro.org>
References: <20200910101732.23484-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

LPASS now has integrated codec control whose clocks are controlled by Q6DSP.
This patch adds support to those clocks.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6afe.c | 24 ++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6afe.h | 11 +++++++++++
 2 files changed, 35 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 9ed5537ee58e..688878a002a4 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -359,6 +359,7 @@
 #define TIMEOUT_MS 1000
 #define AFE_CMD_RESP_AVAIL	0
 #define AFE_CMD_RESP_NONE	1
+#define AFE_CLK_TOKEN		1024
 
 struct q6afe {
 	struct apr_device *apr;
@@ -887,6 +888,9 @@ static int q6afe_callback(struct apr_device *adev, struct apr_resp_pkt *data)
 				port->result = *res;
 				wake_up(&port->wait);
 				kref_put(&port->refcount, q6afe_port_free);
+			} else if (hdr->token == AFE_CLK_TOKEN) {
+				afe->result = *res;
+				wake_up(&afe->wait);
 			}
 			break;
 		default:
@@ -1094,6 +1098,25 @@ static int q6afe_set_digital_codec_core_clock(struct q6afe_port *port,
 				       sizeof(*cfg));
 }
 
+int q6afe_set_lpass_clock(struct device *dev, int clk_id, int attri,
+			  int clk_root, unsigned int freq)
+{
+	struct q6afe *afe = dev_get_drvdata(dev->parent);
+	struct afe_clk_set cset = {0,};
+
+	cset.clk_set_minor_version = AFE_API_VERSION_CLOCK_SET;
+	cset.clk_id = clk_id;
+	cset.clk_freq_in_hz = freq;
+	cset.clk_attri = attri;
+	cset.clk_root = clk_root;
+	cset.enable = !!freq;
+
+	return q6afe_set_param(afe, NULL, &cset, AFE_PARAM_ID_CLOCK_SET,
+			       AFE_MODULE_CLOCK_SET, sizeof(cset),
+			       AFE_CLK_TOKEN);
+}
+EXPORT_SYMBOL_GPL(q6afe_set_lpass_clock);
+
 int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
 			  int clk_src, int clk_root,
 			  unsigned int freq, int dir)
@@ -1130,6 +1153,7 @@ int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
 	case Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT ... Q6AFE_LPASS_CLK_ID_QUI_MI2S_OSR:
 	case Q6AFE_LPASS_CLK_ID_MCLK_1 ... Q6AFE_LPASS_CLK_ID_INT_MCLK_1:
 	case Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT ... Q6AFE_LPASS_CLK_ID_QUIN_TDM_EBIT:
+	case Q6AFE_LPASS_CLK_ID_WSA_CORE_MCLK ... Q6AFE_LPASS_CLK_ID_VA_CORE_2X_MCLK:
 		cset.clk_set_minor_version = AFE_API_VERSION_CLOCK_SET;
 		cset.clk_id = clk_id;
 		cset.clk_freq_in_hz = freq;
diff --git a/sound/soc/qcom/qdsp6/q6afe.h b/sound/soc/qcom/qdsp6/q6afe.h
index 93592670ef0b..22e10269aa10 100644
--- a/sound/soc/qcom/qdsp6/q6afe.h
+++ b/sound/soc/qcom/qdsp6/q6afe.h
@@ -133,6 +133,15 @@
 /* Clock ID for INT MCLK1 */
 #define Q6AFE_LPASS_CLK_ID_INT_MCLK_1                             0x306
 
+#define Q6AFE_LPASS_CLK_ID_WSA_CORE_MCLK			0x309
+#define Q6AFE_LPASS_CLK_ID_WSA_CORE_NPL_MCLK			0x30a
+#define Q6AFE_LPASS_CLK_ID_TX_CORE_MCLK				0x30c
+#define Q6AFE_LPASS_CLK_ID_TX_CORE_NPL_MCLK			0x30d
+#define Q6AFE_LPASS_CLK_ID_RX_CORE_MCLK				0x30e
+#define Q6AFE_LPASS_CLK_ID_RX_CORE_NPL_MCLK			0x30f
+#define Q6AFE_LPASS_CLK_ID_VA_CORE_MCLK				0x30b
+#define Q6AFE_LPASS_CLK_ID_VA_CORE_2X_MCLK			0x310
+
 #define Q6AFE_LPASS_CORE_AVTIMER_BLOCK			0x2
 #define Q6AFE_LPASS_CORE_HW_MACRO_BLOCK			0x3
 #define Q6AFE_LPASS_CORE_HW_DCODEC_BLOCK		0x4
@@ -224,6 +233,8 @@ void q6afe_cdc_dma_port_prepare(struct q6afe_port *port,
 int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
 			  int clk_src, int clk_root,
 			  unsigned int freq, int dir);
+int q6afe_set_lpass_clock(struct device *dev, int clk_id, int clk_src,
+			  int clk_root, unsigned int freq);
 int q6afe_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
 			     char *client_name, uint32_t *client_handle);
 int q6afe_unvote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
-- 
2.21.0

