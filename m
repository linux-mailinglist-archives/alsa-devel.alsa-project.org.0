Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C0760DF41
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 13:04:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C60193F29;
	Wed, 26 Oct 2022 13:03:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C60193F29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666782255;
	bh=WZ/mv9/cul011FPdYmLV3dexjutNJSe3ci8aBdF0vD8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KKKnl0vzTwtk3LxAF0GAAcX9nQXPeW6KgZes3shL5naKrYqVCtaxMFYaX6HH/5nBY
	 AnQtZjZ44Fa+FPFvhqaYw+yTV4Tjrh8NkE+Mbom14kjWgEDyW5SpcmgGMLKaWsCP95
	 tpvITDp7UovVyrH6CEjZRFmKo7donhHJUigB3Iyo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DE12F80559;
	Wed, 26 Oct 2022 13:02:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03358F80557; Wed, 26 Oct 2022 13:02:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55D64F80271
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 13:02:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55D64F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RWGT62z0"
Received: by mail-wm1-x329.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso1205083wma.1
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 04:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9qO/JbNRzACWJ+/BPqzyo1ybZ7r6Vd9pEOf9FoOyjmc=;
 b=RWGT62z0OrUByMt9GrSpD27EAROj86fo8TCkjjtRrXYNZ6HPIPQ5r5t5vpxfZQi0hd
 QoBX2qHvro7m4+uOucRRcVawjJZD8M+NXwqHESqMKuVmPmFN0EEJpFUOxhi1Tv0NCQvq
 5oSkrVszv1SKhJb5bc/UmpozOVeaCe01pKmr0hMCFKF5at8bs0Knx/L0vEg055RsahMi
 5wgwPKOvh22s18cE2oZvGjSg0h3z1hhDKNPe22z3CxTt/ntFrf2/3Q0Ltzl2YLpErooj
 3tdAEwQyKaSdYqfroQEnF+6gxG0O9YEFrAL35sjVpftNC6WinLATzAZHFZ5sNgad9J+r
 /Dcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9qO/JbNRzACWJ+/BPqzyo1ybZ7r6Vd9pEOf9FoOyjmc=;
 b=MPTyqUUM0Nh6hIpN2dwTpYPZZKSqMYZJ0StRYPv87ztWgQw99B2MwqL2c8APLz1J1F
 btGPfv5JZ2xabRP2DcAFOivG+DTxZYUVUhWwM5aT3KtqoNG3jqrQbm3tN+qBIgcaJ2YS
 Stps4+duzvw4pRztg9Eoi2k6wQ58eP09sbXYnkl9cD2GAhM203KjBE74LfiNVfD/0232
 H2SiA2W91Rl1AKU2Euw8pT+gaXsZHm1gUFlIHLsJlpS1d+tTVDvx0+xx4/FWwp6+d6M5
 LXckJsC2knpDueeHqOU8Gw7G/0jt3HPrQyqKpQ0v8ofJfOolJUoIU5azgzUeURdB79/p
 VTYQ==
X-Gm-Message-State: ACrzQf0/RAzNxlXIG0i95YyaRNwqjbXGf6HD0NfZEfT7aFec1EXD6g6G
 wmBnFVOkgADua9JV+rSCdMsHsQ==
X-Google-Smtp-Source: AMsMyM7mBIWMKyJj6QToByEpy/WDyizCwqeWxSIBwY9ABO0T5YGw9F9xu21lVTuRnTh2c2ivzL82Bg==
X-Received: by 2002:a7b:cc15:0:b0:3b4:ca90:970d with SMTP id
 f21-20020a7bcc15000000b003b4ca90970dmr2043088wmh.198.1666782147100; 
 Wed, 26 Oct 2022 04:02:27 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a5d44c7000000b0023672104c24sm5237415wrr.74.2022.10.26.04.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 04:02:26 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 4/6] soundwire: qcom: make reset optional for v1.6 controller
Date: Wed, 26 Oct 2022 12:02:08 +0100
Message-Id: <20221026110210.6575-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20221026110210.6575-1-srinivas.kandagatla@linaro.org>
References: <20221026110210.6575-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, srinivas.kandagatla@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, sanyog.r.kale@intel.com
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

On Some Qualcomm SOCs like sc8280xp which uses v1.6 soundwire controller
reset is not mandatory, so make this an optional one.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 7bc8cd0e906b..54d370f4b291 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1330,8 +1330,8 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	}
 
 	if (data->sw_clk_gate_required) {
-		ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
-		if (IS_ERR_OR_NULL(ctrl->audio_cgcr)) {
+		ctrl->audio_cgcr = devm_reset_control_get_optional_exclusive(dev, "swr_audio_cgcr");
+		if (IS_ERR(ctrl->audio_cgcr)) {
 			dev_err(dev, "Failed to get cgcr reset ctrl required for SW gating\n");
 			ret = PTR_ERR(ctrl->audio_cgcr);
 			goto err_init;
-- 
2.21.0

