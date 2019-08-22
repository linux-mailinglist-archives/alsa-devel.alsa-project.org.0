Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A449A99014
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 11:59:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2097E15E2;
	Thu, 22 Aug 2019 11:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2097E15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566467962;
	bh=6DznUPe04OmaTZTcBuYs4HHySCDGDivB1Qkk0QFpCJI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kLqcMo95Aj19vb7QY626zc6iueji1E60vk+IqJ4AR/M4vzpg4+bHSCOi93M6l7DKv
	 JGgc6m+vCq4E6pBqmuGMO2/JL7mxDIUcYJ5A+WlqfrTKMRsEIEvn9eD5tpmyaAGavb
	 0a17AI+DSS4fydAjY3zJhLEuxUWuE7s6vnJQ3r5g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B224F80112;
	Thu, 22 Aug 2019 11:57:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B01FAF803D5; Thu, 22 Aug 2019 11:57:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77F81F800BF
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 11:57:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77F81F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="JQLfaIFK"
Received: by mail-wm1-x333.google.com with SMTP id c5so4903156wmb.5
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 02:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kR3iAupDN1p7AjL90yYqFge/scd5U0HZbTAOmwv5vBY=;
 b=JQLfaIFK06F559EY6AH4ccrGgpz6GGzGoQebhRGkIa13tsCeTEuWwdL0tbtoVGoCah
 HuRdMzA4S3bME4wvTEqQzDYCAL6h9XBHOTaGKvhyrpIfxEh2rOl29K+Tyyqn2EUVwvxr
 ZfT5FrZ4NkWFE/PUKUrxUpq+uEuCjTczZeMWekq8M1MPZpEsdf4dDat2wZeP9FLj6fYa
 QFl/r3Asq+T0t8ue0DGxZt929HTapzab6u5tPd/VEUTrnJoXlburPfFAoAzOJroBQ6QM
 xr/m3yeIJInIpv0lozKqNlsWsWSQkrnFN3N424XyCRwfk0HtASRLqQZpLgAf8ocrLHqd
 9CzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kR3iAupDN1p7AjL90yYqFge/scd5U0HZbTAOmwv5vBY=;
 b=Xe8SbHzDHdMBOCgUR2zEBoVLr4C9qnuJJ4mSktCs+oBvkquigj195ix0rcc6przxvl
 DVLdj1iRifkbFwyBrgUWYWGnDINiGrN/eRmR//mnAZSqyVweRT9gcJhVSfr7JrX2ySOO
 jVPS318cXN8vn/COp2YNP01Y6VSGA1KS8QjDgmLhO3TMBVNtfT+8sWMq06qfjxvrUTfK
 XxulhoRVOk/59c66dhXwf8u/cfKMl3HHGH66yWCSnsRv4v4is3d8nrYh9L7wLzPL1T1q
 MJ9+/ZO2HHfkh2KLXxMRcY3eUPlsP+Uhd1llER+D149ZiuLYtv8FPebg02kMWr+FCSfM
 yzkg==
X-Gm-Message-State: APjAAAUl27xFISB4edN00YZtUafmvRs8IqeFrscHU/l1e4dumvijhtnt
 kZi8dvsn5CNwmXdoc3dDa4yrxw==
X-Google-Smtp-Source: APXvYqwk25RSa6y/DPXrHDkMQJCnorEmRKZ1BVgcYmt1o6XmCLCTzwjLVUHLtTPvHrdBZ8J4BmqVow==
X-Received: by 2002:a1c:7009:: with SMTP id l9mr5219091wmc.159.1566467848327; 
 Thu, 22 Aug 2019 02:57:28 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id t24sm3298909wmj.14.2019.08.22.02.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 02:57:27 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	tiwai@suse.de
Date: Thu, 22 Aug 2019 10:56:49 +0100
Message-Id: <20190822095653.7200-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 spapothi@codeaurora.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, plai@codeaurora.org
Subject: [alsa-devel] [PATCH v2 0/4] ALSA: pcm: add support for 352.8KHz and
	384KHz sample rate
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

This patchset adds missing support to 352.8KHz and 384KHz sample rates in
Qualcomm WCD9335 codec and QDSP dais.

First patch adds these new rates to known list of rates in pcm core and
also adds defines in pcm.h so that drivers can use it.

Changes since v1:
 - Added wcd and qdsp users of these new rates.

Srinivas Kandagatla (3):
  ASoC: wcd9335: Fix primary interpolator max rate
  ASoC: qdsp6: q6afe-dai: Update max rate for slim and tdm dais
  ASoC: qdsp6: q6asm-dai: fix max rates on q6asm dais

Vidyakumar Athota (1):
  ALSA: pcm: add support for 352.8KHz and 384KHz sample rate

 include/sound/pcm.h              |  5 ++
 sound/core/pcm_native.c          |  2 +-
 sound/soc/codecs/wcd9335.c       | 20 ++++---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 92 +++++++++++---------------------
 sound/soc/qcom/qdsp6/q6asm-dai.c | 18 +++----
 5 files changed, 59 insertions(+), 78 deletions(-)

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
