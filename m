Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEB641104E
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 09:39:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96A71165D;
	Mon, 20 Sep 2021 09:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96A71165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632123557;
	bh=xkqChWgx+Gnf8nrhCdnVbDVYVFHp7BD+H8re1UE5bvU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h0i3MUIBbMkKDjewLem1MHBjnz8J5PVyM8IB2KZKo2C0X+8h42p4Dp0tiE+3eMFc+
	 /Q5qcDBX7K18ee2/JE28jqB8HRPZ/OP3UMzXynSqsIeiWgXuuLy3CZG7Oflfo4NLyf
	 Cx+kJbL7ksqaQdnoVBiWFyJk2B14hHBwPHtZef7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B0A0F804FB;
	Mon, 20 Sep 2021 09:36:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D5BAF804ED; Mon, 20 Sep 2021 09:36:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56A6CF804CF
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 09:36:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56A6CF804CF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="oMXK6sDj"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632123397; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=fdRUVtLB4jhQL95fW23aZmzrLGXO4OMaKMk6xck4L5A=;
 b=oMXK6sDjN4tB5LlLCDd4EcJj60zriWGDThyyJgxnVy/48+em0+HQykenfuCBwFogv2KE9cPq
 2psaKPII7FDn3fZZrqGQjNU+E5G3CtWTXFX/yrwpQECmTdclNkn/pRrlUrf+QxovFEC4XEpA
 OuDe1tD+0lC2lHyBwe7noHiHnsM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 614839e9e0f78151d6ca79ac (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Sep 2021 07:36:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 06AFDC43460; Mon, 20 Sep 2021 07:36:09 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AF20AC43460;
 Mon, 20 Sep 2021 07:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org AF20AC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
Subject: [PATCH 3/7] ASoC: codecs: tx-macro: Change mic control registers to
 volatile
Date: Mon, 20 Sep 2021 13:05:27 +0530
Message-Id: <1632123331-2425-4-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
References: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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

Update amic and dmic related tx macro control registers to volatile

Fixes: c39667ddcfc5 (ASoC: codecs: lpass-tx-macro: add support for lpass tx macro)

Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 9273724..e65b592 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -423,6 +423,13 @@ static bool tx_is_volatile_register(struct device *dev, unsigned int reg)
 	case CDC_TX_TOP_CSR_SWR_DMIC1_CTL:
 	case CDC_TX_TOP_CSR_SWR_DMIC2_CTL:
 	case CDC_TX_TOP_CSR_SWR_DMIC3_CTL:
+	case CDC_TX_TOP_CSR_SWR_AMIC0_CTL:
+	case CDC_TX_TOP_CSR_SWR_AMIC1_CTL:
+	case CDC_TX_CLK_RST_CTRL_MCLK_CONTROL:
+	case CDC_TX_CLK_RST_CTRL_FS_CNT_CONTROL:
+	case CDC_TX_CLK_RST_CTRL_SWR_CONTROL:
+	case CDC_TX_TOP_CSR_SWR_CTRL:
+	case CDC_TX0_TX_PATH_SEC7:
 		return true;
 	}
 	return false;
@@ -1674,6 +1681,12 @@ static int tx_macro_component_probe(struct snd_soc_component *comp)
 
 	snd_soc_component_update_bits(comp, CDC_TX0_TX_PATH_SEC7, 0x3F,
 				      0x0A);
+	snd_soc_component_update_bits(comp, CDC_TX_TOP_CSR_SWR_AMIC0_CTL, 0xFF, 0x00);
+	snd_soc_component_update_bits(comp, CDC_TX_TOP_CSR_SWR_AMIC1_CTL, 0xFF, 0x00);
+	snd_soc_component_update_bits(comp, CDC_TX_TOP_CSR_SWR_DMIC0_CTL, 0xFF, 0x00);
+	snd_soc_component_update_bits(comp, CDC_TX_TOP_CSR_SWR_DMIC1_CTL, 0xFF, 0x00);
+	snd_soc_component_update_bits(comp, CDC_TX_TOP_CSR_SWR_DMIC2_CTL, 0xFF, 0x00);
+	snd_soc_component_update_bits(comp, CDC_TX_TOP_CSR_SWR_DMIC3_CTL, 0xFF, 0x00);
 
 	return 0;
 }
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

