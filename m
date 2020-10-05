Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2990D282F5E
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 06:18:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6727182C;
	Mon,  5 Oct 2020 06:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6727182C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601871488;
	bh=/vdSEvhe9iqZwj5GsZNYN8wEo4BZQA3P2+BldHcsrMI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CmHtcx9tO0q4FjzOy/bdxwbqLTtvq+SkCN3LrfnMx5YC522UHBBC8EcVO7MWfKxC9
	 fGyKWfEA3pzWvd319ygaMdpbBcauHwXcvw3Yd90Oge4QwsCn4dgHe9HH9qbKCIKvBM
	 yKpUZRFlwXLjvf/xNX10vuB9G3IDQxHkDQlDlu8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD82CF802F7;
	Mon,  5 Oct 2020 06:14:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EFB2F802F7; Mon,  5 Oct 2020 06:14:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAD35F802E3
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 06:14:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAD35F802E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="MW+S2L1S"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601871275; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=fEiNiE7WcOtOuwWFNUUBWC5/RBsAGoYkHCbf1P9TbYE=;
 b=MW+S2L1SkEYop0XklGbrRiIgoe0++4R+eqR1evAz7VmUuXzPRnjDgv3U3rUGA7sOB2J7iznV
 z8O2QLtaFFS63rcH91ZG9nIBVKCq8Y3uOvuct5RB+IJinc69BnIzMb0RCrZCBUDPbB3f/pOo
 1mkxo5+YhdJDdR5oIQz8H4WhGBI=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f7a9dabad37af35ec80c79b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Oct 2020 04:14:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CB3EBC433FE; Mon,  5 Oct 2020 04:14:34 +0000 (UTC)
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 38B15C433F1;
 Mon,  5 Oct 2020 04:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 38B15C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 7/7] ASoC: qcom: sc7180: Add support for audio over DP
Date: Mon,  5 Oct 2020 09:43:35 +0530
Message-Id: <1601871215-26200-8-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601871215-26200-1-git-send-email-srivasam@codeaurora.org>
References: <1601871215-26200-1-git-send-email-srivasam@codeaurora.org>
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 Srinivasa Rao <srivasam@codeaurora.org>
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

From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

Add support for audio playback over DP in lpass
sc7180 platform driver. Update lpass_variant
structure for hdmi data configuaration.

Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
---
 sound/soc/qcom/lpass-sc7180.c | 116 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 102 insertions(+), 14 deletions(-)

diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index a8a3d8f..c6292f9e 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -60,38 +60,65 @@ static struct snd_soc_dai_driver sc7180_lpass_cpu_dai_driver[] = {
 		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
 		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
 	},
+	[LPASS_DP_RX] = {
+		.id = LPASS_DP_RX,
+		.name = "Hdmi",
+		.playback = {
+			.stream_name = "Hdmi Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S24,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.ops    = &asoc_qcom_lpass_hdmi_dai_ops,
+	},
 };
 
 static int sc7180_lpass_alloc_dma_channel(struct lpass_data *drvdata,
-					   int direction)
+					   int direction, unsigned int dai_id)
 {
 	struct lpass_variant *v = drvdata->variant;
 	int chan = 0;
 
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
-		chan = find_first_zero_bit(&drvdata->dma_ch_bit_map,
-					v->rdma_channels);
+	if (dai_id == LPASS_DP_RX) {
+		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			chan = find_first_zero_bit(&drvdata->hdmi_dma_ch_bit_map,
+						v->hdmi_rdma_channels);
+
+			if (chan >= v->hdmi_rdma_channels)
+				return -EBUSY;
+		}
+		set_bit(chan, &drvdata->hdmi_dma_ch_bit_map);
+	} else {
+		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			chan = find_first_zero_bit(&drvdata->dma_ch_bit_map,
+						v->rdma_channels);
 
 		if (chan >= v->rdma_channels)
 			return -EBUSY;
-	} else {
-		chan = find_next_zero_bit(&drvdata->dma_ch_bit_map,
+		} else {
+			chan = find_next_zero_bit(&drvdata->dma_ch_bit_map,
 					v->wrdma_channel_start +
 					v->wrdma_channels,
 					v->wrdma_channel_start);
 
-		if (chan >=  v->wrdma_channel_start + v->wrdma_channels)
-			return -EBUSY;
-	}
-
-	set_bit(chan, &drvdata->dma_ch_bit_map);
+			if (chan >=  v->wrdma_channel_start + v->wrdma_channels)
+				return -EBUSY;
+		}
 
+		set_bit(chan, &drvdata->dma_ch_bit_map);
+	}
 	return chan;
 }
 
-static int sc7180_lpass_free_dma_channel(struct lpass_data *drvdata, int chan)
+static int sc7180_lpass_free_dma_channel(struct lpass_data *drvdata, int chan, unsigned int dai_id)
 {
-	clear_bit(chan, &drvdata->dma_ch_bit_map);
+	if (dai_id == LPASS_DP_RX)
+		clear_bit(chan, &drvdata->hdmi_dma_ch_bit_map);
+	else
+		clear_bit(chan, &drvdata->dma_ch_bit_map);
 
 	return 0;
 }
@@ -144,6 +171,9 @@ static struct lpass_variant sc7180_data = {
 	.rdma_reg_base		= 0xC000,
 	.rdma_reg_stride	= 0x1000,
 	.rdma_channels		= 5,
+	.hdmi_rdma_reg_base		= 0x64000,
+	.hdmi_rdma_reg_stride	= 0x1000,
+	.hdmi_rdma_channels		= 4,
 	.dmactl_audif_start	= 1,
 	.wrdma_reg_base		= 0x18000,
 	.wrdma_reg_stride	= 0x1000,
@@ -163,7 +193,7 @@ static struct lpass_variant sc7180_data = {
 	.rdma_dyncclk		= REG_FIELD_ID(0xC000, 21, 21, 5, 0x1000),
 	.rdma_bursten		= REG_FIELD_ID(0xC000, 20, 20, 5, 0x1000),
 	.rdma_wpscnt		= REG_FIELD_ID(0xC000, 16, 19, 5, 0x1000),
-	.rdma_intf		= REG_FIELD_ID(0xC000, 12, 15, 5, 0x1000),
+	.rdma_intf			= REG_FIELD_ID(0xC000, 12, 15, 5, 0x1000),
 	.rdma_fifowm		= REG_FIELD_ID(0xC000, 1, 5, 5, 0x1000),
 	.rdma_enable		= REG_FIELD_ID(0xC000, 0, 0, 5, 0x1000),
 
@@ -174,6 +204,64 @@ static struct lpass_variant sc7180_data = {
 	.wrdma_fifowm		= REG_FIELD_ID(0x18000, 1, 5, 4, 0x1000),
 	.wrdma_enable		= REG_FIELD_ID(0x18000, 0, 0, 4, 0x1000),
 
+	.hdmi_tx_ctl_addr	= 0x1000,
+	.hdmi_legacy_addr	= 0x1008,
+	.hdmi_vbit_addr		= 0x610c0,
+	.hdmi_ch_lsb_addr	= 0x61048,
+	.hdmi_ch_msb_addr	= 0x6104c,
+	.ch_stride		= 0x8,
+	.hdmi_parity_addr	= 0x61034,
+	.hdmi_dmactl_addr	= 0x61038,
+	.hdmi_dma_stride	= 0x4,
+	.hdmi_DP_addr		= 0x610c8,
+	.hdmi_sstream_addr	= 0x6101c,
+	.hdmi_irq_reg_base		= 0x63000,
+	.hdmi_irq_ports		= 1,
+
+	.hdmi_rdma_dyncclk		= REG_FIELD_ID(0x64000, 14, 14, 4, 0x1000),
+	.hdmi_rdma_bursten		= REG_FIELD_ID(0x64000, 13, 13, 4, 0x1000),
+	.hdmi_rdma_burst8		= REG_FIELD_ID(0x64000, 15, 15, 4, 0x1000),
+	.hdmi_rdma_burst16		= REG_FIELD_ID(0x64000, 16, 16, 4, 0x1000),
+	.hdmi_rdma_dynburst		= REG_FIELD_ID(0x64000, 18, 18, 4, 0x1000),
+	.hdmi_rdma_wpscnt		= REG_FIELD_ID(0x64000, 10, 12, 4, 0x1000),
+	.hdmi_rdma_fifowm		= REG_FIELD_ID(0x64000, 1, 5, 4, 0x1000),
+	.hdmi_rdma_enable		= REG_FIELD_ID(0x64000, 0, 0, 4, 0x1000),
+
+	.sstream_en		= REG_FIELD(0x6101c, 0, 0),
+	.dma_sel			= REG_FIELD(0x6101c, 1, 2),
+	.auto_bbit_en	= REG_FIELD(0x6101c, 3, 3),
+	.layout			= REG_FIELD(0x6101c, 4, 4),
+	.layout_sp		= REG_FIELD(0x6101c, 5, 8),
+	.set_sp_on_en	= REG_FIELD(0x6101c, 10, 10),
+	.dp_audio		= REG_FIELD(0x6101c, 11, 11),
+	.dp_staffing_en	= REG_FIELD(0x6101c, 12, 12),
+	.dp_sp_b_hw_en	= REG_FIELD(0x6101c, 13, 13),
+
+	.mute			= REG_FIELD(0x610c8, 0, 0),
+	.as_sdp_cc		= REG_FIELD(0x610c8, 1, 3),
+	.as_sdp_ct		= REG_FIELD(0x610c8, 4, 7),
+	.aif_db4			= REG_FIELD(0x610c8, 8, 15),
+	.frequency		= REG_FIELD(0x610c8, 16, 21),
+	.mst_index		= REG_FIELD(0x610c8, 28, 29),
+	.dptx_index		= REG_FIELD(0x610c8, 30, 31),
+
+	.soft_reset		= REG_FIELD(0x1000, 31, 31),
+	.force_reset	= REG_FIELD(0x1000, 30, 30),
+
+	.use_hw_chs		= REG_FIELD(0x61038, 0, 0),
+	.use_hw_usr		= REG_FIELD(0x61038, 1, 1),
+	.hw_chs_sel		= REG_FIELD(0x61038, 2, 4),
+	.hw_usr_sel		= REG_FIELD(0x61038, 5, 6),
+
+	.replace_vbit	= REG_FIELD(0x610c0, 0, 0),
+	.vbit_stream	= REG_FIELD(0x610c0, 1, 1),
+
+	.legacy_en		=  REG_FIELD(0x1008, 0, 0),
+	.calc_en		=  REG_FIELD(0x61034, 0, 0),
+	.lsb_bits		=  REG_FIELD(0x61048, 0, 31),
+	.msb_bits		=  REG_FIELD(0x6104c, 0, 31),
+
+
 	.clk_name		= (const char*[]) {
 				   "pcnoc-sway-clk",
 				   "audio-core",
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

