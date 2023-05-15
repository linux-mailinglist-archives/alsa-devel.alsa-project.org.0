Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9A1702DFA
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 15:21:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD5B3208;
	Mon, 15 May 2023 15:20:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD5B3208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684156867;
	bh=pkt3cYBQaOz+tGCP/LEtgYAi3v7LL9y2xXZKMGuHovY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qEZr0VpAJfAei8sKxTrc6grIX8BdFevETeHxZ3lfZn2Tx8FKtSPqdrdrF3X5G+mV7
	 TXg/bdUTOqSiCvKofosKLO0xQOmwki6O3xcTHgysEU8YwpH2Y/9mTLaD93S/S1r381
	 DMFL+UFSQ3vE7VizZhSt5/26DctgyPcjhA3ybzAc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3867BF8016A; Mon, 15 May 2023 15:20:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 918F5F8025A;
	Mon, 15 May 2023 15:20:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DF24F80272; Mon, 15 May 2023 15:20:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5143FF8016D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 15:20:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5143FF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cuqw52C5
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bcae898b2so22567806a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 15 May 2023 06:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684156804; x=1686748804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BsO/pqq6pHh8swXKYO4dDKBfdrzUB5clS17CPd685rE=;
        b=cuqw52C5rpcXbOGzrmkE4xmmnK5Jt5fPaZCflXVDw88vJSBl6wQt9VwE0IZZvrp+PW
         sV33lHjOwyknAlH7ZAy8lZqy+7gi2VHrGEs+ClBw84ZPB9pT1+BDJg1m1lIe1/ixI3ys
         ev9U9MbOUnPIhN4nM9d3MiY+MaAC0yGQiq5Go85NmazLlZgVv4+FS6vkAMDNUyXV2+uo
         D2Nq2wOaWhjGaDF5R4fETrw+pNg1jVn+GCeInxb6uF7T+PDL4QGJO6SrbA46HwhlFE6+
         RNaHazm0m/Bjx259Nomk0c2aHY2v2ECmE5dy91H9cDm3L7fD5E7zT3/RdoBeqVdCHR8O
         8jvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684156804; x=1686748804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsO/pqq6pHh8swXKYO4dDKBfdrzUB5clS17CPd685rE=;
        b=ZzwcSZhZdVmhNFqY0kXKAF6ehlh1dL+y/xoPYLyusAUzSgzT+J+rBd30S7ThJhIvcK
         CdNZoTigjoUTmDh7uUMkTzbBVQgYosNaace5srB1o5zpX22xqA7pEeUDStYNkm52bvqs
         5tmepjGqmYu8Pi4icJa/qK/HS/dB1laiU58gMtE2Zv1xW/e63FntxYNWdzeLTYRpD/IS
         XJOJZR2wLN0GhAvFu1rAzdM9zIuQChU+ZUaiVR0JgmBVWbJBe80ZMWPZfsUVrM5LvCVB
         PUpyIHgTxiPaiCIemZOTSfTzWpgwepTMyYWHWMQpDPfFKBLmaVsgGS/YHLlBGjuqj+bW
         hm/A==
X-Gm-Message-State: AC+VfDy8IRhiAiTYk9P6xQbWSSjI7VwoAQi+3THVBB1UuMjSChkug+mO
	ZzzkUmLkyiSjjhtopIu2Jg7spg==
X-Google-Smtp-Source: 
 ACHHUZ5Y4XCmYDhtgTBiXMPECGlCjtaIhndzpaVgj4RRqFlSCnphrHUtnoB3PmaDLPOST75piELJtQ==
X-Received: by 2002:a17:907:ea6:b0:96a:4325:2593 with SMTP id
 ho38-20020a1709070ea600b0096a43252593mr15083216ejc.42.1684156803836;
        Mon, 15 May 2023 06:20:03 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id
 bz6-20020a1709070aa600b0094eeda0df09sm9598421ejc.179.2023.05.15.06.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 06:20:03 -0700 (PDT)
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
Subject: [RESEND PATCH] soundwire: qcom: drop unused struct qcom_swrm_ctrl
 members
Date: Mon, 15 May 2023 15:20:00 +0200
Message-Id: <20230515132000.399745-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GWPBIQTHNTWQNYZRHB7MCQGLGBEDYWFY
X-Message-ID-Hash: GWPBIQTHNTWQNYZRHB7MCQGLGBEDYWFY
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GWPBIQTHNTWQNYZRHB7MCQGLGBEDYWFY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Drop unused members from the driver state container: struct qcom_swrm_ctrl.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/qcom.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index aad5942e5980..ab1098ec56e6 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -187,12 +187,9 @@ struct qcom_swrm_ctrl {
 #endif
 	struct completion broadcast;
 	struct completion enumeration;
-	struct work_struct slave_work;
 	/* Port alloc/free lock */
 	struct mutex port_lock;
 	struct clk *hclk;
-	u8 wr_cmd_id;
-	u8 rd_cmd_id;
 	int irq;
 	unsigned int version;
 	int wake_irq;
-- 
2.34.1

