Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FD0DBACC
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 02:26:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50D931612;
	Fri, 18 Oct 2019 02:25:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50D931612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571358407;
	bh=huLWHKCkYE8jjpaRCsz3HLp4CcnuGSjqVsEmGgh5kcA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eafsneCOVqmNcoEZVl4ZUMtZCHUlr9JeAgo5kecejzWZb2D0P3W4AP5U2CIeQ5alN
	 GM9IbXQzgYGMrtUFUKur2hpT+HFP3CTbrPMTAEI1TO002dIbKuW59GV36YCewqOJ8H
	 ZsV+AKBGGzPf9voHTgJfeutc4q+5Wm10a0DsHbeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F50FF80676;
	Fri, 18 Oct 2019 02:20:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C1A4F8063B; Fri, 18 Oct 2019 02:20:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 886FBF80600
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 02:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 886FBF80600
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="XEPefSy5"
Received: by mail-wm1-x341.google.com with SMTP id y135so8125070wmc.1
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 17:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NZWEuOshpiNrmyDr2BuiL5UEvx3WUO4xIJT4AKpVkTM=;
 b=XEPefSy5Ju8wuMJddkKTBWBWOpVaKin6k9vJK9Er3uza05kaPr8mVP8GHlwMzsTN3c
 51WAKd033YvZ0HyJqR2V3AaZnRtp4trh0qNtYdTSU4N1Y8TYcWl6Xh/gZVKCAMAUG7sD
 hOAeauv2RO/s/tAAvIjbBT2E1F/ZwDkN8zxmxsWNoP2/4mR3BVfGZatHXOhn7M6gAuvJ
 6SSYHGYzRdqpZj6tseXBBE0BWv2NJFym4VrpTf+zRd8ygQkA9hCfDMrpJlq6LfYZyjWm
 zzkFTmefkqk2y5mfclSa4fhGeEOlXS6sPn1bM84S7loWkLkxFK0nIAaJmg2t8gk8YFnv
 46rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NZWEuOshpiNrmyDr2BuiL5UEvx3WUO4xIJT4AKpVkTM=;
 b=OWUS6AigbvhaVEVhrSlDpq58pDGONZgQjuBbTbqExm2qLs9Nv14ECNPnPZeoNIvumT
 9dg1YMhnStVDrcuC9fZN6j8oHUb04jZL2k+q8XhsuKVElGl97xDGyA5M3/WCSDG5pQh5
 pR7t6FE4GtDtN6c87ybQ3k2J6Vf7lsovifJaIDd4Ra3i8sU5e+GuGesgf7ifBwmzxy8u
 LtC8aIV+K8CaSLkVCB8WCCtj7gYjUroNtmkBYeOK3xhpGXT3eiRwRl1El64y3s5AA8d6
 Qx02DfClZ3o7Seq7ITSRuoJSxIo3ATsWaiI5Xhk0zcS7X//FJc/x7uKiSKIyV+ZORuv9
 vTZw==
X-Gm-Message-State: APjAAAXU4GDkWT6LseVDCgchD/c0h/b05+s9n68XE9BvJsvrOKcNiuwY
 2XQDCzY5h6vC5FwmlfwzgcOoqg==
X-Google-Smtp-Source: APXvYqzCUxv1oQ4PtToSq0FPZjkkOcPpbUYYZIa9wsxT5Wo/p8ciGcsMINDkZInIGlSgDZFH46szBw==
X-Received: by 2002:a1c:7917:: with SMTP id l23mr4663874wme.60.1571358009564; 
 Thu, 17 Oct 2019 17:20:09 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id z189sm4851248wmc.25.2019.10.17.17.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 17:20:08 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh@kernel.org, broonie@kernel.org, linus.walleij@linaro.org,
 lee.jones@linaro.org
Date: Fri, 18 Oct 2019 01:18:48 +0100
Message-Id: <20191018001849.27205-11-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vinod.koul@linaro.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v2 10/11] ASoC: dt-bindings: Add compatible for
	DB845c and Lenovo Yoga
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds compatible strings for DB845c and Lenovo Yoga C630
soundcard. Based on this compatible strings common machine driver
will be in better position to setup board specific configuration.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,sdm845.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt b/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
index 408c4837e6d5..ca8c89e88bfa 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,sdm845.txt
@@ -5,7 +5,10 @@ This binding describes the SDM845 sound card, which uses qdsp for audio.
 - compatible:
 	Usage: required
 	Value type: <stringlist>
-	Definition: must be "qcom,sdm845-sndcard"
+	Definition: must be one of this
+			"qcom,sdm845-sndcard"
+			"qcom,db845c-sndcard"
+			"lenovo,yoga-c630-sndcard"
 
 - audio-routing:
 	Usage: Optional
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
