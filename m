Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C302643CB
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 12:22:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9FDF1692;
	Thu, 10 Sep 2020 12:21:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9FDF1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599733342;
	bh=QQLeeA3954mWJcS5/niX7iYx8vKvyQ5ieThsHDg58W0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XXH5D7feNs1NhA3QIPaIdwtTL0pY59fIas7KOUs8DzlUhPcxHPLGJqgOHXQS1G7Kc
	 Qb9VORiTS3l4/gRlf07+dAHj/2vvvvZOAX5+V9csdwjUNujSpOlKNzG5y3Qr61lu9k
	 n3LvwRmD1k092TEOohL9DaJcFaarIMltiWZ9grK8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42D92F802EC;
	Thu, 10 Sep 2020 12:18:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FA8DF802DF; Thu, 10 Sep 2020 12:18:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F953F801F2
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 12:17:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F953F801F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="y49qLon9"
Received: by mail-wr1-x436.google.com with SMTP id t10so6095048wrv.1
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 03:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zHBmx055sbBg7MqNM/uYc59WPPRKIM4LLsW0G6hMtvg=;
 b=y49qLon9Y4Etak0KwvCgdmRAo1Pq/cipmeh1cqbXkWTIG5zuMIGASeDjTmIS83m5Kg
 62z6dAzb7pb53LWlRZBQ4Ykbf40jVFYp3DNY91VtyzZ/QMdW2wYOLVtjukcMTfMoY38r
 zyuuMjqA+IDbOrLNEGNtr6MVmnBm+LO/YycDzuDZIvH2RuV3nWFID0UmfpqdKQeGwwuH
 49qkQyc1mCakmJ19LP9N9QfJcg25xU200US+bjTV42GlIZsY3FLFgHyrJKMiZJM4VWkr
 KxxbvjVzAfKxMzZJOSk48JLuK/Hke24sWdK4A1bbzEh0lmy3ObRjPM8A2ng6JY+k3QuD
 rZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zHBmx055sbBg7MqNM/uYc59WPPRKIM4LLsW0G6hMtvg=;
 b=iPalIr9f9D0FktIAuAJLoPEMckeL2dg+H5+HGg6GcdGHYgbGVuc5T2E7TERoO+IzG4
 owu1A7Z7vA2La1S4cgBllZyq9eLyBc7lYb44vUqiTQoUXijMEUy71JzzC6AKt74YQZYX
 P2CM7sTwRSSsRq5GKxZH2ygrjtwgFKzzWW6ADCTXTUzauJUDN4oZCNIvxW7fyxV7NOvH
 5UH7TsUsJ9izPz62ErzTZExoEXroMP8HhYjkKR76BJaqAHL4ifGSh/i2LLTRTC148CJG
 Ixo7ynTC7cpInc/L1XPI/cnCby531EPftUqYUqad74trfDyLA/J29wycs/x/CA7z9IYS
 dRUQ==
X-Gm-Message-State: AOAM5316c9eXNJYvVbmhsqKjNEzxuOPvcPrlu3Cosek5LuC/aS2DwHMu
 XvV6AojtsMjYB2ZnNZmabzlTaw==
X-Google-Smtp-Source: ABdhPJxE6xAn8FhlHViC8YqDPkyu5r9y93x+ZpcBSaE5gk4i+oOB70VUqDZL0NkNpuuhkUb39yTOZQ==
X-Received: by 2002:a5d:4591:: with SMTP id p17mr8083560wrq.408.1599733068711; 
 Thu, 10 Sep 2020 03:17:48 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id m4sm8851731wro.18.2020.09.10.03.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 03:17:48 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/8] ASoC: q6dsp: q6afe: add support to Codec DMA ports
Date: Thu, 10 Sep 2020 11:17:25 +0100
Message-Id: <20200910101732.23484-2-srinivas.kandagatla@linaro.org>
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

New LPASS supports various codec macros, DSP firmware already
has support to those ports. Add corresponding configuration
support to those ports in adsp drivers.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 include/dt-bindings/sound/qcom,q6afe.h |  22 +++++
 sound/soc/qcom/qdsp6/q6afe.c           | 127 ++++++++++++++++++++++++-
 sound/soc/qcom/qdsp6/q6afe.h           |  14 ++-
 3 files changed, 161 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/sound/qcom,q6afe.h b/include/dt-bindings/sound/qcom,q6afe.h
index 1df06f8ad5c3..7207ab2b57bf 100644
--- a/include/dt-bindings/sound/qcom,q6afe.h
+++ b/include/dt-bindings/sound/qcom,q6afe.h
@@ -107,6 +107,28 @@
 #define QUINARY_TDM_RX_7	102
 #define QUINARY_TDM_TX_7	103
 #define DISPLAY_PORT_RX		104
+#define WSA_CODEC_DMA_RX_0	105
+#define WSA_CODEC_DMA_TX_0	106
+#define WSA_CODEC_DMA_RX_1	107
+#define WSA_CODEC_DMA_TX_1	108
+#define WSA_CODEC_DMA_TX_2	109
+#define VA_CODEC_DMA_TX_0	110
+#define VA_CODEC_DMA_TX_1	111
+#define VA_CODEC_DMA_TX_2	112
+#define RX_CODEC_DMA_RX_0	113
+#define TX_CODEC_DMA_TX_0	114
+#define RX_CODEC_DMA_RX_1	115
+#define TX_CODEC_DMA_TX_1	116
+#define RX_CODEC_DMA_RX_2	117
+#define TX_CODEC_DMA_TX_2	118
+#define RX_CODEC_DMA_RX_3	119
+#define TX_CODEC_DMA_TX_3	120
+#define RX_CODEC_DMA_RX_4	121
+#define TX_CODEC_DMA_TX_4	122
+#define RX_CODEC_DMA_RX_5	123
+#define TX_CODEC_DMA_TX_5	124
+#define RX_CODEC_DMA_RX_6	125
+#define RX_CODEC_DMA_RX_7	126
 
 #endif /* __DT_BINDINGS_Q6_AFE_H__ */
 
diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index e0945f7a58c8..8ceefb431bcb 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -42,6 +42,7 @@
 #define AFE_PARAM_ID_I2S_CONFIG	0x0001020D
 #define AFE_PARAM_ID_TDM_CONFIG	0x0001029D
 #define AFE_PARAM_ID_PORT_SLOT_MAPPING_CONFIG	0x00010297
+#define AFE_PARAM_ID_CODEC_DMA_CONFIG	0x000102B8
 
 /* I2S config specific */
 #define AFE_API_VERSION_I2S_CONFIG	0x1
@@ -299,12 +300,58 @@
 #define AFE_PORT_ID_QUINARY_TDM_TX_7 \
 	(AFE_PORT_ID_QUINARY_TDM_TX + 0x0E)
 
+/* AFE WSA Codec DMA Rx port 0 */
+#define AFE_PORT_ID_WSA_CODEC_DMA_RX_0	0xB000
+/* AFE WSA Codec DMA Tx port 0 */
+#define AFE_PORT_ID_WSA_CODEC_DMA_TX_0	0xB001
+/* AFE WSA Codec DMA Rx port 1 */
+#define AFE_PORT_ID_WSA_CODEC_DMA_RX_1	0xB002
+/* AFE WSA Codec DMA Tx port 1 */
+#define AFE_PORT_ID_WSA_CODEC_DMA_TX_1	0xB003
+/* AFE WSA Codec DMA Tx port 2 */
+#define AFE_PORT_ID_WSA_CODEC_DMA_TX_2	0xB005
+/* AFE VA Codec DMA Tx port 0 */
+#define AFE_PORT_ID_VA_CODEC_DMA_TX_0	0xB021
+/* AFE VA Codec DMA Tx port 1 */
+#define AFE_PORT_ID_VA_CODEC_DMA_TX_1	0xB023
+/* AFE VA Codec DMA Tx port 2 */
+#define AFE_PORT_ID_VA_CODEC_DMA_TX_2	0xB025
+/* AFE Rx Codec DMA Rx port 0 */
+#define AFE_PORT_ID_RX_CODEC_DMA_RX_0	0xB030
+/* AFE Tx Codec DMA Tx port 0 */
+#define AFE_PORT_ID_TX_CODEC_DMA_TX_0	0xB031
+/* AFE Rx Codec DMA Rx port 1 */
+#define AFE_PORT_ID_RX_CODEC_DMA_RX_1	0xB032
+/* AFE Tx Codec DMA Tx port 1 */
+#define AFE_PORT_ID_TX_CODEC_DMA_TX_1	0xB033
+/* AFE Rx Codec DMA Rx port 2 */
+#define AFE_PORT_ID_RX_CODEC_DMA_RX_2	0xB034
+/* AFE Tx Codec DMA Tx port 2 */
+#define AFE_PORT_ID_TX_CODEC_DMA_TX_2	0xB035
+/* AFE Rx Codec DMA Rx port 3 */
+#define AFE_PORT_ID_RX_CODEC_DMA_RX_3	0xB036
+/* AFE Tx Codec DMA Tx port 3 */
+#define AFE_PORT_ID_TX_CODEC_DMA_TX_3	0xB037
+/* AFE Rx Codec DMA Rx port 4 */
+#define AFE_PORT_ID_RX_CODEC_DMA_RX_4	0xB038
+/* AFE Tx Codec DMA Tx port 4 */
+#define AFE_PORT_ID_TX_CODEC_DMA_TX_4	0xB039
+/* AFE Rx Codec DMA Rx port 5 */
+#define AFE_PORT_ID_RX_CODEC_DMA_RX_5	0xB03A
+/* AFE Tx Codec DMA Tx port 5 */
+#define AFE_PORT_ID_TX_CODEC_DMA_TX_5	0xB03B
+/* AFE Rx Codec DMA Rx port 6 */
+#define AFE_PORT_ID_RX_CODEC_DMA_RX_6	0xB03C
+/* AFE Rx Codec DMA Rx port 7 */
+#define AFE_PORT_ID_RX_CODEC_DMA_RX_7	0xB03E
+
 #define Q6AFE_LPASS_MODE_CLK1_VALID 1
 #define Q6AFE_LPASS_MODE_CLK2_VALID 2
 #define Q6AFE_LPASS_CLK_SRC_INTERNAL 1
 #define Q6AFE_LPASS_CLK_ROOT_DEFAULT 0
 #define AFE_API_VERSION_TDM_CONFIG              1
 #define AFE_API_VERSION_SLOT_MAPPING_CONFIG	1
+#define AFE_API_VERSION_CODEC_DMA_CONFIG	1
 
 #define TIMEOUT_MS 1000
 #define AFE_CMD_RESP_AVAIL	0
@@ -448,11 +495,21 @@ struct afe_param_id_tdm_cfg {
 	u32	slot_mask;
 } __packed;
 
+struct afe_param_id_cdc_dma_cfg {
+	u32	cdc_dma_cfg_minor_version;
+	u32	sample_rate;
+	u16	bit_width;
+	u16	data_format;
+	u16	num_channels;
+	u16	active_channels_mask;
+} __packed;
+
 union afe_port_config {
 	struct afe_param_id_hdmi_multi_chan_audio_cfg hdmi_multi_ch;
 	struct afe_param_id_slimbus_cfg           slim_cfg;
 	struct afe_param_id_i2s_cfg	i2s_cfg;
 	struct afe_param_id_tdm_cfg	tdm_cfg;
+	struct afe_param_id_cdc_dma_cfg	dma_cfg;
 } __packed;
 
 
@@ -707,6 +764,50 @@ static struct afe_port_map port_maps[AFE_PORT_MAX] = {
 				QUINARY_TDM_TX_7, 0, 1},
 	[DISPLAY_PORT_RX] = { AFE_PORT_ID_HDMI_OVER_DP_RX,
 				DISPLAY_PORT_RX, 1, 1},
+	[WSA_CODEC_DMA_RX_0] = { AFE_PORT_ID_WSA_CODEC_DMA_RX_0,
+				WSA_CODEC_DMA_RX_0, 1, 1},
+	[WSA_CODEC_DMA_TX_0] = { AFE_PORT_ID_WSA_CODEC_DMA_TX_0,
+				WSA_CODEC_DMA_TX_0, 0, 1},
+	[WSA_CODEC_DMA_RX_1] = { AFE_PORT_ID_WSA_CODEC_DMA_RX_1,
+				WSA_CODEC_DMA_RX_1, 1, 1},
+	[WSA_CODEC_DMA_TX_1] = { AFE_PORT_ID_WSA_CODEC_DMA_TX_1,
+				WSA_CODEC_DMA_TX_1, 0, 1},
+	[WSA_CODEC_DMA_TX_2] = { AFE_PORT_ID_WSA_CODEC_DMA_TX_2,
+				WSA_CODEC_DMA_TX_2, 0, 1},
+	[VA_CODEC_DMA_TX_0] = { AFE_PORT_ID_VA_CODEC_DMA_TX_0,
+				VA_CODEC_DMA_TX_0, 0, 1},
+	[VA_CODEC_DMA_TX_1] = { AFE_PORT_ID_VA_CODEC_DMA_TX_1,
+				VA_CODEC_DMA_TX_1, 0, 1},
+	[VA_CODEC_DMA_TX_2] = { AFE_PORT_ID_VA_CODEC_DMA_TX_2,
+				VA_CODEC_DMA_TX_2, 0, 1},
+	[RX_CODEC_DMA_RX_0] = { AFE_PORT_ID_RX_CODEC_DMA_RX_0,
+				RX_CODEC_DMA_RX_0, 1, 1},
+	[TX_CODEC_DMA_TX_0] = { AFE_PORT_ID_TX_CODEC_DMA_TX_0,
+				TX_CODEC_DMA_TX_0, 0, 1},
+	[RX_CODEC_DMA_RX_1] = { AFE_PORT_ID_RX_CODEC_DMA_RX_1,
+				RX_CODEC_DMA_RX_1, 1, 1},
+	[TX_CODEC_DMA_TX_1] = { AFE_PORT_ID_TX_CODEC_DMA_TX_1,
+				TX_CODEC_DMA_TX_1, 0, 1},
+	[RX_CODEC_DMA_RX_2] = { AFE_PORT_ID_RX_CODEC_DMA_RX_2,
+				RX_CODEC_DMA_RX_2, 1, 1},
+	[TX_CODEC_DMA_TX_2] = { AFE_PORT_ID_TX_CODEC_DMA_TX_2,
+				TX_CODEC_DMA_TX_2, 0, 1},
+	[RX_CODEC_DMA_RX_3] = { AFE_PORT_ID_RX_CODEC_DMA_RX_3,
+				RX_CODEC_DMA_RX_3, 1, 1},
+	[TX_CODEC_DMA_TX_3] = { AFE_PORT_ID_TX_CODEC_DMA_TX_3,
+				TX_CODEC_DMA_TX_3, 0, 1},
+	[RX_CODEC_DMA_RX_4] = { AFE_PORT_ID_RX_CODEC_DMA_RX_4,
+				RX_CODEC_DMA_RX_4, 1, 1},
+	[TX_CODEC_DMA_TX_4] = { AFE_PORT_ID_TX_CODEC_DMA_TX_4,
+				TX_CODEC_DMA_TX_4, 0, 1},
+	[RX_CODEC_DMA_RX_5] = { AFE_PORT_ID_RX_CODEC_DMA_RX_5,
+				RX_CODEC_DMA_RX_5, 1, 1},
+	[TX_CODEC_DMA_TX_5] = { AFE_PORT_ID_TX_CODEC_DMA_TX_5,
+				TX_CODEC_DMA_TX_5, 0, 1},
+	[RX_CODEC_DMA_RX_6] = { AFE_PORT_ID_RX_CODEC_DMA_RX_6,
+				RX_CODEC_DMA_RX_6, 1, 1},
+	[RX_CODEC_DMA_RX_7] = { AFE_PORT_ID_RX_CODEC_DMA_RX_7,
+				RX_CODEC_DMA_RX_7, 1, 1},
 };
 
 static void q6afe_port_free(struct kref *ref)
@@ -1288,6 +1389,28 @@ int q6afe_i2s_port_prepare(struct q6afe_port *port, struct q6afe_i2s_cfg *cfg)
 }
 EXPORT_SYMBOL_GPL(q6afe_i2s_port_prepare);
 
+/**
+ * q6afe_dam_port_prepare() - Prepare dma afe port.
+ *
+ * @port: Instance of afe port
+ * @cfg: DMA configuration for the afe port
+ *
+ */
+void q6afe_cdc_dma_port_prepare(struct q6afe_port *port,
+				struct q6afe_cdc_dma_cfg *cfg)
+{
+	union afe_port_config *pcfg = &port->port_cfg;
+	struct afe_param_id_cdc_dma_cfg *dma_cfg = &pcfg->dma_cfg;
+
+	dma_cfg->cdc_dma_cfg_minor_version = AFE_API_VERSION_CODEC_DMA_CONFIG;
+	dma_cfg->sample_rate = cfg->sample_rate;
+	dma_cfg->bit_width = cfg->bit_width;
+	dma_cfg->data_format = cfg->data_format;
+	dma_cfg->num_channels = cfg->num_channels;
+	if (!cfg->active_channels_mask)
+		dma_cfg->active_channels_mask = (1 << cfg->num_channels) - 1;
+}
+EXPORT_SYMBOL_GPL(q6afe_cdc_dma_port_prepare);
 /**
  * q6afe_port_start() - Start a afe port
  *
@@ -1420,7 +1543,9 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
 	case AFE_PORT_ID_PRIMARY_TDM_RX ... AFE_PORT_ID_QUINARY_TDM_TX_7:
 		cfg_type = AFE_PARAM_ID_TDM_CONFIG;
 		break;
-
+	case AFE_PORT_ID_WSA_CODEC_DMA_RX_0 ... AFE_PORT_ID_RX_CODEC_DMA_RX_7:
+		cfg_type = AFE_PARAM_ID_CODEC_DMA_CONFIG;
+	break;
 	default:
 		dev_err(dev, "Invalid port id 0x%x\n", port_id);
 		return ERR_PTR(-EINVAL);
diff --git a/sound/soc/qcom/qdsp6/q6afe.h b/sound/soc/qcom/qdsp6/q6afe.h
index c7ed5422baff..1f7cbed9335d 100644
--- a/sound/soc/qcom/qdsp6/q6afe.h
+++ b/sound/soc/qcom/qdsp6/q6afe.h
@@ -5,7 +5,7 @@
 
 #include <dt-bindings/sound/qcom,q6afe.h>
 
-#define AFE_PORT_MAX		105
+#define AFE_PORT_MAX		127
 
 #define MSM_AFE_PORT_TYPE_RX 0
 #define MSM_AFE_PORT_TYPE_TX 1
@@ -184,11 +184,21 @@ struct q6afe_tdm_cfg {
 	u16	ch_mapping[AFE_MAX_CHAN_COUNT];
 };
 
+struct q6afe_cdc_dma_cfg {
+	u16	sample_rate;
+	u16	bit_width;
+	u16	data_format;
+	u16	num_channels;
+	u16	active_channels_mask;
+};
+
+
 struct q6afe_port_config {
 	struct q6afe_hdmi_cfg hdmi;
 	struct q6afe_slim_cfg slim;
 	struct q6afe_i2s_cfg i2s_cfg;
 	struct q6afe_tdm_cfg tdm;
+	struct q6afe_cdc_dma_cfg dma_cfg;
 };
 
 struct q6afe_port;
@@ -204,6 +214,8 @@ void q6afe_slim_port_prepare(struct q6afe_port *port,
 			  struct q6afe_slim_cfg *cfg);
 int q6afe_i2s_port_prepare(struct q6afe_port *port, struct q6afe_i2s_cfg *cfg);
 void q6afe_tdm_port_prepare(struct q6afe_port *port, struct q6afe_tdm_cfg *cfg);
+void q6afe_cdc_dma_port_prepare(struct q6afe_port *port,
+				struct q6afe_cdc_dma_cfg *cfg);
 
 int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
 			  int clk_src, int clk_root,
-- 
2.21.0

