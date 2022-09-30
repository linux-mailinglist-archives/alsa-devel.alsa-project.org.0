Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD4C5F0828
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 12:01:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E53611681;
	Fri, 30 Sep 2022 12:00:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E53611681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664532078;
	bh=cJgJtLc2/wKUEpSs6Yxh61bAGDxmfNDbQ5874tGEZOM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jb6ZRYFLgely5swlsUbHLvdcLmuix56gy4XykG0oNVKJGXiI9AjXFHiS5dgpokEmk
	 8la2btXiL4kgnddm+tyBf7uwEaGxPsqQk6/E2h/hegMsfBU67Pd+Mb4UOclGLdPXcC
	 QJ4h3RSpoEn8VxHQt0OqTkTc3pObHKPDvgkSM2m8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81260F8032B;
	Fri, 30 Sep 2022 12:00:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EDCAF801D5; Fri, 30 Sep 2022 12:00:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18979F80155
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 12:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18979F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="OWK5LGKW"
Received: by mail-lj1-x232.google.com with SMTP id b6so4241823ljr.10
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 03:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=eflBW1/omcz649gzqa80EdxHOHLRvARzQtLAthFPzJI=;
 b=OWK5LGKWP0pdp3UPFCNUfXZUKNnZoBJUrmaauwMpZ82/O4KMFbn4fiY5fm0U5Ydqld
 OsiAVf+z608fk9ECGQhxGFQzomsxoLyemejEjZHZ+DGWAr++8OYtnDf+pJDBIZToR878
 gfptsC3sbcKHx7ZTNpJok8J2N+TQOp66L1Jg3EP2AfGAUTEosVpw43u8rqeSqUs8LVWF
 ZFHFjy0CJaDfUa5B61twfyKo88jykM86qFHIoWncHvxv4n0TxHNOLDsrUHWnrwPGelj/
 V/fISMnD0XD5ynehEItyMZ4az5V3iZWBJJGca2njI6DzP7lvejVWnowY1lM2Wln3FJyu
 mxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=eflBW1/omcz649gzqa80EdxHOHLRvARzQtLAthFPzJI=;
 b=6Y556Pw+elpRY9XCuMCdscLy/buAL7/xohia7dvbmPqggQ04lLTCCqv4bR9Mdpzw4P
 T/ZZGSWQE7L74rT9d/9TZsHyZw2wIt5lUqNUvYhKZPnu1qhoZOWW/PxW5XFKhxz+L9ad
 J/8xwjEejVqLFOqZYZgXPlsYqOWLrwWTBUlNr1WnVmeFG5k5KlEj3eZAHe8VIgm7T5P3
 3UNqMgt6mLxX6GxuZjM9BPVGXqht/POkaj/2FD/w/45HLO92SP9HCqc3fGt22dLcBQ/+
 ryuOeALdoMwc2Iljf8DTTCKRyxZPVOWOLOIL5jYd+ANdD7xhy/oDzT1jRmTf8pfhXYfp
 kKzA==
X-Gm-Message-State: ACrzQf3StjuIor3aQo37uL1a0JkcWHm03HL9xTXjDpI7GaLAN8D3b3yu
 v+nFJPKusChEU2skRFtXIG113g==
X-Google-Smtp-Source: AMsMyM6B4uYou33xi63CeYgaZwCwUV++xi/7sDtaqK1haWq9kFsQCN9YPhgm/HPc4sDoaDjGduqapQ==
X-Received: by 2002:a2e:a54b:0:b0:26c:72ed:b758 with SMTP id
 e11-20020a2ea54b000000b0026c72edb758mr2692885ljn.245.1664532017099; 
 Fri, 30 Sep 2022 03:00:17 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 q65-20020a2e2a44000000b0026c3e350682sm113521ljq.14.2022.09.30.03.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 03:00:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] slimbus: stream: handle unsupported bitrates for
 presence rate
Date: Fri, 30 Sep 2022 12:00:14 +0200
Message-Id: <20220930100015.259106-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Handle errors of getting presence rate for unsupported stream bitrate,
instead of sending -EINVAL in change content message.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

---

Changes since v1:
1. Rebase (drop development pieces in the context).
2. Return prrate (which has errno) instead of -EINVAL.
3. Add Rb tag.
---
 drivers/slimbus/stream.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
index d5ce974e880b..f631d5ed9809 100644
--- a/drivers/slimbus/stream.c
+++ b/drivers/slimbus/stream.c
@@ -204,7 +204,7 @@ int slim_stream_prepare(struct slim_stream_runtime *rt,
 {
 	struct slim_controller *ctrl = rt->dev->ctrl;
 	struct slim_port *port;
-	int num_ports, i, port_id;
+	int num_ports, i, port_id, prrate;
 
 	if (rt->ports) {
 		dev_err(&rt->dev->dev, "Stream already Prepared\n");
@@ -221,6 +221,13 @@ int slim_stream_prepare(struct slim_stream_runtime *rt,
 	rt->bps = cfg->bps;
 	rt->direction = cfg->direction;
 
+	prrate = slim_get_prate_code(cfg->rate);
+	if (prrate < 0) {
+		dev_err(&rt->dev->dev, "Cannot get presence rate for rate %d Hz\n",
+			cfg->rate);
+		return prrate;
+	}
+
 	if (cfg->rate % ctrl->a_framer->superfreq) {
 		/*
 		 * data rate not exactly multiple of super frame,
@@ -241,7 +248,7 @@ int slim_stream_prepare(struct slim_stream_runtime *rt,
 		port = &rt->ports[i];
 		port->state = SLIM_PORT_DISCONNECTED;
 		port->id = port_id;
-		port->ch.prrate = slim_get_prate_code(cfg->rate);
+		port->ch.prrate = prrate;
 		port->ch.id = cfg->chs[i];
 		port->ch.data_fmt = SLIM_CH_DATA_FMT_NOT_DEFINED;
 		port->ch.aux_fmt = SLIM_CH_AUX_FMT_NOT_APPLICABLE;
-- 
2.34.1

