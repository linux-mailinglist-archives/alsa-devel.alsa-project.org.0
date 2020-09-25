Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9695278343
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 10:52:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55D501856;
	Fri, 25 Sep 2020 10:51:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55D501856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601023954;
	bh=JDhBOnAycCZXjDUM3eaWH+TNaauCj/8rN+ZIRnSx8Lg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fMw+xfuA0rkkYzvLduRYJIku8ccfblplpNd/W0k/HxNnrDU7tc+8kx7lHviLiEfDu
	 M7HSttN9EA9jEuWuyWTPUjg4Xpy0OZMGIOw7ceJebyxpJrrJBziG0cLQRPm/sulhzC
	 3R33gtwSv3MSBIv7Wh9i21WjDzX5/gmWJ8YkIQl8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0361FF802C4;
	Fri, 25 Sep 2020 10:50:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DDA3F801EC; Fri, 25 Sep 2020 10:49:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 074F4F80171
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 10:49:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 074F4F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="bv1LJ7nu"
Received: by mail-wr1-x442.google.com with SMTP id o5so2614801wrn.13
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 01:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fFObvGVxUiO7ZQOKSb6NTaW6nVN+3z3dJw0CyCNRlFw=;
 b=bv1LJ7nuM0SfITtrDoZwsRoR2XvivIc7Ncyo8pRv5SIT5j/0a2E5Z2H7g3n00TFWI8
 PU7zBulgKoH+VVNkhVMIF95G42dy4K2DAHxrWOteeIJfLAvWTEcszXZcjfCKd9EcMy4y
 zJOqUj8euAPyDN1vbBZZcRdz9f/r6A83y+mc4ZeOm/eF94OOi55InVZ69MXWpZLo50kY
 DAww8Z1KGtOEcnC0j8+jKyP0SS3DFtTdRvbbeKhx4/R/DxUwbQiPk4BytijOeV+2dqWD
 VSUhk0wk/tC3FFOQ31Thz0MhXM/KUOxfMPrycqrMHlEW9y8WpFTqDTjMocGoP44tMHT4
 MXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fFObvGVxUiO7ZQOKSb6NTaW6nVN+3z3dJw0CyCNRlFw=;
 b=da83t5MyPu4YBerNClaGZHA0PoA4umQQKCY+NHzmKQIBb2e1u2zMgDtcin5u4vYI6p
 d+qKugfVey6BJUmnMgZqClhi8xziBvLICur+Z+8zLWKkPUatpHjTBy6ymteDjypsQouI
 WWSLeijRFeHk3h9jzPClqjnmMnzixdOKCxHgpmRk8yMl62HjEEkHtouPwQFiTodwg3ls
 HIIpvhAhUQ/y48Up86wL2FPtsPz5ZwLZIqgxInivoBMfSk8YCqjrPaU0X7o1K159u5VV
 +pJB9B547ENuVpi81eiSRY/e1J0fJFfui1YNaJjIBOUmfRb/uuhBa1/p/lwruqfK6ZNM
 9etA==
X-Gm-Message-State: AOAM532GJK4aATUM/AqegJTXahQs3LKaIc3w+uQrsKFsEzJkavfGkxhC
 B+fS4SNv7sM6KH6sUmwvPaReJ5N9SgDQsg==
X-Google-Smtp-Source: ABdhPJxjOK6sUTocv5STTWTkchaKJQ0i+jcL5x/4vOJT76TjVE9/DpJ9ph6a42QoRnDBqC2D+pYn2A==
X-Received: by 2002:adf:f986:: with SMTP id f6mr3144816wrr.270.1601023775576; 
 Fri, 25 Sep 2020 01:49:35 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id u66sm2048623wme.12.2020.09.25.01.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 01:49:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/2] ASoC: qdsp6: Drop of_match_ptr to fix
 -Wunused-const-variable
Date: Fri, 25 Sep 2020 09:49:24 +0100
Message-Id: <20200925084925.26926-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200925084925.26926-1-srinivas.kandagatla@linaro.org>
References: <20200925084925.26926-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
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

The of_device_id is included unconditionally by of.h header and used
in the driver as well.  Remove of_match_ptr to fix W=1 compile test
warning with !CONFIG_OF:

sound/soc/qcom/qdsp6/q6afe-clocks.c:254:34: warning: unused variable
 'q6afe_clock_device_id' [-Wunused-const-variable]

Fix this warning for all qdsp6 drivers.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6adm.c        | 2 +-
 sound/soc/qcom/qdsp6/q6afe-clocks.c | 2 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c    | 2 +-
 sound/soc/qcom/qdsp6/q6afe.c        | 2 +-
 sound/soc/qcom/qdsp6/q6asm-dai.c    | 2 +-
 sound/soc/qcom/qdsp6/q6asm.c        | 2 +-
 sound/soc/qcom/qdsp6/q6core.c       | 2 +-
 sound/soc/qcom/qdsp6/q6routing.c    | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
index 2f3ea6beb066..23611db59d5e 100644
--- a/sound/soc/qcom/qdsp6/q6adm.c
+++ b/sound/soc/qcom/qdsp6/q6adm.c
@@ -623,7 +623,7 @@ static struct apr_driver qcom_q6adm_driver = {
 	.callback = q6adm_callback,
 	.driver = {
 		.name = "qcom-q6adm",
-		.of_match_table = of_match_ptr(q6adm_device_id),
+		.of_match_table = q6adm_device_id
 	},
 };
 
diff --git a/sound/soc/qcom/qdsp6/q6afe-clocks.c b/sound/soc/qcom/qdsp6/q6afe-clocks.c
index 2967f4546af5..e652a69869f9 100644
--- a/sound/soc/qcom/qdsp6/q6afe-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6afe-clocks.c
@@ -260,7 +260,7 @@ MODULE_DEVICE_TABLE(of, q6afe_clock_device_id);
 static struct platform_driver q6afe_clock_platform_driver = {
 	.driver = {
 		.name = "q6afe-clock",
-		.of_match_table = of_match_ptr(q6afe_clock_device_id),
+		.of_match_table = q6afe_clock_device_id
 	},
 	.probe = q6afe_clock_dev_probe,
 };
diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index d58b86a98114..ce39d97bbc13 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -1698,7 +1698,7 @@ MODULE_DEVICE_TABLE(of, q6afe_dai_device_id);
 static struct platform_driver q6afe_dai_platform_driver = {
 	.driver = {
 		.name = "q6afe-dai",
-		.of_match_table = of_match_ptr(q6afe_dai_device_id),
+		.of_match_table = q6afe_dai_device_id
 	},
 	.probe = q6afe_dai_dev_probe,
 };
diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 688878a002a4..bce4b2134c0a 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1762,7 +1762,7 @@ static struct apr_driver qcom_q6afe_driver = {
 	.callback = q6afe_callback,
 	.driver = {
 		.name = "qcom-q6afe",
-		.of_match_table = of_match_ptr(q6afe_device_id),
+		.of_match_table = q6afe_device_id,
 
 	},
 };
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index a1dd31f306ce..28f056c404bb 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -1343,7 +1343,7 @@ MODULE_DEVICE_TABLE(of, q6asm_dai_device_id);
 static struct platform_driver q6asm_dai_platform_driver = {
 	.driver = {
 		.name = "q6asm-dai",
-		.of_match_table = of_match_ptr(q6asm_dai_device_id),
+		.of_match_table = q6asm_dai_device_id,
 	},
 	.probe = q6asm_dai_probe,
 };
diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index d745a02fcd5f..34a6e894242e 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -1745,7 +1745,7 @@ static struct apr_driver qcom_q6asm_driver = {
 	.callback = q6asm_srvc_callback,
 	.driver = {
 		.name = "qcom-q6asm",
-		.of_match_table = of_match_ptr(q6asm_device_id),
+		.of_match_table = q6asm_device_id,
 	},
 };
 
diff --git a/sound/soc/qcom/qdsp6/q6core.c b/sound/soc/qcom/qdsp6/q6core.c
index ae314a652efe..99fe36447525 100644
--- a/sound/soc/qcom/qdsp6/q6core.c
+++ b/sound/soc/qcom/qdsp6/q6core.c
@@ -366,7 +366,7 @@ static struct apr_driver qcom_q6core_driver = {
 	.callback = q6core_callback,
 	.driver = {
 		.name = "qcom-q6core",
-		.of_match_table = of_match_ptr(q6core_device_id),
+		.of_match_table = q6core_device_id
 	},
 };
 
diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index b12539fae6ed..cc731c19a8ab 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -1152,7 +1152,7 @@ MODULE_DEVICE_TABLE(of, q6pcm_routing_device_id);
 static struct platform_driver q6pcm_routing_platform_driver = {
 	.driver = {
 		.name = "q6routing",
-		.of_match_table = of_match_ptr(q6pcm_routing_device_id),
+		.of_match_table = q6pcm_routing_device_id,
 	},
 	.probe = q6pcm_routing_probe,
 	.remove = q6pcm_routing_remove,
-- 
2.21.0

