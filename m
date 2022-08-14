Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DD8591FC5
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Aug 2022 14:39:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EC3B844;
	Sun, 14 Aug 2022 14:38:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EC3B844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660480771;
	bh=tbju1U6eK/Pt3ML3lhFcbSLpJ1c5VcoBZR635ELDbgs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c1Y67xW70i5S1vYr7KwH4JcSyC44Ytqf9kOuKpewNssaSBpvurlcWr6PzmMGhjJxj
	 6X+/k7+m0rbCVlvF04DasFhU0Ijq5aVgvmcfoepcn+S9SqZeBZbx1CGfHW5twVqjDA
	 Vvq2lznXdGN/Nds7TlejtQjZoCpFnDzg44rpTwuI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E1F3F800B8;
	Sun, 14 Aug 2022 14:38:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AB8DF804BD; Sun, 14 Aug 2022 14:38:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3944CF800B8
 for <alsa-devel@alsa-project.org>; Sun, 14 Aug 2022 14:38:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3944CF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DrA9rHep"
Received: by mail-wr1-x435.google.com with SMTP id bs25so6209051wrb.2
 for <alsa-devel@alsa-project.org>; Sun, 14 Aug 2022 05:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=9zy3SJGst0p2iFndy5+K6/kB/FEo/jr0yhvZCmdYRAw=;
 b=DrA9rHepa7ynsd+KY9vkIiAGHJ5w1N0PNC52z/p7tYaPP92NysNCmEeyiCnTqibVM2
 OppOeRUvuiZYTWJL5dVD6EUwFYQ6jJ9q3kYR2TW1rAed9zJM20uQNYd2P2Z/9fYPqIRy
 DLOEUPzUUcGbE2u64WSB9z9gzJ7I3RFE8XsoOhvaAgFbYIadNlhF4SJuG3+0j7jdGRL3
 vz3PLIXLskqcUN+KfYrsApyohENtnxVGarS5qrhDwBgpR9PHgkVpBvReWfr7DZghaD+c
 mM194025QwnLMusGUso64dUQN25g0sWjhTHVKpMBs3S3ldyVaIVnUeqJrF4CezhW2oXk
 plCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=9zy3SJGst0p2iFndy5+K6/kB/FEo/jr0yhvZCmdYRAw=;
 b=DcQkpjTFUoC/D7jhj2jboRtEgvswzRZdZSXya1JslFQoP9cuBWQK7OnigsuTDJDD/j
 nBr+T7okDYZ3pR58tx2lg7emaSuAu5JqbxZcQ3iWog1o0Ub7ElqbwkjPpvWzErTh+RTr
 /i63wmYsXouWPf9ZDpn+dlqz3vNX6fPp2qWTSmtPzbZLw5AzRGj3TFT8WoNieL3OBojA
 i/9kasCr0BWLLM3n2KdtOiNDBIXEKV8zzIudljoqDR4CkBoFL38n+VNCBGVawtpfQ8QB
 phW3d7I3rAG24n9zkJytwqAnADS7IQPGqAChpNq9jnxY9UlZwlLBWwwWlptq+2HLTGLy
 8Alg==
X-Gm-Message-State: ACgBeo0+VnN2RGS/sFYzihpDORLDGGjPDSrQDDb244BhaNjOm8rtKYl8
 /HvxY9ZICje7D1QEooziHoxeyJwMMizCpg==
X-Google-Smtp-Source: AA6agR68F9J2UmzuL1lxnUjOXspEPk7NbC3RogjH8ZV5rUJnFbNxvBRtvtxvD7DnhBT7d/bSItOdQA==
X-Received: by 2002:a05:6000:381:b0:221:7542:61bb with SMTP id
 u1-20020a056000038100b00221754261bbmr6212369wrf.305.1660480702193; 
 Sun, 14 Aug 2022 05:38:22 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a5d48ce000000b0021d76a1b0e3sm4520681wrs.6.2022.08.14.05.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 05:38:21 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: amit.pundir@linaro.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: qcom: remove duplicate reset control get
Date: Sun, 14 Aug 2022 13:38:00 +0100
Message-Id: <20220814123800.31200-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

Looks like adding clock gate flag patch forgot to remove the old code that
gets reset control.

This causes below crash on platforms that do not need reset.

[   15.653501]  reset_control_reset+0x124/0x170
[   15.653508]  qcom_swrm_init+0x50/0x1a0
[   15.653514]  qcom_swrm_probe+0x320/0x668
[   15.653519]  platform_probe+0x68/0xe0
[   15.653529]  really_probe+0xbc/0x2a8
[   15.653535]  __driver_probe_device+0x7c/0xe8
[   15.653541]  driver_probe_device+0x40/0x110
[   15.653547]  __device_attach_driver+0x98/0xd0
[   15.653553]  bus_for_each_drv+0x68/0xd0
[   15.653559]  __device_attach+0xf4/0x188
[   15.653565]  device_initial_probe+0x14/0x20

Fix this by removing old code.

Reported-by: Amit Pundir <amit.pundir@linaro.org>
Fixes: 1fd0d85affe4 ("soundwire: qcom: Add flag for software clock gating check")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 9df970eeca45..a43961ad4614 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1356,10 +1356,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	ctrl->bus.compute_params = &qcom_swrm_compute_params;
 	ctrl->bus.clk_stop_timeout = 300;
 
-	ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
-	if (IS_ERR(ctrl->audio_cgcr))
-		dev_err(dev, "Failed to get audio_cgcr reset required for soundwire-v1.6.0\n");
-
 	ret = qcom_swrm_get_port_config(ctrl);
 	if (ret)
 		goto err_clk;
-- 
2.21.0

