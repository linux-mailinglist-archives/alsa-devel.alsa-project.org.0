Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E89555113
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 18:15:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BA9B280E;
	Wed, 22 Jun 2022 18:14:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BA9B280E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655914537;
	bh=dn/2hzo3TNHYBvUgvE4jlxg/mCtXtJya6fQvu+v0bk8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lOeJRK9elgJMtaHRHlOyVygMTT1O4DTE+EFveqhWWmLB6fmhDgNSJbgY6I8GYK20/
	 w07lUa2q/CAsow1r4tiGESOCFSL14v11jbESjazKr1y+AfSOeLXKpghonqK0d76kDx
	 qAHn6d68mUiX9N6bIVrnVN/ds/9VduHW3ysmdrds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EAF2F80537;
	Wed, 22 Jun 2022 18:14:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69636F80536; Wed, 22 Jun 2022 18:14:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55CD5F8032D
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 18:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55CD5F8032D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hf8j8FP8"
Received: by mail-ed1-x529.google.com with SMTP id eo8so24654289edb.0
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 09:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BPDXlvqV0AxMWt136en9f/MZtZ2FaK26EatF9Qx87KM=;
 b=hf8j8FP8sSZV8bbnqKdDoJXLx/IEZmAA8Jaa7wqvMhUaHYLq7K36mR7xDrLaIUE+BJ
 adS6FpovfS8Ut0BA2qx0T0HI3g1rm6mib96GmJhyBkC2DgWLEOzzM3GDt2xI7Xo68lcp
 hMDIQ2wFarYLSsxe6KPVqoYxSUfP3HiTrfUAissQ1JRwIgKnWtIJfGklxJcmY9mYujWI
 ruGjt7mQKz7apoj5WXYGzb37tWtqr6bwdQW0GYFk3OL2RAoIYXxbJvXZZwxTL1Q3G/Qu
 bvfVvlQrmh2Aj0mwLQTyP07oDZtWDyZuZpyxVM77ODlI6xx8IIeCDbgMGh/7FsxeZOKn
 wB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BPDXlvqV0AxMWt136en9f/MZtZ2FaK26EatF9Qx87KM=;
 b=4n1KJNQGTcmYGqJLNePl8uc5Kb699R4kehODnvEK+38dbtkb5qA4uc7TLishJjCRif
 AQqlMTVcJUxBF1ewP3rbV+AtM2FZKHHJA3xZfPubT/7qntD/TSyXJw81UA981fSZ8CZn
 eFyLacNBy45xHZVAzqZIsB2vxtjp87qz6cMK0ejkEhpA8t+AJ3EZx0UJYJ//vN8jF3ce
 vaSsKzuMUBj0WdXgRpkbfBgyBBjQygpPEp9BZzQfehWQ9gG9U5YCmFTUl9jTytZkEumr
 FuvUE95/2Ktg+SFr+NYRUggzNImS3K+zFCBHxMxyw52fk6aFLDl5EPQcchMAFuqATmLy
 9zdA==
X-Gm-Message-State: AJIora+mJGziQDLW48D4ynBPGfB29w6pnB+hHM1Vdf6OKMxv2+yc/nGr
 0XgFU7AsAsUAQQm3+D3ZKsY=
X-Google-Smtp-Source: AGRyM1s0xvuP9BhHEnaO03VpmTSeJV1TWPz57NVjo6q1R+NUICF3HXpZKVue8kGa+VHd1zFMVrmrhw==
X-Received: by 2002:a05:6402:28a2:b0:435:798e:2988 with SMTP id
 eg34-20020a05640228a200b00435798e2988mr4965039edb.217.1655914439781; 
 Wed, 22 Jun 2022 09:13:59 -0700 (PDT)
Received: from localhost.localdomain ([185.107.95.225])
 by smtp.gmail.com with ESMTPSA id
 sd14-20020a1709076e0e00b007072dc80e06sm9576036ejc.190.2022.06.22.09.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 09:13:59 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 2/3] ASoC: wcd9335: Use DT bindings instead of local DAI
 definitions
Date: Wed, 22 Jun 2022 20:13:21 +0400
Message-Id: <20220622161322.168017-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220622161322.168017-1-y.oudjana@protonmail.com>
References: <20220622161322.168017-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Yassine Oudjana <y.oudjana@protonmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yassine Oudjana <yassine.oudjana@gmail.com>, phone-devel@vger.kernel.org
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Get DAI indices from DT bindings and remove the currently used
local definitions.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd9335.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 7d40a61b03b0..3554b95462e8 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -24,6 +24,8 @@
 #include "wcd9335.h"
 #include "wcd-clsh-v2.h"
 
+#include <dt-bindings/sound/qcom,wcd9335.h>
+
 #define WCD9335_RATES_MASK (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
 			    SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000 |\
 			    SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000)
@@ -203,17 +205,6 @@ enum wcd9335_sido_voltage {
 	SIDO_VOLTAGE_NOMINAL_MV = 1100,
 };
 
-enum {
-	AIF1_PB = 0,
-	AIF1_CAP,
-	AIF2_PB,
-	AIF2_CAP,
-	AIF3_PB,
-	AIF3_CAP,
-	AIF4_PB,
-	NUM_CODEC_DAIS,
-};
-
 enum {
 	COMPANDER_1, /* HPH_L */
 	COMPANDER_2, /* HPH_R */
-- 
2.36.1

