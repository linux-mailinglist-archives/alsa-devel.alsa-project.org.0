Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE312643CA
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 12:22:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8D041687;
	Thu, 10 Sep 2020 12:21:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8D041687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599733325;
	bh=KZtSlzSXkXFx9K6eLkTfrhxWBUhV+bRbyl8qR7DR/mw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WIBeogKy/bMBfSLrAC9mkcQPJzmLKxWkrDmE2wHpv2L+9+/RvDQz3NrDJcnBZuwEo
	 LJKa72WAhnxIKlsNZMd8r/+OAmQ7awhYujR8ZltvmT1nkyFTRBpScovh7ECsqBUddn
	 OEGMXHmRVQqiDTMZs8EFqGfGT7Sf+3CuNkNUIJSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38B26F802E2;
	Thu, 10 Sep 2020 12:18:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3065CF8026F; Thu, 10 Sep 2020 12:18:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE62DF8026F
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 12:17:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE62DF8026F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="qytJ0anu"
Received: by mail-wr1-x441.google.com with SMTP id e16so6103315wrm.2
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 03:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=35FP4zv+pwkbGr1a0ICMd6sQ90vGjx362WgHWWdE2EE=;
 b=qytJ0anu0r8iejL2J6YFmry4i70Yz/OxSO1hg0YXgpdvILS87SEuM+OW/N06uatodz
 PxYfg+QYPOwoxehP3B4PVH7HPiFr7AvPe1OGaELzxBmV8IGd8EGASeJC12C9VE6aOfXj
 ELoDnCUfz2fhMZxAnb0fX9axz9fdFuTIrGUY6ncQU1vrXqrNMWGwHirCdtdDrcF5tLwt
 nz4alzp1i/jrRUVE8npi1+JiG6oduIEDZHsIgpN3crEIVyP/DG9cituiP4B3LG7sL2MR
 o0ZODSoIXBmYK62jfACiBuEneyDJHaaSJLAwewbUAyCOlxYo1NvpAwkeppcil4ggIabb
 WFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=35FP4zv+pwkbGr1a0ICMd6sQ90vGjx362WgHWWdE2EE=;
 b=AAXO4NzLIIwJNdYwkvE90RJCY40K8bCLcwjwHfuskPOfPLjFX/EB7NDATLd7F0Sn+/
 IA6ssjbWUbNDCpDtrpzpe3ByrYO87iEq1bQOL/Ab50iHHgZI/kI+rDa60kJ6hVT6VShw
 1o+rKY/WRumgjeHoO2H/NyjbGGJHSq0+huRFaORcr9igXKJ0zqJeG1r5EHlAhyRtPPtO
 Lcj/mZMzubKmNLp5OpTn8YLbpr1imFQ5GfVOvRy+uVll1CqAUarAVjpkmlWpzUg1mnaT
 FDyG7si2kVreSyGdpx2m5dzPY6FjwNz17ObE7FlDSW9uBkLB1NslWEEp4quPj4+Vwm1Q
 Y+sg==
X-Gm-Message-State: AOAM532SBUNgtMBYa0teb1kH6eLSd+faVMhOmnl4G81pYsTLc020WR43
 524HECiGXeXrDQDnRMAQ83TSog==
X-Google-Smtp-Source: ABdhPJwwyy6FJ4lFjbkvIsHCWHQE2fqsNe40JDp5tIgVLRzzrHZGi8Opl4fcPMyaHoVU6nJlbkLJtg==
X-Received: by 2002:adf:9e43:: with SMTP id v3mr8377833wre.306.1599733071084; 
 Thu, 10 Sep 2020 03:17:51 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id m4sm8851731wro.18.2020.09.10.03.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 03:17:50 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 3/8] ASoC: q6dsp: q6afe: prepare afe_apr_send_pkt to take
 response opcode
Date: Thu, 10 Sep 2020 11:17:27 +0100
Message-Id: <20200910101732.23484-4-srinivas.kandagatla@linaro.org>
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

Update afe_apr_send_pkt() to take response opcode that it should wait for.
This is helpful in cases where we expect response other than the
actual command opcode.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6afe.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 8ceefb431bcb..f934c69f0a14 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -902,10 +902,9 @@ int q6afe_get_port_id(int index)
 EXPORT_SYMBOL_GPL(q6afe_get_port_id);
 
 static int afe_apr_send_pkt(struct q6afe *afe, struct apr_pkt *pkt,
-			    struct q6afe_port *port)
+			    struct q6afe_port *port, uint32_t rsp_opcode)
 {
 	wait_queue_head_t *wait = &port->wait;
-	struct apr_hdr *hdr = &pkt->hdr;
 	int ret;
 
 	mutex_lock(&afe->lock);
@@ -919,7 +918,7 @@ static int afe_apr_send_pkt(struct q6afe *afe, struct apr_pkt *pkt,
 		goto err;
 	}
 
-	ret = wait_event_timeout(*wait, (port->result.opcode == hdr->opcode),
+	ret = wait_event_timeout(*wait, (port->result.opcode == rsp_opcode),
 				 msecs_to_jiffies(TIMEOUT_MS));
 	if (!ret) {
 		ret = -ETIMEDOUT;
@@ -976,7 +975,7 @@ static int q6afe_port_set_param(struct q6afe_port *port, void *data,
 	pdata->param_id = param_id;
 	pdata->param_size = psize;
 
-	ret = afe_apr_send_pkt(afe, pkt, port);
+	ret = afe_apr_send_pkt(afe, pkt, port, AFE_SVC_CMD_SET_PARAM);
 	if (ret)
 		dev_err(afe->dev, "AFE enable for port 0x%x failed %d\n",
 		       port_id, ret);
@@ -1025,7 +1024,7 @@ static int q6afe_port_set_param_v2(struct q6afe_port *port, void *data,
 	pdata->param_id = param_id;
 	pdata->param_size = psize;
 
-	ret = afe_apr_send_pkt(afe, pkt, port);
+	ret = afe_apr_send_pkt(afe, pkt, port, AFE_PORT_CMD_SET_PARAM_V2);
 	if (ret)
 		dev_err(afe->dev, "AFE enable for port 0x%x failed %d\n",
 		       port_id, ret);
@@ -1155,7 +1154,7 @@ int q6afe_port_stop(struct q6afe_port *port)
 	stop->port_id = port_id;
 	stop->reserved = 0;
 
-	ret = afe_apr_send_pkt(afe, pkt, port);
+	ret = afe_apr_send_pkt(afe, pkt, port, AFE_PORT_CMD_DEVICE_STOP);
 	if (ret)
 		dev_err(afe->dev, "AFE close failed %d\n", ret);
 
@@ -1467,7 +1466,7 @@ int q6afe_port_start(struct q6afe_port *port)
 
 	start->port_id = port_id;
 
-	ret = afe_apr_send_pkt(afe, pkt, port);
+	ret = afe_apr_send_pkt(afe, pkt, port, AFE_PORT_CMD_DEVICE_START);
 	if (ret)
 		dev_err(afe->dev, "AFE enable for port 0x%x failed %d\n",
 			port_id, ret);
-- 
2.21.0

