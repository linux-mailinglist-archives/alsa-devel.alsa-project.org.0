Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1594A7F1D1A
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 20:08:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCEB7DEB;
	Mon, 20 Nov 2023 20:08:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCEB7DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700507299;
	bh=m55U/K1A+lSnlct0C4IVi+teNYUlxMIIHZvxWK7g7q4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ShL7fLpVXFeOaMMym3c3KabI6pjFWkZ+4AH7eZfHPA4yH/eSKqen4E3tlLLJkVhyy
	 uUW0gFJojQuziYQP4B/rqmgAaU78DPDdDOC9vkhk3O5f/KW/tlyuC/OdkyoA8GUn3V
	 TtMDQ9PXYQr1fLhYRWKnQfMpxjYBKqWkS/YFPMYs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1F9AF80249; Mon, 20 Nov 2023 20:07:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67414F80551;
	Mon, 20 Nov 2023 20:07:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAD9DF80310; Mon, 20 Nov 2023 20:07:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED54EF80249
	for <alsa-devel@alsa-project.org>; Mon, 20 Nov 2023 20:07:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED54EF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=F1yzP9HH
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a00b056ca38so79575466b.2
        for <alsa-devel@alsa-project.org>;
 Mon, 20 Nov 2023 11:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700507263; x=1701112063;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FTpXl/MjWFr4GOxbA7yucE3ugQ9dkFJq52yIdGzpXCM=;
        b=F1yzP9HH3icc4OEkdJXessWkwXwP9Z1aZkzWXM/+O5gIpU6uaopDUCZrAYM1zHoF9i
         ZP7U6YEHgoIYfClWoodiXAY+n1J/Mu0IwRdpKr48kUGFNiYKbqJ1Rakfcq7ZWWwaO1rK
         mTGSrkqyThaUfxRAq8Ojc3d6ydSA0gCsnB/naKP1SiC6IstbbY03FWKVSgDwOAjd0y0s
         OKBP2l0WR6JYH/cW9+0bl2WGUTZl0088bxUGLsnvaUiBgMW8KN4/tEuztwkr3vxcCLgE
         w242ClIakE4h5xe2/J/qc0EosgVqNwGUme3h0rRv64Ma2+dCzB5iMHemIXdT/8K6b6Y4
         sDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700507263; x=1701112063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTpXl/MjWFr4GOxbA7yucE3ugQ9dkFJq52yIdGzpXCM=;
        b=HGkChtsv7JVhTtwKTtu7GjKLNxZMh+WXiYg78kzDk8EjXPcdjHjeOFfd0HRrB7j/Rc
         oFJeF7/xx3b/Uh3+f8kP9hbrDl+jOgLj32rYc6SRbIXiI9PWeGj4GTQ+J4x0TxJ10NY4
         cd7liHUwdlVFvR00hhWV+0qyS3tgL7uYxOV4YYhLGV5zRBJ5xyKJMqW+vzY1YKhyEZdx
         NGNlCraBUORV6qqlkKnHWDt4eqWhBoZ9QPciKLULGEzY4jQnkXIc8yJ/4PTcg51Mzw+t
         LcLWaSCd+q3vUU5z7/lG2lJjrybCkzDhQq1zXJWp/712fcW/o1UOVpt8KY4almf8vM2s
         tMaQ==
X-Gm-Message-State: AOJu0Yz+lbl4g8iONHd4i+EUkqd3OeF0hnwNE36WeqGBCXmgUrr3tDsj
	hMnqBaxn7J7t4piIekJIUFGrbw==
X-Google-Smtp-Source: 
 AGHT+IHCotI7oUSuFgXAQc4G4brytJuxRZwajqwIVB16jasq+WxHZRt/dsvF1AgDGC0xrVfamLAQ5A==
X-Received: by 2002:a17:906:c244:b0:9db:e46c:569 with SMTP id
 bl4-20020a170906c24400b009dbe46c0569mr6001995ejb.45.1700507263410;
        Mon, 20 Nov 2023 11:07:43 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.11])
        by smtp.gmail.com with ESMTPSA id
 a18-20020a1709066d5200b00977cad140a8sm4177521ejt.218.2023.11.20.11.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 11:07:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] soundwire: qcom: drop unneeded
 qcom_swrm_stream_alloc_ports() cleanup
Date: Mon, 20 Nov 2023 20:07:39 +0100
Message-Id: <20231120190740.339350-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JE5GFFBVXKJZIMLUBZON235THC5HWHQO
X-Message-ID-Hash: JE5GFFBVXKJZIMLUBZON235THC5HWHQO
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JE5GFFBVXKJZIMLUBZON235THC5HWHQO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The cleanup in "err" goto label clears bits from pconfig array which is
a local variable.  This does not have any effect outside of this
function, so drop this useless code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/qcom.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index a1e2d6c98186..754870a4a047 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1157,7 +1157,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 	struct sdw_port_runtime *p_rt;
 	struct sdw_slave *slave;
 	unsigned long *port_mask;
-	int i, maxport, pn, nports = 0, ret = 0;
+	int maxport, pn, nports = 0, ret = 0;
 	unsigned int m_port;
 
 	mutex_lock(&ctrl->port_lock);
@@ -1183,7 +1183,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 				if (pn > maxport) {
 					dev_err(ctrl->dev, "All ports busy\n");
 					ret = -EBUSY;
-					goto err;
+					goto out;
 				}
 				set_bit(pn, port_mask);
 				pconfig[nports].num = pn;
@@ -1205,12 +1205,7 @@ static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
 	sconfig.bps = 1;
 	sdw_stream_add_master(&ctrl->bus, &sconfig, pconfig,
 			      nports, stream);
-err:
-	if (ret) {
-		for (i = 0; i < nports; i++)
-			clear_bit(pconfig[i].num, port_mask);
-	}
-
+out:
 	mutex_unlock(&ctrl->port_lock);
 
 	return ret;
-- 
2.34.1

