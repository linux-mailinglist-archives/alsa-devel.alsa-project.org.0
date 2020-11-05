Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE622A7D70
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 12:46:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7696168B;
	Thu,  5 Nov 2020 12:45:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7696168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604576781;
	bh=I1CCGESUGBaNFr1k4TJ+OLvO1EtGcyzH/f3XeAaZII0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tc0ZqA1Bsy8nEjtFLZJdSBH0wTLOXAPPfR/ERRTL1UW2a9yVaMGg/qK2gIumX1JYi
	 vsfgW24pM2FjNgFmdJN8TOATcBXeHVi4XE5tfFEsk0EKPrPVkkndGp0dfbuTOI8t9F
	 rY7/spIiYgLLRtV0j4a17e+m1jZkY7bSmGFPtVDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87C14F800BA;
	Thu,  5 Nov 2020 12:44:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 238F6F80171; Thu,  5 Nov 2020 12:44:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83853F800BA
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 12:44:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83853F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Vy1NOyfw"
Received: by mail-wr1-x443.google.com with SMTP id n18so1385250wrs.5
 for <alsa-devel@alsa-project.org>; Thu, 05 Nov 2020 03:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dQI+xeoeMjnqFAD8EMXTyLrlsY/8A0KdRklJEpXUEeA=;
 b=Vy1NOyfwf55IVp/CkDPtAtkZi1Nvuaf75YpQTY1on9PWT/7ZFz2G1BPRwWzGKZJw1F
 /3PXxgHk8MR5K2JMJ1+UbuL2uD174grE992YBSjIjEqyZLrWarMiX098HEySoalGfM0Q
 L9UggjR1i5ETMfYNjXuOpBuzTwkRxUG5WPXASr5ZVViQk3WDJVy2DvDA/TFrOV3zcOuq
 LGlDZ1lDeTD0+27HE3T5IGCLK1JHEUuZmtm0u9PBP3cpAA3rFOVO3/uzaD4uAo0YFfxH
 9cdAcHhiKardjxcTLOkAyzvGjSTNYi7C0yX5BUivRlSfgvOU3FkkWN4p9uy7YDPvEE6T
 aIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dQI+xeoeMjnqFAD8EMXTyLrlsY/8A0KdRklJEpXUEeA=;
 b=is2AFKhXvVb4SHi3IYr/28mJtxmbhNx4Xkz7bnF1R8B5Bmw/7ZDlJDVtCBNA6ZaIpL
 zqYyNG7Q254G8LASAWII2XFYH2xxm2BDCKeIuWkSQ9/TQ6zhj7RSOagWH9vEZygPnlop
 Z+aCXA5vsgy6PqCMukIn8+eQ4nqiykQB5jW6X0Xk+/BAVW8GuIEiZ6POGuBvLJpA4LHz
 pHgVj8KxRKFNFwfykYb5p+rziyb/T5PtCndDKQOpDC3ePTMCnRCNpH4FriMmyWhMgNVM
 2YeP/ixgb5GN131C7ohb9ZM11fMfSONcqUzK8UulttBJNGkhD12JzZMqpzpZRt7kmdxu
 bXpw==
X-Gm-Message-State: AOAM530G9vApnTpR9QTcpktwh5djRpY6sF8VLERHyvPBYz8C5Nt26nC/
 puQ/ItldSsBkyY8QOgWdTZWRzQ==
X-Google-Smtp-Source: ABdhPJxs8JnizH47p+OY/DC8h4ITaUWYYNCnLNzcg81MnA9t4I+UOt53fcynmrE6Ua6x328YXdeZVg==
X-Received: by 2002:a05:6000:1084:: with SMTP id
 y4mr2297571wrw.138.1604576678220; 
 Thu, 05 Nov 2020 03:44:38 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id n17sm1944845wrw.69.2020.11.05.03.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 03:44:37 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: q6afe-clocks: fix warning on symbol scope
Date: Thu,  5 Nov 2020 11:44:35 +0000
Message-Id: <20201105114435.22860-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org
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

This patch fixes below warning when module is compiled with W=1 C=1

sound/soc/qcom/qdsp6/q6afe-clocks.c:122:18: warning: symbol 'q6afe_clks'
was not declared. Should it be static?

Fixes: 520a1c396d196 ("ASoC: q6afe-clocks: add q6afe clock controller")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6afe-clocks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe-clocks.c b/sound/soc/qcom/qdsp6/q6afe-clocks.c
index 2efc2eaa0424..87e4633afe2c 100644
--- a/sound/soc/qcom/qdsp6/q6afe-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6afe-clocks.c
@@ -119,7 +119,7 @@ static const struct clk_ops clk_vote_q6afe_ops = {
 	.unprepare	= clk_unvote_q6afe_block,
 };
 
-struct q6afe_clk *q6afe_clks[Q6AFE_MAX_CLK_ID] = {
+static struct q6afe_clk *q6afe_clks[Q6AFE_MAX_CLK_ID] = {
 	[LPASS_CLK_ID_PRI_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_MI2S_IBIT),
 	[LPASS_CLK_ID_PRI_MI2S_EBIT] = Q6AFE_CLK(LPASS_CLK_ID_PRI_MI2S_EBIT),
 	[LPASS_CLK_ID_SEC_MI2S_IBIT] = Q6AFE_CLK(LPASS_CLK_ID_SEC_MI2S_IBIT),
-- 
2.21.0

