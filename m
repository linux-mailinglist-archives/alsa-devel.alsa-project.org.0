Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 181AF2617F9
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 19:46:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2656616CF;
	Tue,  8 Sep 2020 19:45:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2656616CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599587187;
	bh=oMOr26uWSy9dGLSxS9du+ndnoEpG5cy0ET6Np2QatTw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O31w8qqj4EFA0zjokPn9w7KRaZ2pN2vuqkvrHz2K/KbpQBdHzrwTRLd4MnELxx7qc
	 jjTm2l+lcDN10vb6PZgbrP95FBCKdoUo1EU8COYcnakHZqgCCiO7THpJ9nyhWcZ1TN
	 66RJkERtCKj/pNSLZFYi0qSh3RzsdqkDChX/YHwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A74FF80272;
	Tue,  8 Sep 2020 19:44:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C12DF802DC; Tue,  8 Sep 2020 19:44:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from a27-188.smtp-out.us-west-2.amazonses.com
 (a27-188.smtp-out.us-west-2.amazonses.com [54.240.27.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AF61F80264
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 19:44:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AF61F80264
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="OkIYfWv4"; 
 dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com
 header.b="hBp54wj4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599587074;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
 bh=oMOr26uWSy9dGLSxS9du+ndnoEpG5cy0ET6Np2QatTw=;
 b=OkIYfWv4GZgB1vJ3XLFyKTf49mp8X4bDPIGQLtDR/v5JeZ2xWxwDDiXhlpYa6OxW
 QAqMjYDXxk+DrHj/GWnW49YjXgdlc8X2OwedXD+L/IfqUeqpN3kzI27lO8s288sLVsr
 bNcEpH/Jp8ZqworcJI88W8zSoh3z7tMXExttdTaQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599587074;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
 bh=oMOr26uWSy9dGLSxS9du+ndnoEpG5cy0ET6Np2QatTw=;
 b=hBp54wj4HVzxnRPAPCyLB+p1HwioZfi106NNklyz4XJJGbRaHgoY5rAXun2gclAy
 4gyuRt20CiRyzCc+Ll2rZMK1xaTEu4UR7Qupgg7PGwW6hAQbsFjmObx+OxkbP/oOGGd
 KbhncufOSyBrWljbEXEx+pGeZzFXuS/yzX2wIRj0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 855D6C433F0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] ASoC: Add sc7180-lpass binding header hdmi define
Date: Tue, 8 Sep 2020 17:44:33 +0000
Message-ID: <010101746ed1bf72-ad195366-db7d-4d6f-af62-e2cc149f4bef-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599587037-6742-1-git-send-email-srivasam@codeaurora.org>
References: <1599587037-6742-1-git-send-email-srivasam@codeaurora.org>
X-SES-Outgoing: 2020.09.08-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 Srinivasa Rao <srivasam@codeaurora.org>
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

From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

Add header defining hdmi dai-id for SC7180 lpass soc
in dt bindings.

Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
---
 include/dt-bindings/sound/sc7180-lpass.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/sound/sc7180-lpass.h b/include/dt-bindings/sound/sc7180-lpass.h
index 7d988f6..0b4991e 100644
--- a/include/dt-bindings/sound/sc7180-lpass.h
+++ b/include/dt-bindings/sound/sc7180-lpass.h
@@ -4,6 +4,7 @@
 
 #define MI2S_PRIMARY	0
 #define MI2S_SECONDARY	1
+#define HDMI	2
 
 #define LPASS_MCLK0	0
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

