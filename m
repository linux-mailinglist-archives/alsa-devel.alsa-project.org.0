Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3287515078
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 18:10:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 559C3204;
	Fri, 29 Apr 2022 18:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 559C3204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651248651;
	bh=M3YZXkmkPzaqqHX+AQb/KqCpXy52g3Pl2JwLXyfNdXg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RMjgR0j3aC+ZMfagam0Fwyo9amW8+XiygbQJ5ZDrP8CVbWPfMPeft3dCxUdJdHE1p
	 nXoqua6433Y+2tgTebGXzyKGy6fYSj5Vl6nXzquAe2pzv1Ol+qMZVSua9H/7IYgKep
	 5OtPmsVKuelFeg1mwSPfU8Bi9Zh5s5VfS/VxXDyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAB7EF80269;
	Fri, 29 Apr 2022 18:09:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB39DF8025D; Fri, 29 Apr 2022 18:09:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92685F8012B
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 18:09:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92685F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="hqE8BOyx"
Received: by mail-wr1-x435.google.com with SMTP id k2so11401343wrd.5
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 09:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JWMAn/Bn8ohxKs6BvOjyYpQ71mruJeatGTg+RHO7TDU=;
 b=hqE8BOyx/OO+QvPg/NFycXPm1WifkvLBScYG4S0tODof3BwXf9egD1HH+z/2HRa88h
 Wl7/0Mu5TyFJxNZvCEJOUAWZbSqhagKV5cXC1EPTltZOm4HOQfkYRJFYm+NO0elI/Kf6
 oRRHthAd3vSAuzSLhR2udVVEaxcYJsuu039DoQrrV9fVH8i+353v34sqg/cpDy+pHydX
 St2j+JlRt5iJfrZkM+stvUmzv5ZqTFhipJgLkOli6YzuyxEbZXQ+esnxPXD3n/jPxNmF
 C/pbaVSfPlAjSN6oCRYpyTD569PX15RVUkHolHBFAJbegJQC9NB6kcsLRyG+uWkFk+Ix
 JKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JWMAn/Bn8ohxKs6BvOjyYpQ71mruJeatGTg+RHO7TDU=;
 b=ok9YKqIavGbIUheVsA+6Q/NvGR/26YCiKonFwaNfpXyrjoVTay5cQdS+ggCp0cpUCv
 kxQiP+FIJqGPF8kH16tt2FDvacSN5mhpIkodnRDdTEDTFZkMn9Dh3tTaSIk+ThplpXTE
 OBcoKyC3e/T+mq57ujTmsWwigk+16qNU49j6g4QUnvBoUC00djV7t/pPDGRG+EstDXFc
 QAdjuM/paFXEn/JF8SNjBp4dkFHG8+aXcn3WHmSt0ghJBLISQtvEbZSPWBjFPMFUveqg
 6Ja28eIZM7uyBUrP+lFrLN55zJTH2ug1DxYTlOXVRTO5xrEyACsYKHylnMtm+jWEa3qj
 sHpA==
X-Gm-Message-State: AOAM5315/xTfrY8VoI7z0LSuQ2sU73IlsIKV+g6Ftl8i8dlhXPvFg3Km
 9uZ0emSArQvumkhS1o8zhlhPcw==
X-Google-Smtp-Source: ABdhPJzZ/2OiJVcoHnRZLspX+t/FHdW4FlaxULi9G0U+ixxQ6FdHjGbd2IzZrLvCjcTb7ZyapRlOgg==
X-Received: by 2002:a05:6000:1844:b0:20a:f429:f80c with SMTP id
 c4-20020a056000184400b0020af429f80cmr8474722wri.643.1651248582988; 
 Fri, 29 Apr 2022 09:09:42 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c220b00b00393ffde5f5fsm7827863wml.36.2022.04.29.09.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 09:09:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Subject: [PATCH] soundwire: qcom: adjust autoenumeration timeout
Date: Fri, 29 Apr 2022 17:09:28 +0100
Message-Id: <20220429160928.24614-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, bard.liao@intel.com,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Currently timeout for autoenumeration during probe and bus reset is set to
2 secs which is really a big value. This can have an adverse effect on
boot time if the slave device is not ready/reset.
This was the case with wcd938x which was not reset yet but we spent 2
secs waiting in the soundwire controller probe. Reduce this time to
1/10 of Hz which should be good enough time to finish autoenumeration
if any slaves are available on the bus.

Reported-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index da1ad7ebb1aa..432e5cb9a4d2 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -105,7 +105,7 @@
 
 #define SWRM_SPECIAL_CMD_ID	0xF
 #define MAX_FREQ_NUM		1
-#define TIMEOUT_MS		(2 * HZ)
+#define TIMEOUT_MS		(HZ/10)
 #define QCOM_SWRM_MAX_RD_LEN	0x1
 #define QCOM_SDW_MAX_PORTS	14
 #define DEFAULT_CLK_FREQ	9600000
-- 
2.21.0

