Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97460950669
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2024 15:26:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B27ED2367;
	Tue, 13 Aug 2024 15:26:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B27ED2367
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723555593;
	bh=5ke0dMugQJGUNzUanoO5HspavxzPQnzSJYizcfymtG0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Grauq6ZPuUep3UKQMiRZIg0Hys5gBuywXLjNageEizA4L0stxvZV4/iwEhpA9Hwc5
	 3kAxsN1qGlJ9p6sGM9IbAu6Wye9Icv3FX4iWcnaunv+WKpWHzMHM5vrkOX4Q5KL4m8
	 wts3+JuwX28CWOAqv8C4nAdv1vW6pkWMUU92vZWU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36A1EF805E1; Tue, 13 Aug 2024 15:25:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BE5DF805C3;
	Tue, 13 Aug 2024 15:25:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D60FFF80580; Tue, 13 Aug 2024 15:10:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66076F80301
	for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2024 15:10:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66076F80301
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZJLCsp8N
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-427fc97a88cso42302095e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 13 Aug 2024 06:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723554607; x=1724159407;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2fVMcPJnrUO0N/1FseA0j+EEzz4Wl9hBU15LCUQqrw=;
        b=ZJLCsp8NHmiGjJEMJWF7aUlvPRDP8PoUoHdf4/dIjgfXJDHjhdrUepnfdqCm5Ln6K0
         1yPjon0Zm6hwpkBBOOAjGwGgnD82456SD9lKxlgNAwjsT0x00IdCuZ46qCwVVwpInGNc
         vPjDUmA4ffGmIOBX19rYZsIAX3XkxBeQ3WMO4i0nwjgepYWVXkS/p11AC6OO4D7XV6al
         sGs0KjPzu8LEtzWGpkAfUkx/DK51EEuB9A1cXjp/R7sdpM5Sm+hObpAxUlS/8kGEcSRj
         O68NW4eLZ51m7s8A2DzPpeKu9xEZ9sKdTULobJwspkCbaM9Eiu+OXlIxYejgbtGGJhoQ
         2LOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723554607; x=1724159407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m2fVMcPJnrUO0N/1FseA0j+EEzz4Wl9hBU15LCUQqrw=;
        b=VPg3w+TGobHfMvJV1L+arRKqsytm+WVxfVZ5PjdyNyZeR5JFXzVk5uLCUENSHoUSnD
         qFdlL6cF8EWlbkZgj4w/yNu4cZrTUxqAcSm+Rc5YyteqdIJtzn9hrvNlVV+dZCkbBMYu
         zg53gvVJJnmqga1/w2f2eVfRC/zADFeOGwDcLgqYqATnHnqkPMNhINGbhq9KbWYv8z6V
         Du91/OiftAiwLuUrasykZvzZoq2p6KpMxH92IIA6FtuUdlsr7Ge0d7IzcW05C/4/uWyH
         +h2Q19hsn+smGCe5nFYsKVY+VWI2aTzcZs8dZtuu4s/pUImAy/+RCqefpC4rQ2HuUmNg
         5PvQ==
X-Gm-Message-State: AOJu0Yz+BxYB0kXcYgTm5AH62P2tpNwYHSBOioH0yrZIBs5sDay5+D5o
	CZKeJFQ3sFdW6LNtnTuQBnfHCChqfI9hUImHGJt+BXznKEhUwHGN9H/tiZvxSb8=
X-Google-Smtp-Source: 
 AGHT+IHnqwXc38Pnpsch22i4e5wNnLg8t3Sw8H/kb30baBblrfe0Ww0kSwLWvg9YlxY932elDZZEiQ==
X-Received: by 2002:a05:600c:4e87:b0:426:5216:3247 with SMTP id
 5b1f17b1804b1-429d47f43c5mr23464765e9.6.1723554606909;
        Tue, 13 Aug 2024 06:10:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36e4c938280sm10305003f8f.36.2024.08.13.06.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 06:10:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 13 Aug 2024 15:09:48 +0200
Subject: [PATCH 2/6] soc: qcom: aoss: simplify with scoped for each OF
 child loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240813-b4-cleanup-h-of-node-put-other-v1-2-cfb67323a95c@linaro.org>
References: 
 <20240813-b4-cleanup-h-of-node-put-other-v1-0-cfb67323a95c@linaro.org>
In-Reply-To: 
 <20240813-b4-cleanup-h-of-node-put-other-v1-0-cfb67323a95c@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1215;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5ke0dMugQJGUNzUanoO5HspavxzPQnzSJYizcfymtG0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmu1sgzubjFvDtLJ+b01jNRFC9A7/wMsKAxjAK7
 lgCKP4SyxuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrtbIAAKCRDBN2bmhouD
 196BD/9zpchJcYbVKVBPCCQYSew98k1x7YKbjCYqEkr2Rl0ry5Q0WsDrLcz+OdPNUNcukEBF57j
 CXFMVHwF/8HziV4YUQ+g/pJ9U+XQc8ZK9yVd2j0rCdKtFoGDJaH5jt1tt5u3XA4enR93eAScbBp
 z5WdEHG801tqydGLxgY06YsKKBo6TyNl6M58T8DmY9j7zNUnfPDB4tuGClf9vBycT/Jj/O/aDDn
 4QbR/52niOyRHJJKNAtssir5m7I01na6FAKy0FVCubov8ranFGxpB+/eajBWSPKCy+TJOcip70k
 hQncmCZ9UA8CWvAfa7Ge7tHs+apnqGQYhF5dIcyXOC+EXRFuxZSs2aP7RScesHW7NT8kC/d6YPn
 UWiIShbfEkndLogb4uVBxCHY+lGq1TuD99bQBA1263enla+ziujq2XHmClw9Jwh0e/ehzJx1lvz
 O7NJaGTbSgIpaaVcS772jGuCgtxdjipcFWZnGxeuLqX4cWUfLtB+kDlroZf/+gN89t/1BK9OKln
 aicspz5G8uvst1BkIlyPg6YrTCv9ays26lhb7+QPmKuiMERxXiVu+6NnCTN7Sh/xjB9Y5CZ5fig
 jo1h802DvOHu9aslkYrUjJBkngQvLMPXfU8SCQqMwdfkByy46tYvfiN0YL5C02pRc0+Ww98lSNJ
 QfesZwWWNe6o9nw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 2YIULWM3Y5S3SZOYP53M4UJQDD6MY35J
X-Message-ID-Hash: 2YIULWM3Y5S3SZOYP53M4UJQDD6MY35J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2YIULWM3Y5S3SZOYP53M4UJQDD6MY35J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use scoped for_each_available_child_of_node_scoped() when iterating over
device nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/qcom/qcom_aoss.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index ca2f6b7629ce..60af26667bce 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -394,7 +394,7 @@ static int qmp_cooling_device_add(struct qmp *qmp,
 
 static int qmp_cooling_devices_register(struct qmp *qmp)
 {
-	struct device_node *np, *child;
+	struct device_node *np;
 	int count = 0;
 	int ret;
 
@@ -407,15 +407,13 @@ static int qmp_cooling_devices_register(struct qmp *qmp)
 	if (!qmp->cooling_devs)
 		return -ENOMEM;
 
-	for_each_available_child_of_node(np, child) {
+	for_each_available_child_of_node_scoped(np, child) {
 		if (!of_property_present(child, "#cooling-cells"))
 			continue;
 		ret = qmp_cooling_device_add(qmp, &qmp->cooling_devs[count++],
 					     child);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			goto unroll;
-		}
 	}
 
 	if (!count)

-- 
2.43.0

