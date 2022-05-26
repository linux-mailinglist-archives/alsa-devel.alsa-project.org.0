Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DFE5347D0
	for <lists+alsa-devel@lfdr.de>; Thu, 26 May 2022 03:07:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F186916B2;
	Thu, 26 May 2022 03:06:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F186916B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653527223;
	bh=lsIdVFoKBwdr8MmxGmwsOqXhHPeXiTrLGR8HhuCcFOw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bx3t+PCKdSqB+f+lvYSRAFmENhEAXgTegw4hK9mSWNlI01hnEi5VtyGzOCHA24T5/
	 W56Pa5z5vWuYC60dFm7KD+BY3UfSLvGB6xdUCBaKbl4purAIe8fBe/Ram59VQ3EjoZ
	 V/65ADpwIqo8vdYThy7jhWjyFpTH9FEx5OqjSqms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65B4CF801EC;
	Thu, 26 May 2022 03:06:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85F47F80169; Thu, 26 May 2022 03:06:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B070F80116
 for <alsa-devel@alsa-project.org>; Thu, 26 May 2022 03:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B070F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GmFwa5to"
Received: by mail-oi1-x22e.google.com with SMTP id r68so531712oie.12
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 18:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q6BIrUW7aokYWl+qRvM/xMt7zksnM8IWxexWiiS4vSs=;
 b=GmFwa5tozLv5xHUwBAL0dqqPoL4zpzeFGfTDDdqfncOEB9N0QPrkiTEOOpyeY5A83e
 nDc79M5ovmu08sVHkl86m+0PoTjqefMwbso4cqEABGsUg+VpLVpWCYJadS5N2YH7LoIC
 rdqMdQScN8mkJQaV9AlsYbaQ2iv1BmwdYoO4P3ArHFHcvgSBXk+Us16PezrZLT0vwBnQ
 0csfIrPWtebkx16PBWHnUPQs4Tlta5pZPwXnooSFknfsQ3uiB4JoDAwNIf7Mc+CV/xDq
 3GNJTmMIS2jM4VPpIDDVOiVTH3zkNULXmAettAOx+aGeYksZGgpLjTpEbW+PJPGY9WGQ
 c4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q6BIrUW7aokYWl+qRvM/xMt7zksnM8IWxexWiiS4vSs=;
 b=XTaNRPsGWl0ynSOO0xmd4zHrSKxRjJZ/Kl0SoBSsFCXV8cmlJR/3mvaFZNiuP8B8HW
 qaTL6Ahkizjpkytbj8w5hk6BfykDjy3dbdJehqgzCBD68lTHuZR6oUC8zfOUIdK7a42k
 aol2xlexpG6BB9M1QSbGLAndFkyzIZVlP2plVIaHZBOf1cKNyK8gD5851AqDWjMPUEuH
 t/qfrtTPmRNatf2xz21PzPU4Gd5KuqWWLRmQ0XOo8bQ6+Xjsz346QlQhWFupU1thR57B
 pe1KKIRlXD5i4Lflbm1Z2ezcU6JvwQGJ/0gqNU7BLIeIqiCdYIvg1ChVPOThazl/mbGe
 NOZg==
X-Gm-Message-State: AOAM53101OEYttLoG4s0DtHjAZpF/Orzz/miLoeSxBkh9EdUHZPRmeVg
 K76tWscyEFw4cpv5nYVQSKU=
X-Google-Smtp-Source: ABdhPJxkUHZaDkprlhtovHOJ67rjkL+BpfKx/2PFSlfCbAc8cwM7YPENiXEKErvaq4eTmYqj9uDR6Q==
X-Received: by 2002:a05:6808:130b:b0:326:d1ff:b56f with SMTP id
 y11-20020a056808130b00b00326d1ffb56fmr6790966oiv.222.1653527149873; 
 Wed, 25 May 2022 18:05:49 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:8e74:fc8e:b11f:9d42])
 by smtp.gmail.com with ESMTPSA id
 be27-20020a056808219b00b00325cda1ff87sm183205oib.6.2022.05.25.18.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 18:05:49 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: imx-audmux: Silence a clang warning
Date: Wed, 25 May 2022 22:05:43 -0300
Message-Id: <20220526010543.1164793-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: nathan@kernel.org, Fabio Estevam <festevam@gmail.com>,
 alsa-devel@alsa-project.org, shengjiu.wang@gmail.com,
 kernel test robot <lkp@intel.com>
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

Change the of_device_get_match_data() cast to (uintptr_t)
to silence the following clang warning:

sound/soc/fsl/imx-audmux.c:301:16: warning: cast to smaller integer type 'enum imx_audmux_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 6a8b8b582db1 ("ASoC: imx-audmux: Remove unused .id_table")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/imx-audmux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index dfa05d40b276..a8e5e0f57faf 100644
--- a/sound/soc/fsl/imx-audmux.c
+++ b/sound/soc/fsl/imx-audmux.c
@@ -298,7 +298,7 @@ static int imx_audmux_probe(struct platform_device *pdev)
 		audmux_clk = NULL;
 	}
 
-	audmux_type = (enum imx_audmux_type)of_device_get_match_data(&pdev->dev);
+	audmux_type = (uintptr_t)of_device_get_match_data(&pdev->dev);
 
 	switch (audmux_type) {
 	case IMX31_AUDMUX:
-- 
2.25.1

