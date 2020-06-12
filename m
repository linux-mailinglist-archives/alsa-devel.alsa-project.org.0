Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 878C91F77FF
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 14:39:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D84E21681;
	Fri, 12 Jun 2020 14:39:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D84E21681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591965595;
	bh=B5D/egHIkMU2GlF+RuwpVsy4E5c90wYMywftRAyRpJo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RDb5X3T+y0VtQevntieh7vSJjkZ9LwL5ebjdm8tSbZZEk1qa5d1Wa5CfHxPbyn+Q7
	 dxB48ZhlDABrtfTtrsig7t+Jn/KJi3gVHJkdJAXxiRdII+FIat9wiKDuLpUas4Jk34
	 8KvTV0gH2Ufl5dQXkWtMIXXpnhNpOzBRLh3KPT6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05F02F80058;
	Fri, 12 Jun 2020 14:38:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98717F8021E; Fri, 12 Jun 2020 14:38:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEADDF800CC
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 14:38:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEADDF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="YHtUi499"
Received: by mail-wm1-x343.google.com with SMTP id r15so8164778wmh.5
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 05:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EIXmHBcROpxchkszRmgrfDVWOIEmYL2f5uIuEsh5OS4=;
 b=YHtUi499GQk9deXQoH7knrv7y7or0zY2iaYFn3fwx/xqb1H08no5hJUVqy6YHFJpXO
 LqilTTy16tyssFpPqHElz6LieaaqHz2TkQ4rz9DKqglETmD6j5jbE4YHoKnq2/C8RSd2
 oXny98IJkjJEMN9pnjiiKamlz1BGsOI6SZPTIbtuUE+FwWjY1uhvtmGgSbv0tDVDGlbG
 0zrf+DSS0qPLpIc40OB/GmVCQg8gSBX/WbC8wwgZulMe4rod/Cn7wPc/EqpFxNnthMMQ
 /asuIojT5MFcWFjYB+cOFtxvMHWKWVgPH6LRtWYODwLw+uJ7JGDohQU0rhEKH8qc6VRD
 UlXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EIXmHBcROpxchkszRmgrfDVWOIEmYL2f5uIuEsh5OS4=;
 b=fzHhdq/Nbv0UvJha35dhg6SgYyg3E0hq3Cja6+NIH3wLSxL6PrYp2eDDeMSsNdmdnC
 Br06fOEYL3/QQBrAhmtsUofVkf3jwzpcIncG//Hw44TNNFGBvPQHLKzcvdvHJdEF/XZG
 q1jqVnzl5foOoYbBmbIPT2RwzUjKKQK0/Tzpu7RTPi2A1joTgccmu6IL0IiAMyQtn+Oo
 MbGnXe7hkBFl+OFCJZbbj1545LW4U/7/NxBWoZsKWYKYHmQi4uituP6bOkanyLabRzCo
 GcLhsEvOtYo3fnWoZ5nbDMlfJ8XQwiCqpFBoxKL08QBCBrcTyFZaqrMhbyrgx8NloP5G
 DKng==
X-Gm-Message-State: AOAM530cwCZ5DZKBSj6D8uXsoyGSWIOgqKEGNRgnWs8AnPpNVWUvL4L/
 OJ9SRrQoKGR2XeqPHcQlIp6bjw==
X-Google-Smtp-Source: ABdhPJzKzD/xTNB5Vwz+jQuc946dHhh7qHJqaBh5N65UMZE9NDXk2wSXGSkicWSDa6bZKXMv6ttRLQ==
X-Received: by 2002:a1c:a74f:: with SMTP id q76mr13970417wme.65.1591965485666; 
 Fri, 12 Jun 2020 05:38:05 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id g18sm9392299wme.17.2020.06.12.05.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 05:38:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/2] ASoc: q6afe: add support to get port direction
Date: Fri, 12 Jun 2020 13:37:10 +0100
Message-Id: <20200612123711.29130-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 John Stultz <john.stultz@linaro.org>
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

This patch adds support to q6afe_is_rx_port() to get direction
of DSP BE dai port, this is useful for setting dailink
directions correctly.

Fixes: c25e295cd77b (ASoC: qcom: Add support to parse common audio device nodes")
Reported-by: John Stultz <john.stultz@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6afe.c | 8 ++++++++
 sound/soc/qcom/qdsp6/q6afe.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index e0945f7a58c8..0ce4eb60f984 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -800,6 +800,14 @@ int q6afe_get_port_id(int index)
 }
 EXPORT_SYMBOL_GPL(q6afe_get_port_id);
 
+int q6afe_is_rx_port(int index)
+{
+	if (index < 0 || index >= AFE_PORT_MAX)
+		return -EINVAL;
+
+	return port_maps[index].is_rx;
+}
+EXPORT_SYMBOL_GPL(q6afe_is_rx_port);
 static int afe_apr_send_pkt(struct q6afe *afe, struct apr_pkt *pkt,
 			    struct q6afe_port *port)
 {
diff --git a/sound/soc/qcom/qdsp6/q6afe.h b/sound/soc/qcom/qdsp6/q6afe.h
index c7ed5422baff..1a0f80a14afe 100644
--- a/sound/soc/qcom/qdsp6/q6afe.h
+++ b/sound/soc/qcom/qdsp6/q6afe.h
@@ -198,6 +198,7 @@ int q6afe_port_start(struct q6afe_port *port);
 int q6afe_port_stop(struct q6afe_port *port);
 void q6afe_port_put(struct q6afe_port *port);
 int q6afe_get_port_id(int index);
+int q6afe_is_rx_port(int index);
 void q6afe_hdmi_port_prepare(struct q6afe_port *port,
 			    struct q6afe_hdmi_cfg *cfg);
 void q6afe_slim_port_prepare(struct q6afe_port *port,
-- 
2.21.0

