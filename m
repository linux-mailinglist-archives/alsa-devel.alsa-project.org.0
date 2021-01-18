Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C402FA6A2
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 17:47:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74DD41854;
	Mon, 18 Jan 2021 17:47:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74DD41854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610988471;
	bh=udNTEq+9RaLO6Krb+vwhz0SFEhKOgzoSBF0JmqrYI30=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ncr48UwfXBZ7trAsvkAMnbvNlbsDcRAXaBDznoHjgFMFbZkwM/QD/f+e8nYxAe/sq
	 x+9E/4NJ9Qs0x9zFKlqLnsRw5DMvLXWWfnipNFZQsIg066FWqc2DQiRna+fKjT2ZpE
	 HKYbSCQ7TpHyjF2lqcycfJkomAhdPdPvRyDPvLlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2DE6F8026B;
	Mon, 18 Jan 2021 17:46:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5708CF80227; Mon, 18 Jan 2021 17:46:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 080ADF800E7
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 17:45:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 080ADF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mD8ac/Z1"
Received: by mail-wm1-x329.google.com with SMTP id i63so14173393wma.4
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 08:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wmLLpMDcTzwTcd2iwuJ9vR2klJWBqD/Av6l36UeAzc4=;
 b=mD8ac/Z14v/F5QeuA8FYENQhQZBL8Yb+HDQHeGSMn0ue88NLQjz9nMy/PK0NrIP4yt
 XSG4GOLhqbeiBj3TYt2igDfM3BWsVl//EVY/ECWuql4DJpjHUDJyhQHv4aHeJBoeKfgp
 aJiU7ck06hGKOTHbT+Kc0eWKtORRNGWmrDWjybsGcSLS9/Kq1XOzPMmLqs7OHuC76JTh
 AJyuAP52n6vCggQ9oUcDInyRv2Ts0JvO4cxoFPFq1Bb4soKe27iBsSdM20my8AbCjoNM
 n5SrN4OMEQ9kslyKD6R3N+zhxhlQOFwau/81py3YAs9anBz+6Ckw/ggCRHhvbhUA8dIf
 YmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wmLLpMDcTzwTcd2iwuJ9vR2klJWBqD/Av6l36UeAzc4=;
 b=QrMo+az8gBxEL3AYum0w6q+KeIlyZsy7pGYSJoUco5AhvzYopa/4MpI4pTHryZvih0
 tuzkuCoP7SaVOth/a1/eSxGipKbJEagM9kPbuCrriesdd182Uj+5W/Sef+GUtaumdIQG
 c/QBwK1/jSWUQsbk14j6eUGg+qk93MbimGSKs8idZChquVT4g5C1ENNrS8+zfpv7TnpB
 3vGfmC/ZPZmzqc1g7me289zR9DgEAbHFofRCKO6RMTEnF7fSp7o6N75tAMzbZjgfiAmM
 EshML+FxpXwO7oWQcwZ5VeeWnmdrryn2NMSa4cpyzZww35hYnFx+2zlRDDn/pzTdqjyK
 vDHQ==
X-Gm-Message-State: AOAM53202tubIfbp6clJPK6/N0A3FZ0AsYB2LQHR3YdFMrTHQuK0LbCH
 BJgzs3kisD+g3RjoaDXyFqjHpg==
X-Google-Smtp-Source: ABdhPJy/688Fpx644RezfHexEtpdEdlqVwgrCqMgmEIv9bxeoPHv0y23wuD/mHbGUNmnYgzAx4Lqdg==
X-Received: by 2002:a05:600c:4e87:: with SMTP id
 f7mr206177wmq.163.1610988357192; 
 Mon, 18 Jan 2021 08:45:57 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id t25sm21247218wmj.39.2021.01.18.08.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 08:45:56 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: lpass: Fix and common up lpass dai ids
Date: Mon, 18 Jan 2021 16:45:08 +0000
Message-Id: <20210118164509.32307-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210118164509.32307-1-srinivas.kandagatla@linaro.org>
References: <20210118164509.32307-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 srivasam@codeaurora.org, stephan@gerhold.net, lgirdwood@gmail.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Jun Nie <jun.nie@linaro.org>
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

Existing header file design of having separate SoC specific header files
for the common lpass driver has mutiple issues.
This design is prone to break as an when new SoC header is added
as the common DAI ids of other SoCs will be overwritten by the
new ones.

One of them surfaced by recent patch that adds support to sc7180, this
one totally broke LPASS drivers on other Qualcomm SoCs.

Before this gets worst, fix this by having a common header qcom,lpass.h.
This should fix the issue and any new DAI ids should be added to the
common header. This will be more sustainable then the existing design!

Fixes: 12fbfc4cabec6595 ("ASoC: Add sc7180-lpass binding header hdmi define")
Reported-by: Jun Nie <jun.nie@linaro.org>
Reported-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 include/dt-bindings/sound/apq8016-lpass.h |  7 +++----
 include/dt-bindings/sound/qcom,lpass.h    | 15 +++++++++++++++
 include/dt-bindings/sound/sc7180-lpass.h  |  6 ++----
 3 files changed, 20 insertions(+), 8 deletions(-)
 create mode 100644 include/dt-bindings/sound/qcom,lpass.h

diff --git a/include/dt-bindings/sound/apq8016-lpass.h b/include/dt-bindings/sound/apq8016-lpass.h
index 3c3e16c0aadb..dc605c4bc224 100644
--- a/include/dt-bindings/sound/apq8016-lpass.h
+++ b/include/dt-bindings/sound/apq8016-lpass.h
@@ -2,9 +2,8 @@
 #ifndef __DT_APQ8016_LPASS_H
 #define __DT_APQ8016_LPASS_H
 
-#define MI2S_PRIMARY	0
-#define MI2S_SECONDARY	1
-#define MI2S_TERTIARY	2
-#define MI2S_QUATERNARY	3
+#include <dt-bindings/sound/qcom,lpass.h>
+
+/* NOTE: Use qcom,lpass.h to define any AIF ID's for LPASS */
 
 #endif /* __DT_APQ8016_LPASS_H */
diff --git a/include/dt-bindings/sound/qcom,lpass.h b/include/dt-bindings/sound/qcom,lpass.h
new file mode 100644
index 000000000000..7b0b80b38699
--- /dev/null
+++ b/include/dt-bindings/sound/qcom,lpass.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __DT_QCOM_LPASS_H
+#define __DT_QCOM_LPASS_H
+
+#define MI2S_PRIMARY	0
+#define MI2S_SECONDARY	1
+#define MI2S_TERTIARY	2
+#define MI2S_QUATERNARY	3
+#define MI2S_QUINARY	4
+
+#define LPASS_DP_RX	5
+
+#define LPASS_MCLK0	0
+
+#endif /* __DT_QCOM_LPASS_H */
diff --git a/include/dt-bindings/sound/sc7180-lpass.h b/include/dt-bindings/sound/sc7180-lpass.h
index 56ecaafd2dc6..5c1ee8b36b19 100644
--- a/include/dt-bindings/sound/sc7180-lpass.h
+++ b/include/dt-bindings/sound/sc7180-lpass.h
@@ -2,10 +2,8 @@
 #ifndef __DT_SC7180_LPASS_H
 #define __DT_SC7180_LPASS_H
 
-#define MI2S_PRIMARY	0
-#define MI2S_SECONDARY	1
-#define LPASS_DP_RX	2
+#include <dt-bindings/sound/qcom,lpass.h>
 
-#define LPASS_MCLK0	0
+/* NOTE: Use qcom,lpass.h to define any AIF ID's for LPASS */
 
 #endif /* __DT_APQ8016_LPASS_H */
-- 
2.21.0

