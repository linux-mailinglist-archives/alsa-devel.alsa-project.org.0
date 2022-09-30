Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1435F0772
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 11:21:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9BF81683;
	Fri, 30 Sep 2022 11:20:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9BF81683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664529674;
	bh=poNkf/HDkDJXANlPovJj8BjfwtI3HiozGLYjF3dNGAU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TcBGOOM/VThboytghJVL5GwI2VWSZHhKfxXd9ihhfPRA3ztAoQlT295okwiGdnkkN
	 pYBaZbDjIosV1hGnaUTquGoa1JXBHXsMS2H6MtbACKuNo7LFnkgWjSZXSR1kU+C3lX
	 WDAGC3ahXIILIrDHVYWJvez6MMYEmQJtS60ts6UE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2582CF8032B;
	Fri, 30 Sep 2022 11:20:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C1EDF801D5; Fri, 30 Sep 2022 11:20:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9EE9F800AA
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 11:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9EE9F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="AZQiM/rF"
Received: by mail-lf1-x130.google.com with SMTP id a3so5956436lfk.9
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 02:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=JUsD5OyMxzTqjJC2MueYgQBSzr/7dS7Jwt69lfzIL4M=;
 b=AZQiM/rFdvvMZHz8CLmCW8QSQW2kURL/RUSJ1xj6rxN/LqgaEMnHvsYxPLuUGOz49A
 rwPZJPAsf0vOTeHiS/MKyEiPeP4t2r0S+o0jjEcGO+fBnka+KjV4yjuu6irOIaAr3L/Q
 f8pMf4YDUVzPq9ti8S/T02uLXC6sH0R/M9iAJpVpKGl72d4Cta0HtouQx6YAwZdC7pFo
 oz4ZT9GZPP1Tljc59oXOjcX14ozmXnX0LPjh5s385LR+siRQWRlc0wY7NXNy2bZ1/bHv
 jhQ3mz0dpl6GLGIG6lvZt+HBaX0tXQEpx3Z29A+jEEcgKaoB6C6p2q/jJD/3a9Xk2h45
 oeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=JUsD5OyMxzTqjJC2MueYgQBSzr/7dS7Jwt69lfzIL4M=;
 b=XEW28Et0/t0vlqbdRqts7Z8aUMcRuZsSr75v76eu5n2+kLkXp0WsfC0OWSrHWASoK6
 PaSV+6VQ8TybQnWtCGrhbIft6ZZSEotqxYTzNMvUCIpGpFmpQVQekEL7Cxmpx9qQZQTR
 1FNhkF0miNdM6g2zKoLAiSY4hiDAcbeMUPf5R5vwf3JpRw+99Tt93sEy/nakf8H3XZou
 ORifOoqlYq4KFjSB3cy1nsQgiBZEMrrEZSAYHBlw6k0EcoJcqpsXdVGCN7AU2o+SRnoq
 cFT1O9q3CuQpIaoUWbXTkPrEL3uxLDLAkePdYK/tNaWJ3yck9r2oDHf/UN6f7E/B/SuQ
 8/pQ==
X-Gm-Message-State: ACrzQf0WbKm4mxbvo6b696NDOJKq08jMQnHp+9j9MX38fbltBrZGCPZt
 EolEtgXRMwYxKizdlGApnV7lQg==
X-Google-Smtp-Source: AMsMyM7MmADAWQBvaYBjBOds2otRjU2INo8y9+KsdLttZq9CCty5vGMNFq1nb8eMuG8ekVRHWuDXzQ==
X-Received: by 2002:a05:6512:3185:b0:49c:3310:6910 with SMTP id
 i5-20020a056512318500b0049c33106910mr3408122lfe.352.1664529608805; 
 Fri, 30 Sep 2022 02:20:08 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a2ea226000000b0026aba858fbfsm103461ljm.137.2022.09.30.02.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 02:20:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] slimbus: stream: handle unsupported bitrates for presence
 rate
Date: Fri, 30 Sep 2022 11:20:05 +0200
Message-Id: <20220930092006.85982-1-krzysztof.kozlowski@linaro.org>
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
---
 drivers/slimbus/stream.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/slimbus/stream.c b/drivers/slimbus/stream.c
index f8eade1e0132..28fbecb3907d 100644
--- a/drivers/slimbus/stream.c
+++ b/drivers/slimbus/stream.c
@@ -204,7 +204,7 @@ int slim_stream_prepare(struct slim_stream_runtime *rt,
 {
 	struct slim_controller *ctrl = rt->dev->ctrl;
 	struct slim_port *port;
-	int num_ports, i, port_id;
+	int num_ports, i, port_id, prrate;
 
 	pr_err("%s:%d AAAA\n", __func__, __LINE__);
 	if (rt->ports) {
@@ -222,6 +222,13 @@ int slim_stream_prepare(struct slim_stream_runtime *rt,
 	rt->bps = cfg->bps;
 	rt->direction = cfg->direction;
 
+	prrate = slim_get_prate_code(cfg->rate);
+	if (prrate < 0) {
+		dev_err(&rt->dev->dev, "Cannot get presence rate for rate %d Hz\n",
+			cfg->rate);
+		return -EINVAL;
+	}
+
 	if (cfg->rate % ctrl->a_framer->superfreq) {
 		/*
 		 * data rate not exactly multiple of super frame,
@@ -242,7 +249,7 @@ int slim_stream_prepare(struct slim_stream_runtime *rt,
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

