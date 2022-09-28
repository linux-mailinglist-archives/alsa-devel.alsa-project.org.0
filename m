Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0D15EDD9B
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Sep 2022 15:21:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCA5FAE9;
	Wed, 28 Sep 2022 15:21:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCA5FAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664371314;
	bh=UGR0LGg53YSGOMtItyRfB8RIY89sgWRod5rb0peO2WU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N5qpTLHR3VNjIN6KU3obrsLfPXirKILZND5JgtpegrBerPIX1W477NdQ32/1wFZGq
	 ykSOMBCLhwAa8I07gMYSQCf1bY1fz2WqIOD3OHVjesfQMr6pi9u75/zCNXouvWqzRz
	 g3bETcD0eHRyiuCkNLLrjPj2Rc0cK+MNvPFi731g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69FD7F804EC;
	Wed, 28 Sep 2022 15:20:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EE12F800AA; Wed, 28 Sep 2022 15:20:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D794F80272
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 15:20:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D794F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rVkVuZcZ"
Received: by mail-lf1-x133.google.com with SMTP id s6so20312176lfo.7
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 06:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=RRNTzceZaqHDiT7tFNItA9BVbwZc1ms7T50MCemBqpU=;
 b=rVkVuZcZqaqAfme+jh1CDACtX+SwjXoV0UESeIDb/J0HFkb+9oXE7cUVeFcBaHH0Te
 6SwOKSUy0wEFq5dcEWyhMTV+e5KEjWnhA+td+2kJhcVq5gRYVtEtcgT04Fn+3TpbN4Zy
 bV42wGyJ31F/XiPJMuT74R1Q7BSb7FEcUHvPI5zrv1759dlvQ5bzIDb/oGmd0HQv2BZR
 yGLGAoKB4d1Xhz+zClWSd6vfgrFUzFEu0vMflGAFxtHtWc7g9LXdF081rrKk+WLUFqOQ
 gXKuymnh4lLO4r4ZJ0O0zKeX8f/M66/6URraNrbJA7e8ark0hpe733WKUK6vCHoysy4r
 R1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=RRNTzceZaqHDiT7tFNItA9BVbwZc1ms7T50MCemBqpU=;
 b=8FXhdeEUJ5PlL2TPeFIoRKnRbwX4jKOh631iqbcR1yaEs734OUO11QjUyfFUSLO+DB
 DQxcDIIIn9HhYA9u1PoV+PEU/ZPP0gD+hA40Xv7ZXFQDslD3ykNMkPw70fjxh5BTvdP0
 xEV+MldzrvGDpWbS4l/njbCZlXMyXLm8uD6QhuNlkFfMOZVzvv0MNVk7JxmBi8qxeBYf
 JSqft2GVFEiYc5zmEARpptuuQhFU94QcCoEzVYdQOaKMJwS9nkAUmjFYk4NqaRDeB7by
 iEtkSUVbyJwFAJp/QHNiRyCYayJ+1nVbQMSMqHYLPsPJ1THOEv1ceEQQ44fLS455A4GU
 CjUw==
X-Gm-Message-State: ACrzQf2cBKff1dX+XFjEtPyub9Fj/zMHCuMmdpM6Rx/9E6KgLCeOCXMA
 twbdvlr5teruymKRBLqmErV4/A==
X-Google-Smtp-Source: AMsMyM7AaHNbIOeJKncxN0eTy/GThqjSlw30ZOShYas28fF/AtZNvH2FVKtnPvrEx45dIben3y+maQ==
X-Received: by 2002:ac2:54a4:0:b0:498:f55c:7fc0 with SMTP id
 w4-20020ac254a4000000b00498f55c7fc0mr12420848lfk.420.1664371219806; 
 Wed, 28 Sep 2022 06:20:19 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 p11-20020ac246cb000000b00497ad9ae486sm478484lfo.62.2022.09.28.06.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 06:20:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] slimbus: qcom-ngd-ctrl: check for device runtime PM
 status during ISR
Date: Wed, 28 Sep 2022 15:20:10 +0200
Message-Id: <20220928132011.455347-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
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

Slimbus core interrupt is getting fired after suspend. At this point
ADSP slimbus hardware is off with gated clocks which is leading to an
unclocked access when HLOS slimbus tried to read the interrupt
status register in the ISR.

Co-developed-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index cec11aa106bf..ba36eb5c0de3 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -763,7 +763,14 @@ static irqreturn_t qcom_slim_ngd_interrupt(int irq, void *d)
 {
 	struct qcom_slim_ngd_ctrl *ctrl = d;
 	void __iomem *base = ctrl->ngd->base;
-	u32 stat = readl(base + NGD_INT_STAT);
+	u32 stat;
+
+	if (pm_runtime_suspended(ctrl->ctrl.dev)) {
+		dev_warn_once(ctrl->dev, "Interrupt received while suspended\n");
+		return IRQ_NONE;
+	}
+
+	stat = readl(base + NGD_INT_STAT);
 
 	if ((stat & NGD_INT_MSG_BUF_CONTE) ||
 		(stat & NGD_INT_MSG_TX_INVAL) || (stat & NGD_INT_DEV_ERR) ||
-- 
2.34.1

