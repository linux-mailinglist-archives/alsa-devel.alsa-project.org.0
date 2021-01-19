Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BBB2FBD51
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 18:17:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B85CA18B8;
	Tue, 19 Jan 2021 18:16:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B85CA18B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611076651;
	bh=VaQkFQ9f9Tkm4Q1Np0klnxLn+VKai7OwS3loKTZqaPw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mh2f4hkHzBCCN3sHclru9CQwItsFtw1uZeFgQRWEZVI6TY3lSY8lpi5Yz4rc1a9PY
	 E7NC4P8udI+oJS73ZIPp/7yJleTFzdIzla4omxg/xU0Ms3RRM/trPmIXl0vEvMpbQF
	 tARlCfmP+HUmduTV87GPvy51O0/3/fq5gnfO5Mcg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78338F8027D;
	Tue, 19 Jan 2021 18:15:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22C13F8029B; Tue, 19 Jan 2021 18:15:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0EBDF800FE
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 18:15:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0EBDF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="aeEZH0A8"
Received: by mail-wr1-x429.google.com with SMTP id c5so20484521wrp.6
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 09:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rt6odInkctgi1LaT0EnE3drEnzTVT16y5lMMJQ5HPFQ=;
 b=aeEZH0A8v1XaWIokY7slQm5xOeTMhJH/x6bk0fWNrLFCaZqnUUQwxnb14pOvoFllab
 kiQCUjQTCRFmoTrmWDSYkXydgLqjCGqg5U3cAOojw9uhOrbn7+yIkERTl4oUock5dg2Z
 8o/l5yF4uDdTOmktFdGURYVjXW/RK06mr0fREaVgmGUkDQzFyQz0d2ctRAg5ERxXvVBy
 QCHvf1po4KBfwUYjSVVX5oj+oqR27RV4QYWg6pjh//miIpROJkEuM83/D3vcC5CekUlG
 wH1X5S5cqJ5A5nzuNFTC3ufijmDYY1zloN0qA2pX6k0dOsG+y81YMRen20fD/34+LtHM
 kO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rt6odInkctgi1LaT0EnE3drEnzTVT16y5lMMJQ5HPFQ=;
 b=IBY49MBRtR8UKeAo6cAbHdUBE+Ahjs1sggA+yDsQGZz+YB6NIFOUAT59TYpydjmpox
 a6FOUiFmsmJEoptcHC5ytqicCT8tMwipHu0yOteTBgp3pFXz1rrsBncffZGPe8YRuQqe
 gdqdIHG8OcFULPjLnjuXL23FYCZYgnM0SP9KX6/cyJ4GoiS12KDzoSYd7x4yXsAQqBO/
 SIAutAZu3sLJK2HPtC3SBvEd8vZBH64tx5Sft/niDsMSy8x5+qAzA1wPUneMsUCHf+Bt
 9ih5gTNcXQR1F/XecIS/Y2J14Oz4xqCX6Bg8f7oyRdHO9thVQvaxrHC1W5Fra47nhkRe
 Qx4g==
X-Gm-Message-State: AOAM530Lyp1DH7Jt+FX6BMgmapIA3rf52j9P8mbe1DHc54p7L9HqjZK5
 L6ZqAoSGCbfgGoOkfqBi92WnJQ==
X-Google-Smtp-Source: ABdhPJyh4nQo1IQXOWca3gVjJeetHott5bg2lpND6mXC57YfUDt0wVnOIJ7AVaFxtBh0Ai2D+DCgUQ==
X-Received: by 2002:a5d:4ece:: with SMTP id s14mr5288315wrv.427.1611076539246; 
 Tue, 19 Jan 2021 09:15:39 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id x18sm41649358wrg.55.2021.01.19.09.15.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:15:38 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 1/2] ASoC: dt-bindings: lpass: Fix and common up lpass dai
 ids
Date: Tue, 19 Jan 2021 17:15:26 +0000
Message-Id: <20210119171527.32145-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210119171527.32145-1-srinivas.kandagatla@linaro.org>
References: <20210119171527.32145-1-srinivas.kandagatla@linaro.org>
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
Tested-by: Srinivasa Rao <srivasam@codeaurora.org>
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

