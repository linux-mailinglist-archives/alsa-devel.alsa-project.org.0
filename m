Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ACB4D9F59
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 16:52:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA55D18E8;
	Tue, 15 Mar 2022 16:51:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA55D18E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647359569;
	bh=g8MNw+McmTcYCuvsqSD7GKdt+xXdnTinHo5EAddYTxQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vPz72y7OvDKmZ9QYM5K/4ym/vkX1ocokV9mmwQCMA1kBUN8+VBJVLvlqZ2ehdBoUZ
	 6pvywA56We4Vd78hUNrtv/GL/vKVROndkNHcoW3+9vL2ppb2nlMWgWTaWfWpk1YSZ8
	 QU4RwXhK52oIMarxzInyQTOTF0dKeaEnihyr2FL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A5A4F80518;
	Tue, 15 Mar 2022 16:51:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5837F8025B; Tue, 15 Mar 2022 16:51:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C58EDF80162
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 16:50:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C58EDF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="bEoyMvag"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647359459; x=1678895459;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=oc3o9zAraAEr29frHp+Jyf45oT9tTWsAvE/U0IEHF24=;
 b=bEoyMvagX96L5ydgk2Jzh/xjPfZ7qEmSRR23OJe6v/aWZE3MUsS5Nf6u
 JUf1GMXwOVLmTo7NlL/oscJS6Tt8c7GgMBP0AVDxS31sklFWTwFmVCdFD
 o9rcEO5lNJEfyqQPvwxJHuQqfE46doqFeLKocqMNujzTVDTwkbiY0Skew 0=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 15 Mar 2022 08:50:52 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 08:50:52 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Mar 2022 08:50:51 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 15 Mar 2022 08:50:45 -0700
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>, Linus Walleij
 <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v11 3/7] pinctrl: qcom: Update macro name to LPI specific
Date: Tue, 15 Mar 2022 21:20:09 +0530
Message-ID: <1647359413-31662-4-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1647359413-31662-1-git-send-email-quic_srivasam@quicinc.com>
References: <1647359413-31662-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Update NO_SLEW macro to LPI_NO_SLEW macro as this driver lpi specific.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 2f19ab4..3c15f80 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -40,7 +40,7 @@
 #define LPI_GPIO_KEEPER			0x2
 #define LPI_GPIO_PULL_UP		0x3
 #define LPI_GPIO_DS_TO_VAL(v)		(v / 2 - 1)
-#define NO_SLEW				-1
+#define LPI_NO_SLEW				-1
 
 #define LPI_FUNCTION(fname)			                \
 	[LPI_MUX_##fname] = {		                \
@@ -193,14 +193,14 @@ static const struct lpi_pingroup sm8250_groups[] = {
 	LPI_PINGROUP(3, 8, swr_rx_clk, qua_mi2s_data, _, _),
 	LPI_PINGROUP(4, 10, swr_rx_data, qua_mi2s_data, _, _),
 	LPI_PINGROUP(5, 12, swr_tx_data, swr_rx_data, _, _),
-	LPI_PINGROUP(6, NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
-	LPI_PINGROUP(7, NO_SLEW, dmic1_data, i2s1_ws, _, _),
-	LPI_PINGROUP(8, NO_SLEW, dmic2_clk, i2s1_data, _, _),
-	LPI_PINGROUP(9, NO_SLEW, dmic2_data, i2s1_data, _, _),
+	LPI_PINGROUP(6, LPI_NO_SLEW, dmic1_clk, i2s1_clk, _,  _),
+	LPI_PINGROUP(7, LPI_NO_SLEW, dmic1_data, i2s1_ws, _, _),
+	LPI_PINGROUP(8, LPI_NO_SLEW, dmic2_clk, i2s1_data, _, _),
+	LPI_PINGROUP(9, LPI_NO_SLEW, dmic2_data, i2s1_data, _, _),
 	LPI_PINGROUP(10, 16, i2s2_clk, wsa_swr_clk, _, _),
 	LPI_PINGROUP(11, 18, i2s2_ws, wsa_swr_data, _, _),
-	LPI_PINGROUP(12, NO_SLEW, dmic3_clk, i2s2_data, _, _),
-	LPI_PINGROUP(13, NO_SLEW, dmic3_data, i2s2_data, _, _),
+	LPI_PINGROUP(12, LPI_NO_SLEW, dmic3_clk, i2s2_data, _, _),
+	LPI_PINGROUP(13, LPI_NO_SLEW, dmic3_data, i2s2_data, _, _),
 };
 
 static const struct lpi_function sm8250_functions[] = {
@@ -435,7 +435,7 @@ static int lpi_config_set(struct pinctrl_dev *pctldev, unsigned int group,
 			}
 
 			slew_offset = g->slew_offset;
-			if (slew_offset == NO_SLEW)
+			if (slew_offset == LPI_NO_SLEW)
 				break;
 
 			mutex_lock(&pctrl->slew_access_lock);
-- 
2.7.4

