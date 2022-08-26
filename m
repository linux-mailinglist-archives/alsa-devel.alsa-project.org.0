Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D4F5A249A
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Aug 2022 11:38:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59AC41652;
	Fri, 26 Aug 2022 11:37:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59AC41652
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661506723;
	bh=Br/5vVPBw2ruPwNG08bZWgNX96yAa9xvWRPp2q9pP5A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qamRwyOj4J3Ukgt3MQA7TB3kFI0Q4sl18PAE2MLIYtqeIaK/DflLvjgqRXxR6azF+
	 QsY7voEFoC+dVm2RyWneYDtHJ4+KbDgg+pqX+FAniT4bWSYH1eEWtLy/P0YrrLhjJI
	 nT6aHAYwC2bjHqDmpDIWiof7jVq5RldJlquOHcMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06AD4F80105;
	Fri, 26 Aug 2022 11:37:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AA1FF80431; Fri, 26 Aug 2022 11:37:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D91FDF8014B
 for <alsa-devel@alsa-project.org>; Fri, 26 Aug 2022 11:37:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D91FDF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="W8+o0pPJ"
Received: by mail-lf1-x136.google.com with SMTP id q7so1280233lfu.5
 for <alsa-devel@alsa-project.org>; Fri, 26 Aug 2022 02:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Rtt6I8OWylHlnxQVoWRkuUmUkB38DHKDhrC1yMa3aN8=;
 b=W8+o0pPJmi+uAWge1iUcu/iV4O0ElsGBu8FBCkWteGM/sZqivBYxv58UBZz+fyRRSp
 HXPHviTq0ENypF6lrC71dVX2b8D9q+Ej6tjgkWNs7yGfdPPkXZrFkOk7BtFKKIQvDhxJ
 MMyDVrtYd6X23MzfCvmaE0nBqt0eoI4QiEgHnG/8PhR3l5FFUfa2lHIzZOWTkGwIF0WA
 doVam2Tn6I2HKMpoJ66nQtywK1rMhfN84A3Y+o2oG+2NSioCUQ/+P4C9BoFFdG1aVGwV
 dHmLqTaTzmNy7u/cWfnFQlV6BB5hmY0eFdHGS3x/obpBwmwoJGXbqOebCvFvN9/ibQCT
 ScSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Rtt6I8OWylHlnxQVoWRkuUmUkB38DHKDhrC1yMa3aN8=;
 b=rNB84+/IKysPqaMib5JwXyO22rXukJxT7w5VeMGUqqp90zzbLHQ6/RbYKD+z4qfuR4
 oJqy8Ie99UHNVwEJgx4Ut2b/+kCJMmV6GulebWEhe9du6AwGCNZeCC0aypglZWDYJoLG
 h4rAplSZfKKhvM/8NpGn7A3aJvv+fn9jVuONfRDD9VwXSOsE0YWCo/WA7Pue/fp7LCXw
 mK4DYQpFtPMkkxBRAmAp7iGastIRasYuXJxIrwDH2PAKmnApG3XFhdNbpPk/8iZSW4h7
 jAuhx7XdplnH9AcKyrKAQRdcYe3IfKbg3ClumNJxIcNo4EACveNo8ml9xVFcKK3sf6OE
 MMWA==
X-Gm-Message-State: ACgBeo3+oRYs5tp+XBh/NmenmA2o+fjkPN5usptc0LSUJs3nuICTfS0d
 QPZsB0huQYQ+4ijWQlH1cOfytUUaGlN3fHCz
X-Google-Smtp-Source: AA6agR7tdipdx6OYxvNpdG2tIX82dtvaUbyVs+VyV/UcfBX9DMk0QPV7We0gpWr/h4R/fpdtYRNDnw==
X-Received: by 2002:ac2:4e07:0:b0:492:d129:e019 with SMTP id
 e7-20020ac24e07000000b00492d129e019mr2471974lfr.350.1661506634894; 
 Fri, 26 Aug 2022 02:37:14 -0700 (PDT)
Received: from krzk-bin.starman.ee (82.131.98.15.cable.starman.ee.
 [82.131.98.15]) by smtp.gmail.com with ESMTPSA id
 y13-20020a2e828d000000b0025e4e7c016dsm400579ljg.16.2022.08.26.02.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 02:37:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] slimbus: qcom-ngd-ctrl: allow compile testing without
 QCOM_RPROC_COMMON
Date: Fri, 26 Aug 2022 12:37:11 +0300
Message-Id: <20220826093711.1059319-1-krzysztof.kozlowski@linaro.org>
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

The Qualcomm common remote-proc code (CONFIG_QCOM_RPROC_COMMON) has
necessary stubs, so it is not needed for compile testing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/slimbus/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/Kconfig b/drivers/slimbus/Kconfig
index 1235b7dc8496..2ed821f75816 100644
--- a/drivers/slimbus/Kconfig
+++ b/drivers/slimbus/Kconfig
@@ -22,7 +22,8 @@ config SLIM_QCOM_CTRL
 
 config SLIM_QCOM_NGD_CTRL
 	tristate "Qualcomm SLIMbus Satellite Non-Generic Device Component"
-	depends on HAS_IOMEM && DMA_ENGINE && NET && QCOM_RPROC_COMMON
+	depends on HAS_IOMEM && DMA_ENGINE && NET
+	depends on QCOM_RPROC_COMMON || COMPILE_TEST
 	depends on ARCH_QCOM || COMPILE_TEST
 	select QCOM_QMI_HELPERS
 	select QCOM_PDR_HELPERS
-- 
2.34.1

