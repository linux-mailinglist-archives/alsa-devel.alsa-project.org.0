Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E95E6909AB
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 14:16:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9D1AE7C;
	Thu,  9 Feb 2023 14:15:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9D1AE7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675948570;
	bh=uSRxXerqS4Brn1LW4cMOJhEMzgI8uc0+nr5PziKZ94I=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Nstggo9eTcbTWsaet40vmeg4jdVOtknfYisBSvaXaOrnRM06kECR1LDAhp+4Mmyls
	 GPHA0V4kflX1TUA2pANLzTWhEayLC/hocCMEgbnQhChY3YNa8ilLC3C/l+hSasnBet
	 uDGlAnyefE6AOCrcUXeirTHxePiviBX+9dejAh8g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB373F80549;
	Thu,  9 Feb 2023 14:14:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B05BF80551; Thu,  9 Feb 2023 14:14:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C102F8021D
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 14:13:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C102F8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ULYJnwqN
Received: by mail-wm1-x335.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so1499296wms.1
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 05:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPXVzG5o2X54MLB3ZyDSI4pawnltFzWU5Saextq817o=;
        b=ULYJnwqNMeRiea9IJdFP6yvfpxaRwkju4sp2HMcBIO6UHM0rdl40OPLuvrjmSSH4OQ
         fpScO6nXREnk/uZlVm+PA0saUgUMEmCFnW5NCC9kCeEAOKtmcNsrx7ogiJ6TB335qgHA
         CldrEYHwLgk7qatZ91j1dre1BD6oBWD0L9U/KbLV3gEdL58WEI6i5db+AgDPJOe6pxVK
         rQQoGLiXpE/k3cYKnVBMHn4E9BWxgeSkl1ny+vpFIAqEa6Vsypkb77sMWf551sHbIURF
         KB0pIBFLrVjTUtsMuN76ljfwuGHip+Xb5xVwWvy+MARzu1zprHOqFyTiW2V25COrRGcI
         +Ugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPXVzG5o2X54MLB3ZyDSI4pawnltFzWU5Saextq817o=;
        b=VYncHIFANVnlvgR8dsX1tek6eoodRE2CcQtN8qpcKVHtIWAPyrXN7wXRn5s8JWJSGt
         LNFiE6LaslhmCDAuQWiomZwgV572AA94rA87jpd2NwJjN2e9SKF77TfL+lt6A7BJCSsk
         OZuhkRVlhsmlbQLM6FHcwRU90dszBlyk/Lxr0S1oTxX1LC3Qpul1ck6LSjPeYsADK8Ce
         +fGSFGhBDy1oFHSBlSCKg/3PnN8zEMzjh8TQ5d3XLx8S+IRaFZ84bS/XtRoUwUVYsmo/
         oF6LhIPbl9yRkRgHWao6L/yW2NMjlJ3EqJHopy4DexsjuUFbkHPEgwlxxL6cA/LnSUAr
         HihQ==
X-Gm-Message-State: AO0yUKVRViUTTzrmvLkJpR1CnLfN8ucL8MKLmJ6v344I8QjpIh+AsaMx
	enbJ8PPItQoT3OjtDbNG6WaPnQ==
X-Google-Smtp-Source: 
 AK7set9KVelqkabFmlPe2AeCDVnSLTivPIjdspWLcsVhNmF8H4NdG9Vd9VAvODpDmSKyXrZx8cstZw==
X-Received: by 2002:a05:600c:a293:b0:3dc:59e9:9285 with SMTP id
 hu19-20020a05600ca29300b003dc59e99285mr11100382wmb.18.1675948429591;
        Thu, 09 Feb 2023 05:13:49 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ja13-20020a05600c556d00b003dc4b4dea31sm1789394wmb.27.2023.02.09.05.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 05:13:48 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH 2/5] soundwire: qcom: enable runtime pm before controller is
 registered
Date: Thu,  9 Feb 2023 13:13:33 +0000
Message-Id: <20230209131336.18252-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20230209131336.18252-1-srinivas.kandagatla@linaro.org>
References: <20230209131336.18252-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HGBWVEXUSZQO3XLZ55T74FKZFXGSENIM
X-Message-ID-Hash: HGBWVEXUSZQO3XLZ55T74FKZFXGSENIM
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, steev@kali.org,
 johan+linaro@kernel.org, quic_bjorande@quicinc.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HGBWVEXUSZQO3XLZ55T74FKZFXGSENIM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Registering controller even before pm runtime is enabled will result
in pm runtime underflow warnings. Fix this by properly moving
the runtime pm enable before registering controller.

Fixes: 74e79da9fd46 ("soundwire: qcom: add runtime pm support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 9d8ae77bad0a..b2363839624c 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1417,6 +1417,12 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		}
 	}
 
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+
 	ret = sdw_bus_master_add(&ctrl->bus, dev, dev->fwnode);
 	if (ret) {
 		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
@@ -1435,12 +1441,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 		 (ctrl->version >> 24) & 0xff, (ctrl->version >> 16) & 0xff,
 		 ctrl->version & 0xffff);
 
-	pm_runtime_set_autosuspend_delay(dev, 3000);
-	pm_runtime_use_autosuspend(dev);
-	pm_runtime_mark_last_busy(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
-
 	/* Clk stop is not supported on WSA Soundwire masters */
 	if (ctrl->version <= 0x01030000) {
 		ctrl->clock_stop_not_supported = true;
-- 
2.21.0

