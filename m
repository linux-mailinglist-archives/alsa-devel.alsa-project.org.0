Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE572643C1
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 12:21:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD7C31693;
	Thu, 10 Sep 2020 12:20:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD7C31693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599733280;
	bh=ISG9W9caWeen137uNyEwZVXtTRBf5uzko88ylHyy8IM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BRKgJTdlLw5UuKSwuH7DJyZiVNPnkq/kCcLkizaBH7RyFbhwiPTZljPw6DWZR7fyG
	 mIkW6+Zp7WWALT08cAAMB1AKtck64SHx+sJ3rSuxzy/YKKYLtLQZul2emawLgdq8MK
	 HTOn866REqNWaTDCtWDqWgkFjN316tMXJUOFO1M8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D89CF802C4;
	Thu, 10 Sep 2020 12:18:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BE31F802DD; Thu, 10 Sep 2020 12:18:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3D2AF80277
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 12:17:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3D2AF80277
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="az80YPjH"
Received: by mail-wm1-x341.google.com with SMTP id k18so5216304wmj.5
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 03:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3VQ3bGKtBxRBApFT2T0Tmq9tmwkVFZ1oYNu2zUBN5wY=;
 b=az80YPjHOHIydGMO4T0LCTDhmktqPRLH6LMmcI2oOStXcYNtT0Dn7k16T1eCHa50G3
 H5VaiOhNbxhjav3+6kIsqF4W59WVmKeZzc7P6l7vHIilMC0ioTST56K4cv8mEaJUkDC+
 BTrl1LvDD0+HWfW2uTpJkmtltkX2ebwsoEE4bfw1X94WXAhjW2U66ZpZbaem5yqxSepM
 3AlVagzgxU8t3loxozOB4CLpOjHAHIfgsEz4gT7M42O4YpBKaMD+Preinl7Wcv0TOPpk
 vLhBN+SkhzHl+q8xfsu6XCF4F0y7yFSrNgcld7WpxN5T/S7iaC1Y61KNSai/YOR8xd62
 iPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3VQ3bGKtBxRBApFT2T0Tmq9tmwkVFZ1oYNu2zUBN5wY=;
 b=jOJTPZ/uyZfE8Gm5/ChaHAGIJAAE0Y8mrMHRkRJG5xr6OvH+o7KA0gGd7k4BijBsKc
 VigxLGth0sZ72OaQGBsRaa1r5ZtOOMawZoDejl9HckMr/d/uzYDowoeIaT45FJXMsUyp
 eVseXbODerruZkjlpCvdQlhZzRIVF0gL60rC/bJBejkqOLxzvwSHwKouqv3A/5IK2Fbi
 vRnCPi48RmxJH7wnKeM6XmFqF2LofOX45mh5PWzOFmdIaNTFLTyJaejf8yvMGAXszHKH
 4ZFPa+F4adGsQ+5OPSa2t+QCb6mvwmmdDaFqScxHJBiZTv49bj8bZhPTlG08HBUGIb8M
 7WNg==
X-Gm-Message-State: AOAM531wTcRsYRPggqCVI9ZEVnfq1T4bdmH0kd19xLnnf/uKSPPvSUXC
 0tFWehysjCleNmP39fyEcE5e6Q==
X-Google-Smtp-Source: ABdhPJzN1Uau/E0JLtlzAH0YotHH2e/OT0iND+6DjIa5vN8pMGBuma/nMuts/1GRS+oCzezB4dPzzA==
X-Received: by 2002:a1c:9dd5:: with SMTP id g204mr7550515wme.162.1599733074961; 
 Thu, 10 Sep 2020 03:17:54 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id m4sm8851731wro.18.2020.09.10.03.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 03:17:54 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 6/8] ASoC: q6dsp: q6afe: update q6afe_set_param to support
 global clocks
Date: Thu, 10 Sep 2020 11:17:30 +0100
Message-Id: <20200910101732.23484-7-srinivas.kandagatla@linaro.org>
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

Previously there was no case where we need to set clock or send commands
that are not associated with q6afe ports, now we have cases like clock
voting and clock consumers like codecs that needed these clocks.

update q6afe_set_param() to support such cases, including token passing.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6afe.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 51c94dd9998d..9ed5537ee58e 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -967,14 +967,13 @@ static int afe_apr_send_pkt(struct q6afe *afe, struct apr_pkt *pkt,
 	return ret;
 }
 
-static int q6afe_port_set_param(struct q6afe_port *port, void *data,
-				int param_id, int module_id, int psize)
+static int q6afe_set_param(struct q6afe *afe, struct q6afe_port *port,
+			   void *data, int param_id, int module_id, int psize,
+			   int token)
 {
 	struct afe_svc_cmd_set_param *param;
 	struct afe_port_param_data_v2 *pdata;
-	struct q6afe *afe = port->afe;
 	struct apr_pkt *pkt;
-	u16 port_id = port->id;
 	int ret, pkt_size;
 	void *p, *pl;
 
@@ -995,7 +994,7 @@ static int q6afe_port_set_param(struct q6afe_port *port, void *data,
 	pkt->hdr.pkt_size = pkt_size;
 	pkt->hdr.src_port = 0;
 	pkt->hdr.dest_port = 0;
-	pkt->hdr.token = port->token;
+	pkt->hdr.token = token;
 	pkt->hdr.opcode = AFE_SVC_CMD_SET_PARAM;
 
 	param->payload_size = sizeof(*pdata) + psize;
@@ -1008,13 +1007,19 @@ static int q6afe_port_set_param(struct q6afe_port *port, void *data,
 
 	ret = afe_apr_send_pkt(afe, pkt, port, AFE_SVC_CMD_SET_PARAM);
 	if (ret)
-		dev_err(afe->dev, "AFE enable for port 0x%x failed %d\n",
-		       port_id, ret);
+		dev_err(afe->dev, "AFE set params failed %d\n", ret);
 
 	kfree(pkt);
 	return ret;
 }
 
+static int q6afe_port_set_param(struct q6afe_port *port, void *data,
+				int param_id, int module_id, int psize)
+{
+	return q6afe_set_param(port->afe, port, data, param_id, module_id,
+			       psize, port->token);
+}
+
 static int q6afe_port_set_param_v2(struct q6afe_port *port, void *data,
 				   int param_id, int module_id, int psize)
 {
@@ -1064,7 +1069,7 @@ static int q6afe_port_set_param_v2(struct q6afe_port *port, void *data,
 	return ret;
 }
 
-static int q6afe_set_lpass_clock(struct q6afe_port *port,
+static int q6afe_port_set_lpass_clock(struct q6afe_port *port,
 				 struct afe_clk_cfg *cfg)
 {
 	return q6afe_port_set_param_v2(port, cfg,
@@ -1111,7 +1116,7 @@ int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
 		ccfg.clk_src = clk_src;
 		ccfg.clk_root = clk_root;
 		ccfg.clk_set_mode = Q6AFE_LPASS_MODE_CLK1_VALID;
-		ret = q6afe_set_lpass_clock(port, &ccfg);
+		ret = q6afe_port_set_lpass_clock(port, &ccfg);
 		break;
 
 	case LPAIF_OSR_CLK:
@@ -1120,7 +1125,7 @@ int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
 		ccfg.clk_src = clk_src;
 		ccfg.clk_root = clk_root;
 		ccfg.clk_set_mode = Q6AFE_LPASS_MODE_CLK2_VALID;
-		ret = q6afe_set_lpass_clock(port, &ccfg);
+		ret = q6afe_port_set_lpass_clock(port, &ccfg);
 		break;
 	case Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT ... Q6AFE_LPASS_CLK_ID_QUI_MI2S_OSR:
 	case Q6AFE_LPASS_CLK_ID_MCLK_1 ... Q6AFE_LPASS_CLK_ID_INT_MCLK_1:
-- 
2.21.0

